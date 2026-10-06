inspect_asm::alloc_u32::try_down:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	and rax, -4
	add rax, -4
	cmp rax, qword ptr [rcx + 8]
	jb .LBB0_1
	mov qword ptr [rcx], rax
.LBB0_0:
	mov dword ptr [rax], esi
	pop rbx
	ret
.LBB0_1:
	mov ebx, esi
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<1, false>>>::alloc_sized_in_another_chunk::<bump_scope::alloc::AllocError, core::mem::maybe_uninit::MaybeUninit<u32>>@GOTPCREL]
	mov esi, ebx
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	ret
