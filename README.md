Inspects the produced assembly of `bump-scope` and similar bump allocators.

## Results

Last run was using: 

<!-- rust version start -->
```
rustc 1.94.1 (e408947bf 2026-03-25)
binary: rustc
commit-hash: e408947bfd200af42db322daf0fadfe7e26d3bd1
commit-date: 2026-03-25
host: x86_64-unknown-linux-gnu
release: 1.94.1
LLVM version: 21.1.8
```
<!-- rust version end -->

with 
- bump-scope <!-- bump-scope version start -->2.3.1<!-- bump-scope version end -->
- bumpalo <!-- bumpalo version start -->3.20.3<!-- bumpalo version end -->
- blink-alloc <!-- blink-alloc version start -->0.4.0<!-- blink-alloc version end -->

## Reproducing

Install 
- just <!-- just version start -->1.52.0<!-- just version end -->
- nushell <!-- nu version start -->0.113.1<!-- nu version end -->
- cargo-show-asm <!-- cargo-show-asm version start -->0.2.61<!-- cargo-show-asm version end -->

Run
```bash
just inspect-asm
```