inspect_asm::alloc_str::try_bumpalo_a:
	push r14
	push rbx
	push rax
	mov rbx, rdx
	cmp rdx, -4
	ja .LBB0_2
	mov rax, qword ptr [rdi + 16]
	mov r14, qword ptr [rax + 32]
	lea rcx, [rbx + 3]
	and rcx, -4
	mov rdx, r14
	sub rdx, qword ptr [rax]
	cmp rcx, rdx
	ja .LBB0_2
	sub r14, rcx
	mov qword ptr [rax + 32], r14
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
