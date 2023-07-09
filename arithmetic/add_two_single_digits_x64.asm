; Nasm 2.15.05 (on Linux x64)
; THE ENTIRE PROGRAM ONLY CAN HANDLE SINGLE DIGIT NUMBER

STDIN   equ     0x00
STDOUT  equ     0x01

section .data
        message1:       db      "Enter the 1st digit: "
        message1Length: equ     $ - message1

        message2:       db      "Enter the 2nd digit: "
        message2Length: equ     $ - message2

        message3:       db      "1st digit + 2nd digit: "
        message3Length: equ     $ - message3

section .bss
        number1:        RESB    0x02
        number2:        RESB    0x02
        result:         RESB    0x02

section .text
        global _start

_start:

        ; write(STDOUT, "Enter the 1st digit: ", len);
        mov rax, 0x01
        mov rdi, STDOUT
        mov rsi, message1
        mov rdx, message1Length
        syscall

        ; read(STDIN, &number1, len)
        mov rax, 0x00
        mov rdi, STDIN
        mov rsi, number1
        mov rdx, 0x02           ; RESB
        syscall

        ; write(STDOUT, "Enter the 2nd digit: ", len);
        mov rax, 0x01
        mov rdi, STDOUT
        mov rsi, message2
        mov rdx, message2Length
        syscall

        ; read(STDIN, &number2, len)
        mov rax, 0x00
        mov rdi, STDIN
        mov rsi, number2
        mov rdx, 0x02           ; RESB
        syscall

        mov rax, [number1]
        sub rax, '0'            ; ASCII to integer
        mov rbx, [number2]
        sub rbx, '0'            ; ASCII to integer
        add rax, rbx

        add rax, '0'            ; add '0' to to convert the sum from decimal to ASCII
        mov [result], rax

        ; write(STDOUT, "1st digit + second digit: ", len)
        mov rax, 0x01
        mov rdi, STDOUT
        mov rsi, message3
        mov rdx, message3Length
        syscall

        ; write(STDOUT, result, len)
        mov rax, 0x01
        mov rdi, STDOUT
        mov rsi, result
        mov rdx, 0x01
        syscall

        ; exit
        mov rax, 0x3C
        xor rdi, rdi
        syscall
