inspect_asm::vec_map::same:
	mov rax, rdi
	mov rcx, qword ptr [rsi + 24]
	mov rdx, qword ptr [rsi]
	movups xmm0, xmmword ptr [rsi + 8]
	test rcx, rcx
	je .LBB0_1
	mov rsi, qword ptr [rsi + 8]
	lea rdi, [rsi + 4*rcx]
.LBB0_0:
	add rsi, 4
	cmp rsi, rdi
	jb .LBB0_0
.LBB0_1:
	movabs rsi, 4611686018427387903
	and rdx, rsi
	mov qword ptr [rax], rdx
	movups xmmword ptr [rax + 8], xmm0
	mov qword ptr [rax + 24], rcx
	ret
