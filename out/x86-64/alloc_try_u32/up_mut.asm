inspect_asm::alloc_try_u32::up_mut:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r14, rsi
	mov rbx, rdi
	mov r12, qword ptr [rsi]
	mov r13, qword ptr [r12]
	mov rax, qword ptr [r12 + 8]
	lea r15, [r13 + 3]
	and r15, -4
	sub rax, r15
	cmp rax, 8
	jb .LBB0_3
.LBB0_0:
	call rdx
	mov dword ptr [r15], eax
	mov dword ptr [r15 + 4], edx
	test al, 1
	je .LBB0_1
	mov qword ptr [r12], r13
	mov qword ptr [r14], r12
	mov dword ptr [rbx + 4], edx
	mov eax, 1
	jmp .LBB0_2
.LBB0_1:
	lea rax, [r15 + 4]
	add r15, 8
	mov rcx, qword ptr [r14]
	mov qword ptr [rcx], r15
	mov qword ptr [rbx + 8], rax
	xor eax, eax
.LBB0_2:
	mov dword ptr [rbx], eax
	mov rax, rbx
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB0_3:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::prepare_allocation_in_another_chunk@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	jmp .LBB0_0
