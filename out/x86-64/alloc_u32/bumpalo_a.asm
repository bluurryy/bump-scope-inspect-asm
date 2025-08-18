inspect_asm::alloc_u32::bumpalo_a:
	push rbx
	mov rcx, qword ptr [rdi + 16]
	mov rax, qword ptr [rcx + 32]
	mov rdx, rax
	sub rdx, qword ptr [rcx]
	cmp rdx, 4
	jb .LBB0_1
	add rax, -4
	mov qword ptr [rcx + 32], rax
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
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
