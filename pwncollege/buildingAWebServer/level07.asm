.intel_syntax noprefix
.global _start
.global _socket
.global _HTTPProcess

.section .data
	HTTPResponse:	.ascii	"HTTP/1.0 200 OK\r\n\r\n"
	O_RDONLY:	.quad	0x0000				# refer to fnctl.h

.section .bss
	buffer:		.skip	1024
	GETFilePath:	.skip	1024
	readFileBuffer:	.skip	1024

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

	_HTTPProcess:
		# read(4, <read_request>, <read_request_count>) 
		mov rdx, 1024
		lea rsi, buffer			# ... Save up to 1024 bytes into the buffer
		mov rdi, 0x4
		mov rax, 0x0
		syscall

		# From the GET request from the buffer, we need to extract the desired filepath.
		lea r10, buffer
		xor r11, r11
		_parseFilePathFromGETRequest:
			mov al, [r10]
			cmp al, 0x20				# spacebar is the splitter
			je _parseFilePathHalfDone
			inc r10					# investigate the next byte 
			jmp _parseFilePathFromGETRequest

			_parseFilePathHalfDone:
				inc r10
				mov r11, r10
				xor r12, r12			# Will count how many bytes exist until the spacebar

			# To find the second spacebar...
			_parseFilePathBreak:
				mov al, [r11]
				cmp al, 0x20
				je _parseFilePathDone
				inc r11			# Increment pointer
				inc r12			# Increment count for the length of the filepath
				jmp _parseFilePathBreak

		# Filepath successfully extracted
		_parseFilePathDone:
			mov BYTE PTR [r11], 0x0		# terminate with the NULL string

		# open("<open_path>", O_RDONLY) ( = 5)
		mov rsi, O_RDONLY
		mov rdi, r10
		mov rax, 0x2
		syscall

		# read(5, <read_file>, <read_file_count>) = <read_file_result>
		mov rdx, 1024
		lea rsi, readFileBuffer	
		mov rdi, 0x5
		mov rax, 0x0
		syscall
		sub rsp, 4
		mov DWORD [rsp], rax		# store total byte read

		# close(5)
		mov rdi, 0x5
		mov rax, 0x3
		syscall

		# write(4, "HTTP/1.0 200 OK\r\n\r\n", 19)
		mov rdx, 19
		lea rsi, HTTPResponse		# stored response "HTTP...\r\n"
		mov rdi, 0x4
		mov rax, 0x1
		syscall

		# write(4, <write_file>, <write_file_count>) = <write_file_result>
		mov rdx, DWORD [rsp]
		lea rsi, readFileBuffer
		mov rdi, 0x4
		mov rax, 0x1
		syscall
		add rsp, 4			# restore RSP register for temporary purpose	
		
		# close(4)
		mov rdi, 0x4
		mov rax, 0x3
		syscall		
	

	# sys_exit(0)
	mov rdi, 0x0
	mov rax, 0x3C
	syscall
