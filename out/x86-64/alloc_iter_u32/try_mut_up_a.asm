inspect_asm::alloc_iter_u32::try_mut_up_a:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov eax, 4
	test rdx, rdx
	je .LBB0_5
	shl rdx, 2
	mov r8, qword ptr [rdi]
	mov rcx, qword ptr [r8]
	mov r8, qword ptr [r8 + 8]
	mov r9, r8
	sub r9, rcx
	cmp rdx, r9
	jg .LBB0_7
	and r8, -4
.LBB0_0:
	sub r8, rcx
	shr r8, 2
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], 0
	mov qword ptr [rsp + 16], r8
	mov qword ptr [rsp + 24], rdi
	neg rdx
	xor edi, edi
	mov rbx, rsp
	mov r15, qword ptr [rip + <bump_scope::mut_bump_vec::MutBumpVec<u32, &mut bump_scope::bump_scope::BumpScope<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4>>>>::generic_grow_amortized::<bump_scope::alloc::AllocError>@GOTPCREL]
	xor r14d, r14d
.LBB0_1:
	mov ebp, dword ptr [rsi + 4*rdi]
	cmp rdi, qword ptr [rsp + 16]
	je .LBB0_3
.LBB0_2:
	mov dword ptr [rcx + 4*rdi], ebp
	inc rdi
	mov qword ptr [rsp + 8], rdi
	add r14, -4
	cmp rdx, r14
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov qword ptr [rsp + 32], rdi
	mov r13, rsi
	mov r12, rdx
	mov esi, 1
	mov rdi, rbx
	call r15
	test al, al
	jne .LBB0_8
	mov rcx, qword ptr [rsp]
	mov eax, 4
	mov rdx, r12
	mov rsi, r13
	mov rdi, qword ptr [rsp + 32]
	jmp .LBB0_2
.LBB0_4:
	cmp qword ptr [rsp + 16], 0
	je .LBB0_5
	mov rax, qword ptr [rsp]
	mov rcx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rcx]
	mov rdx, rax
	sub rdx, r14
	mov qword ptr [rcx], rdx
	jmp .LBB0_6
.LBB0_5:
	xor edi, edi
.LBB0_6:
	mov rdx, rdi
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_7:
	mov rbx, rsi
	mov esi, 4
	mov r14, rdi
	mov r15, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4>>>::prepare_allocation_range_in_another_chunk::<bump_scope::alloc::AllocError>@GOTPCREL]
	test rax, rax
	je .LBB0_8
	mov rcx, rax
	mov r8, rdx
	mov eax, 4
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r14
	jmp .LBB0_0
.LBB0_8:
	xor eax, eax
	jmp .LBB0_6
