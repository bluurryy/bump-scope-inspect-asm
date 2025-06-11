inspect_asm::alloc_u8::blink_alloc:
	push rbx
	mov rcx, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_1
	mov rax, qword ptr [rcx]
	cmp rax, -1
	je .LBB0_1
	cmp rax, qword ptr [rcx + 8]
	jae .LBB0_1
	lea rdx, [rax + 1]
	mov qword ptr [rcx], rdx
	test rax, rax
	je .LBB0_1
.LBB0_0:
	mov byte ptr [rax], sil
	pop rbx
	ret
.LBB0_1:
	mov rax, qword ptr [rdi + 8]
	mov edx, 1
	mov ecx, 1
	mov ebx, esi
	mov rsi, rax
	call blink_alloc::arena::local::alloc_slow
	mov esi, ebx
	test rax, rax
	jne .LBB0_0
	mov edi, 1
	mov esi, 1
	call qword ptr [rip + alloc::alloc::handle_alloc_error@GOTPCREL]
