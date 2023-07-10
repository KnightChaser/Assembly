; Nasm 2.15.05 (on Linux x64)

STDOUT  equ     0x01    ; for RDI (file descriptor)
WRITE   equ     0x01    ; for RAX (for syscall itself)

section .data
        message         db      "The sum is: "
        messageLength   equ     $ - message

section .bss
        result          RESB    0x1

section .text
        global _start

        _start:
                mov rax, WRITE
                mov rdi, STDOUT
                mov rsi, message
                mov rdx, messageLength
                syscall

                mov rdi, 0x4
                mov rsi, 0x5

                call _sum

                mov [result], rax       ; The result of the _sum (stored in RAX register)
                mov rax, WRITE
                mov rdi, STDOUT
                mov rsi, result
                mov rdx, 0x1
                syscall

                ; exit
                mov rax, 0x3C
                mov rdi, 0x00
                syscall

        _sum:
                mov rax, rdi
                add rax, rsi
                add rax, '0'            ; To make it printable ASCII
                ret                     ; Result: 0x39 (A single character '9' in ASCII)
