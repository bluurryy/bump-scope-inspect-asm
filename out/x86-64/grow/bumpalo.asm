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
	je .LBB0_0
	mov r11, rbx
	sub r11, rcx
	lea rax, [rdx - 1]
	test rdx, rax
	sete al
	movabs r10, -9223372036854775808
	sub r10, rdx
	cmp r11, r10
	setbe r10b
	and r10b, al
	cmp r10b, 1
	jne .LBB0_7
	mov r10, qword ptr [r9]
	cmp rdx, 2
	setae al
	mov r15, rdx
	sub r15, 1
	sbb al, 0
	je .LBB0_10
	movzx eax, al
	cmp eax, 1
	jne .LBB0_11
	add r11, r15
	neg rdx
	and r11, rdx
	and r15, rsi
	mov rax, r14
	sub rax, r15
	mov rdx, rax
	sub rdx, r10
	setb bpl
	cmp r11, rdx
	seta dl
	or dl, bpl
	jne .LBB0_1
	jmp .LBB0_12
.LBB0_0:
	mov r10, qword ptr [r9]
.LBB0_1:
	cmp r8, 2
	setae dl
	mov rax, r8
	sub rax, 1
	sbb dl, 0
	je .LBB0_5
	movzx edx, dl
	cmp edx, 1
	jne .LBB0_9
	mov rdx, rax
	not rdx
	and r14, rdx
	mov r11, r14
	sub r11, r10
	jb .LBB0_6
	add rax, rbx
	mov rdx, r8
	neg rdx
	and rdx, rax
	cmp rdx, r11
	ja .LBB0_6
.LBB0_2:
	sub r14, rdx
	mov qword ptr [r9 + 32], r14
.LBB0_3:
	mov rdi, r14
	mov rdx, rcx
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_4:
	mov rax, r14
	jmp .LBB0_8
.LBB0_5:
	add rax, rbx
	mov rdx, r8
	neg rdx
	and rdx, rax
	mov rax, r14
	sub rax, r10
	cmp rdx, rax
	jbe .LBB0_2
.LBB0_6:
	mov r14, rsi
	mov rsi, r8
	mov rdx, rbx
	mov r15, rcx
	call qword ptr [rip + <bumpalo::Bump>::alloc_layout_slow@GOTPCREL]
	mov rsi, r14
	mov rcx, r15
	mov r14, rax
	test rax, rax
	jne .LBB0_3
.LBB0_7:
	xor eax, eax
.LBB0_8:
	mov rdx, rbx
	add rsp, 8
	pop rbx
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_9:
	mov rax, r14
	sub rax, r10
	mov rdx, rbx
	cmp rbx, rax
	jbe .LBB0_2
	jmp .LBB0_6
.LBB0_10:
	mov rax, r11
	add rax, r15
	neg rdx
	mov r11, rdx
	and r11, rax
.LBB0_11:
	mov rax, rsi
	sub rax, r10
	cmp r11, rax
	ja .LBB0_1
	mov rax, r14
.LBB0_12:
	sub rax, r11
	mov qword ptr [r9 + 32], rax
	mov rdi, rax
	mov rdx, rcx
	mov r14, rax
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_4
