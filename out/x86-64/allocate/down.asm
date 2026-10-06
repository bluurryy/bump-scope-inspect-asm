inspect_asm::allocate::down:
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	xor r8d, r8d
	sub rax, rdx
	cmovae r8, rax
	mov rax, rsi
	neg rax
	and rax, r8
	cmp rax, qword ptr [rcx + 8]
	jb .LBB0_0
	mov qword ptr [rcx], rax
	ret
.LBB0_0:
	push rbx
	mov rbx, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<1, false>>>::alloc_in_another_chunk::<bump_scope::alloc::AllocError>@GOTPCREL]
	mov rdx, rbx
	pop rbx
	ret
