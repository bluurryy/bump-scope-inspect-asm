inspect_asm::alloc_big::try_blink_alloc:
	push rbx
	mov rax, rdi
	mov rcx, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_1
	mov rdi, qword ptr [rcx]
	cmp rdi, -1024
	ja .LBB0_1
	add rdi, 511
	and rdi, -512
	lea rdx, [rdi + 512]
	cmp rdx, qword ptr [rcx + 8]
	ja .LBB0_1
	mov qword ptr [rcx], rdx
.LBB0_0:
	mov edx, 512
	pop rbx
	jmp qword ptr [rip + memcpy@GOTPCREL]
.LBB0_1:
	mov r8, qword ptr [rax + 8]
	mov edx, 512
	mov ecx, 512
	mov rdi, rax
	mov rbx, rsi
	mov rsi, r8
	call blink_alloc::arena::local::alloc_slow
	mov rsi, rbx
	mov rdi, rax
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	ret
