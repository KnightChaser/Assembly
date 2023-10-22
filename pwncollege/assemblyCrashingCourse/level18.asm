[bits 64]
cmp DWORD [rdi], 0x7F454C46
je firstMatch
cmp DWORD [rdi], 0x00005A4D
je secondMatch
jmp notMatch

firstMatch:
	mov eax, [rdi + 4]
	add eax, [rdi + 8]
	add eax, [rdi + 12]
	jmp finish
secondMatch:
	mov eax, [rdi + 4]
	sub eax, [rdi + 8]
	sub eax, [rdi + 12]
	jmp finish
notMatch:
	mov eax, [rdi + 4]
	imul eax, [rdi + 8]
	imul eax, [rdi + 12]
	jmp finish
finish:
; nop
