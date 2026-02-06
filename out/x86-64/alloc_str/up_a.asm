inspect_asm::alloc_str::up_a:
	push r14
	push rbx
	push rax
	mov r14, rdx
	mov rax, qword ptr [rdi]
	mov rbx, qword ptr [rax]
	mov rcx, qword ptr [rax + 8]
	sub rcx, rbx
	cmp rdx, rcx
	jg .LBB0_1
	lea rcx, [r14 + rbx]
	add rcx, 3
	and rcx, -4
	mov qword ptr [rax], rcx
.LBB0_0:
	mov rdi, rbx
	mov rdx, r14
	call qword ptr [rip + memcpy@GOTPCREL]
	mov rax, rbx
	mov rdx, r14
	add rsp, 8
	pop rbx
	pop r14
	ret
.LBB0_1:
	mov rbx, rsi
	mov rsi, r14
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_slice_in_another_chunk@GOTPCREL]
	mov rsi, rbx
	mov rbx, rax
	jmp .LBB0_0
