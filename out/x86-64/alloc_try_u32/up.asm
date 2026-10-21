inspect_asm::alloc_try_u32::up:
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
	ja .LBB0_4
	mov qword ptr [r12], rax
.LBB0_0:
	mov rax, qword ptr [r14]
	mov rbp, qword ptr [rax]
	call rdx
	mov dword ptr [r15], eax
	mov dword ptr [r15 + 4], edx
	cmp eax, 1
	jne .LBB0_2
	mov rax, qword ptr [r14]
	cmp rbp, qword ptr [rax]
	jne .LBB0_1
	mov rax, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	add rax, 32
	cmp qword ptr [r12], rax
	je .LBB0_1
	mov qword ptr [r12], r13
	mov qword ptr [r14], r12
.LBB0_1:
	mov dword ptr [rbx + 4], edx
	mov eax, 1
	jmp .LBB0_3
.LBB0_2:
	add r15, 4
	mov qword ptr [rbx + 8], r15
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
	mov r15, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<alloc::alloc::Global, 0x17240000000000000000000000000000>>::alloc_sized_in_another_chunk::<!, core::result::Result<u32, u32>>@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	jmp .LBB0_0
