inspect_asm::vec_map::try_grow:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov rax, rdi
	mov rbx, qword ptr [rsi + 24]
	mov r15, qword ptr [rsi]
	mov r14, qword ptr [rsi + 8]
	mov r12, qword ptr [rsi + 16]
	test r14, r14
	je .LBB0_1
	mov rcx, r14
	shr rcx, 60
	je .LBB0_2
.LBB0_0:
	test r12, r12
	je .LBB0_13
	lea rcx, [r15 + 4*r12]
	mov rsi, qword ptr [rbx]
	cmp rcx, qword ptr [rsi]
	jne .LBB0_13
	xor ecx, ecx
	jmp .LBB0_12
.LBB0_1:
	mov ecx, 8
	xor edx, edx
	jmp .LBB0_9
.LBB0_2:
	lea rdx, [8*r14]
	mov rsi, qword ptr [rbx]
	mov rcx, qword ptr [rsi]
	mov rdi, qword ptr [rsi + 8]
	add rcx, 7
	and rcx, -8
	sub rdi, rcx
	cmp rdx, rdi
	jg .LBB0_15
	add rdx, rcx
	mov qword ptr [rsi], rdx
.LBB0_3:
	lea rdx, [4*r14]
	add rdx, -4
	shr rdx, 2
	lea rsi, [r14 - 1]
	cmp rdx, rsi
	mov r8, rsi
	cmovb r8, rdx
	cmp r8, 19
	jb .LBB0_4
	cmp rdx, rsi
	cmovae rdx, rsi
	lea rdi, [r15 + 4*rdx]
	add rdi, 4
	cmp rcx, rdi
	jae .LBB0_7
	lea rdx, [rcx + 8*rdx]
	add rdx, 8
	cmp r15, rdx
	jae .LBB0_7
.LBB0_4:
	xor edx, edx
	mov rdi, r15
.LBB0_5:
	lea r8, [r15 + 4*r14]
	add rdi, 4
.LBB0_6:
	mov r9d, dword ptr [rdi - 4]
	mov qword ptr [rcx + 8*rdx], r9
	cmp rsi, rdx
	lea rdx, [rdx + 1]
	je .LBB0_9
	cmp rdi, r8
	lea rdi, [rdi + 4]
	jne .LBB0_6
	jmp .LBB0_9
.LBB0_7:
	inc r8
	movabs rdx, 9223372036854775804
	and rdx, r8
	lea rdi, [r15 + 4*rdx]
	xor r9d, r9d
	xorps xmm0, xmm0
.LBB0_8:
	movsd xmm1, qword ptr [r15 + 4*r9]
	movsd xmm2, qword ptr [r15 + 4*r9 + 8]
	unpcklps xmm1, xmm0
	unpcklps xmm2, xmm0
	movups xmmword ptr [rcx + 8*r9], xmm1
	movups xmmword ptr [rcx + 8*r9 + 16], xmm2
	add r9, 4
	cmp rdx, r9
	jne .LBB0_8
	cmp r8, rdx
	jne .LBB0_5
.LBB0_9:
	test r12, r12
	je .LBB0_10
	lea rdi, [r15 + 4*r12]
	mov rsi, qword ptr [rbx]
	cmp rdi, qword ptr [rsi]
	je .LBB0_12
.LBB0_10:
	test rcx, rcx
	je .LBB0_13
.LBB0_11:
	mov qword ptr [rax], rcx
	mov qword ptr [rax + 8], rdx
	mov qword ptr [rax + 16], r14
	mov qword ptr [rax + 24], rbx
	jmp .LBB0_14
.LBB0_12:
	mov qword ptr [rsi], r15
	test rcx, rcx
	jne .LBB0_11
.LBB0_13:
	mov qword ptr [rax], 0
.LBB0_14:
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB0_15:
	mov rdi, rbx
	mov rsi, r14
	mov r13, rax
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings>>::alloc_slice_in_another_chunk::<bump_scope::alloc::AllocError, u64>@GOTPCREL]
	mov rcx, rax
	mov rax, r13
	test rcx, rcx
	jne .LBB0_3
	jmp .LBB0_0
