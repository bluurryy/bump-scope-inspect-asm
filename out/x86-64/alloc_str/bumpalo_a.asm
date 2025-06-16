inspect_asm::alloc_str::bumpalo_a:
	push r14
	push rbx
	push rax
	cmp rdx, -4
	ja .LBB0_1
	mov rax, qword ptr [rdi + 16]
	mov rbx, qword ptr [rax + 32]
	lea rcx, [rdx + 3]
	and rcx, -4
	mov r8, rbx
	sub r8, qword ptr [rax]
	cmp rcx, r8
	ja .LBB0_1
	sub rbx, rcx
	mov qword ptr [rax + 32], rbx
	je .LBB0_1
.LBB0_0:
	mov rdi, rbx
	mov r14, rdx
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rax, rbx
	mov rdx, r14
	add rsp, 8
	pop rbx
	pop r14
	ret
.LBB0_1:
	mov r14, rsi
	mov esi, 1
	mov rbx, rdx
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rsi, r14
	mov rdx, rbx
	mov rbx, rax
	test rax, rax
	jne .LBB0_0
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
