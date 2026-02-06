inspect_asm::alloc_u8::down_a:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	dec rax
	and rax, -4
	cmp rax, qword ptr [rcx + 8]
	jb .LBB0_0
	mov qword ptr [rcx], rax
	mov byte ptr [rax], sil
	pop rbx
	ret
.LBB0_0:
	mov ebx, esi
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_sized_in_another_chunk@GOTPCREL]
	mov esi, ebx
	mov byte ptr [rax], sil
	pop rbx
	ret
