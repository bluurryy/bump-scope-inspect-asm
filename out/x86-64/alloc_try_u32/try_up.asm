inspect_asm::alloc_try_u32::try_up:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	push rax
	mov r14, rsi
	mov rbx, rdi
	mov r15, qword ptr [rsi]
	mov rbp, qword ptr [r15]
	mov rax, qword ptr [r15 + 8]
	lea r13, [rbp + 3]
	and r13, -4
	sub rax, r13
	cmp rax, 8
	jb .LBB0_5
	lea rax, [r13 + 8]
	mov qword ptr [r15], rax
.LBB0_0:
	mov qword ptr [rsp], rbp
	mov rax, qword ptr [r14]
	mov r12, qword ptr [rax]
	call rdx
	mov ebp, edx
	mov dword ptr [r13], eax
	lea rsi, [r13 + 4]
	mov dword ptr [r13 + 4], edx
	mov rcx, qword ptr [r14]
	mov rdx, qword ptr [rcx]
	test al, 1
	je .LBB0_1
	mov eax, 1
	cmp r12, rdx
	jne .LBB0_3
	mov rdi, r15
	mov r12, rsi
	mov rsi, qword ptr [rsp]
	call qword ptr [rip + bump_scope::bump_scope_guard::Checkpoint::reset_within_chunk@GOTPCREL]
	mov eax, 1
	mov rsi, r12
	mov qword ptr [r14], r15
	jmp .LBB0_3
.LBB0_1:
	xor eax, eax
	cmp r12, rdx
	jne .LBB0_2
	add r13, 8
	mov qword ptr [rcx], r13
.LBB0_2:
.LBB0_3:
	mov dword ptr [rbx], eax
	mov dword ptr [rbx + 4], ebp
	mov qword ptr [rbx + 8], rsi
.LBB0_4:
	mov rax, rbx
	add rsp, 8
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_5:
	mov rdi, r14
	mov r12, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::do_alloc_sized_in_another_chunk@GOTPCREL]
	mov rdx, r12
	mov r13, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_4
