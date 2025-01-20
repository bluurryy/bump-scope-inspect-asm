inspect_asm::alloc_iter_u32::try_mut_down:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	test rdx, rdx
	je .LBB0_7
	mov rax, rdx
	shr rax, 61
	je .LBB0_1
.LBB0_0:
	xor eax, eax
	jmp .LBB0_8
.LBB0_1:
	shl rdx, 2
	mov rax, qword ptr [rdi]
	mov rcx, qword ptr [rax]
	mov rax, qword ptr [rax + 8]
	and rcx, -4
	mov r8, rcx
	sub r8, rax
	cmp rdx, r8
	ja .LBB0_9
	add rax, 3
	and rax, -4
	je .LBB0_9
.LBB0_2:
	sub rcx, rax
	shr rcx, 2
	mov qword ptr [rsp + 8], rax
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rcx
	mov qword ptr [rsp + 32], rdi
	xor r15d, r15d
	lea r14, [rsp + 8]
	mov r12, qword ptr [rip + bump_scope::mut_bump_vec::MutBumpVec<T,A>::generic_grow_amortized@GOTPCREL]
	xor ebx, ebx
.LBB0_3:
	mov ebp, dword ptr [rsi + r15]
	mov rcx, rbx
	cmp qword ptr [rsp + 24], rbx
	je .LBB0_5
.LBB0_4:
	mov dword ptr [rax + 4*rcx], ebp
	lea rbx, [rcx + 1]
	mov qword ptr [rsp + 16], rbx
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
	test al, al
	jne .LBB0_0
	mov rsi, rbx
	mov rdx, r13
	mov rax, qword ptr [rsp + 8]
	mov rcx, qword ptr [rsp + 16]
	jmp .LBB0_4
.LBB0_6:
	mov rax, qword ptr [rsp + 24]
	test rax, rax
	je .LBB0_7
	mov rsi, qword ptr [rsp + 8]
	mov r15, qword ptr [rsp + 32]
	lea rax, [rsi + 4*rax]
	not rcx
	lea r14, [rax + 4*rcx]
	lea rdx, [4*rbx]
	mov rdi, r14
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, r14
	mov rcx, qword ptr [r15]
	mov qword ptr [rcx], r14
	jmp .LBB0_8
.LBB0_7:
	mov eax, 4
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
	test rax, rax
	je .LBB0_0
	mov rdi, r14
	mov rsi, r15
	mov rcx, rdx
	mov rdx, rbx
	jmp .LBB0_2
