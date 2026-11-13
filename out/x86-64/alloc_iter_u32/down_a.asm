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
	jne .LBB0_4
	mov eax, 4
	xor edx, edx
	mov rsi, qword ptr [rsp + 8]
	cmp rdx, rsi
	jae .LBB0_3
.LBB0_0:
	mov rcx, qword ptr [rsp + 24]
	mov r14, qword ptr [rcx]
	cmp rax, qword ptr [r14]
	je .LBB0_1
	xor ebx, ebx
	jmp .LBB0_2
.LBB0_1:
	lea rcx, [4*rdx]
	lea rsi, [rax + 4*rsi]
	xor ebx, ebx
	sub rsi, rcx
	cmovae rbx, rsi
	and rbx, -4
	mov rdi, rbx
	mov rsi, rax
	mov r15, rdx
	mov rdx, rcx
	mov r12, rax
	call qword ptr [rip + memmove@GOTPCREL]
	mov rdx, r15
	mov rax, r12
	mov qword ptr [r14], rbx
.LBB0_2:
	test rbx, rbx
	cmovne rax, rbx
.LBB0_3:
	add rsp, 40
	pop rbx
	pop r12
	pop r14
	pop r15
	ret
.LBB0_4:
	mov rbx, rsi
	lea rdi, [rsp + 8]
	mov ecx, 4
	mov r8d, 4
	xor esi, esi
	mov r14, rdx
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<bump_scope::containers::mut_bump_vec::AllocatorWrapper<bump_scope::bump::Bump<0xa7940000000000000000000000000000>>>
	mov r15, qword ptr [rsp + 16]
	mov r12, qword ptr [rsp + 32]
	lea rdi, [r15 + 4*r12]
	lea rdx, [4*r14]
	mov rsi, rbx
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rdx, r12
	mov rax, r15
	add rdx, r14
	mov rsi, qword ptr [rsp + 8]
	cmp rdx, rsi
	jb .LBB0_0
	jmp .LBB0_3
	mov rcx, qword ptr [rsp + 8]
	test rcx, rcx
	je .LBB0_5
	mov rsi, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 24]
	mov rdx, qword ptr [rdx]
	cmp rsi, qword ptr [rdx]
	jne .LBB0_5
	lea rcx, [rsi + 4*rcx]
	and rcx, -4
	mov qword ptr [rdx], rcx
.LBB0_5:
	mov rdi, rax
	call _Unwind_Resume@PLT
