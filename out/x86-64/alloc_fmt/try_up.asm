inspect_asm::alloc_fmt::try_up:
	sub rsp, 120
	mov qword ptr [rsp + 40], rsi
	mov qword ptr [rsp + 48], rdx
	lea rax, [rsp + 40]
	mov qword ptr [rsp + 56], rax
	lea rax, [rip + <&T as core::fmt::Display>::fmt]
	mov qword ptr [rsp + 64], rax
	lea rax, [rip + .Lanon.facade.0]
	mov qword ptr [rsp + 72], rax
	mov qword ptr [rsp + 80], 2
	mov qword ptr [rsp + 104], 0
	lea rax, [rsp + 56]
	mov qword ptr [rsp + 88], rax
	mov qword ptr [rsp + 96], 1
	movups xmm0, xmmword ptr [rip + .Lanon.facade.1]
	movaps xmmword ptr [rsp], xmm0
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdi
	lea rsi, [rip + .Lanon.facade.2]
	mov rdi, rsp
	lea rdx, [rsp + 72]
	call qword ptr [rip + core::fmt::write@GOTPCREL]
	test al, al
	je .LBB0_0
	mov rcx, qword ptr [rsp]
	mov rax, qword ptr [rsp + 24]
	mov rdx, qword ptr [rsp + 16]
	add rdx, rcx
	mov rsi, qword ptr [rax]
	cmp rdx, qword ptr [rsi]
	je .LBB0_1
	xor eax, eax
	add rsp, 120
	ret
.LBB0_0:
	mov rax, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rcx, qword ptr [rsp + 24]
	mov rdi, qword ptr [rsp + 16]
	add rdi, rax
	mov rsi, qword ptr [rcx]
	cmp rdi, qword ptr [rsi]
	je .LBB0_2
	add rsp, 120
	ret
.LBB0_1:
	xor eax, eax
	mov qword ptr [rsi], rcx
	add rsp, 120
	ret
.LBB0_2:
	lea rcx, [rdx + rax]
	mov qword ptr [rsi], rcx
	add rsp, 120
	ret
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsp + 16]
	add rsi, rcx
	mov rdx, qword ptr [rdx]
	cmp rsi, qword ptr [rdx]
	jne .LBB0_3
	mov qword ptr [rdx], rcx
.LBB0_3:
	mov rdi, rax
	call _Unwind_Resume@PLT
