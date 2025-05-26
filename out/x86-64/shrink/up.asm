inspect_asm::shrink::up:
	lea rax, [r8 - 1]
	test rax, rsi
	jne .LBB0_1
	lea rdx, [rsi + rcx]
	mov rax, qword ptr [rdi]
	cmp rdx, qword ptr [rax]
	je .LBB0_0
	mov rax, rsi
	mov rdx, rcx
	ret
.LBB0_0:
	lea rcx, [r9 + rsi]
	mov qword ptr [rax], rcx
	mov rcx, r9
	mov rax, rsi
	mov rdx, rcx
	ret
.LBB0_1:
	jmp qword ptr [rip + bump_scope::allocator_impl::shrink::shrink_unfit@GOTPCREL]
