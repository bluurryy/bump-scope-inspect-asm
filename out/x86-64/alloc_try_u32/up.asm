inspect_asm::alloc_try_u32::up:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	push rax
	mov r14, rsi
	mov rbx, rdi
	mov r12, qword ptr [rsi]
	mov r13, qword ptr [r12]
	mov rax, qword ptr [r12 + 8]
	lea r15, [r13 + 3]
	and r15, -4
	sub rax, r15
	cmp rax, 8
	jb .LBB0_5
	lea rax, [r15 + 8]
	mov qword ptr [r12], rax
.LBB0_0:
	mov rax, qword ptr [r14]
	mov rbp, qword ptr [rax]
	call rdx
	mov dword ptr [r15], eax
	mov dword ptr [r15 + 4], edx
	mov rcx, qword ptr [r14]
	mov rsi, qword ptr [rcx]
	test al, 1
	je .LBB0_2
	cmp rbp, rsi
	jne .LBB0_1
	mov qword ptr [r12], r13
	mov qword ptr [r14], r12
.LBB0_1:
	mov dword ptr [rbx + 4], edx
	mov eax, 1
	jmp .LBB0_4
.LBB0_2:
	lea rax, [r15 + 4]
	cmp rbp, rsi
	jne .LBB0_3
	add r15, 8
	mov qword ptr [rcx], r15
.LBB0_3:
	mov qword ptr [rbx + 8], rax
	xor eax, eax
.LBB0_4:
	mov dword ptr [rbx], eax
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
	mov r15, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_,_>::do_alloc_sized_in_another_chunk@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	jmp .LBB0_0
