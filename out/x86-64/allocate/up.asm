inspect_asm::allocate::up:
	mov rcx, qword ptr [rdi]
	mov r8, qword ptr [rcx]
	dec r8
	mov rax, rsi
	neg rax
	and rax, r8
	lea r9, [rdx + rsi]
	add r9, rax
	mov r8, -1
	cmovae r8, r9
	cmp r8, qword ptr [rcx + 8]
	ja .LBB0_0
	add rax, rsi
	mov qword ptr [rcx], r8
	ret
.LBB0_0:
	push rbx
	mov rbx, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings>>::alloc_in_another_chunk::<bump_scope::alloc::AllocError>@GOTPCREL]
	mov rdx, rbx
	pop rbx
	ret
