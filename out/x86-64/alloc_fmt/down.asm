inspect_asm::alloc_fmt::down:
	push r15
	push r14
	push r12
	push rbx
	sub rsp, 72
	mov qword ptr [rsp + 40], rsi
	mov qword ptr [rsp + 48], rdx
	lea rax, [rsp + 40]
	mov qword ptr [rsp + 56], rax
	lea rax, [rip + <&str as core::fmt::Display>::fmt]
	mov qword ptr [rsp + 64], rax
	mov qword ptr [rsp + 8], 0
	mov qword ptr [rsp + 16], 1
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], 0
	lea rsi, [rip + .Lanon.facade.0]
	lea rdx, [rip + .Lanon.facade.1]
	lea rdi, [rsp + 8]
	lea rcx, [rsp + 56]
	call qword ptr [rip + core::fmt::write@GOTPCREL]
	test al, al
	jne .LBB0_5
	mov rcx, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 32]
	cmp rdx, rcx
	jae .LBB0_4
	mov rsi, qword ptr [rsp + 24]
	mov r14, qword ptr [rsi]
	cmp rax, qword ptr [r14]
	je .LBB0_0
	xor ebx, ebx
	jmp .LBB0_3
.LBB0_0:
	add rcx, rax
	xor ebx, ebx
	sub rcx, rdx
	cmovae rbx, rcx
	lea rcx, [rdx + rax]
	mov rdi, rbx
	mov r15, rax
	mov rsi, rax
	mov r12, rdx
	cmp rcx, rbx
	jbe .LBB0_1
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_2
.LBB0_1:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_2:
	mov qword ptr [r14], rbx
	mov rdx, r12
	mov rax, r15
.LBB0_3:
	test rbx, rbx
	cmovne rax, rbx
.LBB0_4:
	add rsp, 72
	pop rbx
	pop r12
	pop r14
	pop r15
	ret
.LBB0_5:
	call qword ptr [rip + bump_scope::error_mode::panic::format_trait_error@GOTPCREL]
	ud2
	mov rcx, qword ptr [rsp + 8]
	test rcx, rcx
	je .LBB0_6
	mov rdx, qword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsi]
	cmp rdx, qword ptr [rsi]
	jne .LBB0_6
	add rcx, rdx
	mov qword ptr [rsi], rcx
.LBB0_6:
	mov rdi, rax
	call _Unwind_Resume@PLT
