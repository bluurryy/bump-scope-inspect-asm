inspect_asm::alloc_12_u32::try_blink_alloc:
	push r14
	push rbx
	sub rsp, 40
	mov ebx, dword ptr [rsi]
	mov r14, qword ptr [rsi + 4]
	mov eax, dword ptr [rsi + 44]
	mov dword ptr [rsp + 32], eax
	movups xmm0, xmmword ptr [rsi + 28]
	movaps xmmword ptr [rsp + 16], xmm0
	movups xmm0, xmmword ptr [rsi + 12]
	movaps xmmword ptr [rsp], xmm0
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
	mov dword ptr [rax], ebx
	mov qword ptr [rax + 4], r14
	movaps xmm0, xmmword ptr [rsp]
	movaps xmm1, xmmword ptr [rsp + 16]
	movups xmmword ptr [rax + 12], xmm0
	movups xmmword ptr [rax + 28], xmm1
	mov ecx, dword ptr [rsp + 32]
	mov dword ptr [rax + 44], ecx
	add rsp, 40
	pop rbx
	pop r14
	ret
.LBB0_1:
	mov rsi, qword ptr [rdi + 8]
	mov edx, 4
	mov ecx, 48
	call blink_alloc::arena::local::alloc_slow
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	add rsp, 40
	pop rbx
	pop r14
	ret
