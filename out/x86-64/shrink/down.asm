inspect_asm::shrink::down:
	push r15
	push r14
	push rbx
	lea rax, [r8 - 1]
	test rax, rsi
	jne .LBB0_3
	mov rax, qword ptr [rdi]
	cmp qword ptr [rax], rsi
	je .LBB0_0
	mov rdx, rcx
	mov rax, rsi
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_0:
	mov rbx, rdi
	add rcx, rsi
	xor eax, eax
	sub rcx, r9
	cmovae rax, rcx
	neg r8
	and r8, rax
	lea rax, [rsi + r9]
	mov r14, r8
	mov rdi, r8
	mov r15, r9
	mov rdx, r9
	cmp rax, r8
	jbe .LBB0_1
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_2
.LBB0_1:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_2:
	mov rcx, qword ptr [rbx]
	mov rax, r14
	mov qword ptr [rcx], r14
	mov rdx, r15
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_3:
	call qword ptr [rip + bump_scope::allocator::shrink::shrink_unfit@GOTPCREL]
	pop rbx
	pop r14
	pop r15
	ret
