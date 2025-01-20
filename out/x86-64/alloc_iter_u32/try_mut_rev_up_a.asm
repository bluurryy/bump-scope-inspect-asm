inspect_asm::alloc_iter_u32::try_mut_rev_up_a:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov eax, 4
	test rdx, rdx
	je .LBB0_7
	mov rcx, rdx
	shr rcx, 61
	je .LBB0_1
.LBB0_0:
	xor eax, eax
	jmp .LBB0_8
.LBB0_1:
	shl rdx, 2
	mov rcx, qword ptr [rdi]
	mov r8, qword ptr [rcx]
	mov rcx, qword ptr [rcx + 8]
	mov r9, rcx
	sub r9, r8
	cmp rdx, r9
	ja .LBB0_9
	and rcx, -4
.LBB0_2:
	mov r9, rcx
	sub r9, r8
	shr r9, 2
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [rsp + 16], rdi
	mov qword ptr [rsp + 24], 0
	mov qword ptr [rsp + 32], r9
	xor r15d, r15d
	lea r14, [rsp + 8]
	mov r12, qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
	xor ebx, ebx
.LBB0_3:
	mov ebp, dword ptr [rsi + r15]
	cmp qword ptr [rsp + 32], rbx
	je .LBB0_5
.LBB0_4:
	mov rdi, rbx
	not rdi
	mov dword ptr [rcx + 4*rdi], ebp
	inc rbx
	mov qword ptr [rsp + 24], rbx
	add r15, 4
	cmp rdx, r15
	jne .LBB0_3
	jmp .LBB0_6
.LBB0_5:
	mov rbx, rsi
	mov esi, 1
	mov rdi, r14
	mov r13, rdx
	call r12
	mov ecx, eax
	mov eax, 4
	test cl, cl
	jne .LBB0_0
	mov rsi, rbx
	mov rdx, r13
	mov rcx, qword ptr [rsp + 8]
	mov rbx, qword ptr [rsp + 24]
	jmp .LBB0_4
.LBB0_6:
	mov rcx, qword ptr [rsp + 32]
	test rcx, rcx
	je .LBB0_7
	mov r14, qword ptr [rsp + 8]
	mov r15, qword ptr [rsp + 16]
	lea rsi, [r14 + 4*rdi]
	shl rcx, 2
	sub r14, rcx
	lea r12, [r14 + 4*rbx]
	lea rdx, [4*rbx]
	mov rdi, r14
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, r14
	mov rcx, qword ptr [r15]
	mov qword ptr [rcx], r12
	jmp .LBB0_8
.LBB0_7:
	xor ebx, ebx
.LBB0_8:
	mov rdx, rbx
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_9:
	mov r15, rsi
	mov esi, 4
	mov r14, rdi
	mov rbx, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::prepare_allocation_range_in_another_chunk@GOTPCREL]
	mov r8, rax
	mov eax, 4
	test r8, r8
	je .LBB0_0
	mov rdi, r14
	mov rsi, r15
	mov rcx, rdx
	mov rdx, rbx
	jmp .LBB0_2
