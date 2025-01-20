inspect_asm::alloc_iter_u32_bump_vec::rev_up_a:
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
	lea rbx, [rsp + 8]
	mov rdi, rbx
	mov r15, rsi
	mov rsi, rdx
	mov r14, rdx
	call qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
	mov rdx, r15
	mov rcx, r14
	mov rax, qword ptr [rsp + 24]
	shl rcx, 2
	xor r12d, r12d
	mov r13, qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
.LBB0_2:
	mov ebp, dword ptr [rdx + r12]
	cmp qword ptr [rsp + 32], rax
	je .LBB0_4
.LBB0_3:
	mov r14, qword ptr [rsp + 8]
	mov rsi, rax
	not rsi
	mov dword ptr [r14 + 4*rsi], ebp
	inc rax
	mov qword ptr [rsp + 24], rax
	add r12, 4
	cmp rcx, r12
	jne .LBB0_2
	jmp .LBB0_5
.LBB0_4:
	mov esi, 1
	mov rdi, rbx
	mov r14, rcx
	call r13
	mov rdx, r15
	mov rcx, r14
	mov rax, qword ptr [rsp + 24]
	jmp .LBB0_3
.LBB0_5:
	mov rcx, qword ptr [rsp + 32]
	test rcx, rcx
	je .LBB0_6
	mov r15, qword ptr [rsp + 16]
	lea rsi, [r14 + 4*rsi]
	shl rcx, 2
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
