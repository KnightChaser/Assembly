[bits 64]
cmp rdi, 0x3
jna selected
mov rdi, 0x4	; automatically select the 5th element in the stack
jmp selected

selected:
	jmp [rsi + rdi * 0x8]
