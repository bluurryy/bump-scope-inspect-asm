inspect_asm::alloc_iter_u32::try_down:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	test rdx, rdx
	je .LBB0_5
	lea r14, [4*rdx]
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov r8, rax
	sub r8, qword ptr [rcx + 8]
	cmp r14, r8
	jg .LBB0_10
	sub rax, r14
	and rax, -4
	mov qword ptr [rcx], rax
.LBB0_0:
	mov qword ptr [rsp], rax
	mov qword ptr [rsp + 8], 0
	mov qword ptr [rsp + 16], rdx
	mov qword ptr [rsp + 24], rdi
	neg r14
	xor ecx, ecx
	mov rbx, rsp
	mov r15, qword ptr [rip + <bump_scope::bump_vec::BumpVec<u32, &bump_scope::bump_scope::BumpScope<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<1, false>>>>::generic_grow_amortized::<bump_scope::alloc::AllocError>@GOTPCREL]
	xor edx, edx
.LBB0_1:
	mov ebp, dword ptr [rsi + 4*rdx]
	cmp rdx, qword ptr [rsp + 16]
	je .LBB0_3
.LBB0_2:
	mov dword ptr [rax + 4*rdx], ebp
	inc rdx
	mov qword ptr [rsp + 8], rdx
	add rcx, -4
	cmp r14, rcx
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov qword ptr [rsp + 32], rcx
	mov r13, rsi
	mov r12, rdx
	mov esi, 1
	mov rdi, rbx
	call r15
	test al, al
	jne .LBB0_11
	mov rax, qword ptr [rsp]
	mov rdx, r12
	mov rsi, r13
	mov rcx, qword ptr [rsp + 32]
	jmp .LBB0_2
.LBB0_4:
	mov rsi, qword ptr [rsp]
	mov rax, qword ptr [rsp + 16]
	cmp rax, rdx
	jbe .LBB0_6
	mov rdi, qword ptr [rsp + 24]
	mov rbx, qword ptr [rdi]
	cmp rsi, qword ptr [rbx]
	jne .LBB0_6
	mov r14, rdx
	mov rdx, rsi
	sub rdx, rcx
	neg rcx
	lea rax, [rsi + 4*rax]
	xor edi, edi
	sub rax, rcx
	cmovae rdi, rax
	and rdi, -4
	cmp rdx, rdi
	jbe .LBB0_8
	mov rdx, rcx
	mov r15, rdi
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_9
.LBB0_5:
	mov esi, 4
	xor edx, edx
.LBB0_6:
	mov rax, rsi
.LBB0_7:
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_8:
	mov rdx, rcx
	mov r15, rdi
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_9:
	mov rax, r15
	mov qword ptr [rbx], r15
	mov rdx, r14
	jmp .LBB0_7
.LBB0_10:
	mov rbx, rdi
	mov r15, rsi
	mov rsi, rdx
	mov r12, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<1, false>>>::alloc_slice_in_another_chunk::<bump_scope::alloc::AllocError, u32>@GOTPCREL]
	mov rdi, rbx
	mov rdx, r12
	mov rsi, r15
	test rax, rax
	jne .LBB0_0
	jmp .LBB0_12
.LBB0_11:
	mov rax, qword ptr [rsp + 16]
	test rax, rax
	je .LBB0_12
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 24]
	mov rdx, qword ptr [rdx]
	cmp rcx, qword ptr [rdx]
	jne .LBB0_12
	lea rax, [rcx + 4*rax]
	mov qword ptr [rdx], rax
.LBB0_12:
	xor eax, eax
	jmp .LBB0_7
