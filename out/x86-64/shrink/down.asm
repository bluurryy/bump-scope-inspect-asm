inspect_asm::shrink::down:
	lea rax, [r8 - 1]
	test rax, rsi
	jne .LBB0_1
	mov rax, qword ptr [rdi]
	cmp rsi, qword ptr [rax]
	je .LBB0_0
	mov rax, rsi
	mov rdx, rcx
	ret
.LBB0_0:
	push r15
	push r14
	push rbx
	add rcx, rsi
	xor eax, eax
	sub rcx, r9
	cmovae rax, rcx
	neg r8
	and r8, rax
	mov rbx, rdi
	mov rdi, r8
	mov rdx, r9
	mov r14, r9
	mov r15, r8
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, qword ptr [rbx]
	mov qword ptr [rax], r15
	mov rsi, r15
	mov rcx, r14
	pop rbx
	pop r14
	pop r15
	mov rax, rsi
	mov rdx, rcx
	ret
.LBB0_1:
	jmp qword ptr [rip + bump_scope::allocator_impl::shrink::shrink_unfit::<0x87920000000000000000000000000000, alloc::alloc::Global, false>@GOTPCREL]
