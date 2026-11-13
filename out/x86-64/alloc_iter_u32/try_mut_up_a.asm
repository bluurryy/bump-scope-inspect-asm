inspect_asm::alloc_iter_u32::try_mut_up_a:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 56
	mov r14, rsi
	mov rbx, rdi
	lea rcx, [4*rdx]
	mov rsi, qword ptr [rdi]
	mov rax, qword ptr [rsi]
	mov r15, qword ptr [rsi + 8]
	mov rsi, r15
	sub rsi, rax
	cmp rcx, rsi
	jg .LBB0_7
	and r15, -4
.LBB0_0:
	sub r15, rax
	shr r15, 2
	mov qword ptr [rsp], r15
	mov qword ptr [rsp + 8], rax
	mov qword ptr [rsp + 16], rbx
	mov qword ptr [rsp + 24], 0
	test rdx, rdx
	je .LBB0_4
	lea rbp, [r14 + 4*rdx]
	xor r12d, r12d
.LBB0_1:
	mov r13d, dword ptr [r14]
	add r14, 4
	cmp r12, r15
	je .LBB0_3
	lea rdx, [r12 + 1]
.LBB0_2:
	mov dword ptr [rax + 4*r12], r13d
	mov qword ptr [rsp + 24], rdx
	mov r12, rdx
	cmp r14, rbp
	jne .LBB0_1
	jmp .LBB0_5
.LBB0_3:
	mov rax, rbp
	sub rax, r14
	shr rax, 2
	lea r15, [r12 + rax]
	inc r15
	lea rax, [r12 + r12]
	cmp rax, r15
	cmova r15, rax
	cmp r15, 5
	mov eax, 4
	cmovb r15, rax
	mov ecx, 4
	mov r8d, 4
	lea rdi, [rsp + 32]
	mov rsi, rsp
	mov rdx, r15
	call <alloc::raw_vec::RawVecInner<bump_scope::containers::mut_bump_vec::AllocatorWrapper<bump_scope::bump::Bump<0xaf940000000000000000000000000000>>>>::finish_grow
	cmp byte ptr [rsp + 32], 0
	jne .LBB0_8
	lea rdx, [r12 + 1]
	mov rax, qword ptr [rsp + 40]
	mov qword ptr [rsp + 8], rax
	mov qword ptr [rsp], r15
	jmp .LBB0_2
.LBB0_4:
	xor edx, edx
.LBB0_5:
	mov rcx, qword ptr [rbx]
	lea rsi, [rax + 4*rdx]
	mov qword ptr [rcx], rsi
.LBB0_6:
	add rsp, 56
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_7:
	mov r12, rdx
	mov esi, 4
	mov rdi, rbx
	mov rdx, rcx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0xaf940000000000000000000000000000, alloc::alloc::Global, false>>::prepare_allocation_range_in_another_chunk::<core::alloc::AllocError>@GOTPCREL]
	test rax, rax
	je .LBB0_8
	mov r15, rdx
	mov rdx, r12
	jmp .LBB0_0
.LBB0_8:
	xor eax, eax
	jmp .LBB0_6
