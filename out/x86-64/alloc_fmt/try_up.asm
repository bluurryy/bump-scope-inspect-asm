inspect_asm::alloc_fmt::try_up:
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
	je .LBB0_1
	mov rax, qword ptr [rsp + 8]
	test rax, rax
	je .LBB0_0
	mov rcx, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 24]
	add rax, rcx
	mov rdx, qword ptr [rdx]
	cmp rax, qword ptr [rdx]
	je .LBB0_3
.LBB0_0:
	xor eax, eax
	add rsp, 72
	ret
.LBB0_1:
	mov rcx, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 32]
	cmp rdx, rcx
	jae .LBB0_2
	mov rsi, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsi]
	add rcx, rax
	cmp rcx, qword ptr [rsi]
	je .LBB0_4
.LBB0_2:
	add rsp, 72
	ret
.LBB0_3:
	mov qword ptr [rdx], rcx
	xor eax, eax
	add rsp, 72
	ret
.LBB0_4:
	lea rcx, [rdx + rax]
	mov qword ptr [rsi], rcx
	add rsp, 72
	ret
	mov rcx, qword ptr [rsp + 8]
	test rcx, rcx
	je .LBB0_5
	mov rdx, qword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 24]
	add rcx, rdx
	mov rsi, qword ptr [rsi]
	cmp rcx, qword ptr [rsi]
	jne .LBB0_5
	mov qword ptr [rsi], rdx
.LBB0_5:
	mov rdi, rax
	call _Unwind_Resume@PLT
