inspect_asm::alloc_layout::blink_alloc:
	push rax
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
	pop rcx
	ret
.LBB0_0:
	mov rsi, qword ptr [rdi + 8]
	call blink_alloc::arena::local::alloc_slow
	test rax, rax
	je .LBB0_1
	pop rcx
	ret
.LBB0_1:
	lea rdi, [rip + .Lanon.facade.0]
	lea rcx, [rip + .Lanon.facade.1]
	lea r8, [rip + .Lanon.facade.15]
	lea rdx, [rsp + 7]
	mov esi, 43
	call qword ptr [rip + core::result::unwrap_failed@GOTPCREL]
