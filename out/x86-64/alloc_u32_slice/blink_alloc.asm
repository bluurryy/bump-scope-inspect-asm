inspect_asm::alloc_u32_slice::blink_alloc:
	push r15
	push r14
	push r12
	push rbx
	push rax
	mov rbx, rdx
	lea rdx, [4*rdx]
	mov rax, qword ptr [rdi]
	test rax, rax
	je .LBB0_1
	mov rcx, qword ptr [rax]
	mov r14, rdx
	or r14, 3
	mov r8, rcx
	add r8, r14
	jb .LBB0_1
	sub r14, rdx
	add r14, rcx
	and r14, -4
	lea r8, [r14 + rdx]
	cmp r8, qword ptr [rax + 8]
	ja .LBB0_1
	mov qword ptr [rax], r8
	test rcx, rcx
	je .LBB0_1
.LBB0_0:
	mov rdi, r14
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rax, r14
	mov rdx, rbx
	add rsp, 8
	pop rbx
	pop r12
	pop r14
	pop r15
	ret
.LBB0_1:
	mov r12, rsi
	mov rsi, qword ptr [rdi + 8]
	mov rcx, rdx
	mov edx, 4
	mov r15, rcx
	call blink_alloc::arena::local::alloc_slow
	test rax, rax
	je .LBB0_2
	mov r14, rax
	mov rdx, r15
	mov rsi, r12
	jmp .LBB0_0
.LBB0_2:
	mov edi, 4
	mov rsi, r15
	call core::ops::function::FnOnce::call_once
