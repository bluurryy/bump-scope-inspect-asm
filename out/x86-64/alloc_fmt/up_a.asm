inspect_asm::alloc_fmt::up_a:
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
	jne .LBB0_3
	mov rcx, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 32]
	cmp rdx, rcx
	jae .LBB0_2
	mov rsi, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsi]
	add rcx, rax
	cmp rcx, qword ptr [rsi]
	je .LBB0_0
	xor ecx, ecx
	jmp .LBB0_1
.LBB0_0:
	lea rcx, [rax + rdx]
	add rcx, 3
	and rcx, -4
	mov qword ptr [rsi], rcx
	mov rcx, rax
.LBB0_1:
	test rcx, rcx
	cmovne rax, rcx
.LBB0_2:
	add rsp, 72
	ret
.LBB0_3:
	call qword ptr [rip + bump_scope::error_behavior::panic::format_trait_error@GOTPCREL]
	ud2
	mov rdx, qword ptr [rsp + 8]
	test rdx, rdx
	je .LBB0_4
	mov rcx, qword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 24]
	add rdx, rcx
	mov rsi, qword ptr [rsi]
	cmp rdx, qword ptr [rsi]
	jne .LBB0_4
	add rcx, 3
	and rcx, -4
	mov qword ptr [rsi], rcx
.LBB0_4:
	mov rdi, rax
	call _Unwind_Resume@PLT
