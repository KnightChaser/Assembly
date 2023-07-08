; Nasm v2.15.05 (on Linux x64)

section .bss
        number:         RESB 0x4
        numberLength:   equ  $-number

section .text
        global _start

_start:
        ; read
        mov rax, 0x0
        mov rdi, 0x0
        mov rsi, number
        mov rdx, numberLength
        syscall

        ; write
        mov rax, 0x1
        mov rdi, 0x1
        mov rsi, number
        mov rdx, numberLength
        syscall

        ; exit
        mov rax, 0x3C
        mov rdi, 0x0
        syscall
