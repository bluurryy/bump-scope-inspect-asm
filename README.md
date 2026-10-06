Inspects the produced assembly of `bump-scope` and similar bump allocators.

## Results

Last run was using: 

<!-- rust version start -->
```
rustc 1.99.0 (b940084d7 2026-09-28)
binary: rustc
commit-hash: b940084d7eb6a299eb4bfeb8e34901bc051e7ac4
commit-date: 2026-09-28
host: x86_64-unknown-linux-gnu
release: 1.99.0
LLVM version: 23.1.1
```
<!-- rust version end -->

with 
- bump-scope <!-- bump-scope version start -->2.4.0<!-- bump-scope version end -->
- bumpalo <!-- bumpalo version start -->3.20.3<!-- bumpalo version end -->
- blink-alloc <!-- blink-alloc version start -->0.4.0<!-- blink-alloc version end -->

## Reproducing

Install 
- just <!-- just version start -->1.58.0<!-- just version end -->
- nushell <!-- nu version start -->0.116.0<!-- nu version end -->
- cargo-show-asm <!-- cargo-show-asm version start -->0.2.62<!-- cargo-show-asm version end -->

Run
```bash
just inspect-asm
```