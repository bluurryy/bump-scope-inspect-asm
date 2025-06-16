inspect_asm::alloc_vec3::try_bumpalo_a:
	push rbx
	mov rcx, qword ptr [rdi + 16]
	mov rax, qword ptr [rcx + 32]
	mov rdx, rax
	sub rdx, qword ptr [rcx]
	cmp rdx, 12
	jb .LBB0_1
	add rax, -12
	mov qword ptr [rcx + 32], rax
	je .LBB0_1
.LBB0_0:
	mov ecx, dword ptr [rsi + 8]
	mov dword ptr [rax + 8], ecx
	mov rcx, qword ptr [rsi]
	mov qword ptr [rax], rcx
	pop rbx
	ret
.LBB0_1:
	mov rbx, rsi
	mov esi, 4
	mov edx, 12
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rsi, rbx
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	ret
