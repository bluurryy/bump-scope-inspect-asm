inspect_asm::alloc_iter_u32::up_a:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	test rdx, rdx
	je .LBB0_5
	mov r14, rsi
	lea r12, [4*rdx]
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rsi, qword ptr [rcx + 8]
	sub rsi, rax
	cmp r12, rsi
	jg .LBB0_7
	lea rsi, [r12 + rax]
	mov qword ptr [rcx], rsi
.LBB0_0:
	mov qword ptr [rsp + 8], rax
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 32], rdi
	mov r13, -3
	xor ebx, ebx
	lea rdi, [rsp + 8]
	mov rbp, qword ptr [rip + <bump_scope::bump_vec::BumpVec<u32, &bump_scope::bump_scope::BumpScope<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4>>>>::generic_grow_amortized::<core::convert::Infallible>@GOTPCREL]
.LBB0_1:
	mov r15d, dword ptr [r14 + 4*rbx]
	cmp rbx, qword ptr [rsp + 24]
	je .LBB0_3
.LBB0_2:
	mov dword ptr [rax + 4*rbx], r15d
	inc rbx
	mov qword ptr [rsp + 16], rbx
	lea rcx, [r12 + r13]
	add rcx, -4
	add r13, -4
	cmp rcx, -3
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov esi, 1
	call rbp
	mov rax, qword ptr [rsp + 8]
	lea rdi, [rsp + 8]
	jmp .LBB0_2
.LBB0_4:
	mov rax, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 24]
	cmp rdx, rbx
	jbe .LBB0_6
	mov rcx, qword ptr [rsp + 32]
	mov rcx, qword ptr [rcx]
	lea rdx, [rax + 4*rdx]
	cmp rdx, qword ptr [rcx]
	jne .LBB0_6
	mov rdx, rax
	sub rdx, r13
	and rdx, -4
	mov qword ptr [rcx], rdx
	jmp .LBB0_6
.LBB0_5:
	mov eax, 4
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
	mov rbx, rdi
	mov rsi, rdx
	mov r15, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4>>>::alloc_slice_in_another_chunk::<core::convert::Infallible, u32>@GOTPCREL]
	mov rdi, rbx
	mov rdx, r15
	jmp .LBB0_0
	mov rdx, qword ptr [rsp + 24]
	test rdx, rdx
	je .LBB0_8
	mov rcx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 32]
	lea rdi, [rcx + 4*rdx]
	mov rdx, qword ptr [rsi]
	cmp rdi, qword ptr [rdx]
	jne .LBB0_8
	add rcx, 3
	and rcx, -4
	mov qword ptr [rdx], rcx
.LBB0_8:
	mov rdi, rax
	call _Unwind_Resume@PLT
