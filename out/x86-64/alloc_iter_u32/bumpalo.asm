inspect_asm::alloc_iter_u32::bumpalo:
	push r14
	push rbx
	push rax
	mov rax, rdx
	shr rax, 61
	jne .LBB0_7
	lea rcx, [4*rdx]
	mov r8, qword ptr [rdi + 16]
	mov rax, qword ptr [r8 + 32]
	and rax, -4
	mov r9, rax
	sub r9, qword ptr [r8]
	jb .LBB0_6
	cmp rcx, r9
	ja .LBB0_6
	sub rax, rcx
	mov qword ptr [r8 + 32], rax
	je .LBB0_6
.LBB0_0:
	test rdx, rdx
	je .LBB0_5
	lea r8, [rdx - 1]
	cmp rdx, r8
	cmovb r8, rdx
	xor ecx, ecx
	cmp r8, 8
	jb .LBB0_2
	mov r9, rax
	sub r9, rsi
	mov rdi, rsi
	cmp r9, 32
	jb .LBB0_3
	inc r8
	mov ecx, r8d
	and ecx, 7
	mov edi, 8
	cmovne rdi, rcx
	mov rcx, r8
	sub rcx, rdi
	lea rdi, [rsi + 4*rcx]
	xor r8d, r8d
.LBB0_1:
	movups xmm0, xmmword ptr [rsi + 4*r8]
	movups xmm1, xmmword ptr [rsi + 4*r8 + 16]
	movups xmmword ptr [rax + 4*r8], xmm0
	movups xmmword ptr [rax + 4*r8 + 16], xmm1
	add r8, 8
	cmp rcx, r8
	jne .LBB0_1
	jmp .LBB0_3
.LBB0_2:
	mov rdi, rsi
.LBB0_3:
	lea rsi, [rsi + 4*rdx]
.LBB0_4:
	cmp rdi, rsi
	je .LBB0_8
	mov r8d, dword ptr [rdi]
	add rdi, 4
	mov dword ptr [rax + 4*rcx], r8d
	inc rcx
	cmp rdx, rcx
	jne .LBB0_4
.LBB0_5:
	add rsp, 8
	pop rbx
	pop r14
	ret
.LBB0_6:
	mov rbx, rsi
	mov esi, 4
	mov r14, rdx
	mov rdx, rcx
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rsi, rbx
	mov rdx, r14
	test rax, rax
	jne .LBB0_0
.LBB0_7:
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
.LBB0_8:
	lea rdi, [rip + .Lanon.facade.0]
	lea rdx, [rip + .Lanon.facade.1]
	mov esi, 34
	call qword ptr [rip + core::option::expect_failed@GOTPCREL]
