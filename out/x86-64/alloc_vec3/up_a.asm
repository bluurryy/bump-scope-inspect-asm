inspect_asm::alloc_vec3::up_a:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	lea rdx, [rax + 12]
	cmp rdx, qword ptr [rcx + 8]
	ja .LBB0_1
	mov qword ptr [rcx], rdx
.LBB0_0:
	mov ecx, dword ptr [rsi + 8]
	mov dword ptr [rax + 8], ecx
	mov rcx, qword ptr [rsi]
	mov qword ptr [rax], rcx
	pop rbx
	ret
.LBB0_1:
	mov rbx, rsi
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4>>>::alloc_sized_in_another_chunk::<core::convert::Infallible, core::mem::maybe_uninit::MaybeUninit<[u32; 3]>>@GOTPCREL]
	mov rsi, rbx
	jmp .LBB0_0
