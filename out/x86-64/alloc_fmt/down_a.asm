inspect_asm::alloc_fmt::down_a:
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
	jne .LBB0_3
	mov rcx, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 32]
	cmp rdx, rcx
	jae .LBB0_2
	mov rsi, qword ptr [rsp + 24]
	mov r15, qword ptr [rsi]
	cmp rax, qword ptr [r15]
	je .LBB0_0
	xor ebx, ebx
	jmp .LBB0_1
.LBB0_0:
	add rcx, rax
	xor ebx, ebx
	sub rcx, rdx
	cmovae rbx, rcx
	and rbx, -4
	mov rdi, rbx
	mov rsi, rax
	mov r14, rdx
	mov r12, rax
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, r12
	mov rdx, r14
	mov qword ptr [r15], rbx
.LBB0_1:
	test rbx, rbx
	cmovne rax, rbx
.LBB0_2:
	add rsp, 72
	pop rbx
	pop r12
	pop r14
	pop r15
	ret
.LBB0_3:
	call qword ptr [rip + bump_scope::error_mode::panic::format_trait_error@GOTPCREL]
	ud2
	mov rcx, qword ptr [rsp + 8]
	test rcx, rcx
	je .LBB0_4
	mov rsi, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 24]
	mov rdx, qword ptr [rdx]
	cmp rsi, qword ptr [rdx]
	jne .LBB0_4
	add rcx, rsi
	and rcx, -4
	mov qword ptr [rdx], rcx
.LBB0_4:
	mov rdi, rax
	call _Unwind_Resume@PLT
