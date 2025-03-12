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
	movups xmm0, xmmword ptr [rip + .Lanon.f7b4eb168cdedf3ee8fbb41abeb83042.1]
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
	mov r8, r9
	cmp r9, rdi
	ja .LBB0_4
	add rsi, 3
	and rsi, -4
	je .LBB0_4
.LBB0_3:
	sub rcx, rsi
	shr rcx, 2
	mov qword ptr [rax], rsi
	mov qword ptr [rax + 8], 0
	mov qword ptr [rax + 16], rcx
	mov qword ptr [rax + 24], rdx
	add rsp, 8
	pop rbx
	pop r14
	ret
.LBB0_4:
	mov esi, 4
	mov rdi, rdx
	mov rbx, rdx
	mov rdx, r8
	mov r14, rax
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::prepare_allocation_range_in_another_chunk@GOTPCREL]
	mov rsi, rax
	mov rax, r14
	test rsi, rsi
	je .LBB0_0
	mov rcx, rdx
	mov rdx, rbx
	jmp .LBB0_3
