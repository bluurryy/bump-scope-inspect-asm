inspect_asm::alloc_try_big_ok::try_up_mut:
	push rbp
	mov rbp, rsp
	push r15
	push r14
	push r12
	push rbx
	and rsp, -512
	sub rsp, 1536
	mov r14, rsi
	mov rbx, rdi
	mov rax, qword ptr [rsi]
	mov r15, qword ptr [rax]
	dec r15
	and r15, -512
	mov rcx, r15
	add rcx, 1536
	mov rsi, -1
	cmovae rsi, rcx
	cmp rsi, qword ptr [rax + 8]
	ja .LBB0_4
	add r15, 512
.LBB0_0:
	mov r12, rsp
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r15
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	cmp dword ptr [r15], 1
	jne .LBB0_1
	mov ecx, dword ptr [r15 + 4]
	mov edx, 1
	jmp .LBB0_2
.LBB0_1:
	lea rax, [r15 + 512]
	add r15, 1024
	mov rcx, qword ptr [r14]
	mov qword ptr [rcx], r15
	xor edx, edx
.LBB0_2:
	mov dword ptr [rbx], edx
	mov dword ptr [rbx + 4], ecx
	mov qword ptr [rbx + 8], rax
.LBB0_3:
	mov rax, rbx
	lea rsp, [rbp - 32]
	pop rbx
	pop r12
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_4:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<alloc::alloc::Global, 0x17240000000000000000000000000000>>::prepare_allocation_in_another_chunk::<core::alloc::AllocError, core::result::Result<inspect_asm::big, u32>>@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_3
