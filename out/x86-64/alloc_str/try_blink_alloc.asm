inspect_asm::alloc_str::try_blink_alloc:
	push r14
	push rbx
	push rax
	mov rbx, rdx
	mov rax, qword ptr [rdi]
	test rax, rax
	je .LBB0_2
	mov r14, qword ptr [rax]
	mov rcx, r14
	add rcx, rbx
	jb .LBB0_2
	cmp rcx, qword ptr [rax + 8]
	ja .LBB0_2
	mov qword ptr [rax], rcx
	test r14, r14
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
	mov rax, qword ptr [rdi + 8]
	mov edx, 1
	mov r14, rsi
	mov rsi, rax
	mov rcx, rbx
	call blink_alloc::arena::local::alloc_slow
	mov rsi, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	xor r14d, r14d
	jmp .LBB0_1
