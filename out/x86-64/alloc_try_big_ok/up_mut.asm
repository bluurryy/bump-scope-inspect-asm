inspect_asm::alloc_try_big_ok::up_mut:
	push rbp
	mov rbp, rsp
	push r15
	push r14
	push r13
	push r12
	push rbx
	and rsp, -512
	sub rsp, 2048
	mov r14, rsi
	mov rbx, rdi
	mov r13, qword ptr [rsi]
	mov rax, qword ptr [r13]
	mov qword ptr [rsp + 504], rax
	lea r15, [rax - 1]
	and r15, -512
	mov rax, r15
	add rax, 1536
	mov rcx, -1
	cmovae rcx, rax
	cmp rcx, qword ptr [r13 + 8]
	ja .LBB0_3
	add r15, 512
.LBB0_0:
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r15
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	cmp dword ptr [r15], 1
	jne .LBB0_1
	mov eax, dword ptr [r15 + 4]
	mov rcx, qword ptr [rsp + 504]
	mov qword ptr [r13], rcx
	mov qword ptr [r14], r13
	mov dword ptr [rbx + 4], eax
	mov eax, 1
	jmp .LBB0_2
.LBB0_1:
	lea rax, [r15 + 512]
	add r15, 1024
	mov rcx, qword ptr [r14]
	mov qword ptr [rcx], r15
	mov qword ptr [rbx + 8], rax
	xor eax, eax
.LBB0_2:
	mov dword ptr [rbx], eax
	mov rax, rbx
	lea rsp, [rbp - 40]
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_3:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::prepare_allocation_in_another_chunk@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	jmp .LBB0_0
