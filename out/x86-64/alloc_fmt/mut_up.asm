inspect_asm::alloc_fmt::mut_up:
	push rbx
	sub rsp, 64
	mov qword ptr [rsp + 32], rsi
	mov qword ptr [rsp + 40], rdx
	lea rax, [rsp + 32]
	mov qword ptr [rsp + 48], rax
	lea rax, [rip + <&str as core::fmt::Display>::fmt]
	mov qword ptr [rsp + 56], rax
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rdx, qword ptr [rcx + 8]
	cmp rdx, rax
	js .LBB0_1
.LBB0_0:
	sub rdx, rax
	mov qword ptr [rsp], rdx
	mov qword ptr [rsp + 8], rax
	mov qword ptr [rsp + 16], rdi
	mov qword ptr [rsp + 24], 0
	lea rsi, [rip + .Lanon.facade.0]
	lea rdx, [rip + .Lanon.facade.1]
	mov rdi, rsp
	lea rcx, [rsp + 48]
	call qword ptr [rip + core::fmt::write@GOTPCREL]
	test al, al
	jne .LBB0_2
	mov rax, qword ptr [rsp + 8]
	mov rcx, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rcx]
	lea rsi, [rax + rdx]
	mov qword ptr [rcx], rsi
	add rsp, 64
	pop rbx
	ret
.LBB0_1:
	mov esi, 1
	mov rbx, rdi
	xor edx, edx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<alloc::alloc::Global, 0x17240000000000000000000000000000>>::prepare_allocation_range_in_another_chunk::<!>@GOTPCREL]
	mov rdi, rbx
	jmp .LBB0_0
.LBB0_2:
	call qword ptr [rip + bump_scope::error_behavior::panic::format_trait_error@GOTPCREL]
