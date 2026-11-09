inspect_asm::alloc_try_u32::try_down:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	push rax
	mov r15, rsi
	mov rbx, rdi
	mov r12, qword ptr [rsi]
	mov r13, qword ptr [r12]
	mov r14, r13
	and r14, -4
	add r14, -8
	cmp r14, qword ptr [r12 + 8]
	jb .LBB0_5
	mov qword ptr [r12], r14
.LBB0_0:
	call rdx
	mov dword ptr [r14], eax
	mov dword ptr [r14 + 4], edx
	test al, 1
	je .LBB0_2
	mov rax, qword ptr [r15]
	mov ebp, 1
	cmp r14, qword ptr [rax]
	jne .LBB0_1
	mov rax, qword ptr [r12]
	and rax, -64
	cmp rax, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	je .LBB0_6
	mov qword ptr [r12], r13
	mov qword ptr [r15], r12
.LBB0_1:
	xor r14d, r14d
	jmp .LBB0_3
.LBB0_2:
	add r14, 4
	xor ebp, ebp
.LBB0_3:
	mov dword ptr [rbx], ebp
	mov dword ptr [rbx + 4], edx
	mov qword ptr [rbx + 8], r14
.LBB0_4:
	mov rax, rbx
	add rsp, 8
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
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x87920000000000000000000000000000, alloc::alloc::Global, false>>::alloc_sized_in_another_chunk::<core::alloc::AllocError, core::mem::maybe_uninit::MaybeUninit<core::result::Result<u32, u32>>>@GOTPCREL]
	mov rdx, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_4
.LBB0_6:
	mov r14d, edx
	mov rdi, r15
	mov rsi, r12
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x87920000000000000000000000000000, alloc::alloc::Global, false>>::reset_to_with_dummy_checkpoint@GOTPCREL]
	mov edx, r14d
	jmp .LBB0_1
