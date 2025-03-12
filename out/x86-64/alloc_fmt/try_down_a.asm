inspect_asm::alloc_fmt::try_down_a:
	push r15
	push r14
	push r12
	push rbx
	sub rsp, 120
	mov qword ptr [rsp + 40], rsi
	mov qword ptr [rsp + 48], rdx
	lea rax, [rsp + 40]
	mov qword ptr [rsp + 56], rax
	lea rax, [rip + <&T as core::fmt::Display>::fmt]
	mov qword ptr [rsp + 64], rax
	lea rax, [rip + .Lanon.f7b4eb168cdedf3ee8fbb41abeb83042.25]
	mov qword ptr [rsp + 72], rax
	mov qword ptr [rsp + 80], 2
	mov qword ptr [rsp + 104], 0
	lea rax, [rsp + 56]
	mov qword ptr [rsp + 88], rax
	mov qword ptr [rsp + 96], 1
	movups xmm0, xmmword ptr [rip + .Lanon.f7b4eb168cdedf3ee8fbb41abeb83042.0]
	movaps xmmword ptr [rsp], xmm0
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdi
	lea rsi, [rip + .Lanon.f7b4eb168cdedf3ee8fbb41abeb83042.15]
	mov rdi, rsp
	lea rdx, [rsp + 72]
	call qword ptr [rip + core::fmt::write@GOTPCREL]
	test al, al
	je .LBB0_0
	mov rcx, qword ptr [rsp]
	mov rax, qword ptr [rsp + 24]
	mov rax, qword ptr [rax]
	cmp rcx, qword ptr [rax]
	je .LBB0_1
	xor eax, eax
	jmp .LBB0_4
.LBB0_0:
	mov rax, qword ptr [rsp]
	mov rbx, qword ptr [rsp + 8]
	mov r15, qword ptr [rsp + 24]
	mov rcx, qword ptr [r15]
	cmp rax, qword ptr [rcx]
	jne .LBB0_4
	mov rcx, qword ptr [rsp + 16]
	add rcx, rax
	xor r14d, r14d
	sub rcx, rbx
	cmovae r14, rcx
	and r14, -4
	lea rcx, [rbx + rax]
	mov rdi, r14
	mov r12, rax
	mov rsi, rax
	mov rdx, rbx
	cmp rcx, r14
	jbe .LBB0_2
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_3
.LBB0_1:
	mov rdx, qword ptr [rsp + 16]
	add rcx, rdx
	add rcx, 3
	and rcx, -4
	mov qword ptr [rax], rcx
	xor eax, eax
	jmp .LBB0_4
.LBB0_2:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_3:
	mov rax, qword ptr [r15]
	mov qword ptr [rax], r14
	test r14, r14
	mov rax, r12
	cmovne rax, r14
.LBB0_4:
	mov rdx, rbx
	add rsp, 120
	pop rbx
	pop r12
	pop r14
	pop r15
	ret
	mov rdx, qword ptr [rsp]
	mov rcx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rcx]
	cmp rdx, qword ptr [rcx]
	jne .LBB0_5
	mov rsi, qword ptr [rsp + 16]
	add rdx, rsi
	add rdx, 3
	and rdx, -4
	mov qword ptr [rcx], rdx
.LBB0_5:
	mov rdi, rax
	call _Unwind_Resume@PLT
