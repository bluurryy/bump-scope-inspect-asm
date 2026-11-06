inspect_asm::alloc_iter_u32::down_a:
	push r15
	push r14
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 8], 0
	mov qword ptr [rsp + 16], 4
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], 0
	test rdx, rdx
	jne .LBB0_6
	mov eax, 4
	xor edx, edx
	mov rcx, qword ptr [rsp + 8]
	cmp rdx, rcx
	jae .LBB0_5
.LBB0_0:
	mov rsi, qword ptr [rsp + 24]
	mov r14, qword ptr [rsi]
	cmp rax, qword ptr [r14]
	je .LBB0_1
	xor ebx, ebx
	jmp .LBB0_4
.LBB0_1:
	mov r15, rdx
	lea rdx, [4*rdx]
	lea rcx, [rax + 4*rcx]
	xor ebx, ebx
	sub rcx, rdx
	cmovae rbx, rcx
	and rbx, -4
	lea rcx, [rdx + rax]
	mov rdi, rbx
	mov r12, rax
	mov rsi, rax
	cmp rcx, rbx
	jbe .LBB0_2
	call qword ptr [rip + memmove@GOTPCREL]
	jmp .LBB0_3
.LBB0_2:
	call qword ptr [rip + memcpy@GOTPCREL]
.LBB0_3:
	mov qword ptr [r14], rbx
	mov rax, r12
	mov rdx, r15
.LBB0_4:
	test rbx, rbx
	cmovne rax, rbx
.LBB0_5:
	add rsp, 40
	pop rbx
	pop r12
	pop r14
	pop r15
	ret
.LBB0_6:
	mov rbx, rsi
	lea rdi, [rsp + 8]
	mov ecx, 4
	mov r8d, 4
	xor esi, esi
	mov r14, rdx
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<bump_scope::containers::mut_bump_vec::AllocatorWrapper<bump_scope::bump::Bump<alloc::alloc::Global, 0x47240000000000000000000000000000>>>
	mov r15, qword ptr [rsp + 16]
	mov r12, qword ptr [rsp + 32]
	lea rdi, [r15 + 4*r12]
	lea rdx, [4*r14]
	mov rsi, rbx
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rdx, r12
	mov rax, r15
	add rdx, r14
	mov rcx, qword ptr [rsp + 8]
	cmp rdx, rcx
	jb .LBB0_0
	jmp .LBB0_5
	mov rcx, qword ptr [rsp + 8]
	test rcx, rcx
	je .LBB0_7
	mov rsi, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 24]
	mov rdx, qword ptr [rdx]
	cmp rsi, qword ptr [rdx]
	jne .LBB0_7
	lea rcx, [rsi + 4*rcx]
	and rcx, -4
	mov qword ptr [rdx], rcx
.LBB0_7:
	mov rdi, rax
	call _Unwind_Resume@PLT
