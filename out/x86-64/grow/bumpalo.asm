inspect_asm::grow::bumpalo:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	push rax
	mov rbx, r9
	cmp rdx, r8
	jb .LBB0_0
	mov rax, qword ptr [rdi + 16]
	cmp qword ptr [rax + 32], rsi
	je .LBB0_6
.LBB0_0:
	mov rax, qword ptr [rdi + 16]
	mov rdx, qword ptr [rax]
	mov r14, qword ptr [rax + 32]
	cmp r8, 2
	setae r9b
	cmp r8, 1
	sbb r9b, 0
	je .LBB0_1
	movzx r9d, r9b
	cmp r9d, 1
	jne .LBB0_2
	mov r10, r8
	neg r10
	and r14, r10
	mov r11, r14
	sub r11, rdx
	jb .LBB0_7
	lea r9, [r8 + rbx]
	dec r9
	and r9, r10
	cmp r9, r11
	jbe .LBB0_3
	jmp .LBB0_7
.LBB0_1:
	lea r10, [r8 + rbx]
	dec r10
	mov r9, r8
	neg r9
	and r9, r10
	mov r10, r14
	sub r10, rdx
	cmp r9, r10
	jbe .LBB0_3
	jmp .LBB0_7
.LBB0_2:
	mov r10, r14
	sub r10, rdx
	mov r9, rbx
	cmp rbx, r10
	ja .LBB0_7
.LBB0_3:
	sub r14, r9
	mov qword ptr [rax + 32], r14
	je .LBB0_7
.LBB0_4:
	mov rdi, r14
	mov rdx, rcx
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_5:
	mov rax, r14
	mov rdx, rbx
	add rsp, 8
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_6:
	mov r14, rdi
	mov qword ptr [rsp], r8
	mov r13, rsi
	mov r15, rbx
	mov rbp, rcx
	sub r15, rcx
	mov rdi, r15
	mov r12, rdx
	mov rsi, rdx
	call qword ptr [rip + core::alloc::layout::Layout::is_size_align_valid@GOTPCREL]
	test al, al
	je .LBB0_8
	mov rdi, r14
	mov rax, qword ptr [r14 + 16]
	mov rdx, qword ptr [rax]
	mov r14, qword ptr [rax + 32]
	cmp r12, 2
	setae cl
	cmp r12, 1
	sbb cl, 0
	je .LBB0_9
	movzx ecx, cl
	cmp ecx, 1
	mov rcx, rbp
	mov rsi, r13
	mov r8, qword ptr [rsp]
	jne .LBB0_10
	add r15, r12
	dec r15
	neg r12
	and r15, r12
	and r14, r12
	mov r9, r14
	sub r9, rdx
	setb dl
	cmp r15, r9
	seta r9b
	or r9b, dl
	jne .LBB0_0
	jmp .LBB0_11
.LBB0_7:
	mov r14, rsi
	mov rsi, r8
	mov rdx, rbx
	mov r15, rcx
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rsi, r14
	mov rcx, r15
	mov r14, rax
	test rax, rax
	jne .LBB0_4
.LBB0_8:
	xor r14d, r14d
	jmp .LBB0_5
.LBB0_9:
	lea rcx, [r12 + r15]
	dec rcx
	neg r12
	and r12, rcx
	mov rcx, r14
	sub rcx, rdx
	mov r15, r12
	cmp r12, rcx
	mov rcx, rbp
	mov rsi, r13
	mov r8, qword ptr [rsp]
	ja .LBB0_0
	jmp .LBB0_11
.LBB0_10:
	mov r9, r14
	sub r9, rdx
	cmp r15, r9
	ja .LBB0_0
.LBB0_11:
	sub r14, r15
	mov qword ptr [rax + 32], r14
	je .LBB0_0
	mov rdi, r14
	mov rdx, rcx
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_5
