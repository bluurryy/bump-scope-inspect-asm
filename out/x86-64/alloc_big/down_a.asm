inspect_asm::alloc_big::down_a:
	push rbx
	mov rax, rdi
	mov rcx, qword ptr [rdi]
	mov rdx, qword ptr [rcx]
	xor edi, edi
	sub rdx, 512
	cmovae rdi, rdx
	and rdi, -512
	cmp rdi, qword ptr [rcx + 8]
	jb .LBB0_0
	mov qword ptr [rcx], rdi
	mov edx, 512
	pop rbx
	jmp qword ptr [rip + memcpy@GOTPCREL]
.LBB0_0:
	mov rdi, rax
	mov rbx, rsi
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4, false>>>::alloc_sized_in_another_chunk::<core::convert::Infallible, core::mem::maybe_uninit::MaybeUninit<inspect_asm::big>>@GOTPCREL]
	mov rsi, rbx
	mov rdi, rax
	mov edx, 512
	pop rbx
	jmp qword ptr [rip + memcpy@GOTPCREL]
