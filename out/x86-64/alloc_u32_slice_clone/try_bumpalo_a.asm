inspect_asm::alloc_u32_slice_clone::try_bumpalo_a:
	push r15
	push r14
	push rbx
	lea r14, [4*rdx]
	mov rax, qword ptr [rdi + 16]
	mov rbx, qword ptr [rax + 32]
	mov rcx, rbx
	sub rcx, qword ptr [rax]
	cmp r14, rcx
	ja .LBB0_2
	sub rbx, r14
	mov qword ptr [rax + 32], rbx
.LBB0_0:
	test rdx, rdx
	je .LBB0_1
	mov rdi, rbx
	mov r15, rdx
	mov rdx, r14
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rdx, r15
.LBB0_1:
	mov rax, rbx
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_2:
	mov rbx, rsi
	mov esi, 4
	mov r15, rdx
	mov rdx, r14
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rsi, rbx
	mov rdx, r15
	mov rbx, rax
	test rax, rax
	jne .LBB0_0
	xor ebx, ebx
	jmp .LBB0_1
