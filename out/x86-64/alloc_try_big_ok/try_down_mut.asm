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
	mov r14, rsi
	mov r12, qword ptr [rsi]
	mov r13, qword ptr [r12]
	xor r15d, r15d
	mov rax, r13
	sub rax, 1024
	cmovae r15, rax
	mov rbx, rdi
	and r15, -512
	cmp r15, qword ptr [r12 + 8]
	jb .LBB0_4
.LBB0_0:
	mov qword ptr [rsp + 504], r13
	lea r13, [rsp + 512]
	mov rdi, r13
	call rdx
	mov edx, 1024
	mov rdi, r15
	mov rsi, r13
	call qword ptr [rip + memcpy@GOTPCREL]
	cmp dword ptr [r15], 1
	jne .LBB0_1
	mov r13d, dword ptr [r15 + 4]
	mov rdi, r12
	mov rsi, qword ptr [rsp + 504]
	call qword ptr [rip + bump_scope::bump_scope_guard::Checkpoint::reset_within_chunk@GOTPCREL]
	mov qword ptr [r14], r12
	mov eax, 1
	jmp .LBB0_2
.LBB0_1:
	add r15, 512
	mov rax, qword ptr [r14]
	mov qword ptr [rax], r15
	xor eax, eax
.LBB0_2:
	mov dword ptr [rbx], eax
	mov dword ptr [rbx + 4], r13d
	mov qword ptr [rbx + 8], r15
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
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::prepare_allocation_in_another_chunk@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_3
