inspect_asm::alloc_vec3::try_blink_alloc:
	push r14
	push rbx
	push rax
	mov ebx, dword ptr [rsi]
	mov r14, qword ptr [rsi + 4]
	mov rcx, qword ptr [rdi]
	test rcx, rcx
	je .LBB0_1
	mov rdx, qword ptr [rcx]
	cmp rdx, -16
	ja .LBB0_1
	lea rax, [rdx + 3]
	and rax, -4
	lea rsi, [rax + 12]
	cmp rsi, qword ptr [rcx + 8]
	ja .LBB0_1
	mov qword ptr [rcx], rsi
	test rdx, rdx
	je .LBB0_1
.LBB0_0:
	mov dword ptr [rax], ebx
	mov qword ptr [rax + 4], r14
	add rsp, 8
	pop rbx
	pop r14
	ret
.LBB0_1:
	mov rsi, qword ptr [rdi + 8]
	mov edx, 4
	mov ecx, 12
	call blink_alloc::arena::local::alloc_slow
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	add rsp, 8
	pop rbx
	pop r14
	ret
