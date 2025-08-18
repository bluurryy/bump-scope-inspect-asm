inspect_asm::alloc_big::try_bumpalo_a:
	push rbx
	mov rax, rdi
	mov rcx, qword ptr [rdi + 16]
	mov rdi, -512
	and rdi, qword ptr [rcx + 32]
	mov rdx, rdi
	sub rdx, qword ptr [rcx]
	jb .LBB0_1
	cmp rdx, 512
	jb .LBB0_1
	add rdi, -512
	mov qword ptr [rcx + 32], rdi
.LBB0_0:
	mov edx, 512
	pop rbx
	jmp qword ptr [rip + memcpy@GOTPCREL]
.LBB0_1:
	mov rbx, rsi
	mov esi, 512
	mov edx, 512
	mov rdi, rax
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rsi, rbx
	mov rdi, rax
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	ret
