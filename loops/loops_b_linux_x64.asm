; Nasm v 2.15.05 (on Linux x64)

SYS_WRITE       equ     0x1
SYS_EXIT        equ     0x3C
STDOUT          equ     0x1

section .bss
        NUM     RESB    0x1

section .text
        global _start

_start:

        ; initialize
        ; num = 1
        mov rbx, [NUM]
        mov rbx, 0x1
        mov [NUM], rbx

        _loop:
                ; make the number printable (ASCII)
                mov rbx, [NUM]
                add rbx, '0'
                mov [NUM], rbx

                mov rax, SYS_WRITE
                mov rdi, STDOUT
                mov rsi, NUM
                mov rdx, 0x1
                syscall

                ; convert printable ASCII to integer number and add 1 (num += 1)
                sub rbx, '0'
                inc rbx
                mov [NUM], rbx

                ; compare and decide to continue the loop or not
                cmp rbx, 0x9
                jle _loop

        mov rax, SYS_EXIT
        mov rdi, 0x0
        syscall
