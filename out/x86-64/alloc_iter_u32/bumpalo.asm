inspect_asm::alloc_iter_u32::bumpalo:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov rbx, rdi
	lea rax, [4*rdx]
	mov r12, qword ptr [rdi + 16]
	mov r15, qword ptr [r12 + 32]
	mov r14, r15
	and r14, -4
	mov rcx, r14
	sub rcx, qword ptr [r12]
	jb .LBB0_6
	cmp rax, rcx
	ja .LBB0_6
	sub r14, rax
	mov qword ptr [r12 + 32], r14
.LBB0_0:
	test rdx, rdx
	je .LBB0_5
	lea rdi, [rdx - 1]
	cmp rdx, rdi
	cmovb rdi, rdx
	cmp rdi, 8
	jae .LBB0_1
	xor edi, edi
	mov rax, r14
	mov rcx, rsi
	jmp .LBB0_3
.LBB0_1:
	inc rdi
	mov eax, edi
	and eax, 7
	mov ecx, 8
	cmovne rcx, rax
	sub rdi, rcx
	lea rax, [r14 + 4*rdi]
	lea rcx, [rsi + 4*rdi]
	xor r8d, r8d
.LBB0_2:
	movups xmm0, xmmword ptr [rsi + 4*r8]
	movups xmm1, xmmword ptr [rsi + 4*r8 + 16]
	movups xmmword ptr [r14 + 4*r8], xmm0
	movups xmmword ptr [r14 + 4*r8 + 16], xmm1
	add r8, 8
	cmp rdi, r8
	jne .LBB0_2
.LBB0_3:
	lea rsi, [rsi + 4*rdx]
	mov r8, rdx
	sub r8, rdi
.LBB0_4:
	cmp rcx, rsi
	je .LBB0_7
	mov edi, dword ptr [rcx]
	add rcx, 4
	mov dword ptr [rax], edi
	add rax, 4
	dec r8
	jne .LBB0_4
.LBB0_5:
	mov rax, r14
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB0_6:
	mov r14, rsi
	mov esi, 4
	mov rdi, rbx
	mov r13, rdx
	mov rdx, rax
	call qword ptr [rip + <bumpalo::Bump>::alloc_layout_slow@GOTPCREL]
	mov rsi, r14
	mov rdx, r13
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
.LBB0_7:
	lea rdi, [rip + .Lanon.facade.0]
	lea rdx, [rip + .Lanon.facade.1]
	mov esi, 34
	call qword ptr [rip + core::option::expect_failed@GOTPCREL]
	ud2
	mov rcx, qword ptr [rbx + 16]
	cmp qword ptr [rcx + 32], r14
	jne .LBB0_8
	cmp rcx, r12
	cmovne r15, rcx
	mov qword ptr [rcx + 32], r15
.LBB0_8:
	mov rdi, rax
	call _Unwind_Resume@PLT
