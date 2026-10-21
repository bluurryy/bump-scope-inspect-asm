inspect_asm::alloc_try_u32::down_mut:
	push r15
	push r14
	push rbx
	mov r14, rsi
	mov rbx, rdi
	mov rax, qword ptr [rsi]
	mov r15, qword ptr [rax]
	and r15, -4
	add r15, -8
	cmp r15, qword ptr [rax + 8]
	jb .LBB0_3
.LBB0_0:
	call rdx
	mov dword ptr [r15], eax
	mov dword ptr [r15 + 4], edx
	test al, 1
	je .LBB0_1
	mov dword ptr [rbx + 4], edx
	mov eax, 1
	jmp .LBB0_2
.LBB0_1:
	add r15, 4
	mov rax, qword ptr [r14]
	mov qword ptr [rax], r15
	mov qword ptr [rbx + 8], r15
	xor eax, eax
.LBB0_2:
	mov dword ptr [rbx], eax
	mov rax, rbx
	pop rbx
	pop r14
	pop r15
	ret
.LBB0_3:
	mov rdi, r14
	mov r15, rdx
	call qword ptr [rip + <bump_scope::raw_bump::RawBump<alloc::alloc::Global, 0x7240000000000000000000000000000>>::prepare_allocation_in_another_chunk::<!, core::result::Result<u32, u32>>@GOTPCREL]
	mov rdx, r15
	mov r15, rax
	jmp .LBB0_0
