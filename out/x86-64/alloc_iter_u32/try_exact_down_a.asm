inspect_asm::alloc_iter_u32::try_exact_down_a:
	test rdx, rdx
	je .LBB0_0
	mov rax, rdx
	shr rax, 61
	je .LBB0_1
	xor eax, eax
	ret
.LBB0_0:
	mov eax, 4
	xor edx, edx
	ret
.LBB0_1:
	push r15
	push r14
	push rbx
	lea rbx, [4*rdx]
	mov rax, rdi
	mov rcx, qword ptr [rdi]
	mov rdi, qword ptr [rcx]
	mov r8, rdi
	sub r8, qword ptr [rcx + 8]
	cmp rbx, r8
	jg .LBB0_3
	sub rdi, rbx
	mov qword ptr [rcx], rdi
.LBB0_2:
	add rbx, -4
	shr rbx, 2
	dec rdx
	cmp rbx, rdx
	cmovb rdx, rbx
	lea rax, [4*rdx + 4]
	mov rbx, rdx
	mov rdx, rax
	mov r14, rdi
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rax, r14
	mov rdx, rbx
	inc rdx
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_3:
	mov rdi, rax
	mov r14, rsi
	mov rsi, rdx
	mov r15, rdx
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_slice_in_another_chunk@GOTPCREL]
	mov rsi, r14
	mov rdx, r15
	mov rdi, rax
	test rax, rax
	jne .LBB0_2
	xor eax, eax
	pop rbx
	pop r14
	pop r15
	ret
