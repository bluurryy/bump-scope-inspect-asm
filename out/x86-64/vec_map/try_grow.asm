inspect_asm::vec_map::try_grow:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 104
	mov qword ptr [rsp + 24], rdi
	mov rdx, qword ptr [rsi]
	mov r14, qword ptr [rsi + 8]
	mov rcx, qword ptr [rsi + 16]
	mov rax, qword ptr [rsi + 24]
	mov qword ptr [rsp + 32], 0
	mov qword ptr [rsp + 40], 8
	mov qword ptr [rsp + 16], rcx
	mov qword ptr [rsp + 48], rcx
	mov qword ptr [rsp + 56], 0
	mov qword ptr [rsp + 64], r14
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 72], rdx
	test rax, rax
	je .LBB0_3
	lea r15, [r14 + 4*rax]
	mov eax, 8
	xor ebp, ebp
	mov r13, r14
	xor r12d, r12d
.LBB0_0:
	mov ebx, dword ptr [r13]
	add r13, 4
	cmp rbp, r12
	je .LBB0_2
	lea rcx, [rbp + 1]
.LBB0_1:
	mov qword ptr [rax + 8*rbp], rbx
	mov qword ptr [rsp + 56], rcx
	mov rbp, rcx
	cmp r13, r15
	jne .LBB0_0
	jmp .LBB0_4
.LBB0_2:
	mov rax, r15
	sub rax, r13
	shr rax, 2
	lea r12, [rax + rbp]
	inc r12
	lea rax, [2*rbp]
	cmp rax, r12
	cmova r12, rax
	cmp r12, 5
	mov eax, 4
	cmovb r12, rax
	mov ecx, 8
	mov r8d, 8
	lea rdi, [rsp + 80]
	lea rsi, [rsp + 32]
	mov rdx, r12
	call <alloc::raw_vec::RawVecInner<&bump_scope::bump::Bump<0x17240000000000000000000000000000>>>::finish_grow
	cmp byte ptr [rsp + 80], 0
	jne .LBB0_7
	lea rcx, [rbp + 1]
	mov rax, qword ptr [rsp + 88]
	mov qword ptr [rsp + 40], rax
	mov qword ptr [rsp + 32], r12
	jmp .LBB0_1
.LBB0_3:
	xor ecx, ecx
.LBB0_4:
	mov rax, qword ptr [rsp + 8]
	lea rdx, [r14 + 4*rax]
	mov rsi, qword ptr [rsp + 16]
	mov rax, qword ptr [rsi]
	cmp rdx, qword ptr [rax]
	jne .LBB0_5
	mov qword ptr [rax], r14
.LBB0_5:
	movups xmm0, xmmword ptr [rsp + 32]
	mov rax, qword ptr [rsp + 24]
	movups xmmword ptr [rax], xmm0
	mov qword ptr [rax + 16], rsi
	mov qword ptr [rax + 24], rcx
.LBB0_6:
	add rsp, 104
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_7:
	mov rax, qword ptr [rsp + 24]
	mov qword ptr [rax], -1
	mov rcx, qword ptr [rsp + 32]
	mov rdi, qword ptr [rsp + 16]
	mov rsi, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_8
	mov rdx, qword ptr [rsp + 40]
	lea rcx, [rdx + 8*rcx]
	cmp rcx, qword ptr [rsi]
	jne .LBB0_8
	mov qword ptr [rsi], rdx
	mov rsi, qword ptr [rdi]
.LBB0_8:
	mov rcx, qword ptr [rsp + 8]
	lea rcx, [r14 + 4*rcx]
	cmp rcx, qword ptr [rsi]
	jne .LBB0_6
	mov qword ptr [rsi], r14
	jmp .LBB0_6
