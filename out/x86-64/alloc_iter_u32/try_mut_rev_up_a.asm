inspect_asm::alloc_iter_u32::try_mut_rev_up_a:
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
	shl rdx, 2
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rcx, qword ptr [rcx + 8]
	mov r8, rcx
	sub r8, rax
	cmp rdx, r8
	jg .LBB0_7
	and rcx, -4
.LBB0_0:
	sub rcx, rax
	mov r8, rcx
	shr r8, 2
	and rcx, -4
	add rcx, rax
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], r8
	xor r15d, r15d
	mov r14, rsp
	mov r12, qword ptr [rip + bump_scope::mut_bump_vec_rev::MutBumpVecRev<T,A>::generic_grow_amortized@GOTPCREL]
	xor eax, eax
.LBB0_1:
	mov ebp, dword ptr [rsi + r15]
	cmp qword ptr [rsp + 24], rax
	je .LBB0_3
.LBB0_2:
	lea rdi, [rax + 1]
	mov qword ptr [rsp + 16], rdi
	not rax
	mov dword ptr [rcx + 4*rax], ebp
	add r15, 4
	mov rax, rdi
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
	mov rax, qword ptr [rsp + 16]
	mov rdx, r13
	mov rsi, qword ptr [rsp + 32]
	jmp .LBB0_2
.LBB0_4:
	mov rax, qword ptr [rsp + 24]
	test rax, rax
	je .LBB0_5
	mov rsi, qword ptr [rsp]
	mov rcx, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rcx]
	shl rax, 2
	mov rbx, rsi
	sub rbx, rax
	lea r12, [rbx + 4*r14]
	lea rdx, [4*r14]
	sub rsi, rdx
	mov rdi, rbx
	call qword ptr [rip + memmove@GOTPCREL]
	mov qword ptr [r15], r12
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
	mov r14, rsi
	mov esi, 4
	mov r15, rdi
	mov r12, rdx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::prepare_allocation_range_in_another_chunk@GOTPCREL]
	test rax, rax
	je .LBB0_8
	mov rcx, rdx
	mov rdx, r12
	mov rsi, r14
	mov rdi, r15
	jmp .LBB0_0
.LBB0_8:
	xor ebx, ebx
	jmp .LBB0_6
