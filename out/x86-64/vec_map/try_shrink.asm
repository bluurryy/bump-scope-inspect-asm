inspect_asm::vec_map::try_shrink:
	mov rax, rdi
	mov rcx, qword ptr [rsi + 24]
	mov rdx, qword ptr [rsi]
	movups xmm0, xmmword ptr [rsi + 8]
	test rcx, rcx
	je .LBB0_1
	mov rsi, qword ptr [rsi + 8]
	lea rdi, [rsi + 8*rcx]
	mov r8, rsi
.LBB0_0:
	mov r9d, dword ptr [r8]
	mov dword ptr [rsi], r9d
	add r8, 8
	add rsi, 4
	cmp r8, rdi
	jb .LBB0_0
.LBB0_1:
	add rdx, rdx
	movabs rsi, 4611686018427387902
	and rsi, rdx
	mov qword ptr [rax], rsi
	movups xmmword ptr [rax + 8], xmm0
	mov qword ptr [rax + 24], rcx
	ret
