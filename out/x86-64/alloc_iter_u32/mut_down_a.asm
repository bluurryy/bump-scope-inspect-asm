inspect_asm::alloc_iter_u32::mut_down_a:
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
	mov r9, rcx
	sub r9, r8
	cmp rdx, r9
	jg .LBB0_7
	add r8, 3
	and r8, -4
.LBB0_0:
	mov r9, rcx
	sub r9, r8
	mov r8, r9
	shr r8, 2
	and r9, -4
	sub rcx, r9
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], 0
	mov qword ptr [rsp + 16], r8
	mov qword ptr [rsp + 24], rdi
	neg rdx
	xor r14d, r14d
	mov r15, rsp
	mov r12, qword ptr [rip + <bump_scope::mut_bump_vec::MutBumpVec<u32, &mut bump_scope::bump_scope::BumpScope<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4, false>>>>::generic_grow_amortized::<core::convert::Infallible>@GOTPCREL]
	xor ebx, ebx
.LBB0_1:
	mov ebp, dword ptr [rsi + 4*rbx]
	cmp rbx, qword ptr [rsp + 16]
	je .LBB0_3
.LBB0_2:
	mov dword ptr [rcx + 4*rbx], ebp
	inc rbx
	mov qword ptr [rsp + 8], rbx
	add r14, -4
	cmp rdx, r14
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov qword ptr [rsp + 32], rsi
	mov esi, 1
	mov rdi, r15
	mov r13, rdx
	call r12
	mov rsi, qword ptr [rsp + 32]
	mov rdx, r13
	mov eax, 4
	mov rcx, qword ptr [rsp]
	jmp .LBB0_2
.LBB0_4:
	mov rcx, qword ptr [rsp + 16]
	test rcx, rcx
	je .LBB0_5
	mov rsi, qword ptr [rsp]
	mov rax, qword ptr [rsp + 24]
	mov r12, qword ptr [rax]
	lea r15, [rsi + 4*rcx]
	add r15, r14
	neg r14
	mov rdi, r15
	mov rdx, r14
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, r15
	mov qword ptr [r12], r15
	jmp .LBB0_6
.LBB0_5:
	xor ebx, ebx
.LBB0_6:
	mov rdx, rbx
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_7:
	mov r15, rsi
	mov esi, 4
	mov r14, rdi
	mov rbx, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4, false>>>::prepare_allocation_range_in_another_chunk::<core::convert::Infallible>@GOTPCREL]
	mov rdi, r14
	mov rsi, r15
	mov r8, rax
	mov eax, 4
	mov rcx, rdx
	mov rdx, rbx
	jmp .LBB0_0
