.intel_syntax noprefix
.global _start

.section .data

.section .text

_start:

	_socket:
		# socket(AF_INET, SOCK_STREAM, IPPROTO_IP)
		mov rdx, 0x0
		mov rsi, 0x1
		mov rdi, 0x2
		mov rax, 0x29
		syscall

		# bind(3, {sa_family=AF_INET, sin_port=htons(<bind_port>), sin_addr=inet_addr("<bind_address>")}, 16)
		# - Bind to port 80 -> htons(80) == 0x5000
		# - Bind to address 0.0.0.0 -> 0x0 in integer
		mov rdi, rax	# socket file descriptor
		push rdx
		push rdx
		push rdx
		mov WORD PTR [rsp + 0x4], 0x0		# inet_addr(<bind_address>)
		mov WORD PTR [rsp + 0x2], 0x5000	# htons(<bind_port>)
		mov WORD PTR [rsp],	  0x2		# AF_INET
		mov rsi, rsp				# - Insert SOCKADDR_STRUCT
		push 0x31				# syscall number for bind()
		pop rax
		push 0x10				# last parameter
		pop rdx
		syscall	

		# listen(3, 0) (...from bind())
		mov rsi, 0x0
		mov rdi, rdi		# sockfd (already stored in)
		mov rax, 0x32
		syscall

		# accept(3, NULL, NULL)
		mov rdx, 0x0
		mov rsi, 0x0
		mov rdi, 0x3
		mov rax, 0x2B
		syscall

	mov rax, 0x31
	syscall 

	# sys_exit(0)
	mov rdi, 0x0
	mov rax, 0x3C
	syscall
