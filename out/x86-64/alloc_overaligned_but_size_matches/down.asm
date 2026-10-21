inspect_asm::alloc_overaligned_but_size_matches::down:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	add rax, -4
	cmp rax, qword ptr [rcx + 8]
	jb .LBB0_0
	mov qword ptr [rcx], rax
	mov dword ptr [rax], esi
	pop rbx
	ret
.LBB0_0:
	mov ebx, esi
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<alloc::alloc::Global, 0x47240000000000000000000000000000>>::alloc_sized_in_another_chunk::<!, core::mem::maybe_uninit::MaybeUninit<[u8; 4]>>@GOTPCREL]
	mov esi, ebx
	mov dword ptr [rax], esi
	pop rbx
	ret
