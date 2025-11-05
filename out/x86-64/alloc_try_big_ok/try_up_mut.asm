inspect_asm::alloc_try_big_ok::try_up_mut:
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
	mov r12, qword ptr [r13]
	lea r15, [r12 - 1]
	and r15, -512
	mov rax, r15
	add rax, 1536
	mov rcx, -1
	cmovae rcx, rax
	cmp rcx, qword ptr [r13 + 8]
	ja .LBB0_4
	add r15, 512
.LBB0_0:
	mov qword ptr [rsp + 504], r12
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r15
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	cmp dword ptr [r15], 1
	jne .LBB0_1
	mov ecx, dword ptr [r15 + 4]
	mov rax, qword ptr [rsp + 504]
	mov qword ptr [r13], rax
	mov qword ptr [r14], r13
	mov edx, 1
	jmp .LBB0_2
.LBB0_1:
	lea rax, [r15 + 512]
	add r15, 1024
	mov rcx, qword ptr [r14]
	mov qword ptr [rcx], r15
	xor edx, edx
.LBB0_2:
	mov dword ptr [rbx], edx
	mov dword ptr [rbx + 4], ecx
	mov qword ptr [rbx + 8], rax
.LBB0_3:
	mov rax, rbx
	lea rsp, [rbp - 40]
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_4:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_,_>::prepare_allocation_in_another_chunk@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_3
