inspect_asm::alloc_iter_u32_bump_vec::rev_up:
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
	mov r14, rdx
	mov r15, rsi
	shl r14, 2
	mov eax, 4
	xor r13d, r13d
	mov rbp, qword ptr [rip + <bump_scope::mut_bump_vec_rev::MutBumpVecRev<u32, &mut bump_scope::bump_scope::BumpScope>>::generic_grow_amortized::<core::convert::Infallible>@GOTPCREL]
	xor ebx, ebx
	jmp .LBB0_1
.LBB0_0:
	inc rbx
	mov dword ptr [rax + r13 - 4], r12d
	mov qword ptr [rsp + 24], rbx
	add r13, -4
	mov rcx, r14
	add rcx, r13
	je .LBB0_2
.LBB0_1:
	mov r12d, dword ptr [r15 + 4*rbx]
	cmp rbx, qword ptr [rsp + 32]
	jne .LBB0_0
	lea rsi, [r14 + r13]
	add rsi, -4
	shr rsi, 2
	inc rsi
	lea rdi, [rsp + 8]
	call rbp
	mov rax, qword ptr [rsp + 8]
	jmp .LBB0_0
.LBB0_2:
	mov rax, qword ptr [rsp + 32]
	test rax, rax
	je .LBB0_3
	mov rsi, qword ptr [rsp + 8]
	mov rcx, qword ptr [rsp + 16]
	mov r15, qword ptr [rcx]
	shl rax, 2
	mov r14, rsi
	sub r14, rax
	add rsi, r13
	mov rdx, r13
	neg rdx
	mov rdi, r14
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, r14
	mov rcx, r14
	sub rcx, r13
	mov qword ptr [r15], rcx
	jmp .LBB0_4
.LBB0_3:
	mov eax, 4
	xor ebx, ebx
.LBB0_4:
	mov rdx, rbx
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
