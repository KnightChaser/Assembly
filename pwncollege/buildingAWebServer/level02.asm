.intel_syntax noprefix
.global _start

.section .data

.section .text

_start:

	# socket(AF_INET, SOCK_STREAM, IPPROTO_IP)
	mov rdx, 0x0
	mov rsi, 0x1
	mov rdi, 0x2
	mov rax, 0x29
	syscall
	
	# SYS_EXIT
	mov rdi, 0x0
	mov rax, 0x3C
	syscall
