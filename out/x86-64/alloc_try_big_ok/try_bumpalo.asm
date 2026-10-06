inspect_asm::alloc_try_big_ok::try_bumpalo:
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
	mov r13, qword ptr [rsi + 16]
	mov r12, qword ptr [r13 + 32]
	mov r15, r12
	and r15, -512
	mov rax, r15
	sub rax, qword ptr [r13]
	jb .LBB0_4
	cmp rax, 1024
	jb .LBB0_4
	add r15, -1024
	mov qword ptr [r13 + 32], r15
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
	jne .LBB0_2
	mov eax, dword ptr [r15 + 4]
	mov rcx, qword ptr [r14 + 16]
	cmp qword ptr [rcx + 32], r15
	jne .LBB0_1
	cmp rcx, r13
	mov rdx, qword ptr [rsp + 504]
	cmovne rdx, rcx
	mov qword ptr [rcx + 32], rdx
.LBB0_1:
	mov dword ptr [rbx], 1
	mov dword ptr [rbx + 4], eax
	jmp .LBB0_3
.LBB0_2:
	add r15, 512
	mov dword ptr [rbx], 0
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
	mov esi, 512
	mov r15, rdx
	mov edx, 1024
	mov rdi, r14
	call qword ptr [rip + <bumpalo::Bump>::alloc_layout_slow@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_3
