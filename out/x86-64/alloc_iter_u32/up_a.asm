inspect_asm::alloc_iter_u32::up_a:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	test rdx, rdx
	je .LBB0_5
	mov rax, rdx
	shr rax, 61
	jne .LBB0_8
	mov rbx, rsi
	lea r15, [4*rdx]
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rsi, qword ptr [rcx + 8]
	sub rsi, rax
	cmp r15, rsi
	jg .LBB0_7
	lea rsi, [r15 + rax]
	mov qword ptr [rcx], rsi
.LBB0_0:
	mov qword ptr [rsp + 8], rax
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 32], rdi
	xor r12d, r12d
	lea r14, [rsp + 8]
	mov r13, qword ptr [rip + bump_scope::bump_vec::BumpVec<T,A>::generic_grow_amortized@GOTPCREL]
	xor edx, edx
.LBB0_1:
	mov ebp, dword ptr [rbx + r12]
	cmp qword ptr [rsp + 24], rdx
	je .LBB0_3
.LBB0_2:
	mov dword ptr [rax + 4*rdx], ebp
	inc rdx
	mov qword ptr [rsp + 16], rdx
	add r12, 4
	cmp r15, r12
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov esi, 1
	mov rdi, r14
	call r13
	mov rax, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 16]
	jmp .LBB0_2
.LBB0_4:
	mov rax, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 24]
	test rsi, rsi
	je .LBB0_6
	mov rcx, qword ptr [rsp + 32]
	mov rcx, qword ptr [rcx]
	lea rsi, [rax + 4*rsi]
	cmp rsi, qword ptr [rcx]
	jne .LBB0_6
	lea rsi, [rax + 4*rdx]
	add rsi, 3
	and rsi, -4
	mov qword ptr [rcx], rsi
	jmp .LBB0_6
.LBB0_5:
	mov eax, 4
	xor edx, edx
.LBB0_6:
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_7:
	mov r14, rdi
	mov rsi, rdx
	mov r12, rdx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_slice_in_another_chunk@GOTPCREL]
	mov rdi, r14
	mov rdx, r12
	jmp .LBB0_0
.LBB0_8:
	call qword ptr [rip + bump_scope::private::capacity_overflow@GOTPCREL]
	mov rdx, qword ptr [rsp + 24]
	test rdx, rdx
	je .LBB0_9
	mov rcx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 32]
	lea rdi, [rcx + 4*rdx]
	mov rdx, qword ptr [rsi]
	cmp rdi, qword ptr [rdx]
	jne .LBB0_9
	add rcx, 3
	and rcx, -4
	mov qword ptr [rdx], rcx
.LBB0_9:
	mov rdi, rax
	call _Unwind_Resume@PLT
