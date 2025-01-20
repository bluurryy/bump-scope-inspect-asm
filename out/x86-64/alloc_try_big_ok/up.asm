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
	mov r15, qword ptr [rsi]
	mov rax, qword ptr [r15]
	mov qword ptr [rsp + 504], rax
	lea r13, [rax - 1]
	and r13, -512
	mov rcx, r13
	add rcx, 1536
	mov rax, -1
	cmovae rax, rcx
	cmp rax, qword ptr [r15 + 8]
	ja .LBB0_5
	add r13, 512
	mov qword ptr [r15], rax
.LBB0_0:
	mov rax, qword ptr [r14]
	mov rbx, qword ptr [rax]
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r13
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rax, qword ptr [r14]
	mov rdx, qword ptr [rax]
	test byte ptr [r13], 1
	je .LBB0_2
	mov r12d, dword ptr [r13 + 4]
	cmp rbx, rdx
	jne .LBB0_1
	mov rdi, r15
	mov rsi, qword ptr [rsp + 504]
	call qword ptr [rip + bump_scope::bump_scope_guard::Checkpoint::reset_within_chunk@GOTPCREL]
	mov qword ptr [r14], r15
.LBB0_1:
	mov rax, qword ptr [rsp + 496]
	mov dword ptr [rax + 4], r12d
	mov ecx, 1
	jmp .LBB0_4
.LBB0_2:
	lea rcx, [r13 + 512]
	cmp rbx, rdx
	jne .LBB0_3
	add r13, 1024
	mov qword ptr [rax], r13
.LBB0_3:
	mov rax, qword ptr [rsp + 496]
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
	call bump_scope::bump_scope::BumpScope<A,_,_,_>::do_alloc_sized_in_another_chunk
	mov rdx, rbx
	mov r13, rax
	jmp .LBB0_0
