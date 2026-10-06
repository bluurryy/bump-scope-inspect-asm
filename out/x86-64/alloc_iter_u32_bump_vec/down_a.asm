inspect_asm::alloc_iter_u32_bump_vec::down_a:
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
	mov r15, rdx
	mov r12, rsi
	shl r15, 2
	mov eax, 4
	xor r14d, r14d
	mov rbp, qword ptr [rip + bump_scope::mut_bump_vec::MutBumpVec<T,A>::generic_grow_amortized@GOTPCREL]
	xor ebx, ebx
	jmp .LBB0_1
.LBB0_0:
	mov dword ptr [rax + 4*rbx], r13d
	inc rbx
	mov qword ptr [rsp + 8], rbx
	add r14, -4
	mov rcx, r15
	add rcx, r14
	je .LBB0_2
.LBB0_1:
	mov r13d, dword ptr [r12 + 4*rbx]
	cmp rbx, qword ptr [rsp + 16]
	jne .LBB0_0
	lea rsi, [r15 + r14]
	add rsi, -4
	shr rsi, 2
	inc rsi
	mov rdi, rsp
	call rbp
	mov rax, qword ptr [rsp]
	jmp .LBB0_0
.LBB0_2:
	mov rax, qword ptr [rsp + 16]
	test rax, rax
	je .LBB0_3
	mov rsi, qword ptr [rsp]
	mov rcx, qword ptr [rsp + 24]
	mov r12, qword ptr [rcx]
	lea r15, [rsi + 4*rax]
	add r15, r14
	neg r14
	mov rdi, r15
	mov rdx, r14
	call qword ptr [rip + memmove@GOTPCREL]
	mov rax, r15
	mov qword ptr [r12], r15
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
