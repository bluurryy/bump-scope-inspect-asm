inspect_asm::alloc_u32_slice_clone::bumpalo:
	push r15
	push r14
	push rbx
	lea rbx, [4*rdx]
	mov rax, qword ptr [rdi + 16]
	mov r14, qword ptr [rax + 32]
	and r14, -4
	mov rcx, r14
	sub rcx, qword ptr [rax]
	jb .LBB0_2
	cmp rbx, rcx
	ja .LBB0_2
	sub r14, rbx
	mov qword ptr [rax + 32], r14
.LBB0_0:
	test rdx, rdx
	je .LBB0_1
	mov rdi, r14
	mov r15, rdx
	mov rdx, rbx
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rdx, r15
.LBB0_1:
	mov rax, r14
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_2:
	mov r14, rsi
	mov esi, 4
	mov r15, rdx
	mov rdx, rbx
	call qword ptr [rip + bumpalo::Bump<_>::alloc_layout_slow@GOTPCREL]
	mov rsi, r14
	mov rdx, r15
	mov r14, rax
	test rax, rax
	jne .LBB0_0
	call qword ptr [rip + bumpalo::oom@GOTPCREL]
