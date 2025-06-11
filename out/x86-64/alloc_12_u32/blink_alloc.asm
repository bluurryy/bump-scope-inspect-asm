inspect_asm::alloc_12_u32::blink_alloc:
	push rbx
	mov rcx, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_1
	mov rdx, qword ptr [rcx]
	cmp rdx, -52
	ja .LBB0_1
	lea rax, [rdx + 3]
	and rax, -4
	lea r8, [rax + 48]
	cmp r8, qword ptr [rcx + 8]
	ja .LBB0_1
	mov qword ptr [rcx], r8
	test rdx, rdx
	je .LBB0_1
.LBB0_0:
	movups xmm0, xmmword ptr [rsi]
	movups xmm1, xmmword ptr [rsi + 16]
	movups xmm2, xmmword ptr [rsi + 32]
	movups xmmword ptr [rax + 32], xmm2
	movups xmmword ptr [rax + 16], xmm1
	movups xmmword ptr [rax], xmm0
	pop rbx
	ret
.LBB0_1:
	mov rax, qword ptr [rdi + 8]
	mov edx, 4
	mov ecx, 48
	mov rbx, rsi
	mov rsi, rax
	call blink_alloc::arena::local::alloc_slow
	mov rsi, rbx
	test rax, rax
	jne .LBB0_0
	mov edi, 4
	call blink_alloc::blink::Emplace<A,T,R,S>::value::{{closure}}
