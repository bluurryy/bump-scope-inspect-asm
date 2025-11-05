inspect_asm::alloc_iter_u32_bump_vec::rev_down:
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
	lea r14, [4*rdx]
	lea rbx, [rsp + 8]
	mov rdi, rbx
	mov r15, rsi
	mov rsi, rdx
	call qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
	mov rax, r15
	xor r12d, r12d
	mov rdx, qword ptr [rsp + 24]
	mov r13, qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
.LBB0_2:
	mov ebp, dword ptr [rax + r12]
	cmp qword ptr [rsp + 32], rdx
	je .LBB0_4
.LBB0_3:
	mov rcx, qword ptr [rsp + 8]
	mov rsi, rdx
	not rsi
	mov dword ptr [rcx + 4*rsi], ebp
	inc rdx
	mov qword ptr [rsp + 24], rdx
	add r12, 4
	cmp r14, r12
	jne .LBB0_2
	jmp .LBB0_5
.LBB0_4:
	mov esi, 1
	mov rdi, rbx
	call r13
	mov rax, r15
	mov rdx, qword ptr [rsp + 24]
	jmp .LBB0_3
.LBB0_5:
	cmp qword ptr [rsp + 32], 0
	je .LBB0_6
	mov rdi, qword ptr [rsp + 16]
	lea rax, [rcx + 4*rsi]
	mov rcx, qword ptr [rdi]
	mov qword ptr [rcx], rax
	jmp .LBB0_0
.LBB0_6:
	xor edx, edx
	mov eax, 4
	jmp .LBB0_0
