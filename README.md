Last run was using: 

<!-- rust version start -->
```
rustc 1.88.0 (6b00bc388 2025-06-23)
binary: rustc
commit-hash: 6b00bc3880198600130e1cf62b8f8a93494488cc
commit-date: 2025-06-23
host: x86_64-unknown-linux-gnu
release: 1.88.0
LLVM version: 20.1.5
```
<!-- rust version end -->

## Reproducing

Install 
* **just** —  <!-- just version start -->1.40.0<!-- just version end -->
* **nushell** —  <!-- nu version start -->0.105.1<!-- nu version end -->
* **cargo-show-asm** —  <!-- cargo-show-asm version start -->0.2.43<!-- cargo-show-asm version end -->

Run
```bash
just inspect-asm
```