inspect_asm::alloc_fmt::mut_down:
	push r15
	push r14
	push rbx
	sub rsp, 64
	mov qword ptr [rsp + 32], rsi
	mov qword ptr [rsp + 40], rdx
	lea rax, [rsp + 32]
	mov qword ptr [rsp + 48], rax
	lea rax, [rip + <&str as core::fmt::Display>::fmt]
	mov qword ptr [rsp + 56], rax
	mov rax, qword ptr [rdi]
	mov rdx, qword ptr [rax]
	mov rax, qword ptr [rax + 8]
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
	mov rbx, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rax]
	mov rsi, rbx
	add rbx, qword ptr [rsp]
	sub rbx, r14
	mov rdi, rbx
	mov rdx, r14
	call qword ptr [rip + memmove@GOTPCREL]
	mov qword ptr [r15], rbx
	mov rax, rbx
	mov rdx, r14
	add rsp, 64
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_1:
	mov esi, 1
	mov rbx, rdi
	xor edx, edx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x87920000000000000000000000000000, alloc::alloc::Global, false>>::prepare_allocation_range_in_another_chunk::<!>@GOTPCREL]
	mov rdi, rbx
	jmp .LBB0_0
.LBB0_2:
	call qword ptr [rip + bump_scope::error_mode::panic::format_trait_error@GOTPCREL]
