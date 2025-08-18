inspect_asm::grow::bumpalo:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	push rax
	mov rbx, r9
	mov r15, r8
	mov r13, rdx
	cmp rdx, r8
	setae r8b
	mov rax, qword ptr [rdi + 16]
	mov r12, qword ptr [rax + 32]
	cmp r12, rsi
	sete dl
	test r8b, dl
	je .LBB0_0
	mov r12, rdi
	mov qword ptr [rsp], rsi
	mov rbp, rbx
	mov r14, rcx
	sub rbp, rcx
	mov rdi, rbp
	mov rsi, r13
	call qword ptr [rip + core::alloc::layout::Layout::is_size_align_valid@GOTPCREL]
	test al, al
	je .LBB0_6
	mov rdi, r12
	mov rax, qword ptr [r12 + 16]
	mov r10, qword ptr [rax]
	mov r12, qword ptr [rax + 32]
	cmp r13, 2
	setae dl
	cmp r13, 1
	sbb dl, 0
	je .LBB0_8
	movzx edx, dl
	cmp edx, 1
	mov rsi, qword ptr [rsp]
	mov rcx, r14
	jne .LBB0_9
	add rbp, r13
	dec rbp
	neg r13
	and rbp, r13
	and r13, r12
	mov rdx, r13
	sub rdx, r10
	setb r8b
	cmp rbp, rdx
	seta dl
	or dl, r8b
	jne .LBB0_1
	jmp .LBB0_11
.LBB0_0:
	mov r10, qword ptr [rax]
.LBB0_1:
	cmp r15, 2
	setae dl
	cmp r15, 1
	sbb dl, 0
	je .LBB0_4
	movzx edx, dl
	cmp edx, 1
	jne .LBB0_7
	mov r8, r15
	neg r8
	and r12, r8
	mov r9, r12
	sub r9, r10
	jb .LBB0_5
	lea rdx, [r15 + rbx]
	dec rdx
	and rdx, r8
	cmp rdx, r9
	ja .LBB0_5
.LBB0_2:
	sub r12, rdx
	mov qword ptr [rax + 32], r12
.LBB0_3:
	mov rdi, r12
	mov rdx, rcx
	call qword ptr [rip + memcpy@GOTPCREL]
	mov r13, r12
	jmp .LBB0_12
.LBB0_4:
	lea r8, [r15 + rbx]
	dec r8
	mov rdx, r15
	neg rdx
	and rdx, r8
	mov r8, r12
	sub r8, r10
	cmp rdx, r8
	jbe .LBB0_2
.LBB0_5:
	mov r14, rsi
	mov rsi, r15
	mov rdx, rbx
	mov r15, rcx
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rcx, r15
	mov rsi, r14
	mov r12, rax
	test rax, rax
	jne .LBB0_3
.LBB0_6:
	xor r13d, r13d
	jmp .LBB0_12
.LBB0_7:
	mov r8, r12
	sub r8, r10
	mov rdx, rbx
	cmp rbx, r8
	jbe .LBB0_2
	jmp .LBB0_5
.LBB0_8:
	lea rdx, [1*rbp - 1]
	add rdx, r13
	neg r13
	mov rbp, r13
	and rbp, rdx
	mov rdx, r12
	sub rdx, r10
	cmp rbp, rdx
	mov rsi, qword ptr [rsp]
	mov rcx, r14
	ja .LBB0_1
	jmp .LBB0_10
.LBB0_9:
	mov rdx, r12
	sub rdx, r10
	cmp rbp, rdx
	ja .LBB0_1
.LBB0_10:
	mov r13, r12
.LBB0_11:
	sub r13, rbp
	mov qword ptr [rax + 32], r13
	mov rdi, r13
	mov rdx, rcx
	call qword ptr [rip + memmove@GOTPCREL]
.LBB0_12:
	mov rax, r13
	mov rdx, rbx
	add rsp, 8
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
