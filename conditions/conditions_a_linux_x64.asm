; Nasm 2.15.05 (on Linux x64)

STDOUT  equ     0x01    ; for RDI (file descriptor)
WRITE   equ     0x01    ; for RAX (syscall)

section .data
;       x                       DW      5
        passMessage             DB      "PASS!", 0xA
        passMessageLength       EQU     $-passMessage
        failMessage             DB      "FAIL!", 0xA
        failMessageLength       EQU     $-failMessage

section .text
        global _start

        _start:
                mov rcx, 75     ; Just suppose that it's [int x = 75;].
                                ; Dealing numbers in Assembly in data section is tricky.

                cmp rcx, 70

                jge _pass
                jmp _fail

                ; Print PASS message
                _pass:
                        mov rax, WRITE
                        mov rdi, STDOUT
                        mov rsi, passMessage
                        mov rdx, passMessageLength
                        syscall
                        jmp _fail_end                   ; if you pass
                                                        ; do not need to print fail

                ; Print FAIL message
                _fail:
                        mov rax, WRITE
                        mov rdi, STDOUT
                        mov rsi, failMessage
                        mov rdx, failMessageLength
                        syscall

                ; Everything is done. Finish the program.
                _fail_end:
                        mov rax, 0x3C
                        xor rdi, rdi
                        syscall
