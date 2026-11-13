inspect_asm::alloc_try_u32::down:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	push rax
	mov r14, rsi
	mov rbx, rdi
	mov r15, qword ptr [rsi]
	mov r13, qword ptr [r15]
	mov r12, r13
	and r12, -4
	add r12, -8
	cmp r12, qword ptr [r15 + 8]
	jb .LBB0_4
	mov qword ptr [r15], r12
.LBB0_0:
	call rdx
	mov dword ptr [r12], eax
	mov dword ptr [r12 + 4], edx
	test al, 1
	je .LBB0_2
	mov rax, qword ptr [r14]
	cmp r12, qword ptr [rax]
	jne .LBB0_1
	mov rax, qword ptr [r15]
	and rax, -64
	cmp rax, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	je .LBB0_5
	mov qword ptr [r15], r13
	mov qword ptr [r14], r15
.LBB0_1:
	mov dword ptr [rbx + 4], edx
	mov eax, 1
	jmp .LBB0_3
.LBB0_2:
	add r12, 4
	mov qword ptr [rbx + 8], r12
	xor eax, eax
.LBB0_3:
	mov dword ptr [rbx], eax
	mov rax, rbx
	add rsp, 8
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_4:
	mov rdi, r14
	mov r12, rdx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x87940000000000000000000000000000, alloc::alloc::Global, false>>::alloc_sized_in_another_chunk::<!, core::mem::maybe_uninit::MaybeUninit<core::result::Result<u32, u32>>>@GOTPCREL]
	mov rdx, r12
	mov r12, rax
	jmp .LBB0_0
.LBB0_5:
	mov ebp, edx
	mov rdi, r14
	mov rsi, r15
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x87940000000000000000000000000000, alloc::alloc::Global, false>>::reset_to_with_dummy_checkpoint@GOTPCREL]
	mov edx, ebp
	jmp .LBB0_1
