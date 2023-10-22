[bits 64]
mov rax, 0x0	; strlen count

; Is RDI having zero?
test rdi, rdi
jz _strlenFinish

_strlen:
	mov rcx, 0x0
	mov BYTE cl, [rdi + rax * 0x1]
	test cl, cl
	jz _strlenFinish
	inc rax
	jmp _strlen

_strlenFinish:
	nop
