inspect_asm::grow::blink_alloc:
	push r15
	push r14
	push r12
	push rbx
	push rax
	mov rbx, r9
	mov rax, qword ptr [rdi]
	test rax, rax
	je .LBB0_6
	cmp rdx, r8
	jb .LBB0_5
	cmp rbx, rcx
	jbe .LBB0_2
	lea r9, [rsi + rcx]
	mov rdx, qword ptr [rax]
	cmp rdx, r9
	je .LBB0_3
	lea r9, [r8 + rbx]
	dec r9
	add r9, rdx
	jb .LBB0_6
.LBB0_0:
	sub r9, rbx
	mov r14, r8
	neg r14
	and r14, r9
	lea rdx, [r14 + rbx]
	cmp rdx, qword ptr [rax + 8]
	ja .LBB0_6
	mov qword ptr [rax], rdx
	cmp rcx, rbx
	cmovae rcx, rbx
	mov rdi, r14
	mov rdx, rcx
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_1:
	mov rsi, r14
	jmp .LBB0_4
.LBB0_2:
	mov rbx, rcx
	jmp .LBB0_4
.LBB0_3:
	mov rdx, rbx
	add rdx, rsi
	jb .LBB0_6
	cmp rdx, qword ptr [rax + 8]
	ja .LBB0_6
	mov qword ptr [rax], rdx
.LBB0_4:
	mov rax, rsi
	mov rdx, rbx
	add rsp, 8
	pop rbx
	pop r12
	pop r14
	pop r15
	ret
.LBB0_5:
	mov rdx, qword ptr [rax]
	lea r9, [r8 + rbx]
	dec r9
	add r9, rdx
	jae .LBB0_0
.LBB0_6:
	mov r12, rcx
	mov r14, rsi
	mov rsi, qword ptr [rdi + 8]
	mov rdx, r8
	mov rcx, rbx
	call blink_alloc::arena::local::alloc_slow
	test rax, rax
	je .LBB0_7
	mov r15, rdx
	cmp r12, rbx
	cmovb rbx, r12
	mov rdi, rax
	mov rsi, r14
	mov rdx, rbx
	mov r14, rax
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rbx, r15
	jmp .LBB0_1
.LBB0_7:
	xor esi, esi
	jmp .LBB0_4
