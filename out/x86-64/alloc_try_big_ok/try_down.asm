inspect_asm::alloc_try_big_ok::try_down:
	push rbp
	mov rbp, rsp
	push r15
	push r14
	push r13
	push r12
	push rbx
	and rsp, -512
	sub rsp, 2048
	mov r13, qword ptr [rsi]
	mov r15, qword ptr [r13]
	xor r14d, r14d
	mov rax, r15
	sub rax, 1024
	cmovae r14, rax
	mov rbx, rdi
	and r14, -512
	cmp r14, qword ptr [r13 + 8]
	jb .LBB0_5
	mov qword ptr [r13], r14
.LBB0_0:
	mov qword ptr [rsp + 504], rsi
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r14
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	cmp dword ptr [r14], 1
	jne .LBB0_2
	mov ecx, dword ptr [r14 + 4]
	mov r9, qword ptr [rsp + 504]
	mov rdx, qword ptr [r9]
	mov eax, 1
	cmp r14, qword ptr [rdx]
	jne .LBB0_1
	mov rsi, qword ptr [r13]
	mov rdi, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	lea r8, [rdi + 32]
	cmp rsi, r8
	je .LBB0_1
	add rdi, 16
	cmp rsi, rdi
	je .LBB0_6
	mov qword ptr [r13], r15
	mov qword ptr [r9], r13
.LBB0_1:
	xor r14d, r14d
	jmp .LBB0_3
.LBB0_2:
	add r14, 512
	xor eax, eax
.LBB0_3:
	mov dword ptr [rbx], eax
	mov dword ptr [rbx + 4], ecx
	mov qword ptr [rbx + 8], r14
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
	mov rdi, rsi
	mov r14, rdx
	mov r12, rsi
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x87920000000000000000000000000000, alloc::alloc::Global, false>>::alloc_sized_in_another_chunk::<core::alloc::AllocError, core::mem::maybe_uninit::MaybeUninit<core::result::Result<inspect_asm::big, u32>>>@GOTPCREL]
	mov rsi, r12
	mov rdx, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_4
.LBB0_6:
	mov rsi, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	lea rdi, [rsi + 16]
	cmp r14, rdi
	setne dil
	add rsi, 32
	cmp r14, rsi
	setne sil
	and sil, dil
	cmp sil, 1
	jne .LBB0_1
.LBB0_7:
	mov rsi, rdx
	mov rdx, qword ptr [rdx + 16]
	test rdx, rdx
	jne .LBB0_7
	mov qword ptr [rsi], rsi
	mov rdx, qword ptr [rsp + 504]
	mov qword ptr [rdx], rsi
	jmp .LBB0_1
