let MARKER_UNDERSCORE = "XXXXX"
let MARKER_DOT = "YYYYY"

def table-into-record [key_column: cell-path, value_column: cell-path]: table -> record {
    reduce --fold {} { |it, acc| $acc | upsert ($it | get $key_column) ($it | get $value_column) }
}

def try-update [field: string, replacement:any] { 
    let table = $in

    if $field not-in ($table | columns) {
        return $table
    }

    $table | update $field $replacement
}

def map-to-index [] {
    uniq
    | enumerate
    | reduce --fold {} { |it, acc| $acc | upsert $"($it.item)" $it.index }
}

def parse-label-with-function-index [name: string] {
    let content = $in

    $content
    | parse --regex ($name + '(?<f>[0-9]+)_(?<i>[0-9]+)')
    | group-by --to-table f? 
    | try-update items { get i | map-to-index } 
    | table-into-record f items
}

def replace-label-with-function-index [function_map, map, prefix: string] {
    mut content = $in

    for $old in ($map | transpose function indices) {
        let old_function = $old.function
        let new_function = $function_map | get $old_function | into string

        for $item in ($old.indices | transpose old_index new_index) {
            let old_index = $item.old_index
            let new_index = $item.new_index | into string
            let old_re = '\.' + $prefix + $old_function + "_" + $old_index + '\b'
            let new_re = "." + $prefix + $new_function + $MARKER_UNDERSCORE + $new_index
            $content = ($content | str replace -a --regex $old_re $new_re)
        }
    }

    $content
}

def replace-anons [] {
    mut content = $in

    let anons = $content | parse --regex '(?<full>\.Lanon\.(?:[a-z0-9]+)\.(?<i>[0-9]+))'
    let map_to_index = $anons | get i | map-to-index

    for anon in $anons {
        let i = $map_to_index | get $anon.i

        let old = $anon.full
        let new = $'.Lanon.facade.($i)' | str replace '.' $MARKER_DOT

        $content = ($content | str replace -a $old $new)
    }

    $content
}

def simplify [] {
    let content = $in

    let lbbs = $content | parse-label-with-function-index '(?m)^\.LBB'
    let ljtis = $content | parse-label-with-function-index '\.LJTI'
    let lcpis = $content | parse-label-with-function-index '\.LCPI'

    let function_map = [$lbbs, $ljtis, $lcpis]
    | columns
    | flatten
    | map-to-index

    return (
        $content
        | replace-label-with-function-index $function_map $lbbs "LBB"
        | replace-label-with-function-index $function_map $ljtis "LJTI"
        | replace-label-with-function-index $function_map $lcpis "LCPI"
        | replace-anons
        | str replace -a $MARKER_UNDERSCORE "_"
        | str replace -a $MARKER_DOT "."
    )
}

def report [file_name: string, symbol:string] {
    print -e $"($symbol) ($file_name)"
}

def asm-save [name: string, target: string, extra_args: list<string>] {
    let file_stem = ($name | str replace -a "::" "/")
    let file_name = $"($file_stem).asm"
    let file_path = ([out $target $file_name] | path join)
    let out_dir = ($file_path | path dirname)

    let result = do {
        ^cargo asm --simplify $name 0 ...$extra_args
    } | complete

    if $result.exit_code != 0 {
        if "You asked to display item #0 (zero based), but there's only 0 matching items" in $result.stdout {
        report $file_stem "?"
        mkdir $out_dir
        "" | save -f $file_path
        return
        }

        print -e $result.stderr
        print $result.stdout
        error make { msg: "cargo erred" }
    }

    let old_content = try { $file_path | open --raw } catch { "" }
    let new_content = ($result.stdout | simplify)

    if $new_content == $old_content {
        report $file_stem "="
        return
    }

    report $file_stem "!"
    mkdir $out_dir
    $new_content | save -f $file_path
}

def update-diffable [] {
    for $file in (ls out/x86-64/**/*.asm) {
        let old_content = $file.name | open --raw
        let new_content = $old_content | simplify

        let new_content = if ($new_content | str ends-with "\n") {
            $new_content
        } else {
            $new_content + "\n"
        }

        let new_content = $new_content | str replace -a 'L__unnamed__' "L__unnamed_"

        $new_content | save -f $file.name
    }
}

def replace-section [section_name: string, new_content: string]: string -> string {
    let readme = $in

    let start_marker = $"<!-- ($section_name) start -->"
    let end_marker = $"<!-- ($section_name) end -->"

    let start_index = ($readme | str index-of $start_marker) + ($start_marker | str length)
    let end_index = $readme | str index-of $end_marker --range $start_index..

    let before = $readme | str substring ..<$start_index
    let after = $readme | str substring $end_index..

    $before ++ $new_content ++ $after
}

let cargo_lock = open Cargo.lock | from toml

def package-version [name: string] {
    $cargo_lock | get package | where name == $name | get 0.version
}

