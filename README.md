Inspects the produced assembly of `bump-scope` and similar bump allocators.

## Results

Last run was using: 

<!-- rust version start -->
```
rustc 1.91.0 (f8297e351 2025-10-28)
binary: rustc
commit-hash: f8297e351a40c1439a467bbbb6879088047f50b3
commit-date: 2025-10-28
host: x86_64-unknown-linux-gnu
release: 1.91.0
LLVM version: 21.1.2
```
<!-- rust version end -->

with 
- bump-scope <!-- bump-scope version start -->1.2.0<!-- bump-scope version end -->
- bumpalo <!-- bumpalo version start -->3.19.0<!-- bumpalo version end -->
- blink-alloc <!-- blink-alloc version start -->0.3.1<!-- blink-alloc version end -->

## Reproducing

Install 
- just <!-- just version start -->1.40.0<!-- just version end -->
- nushell <!-- nu version start -->0.106.1<!-- nu version end -->
- cargo-show-asm <!-- cargo-show-asm version start -->0.2.54<!-- cargo-show-asm version end -->

Run
```bash
just inspect-asm
```