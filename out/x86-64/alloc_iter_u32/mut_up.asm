inspect_asm::alloc_iter_u32::mut_up:
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
	add rcx, 3
	and rcx, -4
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
	xor ebx, ebx
	mov r14, rsp
	mov r12, qword ptr [rip + <bump_scope::mut_bump_vec::MutBumpVec<u32, &mut bump_scope::bump_scope::BumpScope>>::generic_grow_amortized::<core::convert::Infallible>@GOTPCREL]
	xor r15d, r15d
.LBB0_1:
	mov ebp, dword ptr [rsi + 4*rbx]
	cmp rbx, qword ptr [rsp + 16]
	je .LBB0_3
.LBB0_2:
	mov dword ptr [rcx + 4*rbx], ebp
	inc rbx
	mov qword ptr [rsp + 8], rbx
	add r15, -4
	cmp rdx, r15
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov qword ptr [rsp + 32], rsi
	mov esi, 1
	mov rdi, r14
	mov r13, rdx
	call r12
	mov rsi, qword ptr [rsp + 32]
	mov rdx, r13
	mov eax, 4
	mov rcx, qword ptr [rsp]
	jmp .LBB0_2
.LBB0_4:
	cmp qword ptr [rsp + 16], 0
	je .LBB0_5
	mov rax, qword ptr [rsp]
	mov rcx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rcx]
	mov rdx, rax
	sub rdx, r15
	mov qword ptr [rcx], rdx
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
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings>>::prepare_allocation_range_in_another_chunk::<core::convert::Infallible>@GOTPCREL]
	mov rdi, r14
	mov rsi, r15
	mov rcx, rax
	mov eax, 4
	mov r8, rdx
	mov rdx, rbx
	jmp .LBB0_0
