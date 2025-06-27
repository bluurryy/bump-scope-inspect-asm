default:
  @just --list

@inspect-asm *args:
  nu inspect-asm.nu x86-64 {{args}} --target-cpu x86-64

@inspect-wasm:
  nu inspect-asm.nu wasm32 --wasm