inspect_asm::alloc_str::bumpalo:
	push r14
	push rbx
	push rax
	mov rax, qword ptr [rdi + 16]
	mov rbx, qword ptr [rax + 32]
	mov rcx, rbx
	sub rcx, qword ptr [rax]
	cmp rdx, rcx
	ja .LBB0_1
	sub rbx, rdx
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
