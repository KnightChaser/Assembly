; Nasm v 2.15.05. (on Linux x64)

extern  printf

DWORD_SIZE      EQU     0x4

section .data
        arr1            DD      1, 2, 3, 4, 5, 6, 7, 8, 9, 10
        formatString    DB      "The sum of the array is: %d", 0xA, 0x0

section .bss
        sum             RESB    0x4

section .text
        global main

        main:
                push    rbp
                mov     rbp, rsp

                ; Add all elements in the array
                mov     r9,  0xA                        ; the length of array
                mov     r10, 0x0                        ; index
                mov     [sum], DWORD 0x0                ; sum

                _loop:
                        xor     rax, rax
                        mov     rax, [arr1 + r10 * DWORD_SIZE]
                        add     [sum], rax
                        inc     r10
                        cmp     r10, r9

                        jl      _loop
                        jmp     _loopend

                _loopend:
                        mov     rdi, formatString
                        mov     rsi, [sum]
                        call    printf

                        mov     rsp, rbp
                        pop     rbp

                        ret
