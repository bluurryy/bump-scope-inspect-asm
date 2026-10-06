inspect_asm::alloc_layout::bumpalo:
	push rax
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
	jne .LBB0_2
	mov r10, r8
	not r10
	and rax, r10
	mov r11, rax
	sub r11, r9
	jb .LBB0_3
	add r8, rdx
	mov r10, rsi
	neg r10
	and r10, r8
	cmp r10, r11
	ja .LBB0_3
.LBB0_0:
	sub rax, r10
	mov qword ptr [rcx + 32], rax
	pop rcx
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
	jmp .LBB0_3
.LBB0_2:
	mov r8, rax
	sub r8, r9
	cmp rdx, r8
	ja .LBB0_3
	mov r10, rdx
	sub rax, r10
	mov qword ptr [rcx + 32], rax
	pop rcx
	ret
.LBB0_3:
	call qword ptr [rip + <bumpalo::Bump>::alloc_layout_slow@GOTPCREL]
	test rax, rax
	je .LBB0_4
	pop rcx
	ret
.LBB0_4:
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
