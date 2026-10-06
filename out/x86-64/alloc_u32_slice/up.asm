inspect_asm::alloc_u32_slice::up:
	push r15
	push r14
	push rbx
	mov rbx, rdx
	lea rdx, [4*rdx]
	mov rax, qword ptr [rdi]
	mov r14, qword ptr [rax]
	mov rcx, qword ptr [rax + 8]
	add r14, 3
	and r14, -4
	sub rcx, r14
	cmp rdx, rcx
	jg .LBB0_1
	lea rcx, [r14 + rdx]
	mov qword ptr [rax], rcx
.LBB0_0:
	mov rdi, r14
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rax, r14
	mov rdx, rbx
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_1:
	mov r14, rsi
	mov rsi, rbx
	mov r15, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings>>::alloc_slice_in_another_chunk::<core::convert::Infallible, core::option::Option<core::num::nonzero::NonZero<u32>>>@GOTPCREL]
	mov rdx, r15
	mov rsi, r14
	mov r14, rax
	jmp .LBB0_0
