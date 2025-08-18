Last run was using: 

<!-- rust version start -->
```
rustc 1.89.0 (29483883e 2025-08-04)
binary: rustc
commit-hash: 29483883eed69d5fb4db01964cdf2af4d86e9cb2
commit-date: 2025-08-04
host: x86_64-unknown-linux-gnu
release: 1.89.0
LLVM version: 20.1.7
```
<!-- rust version end -->

## Reproducing

Install 
* **just** <!-- just version start -->1.40.0<!-- just version end -->
* **nushell** <!-- nu version start -->0.106.1<!-- nu version end -->
* **cargo-show-asm** <!-- cargo-show-asm version start -->0.2.43<!-- cargo-show-asm version end -->

Run
```bash
just inspect-asm
```