inspect_asm::deallocate::bumpalo:
	mov rax, qword ptr [rdi + 16]
	mov rdx, qword ptr [rax + 32]
	cmp rdx, rsi
	je .LBB0_0
	ret
.LBB0_0:
	add rdx, rcx
	mov qword ptr [rax + 32], rdx
	ret
