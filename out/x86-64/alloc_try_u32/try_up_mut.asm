inspect_asm::alloc_try_u32::try_up_mut:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r14, rsi
	mov rbx, rdi
	mov r12, qword ptr [rsi]
	mov r13, qword ptr [r12]
	lea r15, [r13 + 3]
	and r15, -4
	lea rax, [r15 + 8]
	cmp rax, qword ptr [r12 + 8]
	ja .LBB0_4
.LBB0_0:
	call rdx
	mov dword ptr [r15], eax
	lea rcx, [r15 + 4]
	mov dword ptr [r15 + 4], edx
	test al, 1
	je .LBB0_1
	mov qword ptr [r12], r13
	mov qword ptr [r14], r12
	mov eax, 1
	jmp .LBB0_2
.LBB0_1:
	add r15, 8
	mov rax, qword ptr [r14]
	mov qword ptr [rax], r15
	xor eax, eax
.LBB0_2:
	mov dword ptr [rbx], eax
	mov dword ptr [rbx + 4], edx
	mov qword ptr [rbx + 8], rcx
.LBB0_3:
	mov rax, rbx
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB0_4:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::prepare_allocation_in_another_chunk@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_3
