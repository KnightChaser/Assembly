[bits 64]
mov rax, 0x0	; sum
mov rbx, 0x0	; iteration count

_loop:
	cmp rbx, rsi
	je _loopFinish
	add QWORD rax, [rdi + rbx * 8]
	inc rbx
	jmp _loop

_loopFinish:
	xor rdx, rdx
	idiv rsi
