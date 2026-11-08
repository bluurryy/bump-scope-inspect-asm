inspect_asm::alloc_iter_u32::mut_down_a:
	push r15
	push r14
	push r12
	push rbx
	sub rsp, 40
	mov rbx, rdx
	lea rdx, [4*rdx]
	mov rax, qword ptr [rdi]
	mov r14, qword ptr [rax]
	mov rax, qword ptr [rax + 8]
	mov rcx, r14
	sub rcx, rax
	cmp rdx, rcx
	jg .LBB0_3
	add rax, 3
	and rax, -4
.LBB0_0:
	mov rcx, r14
	sub rcx, rax
	mov rax, rcx
	shr rax, 2
	and rcx, -4
	sub r14, rcx
	mov qword ptr [rsp + 8], rax
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], 0
	cmp rbx, rax
	ja .LBB0_4
	xor r15d, r15d
	test rbx, rbx
	je .LBB0_2
.LBB0_1:
	lea rdi, [r14 + 4*r15]
	call qword ptr [rip + memcpy@GOTPCREL]
	add r15, rbx
.LBB0_2:
	mov rax, qword ptr [rsp + 8]
	mov rcx, qword ptr [rsp + 24]
	mov r12, qword ptr [rcx]
	lea rbx, [r14 + 4*rax]
	lea rdx, [4*r15]
	sub rbx, rdx
	mov rdi, rbx
	mov rsi, r14
	call qword ptr [rip + memmove@GOTPCREL]
	mov qword ptr [r12], rbx
	mov rax, rbx
	mov rdx, r15
	add rsp, 40
	pop rbx
	pop r12
	pop r14
	pop r15
	ret
.LBB0_3:
	mov r12, rsi
	mov esi, 4
	mov r14, rdi
	mov r15, rdx
	call qword ptr [rip + <bump_scope::bump_imp::BumpImp<0xa7920000000000000000000000000000, alloc::alloc::Global, false>>::prepare_allocation_range_in_another_chunk::<!>@GOTPCREL]
	mov rdi, r14
	mov rsi, r12
	mov r14, rdx
	mov rdx, r15
	jmp .LBB0_0
.LBB0_4:
	lea rdi, [rsp + 8]
	mov ecx, 4
	mov r8d, 4
	mov r14, rsi
	xor esi, esi
	mov r15, rdx
	mov rdx, rbx
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<bump_scope::containers::mut_bump_vec::AllocatorWrapper<bump_scope::bump::Bump<0xa7920000000000000000000000000000>>>
	mov rdx, r15
	mov rsi, r14
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 32]
	jmp .LBB0_1
