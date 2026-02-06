inspect_asm::alloc_fmt::up:
	sub rsp, 120
	mov qword ptr [rsp + 40], rsi
	mov qword ptr [rsp + 48], rdx
	lea rax, [rsp + 40]
	mov qword ptr [rsp + 56], rax
	lea rax, [rip + <&T as core::fmt::Display>::fmt]
	mov qword ptr [rsp + 64], rax
	movups xmm0, xmmword ptr [rip + .Lanon.facade.0]
	movaps xmmword ptr [rsp], xmm0
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdi
	lea rax, [rip + .Lanon.facade.1]
	mov qword ptr [rsp + 72], rax
	mov qword ptr [rsp + 80], 2
	lea rax, [rsp + 56]
	mov qword ptr [rsp + 88], rax
	mov qword ptr [rsp + 96], 1
	mov qword ptr [rsp + 104], 0
	lea rsi, [rip + .Lanon.facade.2]
	mov rdi, rsp
	lea rdx, [rsp + 72]
	call qword ptr [rip + core::fmt::write@GOTPCREL]
	test al, al
	jne .LBB0_2
	mov rax, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rcx, qword ptr [rsp + 16]
	test rcx, rcx
	je .LBB0_0
	mov rsi, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsi]
	add rcx, rax
	cmp rcx, qword ptr [rsi]
	je .LBB0_1
.LBB0_0:
	add rsp, 120
	ret
.LBB0_1:
	lea rcx, [rdx + rax]
	mov qword ptr [rsi], rcx
	add rsp, 120
	ret
.LBB0_2:
	call qword ptr [rip + bump_scope::private::format_trait_error@GOTPCREL]
	ud2
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
