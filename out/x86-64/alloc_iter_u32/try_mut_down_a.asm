inspect_asm::alloc_iter_u32::try_mut_down_a:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 72
	mov r14, rsi
	mov r12, rdi
	lea rcx, [4*rdx]
	mov rax, qword ptr [rdi]
	mov rsi, qword ptr [rax]
	mov rax, qword ptr [rax + 8]
	mov rdi, rsi
	sub rdi, rax
	cmp rcx, rdi
	jg .LBB0_7
	add rax, 3
	and rax, -4
.LBB0_0:
	mov rcx, rsi
	sub rcx, rax
	mov r15, rcx
	shr r15, 2
	and rcx, -4
	sub rsi, rcx
	mov qword ptr [rsp + 16], r15
	mov qword ptr [rsp + 24], rsi
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 32], r12
	mov qword ptr [rsp + 40], 0
	test rdx, rdx
	je .LBB0_4
	lea r12, [r14 + 4*rdx]
	xor ebp, ebp
.LBB0_1:
	mov ebx, dword ptr [r14]
	add r14, 4
	cmp rbp, r15
	je .LBB0_3
	lea r13, [rbp + 1]
.LBB0_2:
	mov dword ptr [rsi + 4*rbp], ebx
	mov qword ptr [rsp + 40], r13
	mov rbp, r13
	cmp r14, r12
	jne .LBB0_1
	jmp .LBB0_5
.LBB0_3:
	mov rax, r12
	sub rax, r14
	shr rax, 2
	lea r15, [rax + rbp]
	inc r15
	lea rax, [2*rbp]
	cmp rax, r15
	cmova r15, rax
	cmp r15, 5
	mov eax, 4
	cmovb r15, rax
	mov ecx, 4
	mov r8d, 4
	lea rdi, [rsp + 48]
	lea rsi, [rsp + 16]
	mov rdx, r15
	call <alloc::raw_vec::RawVecInner<bump_scope::containers::mut_bump_vec::AllocatorWrapper<bump_scope::bump::Bump<alloc::alloc::Global, 0x47240000000000000000000000000000>>>>::finish_grow
	cmp byte ptr [rsp + 48], 0
	jne .LBB0_8
	lea r13, [rbp + 1]
	mov rsi, qword ptr [rsp + 56]
	mov qword ptr [rsp + 24], rsi
	mov qword ptr [rsp + 16], r15
	jmp .LBB0_2
.LBB0_4:
	xor r13d, r13d
.LBB0_5:
	mov rax, qword ptr [rsp + 8]
	mov r14, qword ptr [rax]
	lea rbx, [rsi + 4*r15]
	lea rdx, [4*r13]
	sub rbx, rdx
	mov rdi, rbx
	call qword ptr [rip + memmove@GOTPCREL]
	mov qword ptr [r14], rbx
.LBB0_6:
	mov rax, rbx
	mov rdx, r13
	add rsp, 72
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_7:
	mov rbx, rdx
	mov esi, 4
	mov rdi, r12
	mov rdx, rcx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<alloc::alloc::Global, 0x47240000000000000000000000000000>>::prepare_allocation_range_in_another_chunk::<core::alloc::AllocError>@GOTPCREL]
	test rax, rax
	je .LBB0_8
	mov rsi, rdx
	mov rdx, rbx
	jmp .LBB0_0
.LBB0_8:
	xor ebx, ebx
	jmp .LBB0_6
