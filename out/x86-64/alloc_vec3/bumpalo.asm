inspect_asm::alloc_vec3::bumpalo:
	push rbx
	mov rcx, qword ptr [rdi + 16]
	mov rax, qword ptr [rcx + 32]
	and rax, -4
	mov rdx, rax
	sub rdx, qword ptr [rcx]
	jb .LBB0_1
	cmp rdx, 12
	jb .LBB0_1
	add rax, -12
	mov qword ptr [rcx + 32], rax
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
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
