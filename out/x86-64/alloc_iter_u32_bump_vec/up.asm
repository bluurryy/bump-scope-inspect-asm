inspect_asm::alloc_iter_u32_bump_vec::up:
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
	jne .LBB0_3
.LBB0_0:
	cmp qword ptr [rsp + 16], 0
	je .LBB0_1
	mov rcx, qword ptr [rsp + 24]
	mov rax, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rcx, qword ptr [rcx]
	lea rsi, [rax + 4*rdx]
	mov qword ptr [rcx], rsi
	jmp .LBB0_2
.LBB0_1:
	mov eax, 4
	xor edx, edx
.LBB0_2:
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_3:
	lea r14, [4*rdx]
	mov rbx, rsp
	mov rdi, rbx
	mov r15, rsi
	mov rsi, rdx
	call qword ptr [rip + bump_scope::mut_bump_vec::MutBumpVec<T,A>::generic_grow_amortized@GOTPCREL]
	mov rax, r15
	xor r12d, r12d
	mov rcx, qword ptr [rsp + 8]
	mov r13, qword ptr [rip + bump_scope::mut_bump_vec::MutBumpVec<T,A>::generic_grow_amortized@GOTPCREL]
.LBB0_4:
	mov ebp, dword ptr [rax + r12]
	cmp qword ptr [rsp + 16], rcx
	je .LBB0_6
.LBB0_5:
	mov rdx, qword ptr [rsp]
	mov dword ptr [rdx + 4*rcx], ebp
	inc rcx
	mov qword ptr [rsp + 8], rcx
	add r12, 4
	cmp r14, r12
	jne .LBB0_4
	jmp .LBB0_0
.LBB0_6:
	mov esi, 1
	mov rdi, rbx
	call r13
	mov rax, r15
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB0_5
