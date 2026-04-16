inspect_asm::alloc_iter_u32::try_mut_down:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	test rdx, rdx
	je .LBB0_5
	shl rdx, 2
	mov rax, qword ptr [rdi]
	mov rcx, qword ptr [rax]
	mov rax, qword ptr [rax + 8]
	and rcx, -4
	mov r8, rcx
	sub r8, rax
	cmp rdx, r8
	jg .LBB0_7
	add rax, 3
	and rax, -4
.LBB0_0:
	mov r8, rcx
	sub r8, rax
	mov rax, r8
	shr rax, 2
	and r8, -4
	sub rcx, r8
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rax
	mov qword ptr [rsp + 32], rdi
	xor r15d, r15d
	lea r14, [rsp + 8]
	mov r12, qword ptr [rip + bump_scope::mut_bump_vec::MutBumpVec<T,A>::generic_grow_amortized@GOTPCREL]
	xor ebx, ebx
.LBB0_1:
	mov ebp, dword ptr [rsi + r15]
	mov rax, rbx
	cmp qword ptr [rsp + 24], rbx
	je .LBB0_3
.LBB0_2:
	mov dword ptr [rcx + 4*rax], ebp
	lea rbx, [rax + 1]
	mov qword ptr [rsp + 16], rbx
	add r15, 4
	cmp rdx, r15
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov rbx, rsi
	mov r13, rdx
	mov esi, 1
	mov rdi, r14
	call r12
	test al, al
	jne .LBB0_8
	mov rcx, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 16]
	mov rdx, r13
	mov rsi, rbx
	jmp .LBB0_2
.LBB0_4:
	mov rcx, qword ptr [rsp + 24]
	test rcx, rcx
	je .LBB0_5
	mov rsi, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 32]
	mov r15, qword ptr [rdx]
	lea rcx, [rsi + 4*rcx]
	not rax
	lea r14, [rcx + 4*rax]
	lea rdx, [4*rbx]
	mov rdi, r14
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, r14
	mov qword ptr [r15], r14
	jmp .LBB0_6
.LBB0_5:
	mov eax, 4
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
	mov rcx, rdx
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r14
	jmp .LBB0_0
.LBB0_8:
	xor eax, eax
	jmp .LBB0_6
