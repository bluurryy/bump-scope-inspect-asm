inspect_asm::shrink::up:
	mov rdx, r9
	mov rax, rsi
	lea rsi, [r8 - 1]
	test rsi, rax
	jne .LBB0_1
	lea r8, [rax + rcx]
	mov rsi, qword ptr [rdi]
	cmp r8, qword ptr [rsi]
	je .LBB0_0
	mov rdx, rcx
	ret
.LBB0_0:
	lea rcx, [rax + rdx]
	mov qword ptr [rsi], rcx
	ret
.LBB0_1:
	push rax
	mov rsi, rax
	mov r9, rdx
	call qword ptr [rip + bump_scope::allocator::shrink::shrink_unfit@GOTPCREL]
	add rsp, 8
	ret
