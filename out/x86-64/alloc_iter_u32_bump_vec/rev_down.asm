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
	lea rbx, [rsp + 8]
	mov rdi, rbx
	mov r14, rsi
	mov rsi, rdx
	mov r15, rdx
	call qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
	mov rcx, r14
	mov rax, r15
	mov rdx, qword ptr [rsp + 24]
	shl rax, 2
	xor r15d, r15d
	mov r12, qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
.LBB0_2:
	mov ebp, dword ptr [rcx + r15]
	cmp qword ptr [rsp + 32], rdx
	je .LBB0_4
.LBB0_3:
	mov rsi, qword ptr [rsp + 8]
	mov rdi, rdx
	not rdi
	mov dword ptr [rsi + 4*rdi], ebp
	inc rdx
	mov qword ptr [rsp + 24], rdx
	add r15, 4
	cmp rax, r15
	jne .LBB0_2
	jmp .LBB0_5
.LBB0_4:
	mov esi, 1
	mov rdi, rbx
	mov r13, rax
	call r12
	mov rcx, r14
	mov rax, r13
	mov rdx, qword ptr [rsp + 24]
	jmp .LBB0_3
.LBB0_5:
	cmp qword ptr [rsp + 32], 0
	je .LBB0_6
	mov rcx, qword ptr [rsp + 16]
	lea rax, [rsi + 4*rdi]
	mov rcx, qword ptr [rcx]
	mov qword ptr [rcx], rax
	jmp .LBB0_0
.LBB0_6:
	xor edx, edx
	mov eax, 4
	jmp .LBB0_0
