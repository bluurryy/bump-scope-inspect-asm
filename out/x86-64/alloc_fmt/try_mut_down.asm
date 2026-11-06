inspect_asm::alloc_fmt::try_mut_down:
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
	js .LBB0_4
	mov rcx, rdx
	sub rcx, rax
	cmp rcx, -1
	je .LBB0_1
.LBB0_0:
	sub rdx, rcx
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rdi
	mov qword ptr [rsp + 24], 0
	lea rsi, [rip + .Lanon.facade.0]
	lea rdx, [rip + .Lanon.facade.1]
	mov rdi, rsp
	lea rcx, [rsp + 48]
	call qword ptr [rip + core::fmt::write@GOTPCREL]
	test al, al
	je .LBB0_2
.LBB0_1:
	xor eax, eax
	jmp .LBB0_3
.LBB0_2:
	mov r14, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 16]
	mov rbx, qword ptr [rsp + 24]
	mov r15, qword ptr [rax]
	mov rsi, r14
	add r14, qword ptr [rsp]
	sub r14, rbx
	mov rdi, r14
	mov rdx, rbx
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, r14
	mov qword ptr [r15], r14
.LBB0_3:
	mov rdx, rbx
	add rsp, 64
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_4:
	mov esi, 1
	mov rbx, rdi
	xor edx, edx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<alloc::alloc::Global, 0x7240000000000000000000000000000>>::prepare_allocation_range_in_another_chunk::<core::alloc::AllocError>@GOTPCREL]
	test rax, rax
	je .LBB0_5
	mov rdi, rbx
	mov rcx, rdx
	sub rcx, rax
	cmp rcx, -1
	jne .LBB0_0
	jmp .LBB0_1
.LBB0_5:
	xor eax, eax
	jmp .LBB0_3
