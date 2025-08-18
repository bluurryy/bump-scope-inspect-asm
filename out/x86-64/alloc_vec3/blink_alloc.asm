inspect_asm::alloc_vec3::blink_alloc:
	push rbx
	mov rcx, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_1
	mov rax, qword ptr [rcx]
	cmp rax, -16
	ja .LBB0_1
	add rax, 3
	and rax, -4
	lea rdx, [rax + 12]
	cmp rdx, qword ptr [rcx + 8]
	ja .LBB0_1
	mov qword ptr [rcx], rdx
.LBB0_0:
	mov ecx, dword ptr [rsi + 8]
	mov dword ptr [rax + 8], ecx
	mov rcx, qword ptr [rsi]
	mov qword ptr [rax], rcx
	pop rbx
	ret
.LBB0_1:
	mov rax, qword ptr [rdi + 8]
	mov edx, 4
	mov ecx, 12
	mov rbx, rsi
	mov rsi, rax
	call blink_alloc::arena::local::alloc_slow
	mov rsi, rbx
	test rax, rax
	jne .LBB0_0
	mov edi, 4
	call blink_alloc::blink::Emplace<A,T,R,S>::value::{{closure}}
