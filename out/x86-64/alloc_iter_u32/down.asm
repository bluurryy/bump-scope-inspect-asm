inspect_asm::alloc_iter_u32::down:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	test rdx, rdx
	je .LBB0_6
	mov rax, rdx
	shr rax, 61
	jne .LBB0_12
	mov rbx, rsi
	lea r15, [4*rdx]
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rsi, rax
	sub rsi, qword ptr [rcx + 8]
	cmp r15, rsi
	jg .LBB0_11
	sub rax, r15
	and rax, -4
	mov qword ptr [rcx], rax
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
	mov rsi, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 24]
	test rax, rax
	je .LBB0_5
	mov rcx, qword ptr [rsp + 32]
	mov r14, qword ptr [rcx]
	cmp rsi, qword ptr [r14]
	je .LBB0_7
.LBB0_5:
	mov rax, rsi
	jmp .LBB0_10
.LBB0_6:
	mov eax, 4
	xor edx, edx
	jmp .LBB0_10
.LBB0_7:
	mov rbx, rdx
	lea rdx, [4*rdx]
	lea rax, [rsi + 4*rax]
	xor edi, edi
	sub rax, rdx
	cmovae rdi, rax
	and rdi, -4
	lea rax, [rdx + rsi]
	mov r15, rdi
	cmp rax, rdi
	jbe .LBB0_8
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_9
.LBB0_8:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_9:
	mov rax, r15
	mov qword ptr [r14], r15
	mov rdx, rbx
.LBB0_10:
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_11:
	mov r14, rdi
	mov rsi, rdx
	mov r12, rdx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_slice_in_another_chunk@GOTPCREL]
	mov rdi, r14
	mov rdx, r12
	jmp .LBB0_0
.LBB0_12:
	call qword ptr [rip + bump_scope::private::capacity_overflow@GOTPCREL]
	mov rcx, qword ptr [rsp + 24]
	test rcx, rcx
	je .LBB0_13
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 32]
	mov rsi, qword ptr [rsi]
	cmp rdx, qword ptr [rsi]
	jne .LBB0_13
	lea rcx, [rdx + 4*rcx]
	mov qword ptr [rsi], rcx
.LBB0_13:
	mov rdi, rax
	call _Unwind_Resume@PLT
