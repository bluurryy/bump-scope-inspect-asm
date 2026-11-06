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
	jmp .LBB0_3
.LBB0_1:
	mov rax, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 24]
	cmp rdx, rax
	jae .LBB0_2
	mov rcx, qword ptr [rsp + 16]
	mov r14, qword ptr [rcx]
	cmp rsi, qword ptr [r14]
	je .LBB0_4
.LBB0_2:
	mov rax, rsi
.LBB0_3:
	add rsp, 64
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_4:
	add rax, rsi
	xor edi, edi
	sub rax, rdx
	cmovae rdi, rax
	and rdi, -4
	lea rax, [rdx + rsi]
	mov rbx, rdx
	mov r15, rdi
	cmp rax, rdi
	jbe .LBB0_5
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_6
.LBB0_5:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_6:
	mov rax, r15
	mov rdx, rbx
	mov qword ptr [r14], r15
	jmp .LBB0_3
	mov rcx, qword ptr [rsp]
	test rcx, rcx
	je .LBB0_7
	mov rsi, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 16]
	mov rdx, qword ptr [rdx]
	cmp rsi, qword ptr [rdx]
	jne .LBB0_7
	add rcx, rsi
	and rcx, -4
	mov qword ptr [rdx], rcx
.LBB0_7:
	mov rdi, rax
	call _Unwind_Resume@PLT
