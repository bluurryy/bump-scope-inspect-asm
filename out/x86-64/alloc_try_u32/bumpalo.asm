inspect_asm::alloc_try_u32::bumpalo:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r14, rsi
	mov rbx, rdi
	mov r13, qword ptr [rsi + 16]
	mov r12, qword ptr [r13 + 32]
	mov r15, r12
	and r15, -4
	mov rax, r15
	sub rax, qword ptr [r13]
	jb .LBB0_4
	cmp rax, 8
	jb .LBB0_4
	add r15, -8
	mov qword ptr [r13 + 32], r15
.LBB0_0:
	call rdx
	mov dword ptr [r15], eax
	mov dword ptr [r15 + 4], edx
	cmp eax, 1
	jne .LBB0_2
	mov rax, qword ptr [r14 + 16]
	cmp qword ptr [rax + 32], r15
	jne .LBB0_1
	cmp rax, r13
	cmovne r12, rax
	mov qword ptr [rax + 32], r12
.LBB0_1:
	mov dword ptr [rbx + 4], edx
	mov eax, 1
	jmp .LBB0_3
.LBB0_2:
	add r15, 4
	mov qword ptr [rbx + 8], r15
	xor eax, eax
.LBB0_3:
	mov dword ptr [rbx], eax
	mov rax, rbx
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB0_4:
	mov esi, 4
	mov r15, rdx
	mov edx, 8
	mov rdi, r14
	call qword ptr [rip + <bumpalo::Bump>::alloc_layout_slow@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	test rax, rax
	jne .LBB0_0
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
