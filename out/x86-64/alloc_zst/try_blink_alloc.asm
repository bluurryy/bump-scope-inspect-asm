inspect_asm::alloc_zst::try_blink_alloc:
	mov rcx, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_0
	mov rax, qword ptr [rcx]
	cmp rax, qword ptr [rcx + 8]
	ja .LBB0_0
	ret
.LBB0_0:
	push rax
	mov rsi, qword ptr [rdi + 8]
	mov edx, 1
	xor ecx, ecx
	call blink_alloc::arena::local::alloc_slow
	add rsp, 8
	ret
