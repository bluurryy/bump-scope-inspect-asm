inspect_asm::alloc_iter_u32::up:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	test rdx, rdx
	je .LBB0_5
	mov rbx, rsi
	lea r12, [4*rdx]
	mov rcx, qword ptr [rdi]
	mov rax, qword ptr [rcx]
	mov rsi, qword ptr [rcx + 8]
	add rax, 3
	and rax, -4
	sub rsi, rax
	cmp r12, rsi
	jg .LBB0_7
	lea rsi, [rax + r12]
	mov qword ptr [rcx], rsi
.LBB0_0:
	mov qword ptr [rsp + 8], rax
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 32], rdi
	neg r12
	xor r14d, r14d
	lea rdi, [rsp + 8]
	mov rbp, qword ptr [rip + <bump_scope::bump_vec::BumpVec<u32, &bump_scope::bump_scope::BumpScope>>::generic_grow_amortized::<core::convert::Infallible>@GOTPCREL]
	xor r13d, r13d
.LBB0_1:
	mov r15d, dword ptr [rbx + 4*r14]
	cmp r14, qword ptr [rsp + 24]
	je .LBB0_3
.LBB0_2:
	mov dword ptr [rax + 4*r14], r15d
	inc r14
	mov qword ptr [rsp + 16], r14
	add r13, -4
	cmp r12, r13
	jne .LBB0_1
	jmp .LBB0_4
.LBB0_3:
	mov esi, 1
	call rbp
	mov rax, qword ptr [rsp + 8]
	lea rdi, [rsp + 8]
	jmp .LBB0_2
.LBB0_4:
	mov rax, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 24]
	cmp rdx, r14
	jbe .LBB0_6
	mov rcx, qword ptr [rsp + 32]
	mov rcx, qword ptr [rcx]
	lea rdx, [rax + 4*rdx]
	cmp rdx, qword ptr [rcx]
	jne .LBB0_6
	mov rdx, rax
	sub rdx, r13
	mov qword ptr [rcx], rdx
	jmp .LBB0_6
.LBB0_5:
	mov eax, 4
	xor r14d, r14d
.LBB0_6:
	mov rdx, r14
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB0_7:
	mov r14, rdi
	mov rsi, rdx
	mov r15, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<bump_scope::alloc::global::Global, bump_scope::settings::BumpSettings>>::alloc_slice_in_another_chunk::<core::convert::Infallible, core::option::Option<core::num::nonzero::NonZero<u32>>>@GOTPCREL]
	mov rdi, r14
	mov rdx, r15
	jmp .LBB0_0
	mov rdx, qword ptr [rsp + 24]
	test rdx, rdx
	je .LBB0_8
	mov rcx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 32]
	lea rdi, [rcx + 4*rdx]
	mov rdx, qword ptr [rsi]
	cmp rdi, qword ptr [rdx]
	jne .LBB0_8
	mov qword ptr [rdx], rcx
.LBB0_8:
	mov rdi, rax
	call _Unwind_Resume@PLT
