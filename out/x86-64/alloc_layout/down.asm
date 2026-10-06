inspect_asm::alloc_layout::down:
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
	jmp qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<1, false>>>::alloc_in_another_chunk::<core::convert::Infallible>@GOTPCREL]
