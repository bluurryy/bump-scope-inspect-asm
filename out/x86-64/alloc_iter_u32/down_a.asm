inspect_asm::alloc_iter_u32::down_a:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	test rdx, rdx
	je .LBB0_6
	mov r15, rsi
	lea r13, [4*rdx]
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rsi, rax
	sub rsi, qword ptr [rcx + 8]
	cmp r13, rsi
	jg .LBB0_11
	sub rax, r13
	mov qword ptr [rcx], rax
.LBB0_0:
	mov qword ptr [rsp + 8], rax
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 32], rdi
	neg r13
	xor r14d, r14d
	lea rdi, [rsp + 8]
	mov rbp, qword ptr [rip + <bump_scope::bump_vec::BumpVec<u32, &bump_scope::bump_scope::BumpScope<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4, false>>>>::generic_grow_amortized::<core::convert::Infallible>@GOTPCREL]
	xor ebx, ebx
.LBB0_1:
	mov r12d, dword ptr [r15 + 4*rbx]
	cmp rbx, qword ptr [rsp + 24]
	je .LBB0_3
.LBB0_2:
	mov dword ptr [rax + 4*rbx], r12d
	inc rbx
	mov qword ptr [rsp + 16], rbx
	add r14, -4
	cmp r13, r14
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov esi, 1
	call rbp
	mov rax, qword ptr [rsp + 8]
	lea rdi, [rsp + 8]
	jmp .LBB0_2
.LBB0_4:
	mov rsi, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 24]
	cmp rax, rbx
	jbe .LBB0_5
	mov rcx, qword ptr [rsp + 32]
	mov r15, qword ptr [rcx]
	cmp rsi, qword ptr [r15]
	je .LBB0_7
.LBB0_5:
	mov rax, rsi
	jmp .LBB0_10
.LBB0_6:
	mov eax, 4
	xor ebx, ebx
	jmp .LBB0_10
.LBB0_7:
	mov rcx, rsi
	sub rcx, r14
	neg r14
	lea rax, [rsi + 4*rax]
	xor edi, edi
	sub rax, r14
	cmovae rdi, rax
	and rdi, -4
	mov rdx, r14
	mov r14, rdi
	cmp rcx, rdi
	jbe .LBB0_8
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_9
.LBB0_8:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_9:
	mov rax, r14
	mov qword ptr [r15], r14
.LBB0_10:
	mov rdx, rbx
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_11:
	mov rbx, rdi
	mov rsi, rdx
	mov r14, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4, false>>>::alloc_slice_in_another_chunk::<core::convert::Infallible, u32>@GOTPCREL]
	mov rdi, rbx
	mov rdx, r14
	jmp .LBB0_0
	mov rcx, qword ptr [rsp + 24]
	test rcx, rcx
	je .LBB0_12
	mov rsi, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 32]
	mov rdx, qword ptr [rdx]
	cmp rsi, qword ptr [rdx]
	jne .LBB0_12
	lea rcx, [rsi + 4*rcx]
	and rcx, -4
	mov qword ptr [rdx], rcx
.LBB0_12:
	mov rdi, rax
	call _Unwind_Resume@PLT
