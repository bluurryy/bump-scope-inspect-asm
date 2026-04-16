inspect_asm::grow::bumpalo:
	push rbp
	push r15
	push r14
	push rbx
	push rax
	mov rbx, r9
	cmp rdx, r8
	setae al
	mov r9, qword ptr [rdi + 16]
	mov r14, qword ptr [r9 + 32]
	cmp r14, rsi
	sete r10b
	test al, r10b
	je .LBB0_1
	mov r11, rbx
	sub r11, rcx
	lea r15, [rdx - 1]
	test rdx, r15
	setne al
	movabs r10, -9223372036854775808
	sub r10, rdx
	cmp r11, r10
	seta r10b
	or r10b, al
	je .LBB0_3
.LBB0_0:
	xor eax, eax
	jmp .LBB0_9
.LBB0_1:
	mov r10, qword ptr [r9]
.LBB0_2:
	cmp r8, 2
	setae al
	cmp r8, 1
	sbb al, 0
	je .LBB0_4
	movzx eax, al
	cmp eax, 1
	jne .LBB0_10
	lea rax, [r8 - 1]
	not rax
	and r14, rax
	mov rdx, r14
	sub rdx, r10
	jb .LBB0_11
	lea r10, [rbx + r8]
	dec r10
	mov rax, r8
	neg rax
	and rax, r10
	jmp .LBB0_5
.LBB0_3:
	mov r10, qword ptr [r9]
	cmp rdx, 2
	setae al
	cmp rdx, 1
	sbb al, 0
	je .LBB0_12
	movzx eax, al
	cmp eax, 1
	jne .LBB0_13
	lea rax, [r11 + rdx]
	dec rax
	neg rdx
	and rdx, rax
	and r15, rsi
	mov rax, r14
	sub rax, r15
	mov r11, rax
	sub r11, r10
	setb bpl
	cmp rdx, r11
	seta r11b
	or r11b, bpl
	mov r11, rdx
	jne .LBB0_2
	jmp .LBB0_14
.LBB0_4:
	lea rdx, [r8 + rbx]
	dec rdx
	mov rax, r8
	neg rax
	and rax, rdx
	mov rdx, r14
	sub rdx, r10
.LBB0_5:
	cmp rax, rdx
	ja .LBB0_11
.LBB0_6:
	sub r14, rax
	mov qword ptr [r9 + 32], r14
.LBB0_7:
	mov rdi, r14
	mov rdx, rcx
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_8:
	mov rax, r14
.LBB0_9:
	mov rdx, rbx
	add rsp, 8
	pop rbx
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_10:
	mov rdx, r14
	sub rdx, r10
	mov rax, rbx
	cmp rbx, rdx
	jbe .LBB0_6
.LBB0_11:
	mov r14, rsi
	mov rsi, r8
	mov rdx, rbx
	mov r15, rcx
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rsi, r14
	mov rcx, r15
	mov r14, rax
	test rax, rax
	jne .LBB0_7
	jmp .LBB0_0
.LBB0_12:
	lea rax, [rdx + r11]
	dec rax
	neg rdx
	mov r11, rdx
	and r11, rax
.LBB0_13:
	mov rax, rsi
	sub rax, r10
	cmp r11, rax
	ja .LBB0_2
	mov rax, r14
.LBB0_14:
	sub rax, r11
	mov qword ptr [r9 + 32], rax
	mov rdi, rax
	mov rdx, rcx
	mov r14, rax
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_8
