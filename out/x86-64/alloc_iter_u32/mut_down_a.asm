inspect_asm::alloc_iter_u32::mut_down_a:
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
	mov rcx, rdx
	shr rcx, 61
	jne .LBB0_8
	shl rdx, 2
	mov r8, qword ptr [rdi]
	mov rcx, qword ptr [r8]
	mov r8, qword ptr [r8 + 8]
	mov r9, rcx
	sub r9, r8
	cmp rdx, r9
	ja .LBB0_7
	add r8, 3
	and r8, -4
.LBB0_0:
	mov r9, rcx
	sub r9, r8
	mov r8, r9
	shr r8, 2
	and r9, -4
	sub rcx, r9
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], r8
	mov qword ptr [rsp + 32], rdi
	xor r15d, r15d
	lea r14, [rsp + 8]
	mov r12, qword ptr [rip + bump_scope::mut_bump_vec::MutBumpVec<T,A>::generic_grow_amortized@GOTPCREL]
	xor ebx, ebx
.LBB0_1:
	mov ebp, dword ptr [rsi + r15]
	mov rdi, rbx
	cmp qword ptr [rsp + 24], rbx
	je .LBB0_3
.LBB0_2:
	mov dword ptr [rcx + 4*rdi], ebp
	lea rbx, [rdi + 1]
	mov qword ptr [rsp + 16], rbx
	add r15, 4
	cmp rdx, r15
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov rbx, rsi
	mov esi, 1
	mov rdi, r14
	mov r13, rdx
	call r12
	mov rsi, rbx
	mov rdx, r13
	mov eax, 4
	mov rcx, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 16]
	jmp .LBB0_2
.LBB0_4:
	mov rcx, qword ptr [rsp + 24]
	test rcx, rcx
	je .LBB0_5
	mov rsi, qword ptr [rsp + 8]
	mov r15, qword ptr [rsp + 32]
	lea rax, [rsi + 4*rcx]
	not rdi
	lea r14, [rax + 4*rdi]
	lea rdx, [4*rbx]
	mov rdi, r14
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, r14
	mov rcx, qword ptr [r15]
	mov qword ptr [rcx], r14
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
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::prepare_allocation_range_in_another_chunk@GOTPCREL]
	mov rdi, r14
	mov rsi, r15
	mov r8, rax
	mov eax, 4
	mov rcx, rdx
	mov rdx, rbx
	jmp .LBB0_0
.LBB0_8:
	call qword ptr [rip + bump_scope::private::capacity_overflow@GOTPCREL]
