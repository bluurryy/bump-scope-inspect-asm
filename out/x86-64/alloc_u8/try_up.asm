inspect_asm::alloc_u8::try_up:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	lea rdx, [rax + 1]
	cmp rdx, qword ptr [rcx + 8]
	ja .LBB0_1
	mov qword ptr [rcx], rdx
.LBB0_0:
	mov byte ptr [rax], sil
	pop rbx
	ret
.LBB0_1:
	mov ebx, esi
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings>>::alloc_sized_in_another_chunk::<bump_scope::alloc::AllocError, core::mem::maybe_uninit::MaybeUninit<u8>>@GOTPCREL]
	mov esi, ebx
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	ret
