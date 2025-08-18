inspect_asm::alloc_u32_slice_clone::bumpalo_a:
	push r15
	push r14
	push rbx
	lea rbx, [4*rdx]
	mov rcx, qword ptr [rdi + 16]
	mov rax, qword ptr [rcx + 32]
	mov r8, rax
	sub r8, qword ptr [rcx]
	cmp rbx, r8
	ja .LBB0_6
	sub rax, rbx
	mov qword ptr [rcx + 32], rax
.LBB0_0:
	test rdx, rdx
	je .LBB0_5
	add rbx, -4
	xor edi, edi
	cmp rbx, 28
	jb .LBB0_2
	mov r8, rax
	sub r8, rsi
	mov rcx, rsi
	cmp r8, 32
	jb .LBB0_3
	shr rbx, 2
	inc rbx
	mov rdi, rbx
	and rdi, -8
	lea rcx, [rsi + 4*rdi]
	xor r8d, r8d
.LBB0_1:
	movups xmm0, xmmword ptr [rsi + 4*r8]
	movups xmm1, xmmword ptr [rsi + 4*r8 + 16]
	movups xmmword ptr [rax + 4*r8], xmm0
	movups xmmword ptr [rax + 4*r8 + 16], xmm1
	add r8, 8
	cmp rdi, r8
	jne .LBB0_1
	cmp rbx, rdi
	jne .LBB0_3
	jmp .LBB0_5
.LBB0_2:
	mov rcx, rsi
.LBB0_3:
	lea rsi, [rsi + 4*rdx]
	lea rdi, [rax + 4*rdi]
.LBB0_4:
	mov r8d, dword ptr [rcx]
	add rcx, 4
	mov dword ptr [rdi], r8d
	add rdi, 4
	cmp rcx, rsi
	jne .LBB0_4
.LBB0_5:
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_6:
	mov r14, rsi
	mov esi, 4
	mov r15, rdx
	mov rdx, rbx
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rsi, r14
	mov rdx, r15
	test rax, rax
	jne .LBB0_0
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
