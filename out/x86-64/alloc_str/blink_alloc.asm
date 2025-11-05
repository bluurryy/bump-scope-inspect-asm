inspect_asm::alloc_str::blink_alloc:
	push r15
	push r14
	push rbx
	mov r14, rdx
	mov rax, qword ptr [rdi]
	test rax, rax
	je .LBB0_1
	mov rbx, qword ptr [rax]
	mov rcx, r14
	add rcx, rbx
	jb .LBB0_1
	cmp rcx, qword ptr [rax + 8]
	ja .LBB0_1
	mov qword ptr [rax], rcx
.LBB0_0:
	mov rdi, rbx
	mov rdx, r14
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rax, rbx
	mov rdx, r14
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_1:
	mov r15, rsi
	mov rsi, qword ptr [rdi + 8]
	mov rcx, r14
	mov edx, 1
	call blink_alloc::arena::local::alloc_slow
	test rax, rax
	je .LBB0_2
	mov rbx, rax
	mov rsi, r15
	jmp .LBB0_0
.LBB0_2:
	mov edi, 1
	mov rsi, r14
	call core::ops::function::FnOnce::call_once
