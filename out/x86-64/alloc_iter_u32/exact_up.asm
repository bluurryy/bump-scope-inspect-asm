inspect_asm::alloc_iter_u32::exact_up:
	push r15
	push r14
	push rbx
	test rdx, rdx
	je .LBB0_1
	mov rax, rdx
	shr rax, 61
	jne .LBB0_4
	lea r14, [4*rdx]
	mov rax, qword ptr [rdi]
	mov rbx, qword ptr [rax]
	mov rcx, qword ptr [rax + 8]
	add rbx, 3
	and rbx, -4
	sub rcx, rbx
	cmp r14, rcx
	ja .LBB0_3
	lea rcx, [rbx + r14]
	mov qword ptr [rax], rcx
.LBB0_0:
	add r14, -4
	shr r14, 2
	dec rdx
	cmp r14, rdx
	cmovb rdx, r14
	lea rax, [4*rdx + 4]
	mov rdi, rbx
	mov r14, rdx
	mov rdx, rax
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rdx, r14
	inc rdx
	jmp .LBB0_2
.LBB0_1:
	mov ebx, 4
	xor edx, edx
.LBB0_2:
	mov rax, rbx
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_3:
	mov rbx, rsi
	mov rsi, rdx
	mov r15, rdx
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::do_alloc_slice_in_another_chunk@GOTPCREL]
	mov rsi, rbx
	mov rdx, r15
	mov rbx, rax
	jmp .LBB0_0
.LBB0_4:
	call qword ptr [rip + bump_scope::private::capacity_overflow@GOTPCREL]
