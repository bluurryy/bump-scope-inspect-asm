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
	je .LBB0_3
	mov qword ptr [rsp], rdi
	shl rdx, 2
	lea r12, [rdx - 4]
	neg rdx
	xor r14d, r14d
	xor ebp, ebp
	xor r15d, r15d
	mov ecx, 4
	xor ebx, ebx
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 16], rsi
	jmp .LBB0_1
.LBB0_0:
	inc r14
	mov dword ptr [rcx + r15], r13d
	mov qword ptr [rsp + 56], r14
	add r15, 4
	add rbp, 2
	add r12, -4
	mov rax, rdx
	add rax, r15
	je .LBB0_2
.LBB0_1:
	mov r13d, dword ptr [rsi + r15]
	cmp r14, rbx
	jne .LBB0_0
	mov qword ptr [rsp + 8], rcx
	mov rbx, r12
	shr rbx, 2
	inc rbx
	add rbx, r14
	cmp rbp, rbx
	cmova rbx, rbp
	cmp rbx, 5
	mov eax, 4
	cmovb rbx, rax
	mov ecx, 4
	mov r8d, 4
	lea rdi, [rsp + 64]
	lea rsi, [rsp + 32]
	mov rdx, rbx
	call <alloc::raw_vec::RawVecInner<bump_scope::containers::mut_bump_vec::AllocatorWrapper<bump_scope::bump::Bump<0x87920000000000000000000000000000>>>>::finish_grow
	cmp byte ptr [rsp + 64], 0
	jne .LBB0_5
	mov rcx, qword ptr [rsp + 72]
	mov qword ptr [rsp + 40], rcx
	mov qword ptr [rsp + 32], rbx
	mov rdx, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsp + 16]
	jmp .LBB0_0
.LBB0_2:
	cmp r14, rbx
	jae .LBB0_4
	mov rax, qword ptr [rsp]
	mov r13, qword ptr [rax]
	cmp rcx, qword ptr [r13]
	jne .LBB0_4
	lea rax, [rcx + 4*rbx]
	xor r12d, r12d
	sub rax, r15
	cmovae r12, rax
	and r12, -4
	mov rdi, r12
	mov rsi, rcx
	mov rdx, r15
	call qword ptr [rip + memmove@GOTPCREL]
	mov qword ptr [r13], r12
	mov rcx, r12
	jmp .LBB0_4
.LBB0_3:
	mov ecx, 4
	xor r14d, r14d
.LBB0_4:
	mov rax, rcx
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
	mov rax, qword ptr [rsp]
	mov rax, qword ptr [rax]
	mov rcx, qword ptr [rsp + 8]
	cmp rcx, qword ptr [rax]
	je .LBB0_7
.LBB0_6:
	xor ecx, ecx
	jmp .LBB0_4
.LBB0_7:
	add rcx, r15
	mov qword ptr [rax], rcx
	xor ecx, ecx
	jmp .LBB0_4
