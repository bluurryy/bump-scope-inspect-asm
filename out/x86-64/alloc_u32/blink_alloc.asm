inspect_asm::alloc_u32::blink_alloc:
	push rbx
	mov rcx, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_1
	mov rdx, qword ptr [rcx]
	cmp rdx, -8
	ja .LBB0_1
	lea rax, [rdx + 3]
	and rax, -4
	lea r8, [rax + 4]
	cmp r8, qword ptr [rcx + 8]
	ja .LBB0_1
	mov qword ptr [rcx], r8
	test rdx, rdx
	je .LBB0_1
.LBB0_0:
	mov dword ptr [rax], esi
	pop rbx
	ret
.LBB0_1:
	mov rax, qword ptr [rdi + 8]
	mov edx, 4
	mov ecx, 4
	mov ebx, esi
	mov rsi, rax
	call blink_alloc::arena::local::alloc_slow
	mov esi, ebx
	test rax, rax
	jne .LBB0_0
	mov edi, 4
	mov esi, 4
	call qword ptr [rip + alloc::alloc::handle_alloc_error@GOTPCREL]
