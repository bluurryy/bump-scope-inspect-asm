inspect_asm::alloc_overaligned_but_size_matches::up:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	lea rdx, [rax + 4]
	cmp rdx, qword ptr [rcx + 8]
	ja .LBB0_0
	mov qword ptr [rcx], rdx
	mov dword ptr [rax], esi
	pop rbx
	ret
.LBB0_0:
	mov ebx, esi
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4>>>::alloc_sized_in_another_chunk::<core::convert::Infallible, core::mem::maybe_uninit::MaybeUninit<[u8; 4]>>@GOTPCREL]
	mov esi, ebx
	mov dword ptr [rax], esi
	pop rbx
	ret
