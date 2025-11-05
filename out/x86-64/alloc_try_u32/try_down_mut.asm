inspect_asm::alloc_try_u32::try_down_mut:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r15, rsi
	mov rbx, rdi
	mov r12, qword ptr [rsi]
	mov r13, qword ptr [r12]
	mov r14, r13
	and r14, -4
	add r14, -8
	cmp r14, qword ptr [r12 + 8]
	jb .LBB0_4
.LBB0_0:
	call rdx
	mov dword ptr [r14], eax
	mov dword ptr [r14 + 4], edx
	add r14, 4
	test al, 1
	je .LBB0_1
	mov qword ptr [r12], r13
	mov qword ptr [r15], r12
	mov eax, 1
	jmp .LBB0_2
.LBB0_1:
	mov rax, qword ptr [r15]
	mov qword ptr [rax], r14
	xor eax, eax
.LBB0_2:
	mov dword ptr [rbx], eax
	mov dword ptr [rbx + 4], edx
	mov qword ptr [rbx + 8], r14
.LBB0_3:
	mov rax, rbx
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB0_4:
	mov rdi, r15
	mov r14, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_,_>::prepare_allocation_in_another_chunk@GOTPCREL]
	mov rdx, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_3
