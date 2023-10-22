[bits 64]
; most_common_byte
push rbp
mov rbp, rsp
sub rsp, 0xFF
mov r13, 0x0

_loopA:
	cmp r13, rsi
	je _finishA
	xor rax, rax
	mov BYTE al, [rdi + r13]
	mov rbx, rbp
	sub rbx, rax
	inc BYTE [rbx]
	inc r13
	jmp _loopA

	_finishA:
		xor r13, r13
		xor r14, r14
		xor r15, r15

_loopB:
	cmp r13, 0xFF
	je _finishB
	mov rbx, rbp
	sub rbx, r13
	xor rax, rax
	mov BYTE al, [rbx]
	
	cmp rax, r14
	jle _loopBNotGreater
	mov r14, rax
	mov r15, r13

	_loopBNotGreater:
		inc r13,
		jmp _loopB

	_finishB:
		mov rax, r15
		leave
		ret
