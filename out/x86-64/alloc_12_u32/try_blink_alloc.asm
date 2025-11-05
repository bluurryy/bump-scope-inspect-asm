inspect_asm::alloc_12_u32::try_blink_alloc:
	push r15
	push r14
	push rbx
	mov ebx, dword ptr [rsi]
	mov r14, qword ptr [rsi + 4]
	mov rcx, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_1
	mov rax, qword ptr [rcx]
	cmp rax, -52
	ja .LBB0_1
	add rax, 3
	and rax, -4
	lea rdx, [rax + 48]
	cmp rdx, qword ptr [rcx + 8]
	ja .LBB0_1
	mov qword ptr [rcx], rdx
.LBB0_0:
	add rsi, 12
	mov dword ptr [rax], ebx
	mov qword ptr [rax + 4], r14
	movups xmm0, xmmword ptr [rsi]
	movups xmm1, xmmword ptr [rsi + 16]
	movups xmmword ptr [rax + 12], xmm0
	movups xmmword ptr [rax + 28], xmm1
	mov ecx, dword ptr [rsi + 32]
	mov dword ptr [rax + 44], ecx
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_1:
	mov rax, qword ptr [rdi + 8]
	mov edx, 4
	mov ecx, 48
	mov r15, rsi
	mov rsi, rax
	call blink_alloc::arena::local::alloc_slow
	mov rsi, r15
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	pop r14
	pop r15
	ret
