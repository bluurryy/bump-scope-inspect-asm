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
	mov r15, rsi
	mov rbx, rdi
	mov r13, qword ptr [rsi]
	mov r12, qword ptr [r13]
	lea r14, [r12 - 1]
	and r14, -512
	mov rcx, r14
	add rcx, 1536
	mov rax, -1
	cmovae rax, rcx
	cmp rax, qword ptr [r13 + 8]
	ja .LBB0_6
	add r14, 512
	mov qword ptr [r13], rax
.LBB0_0:
	mov qword ptr [rsp + 504], r12
	mov rax, qword ptr [r15]
	mov rax, qword ptr [rax]
	mov qword ptr [rsp + 496], rax
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r14
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rcx, qword ptr [r15]
	mov rdx, qword ptr [rcx]
	mov eax, dword ptr [r14]
	lea rsi, [r14 + 512]
	add r14, 4
	test eax, eax
	cmove r14, rsi
	cmp eax, 1
	jne .LBB0_2
	mov ecx, dword ptr [r14]
	mov eax, 1
	cmp qword ptr [rsp + 496], rdx
	jne .LBB0_1
	mov rdx, qword ptr [rsp + 504]
	mov qword ptr [r13], rdx
	mov qword ptr [r15], r13
.LBB0_1:
	jmp .LBB0_4
.LBB0_2:
	xor eax, eax
	cmp qword ptr [rsp + 496], rdx
	jne .LBB0_3
	lea rdx, [r14 + 512]
	mov qword ptr [rcx], rdx
.LBB0_3:
.LBB0_4:
	mov dword ptr [rbx], eax
	mov dword ptr [rbx + 4], ecx
	mov qword ptr [rbx + 8], r14
.LBB0_5:
	mov rax, rbx
	lea rsp, [rbp - 40]
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_6:
	mov rdi, r15
	mov r14, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<alloc::alloc::Global, 0x1f240000000000000000000000000000>>::alloc_sized_in_another_chunk::<core::alloc::AllocError, core::result::Result<inspect_asm::big, u32>>@GOTPCREL]
	mov rdx, r14
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_5
