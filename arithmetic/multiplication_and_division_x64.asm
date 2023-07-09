; Nasm v 2.15.05 (on Linux x64)
; Observe the program on GNU Debugger and see which values are on the registers!

section .text
        global _start

_start:
        ; 926 * 777
        ;       2 Double-Word Multiplication
        ;       - EDX : The upper 32 bit of the result
        ;       - EAX : The lower 32 bit of the result
        mov rax, 926
        mov rdx, 777
        mul rdx

        ; 2048 / 16
        ;       2 Double-Word Multiplication
        ;       - RDX : The upper 32 bit of the result
        ;       - RAX : The lower 32 bit of the result
        mov rax, 2048
        mov rbx, 16
        div rbx
