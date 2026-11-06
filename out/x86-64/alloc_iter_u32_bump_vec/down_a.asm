inspect_asm::alloc_iter_u32_bump_vec::down_a:
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 32
	mov qword ptr [rsp], 0
	mov qword ptr [rsp + 8], 4
	mov qword ptr [rsp + 16], rdi
	mov qword ptr [rsp + 24], 0
	test rdx, rdx
	jne .LBB0_4
	mov r14, qword ptr [rsp]
	test r14, r14
	je .LBB0_1
	mov r15, qword ptr [rsp + 16]
	shl r14, 2
	mov ebx, 4
.LBB0_0:
	mov rcx, qword ptr [r15]
	mov eax, 4
	cmp rbx, qword ptr [rcx]
	jne .LBB0_2
	add r14, rbx
	and r14, -4
	mov qword ptr [rcx], r14
	jmp .LBB0_2
.LBB0_1:
	mov eax, 4
.LBB0_2:
	xor edx, edx
.LBB0_3:
	add rsp, 32
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB0_4:
	mov r14, rsi
	mov rdi, rsp
	xor esi, esi
	mov r15, rdx
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<&mut bump_scope::bump::Bump<alloc::alloc::Global, 0x47240000000000000000000000000000>>
	mov rbx, qword ptr [rsp + 8]
	mov r12, qword ptr [rsp + 24]
	lea rdi, [rbx + 4*r12]
	lea rdx, [4*r15]
	mov rsi, r14
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rdx, r12
	add rdx, r15
	mov r14, qword ptr [rsp]
	cmp r14, rdx
	jbe .LBB0_5
	mov r15, qword ptr [rsp + 16]
	shl r14, 2
	test rdx, rdx
	je .LBB0_0
	lea r12, [4*rdx]
	test bl, 3
	jne .LBB0_9
	mov rax, qword ptr [r15]
	cmp rbx, qword ptr [rax]
	je .LBB0_6
.LBB0_5:
	mov rax, rbx
	jmp .LBB0_3
.LBB0_6:
	mov r13, rdx
	add r14, rbx
	xor eax, eax
	sub r14, r12
	cmovae rax, r14
	lea rcx, [r12 + rbx]
	mov r14, rax
	mov rdi, rax
	mov rsi, rbx
	mov rdx, r12
	cmp rcx, rax
	jbe .LBB0_7
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_8
.LBB0_7:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_8:
	mov rcx, qword ptr [r15]
	mov rax, r14
	mov qword ptr [rcx], r14
	mov rdx, r13
	jmp .LBB0_3
.LBB0_9:
	mov r8d, 4
	mov rdi, r15
	mov rsi, rbx
	mov rcx, r14
	mov r9, r12
	mov r13, rdx
	call qword ptr [rip + bump_scope::allocator_impl::shrink::shrink_unfit::<alloc::alloc::Global, 0x47240000000000000000000000000000>@GOTPCREL]
	mov rdx, r13
	test rax, rax
	jne .LBB0_3
	mov edi, 4
	mov rsi, r12
	call qword ptr [rip + alloc::raw_vec::handle_error@GOTPCREL]
	ud2
	mov rcx, qword ptr [r15]
	cmp rbx, qword ptr [rcx]
	jne .LBB0_11
	add r14, rbx
	jmp .LBB0_10
	mov rdx, qword ptr [rsp]
	test rdx, rdx
	je .LBB0_11
	mov rsi, qword ptr [rsp + 8]
	mov rcx, qword ptr [rsp + 16]
	mov rcx, qword ptr [rcx]
	cmp rsi, qword ptr [rcx]
	jne .LBB0_11
	lea r14, [rsi + 4*rdx]
.LBB0_10:
	and r14, -4
	mov qword ptr [rcx], r14
.LBB0_11:
	mov rdi, rax
	call _Unwind_Resume@PLT
