inspect_asm::alloc_big::try_down_a:
	push rbx
	mov rax, rdi
	mov rcx, qword ptr [rdi]
	mov rdx, qword ptr [rcx]
	xor edi, edi
	sub rdx, 512
	cmovae rdi, rdx
	and rdi, -512
	cmp rdi, qword ptr [rcx + 8]
	jb .LBB0_1
	mov qword ptr [rcx], rdi
.LBB0_0:
	mov edx, 512
	pop rbx
	jmp qword ptr [rip + memcpy@GOTPCREL]
.LBB0_1:
	mov rdi, rax
	mov rbx, rsi
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::do_alloc_sized_in_another_chunk@GOTPCREL]
	mov rsi, rbx
	mov rdi, rax
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	ret
