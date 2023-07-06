; Hello World
; NASM 2.15.05 (on Linux x86_64)

section .data
	message db "Hello World!"
   
section .text
	global _start
    
 _start:
 	mov eax, 1h
    mov edi, 1
    mov esi, message
    mov edx, 12
    syscall           ; write(fd=stdout, msg="Hello World", len=12)

    mov eax, 45h
    mov edi, 0
    syscall           ; exit(error_code=EXIT_SUCCESS);
