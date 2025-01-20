inspect_asm::alloc_iter_u32::try_mut_rev_down_a:
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
	mov r8, qword ptr [rdi]
	mov rcx, qword ptr [r8]
	mov r8, qword ptr [r8 + 8]
	mov r9, rcx
	sub r9, r8
	cmp rdx, r9
	ja .LBB0_9
	add r8, 3
	and r8, -4
	je .LBB0_9
.LBB0_2:
	mov r9, rcx
	sub r9, r8
	shr r9, 2
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [rsp + 16], rdi
	mov qword ptr [rsp + 24], 0
	mov qword ptr [rsp + 32], r9
	xor r14d, r14d
	lea rbx, [rsp + 8]
	mov r15, qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
	xor edi, edi
.LBB0_3:
	mov ebp, dword ptr [rsi + r14]
	cmp qword ptr [rsp + 32], rdi
	je .LBB0_5
.LBB0_4:
	mov r8, rdi
	not r8
	mov dword ptr [rcx + 4*r8], ebp
	inc rdi
	mov qword ptr [rsp + 24], rdi
	add r14, 4
	cmp rdx, r14
	jne .LBB0_3
	jmp .LBB0_6
.LBB0_5:
	mov r12, rsi
	mov esi, 1
	mov rdi, rbx
	mov r13, rdx
	call r15
	mov ecx, eax
	mov eax, 4
	test cl, cl
	jne .LBB0_0
	mov rsi, r12
	mov rdx, r13
	mov rcx, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 24]
	jmp .LBB0_4
.LBB0_6:
	cmp qword ptr [rsp + 32], 0
	je .LBB0_7
	shl r8, 2
	add r8, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 16]
	mov rax, qword ptr [rax]
	mov qword ptr [rax], r8
	mov rax, r8
	jmp .LBB0_8
.LBB0_7:
	xor edi, edi
.LBB0_8:
	mov rdx, rdi
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
