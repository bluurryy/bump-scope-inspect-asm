inspect_asm::alloc_u32_slice::try_bumpalo:
	push r15
	push r14
	push rbx
	mov rbx, rdx
	lea rdx, [4*rdx]
	mov rax, qword ptr [rdi + 16]
	mov r14, qword ptr [rax + 32]
	and r14, -4
	mov rcx, r14
	sub rcx, qword ptr [rax]
	jb .LBB0_2
	cmp rdx, rcx
	ja .LBB0_2
	sub r14, rdx
	mov qword ptr [rax + 32], r14
	je .LBB0_2
.LBB0_0:
	mov rdi, r14
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_1:
	mov rax, r14
	mov rdx, rbx
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_2:
	mov r15, rsi
	mov esi, 4
	mov r14, rdx
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rdx, r14
	mov rsi, r15
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	xor r14d, r14d
	jmp .LBB0_1
