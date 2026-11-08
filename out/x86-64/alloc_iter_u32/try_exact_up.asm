inspect_asm::alloc_iter_u32::try_exact_up:
	push r15
	push r14
	push rbx
	lea r14, [4*rdx]
	mov rax, qword ptr [rdi]
	mov rbx, qword ptr [rax]
	mov rcx, qword ptr [rax + 8]
	add rbx, 3
	and rbx, -4
	sub rcx, rbx
	cmp r14, rcx
	jg .LBB0_3
	lea rcx, [rbx + r14]
	mov qword ptr [rax], rcx
.LBB0_0:
	test rdx, rdx
	je .LBB0_1
	mov rdi, rbx
	mov r15, rdx
	mov rdx, r14
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rdx, r15
	jmp .LBB0_2
.LBB0_1:
	xor edx, edx
.LBB0_2:
	mov rax, rbx
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_3:
	mov rbx, rsi
	mov rsi, rdx
	mov r15, rdx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0x17240000000000000000000000000000, alloc::alloc::Global, false>>::alloc_slice_in_another_chunk::<core::alloc::AllocError, core::mem::maybe_uninit::MaybeUninit<u32>>@GOTPCREL]
	mov rsi, rbx
	mov rdx, r15
	mov rbx, rax
	test rax, rax
	jne .LBB0_0
	xor ebx, ebx
	jmp .LBB0_2
