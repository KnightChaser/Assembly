; Nasm v 2.15.05 (on Linux x64)

extern  printf          ; declare the function as alien

SYS_EXIT        EQU     0x3C

section .data
        msg             DB      "Hello, World!", 0x0
        formatString    DB      "String: %s",10, 0x0    ; printf format

section .text
        global main

        main:
                push    rbp                     ; initialize
                mov     rbp, rsp

                mov     rdi, formatString       ; first argument for printf
                mov     rsi, msg                ; second argument for printf
                call    printf                  ; call the function

                mov     rsp, rbp
                pop     rbp

                mov     rax, SYS_EXIT
                mov     rdi, 0x0
                syscall
