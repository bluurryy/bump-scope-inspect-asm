inspect_asm::alloc_str::try_bumpalo:
	push r14
	push rbx
	push rax
	mov rbx, rdx
	mov rax, qword ptr [rdi + 16]
	mov r14, qword ptr [rax + 32]
	mov rcx, r14
	sub rcx, qword ptr [rax]
	cmp rdx, rcx
	ja .LBB0_2
	sub r14, rbx
	mov qword ptr [rax + 32], r14
	je .LBB0_2
.LBB0_0:
	mov rdi, r14
	mov rdx, rbx
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_1:
	mov rax, r14
	mov rdx, rbx
	add rsp, 8
	pop rbx
	pop r14
	ret
.LBB0_2:
	mov r14, rsi
	mov esi, 1
	mov rdx, rbx
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rsi, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	xor r14d, r14d
	jmp .LBB0_1
