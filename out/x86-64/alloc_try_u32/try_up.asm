inspect_asm::alloc_try_u32::try_up:
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
	lea r14, [r13 + 3]
	and r14, -4
	lea rax, [r14 + 8]
	cmp rax, qword ptr [r12 + 8]
	ja .LBB0_4
	mov qword ptr [r12], rax
.LBB0_0:
	mov rax, qword ptr [r15]
	mov rbp, qword ptr [rax]
	call rdx
	mov dword ptr [r14], eax
	mov dword ptr [r14 + 4], edx
	add r14, 4
	cmp eax, 1
	jne .LBB0_1
	mov rcx, qword ptr [r15]
	mov eax, 1
	cmp rbp, qword ptr [rcx]
	jne .LBB0_2
	mov rcx, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	add rcx, 32
	cmp qword ptr [r12], rcx
	je .LBB0_2
	mov qword ptr [r12], r13
	mov qword ptr [r15], r12
	jmp .LBB0_2
.LBB0_1:
	xor eax, eax
.LBB0_2:
	mov dword ptr [rbx], eax
	mov dword ptr [rbx + 4], edx
	mov qword ptr [rbx + 8], r14
.LBB0_3:
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
	mov rdi, r15
	mov r14, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<alloc::alloc::Global, 0x17240000000000000000000000000000>>::alloc_sized_in_another_chunk::<core::alloc::AllocError, core::result::Result<u32, u32>>@GOTPCREL]
	mov rdx, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_3
