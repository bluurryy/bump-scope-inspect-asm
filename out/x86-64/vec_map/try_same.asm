inspect_asm::vec_map::try_same:
	mov rax, rdi
	mov rcx, qword ptr [rsi]
	mov rdi, qword ptr [rsi + 8]
	movups xmm0, xmmword ptr [rsi + 8]
	mov rdx, qword ptr [rsi + 24]
	test rdi, rdi
	je .LBB0_1
	lea rsi, [rcx + 4*rdi]
	mov rdi, rcx
.LBB0_0:
	add rdi, 4
	cmp rdi, rsi
	jb .LBB0_0
.LBB0_1:
	andps xmm0, xmmword ptr [rip + .LCPI0_0]
	mov qword ptr [rax], rcx
	movups xmmword ptr [rax + 8], xmm0
	mov qword ptr [rax + 24], rdx
	ret
