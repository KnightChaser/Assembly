; Nasm v 2.15.05 (on Linux x64)

extern  printf          ; declare the function as alien

SYS_EXIT        EQU     0x3C

section .data
        message         DB      "Hello, World!", 0x0            ; 0x0 for NULL delimter
        formatString    DB      "String: %s",0xA, 0x0           ; printf format / 0xA for newline / 0x0 for NULL delimter

section .text
        global main

        main:
                push    rbp                     ; initialize
                mov     rbp, rsp

                mov     rdi, formatString       ; first argument for printf
                mov     rsi, message            ; second argument for printf
                call    printf                  ; call the function

                mov     rsp, rbp
                pop     rbp

                ret                             ; Finish
