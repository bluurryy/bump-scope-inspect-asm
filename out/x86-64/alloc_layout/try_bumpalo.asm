inspect_asm::alloc_layout::try_bumpalo:
	mov rcx, qword ptr [rdi + 16]
	mov r8, qword ptr [rcx]
	mov rax, qword ptr [rcx + 32]
	cmp rsi, 2
	setae r9b
	cmp rsi, 1
	sbb r9b, 0
	je .LBB0_1
	movzx r9d, r9b
	cmp r9d, 1
	jne .LBB0_2
	mov r10, rsi
	neg r10
	and rax, r10
	mov r11, rax
	sub r11, r8
	jb .LBB0_3
	lea r9, [rsi + rdx]
	dec r9
	and r9, r10
	cmp r9, r11
	ja .LBB0_3
.LBB0_0:
	sub rax, r9
	mov qword ptr [rcx + 32], rax
	ret
.LBB0_1:
	lea r10, [rsi + rdx]
	dec r10
	mov r9, rsi
	neg r9
	and r9, r10
	mov r10, rax
	sub r10, r8
	cmp r9, r10
	jbe .LBB0_0
	jmp .LBB0_3
.LBB0_2:
	mov r9, rax
	sub r9, r8
	cmp rdx, r9
	ja .LBB0_3
	mov r9, rdx
	sub rax, r9
	mov qword ptr [rcx + 32], rax
	ret
.LBB0_3:
	jmp qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
