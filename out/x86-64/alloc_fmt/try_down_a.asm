inspect_asm::alloc_fmt::try_down_a:
	push r15
	push r14
	push rbx
	sub rsp, 112
	mov qword ptr [rsp + 32], rsi
	mov qword ptr [rsp + 40], rdx
	lea rax, [rsp + 32]
	mov qword ptr [rsp + 48], rax
	lea rax, [rip + <&T as core::fmt::Display>::fmt]
	mov qword ptr [rsp + 56], rax
	movups xmm0, xmmword ptr [rip + .Lanon.facade.0]
	movaps xmmword ptr [rsp], xmm0
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdi
	lea rax, [rip + .Lanon.facade.1]
	mov qword ptr [rsp + 64], rax
	mov qword ptr [rsp + 72], 2
	lea rax, [rsp + 48]
	mov qword ptr [rsp + 80], rax
	mov qword ptr [rsp + 88], 1
	mov qword ptr [rsp + 96], 0
	lea rsi, [rip + .Lanon.facade.2]
	mov rdi, rsp
	lea rdx, [rsp + 64]
	call qword ptr [rip + core::fmt::write@GOTPCREL]
	test al, al
	je .LBB0_1
	mov rax, qword ptr [rsp]
	mov rcx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rcx]
	cmp rax, qword ptr [rcx]
	jne .LBB0_0
	add rax, qword ptr [rsp + 16]
	and rax, -4
	mov qword ptr [rcx], rax
.LBB0_0:
	xor eax, eax
	jmp .LBB0_6
.LBB0_1:
	mov rsi, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 16]
	test rax, rax
	je .LBB0_2
	mov rcx, qword ptr [rsp + 24]
	mov r14, qword ptr [rcx]
	cmp rsi, qword ptr [r14]
	je .LBB0_3
.LBB0_2:
	mov rax, rsi
	jmp .LBB0_6
.LBB0_3:
	add rax, rsi
	xor edi, edi
	sub rax, rdx
	cmovae rdi, rax
	and rdi, -4
	lea rax, [rdx + rsi]
	mov rbx, rdx
	mov r15, rdi
	cmp rax, rdi
	jbe .LBB0_4
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_5
.LBB0_4:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_5:
	mov rax, r15
	mov rdx, rbx
	mov qword ptr [r14], r15
.LBB0_6:
	add rsp, 112
	pop rbx
	pop r14
	pop r15
	ret
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 24]
	mov rdx, qword ptr [rdx]
	cmp rcx, qword ptr [rdx]
	jne .LBB0_7
	add rcx, qword ptr [rsp + 16]
	and rcx, -4
	mov qword ptr [rdx], rcx
.LBB0_7:
	mov rdi, rax
	call _Unwind_Resume@PLT
