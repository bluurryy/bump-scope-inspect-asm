inspect_asm::alloc_u8::up_a:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rdx, qword ptr [rcx + 8]
	sub rdx, rax
	test rdx, rdx
	jle .LBB0_0
	mov rdx, rax
	and rdx, -4
	add rdx, 4
	mov qword ptr [rcx], rdx
	mov byte ptr [rax], sil
	pop rbx
	ret
.LBB0_0:
	mov ebx, esi
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,S>::do_alloc_sized_in_another_chunk@GOTPCREL]
	mov esi, ebx
	mov byte ptr [rax], sil
	pop rbx
	ret
