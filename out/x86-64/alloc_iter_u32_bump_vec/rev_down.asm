inspect_asm::alloc_iter_u32_bump_vec::rev_down:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 8], 4
	xorps xmm0, xmm0
	movups xmmword ptr [rsp + 24], xmm0
	mov qword ptr [rsp + 16], rdi
	test rdx, rdx
	je .LBB0_3
	mov r15, rdx
	mov r12, rsi
	shl r15, 2
	lea rbp, [r15 - 4]
	neg r15
	mov eax, 4
	xor ebx, ebx
	xor r14d, r14d
	jmp .LBB0_1
.LBB0_0:
	inc r14
	mov dword ptr [rax + rbx - 4], r13d
	mov qword ptr [rsp + 24], r14
	add rbx, -4
	cmp r15, rbx
	je .LBB0_2
.LBB0_1:
	mov r13d, dword ptr [r12 + 4*r14]
	cmp r14, qword ptr [rsp + 32]
	jne .LBB0_0
	lea rsi, [rbx + rbp]
	shr rsi, 2
	inc rsi
	lea rdi, [rsp + 8]
	call qword ptr [rip + <bump_scope::mut_bump_vec_rev::MutBumpVecRev<u32, &mut bump_scope::bump_scope::BumpScope<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<1, false>>>>::generic_grow_amortized::<core::convert::Infallible>@GOTPCREL]
	mov rax, qword ptr [rsp + 8]
	jmp .LBB0_0
.LBB0_2:
	cmp qword ptr [rsp + 32], 0
	je .LBB0_3
	mov rax, qword ptr [rsp + 16]
	mov rax, qword ptr [rax]
	add rbx, qword ptr [rsp + 8]
	mov qword ptr [rax], rbx
	jmp .LBB0_4
.LBB0_3:
	mov ebx, 4
	xor r14d, r14d
.LBB0_4:
	mov rax, rbx
	mov rdx, r14
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
