inspect_asm::vec_map::try_grow:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov rbx, rdi
	mov r14, qword ptr [rsi + 24]
	mov r12, qword ptr [rsi]
	mov r15, qword ptr [rsi + 8]
	mov r13, qword ptr [rsi + 16]
	test r15, r15
	je .LBB0_1
	mov rax, r15
	shr rax, 60
	je .LBB0_2
.LBB0_0:
	lea rax, [r12 + 4*r13]
	mov rdx, qword ptr [r14]
	cmp rax, qword ptr [rdx]
	jne .LBB0_13
	xor eax, eax
	jmp .LBB0_12
.LBB0_1:
	mov eax, 8
	xor ecx, ecx
	jmp .LBB0_10
.LBB0_2:
	lea rcx, [8*r15]
	mov rdx, qword ptr [r14]
	mov rax, qword ptr [rdx]
	mov rsi, qword ptr [rdx + 8]
	add rax, 7
	and rax, -8
	sub rsi, rax
	cmp rcx, rsi
	jbe .LBB0_3
	mov rdi, r14
	mov rsi, r15
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::do_alloc_slice_in_another_chunk@GOTPCREL]
	test rax, rax
	jne .LBB0_4
	jmp .LBB0_0
.LBB0_3:
	add rcx, rax
	mov qword ptr [rdx], rcx
.LBB0_4:
	movabs rcx, 4611686018427387903
	lea rdx, [r15 - 1]
	mov rdi, rdx
	and rdi, rcx
	cmp rdi, rdx
	cmovae rdi, rdx
	cmp rdi, 19
	jb .LBB0_5
	lea rsi, [r15 + rcx]
	and rsi, rcx
	cmp rsi, rdx
	cmovae rsi, rdx
	lea rcx, [r12 + 4*rsi]
	add rcx, 4
	cmp rax, rcx
	jae .LBB0_8
	lea rcx, [rax + 8*rsi]
	add rcx, 8
	cmp r12, rcx
	jae .LBB0_8
.LBB0_5:
	xor ecx, ecx
	mov rsi, r12
.LBB0_6:
	lea rdi, [r12 + 4*r15]
.LBB0_7:
	mov r8, rcx
	mov ecx, dword ptr [rsi]
	mov qword ptr [rax + 8*r8], rcx
	lea rcx, [r8 + 1]
	cmp rdx, r8
	je .LBB0_10
	add rsi, 4
	cmp rsi, rdi
	jne .LBB0_7
	jmp .LBB0_10
.LBB0_8:
	inc rdi
	movabs rcx, 9223372036854775804
	and rcx, rdi
	lea rsi, [r12 + 4*rcx]
	xor r8d, r8d
	xorps xmm0, xmm0
.LBB0_9:
	movsd xmm1, qword ptr [r12 + 4*r8]
	movsd xmm2, qword ptr [r12 + 4*r8 + 8]
	unpcklps xmm1, xmm0
	unpcklps xmm2, xmm0
	movups xmmword ptr [rax + 8*r8], xmm1
	movups xmmword ptr [rax + 8*r8 + 16], xmm2
	add r8, 4
	cmp rcx, r8
	jne .LBB0_9
	cmp rdi, rcx
	jne .LBB0_6
.LBB0_10:
	lea rsi, [r12 + 4*r13]
	mov rdx, qword ptr [r14]
	cmp rsi, qword ptr [rdx]
	je .LBB0_12
	test rax, rax
	je .LBB0_13
.LBB0_11:
	mov qword ptr [rbx], rax
	mov qword ptr [rbx + 8], rcx
	mov qword ptr [rbx + 16], r15
	mov qword ptr [rbx + 24], r14
	jmp .LBB0_14
.LBB0_12:
	mov qword ptr [rdx], r12
	test rax, rax
	jne .LBB0_11
.LBB0_13:
	mov qword ptr [rbx], 0
.LBB0_14:
	mov rax, rbx
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
	lea rdx, [r12 + 4*r13]
	mov rcx, qword ptr [r14]
	cmp rdx, qword ptr [rcx]
	jne .LBB0_15
	mov qword ptr [rcx], r12
.LBB0_15:
	mov rdi, rax
	call _Unwind_Resume@PLT
