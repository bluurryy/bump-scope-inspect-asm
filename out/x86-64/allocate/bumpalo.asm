inspect_asm::allocate::bumpalo:
	mov rcx, qword ptr [rdi + 16]
	mov r8, qword ptr [rcx + 32]
	cmp rdx, r8
	ja .LBB0_0
	sub r8, rdx
	mov rax, rsi
	neg rax
	and rax, r8
	cmp rax, qword ptr [rcx]
	jb .LBB0_0
	mov qword ptr [rcx + 32], rax
	test rax, rax
	je .LBB0_0
	ret
.LBB0_0:
	push rbx
	mov rbx, rdx
	call qword ptr [rip + bumpalo::Bump::alloc_layout_slow@GOTPCREL]
	mov rdx, rbx
	pop rbx
	ret
