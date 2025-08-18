inspect_asm::deallocate::down:
	mov rax, qword ptr [rdi]
	cmp rsi, qword ptr [rax]
	je .LBB0_0
	ret
.LBB0_0:
	add rcx, rsi
	mov qword ptr [rax], rcx
	ret
