[bits 64]

# Only for using debugger
# int 3

xor rax, rax
test rdi, rdi
jz _finish

_strLower:
	xor rbx, rbx
	mov bl, [rdi]
	test bl, bl
	jz _finish	; null'd
	
	cmp bl, 0x5A
	jg _greater
	
	push rdi
	push rax
	xor rdi, rdi
	mov dil, bl
	mov r10, 0x403000
	call r10	; trigger foo([src_addr])
	mov bl, al	; return from al
	pop rax
	pop rdi
	mov [rdi], bl
	inc rax

	_greater:
		inc rdi
		jmp _strLower

_finish:
	ret
