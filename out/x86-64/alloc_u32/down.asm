inspect_asm::alloc_u32::down:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	and rax, -4
	add rax, -4
	cmp rax, qword ptr [rcx + 8]
	jb .LBB0_0
	mov qword ptr [rcx], rax
	mov dword ptr [rax], esi
	pop rbx
	ret
.LBB0_0:
	mov ebx, esi
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<1, false>>>::alloc_sized_in_another_chunk::<core::convert::Infallible, core::mem::maybe_uninit::MaybeUninit<u32>>@GOTPCREL]
	mov esi, ebx
	mov dword ptr [rax], esi
	pop rbx
	ret
