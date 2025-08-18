inspect_asm::alloc_zst::blink_alloc:
	push rax
	mov rcx, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_1
	mov rax, qword ptr [rcx]
	cmp rax, qword ptr [rcx + 8]
	ja .LBB0_1
.LBB0_0:
	pop rcx
	ret
.LBB0_1:
	mov rsi, qword ptr [rdi + 8]
	mov edx, 1
	xor ecx, ecx
	call blink_alloc::arena::local::alloc_slow
	test rax, rax
	jne .LBB0_0
	call blink_alloc::blink::Emplace<A,T,R,S>::value::{{closure}}