def --wrapped main [
  target: string # Target directory under './out'.
  --filter: string # Only check functions whose path contains this string.
  --help (-h) # Display the help message for this command
  --update-diffable # Update the existing asm output with more diffable labels
  ...args # Arguments for `cargo asm` (cargo-show-asm)
]: nothing -> nothing {
    if $update_diffable {
        if $target != "x86-64" {
            error make { msg: "target not supported for `--update_diffable`" }
        }

        update-diffable
        return
    }

    mut names = []

    for name in [allocate, deallocate, grow, shrink] {
        $names ++= [$"($name)::up"]
        $names ++= [$"($name)::down"]
        $names ++= [$"($name)::bumpalo"]
        $names ++= [$"($name)::blink_alloc"]
    }

    for try in ["", try_] {
        $names ++= [$"alloc_layout::($try)up"]
        $names ++= [$"alloc_layout::($try)down"]
        $names ++= [$"alloc_layout::($try)bumpalo"]
        $names ++= [$"alloc_layout::($try)blink_alloc"]
    }

    for ty in [zst, u8, u32, vec3, 12_u32, big, str, u32_slice, u32_slice_clone] {
        for prefix in ["", try_] {
            $names ++= [$"alloc_($ty)::($prefix)up"]
            $names ++= [$"alloc_($ty)::($prefix)up_a"]
            $names ++= [$"alloc_($ty)::($prefix)down"]
            $names ++= [$"alloc_($ty)::($prefix)down_a"]
            $names ++= [$"alloc_($ty)::($prefix)bumpalo"]
            $names ++= [$"alloc_($ty)::($prefix)bumpalo_a"]
            $names ++= [$"alloc_($ty)::($prefix)blink_alloc"]
        }
    }

    for ty in [u32, big_ok] {
        for prefix in ["", try_] {
            $names ++= [$"alloc_try_($ty)::($prefix)up"]
            $names ++= [$"alloc_try_($ty)::($prefix)up_mut"]
            $names ++= [$"alloc_try_($ty)::($prefix)down"]
            $names ++= [$"alloc_try_($ty)::($prefix)down_mut"]
            $names ++= [$"alloc_try_($ty)::($prefix)bumpalo"]
        }
    }

    for dir in [up, down, down_big] {
        $names ++= [$"alloc_overaligned_but_size_matches::($dir)"]
    }

    # for prefix in ["", try_] {
    #     $names ++= $"alloc_with_drop::($prefix)up"
    #     $names ++= $"alloc_with_drop::($prefix)up_a"
    #     $names ++= $"alloc_with_drop::($prefix)down"
    #     $names ++= $"alloc_with_drop::($prefix)down_a"
    # }

    for ty in [u32] {
        for dir in [up, down] {
            for try in ["", try_] {
                $names ++= [$"bump_vec_($ty)::($dir)::($try)with_capacity"]
                $names ++= [$"bump_vec_($ty)::($dir)::($try)push"]
            }
        }
    }

    for ty in [u32, u32_bump_vec] {
        let prefixes = if $ty == "u32" {
            ["", exact_, mut_, mut_rev_]
        } else {
            ["", rev_]
        }

        let tries = if $ty == "u32" {
            ["", try_]
        } else {
            [""]
        }

        for try in $tries {
            for prefix in $prefixes {
                $names ++= [$"alloc_iter_($ty)::($try)($prefix)up"]
                $names ++= [$"alloc_iter_($ty)::($try)($prefix)up_a"]
                $names ++= [$"alloc_iter_($ty)::($try)($prefix)down"]
                $names ++= [$"alloc_iter_($ty)::($try)($prefix)down_a"]
            }
        }

        if $ty == "u32" {
            $names ++= [$"alloc_iter_($ty)::bumpalo"]
        }
    }

    for try in ["", try_] {
        for $mut in ["", mut_] {
            $names ++= [$"alloc_fmt::($try)($mut)up"]
            $names ++= [$"alloc_fmt::($try)($mut)up_a"]
            $names ++= [$"alloc_fmt::($try)($mut)down"]
            $names ++= [$"alloc_fmt::($try)($mut)down_a"]
        }
    }

    for try in ["", try_] {
        for which in [same, grow, shrink] {
            $names ++= [$"vec_map::($try)($which)"]
        }
    }

    if $filter != null {
        $names = ($names | where { str contains $filter })
    }

    for $name in $names {
        asm-save $name $target $args
    }

    
    open README.md
    | replace-section "rust version" $"\n```\n(rustc -vV)\n```\n"
    | replace-section "just version" (just --version | str replace just '' | str trim)
    | replace-section "nu version" (nu --version)
    | replace-section "cargo-show-asm version" (cargo asm --version | str replace "Version:" '' | str trim)
    | replace-section "bump-scope version" (package-version "bump-scope")
    | replace-section "bumpalo version" (package-version "bumpalo")
    | replace-section "blink-alloc version" (package-version "blink-alloc")
    | save -f README.md
}
