inspect_asm::vec_map::grow:
	push r15
	push r14
	push rbx
	sub rsp, 48
	mov rbx, rdi
	mov rdx, qword ptr [rsi]
	mov r15, qword ptr [rsi + 8]
	mov rcx, qword ptr [rsi + 16]
	mov r14, qword ptr [rsi + 24]
	mov qword ptr [rsp], 0
	mov qword ptr [rsp + 8], 8
	mov qword ptr [rsp + 16], rcx
	mov qword ptr [rsp + 24], 0
	mov qword ptr [rsp + 32], r15
	mov qword ptr [rsp + 40], rdx
	test r14, r14
	jne .LBB0_2
	xor eax, eax
	lea rsi, [r15 + 4*rdx]
	mov rdx, qword ptr [rcx]
	cmp rsi, qword ptr [rdx]
	jne .LBB0_1
.LBB0_0:
	mov qword ptr [rdx], r15
.LBB0_1:
	movups xmm0, xmmword ptr [rsp]
	movups xmmword ptr [rbx], xmm0
	mov qword ptr [rbx + 16], rcx
	mov qword ptr [rbx + 24], rax
	mov rax, rbx
	add rsp, 48
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_2:
	mov rdi, rsp
	mov ecx, 8
	mov r8d, 8
	xor esi, esi
	mov rdx, r14
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<&bump_scope::bump::Bump<0x8f920000000000000000000000000000>>
	lea rdi, [4*r14]
	lea rcx, [r15 + 4*r14]
	mov rdx, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 24]
	add rdi, -4
	cmp rdi, 92
	jae .LBB0_3
	mov rsi, r15
	jmp .LBB0_6
.LBB0_3:
	lea rsi, [rdx + 8*rax]
	cmp rsi, rcx
	jae .LBB0_4
	add r14, rax
	lea rsi, [rdx + 8*r14]
	cmp r15, rsi
	jae .LBB0_4
	mov rsi, r15
	jmp .LBB0_6
.LBB0_4:
	shr rdi, 2
	inc rdi
	lea r9, [8*rax]
	mov r8, rdi
	and r8, -4
	add rax, r8
	lea rsi, [r15 + 4*r8]
	add r9, rdx
	add r9, 16
	xor r10d, r10d
	xorps xmm0, xmm0
.LBB0_5:
	movsd xmm1, qword ptr [r15 + 4*r10]
	movsd xmm2, qword ptr [r15 + 4*r10 + 8]
	unpcklps xmm1, xmm0
	unpcklps xmm2, xmm0
	movups xmmword ptr [r9 + 8*r10 - 16], xmm1
	movups xmmword ptr [r9 + 8*r10], xmm2
	add r10, 4
	cmp r8, r10
	jne .LBB0_5
	cmp rdi, r8
	je .LBB0_7
.LBB0_6:
	mov edi, dword ptr [rsi]
	add rsi, 4
	mov qword ptr [rdx + 8*rax], rdi
	inc rax
	cmp rsi, rcx
	jne .LBB0_6
.LBB0_7:
	mov rcx, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 32]
	mov rdx, qword ptr [rsp + 40]
	lea rsi, [r15 + 4*rdx]
	mov rdx, qword ptr [rcx]
	cmp rsi, qword ptr [rdx]
	jne .LBB0_1
	jmp .LBB0_0
	mov rbx, rax
	mov rdi, rsp
	call core::ptr::drop_glue::<bump_scope::extra::map::vec_map_fallback::DropGuard<u32, u64, &bump_scope::bump::Bump<0x8f920000000000000000000000000000>>>
	mov rdi, rbx
	call _Unwind_Resume@PLT
