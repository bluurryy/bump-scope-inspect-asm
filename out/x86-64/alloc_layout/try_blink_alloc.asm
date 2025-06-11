inspect_asm::alloc_layout::try_blink_alloc:
	mov rcx, rdx
	mov rdx, rsi
	mov rsi, qword ptr [rdi]
	test rsi, rsi
	je .LBB0_0
	mov r8, qword ptr [rsi]
	lea rax, [rdx + rcx]
	dec rax
	add rax, r8
	jb .LBB0_0
	lea r9, [rdx - 1]
	add r9, r8
	mov rax, rdx
	neg rax
	and rax, r9
	lea r9, [rax + rcx]
	cmp r9, qword ptr [rsi + 8]
	ja .LBB0_0
	mov qword ptr [rsi], r9
	test r8, r8
	je .LBB0_0
	ret
.LBB0_0:
	push rax
	mov rsi, qword ptr [rdi + 8]
	call blink_alloc::arena::local::alloc_slow
	add rsp, 8
	ret
