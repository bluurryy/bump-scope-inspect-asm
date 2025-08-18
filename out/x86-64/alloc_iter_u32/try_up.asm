inspect_asm::alloc_iter_u32::try_up:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	test rdx, rdx
	je .LBB0_1
	mov rax, rdx
	shr rax, 61
	je .LBB0_2
.LBB0_0:
	xor eax, eax
	jmp .LBB0_9
.LBB0_1:
	mov eax, 4
	xor ecx, ecx
	xor edx, edx
	mov rsi, qword ptr [rdi]
	add rcx, rax
	cmp rcx, qword ptr [rsi]
	jne .LBB0_9
	jmp .LBB0_8
.LBB0_2:
	mov rbx, rsi
	lea r15, [4*rdx]
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rsi, qword ptr [rcx + 8]
	add rax, 3
	and rax, -4
	sub rsi, rax
	cmp r15, rsi
	ja .LBB0_10
	lea rsi, [rax + r15]
	mov qword ptr [rcx], rsi
.LBB0_3:
	mov qword ptr [rsp + 8], rax
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 32], rdi
	xor r12d, r12d
	lea r14, [rsp + 8]
	mov r13, qword ptr [rip + bump_scope::bump_vec::BumpVec<T,A>::generic_grow_amortized@GOTPCREL]
	xor edx, edx
.LBB0_4:
	mov ebp, dword ptr [rbx + r12]
	cmp qword ptr [rsp + 24], rdx
	je .LBB0_6
.LBB0_5:
	mov dword ptr [rax + 4*rdx], ebp
	inc rdx
	mov qword ptr [rsp + 16], rdx
	add r12, 4
	cmp r15, r12
	jne .LBB0_4
	jmp .LBB0_7
.LBB0_6:
	mov esi, 1
	mov rdi, r14
	call r13
	test al, al
	jne .LBB0_11
	mov rax, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 16]
	jmp .LBB0_5
.LBB0_7:
	mov rax, qword ptr [rsp + 8]
	mov rcx, qword ptr [rsp + 24]
	mov rdi, qword ptr [rsp + 32]
	shl rcx, 2
	mov rsi, qword ptr [rdi]
	add rcx, rax
	cmp rcx, qword ptr [rsi]
	jne .LBB0_9
.LBB0_8:
	lea rcx, [rax + 4*rdx]
	mov qword ptr [rsi], rcx
.LBB0_9:
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_10:
	mov r14, rdi
	mov rsi, rdx
	mov r12, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::do_alloc_slice_in_another_chunk@GOTPCREL]
	mov rdx, r12
	mov rdi, r14
	test rax, rax
	jne .LBB0_3
	jmp .LBB0_0
.LBB0_11:
	mov rax, qword ptr [rsp + 8]
	mov rcx, qword ptr [rsp + 24]
	mov rdx, qword ptr [rsp + 32]
	lea rsi, [rax + 4*rcx]
	mov rcx, qword ptr [rdx]
	cmp rsi, qword ptr [rcx]
	jne .LBB0_0
	mov qword ptr [rcx], rax
	xor eax, eax
	jmp .LBB0_9
	mov rcx, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsp + 32]
	lea rdi, [rcx + 4*rdx]
	mov rdx, qword ptr [rsi]
	cmp rdi, qword ptr [rdx]
	jne .LBB0_12
	mov qword ptr [rdx], rcx
.LBB0_12:
	mov rdi, rax
	call _Unwind_Resume@PLT
