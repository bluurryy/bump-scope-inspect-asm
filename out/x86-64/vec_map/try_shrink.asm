inspect_asm::vec_map::try_shrink:
	mov rax, rdi
	mov rcx, qword ptr [rsi]
	mov rdx, qword ptr [rsi + 8]
	mov rdi, qword ptr [rsi + 16]
	mov rsi, qword ptr [rsi + 24]
	test rdx, rdx
	je .LBB0_1
	lea r8, [rcx + 8*rdx]
	mov r9, rcx
	mov r10, rcx
.LBB0_0:
	mov r11d, dword ptr [r10]
	mov dword ptr [r9], r11d
	add r10, 8
	add r9, 4
	cmp r10, r8
	jb .LBB0_0
.LBB0_1:
	add rdi, rdi
	movabs r8, 4611686018427387902
	and r8, rdi
	mov qword ptr [rax], rcx
	mov qword ptr [rax + 8], rdx
	mov qword ptr [rax + 16], r8
	mov qword ptr [rax + 24], rsi
	ret
