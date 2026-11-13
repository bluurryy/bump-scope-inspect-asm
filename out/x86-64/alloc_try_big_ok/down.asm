inspect_asm::alloc_try_big_ok::down:
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
	mov r15, qword ptr [rsi]
	mov rax, qword ptr [r15]
	xor r12d, r12d
	mov qword ptr [rsp + 504], rax
	sub rax, 1024
	cmovae r12, rax
	mov rbx, rdi
	and r12, -512
	cmp r12, qword ptr [r15 + 8]
	jb .LBB0_4
	mov qword ptr [r15], r12
.LBB0_0:
	lea r13, [rsp + 512]
	mov rdi, r13
	call rdx
	mov edx, 1024
	mov rdi, r12
	mov rsi, r13
	call qword ptr [rip + memcpy@GOTPCREL]
	cmp dword ptr [r12], 1
	jne .LBB0_2
	mov r13d, dword ptr [r12 + 4]
	mov rax, qword ptr [r14]
	cmp r12, qword ptr [rax]
	jne .LBB0_1
	mov rax, qword ptr [r15]
	and rax, -64
	cmp rax, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	je .LBB0_5
	mov rax, qword ptr [rsp + 504]
	mov qword ptr [r15], rax
	mov qword ptr [r14], r15
.LBB0_1:
	mov dword ptr [rbx + 4], r13d
	mov eax, 1
	jmp .LBB0_3
.LBB0_2:
	add r12, 512
	mov qword ptr [rbx + 8], r12
	xor eax, eax
.LBB0_3:
	mov dword ptr [rbx], eax
	mov rax, rbx
	lea rsp, [rbp - 40]
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
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x87940000000000000000000000000000, alloc::alloc::Global, false>>::alloc_sized_in_another_chunk::<!, core::mem::maybe_uninit::MaybeUninit<core::result::Result<inspect_asm::big, u32>>>@GOTPCREL]
	mov rdx, r12
	mov r12, rax
	jmp .LBB0_0
.LBB0_5:
	mov rdi, r14
	mov rsi, r15
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x87940000000000000000000000000000, alloc::alloc::Global, false>>::reset_to_with_dummy_checkpoint@GOTPCREL]
	jmp .LBB0_1
