inspect_asm::alloc_u32::try_bumpalo:
	push rbx
	mov rcx, qword ptr [rdi + 16]
	mov rax, qword ptr [rcx + 32]
	and rax, -4
	mov rdx, rax
	sub rdx, qword ptr [rcx]
	jb .LBB0_1
	cmp rdx, 4
	jb .LBB0_1
	add rax, -4
	mov qword ptr [rcx + 32], rax
	je .LBB0_1
.LBB0_0:
	mov dword ptr [rax], esi
	pop rbx
	ret
.LBB0_1:
	mov ebx, esi
	mov esi, 4
	mov edx, 4
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov esi, ebx
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	ret
