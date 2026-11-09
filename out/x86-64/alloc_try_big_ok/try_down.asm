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
	mov r15, rsi
	mov r12, qword ptr [rsi]
	mov r13, qword ptr [r12]
	xor r14d, r14d
	mov rax, r13
	sub rax, 1024
	cmovae r14, rax
	mov rbx, rdi
	and r14, -512
	cmp r14, qword ptr [r12 + 8]
	jb .LBB0_5
	mov qword ptr [r12], r14
.LBB0_0:
	mov qword ptr [rsp + 504], r13
	lea r13, [rsp + 512]
	mov rdi, r13
	call rdx
	mov edx, 1024
	mov rdi, r14
	mov rsi, r13
	call qword ptr [rip + memcpy@GOTPCREL]
	cmp dword ptr [r14], 1
	jne .LBB0_2
	mov ecx, dword ptr [r14 + 4]
	mov rax, qword ptr [r15]
	mov r13d, 1
	cmp r14, qword ptr [rax]
	jne .LBB0_1
	mov rax, qword ptr [r12]
	and rax, -64
	cmp rax, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	je .LBB0_6
	mov rax, qword ptr [rsp + 504]
	mov qword ptr [r12], rax
	mov qword ptr [r15], r12
.LBB0_1:
	xor r14d, r14d
	jmp .LBB0_3
.LBB0_2:
	add r14, 512
	xor r13d, r13d
.LBB0_3:
	mov dword ptr [rbx], r13d
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
	mov rdi, r15
	mov r14, rdx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x87920000000000000000000000000000, alloc::alloc::Global, false>>::alloc_sized_in_another_chunk::<core::alloc::AllocError, core::mem::maybe_uninit::MaybeUninit<core::result::Result<inspect_asm::big, u32>>>@GOTPCREL]
	mov rdx, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_4
.LBB0_6:
	mov rdi, r15
	mov rsi, r12
	mov r14d, ecx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x87920000000000000000000000000000, alloc::alloc::Global, false>>::reset_to_with_dummy_checkpoint@GOTPCREL]
	mov ecx, r14d
	jmp .LBB0_1
