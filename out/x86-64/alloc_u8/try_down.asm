inspect_asm::alloc_u8::try_down:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	dec rax
	cmp rax, qword ptr [rcx + 8]
	jb .LBB0_1
	mov qword ptr [rcx], rax
.LBB0_0:
	mov byte ptr [rax], sil
	pop rbx
	ret
.LBB0_1:
	mov ebx, esi
	call qword ptr [rip + bump_scope::raw_bump::RawBump<A,S>::alloc_sized_in_another_chunk@GOTPCREL]
	mov esi, ebx
	test rax, rax
	jne .LBB0_0
	xor eax, eax
	pop rbx
	ret
