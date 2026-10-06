inspect_asm::alloc_iter_u32::try_mut_rev_down:
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
	mov r8, qword ptr [rdi]
	mov rcx, qword ptr [r8]
	mov r8, qword ptr [r8 + 8]
	and rcx, -4
	mov r9, rcx
	sub r9, r8
	cmp rdx, r9
	jg .LBB0_7
	add r8, 3
	and r8, -4
.LBB0_0:
	mov r9, rcx
	sub r9, r8
	shr r9, 2
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
	mov r13, rdx
	mov esi, 1
	mov rdi, r14
	call r12
	test al, al
	jne .LBB0_8
	mov rcx, qword ptr [rsp]
	mov eax, 4
	mov rdx, r13
	mov rsi, qword ptr [rsp + 32]
	jmp .LBB0_2
.LBB0_4:
	cmp qword ptr [rsp + 24], 0
	je .LBB0_5
	mov rax, qword ptr [rsp + 8]
	mov rax, qword ptr [rax]
	add r15, qword ptr [rsp]
	mov qword ptr [rax], r15
	mov rax, r15
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
	mov rbx, rsi
	mov esi, 4
	mov r14, rdi
	mov r15, rdx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::prepare_allocation_range_in_another_chunk@GOTPCREL]
	test rax, rax
	je .LBB0_8
	mov r8, rax
	mov rcx, rdx
	mov eax, 4
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r14
	jmp .LBB0_0
.LBB0_8:
	xor eax, eax
	jmp .LBB0_6
