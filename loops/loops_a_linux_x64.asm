; Nasm v 2.15.05 (on Linux x64)

SYS_WRITE       equ     0x1
SYS_EXIT        equ     0x3C
STDOUT          equ     0x1

section .data
        message         db "Hello, World!", 0xA
        messageLength   equ $ - message

section .text
        global _start

_start:
        mov rbx, 0x0

        _loop:
                mov rax, SYS_WRITE
                mov rdi, STDOUT
                mov rsi, message
                mov rdx, messageLength
                syscall

                inc rbx
                cmp rbx, 0xA
                jl _loop

        mov rax, SYS_EXIT
        mov rdi, 0x0
        syscall
