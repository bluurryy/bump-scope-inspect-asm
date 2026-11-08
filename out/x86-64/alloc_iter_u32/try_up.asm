inspect_asm::alloc_iter_u32::try_up:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 88
	mov qword ptr [rsp + 32], 0
	mov qword ptr [rsp + 40], 4
	mov qword ptr [rsp + 48], rdi
	mov qword ptr [rsp + 56], 0
	test rdx, rdx
	je .LBB0_3
	mov qword ptr [rsp], rdi
	shl rdx, 2
	lea rbp, [rdx - 4]
	neg rdx
	xor r14d, r14d
	xor r13d, r13d
	xor r15d, r15d
	mov eax, 4
	xor ebx, ebx
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 16], rsi
	jmp .LBB0_1
.LBB0_0:
	inc r14
	mov dword ptr [rax + r15], r12d
	mov qword ptr [rsp + 56], r14
	add r15, 4
	add r13, 2
	add rbp, -4
	mov rcx, rdx
	add rcx, r15
	je .LBB0_2
.LBB0_1:
	mov r12d, dword ptr [rsi + r15]
	cmp r14, rbx
	jne .LBB0_0
	mov qword ptr [rsp + 8], rax
	mov rbx, rbp
	shr rbx, 2
	inc rbx
	add rbx, r14
	cmp r13, rbx
	cmova rbx, r13
	cmp rbx, 5
	mov eax, 4
	cmovb rbx, rax
	mov ecx, 4
	mov r8d, 4
	lea rdi, [rsp + 64]
	lea rsi, [rsp + 32]
	mov rdx, rbx
	call <alloc::raw_vec::RawVecInner<&bump_scope::bump::Bump<0x8f920000000000000000000000000000>>>::finish_grow
	cmp byte ptr [rsp + 64], 0
	jne .LBB0_5
	mov rax, qword ptr [rsp + 72]
	mov qword ptr [rsp + 40], rax
	mov qword ptr [rsp + 32], rbx
	mov rdx, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsp + 16]
	jmp .LBB0_0
.LBB0_2:
	cmp r14, rbx
	jae .LBB0_4
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rcx]
	lea rcx, [rax + 4*rbx]
	cmp rcx, qword ptr [rdx]
	jne .LBB0_4
	add r15, rax
	mov qword ptr [rdx], r15
	jmp .LBB0_4
.LBB0_3:
	mov eax, 4
	xor r14d, r14d
.LBB0_4:
	mov rdx, r14
	add rsp, 88
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_5:
	test r15, r15
	je .LBB0_6
	mov rcx, qword ptr [rsp + 8]
	add r15, rcx
	mov rax, qword ptr [rsp]
	mov rax, qword ptr [rax]
	cmp r15, qword ptr [rax]
	je .LBB0_7
.LBB0_6:
	xor eax, eax
	jmp .LBB0_4
.LBB0_7:
	mov qword ptr [rax], rcx
	xor eax, eax
	jmp .LBB0_4
