inspect_asm::bump_vec_u32::down::try_with_capacity:
	mov rax, rdi
	test rsi, rsi
	je .LBB0_1
	push r14
	push rbx
	push rax
	mov rcx, rsi
	shr rcx, 61
	je .LBB0_2
.LBB0_0:
	mov qword ptr [rax], 0
	add rsp, 8
	pop rbx
	pop r14
	ret
.LBB0_1:
	movups xmm0, xmmword ptr [rip + .Lanon.facade.0]
	movups xmmword ptr [rax], xmm0
	mov qword ptr [rax + 16], 0
	mov qword ptr [rax + 24], rdx
	ret
.LBB0_2:
	shl rsi, 2
	mov rdi, qword ptr [rdx]
	mov rcx, qword ptr [rdi]
	mov r9, rsi
	mov rsi, qword ptr [rdi + 8]
	and rcx, -4
	mov rdi, rcx
	sub rdi, rsi
	cmp r9, rdi
	jg .LBB0_4
	add rsi, 3
	and rsi, -4
.LBB0_3:
	mov rdi, rcx
	sub rdi, rsi
	mov rsi, rdi
	shr rsi, 2
	and rdi, -4
	sub rcx, rdi
	mov qword ptr [rax], rcx
	mov qword ptr [rax + 8], 0
	mov qword ptr [rax + 16], rsi
	mov qword ptr [rax + 24], rdx
	add rsp, 8
	pop rbx
	pop r14
	ret
.LBB0_4:
	mov esi, 4
	mov rdi, rdx
	mov rbx, rdx
	mov rdx, r9
	mov r14, rax
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::prepare_allocation_range_in_another_chunk@GOTPCREL]
	mov rsi, rax
	mov rax, r14
	test rsi, rsi
	je .LBB0_0
	mov rcx, rdx
	mov rdx, rbx
	jmp .LBB0_3
