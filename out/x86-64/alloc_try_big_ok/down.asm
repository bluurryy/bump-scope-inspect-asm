inspect_asm::alloc_try_big_ok::down:
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
	mov r13, qword ptr [rsi]
	mov rax, qword ptr [r13]
	xor r15d, r15d
	mov qword ptr [rsp + 504], rax
	sub rax, 1024
	cmovae r15, rax
	mov rbx, rdi
	and r15, -512
	cmp r15, qword ptr [r13 + 8]
	jb .LBB0_5
	mov qword ptr [r13], r15
.LBB0_0:
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r15
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rax, qword ptr [r14]
	mov rcx, qword ptr [rax]
	cmp dword ptr [r15], 1
	jne .LBB0_2
	mov eax, dword ptr [r15 + 4]
	cmp r15, rcx
	jne .LBB0_1
	mov rcx, qword ptr [rsp + 504]
	mov qword ptr [r13], rcx
	mov qword ptr [r14], r13
.LBB0_1:
	mov dword ptr [rbx + 4], eax
	mov eax, 1
	jmp .LBB0_4
.LBB0_2:
	lea rdx, [r15 + 512]
	cmp r15, rcx
	jne .LBB0_3
	mov qword ptr [rax], rdx
.LBB0_3:
	mov qword ptr [rbx + 8], rdx
	xor eax, eax
.LBB0_4:
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
.LBB0_5:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_sized_in_another_chunk@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	jmp .LBB0_0
