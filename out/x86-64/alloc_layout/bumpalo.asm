inspect_asm::alloc_layout::bumpalo:
	push rax
	mov rcx, qword ptr [rdi + 16]
	mov r8, qword ptr [rcx]
	mov rax, qword ptr [rcx + 32]
	cmp rsi, 2
	setae r9b
	cmp rsi, 1
	sbb r9b, 0
	je .LBB0_0
	movzx r9d, r9b
	cmp r9d, 1
	jne .LBB0_1
	lea r9, [rsi - 1]
	not r9
	and rax, r9
	mov r10, rax
	sub r10, r8
	jb .LBB0_4
	lea r8, [rdx + rsi]
	dec r8
	mov r9, rsi
	neg r9
	and r9, r8
	cmp r9, r10
	jbe .LBB0_2
	jmp .LBB0_4
.LBB0_0:
	lea r10, [rsi + rdx]
	dec r10
	mov r9, rsi
	neg r9
	and r9, r10
	mov r10, rax
	sub r10, r8
	cmp r9, r10
	jbe .LBB0_2
	jmp .LBB0_4
.LBB0_1:
	mov r9, rax
	sub r9, r8
	cmp rdx, r9
	ja .LBB0_4
	mov r9, rdx
.LBB0_2:
	sub rax, r9
	mov qword ptr [rcx + 32], rax
.LBB0_3:
	pop rcx
	ret
.LBB0_4:
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	test rax, rax
	jne .LBB0_3
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
