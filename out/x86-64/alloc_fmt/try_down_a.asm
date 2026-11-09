inspect_asm::alloc_fmt::try_down_a:
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
	mov qword ptr [rsp], 0
	mov qword ptr [rsp + 8], 1
	mov qword ptr [rsp + 16], rdi
	mov qword ptr [rsp + 24], 0
	lea rsi, [rip + .Lanon.facade.0]
	lea rdx, [rip + .Lanon.facade.1]
	mov rdi, rsp
	lea rcx, [rsp + 48]
	call qword ptr [rip + core::fmt::write@GOTPCREL]
	test al, al
	je .LBB0_1
	mov rax, qword ptr [rsp]
	test rax, rax
	je .LBB0_0
	mov rdx, qword ptr [rsp + 8]
	mov rcx, qword ptr [rsp + 16]
	mov rcx, qword ptr [rcx]
	cmp rdx, qword ptr [rcx]
	jne .LBB0_0
	add rax, rdx
	and rax, -4
	mov qword ptr [rcx], rax
.LBB0_0:
	xor eax, eax
	jmp .LBB0_2
.LBB0_1:
	mov rcx, qword ptr [rsp]
	mov rax, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 24]
	cmp rdx, rcx
	jae .LBB0_2
	mov rsi, qword ptr [rsp + 16]
	mov r15, qword ptr [rsi]
	cmp rax, qword ptr [r15]
	jne .LBB0_2
	add rcx, rax
	xor r14d, r14d
	sub rcx, rdx
	cmovae r14, rcx
	and r14, -4
	mov rdi, r14
	mov rsi, rax
	mov rbx, rdx
	call qword ptr [rip + memmove@GOTPCREL]
	mov rdx, rbx
	mov qword ptr [r15], r14
	mov rax, r14
.LBB0_2:
	add rsp, 64
	pop rbx
	pop r14
	pop r15
	ret
	mov rcx, qword ptr [rsp]
	test rcx, rcx
	je .LBB0_3
	mov rsi, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 16]
	mov rdx, qword ptr [rdx]
	cmp rsi, qword ptr [rdx]
	jne .LBB0_3
	add rcx, rsi
	and rcx, -4
	mov qword ptr [rdx], rcx
.LBB0_3:
	mov rdi, rax
	call _Unwind_Resume@PLT
