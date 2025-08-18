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
	lea rax, [rip + .Lanon.facade.0]
	mov qword ptr [rsp + 64], rax
	mov qword ptr [rsp + 72], 2
	mov qword ptr [rsp + 96], 0
	lea rax, [rsp + 48]
	mov qword ptr [rsp + 80], rax
	mov qword ptr [rsp + 88], 1
	movups xmm0, xmmword ptr [rip + .Lanon.facade.1]
	movaps xmmword ptr [rsp], xmm0
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdi
	lea rsi, [rip + .Lanon.facade.2]
	mov rdi, rsp
	lea rdx, [rsp + 64]
	call qword ptr [rip + core::fmt::write@GOTPCREL]
	test al, al
	je .LBB0_0
	mov rax, qword ptr [rsp]
	mov rcx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rcx]
	cmp rax, qword ptr [rcx]
	je .LBB0_1
	xor eax, eax
	jmp .LBB0_5
.LBB0_0:
	mov rax, qword ptr [rsp]
	mov rbx, qword ptr [rsp + 8]
	mov r15, qword ptr [rsp + 24]
	mov rcx, qword ptr [r15]
	cmp rax, qword ptr [rcx]
	jne .LBB0_5
	mov rcx, qword ptr [rsp + 16]
	add rcx, rax
	xor r14d, r14d
	sub rcx, rbx
	cmovae r14, rcx
	and r14, -4
	lea rcx, [rbx + rax]
	mov rdi, r14
	mov rsi, rax
	mov rdx, rbx
	cmp rcx, r14
	jbe .LBB0_2
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_3
.LBB0_1:
	mov rdx, qword ptr [rsp + 16]
	lea r14, [rax + rdx]
	add r14, 3
	and r14, -4
	xor eax, eax
	jmp .LBB0_4
.LBB0_2:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_3:
	mov rcx, qword ptr [r15]
	mov rax, r14
.LBB0_4:
	mov qword ptr [rcx], r14
.LBB0_5:
	mov rdx, rbx
	add rsp, 112
	pop rbx
	pop r14
	pop r15
	ret
	mov rdx, qword ptr [rsp]
	mov rcx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rcx]
	cmp rdx, qword ptr [rcx]
	jne .LBB0_6
	mov rsi, qword ptr [rsp + 16]
	add rdx, rsi
	add rdx, 3
	and rdx, -4
	mov qword ptr [rcx], rdx
.LBB0_6:
	mov rdi, rax
	call _Unwind_Resume@PLT
