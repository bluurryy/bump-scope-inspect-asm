inspect_asm::alloc_iter_u32::try_mut_down_a:
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
	mov r9, r8
	sub r9, rcx
	cmp rdx, r9
	ja .LBB0_9
	add rcx, 3
	and rcx, -4
	je .LBB0_9
.LBB0_2:
	sub r8, rcx
	shr r8, 2
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], r8
	mov qword ptr [rsp + 32], rdi
	lea r14, [rsp + 8]
	mov r15, qword ptr [rip + bump_scope::mut_bump_vec::MutBumpVec<T,A>::generic_grow_amortized@GOTPCREL]
	xor r12d, r12d
	xor ebx, ebx
.LBB0_3:
	mov ebp, dword ptr [rsi + r12]
	mov rdi, rbx
	cmp qword ptr [rsp + 24], rbx
	je .LBB0_5
.LBB0_4:
	mov dword ptr [rcx + 4*rdi], ebp
	lea rbx, [rdi + 1]
	mov qword ptr [rsp + 16], rbx
	add r12, 4
	cmp rdx, r12
	jne .LBB0_3
	jmp .LBB0_6
.LBB0_5:
	mov rbx, rsi
	mov r13, rdx
	mov esi, 1
	mov rdi, r14
	call r15
	test al, al
	jne .LBB0_10
	mov rcx, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 16]
	mov eax, 4
	mov rdx, r13
	mov rsi, rbx
	jmp .LBB0_4
.LBB0_6:
	mov rcx, qword ptr [rsp + 24]
	test rcx, rcx
	je .LBB0_7
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
	mov rbx, rsi
	mov esi, 4
	mov r14, rdi
	mov r15, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::prepare_allocation_range_in_another_chunk@GOTPCREL]
	test rax, rax
	je .LBB0_0
	mov rcx, rax
	mov r8, rdx
	mov eax, 4
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r14
	jmp .LBB0_2
.LBB0_10:
	xor eax, eax
	jmp .LBB0_8
