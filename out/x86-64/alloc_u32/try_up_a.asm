inspect_asm::alloc_u32::try_up_a:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rdx, qword ptr [rcx + 8]
	sub rdx, rax
	cmp rdx, 4
	jb .LBB0_1
	lea rdx, [rax + 4]
	mov qword ptr [rcx], rdx
.LBB0_0:
	mov dword ptr [rax], esi
	pop rbx
	ret
.LBB0_1:
	mov ebx, esi
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_>::do_alloc_sized_in_another_chunk@GOTPCREL]
	mov esi, ebx
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	ret
