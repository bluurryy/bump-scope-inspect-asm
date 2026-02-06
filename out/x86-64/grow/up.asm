inspect_asm::grow::up:
	push r15
	push r14
	push rbx
	mov rbx, r9
	lea r9, [rsi + rcx]
	mov rax, qword ptr [rdi]
	mov rdx, qword ptr [rax]
	xor r9, rdx
	lea r10, [r8 - 1]
	and r10, rsi
	or r10, r9
	jne .LBB0_0
	mov rdx, qword ptr [rax + 8]
	sub rdx, rsi
	cmp rbx, rdx
	ja .LBB0_4
	lea rcx, [rbx + rsi]
	mov qword ptr [rax], rcx
	jmp .LBB0_3
.LBB0_0:
	dec rdx
	mov r14, r8
	neg r14
	and r14, rdx
	lea r9, [rbx + r8]
	add r9, r14
	mov rdx, -1
	cmovae rdx, r9
	cmp rdx, qword ptr [rax + 8]
	ja .LBB0_5
	add r14, r8
	mov qword ptr [rax], rdx
.LBB0_1:
	mov rdi, r14
	mov rdx, rcx
.LBB0_2:
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rsi, r14
.LBB0_3:
	mov rax, rsi
	mov rdx, rbx
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_4:
	mov r14, rcx
	mov r15, rsi
	mov rsi, r8
	mov rdx, rbx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_in_another_chunk@GOTPCREL]
	test rax, rax
	je .LBB0_6
	mov rdi, rax
	mov rsi, r15
	mov rdx, r14
	mov r14, rax
	jmp .LBB0_2
.LBB0_5:
	mov r14, rsi
	mov rsi, r8
	mov rdx, rbx
	mov r15, rcx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_in_another_chunk@GOTPCREL]
	mov rcx, r15
	mov rsi, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_1
.LBB0_6:
	xor esi, esi
	jmp .LBB0_3
