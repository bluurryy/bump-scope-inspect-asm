inspect_asm::alloc_fmt::try_up_a:
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
	mov rsi, qword ptr [rsp + 16]
	mov rcx, qword ptr [rsp + 24]
	add rax, rsi
	mov rcx, qword ptr [rcx]
	cmp rax, qword ptr [rcx]
	je .LBB0_3
.LBB0_0:
	xor eax, eax
	add rsp, 72
	ret
.LBB0_1:
	mov rsi, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 32]
	cmp rdx, rsi
	jae .LBB0_2
	mov rcx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rcx]
	add rsi, rax
	cmp rsi, qword ptr [rcx]
	je .LBB0_4
.LBB0_2:
	add rsp, 72
	ret
.LBB0_3:
	add rsi, 3
	xor eax, eax
	and rsi, -4
	mov qword ptr [rcx], rsi
	add rsp, 72
	ret
.LBB0_4:
	lea rsi, [rax + rdx]
	add rsi, 3
	and rsi, -4
	mov qword ptr [rcx], rsi
	add rsp, 72
	ret
	mov rdx, qword ptr [rsp + 8]
	test rdx, rdx
	je .LBB0_5
	mov rcx, qword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 24]
	add rdx, rcx
	mov rsi, qword ptr [rsi]
	cmp rdx, qword ptr [rsi]
	jne .LBB0_5
	add rcx, 3
	and rcx, -4
	mov qword ptr [rsi], rcx
.LBB0_5:
	mov rdi, rax
	call _Unwind_Resume@PLT
