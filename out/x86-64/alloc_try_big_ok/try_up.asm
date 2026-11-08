inspect_asm::alloc_try_big_ok::try_up:
	push rbp
	mov rbp, rsp
	push r15
	push r14
	push r13
	push r12
	push rbx
	and rsp, -512
	sub rsp, 2048
	mov r14, rsi
	mov rbx, rdi
	mov r13, qword ptr [rsi]
	mov r12, qword ptr [r13]
	lea r15, [r12 - 1]
	and r15, -512
	mov rcx, r15
	add rcx, 1536
	mov rax, -1
	cmovae rax, rcx
	cmp rax, qword ptr [r13 + 8]
	ja .LBB0_5
	add r15, 512
	mov qword ptr [r13], rax
.LBB0_0:
	mov qword ptr [rsp + 496], rbx
	mov qword ptr [rsp + 504], r12
	mov rax, qword ptr [r14]
	mov rbx, qword ptr [rax]
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r15
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	cmp dword ptr [r15], 1
	jne .LBB0_2
	mov ecx, dword ptr [r15 + 4]
	mov rdx, qword ptr [r14]
	mov eax, 1
	cmp rbx, qword ptr [rdx]
	jne .LBB0_1
	mov rsi, qword ptr [r13]
	mov rdi, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	lea r8, [rdi + 32]
	cmp rsi, r8
	je .LBB0_1
	add rdi, 16
	cmp rsi, rdi
	mov rsi, qword ptr [rsp + 504]
	je .LBB0_6
	mov qword ptr [r13], rsi
	mov qword ptr [r14], r13
.LBB0_1:
	xor r15d, r15d
	jmp .LBB0_3
.LBB0_2:
	add r15, 512
	xor eax, eax
.LBB0_3:
	mov rbx, qword ptr [rsp + 496]
	mov dword ptr [rbx], eax
	mov dword ptr [rbx + 4], ecx
	mov qword ptr [rbx + 8], r15
.LBB0_4:
	mov rax, rbx
	lea rsp, [rbp - 40]
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_5:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x8f920000000000000000000000000000, alloc::alloc::Global, false>>::alloc_sized_in_another_chunk::<core::alloc::AllocError, core::mem::maybe_uninit::MaybeUninit<core::result::Result<inspect_asm::big, u32>>>@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_4
.LBB0_6:
	mov rsi, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	lea rdi, [rsi + 16]
	cmp rbx, rdi
	setne dil
	add rsi, 32
	cmp rbx, rsi
	setne sil
	and sil, dil
	cmp sil, 1
	jne .LBB0_1
.LBB0_7:
	mov rsi, rdx
	mov rdx, qword ptr [rdx + 16]
	test rdx, rdx
	jne .LBB0_7
	lea rdx, [rsi + 32]
	mov qword ptr [rsi], rdx
	mov qword ptr [r14], rsi
	jmp .LBB0_1
