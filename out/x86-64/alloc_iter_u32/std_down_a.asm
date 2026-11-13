inspect_asm::alloc_iter_u32::std_down_a:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 8], 0
	mov qword ptr [rsp + 16], 4
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], 0
	test rdx, rdx
	jne .LBB0_4
	mov rbx, qword ptr [rsp + 8]
	test rbx, rbx
	je .LBB0_1
	mov r15, qword ptr [rsp + 24]
	shl rbx, 2
	mov r14d, 4
.LBB0_0:
	mov rcx, qword ptr [r15]
	mov eax, 4
	cmp r14, qword ptr [rcx]
	jne .LBB0_2
	add rbx, r14
	and rbx, -4
	mov qword ptr [rcx], rbx
	jmp .LBB0_2
.LBB0_1:
	mov eax, 4
.LBB0_2:
	xor edx, edx
.LBB0_3:
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_4:
	mov rbx, rsi
	lea rdi, [rsp + 8]
	xor esi, esi
	mov r15, rdx
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<&mut bump_scope::bump::Bump<0xa7940000000000000000000000000000>>
	mov r14, qword ptr [rsp + 16]
	mov r12, qword ptr [rsp + 32]
	lea rdi, [r14 + 4*r12]
	lea rdx, [4*r15]
	mov rsi, rbx
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rdx, r12
	add rdx, r15
	mov rbx, qword ptr [rsp + 8]
	cmp rbx, rdx
	jbe .LBB0_5
	mov r15, qword ptr [rsp + 24]
	shl rbx, 2
	test rdx, rdx
	je .LBB0_0
	lea r12, [4*rdx]
	test r14b, 3
	jne .LBB0_8
	mov rax, qword ptr [r15]
	cmp r14, qword ptr [rax]
	je .LBB0_6
.LBB0_5:
	mov rax, r14
	jmp .LBB0_3
.LBB0_6:
	mov rbp, rdx
	lea rax, [rbx + r14]
	xor r13d, r13d
	sub rax, r12
	cmovae r13, rax
	mov rdi, r13
	mov rsi, r14
	mov rdx, r12
	call qword ptr [rip + memmove@GOTPCREL]
	mov rcx, qword ptr [r15]
	mov rax, r13
	mov qword ptr [rcx], r13
	test rax, rax
	mov rdx, rbp
	jne .LBB0_3
.LBB0_7:
	mov edi, 4
	mov rsi, r12
	call qword ptr [rip + alloc::raw_vec::handle_error@GOTPCREL]
	ud2
.LBB0_8:
	mov rbp, rdx
	mov r8d, 4
	mov rdi, r15
	mov rsi, r14
	mov rcx, rbx
	mov r9, r12
	call qword ptr [rip + bump_scope::allocator_impl::shrink::shrink_unfit::<0xa7940000000000000000000000000000, alloc::alloc::Global, false>@GOTPCREL]
	test rax, rax
	mov rdx, rbp
	jne .LBB0_3
	jmp .LBB0_7
	mov rcx, qword ptr [r15]
	cmp r14, qword ptr [rcx]
	jne .LBB0_10
	add rbx, r14
	jmp .LBB0_9
	mov rdx, qword ptr [rsp + 8]
	test rdx, rdx
	je .LBB0_10
	mov rsi, qword ptr [rsp + 16]
	mov rcx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rcx]
	cmp rsi, qword ptr [rcx]
	jne .LBB0_10
	lea rbx, [rsi + 4*rdx]
.LBB0_9:
	and rbx, -4
	mov qword ptr [rcx], rbx
.LBB0_10:
	mov rdi, rax
	call _Unwind_Resume@PLT
