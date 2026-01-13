inspect_asm::alloc_u8::try_up:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rdx, qword ptr [rcx + 8]
	sub rdx, rax
	test rdx, rdx
	jle .LBB0_1
	lea rdx, [rax + 1]
	mov qword ptr [rcx], rdx
.LBB0_0:
	mov byte ptr [rax], sil
	pop rbx
	ret
.LBB0_1:
	mov ebx, esi
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,S>::do_alloc_sized_in_another_chunk@GOTPCREL]
	mov esi, ebx
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	ret
