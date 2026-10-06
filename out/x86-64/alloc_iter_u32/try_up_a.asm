inspect_asm::alloc_iter_u32::try_up_a:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	test rdx, rdx
	je .LBB0_5
	lea r14, [4*rdx]
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov r8, qword ptr [rcx + 8]
	sub r8, rax
	cmp r14, r8
	jg .LBB0_7
	lea r8, [r14 + rax]
	mov qword ptr [rcx], r8
.LBB0_0:
	mov qword ptr [rsp], rax
	mov qword ptr [rsp + 8], 0
	mov qword ptr [rsp + 16], rdx
	mov qword ptr [rsp + 24], rdi
	mov r15, -3
	xor edx, edx
	mov rbx, rsp
	mov r12, qword ptr [rip + bump_scope::bump_vec::BumpVec<T,A>::generic_grow_amortized@GOTPCREL]
.LBB0_1:
	mov ebp, dword ptr [rsi + 4*rdx]
	cmp rdx, qword ptr [rsp + 16]
	je .LBB0_3
.LBB0_2:
	mov dword ptr [rax + 4*rdx], ebp
	inc rdx
	mov qword ptr [rsp + 8], rdx
	lea rcx, [r14 + r15]
	add rcx, -4
	add r15, -4
	cmp rcx, -3
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov qword ptr [rsp + 32], rsi
	mov r13, rdx
	mov esi, 1
	mov rdi, rbx
	call r12
	test al, al
	jne .LBB0_8
	mov rax, qword ptr [rsp]
	mov rdx, r13
	mov rsi, qword ptr [rsp + 32]
	jmp .LBB0_2
.LBB0_4:
	mov rax, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 16]
	cmp rsi, rdx
	jbe .LBB0_6
	mov rcx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rcx]
	lea rsi, [rax + 4*rsi]
	cmp rsi, qword ptr [rcx]
	jne .LBB0_6
	mov rsi, rax
	sub rsi, r15
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
	mov rbx, rdi
	mov r15, rsi
	mov rsi, rdx
	mov r12, rdx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_slice_in_another_chunk@GOTPCREL]
	mov rdi, rbx
	mov rdx, r12
	mov rsi, r15
	test rax, rax
	jne .LBB0_0
	jmp .LBB0_9
.LBB0_8:
	mov rcx, qword ptr [rsp + 16]
	test rcx, rcx
	je .LBB0_9
	mov rax, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 24]
	lea rsi, [rax + 4*rcx]
	mov rcx, qword ptr [rdx]
	cmp rsi, qword ptr [rcx]
	jne .LBB0_9
	add rax, 3
	and rax, -4
	mov qword ptr [rcx], rax
.LBB0_9:
	xor eax, eax
	jmp .LBB0_6
