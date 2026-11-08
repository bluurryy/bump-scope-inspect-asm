inspect_asm::alloc_iter_u32::try_down:
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
	je .LBB0_4
	mov rcx, rsi
	mov qword ptr [rsp], rdi
	shl rdx, 2
	lea r12, [rdx - 4]
	neg rdx
	xor ebx, ebx
	xor r15d, r15d
	xor r14d, r14d
	mov esi, 4
	xor ebp, ebp
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 16], rcx
	jmp .LBB0_1
.LBB0_0:
	inc rbx
	mov dword ptr [rsi + r14], r13d
	mov qword ptr [rsp + 56], rbx
	add r14, 4
	add r15, 2
	add r12, -4
	mov rax, rdx
	add rax, r14
	je .LBB0_2
.LBB0_1:
	mov r13d, dword ptr [rcx + r14]
	cmp rbx, rbp
	jne .LBB0_0
	mov qword ptr [rsp + 8], rsi
	mov rbp, r12
	shr rbp, 2
	inc rbp
	add rbp, rbx
	cmp r15, rbp
	cmova rbp, r15
	cmp rbp, 5
	mov eax, 4
	cmovb rbp, rax
	mov ecx, 4
	mov r8d, 4
	lea rdi, [rsp + 64]
	lea rsi, [rsp + 32]
	mov rdx, rbp
	call <alloc::raw_vec::RawVecInner<bump_scope::containers::mut_bump_vec::AllocatorWrapper<bump_scope::bump::Bump<0x7240000000000000000000000000000>>>>::finish_grow
	cmp byte ptr [rsp + 64], 0
	jne .LBB0_9
	mov rsi, qword ptr [rsp + 72]
	mov qword ptr [rsp + 40], rsi
	mov qword ptr [rsp + 32], rbp
	mov rdx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rsp + 16]
	jmp .LBB0_0
.LBB0_2:
	cmp rbx, rbp
	jae .LBB0_3
	mov rax, qword ptr [rsp]
	mov r15, qword ptr [rax]
	cmp rsi, qword ptr [r15]
	je .LBB0_5
.LBB0_3:
	mov rax, rsi
	jmp .LBB0_8
.LBB0_4:
	mov eax, 4
	xor ebx, ebx
	jmp .LBB0_8
.LBB0_5:
	lea rax, [rsi + 4*rbp]
	xor edi, edi
	sub rax, r14
	cmovae rdi, rax
	and rdi, -4
	lea rax, [rsi + r14]
	mov r12, rdi
	mov rdx, r14
	cmp rax, rdi
	jbe .LBB0_6
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_7
.LBB0_6:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_7:
	mov rax, r12
	mov qword ptr [r15], r12
.LBB0_8:
	mov rdx, rbx
	add rsp, 88
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_9:
	test r14, r14
	je .LBB0_10
	mov rax, qword ptr [rsp]
	mov rax, qword ptr [rax]
	mov rcx, qword ptr [rsp + 8]
	cmp rcx, qword ptr [rax]
	je .LBB0_11
.LBB0_10:
	xor eax, eax
	jmp .LBB0_8
.LBB0_11:
	add rcx, r14
	mov qword ptr [rax], rcx
	xor eax, eax
	jmp .LBB0_8
