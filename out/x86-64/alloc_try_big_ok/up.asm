inspect_asm::alloc_try_big_ok::up:
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
	mov qword ptr [rsp + 496], rdi
	mov r13, qword ptr [rsi]
	mov rax, qword ptr [r13]
	mov qword ptr [rsp + 504], rax
	lea r15, [rax - 1]
	and r15, -512
	mov rcx, r15
	add rcx, 1536
	mov rax, -1
	cmovae rax, rcx
	cmp rax, qword ptr [r13 + 8]
	ja .LBB0_5
	add r15, 512
	mov qword ptr [r13], rax
.LBB0_0:
	mov rax, qword ptr [r14]
	mov rbx, qword ptr [rax]
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r15
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rsi, qword ptr [r14]
	mov rdx, qword ptr [rsi]
	cmp dword ptr [r15], 1
	jne .LBB0_2
	mov ecx, dword ptr [r15 + 4]
	cmp rbx, rdx
	mov rax, qword ptr [rsp + 496]
	jne .LBB0_1
	mov rdx, qword ptr [rsp + 504]
	mov qword ptr [r13], rdx
	mov qword ptr [r14], r13
.LBB0_1:
	mov dword ptr [rax + 4], ecx
	mov ecx, 1
	jmp .LBB0_4
.LBB0_2:
	lea rcx, [r15 + 512]
	cmp rbx, rdx
	mov rax, qword ptr [rsp + 496]
	jne .LBB0_3
	add r15, 1024
	mov qword ptr [rsi], r15
.LBB0_3:
	mov qword ptr [rax + 8], rcx
	xor ecx, ecx
.LBB0_4:
	mov dword ptr [rax], ecx
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
	mov rbx, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_,_>::do_alloc_sized_in_another_chunk@GOTPCREL]
	mov rdx, rbx
	mov r15, rax
	jmp .LBB0_0
