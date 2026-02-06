inspect_asm::alloc_iter_u32::try_mut_rev_down_a:
	mov eax, 4
	test rdx, rdx
	je .LBB0_0
	mov rcx, rdx
	shr rcx, 61
	je .LBB0_1
	xor eax, eax
	mov rdx, rdi
	ret
.LBB0_0:
	xor edi, edi
	mov rdx, rdi
	ret
.LBB0_1:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	shl rdx, 2
	mov r8, qword ptr [rdi]
	mov rcx, qword ptr [r8]
	mov r8, qword ptr [r8 + 8]
	mov r9, rcx
	sub r9, r8
	cmp rdx, r9
	jg .LBB0_9
	add r8, 3
	and r8, -4
.LBB0_2:
	mov r9, rcx
	sub r9, r8
	shr r9, 2
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [rsp + 16], rdi
	mov qword ptr [rsp + 24], 0
	mov qword ptr [rsp + 32], r9
	lea rbx, [rsp + 8]
	mov r14, qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
	xor r15d, r15d
	xor edi, edi
.LBB0_3:
	mov ebp, dword ptr [rsi + r15]
	cmp qword ptr [rsp + 32], rdi
	je .LBB0_5
.LBB0_4:
	mov r8, rdi
	not r8
	mov dword ptr [rcx + 4*r8], ebp
	inc rdi
	mov qword ptr [rsp + 24], rdi
	add r15, 4
	cmp rdx, r15
	jne .LBB0_3
	jmp .LBB0_6
.LBB0_5:
	mov r12, rsi
	mov r13, rdx
	mov esi, 1
	mov rdi, rbx
	call r14
	test al, al
	jne .LBB0_10
	mov rcx, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 24]
	mov eax, 4
	mov rdx, r13
	mov rsi, r12
	jmp .LBB0_4
.LBB0_6:
	cmp qword ptr [rsp + 32], 0
	je .LBB0_7
	mov rax, qword ptr [rsp + 16]
	mov rax, qword ptr [rax]
	shl r8, 2
	add r8, qword ptr [rsp + 8]
	mov qword ptr [rax], r8
	mov rax, r8
	jmp .LBB0_8
.LBB0_7:
	xor edi, edi
.LBB0_8:
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	mov rdx, rdi
	ret
.LBB0_9:
	mov rbx, rsi
	mov esi, 4
	mov r14, rdi
	mov r15, rdx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::prepare_allocation_range_in_another_chunk@GOTPCREL]
	test rax, rax
	je .LBB0_11
	mov r8, rax
	mov rcx, rdx
	mov eax, 4
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r14
	jmp .LBB0_2
.LBB0_10:
	xor eax, eax
	jmp .LBB0_8
.LBB0_11:
	xor eax, eax
	jmp .LBB0_8
