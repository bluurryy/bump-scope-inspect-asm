inspect_asm::alloc_iter_u32::mut_rev_up_a:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov eax, 4
	test rdx, rdx
	je .LBB0_5
	shl rdx, 2
	mov rcx, qword ptr [rdi]
	mov r8, qword ptr [rcx]
	mov rcx, qword ptr [rcx + 8]
	mov r9, rcx
	sub r9, r8
	cmp rdx, r9
	jg .LBB0_7
	and rcx, -4
.LBB0_0:
	sub rcx, r8
	mov r9, rcx
	shr r9, 2
	and rcx, -4
	add rcx, r8
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], r9
	neg rdx
	xor r15d, r15d
	mov r14, rsp
	mov r12, qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
	xor ebx, ebx
.LBB0_1:
	mov ebp, dword ptr [rsi + 4*rbx]
	cmp rbx, qword ptr [rsp + 24]
	je .LBB0_3
.LBB0_2:
	inc rbx
	mov dword ptr [rcx + r15 - 4], ebp
	mov qword ptr [rsp + 16], rbx
	add r15, -4
	cmp rdx, r15
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov qword ptr [rsp + 32], rsi
	mov esi, 1
	mov rdi, r14
	mov r13, rdx
	call r12
	mov rsi, qword ptr [rsp + 32]
	mov rdx, r13
	mov eax, 4
	mov rcx, qword ptr [rsp]
	jmp .LBB0_2
.LBB0_4:
	mov rcx, qword ptr [rsp + 24]
	test rcx, rcx
	je .LBB0_5
	mov rsi, qword ptr [rsp]
	mov rax, qword ptr [rsp + 8]
	mov r12, qword ptr [rax]
	shl rcx, 2
	mov r14, rsi
	sub r14, rcx
	add rsi, r15
	mov rdx, r15
	neg rdx
	mov rdi, r14
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, r14
	mov rcx, r14
	sub rcx, r15
	mov qword ptr [r12], rcx
	jmp .LBB0_6
.LBB0_5:
	xor ebx, ebx
.LBB0_6:
	mov rdx, rbx
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_7:
	mov r15, rsi
	mov esi, 4
	mov r14, rdi
	mov rbx, rdx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::prepare_allocation_range_in_another_chunk@GOTPCREL]
	mov rdi, r14
	mov rsi, r15
	mov r8, rax
	mov eax, 4
	mov rcx, rdx
	mov rdx, rbx
	jmp .LBB0_0
