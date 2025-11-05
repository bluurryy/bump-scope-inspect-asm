inspect_asm::alloc_try_u32::down:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r14, rsi
	mov rbx, rdi
	mov r12, qword ptr [rsi]
	mov r13, qword ptr [r12]
	mov r15, r13
	and r15, -4
	add r15, -8
	cmp r15, qword ptr [r12 + 8]
	jb .LBB0_5
	mov qword ptr [r12], r15
.LBB0_0:
	call rdx
	mov dword ptr [r15], eax
	mov dword ptr [r15 + 4], edx
	mov rcx, qword ptr [r14]
	mov rsi, qword ptr [rcx]
	test al, 1
	je .LBB0_2
	cmp r15, rsi
	jne .LBB0_1
	mov qword ptr [r12], r13
	mov qword ptr [r14], r12
.LBB0_1:
	mov dword ptr [rbx + 4], edx
	mov eax, 1
	jmp .LBB0_4
.LBB0_2:
	lea rax, [r15 + 4]
	cmp r15, rsi
	jne .LBB0_3
	mov qword ptr [rcx], rax
.LBB0_3:
	mov qword ptr [rbx + 8], rax
	xor eax, eax
.LBB0_4:
	mov dword ptr [rbx], eax
	mov rax, rbx
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB0_5:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::do_alloc_sized_in_another_chunk@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	jmp .LBB0_0
