; Hello World
; NASM 2.15.05 (on Linux x64)

section .data
        message db "Hello, World!", 0xA
        length equ $ - message

section .text
        global _start

_start:
        mov rax, 0x1    ; write(
        mov rdi, 0x1    ;       stdout,
        mov rsi, message;       message,
        mov rdx, length ;       message_length);
        syscall

        mov rax, 0x3C   ; sys_exit(
        mov rdi, 0x0    ;       SUCCESS);
        syscall
