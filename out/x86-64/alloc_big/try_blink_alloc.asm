inspect_asm::alloc_big::try_blink_alloc:
	push rbx
	mov rcx, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_1
	mov rdx, qword ptr [rcx]
	cmp rdx, -1024
	ja .LBB0_1
	lea rax, [rdx + 511]
	and rax, -512
	lea r8, [rax + 512]
	cmp r8, qword ptr [rcx + 8]
	ja .LBB0_1
	mov qword ptr [rcx], r8
	test rdx, rdx
	je .LBB0_1
.LBB0_0:
	mov edx, 512
	mov rdi, rax
	pop rbx
	jmp qword ptr [rip + memcpy@GOTPCREL]
.LBB0_1:
	mov rax, qword ptr [rdi + 8]
	mov edx, 512
	mov ecx, 512
	mov rbx, rsi
	mov rsi, rax
	call blink_alloc::arena::local::alloc_slow
	mov rsi, rbx
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	ret
