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
	mov rdi, qword ptr [r14]
	mov rcx, qword ptr [rdi]
	mov edx, dword ptr [r15]
	lea rsi, [r15 + 512]
	add r15, 4
	test edx, edx
	cmove r15, rsi
	cmp edx, 1
	jne .LBB0_2
	mov edx, dword ptr [r15]
	cmp rbx, rcx
	mov rax, qword ptr [rsp + 496]
	jne .LBB0_1
	mov rcx, qword ptr [rsp + 504]
	mov qword ptr [r13], rcx
	mov qword ptr [r14], r13
.LBB0_1:
	mov dword ptr [rax + 4], edx
	mov ecx, 1
	jmp .LBB0_4
.LBB0_2:
	cmp rbx, rcx
	mov rax, qword ptr [rsp + 496]
	jne .LBB0_3
	lea rcx, [r15 + 512]
	mov qword ptr [rdi], rcx
.LBB0_3:
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
	mov rbx, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<alloc::alloc::Global, bump_scope::settings::BumpSettings>>::alloc_sized_in_another_chunk::<!, core::result::Result<inspect_asm::big, u32>>@GOTPCREL]
	mov rdx, rbx
	mov r15, rax
	jmp .LBB0_0
