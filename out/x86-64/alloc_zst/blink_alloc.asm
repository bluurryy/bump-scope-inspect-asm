inspect_asm::alloc_zst::blink_alloc:
	push rax
	mov rcx, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_0
	mov rax, qword ptr [rcx]
	test rax, rax
	je .LBB0_0
	cmp rax, qword ptr [rcx + 8]
	jbe .LBB0_1
.LBB0_0:
	mov rsi, qword ptr [rdi + 8]
	mov edx, 1
	xor ecx, ecx
	call blink_alloc::arena::local::alloc_slow
	test rax, rax
	je .LBB0_2
.LBB0_1:
	pop rcx
	ret
.LBB0_2:
	call blink_alloc::blink::Emplace<A,T,R,S>::value::{{closure}}
