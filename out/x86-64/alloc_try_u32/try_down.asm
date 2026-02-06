inspect_asm::alloc_try_u32::try_down:
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
	lea rcx, [r15 + 4]
	mov dword ptr [r15 + 4], edx
	mov rsi, qword ptr [r14]
	mov rdi, qword ptr [rsi]
	test al, 1
	je .LBB0_1
	mov eax, 1
	cmp r15, rdi
	jne .LBB0_3
	mov qword ptr [r12], r13
	mov qword ptr [r14], r12
	jmp .LBB0_3
.LBB0_1:
	xor eax, eax
	cmp r15, rdi
	jne .LBB0_2
	mov qword ptr [rsi], rcx
.LBB0_2:
.LBB0_3:
	mov dword ptr [rbx], eax
	mov dword ptr [rbx + 4], edx
	mov qword ptr [rbx + 8], rcx
.LBB0_4:
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
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_sized_in_another_chunk@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_4
