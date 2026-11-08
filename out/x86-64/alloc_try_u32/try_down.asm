inspect_asm::alloc_try_u32::try_down:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r15, rsi
	mov rbx, rdi
	mov r12, qword ptr [rsi]
	mov r13, qword ptr [r12]
	mov r14, r13
	and r14, -4
	add r14, -8
	cmp r14, qword ptr [r12 + 8]
	jb .LBB0_6
	mov qword ptr [r12], r14
.LBB0_0:
	call rdx
	mov dword ptr [r14], eax
	mov dword ptr [r14 + 4], edx
	test al, 1
	je .LBB0_3
	mov rcx, qword ptr [r15]
	mov eax, 1
	cmp r14, qword ptr [rcx]
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
	mov qword ptr [r15], r12
.LBB0_2:
	xor r14d, r14d
	jmp .LBB0_4
.LBB0_3:
	add r14, 4
	xor eax, eax
.LBB0_4:
	mov dword ptr [rbx], eax
	mov dword ptr [rbx + 4], edx
	mov qword ptr [rbx + 8], r14
.LBB0_5:
	mov rax, rbx
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB0_6:
	mov rdi, r15
	mov r14, rdx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x87920000000000000000000000000000, alloc::alloc::Global, false>>::alloc_sized_in_another_chunk::<core::alloc::AllocError, core::mem::maybe_uninit::MaybeUninit<core::result::Result<u32, u32>>>@GOTPCREL]
	mov rdx, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_5
.LBB0_7:
	mov rsi, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	lea rdi, [rsi + 16]
	cmp r14, rdi
	setne dil
	add rsi, 32
	cmp r14, rsi
	setne sil
	and sil, dil
	cmp sil, 1
	jne .LBB0_2
.LBB0_8:
	mov r12, rcx
	mov rcx, qword ptr [rcx + 16]
	test rcx, rcx
	jne .LBB0_8
	mov qword ptr [r12], r12
	jmp .LBB0_1
