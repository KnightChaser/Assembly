.intel_syntax noprefix
.global _start

.section .text

_start:
	mov rdi, 0x0
	mov rax, 0x3C	# SYS_EXIT
	syscall

.section .data
