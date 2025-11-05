inspect_asm::alloc_u8::up:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	cmp qword ptr [rcx + 8], rax
	je .LBB0_0
	lea rdx, [rax + 1]
	mov qword ptr [rcx], rdx
	mov byte ptr [rax], sil
	pop rbx
	ret
.LBB0_0:
	mov ebx, esi
	call qword ptr [rip + bump_scope::bump_scope::BumpScope<A,_,_,_,_>::do_alloc_sized_in_another_chunk@GOTPCREL]
	mov esi, ebx
	mov byte ptr [rax], sil
	pop rbx
	ret
