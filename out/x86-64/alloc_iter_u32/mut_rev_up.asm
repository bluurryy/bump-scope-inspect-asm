inspect_asm::alloc_iter_u32::mut_rev_up:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov ebx, 4
	test rdx, rdx
	je .LBB0_5
	mov rax, rdx
	shr rax, 61
	jne .LBB0_8
	shl rdx, 2
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rcx, qword ptr [rcx + 8]
	add rax, 3
	and rax, -4
	mov r8, rcx
	sub r8, rax
	cmp rdx, r8
	ja .LBB0_7
	and rcx, -4
.LBB0_0:
	mov r8, rcx
	sub r8, rax
	shr r8, 2
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], r8
	xor r12d, r12d
	mov r15, rsp
	mov r13, qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
	xor r14d, r14d
.LBB0_1:
	mov ebp, dword ptr [rsi + r12]
	cmp qword ptr [rsp + 24], r14
	je .LBB0_3
.LBB0_2:
	mov rax, r14
	not rax
	mov dword ptr [rcx + 4*rax], ebp
	inc r14
	mov qword ptr [rsp + 16], r14
	add r12, 4
	cmp rdx, r12
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov qword ptr [rsp + 32], rsi
	mov esi, 1
	mov rdi, r15
	mov r14, rdx
	call r13
	mov rsi, qword ptr [rsp + 32]
	mov rdx, r14
	mov rcx, qword ptr [rsp]
	mov r14, qword ptr [rsp + 16]
	jmp .LBB0_2
.LBB0_4:
	mov rcx, qword ptr [rsp + 24]
	test rcx, rcx
	je .LBB0_5
	mov rbx, qword ptr [rsp]
	mov r15, qword ptr [rsp + 8]
	lea rsi, [rbx + 4*rax]
	shl rcx, 2
	sub rbx, rcx
	lea r12, [rbx + 4*r14]
	lea rdx, [4*r14]
	mov rdi, rbx
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, qword ptr [r15]
	mov qword ptr [rax], r12
	jmp .LBB0_6
.LBB0_5:
	xor r14d, r14d
.LBB0_6:
	mov rax, rbx
	mov rdx, r14
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_7:
	mov r12, rsi
	mov esi, 4
	mov r15, rdi
	mov r14, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::prepare_allocation_range_in_another_chunk@GOTPCREL]
	mov rdi, r15
	mov rsi, r12
	mov rcx, rdx
	mov rdx, r14
	jmp .LBB0_0
.LBB0_8:
	call qword ptr [rip + bump_scope::private::capacity_overflow@GOTPCREL]
