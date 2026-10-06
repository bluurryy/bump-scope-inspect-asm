inspect_asm::allocate::bumpalo:
	mov rcx, qword ptr [rdi + 16]
	mov r9, qword ptr [rcx]
	mov rax, qword ptr [rcx + 32]
	cmp rsi, 2
	setae r10b
	mov r8, rsi
	sub r8, 1
	sbb r10b, 0
	je .LBB0_1
	movzx r10d, r10b
	cmp r10d, 1
	jne .LBB0_3
	mov r10, r8
	not r10
	and rax, r10
	mov r11, rax
	sub r11, r9
	jb .LBB0_2
	add r8, rdx
	mov r10, rsi
	neg r10
	and r10, r8
	cmp r10, r11
	ja .LBB0_2
.LBB0_0:
	sub rax, r10
	mov qword ptr [rcx + 32], rax
	ret
.LBB0_1:
	add r8, rdx
	mov r10, rsi
	neg r10
	and r10, r8
	mov r8, rax
	sub r8, r9
	cmp r10, r8
	jbe .LBB0_0
.LBB0_2:
	push rbx
	mov rbx, rdx
	call qword ptr [rip + <bumpalo::Bump>::alloc_layout_slow@GOTPCREL]
	mov rdx, rbx
	pop rbx
	ret
.LBB0_3:
	mov r8, rax
	sub r8, r9
	mov r10, rdx
	cmp rdx, r8
	jbe .LBB0_0
	jmp .LBB0_2
