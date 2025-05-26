inspect_asm::shrink::down:
	push r15
	push r14
	push rbx
	mov rbx, r9
	lea rax, [r8 - 1]
	test rax, rsi
	jne .LBB0_4
	mov rax, qword ptr [rdi]
	cmp rsi, qword ptr [rax]
	je .LBB0_0
	mov rax, rsi
	mov rbx, rcx
	jmp .LBB0_3
.LBB0_0:
	mov r14, rdi
	add rcx, rsi
	xor eax, eax
	sub rcx, rbx
	cmovae rax, rcx
	neg r8
	and r8, rax
	lea rax, [rbx + rsi]
	mov r15, r8
	mov rdi, r8
	mov rdx, rbx
	cmp rax, r8
	jbe .LBB0_1
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_2
.LBB0_1:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_2:
	mov rcx, qword ptr [r14]
	mov rax, r15
	mov qword ptr [rcx], r15
.LBB0_3:
	mov rdx, rbx
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_4:
	mov r9, rbx
	pop rbx
	pop r14
	pop r15
	jmp qword ptr [rip + bump_scope::allocator_impl::shrink::shrink_unfit@GOTPCREL]
