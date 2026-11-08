inspect_asm::alloc_try_big_ok::up:
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
	mov qword ptr [rsp + 496], rdi
	mov r13, qword ptr [rsi]
	mov rax, qword ptr [r13]
	mov qword ptr [rsp + 504], rax
	lea r15, [rax - 1]
	and r15, -512
	mov rcx, r15
	add rcx, 1536
	mov rax, -1
	cmovae rax, rcx
	cmp rax, qword ptr [r13 + 8]
	ja .LBB0_5
	add r15, 512
	mov qword ptr [r13], rax
.LBB0_0:
	mov rax, qword ptr [r14]
	mov rbx, qword ptr [rax]
	lea r12, [rsp + 512]
	mov rdi, r12
	call rdx
	mov edx, 1024
	mov rdi, r15
	mov rsi, r12
	call qword ptr [rip + memcpy@GOTPCREL]
	cmp dword ptr [r15], 1
	jne .LBB0_3
	mov r9d, dword ptr [r15 + 4]
	mov rcx, qword ptr [r14]
	cmp rbx, qword ptr [rcx]
	jne .LBB0_2
	mov rdx, qword ptr [r13]
	mov rsi, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	lea rdi, [rsi + 32]
	cmp rdx, rdi
	je .LBB0_2
	add rsi, 16
	cmp rdx, rsi
	je .LBB0_6
	mov rcx, qword ptr [rsp + 504]
.LBB0_1:
	mov qword ptr [r13], rcx
	mov qword ptr [r14], r13
.LBB0_2:
	mov rax, qword ptr [rsp + 496]
	mov dword ptr [rax + 4], r9d
	mov ecx, 1
	jmp .LBB0_4
.LBB0_3:
	add r15, 512
	mov rax, qword ptr [rsp + 496]
	mov qword ptr [rax + 8], r15
	xor ecx, ecx
.LBB0_4:
	mov dword ptr [rax], ecx
	lea rsp, [rbp - 40]
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_5:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x8f920000000000000000000000000000, alloc::alloc::Global, false>>::alloc_sized_in_another_chunk::<!, core::mem::maybe_uninit::MaybeUninit<core::result::Result<inspect_asm::big, u32>>>@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	jmp .LBB0_0
.LBB0_6:
	mov rdx, qword ptr [rip + bump_scope::chunk_types::dummy_memory_region::DUMMY_MEMORY_REGION@GOTPCREL]
	lea rsi, [rdx + 16]
	cmp rbx, rsi
	setne sil
	add rdx, 32
	cmp rbx, rdx
	setne dl
	and dl, sil
	cmp dl, 1
	jne .LBB0_2
.LBB0_7:
	mov r13, rcx
	mov rcx, qword ptr [rcx + 16]
	test rcx, rcx
	jne .LBB0_7
	lea rcx, [r13 + 32]
	jmp .LBB0_1
