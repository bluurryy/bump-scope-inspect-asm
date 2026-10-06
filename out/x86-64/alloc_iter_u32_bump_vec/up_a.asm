inspect_asm::alloc_iter_u32_bump_vec::up_a:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	movups xmm0, xmmword ptr [rip + .Lanon.facade.0]
	movaps xmmword ptr [rsp], xmm0
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdi
	test rdx, rdx
	je .LBB0_3
	mov r14, rdx
	mov r15, rsi
	shl r14, 2
	lea rbp, [r14 - 4]
	neg r14
	mov eax, 4
	xor ebx, ebx
	xor r13d, r13d
	jmp .LBB0_1
.LBB0_0:
	mov dword ptr [rax + 4*rbx], r12d
	inc rbx
	mov qword ptr [rsp + 8], rbx
	add r13, -4
	cmp r14, r13
	je .LBB0_2
.LBB0_1:
	mov r12d, dword ptr [r15 + 4*rbx]
	cmp rbx, qword ptr [rsp + 16]
	jne .LBB0_0
	mov rsi, rbp
	add rsi, r13
	shr rsi, 2
	inc rsi
	mov rdi, rsp
	call qword ptr [rip + <bump_scope::mut_bump_vec::MutBumpVec<u32, &mut bump_scope::bump_scope::BumpScope<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings<4>>>>::generic_grow_amortized::<core::convert::Infallible>@GOTPCREL]
	mov rax, qword ptr [rsp]
	jmp .LBB0_0
.LBB0_2:
	cmp qword ptr [rsp + 16], 0
	je .LBB0_3
	mov rax, qword ptr [rsp]
	mov rcx, qword ptr [rsp + 24]
	mov rcx, qword ptr [rcx]
	mov rdx, rax
	sub rdx, r13
	mov qword ptr [rcx], rdx
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
