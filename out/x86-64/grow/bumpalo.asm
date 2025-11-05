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
	mov r14, qword ptr [rax + 32]
	cmp r14, rsi
	sete dl
	test r8b, dl
	je .LBB0_0
	mov r14, rdi
	mov qword ptr [rsp], rsi
	mov rbp, rbx
	mov r12, rcx
	sub rbp, rcx
	mov rdi, rbp
	mov rsi, r13
	call qword ptr [rip + core::alloc::layout::Layout::is_size_align_valid@GOTPCREL]
	test al, al
	je .LBB0_8
	mov rdi, r14
	mov rax, qword ptr [r14 + 16]
	mov r9, qword ptr [rax]
	mov r14, qword ptr [rax + 32]
	cmp r13, 2
	setae dl
	cmp r13, 1
	sbb dl, 0
	je .LBB0_9
	movzx edx, dl
	cmp edx, 1
	mov rsi, qword ptr [rsp]
	mov rcx, r12
	jne .LBB0_10
	lea r12, [r13 - 1]
	lea rdx, [1*r13 - 1]
	add rdx, rbp
	neg r13
	and r13, rdx
	not r12
	and r12, r14
	mov rdx, r12
	sub rdx, r9
	setb r8b
	cmp r13, rdx
	seta dl
	or dl, r8b
	mov rbp, r13
	jne .LBB0_1
	jmp .LBB0_12
.LBB0_0:
	mov r9, qword ptr [rax]
.LBB0_1:
	cmp r15, 2
	setae dl
	cmp r15, 1
	sbb dl, 0
	je .LBB0_2
	movzx edx, dl
	cmp edx, 1
	jne .LBB0_6
	lea rdx, [r15 - 1]
	not rdx
	and r14, rdx
	mov r8, r14
	sub r8, r9
	jb .LBB0_7
	lea r9, [rbx + r15]
	dec r9
	mov rdx, r15
	neg rdx
	and rdx, r9
	jmp .LBB0_3
.LBB0_2:
	lea r8, [r15 + rbx]
	dec r8
	mov rdx, r15
	neg rdx
	and rdx, r8
	mov r8, r14
	sub r8, r9
.LBB0_3:
	cmp rdx, r8
	ja .LBB0_7
.LBB0_4:
	sub r14, rdx
	mov qword ptr [rax + 32], r14
.LBB0_5:
	mov rdi, r14
	mov rdx, rcx
	call qword ptr [rip + memcpy@GOTPCREL]
	mov r12, r14
	jmp .LBB0_13
.LBB0_6:
	mov r8, r14
	sub r8, r9
	mov rdx, rbx
	cmp rbx, r8
	jbe .LBB0_4
.LBB0_7:
	mov r14, rsi
	mov rsi, r15
	mov rdx, rbx
	mov r15, rcx
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rcx, r15
	mov rsi, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_5
.LBB0_8:
	xor r12d, r12d
	jmp .LBB0_13
.LBB0_9:
	lea rdx, [1*rbp - 1]
	add rdx, r13
	neg r13
	mov rbp, r13
	and rbp, rdx
	mov rdx, r14
	sub rdx, r9
	cmp rbp, rdx
	mov rsi, qword ptr [rsp]
	mov rcx, r12
	ja .LBB0_1
	jmp .LBB0_11
.LBB0_10:
	mov rdx, r14
	sub rdx, r9
	cmp rbp, rdx
	ja .LBB0_1
.LBB0_11:
	mov r12, r14
.LBB0_12:
	sub r12, rbp
	mov qword ptr [rax + 32], r12
	mov rdi, r12
	mov rdx, rcx
	call qword ptr [rip + memmove@GOTPCREL]
.LBB0_13:
	mov rax, r12
	mov rdx, rbx
	add rsp, 8
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
