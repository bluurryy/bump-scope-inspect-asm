inspect_asm::alloc_u32::try_up_a:
	push rbx
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	lea rdx, [rax + 4]
	cmp rdx, qword ptr [rcx + 8]
	ja .LBB0_1
	mov qword ptr [rcx], rdx
.LBB0_0:
	mov dword ptr [rax], esi
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
