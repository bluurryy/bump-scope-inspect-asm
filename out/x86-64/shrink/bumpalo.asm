inspect_asm::shrink::bumpalo:
	push r14
	push rbx
	push rax
	mov rbx, r9
	cmp rdx, r8
	jae .LBB0_1
	lea rcx, [r8 - 1]
	test rcx, rsi
	je .LBB0_3
	mov rax, qword ptr [rdi + 16]
	mov r14, rcx
	not r14
	and r14, qword ptr [rax + 32]
	mov rdx, r14
	sub rdx, qword ptr [rax]
	jb .LBB0_0
	add rcx, rbx
	mov r9, r8
	neg r9
	and r9, rcx
	cmp r9, rdx
	ja .LBB0_0
	sub r14, r9
	mov qword ptr [rax + 32], r14
	jne .LBB0_2
.LBB0_0:
	mov r14, rsi
	mov rsi, r8
	mov rdx, rbx
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rsi, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_2
	xor esi, esi
	jmp .LBB0_3
.LBB0_1:
	mov rax, qword ptr [rdi + 16]
	mov r14, qword ptr [rax + 32]
	cmp r14, rsi
	jne .LBB0_3
	mov rdx, rcx
	sub rdx, rbx
	neg r8
	and r8, rdx
	inc rcx
	shr rcx
	cmp r8, rcx
	jb .LBB0_3
	add r14, r8
	mov qword ptr [rax + 32], r14
.LBB0_2:
	mov rdi, r14
	mov rdx, rbx
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rsi, r14
.LBB0_3:
	mov rax, rsi
	mov rdx, rbx
	add rsp, 8
	pop rbx
	pop r14
	ret
