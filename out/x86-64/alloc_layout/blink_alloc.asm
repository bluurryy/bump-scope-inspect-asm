inspect_asm::alloc_layout::blink_alloc:
	push rax
	mov rcx, rdx
	mov rdx, rsi
	mov rsi, qword ptr [rdi]
	test rsi, rsi
	je .LBB0_1
	mov r8, qword ptr [rsi]
	lea rax, [rdx + rcx]
	dec rax
	add rax, r8
	jb .LBB0_1
	lea r9, [rdx - 1]
	add r9, r8
	mov rax, rdx
	neg rax
	and rax, r9
	lea r9, [rax + rcx]
	cmp r9, qword ptr [rsi + 8]
	ja .LBB0_1
	mov qword ptr [rsi], r9
	test r8, r8
	je .LBB0_1
.LBB0_0:
	pop rcx
	ret
.LBB0_1:
	mov rsi, qword ptr [rdi + 8]
	call blink_alloc::arena::local::alloc_slow
	test rax, rax
	jne .LBB0_0
	lea rdi, [rip + .Lanon.facade.0]
	lea rcx, [rip + .Lanon.facade.1]
	lea r8, [rip + .Lanon.facade.15]
	lea rdx, [rsp + 7]
	mov esi, 43
	call qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
