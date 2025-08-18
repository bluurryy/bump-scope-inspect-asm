inspect_asm::alloc_try_big_ok::try_down:
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
	mov r15, qword ptr [rsi]
	mov r12, qword ptr [r15]
	xor r13d, r13d
	mov rax, r12
	sub rax, 1024
	cmovae r13, rax
	mov rbx, rdi
	and r13, -512
	cmp r13, qword ptr [r15 + 8]
	jb .LBB0_6
	mov qword ptr [r15], r13
.LBB0_0:
	mov qword ptr [rsp + 504], r12
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r13
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rdx, qword ptr [r14]
	mov rcx, qword ptr [rdx]
	cmp dword ptr [r13], 1
	jne .LBB0_2
	mov edx, dword ptr [r13 + 4]
	mov r12d, 1
	cmp r13, rcx
	jne .LBB0_1
	mov rdi, r15
	mov rsi, qword ptr [rsp + 504]
	mov r13d, edx
	call qword ptr [rip + bump_scope::bump_scope_guard::Checkpoint::reset_within_chunk@GOTPCREL]
	mov edx, r13d
	mov qword ptr [r14], r15
.LBB0_1:
	jmp .LBB0_4
.LBB0_2:
	lea rax, [r13 + 512]
	xor r12d, r12d
	cmp r13, rcx
	jne .LBB0_3
	mov qword ptr [rdx], rax
.LBB0_3:
.LBB0_4:
	mov dword ptr [rbx], r12d
	mov dword ptr [rbx + 4], edx
	mov qword ptr [rbx + 8], rax
.LBB0_5:
	mov rax, rbx
	lea rsp, [rbp - 40]
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_6:
	mov rdi, r14
	mov r13, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::do_alloc_sized_in_another_chunk@GOTPCREL]
	mov rdx, r13
	mov r13, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_5
