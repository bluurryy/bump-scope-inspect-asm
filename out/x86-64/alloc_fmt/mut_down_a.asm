inspect_asm::alloc_fmt::mut_down_a:
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
	movups xmm0, xmmword ptr [rip + .Lanon.facade.0]
	movaps xmmword ptr [rsp], xmm0
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdi
	lea rsi, [rip + .Lanon.facade.1]
	lea rdx, [rip + .Lanon.facade.2]
	mov rdi, rsp
	lea rcx, [rsp + 48]
	call qword ptr [rip + core::fmt::write@GOTPCREL]
	test al, al
	jne .LBB0_2
	mov rbx, qword ptr [rsp + 16]
	test rbx, rbx
	je .LBB0_0
	mov rax, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsp]
	mov r14, qword ptr [rsp + 8]
	mov r15, qword ptr [rax]
	add rbx, rsi
	sub rbx, r14
	mov rdi, rbx
	mov rdx, r14
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, rbx
	and rax, -4
	mov qword ptr [r15], rax
	jmp .LBB0_1
.LBB0_0:
	mov ebx, 1
	xor r14d, r14d
.LBB0_1:
	mov rax, rbx
	mov rdx, r14
	add rsp, 64
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_2:
	call qword ptr [rip + bump_scope::private::format_trait_error@GOTPCREL]
