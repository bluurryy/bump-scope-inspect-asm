inspect_asm::alloc_u8::bumpalo_a:
	push rbx
	mov rcx, qword ptr [rdi + 16]
	mov rax, qword ptr [rcx + 32]
	mov rdx, rax
	sub rdx, qword ptr [rcx]
	cmp rdx, 4
	jb .LBB0_1
	add rax, -4
	mov qword ptr [rcx + 32], rax
	je .LBB0_1
.LBB0_0:
	mov byte ptr [rax], sil
	pop rbx
	ret
.LBB0_1:
	mov ebx, esi
	mov esi, 1
	mov edx, 1
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov esi, ebx
	test rax, rax
	jne .LBB0_0
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
