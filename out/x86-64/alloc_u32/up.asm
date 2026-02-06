inspect_asm::alloc_u32::up:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	add rax, 3
	and rax, -4
	lea rdx, [rax + 4]
	cmp rdx, qword ptr [rcx + 8]
	ja .LBB0_0
	mov qword ptr [rcx], rdx
	mov dword ptr [rax], esi
	pop rbx
	ret
.LBB0_0:
	mov ebx, esi
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_sized_in_another_chunk@GOTPCREL]
	mov esi, ebx
	mov dword ptr [rax], esi
	pop rbx
	ret
