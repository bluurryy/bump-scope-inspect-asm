inspect_asm::alloc_try_big_ok::bumpalo:
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
	mov rbx, rdi
	mov r13, qword ptr [rsi + 16]
	mov r14, qword ptr [r13 + 32]
	mov qword ptr [rsp + 504], r14
	and r14, -512
	mov rax, r14
	sub rax, qword ptr [r13]
	jb .LBB0_5
	cmp rax, 1024
	jb .LBB0_5
	add r14, -1024
	mov qword ptr [r13 + 32], r14
	je .LBB0_5
.LBB0_0:
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r14
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	cmp dword ptr [r14], 1
	jne .LBB0_3
	mov rax, qword ptr [r15 + 16]
	cmp qword ptr [rax + 32], r14
	jne .LBB0_2
	cmp rax, r13
	mov rcx, qword ptr [rsp + 504]
	je .LBB0_1
	mov rcx, qword ptr [rax]
.LBB0_1:
	mov qword ptr [rax + 32], rcx
.LBB0_2:
	mov eax, dword ptr [r14 + 4]
	mov dword ptr [rbx + 4], eax
	mov eax, 1
	jmp .LBB0_4
.LBB0_3:
	add r14, 512
	mov qword ptr [rbx + 8], r14
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
	mov esi, 512
	mov r14, rdx
	mov edx, 1024
	mov rdi, r15
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rdx, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
