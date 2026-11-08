inspect_asm::alloc_iter_u32::up:
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
	mov rcx, qword ptr [rsp + 8]
	cmp rdx, rcx
	jae .LBB0_3
.LBB0_0:
	mov rsi, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsi]
	lea rcx, [rax + 4*rcx]
	cmp rcx, qword ptr [rsi]
	je .LBB0_1
	xor ecx, ecx
	jmp .LBB0_2
.LBB0_1:
	lea rcx, [rax + 4*rdx]
	mov qword ptr [rsi], rcx
	mov rcx, rax
.LBB0_2:
	test rcx, rcx
	cmovne rax, rcx
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
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<&bump_scope::bump::Bump<0x17240000000000000000000000000000>>
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
	jmp .LBB0_3
	mov rdx, qword ptr [rsp + 8]
	test rdx, rdx
	je .LBB0_5
	mov rcx, qword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 24]
	lea rdi, [rcx + 4*rdx]
	mov rdx, qword ptr [rsi]
	cmp rdi, qword ptr [rdx]
	jne .LBB0_5
	mov qword ptr [rdx], rcx
.LBB0_5:
	mov rdi, rax
	call _Unwind_Resume@PLT
