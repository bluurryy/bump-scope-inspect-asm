inspect_asm::bump_vec_u32::down::with_capacity:
	push r14
	push rbx
	push rax
	test rsi, rsi
	je .LBB0_1
	mov rax, rsi
	shr rax, 61
	jne .LBB0_4
	shl rsi, 2
	mov rax, qword ptr [rdx]
	mov rcx, qword ptr [rax]
	mov rax, qword ptr [rax + 8]
	and rcx, -4
	mov r8, rcx
	sub r8, rax
	cmp rsi, r8
	jg .LBB0_3
	add rax, 3
	and rax, -4
.LBB0_0:
	mov rsi, rcx
	sub rsi, rax
	mov rax, rsi
	shr rax, 2
	and rsi, -4
	sub rcx, rsi
	jmp .LBB0_2
.LBB0_1:
	mov ecx, 4
	xor eax, eax
.LBB0_2:
	mov qword ptr [rdi], rcx
	mov qword ptr [rdi + 8], 0
	mov qword ptr [rdi + 16], rax
	mov qword ptr [rdi + 24], rdx
	mov rax, rdi
	add rsp, 8
	pop rbx
	pop r14
	ret
.LBB0_3:
	mov rax, rsi
	mov esi, 4
	mov r14, rdi
	mov rdi, rdx
	mov rbx, rdx
	mov rdx, rax
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::prepare_allocation_range_in_another_chunk@GOTPCREL]
	mov rdi, r14
	mov rcx, rdx
	mov rdx, rbx
	jmp .LBB0_0
.LBB0_4:
	call qword ptr [rip + bump_scope::private::capacity_overflow@GOTPCREL]
