inspect_asm::alloc_try_u32::try_up:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	push rax
	mov r14, rsi
	mov rbx, rdi
	mov r12, qword ptr [rsi]
	mov r13, qword ptr [r12]
	lea r15, [r13 + 3]
	and r15, -4
	lea rax, [r15 + 8]
	cmp rax, qword ptr [r12 + 8]
	ja .LBB0_6
	mov qword ptr [r12], rax
.LBB0_0:
	mov rax, qword ptr [r14]
	mov rbp, qword ptr [rax]
	call rdx
	mov dword ptr [r15], eax
	mov dword ptr [r15 + 4], edx
	test al, 1
	je .LBB0_3
	mov rcx, qword ptr [r14]
	mov eax, 1
	cmp rbp, qword ptr [rcx]
	jne .LBB0_2
	mov rsi, qword ptr [r12]
	mov rdi, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	lea r8, [rdi + 32]
	cmp rsi, r8
	je .LBB0_2
	add rdi, 16
	cmp rsi, rdi
	je .LBB0_7
	mov qword ptr [r12], r13
.LBB0_1:
	mov qword ptr [r14], r12
.LBB0_2:
	xor r15d, r15d
	jmp .LBB0_4
.LBB0_3:
	add r15, 4
	xor eax, eax
.LBB0_4:
	mov dword ptr [rbx], eax
	mov dword ptr [rbx + 4], edx
	mov qword ptr [rbx + 8], r15
.LBB0_5:
	mov rax, rbx
	add rsp, 8
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_6:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x8f920000000000000000000000000000, alloc::alloc::Global, false>>::alloc_sized_in_another_chunk::<core::alloc::AllocError, core::mem::maybe_uninit::MaybeUninit<core::result::Result<u32, u32>>>@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_5
.LBB0_7:
	mov rsi, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	lea rdi, [rsi + 16]
	cmp rbp, rdi
	setne dil
	add rsi, 32
	cmp rbp, rsi
	setne sil
	and sil, dil
	cmp sil, 1
	jne .LBB0_2
.LBB0_8:
	mov r12, rcx
	mov rcx, qword ptr [rcx + 16]
	test rcx, rcx
	jne .LBB0_8
	lea rcx, [r12 + 32]
	mov qword ptr [r12], rcx
	jmp .LBB0_1
