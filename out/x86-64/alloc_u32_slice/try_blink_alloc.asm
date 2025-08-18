inspect_asm::alloc_u32_slice::try_blink_alloc:
	push r15
	push r14
	push rbx
	mov rbx, rdx
	lea rdx, [4*rdx]
	mov rax, qword ptr [rdi]
	test rax, rax
	je .LBB0_2
	mov rcx, qword ptr [rax]
	mov r14, rdx
	or r14, 3
	mov r8, rcx
	add r8, r14
	jb .LBB0_2
	sub r14, rdx
	add r14, rcx
	and r14, -4
	lea rcx, [r14 + rdx]
	cmp rcx, qword ptr [rax + 8]
	ja .LBB0_2
	mov qword ptr [rax], rcx
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
	mov rax, qword ptr [rdi + 8]
	mov r14, rdx
	mov edx, 4
	mov r15, rsi
	mov rsi, rax
	mov rcx, r14
	call blink_alloc::arena::local::alloc_slow
	mov rdx, r14
	mov rsi, r15
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	xor r14d, r14d
	jmp .LBB0_1
