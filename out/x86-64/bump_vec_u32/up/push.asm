inspect_asm::bump_vec_u32::up::push:
	push rbp
	push r14
	push rbx
	mov r14, qword ptr [rdi + 8]
	cmp r14, qword ptr [rdi + 16]
	je .LBB0_1
.LBB0_0:
	mov rax, qword ptr [rdi]
	mov dword ptr [rax + 4*r14], esi
	inc r14
	mov qword ptr [rdi + 8], r14
	pop rbx
	pop r14
	pop rbp
	ret
.LBB0_1:
	mov ebp, esi
	mov esi, 1
	mov rbx, rdi
	call qword ptr [rip + bump_scope::mut_bump_vec::MutBumpVec<T,A>::generic_grow_amortized@GOTPCREL]
	mov esi, ebp
	mov rdi, rbx
	jmp .LBB0_0
