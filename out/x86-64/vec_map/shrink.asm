inspect_asm::vec_map::shrink:
	mov rax, rdi
	movabs rcx, 4611686018427387900
	mov rdx, qword ptr [rsi]
	mov rdi, qword ptr [rsi + 8]
	mov r8, qword ptr [rsi + 16]
	mov rsi, qword ptr [rsi + 24]
	test rdi, rdi
	je .LBB0_4
	push r14
	push rbx
	lea r9, [8*rdi]
	add r9, rdx
	lea r10, [rdx + 8]
	cmp r9, r10
	cmovbe r9, r10
	mov r11, rdx
	not r11
	add r11, r9
	mov r9, rdx
	mov r10, rdx
	cmp r11, 24
	jb .LBB0_1
	shr r11, 3
	inc r11
	mov rbx, r11
	and rbx, rcx
	lea r9, [rdx + 4*rbx]
	lea r10, [rdx + 8*rbx]
	xor r14d, r14d
.LBB0_0:
	movdqu xmm0, xmmword ptr [rdx + 8*r14]
	movdqu xmm1, xmmword ptr [rdx + 8*r14 + 16]
	pshufd xmm0, xmm0, 232
	pshufd xmm1, xmm1, 232
	punpcklqdq xmm0, xmm1
	movdqu xmmword ptr [rdx + 4*r14], xmm0
	add r14, 4
	cmp rbx, r14
	jne .LBB0_0
	cmp r11, rbx
	je .LBB0_3
.LBB0_1:
	lea r11, [rdx + 8*rdi]
.LBB0_2:
	mov ebx, dword ptr [r10]
	mov dword ptr [r9], ebx
	add r10, 8
	add r9, 4
	cmp r10, r11
	jb .LBB0_2
.LBB0_3:
	pop rbx
	pop r14
.LBB0_4:
	add r8, r8
	add rcx, 2
	and rcx, r8
	mov qword ptr [rax], rdx
	mov qword ptr [rax + 8], rdi
	mov qword ptr [rax + 16], rcx
	mov qword ptr [rax + 24], rsi
	ret
