inspect_asm::vec_map::grow:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r14, rdi
	mov rbx, qword ptr [rsi + 24]
	mov r12, qword ptr [rsi]
	mov r15, qword ptr [rsi + 8]
	mov r13, qword ptr [rsi + 16]
	test r15, r15
	je .LBB0_4
	mov rax, r15
	shr rax, 60
	jne .LBB0_10
	lea rcx, [8*r15]
	mov rdx, qword ptr [rbx]
	mov rax, qword ptr [rdx]
	mov rsi, qword ptr [rdx + 8]
	add rax, 7
	and rax, -8
	sub rsi, rax
	cmp rcx, rsi
	jg .LBB0_9
	add rcx, rax
	mov qword ptr [rdx], rcx
.LBB0_0:
	lea rcx, [4*r15]
	add rcx, -4
	shr rcx, 2
	lea rdx, [r15 - 1]
	cmp rcx, rdx
	mov rdi, rdx
	cmovb rdi, rcx
	cmp rdi, 19
	jb .LBB0_1
	cmp rcx, rdx
	cmovae rcx, rdx
	lea rsi, [r12 + 4*rcx]
	add rsi, 4
	cmp rax, rsi
	jae .LBB0_7
	lea rcx, [rax + 8*rcx]
	add rcx, 8
	cmp r12, rcx
	jae .LBB0_7
.LBB0_1:
	xor ecx, ecx
	mov rsi, r12
.LBB0_2:
	lea rdi, [r12 + 4*r15]
.LBB0_3:
	mov r8d, dword ptr [rsi]
	mov qword ptr [rax + 8*rcx], r8
	cmp rdx, rcx
	lea rcx, [rcx + 1]
	je .LBB0_5
	add rsi, 4
	cmp rsi, rdi
	jne .LBB0_3
	jmp .LBB0_5
.LBB0_4:
	mov eax, 8
	xor ecx, ecx
.LBB0_5:
	test r13, r13
	je .LBB0_6
	lea rsi, [r12 + 4*r13]
	mov rdx, qword ptr [rbx]
	cmp rsi, qword ptr [rdx]
	jne .LBB0_6
	mov qword ptr [rdx], r12
.LBB0_6:
	mov qword ptr [r14], rax
	mov qword ptr [r14 + 8], rcx
	mov qword ptr [r14 + 16], r15
	mov qword ptr [r14 + 24], rbx
	mov rax, r14
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB0_7:
	inc rdi
	movabs rcx, 9223372036854775804
	and rcx, rdi
	lea rsi, [r12 + 4*rcx]
	xor r8d, r8d
	xorps xmm0, xmm0
.LBB0_8:
	movsd xmm1, qword ptr [r12 + 4*r8]
	movsd xmm2, qword ptr [r12 + 4*r8 + 8]
	unpcklps xmm1, xmm0
	unpcklps xmm2, xmm0
	movups xmmword ptr [rax + 8*r8], xmm1
	movups xmmword ptr [rax + 8*r8 + 16], xmm2
	add r8, 4
	cmp rcx, r8
	jne .LBB0_8
	cmp rdi, rcx
	jne .LBB0_2
	jmp .LBB0_5
.LBB0_9:
	mov rdi, rbx
	mov rsi, r15
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_slice_in_another_chunk@GOTPCREL]
	jmp .LBB0_0
.LBB0_10:
	call qword ptr [rip + bump_scope::private::capacity_overflow@GOTPCREL]
	ud2
	test r13, r13
	je .LBB0_11
	lea rdx, [r12 + 4*r13]
	mov rcx, qword ptr [rbx]
	cmp rdx, qword ptr [rcx]
	jne .LBB0_11
	mov qword ptr [rcx], r12
.LBB0_11:
	mov rdi, rax
	call _Unwind_Resume@PLT
