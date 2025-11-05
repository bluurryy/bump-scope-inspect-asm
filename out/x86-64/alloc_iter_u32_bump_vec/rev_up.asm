inspect_asm::alloc_iter_u32_bump_vec::rev_up:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 8], 4
	xorps xmm0, xmm0
	movups xmmword ptr [rsp + 24], xmm0
	mov qword ptr [rsp + 16], rdi
	mov eax, 4
	test rdx, rdx
	jne .LBB0_1
	xor edx, edx
.LBB0_0:
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_1:
	lea r15, [4*rdx]
	lea rbx, [rsp + 8]
	mov rdi, rbx
	mov r12, rsi
	mov rsi, rdx
	call qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
	mov rcx, r12
	xor r13d, r13d
	mov rax, qword ptr [rsp + 24]
	mov r8, qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
.LBB0_2:
	mov ebp, dword ptr [rcx + r13]
	cmp qword ptr [rsp + 32], rax
	je .LBB0_4
.LBB0_3:
	mov r14, qword ptr [rsp + 8]
	mov rdx, rax
	not rdx
	mov dword ptr [r14 + 4*rdx], ebp
	inc rax
	mov qword ptr [rsp + 24], rax
	add r13, 4
	cmp r15, r13
	jne .LBB0_2
	jmp .LBB0_5
.LBB0_4:
	mov esi, 1
	mov rdi, rbx
	mov r14, r8
	call r8
	mov r8, r14
	mov rcx, r12
	mov rax, qword ptr [rsp + 24]
	jmp .LBB0_3
.LBB0_5:
	mov rcx, qword ptr [rsp + 32]
	test rcx, rcx
	je .LBB0_6
	mov r15, qword ptr [rsp + 16]
	shl rcx, 2
	lea rsi, [r14 + 4*rdx]
	sub r14, rcx
	lea r12, [r14 + 4*rax]
	lea rdx, [4*rax]
	mov rdi, r14
	mov rbx, rax
	call qword ptr [rip + memmove@GOTPCREL]
	mov rdx, rbx
	mov rax, qword ptr [r15]
	mov qword ptr [rax], r12
	mov rax, r14
	jmp .LBB0_0
.LBB0_6:
	xor edx, edx
	mov eax, 4
	jmp .LBB0_0
