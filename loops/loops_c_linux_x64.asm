; Nasm v. 2.15.05. (on Linux x64)

SYS_WRITE       equ     0x1
SYS_EXIT        equ     0x3C
STDOUT          equ     0x1

section .data
        STAR            DB      '*'
        NEWLINE         DB      0xA
        starPerLine     DB      0x1
        printedLine     DB      0x1

section .text
        global _start

_start:

        mov r8, [starPerLine]
        mov r9, [printedLine]

        _loop_i:
                _loop_j:
                        ; Print one star(*) character
                        mov rax, SYS_WRITE
                        mov rdi, STDOUT
                        mov rsi, STAR
                        mov rdx, 0x1
                        syscall

                        inc r8
                        cmp r8, r9
                        jle _loop_j

                ; print newline(\n)
                mov rax, SYS_WRITE
                mov rdi, STDOUT
                mov rsi, NEWLINE
                mov rdx, 0x1
                syscall

                mov r8, 0x0     ; reset StarPerLine variable

                inc r9
                cmp r9, 0x5
                jle _loop_i

        mov rax, SYS_EXIT
        mov rdi, 0x0
        syscall
