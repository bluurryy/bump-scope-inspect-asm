inspect_asm::alloc_try_u32::try_up_mut:
	push r15
	push r14
	push rbx
	mov r14, rsi
	mov rbx, rdi
	mov rax, qword ptr [rsi]
	mov r15, qword ptr [rax]
	add r15, 3
	and r15, -4
	lea rcx, [r15 + 8]
	cmp rcx, qword ptr [rax + 8]
	ja .LBB0_4
.LBB0_0:
	call rdx
	mov dword ptr [r15], eax
	mov dword ptr [r15 + 4], edx
	xor ecx, ecx
	test al, 1
	je .LBB0_1
	mov ecx, 1
	xor eax, eax
	jmp .LBB0_2
.LBB0_1:
	lea rax, [r15 + 4]
	add r15, 8
	mov rdx, qword ptr [r14]
	mov qword ptr [rdx], r15
.LBB0_2:
	mov dword ptr [rbx], ecx
	mov dword ptr [rbx + 4], edx
	mov qword ptr [rbx + 8], rax
.LBB0_3:
	mov rax, rbx
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_4:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x17240000000000000000000000000000, alloc::alloc::Global, false>>::prepare_allocation_in_another_chunk::<core::alloc::AllocError, core::result::Result<u32, u32>>@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	test rax, rax
	jne .LBB0_0
	mov dword ptr [rbx], 2
	jmp .LBB0_3
