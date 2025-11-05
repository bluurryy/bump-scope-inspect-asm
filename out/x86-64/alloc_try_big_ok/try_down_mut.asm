inspect_asm::alloc_try_big_ok::try_down_mut:
	push rbp
	mov rbp, rsp
	push r15
	push r14
	push r13
	push r12
	push rbx
	and rsp, -512
	sub rsp, 2048
	mov r15, rsi
	mov r13, qword ptr [rsi]
	mov r12, qword ptr [r13]
	xor r14d, r14d
	mov rax, r12
	sub rax, 1024
	cmovae r14, rax
	mov rbx, rdi
	and r14, -512
	cmp r14, qword ptr [r13 + 8]
	jb .LBB0_4
.LBB0_0:
	mov qword ptr [rsp + 504], r12
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r14
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	cmp dword ptr [r14], 1
	jne .LBB0_1
	mov eax, dword ptr [r14 + 4]
	mov rcx, qword ptr [rsp + 504]
	mov qword ptr [r13], rcx
	mov qword ptr [r15], r13
	mov ecx, 1
	jmp .LBB0_2
.LBB0_1:
	add r14, 512
	mov rax, qword ptr [r15]
	mov qword ptr [rax], r14
	xor ecx, ecx
.LBB0_2:
	mov dword ptr [rbx], ecx
	mov dword ptr [rbx + 4], eax
	mov qword ptr [rbx + 8], r14
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
	mov rdi, r15
	mov r14, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::prepare_allocation_in_another_chunk@GOTPCREL]
	mov rdx, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_3
