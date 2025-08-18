inspect_asm::allocate::blink_alloc:
	mov rcx, rdx
	mov rdx, rsi
	mov rsi, qword ptr [rdi]
	test rsi, rsi
	je .LBB0_0
	mov rax, qword ptr [rsi]
	lea r8, [rdx + rcx]
	dec r8
	add r8, rax
	jb .LBB0_0
	lea r8, [rdx - 1]
	add r8, rax
	mov rax, rdx
	neg rax
	and rax, r8
	lea r8, [rax + rcx]
	cmp r8, qword ptr [rsi + 8]
	ja .LBB0_0
	mov qword ptr [rsi], r8
	mov rdx, rcx
	ret
.LBB0_0:
	mov rsi, qword ptr [rdi + 8]
	jmp blink_alloc::arena::local::alloc_slow
