Inspects the produced assembly of `bump-scope` and similar bump allocators.

## Results

Last run was using: 

<!-- rust version start -->
```
rustc 1.101.0-nightly (32dba69d6 2026-10-09)
binary: rustc
commit-hash: 32dba69d69c5b10ea89a4042de8d0619f7756203
commit-date: 2026-10-09
host: x86_64-unknown-linux-gnu
release: 1.101.0-nightly
LLVM version: 23.1.3
```
<!-- rust version end -->

with 
- bump-scope <!-- bump-scope version start -->3.0.0-dev<!-- bump-scope version end -->
- bumpalo <!-- bumpalo version start -->3.20.3<!-- bumpalo version end -->
- blink-alloc <!-- blink-alloc version start -->0.4.0<!-- blink-alloc version end -->

## Reproducing

Install 
- just <!-- just version start -->1.59.0<!-- just version end -->
- nushell <!-- nu version start -->0.116.1<!-- nu version end -->
- cargo-show-asm <!-- cargo-show-asm version start -->0.2.63<!-- cargo-show-asm version end -->

Run
```bash
just inspect-asm
```