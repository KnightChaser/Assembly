; Nasm v 2.15.05 (on Linux x64)
extern  printf
extern  scanf

true    EQU     0x1
false   EQU     0x0

section .data
        notificationString              DB      "num: ", 0x0
        notificationStringFormat        DB      "%s", 0x0                               ; %s\0
        userInputFormat                 DB      "%d", 0x0                               ; %d\0
        resultPrintFormat               DB      "%d", 0xA, 0x0                          ; %d\n\0

section .bss
        number                  RESB    0x8
        _i                      RESB    0x8

section .text
        global main

        ; validate if the given number(RSI) is a prime number
        isPrimeNumber:

                mov     r10,  0x2               ; looping variable

                _inspect:
                        mov     rax, rdi        ;rsi
                        cdq
                        mov     rbx, r10
                        div     rbx

                        cmp     rdx, 0x0
                        je      _itIsNotPrime
                        jne     _notDetermined

                        ; None prime number cases go here
                        _itIsNotPrime:
                                mov     rax, false
                                retn

                        _notDetermined:
                                inc     r10
                                mov     r9, r10
                                cmp     r9, rdi         ;rsi
                                je      _itIsPrime      ; Fully inspected and confirmed it is a prime number.
                                jne     _inspect        ; Not fully inspected. Continue checking.

                _itIsPrime:
                        mov rax, true
                        retn

        main:
                ; initialize
                push    rbp
                mov     rbp, rsp

                mov     rdi, notificationString
                mov     rsi, notificationStringFormat
                call    printf

                mov     rdi, userInputFormat
                mov     rsi, number
                call    scanf

                mov     QWORD [_i], 0x2

                _loop:
                        mov     rdi, [_i]
                        call    isPrimeNumber           ; true(0x1)     will return if it is a prime number
                                                        ; false(0x0)    will return if it is not a prime number

                        cmp     rax, true
                        je      _primeTrue
                        jne     _primeFalse
                        _primeTrue:
                                mov     rdi, resultPrintFormat
                                mov     rsi, [_i]
                                call    printf
                                jmp     _primeEnd
                        _primeFalse:
                                nop
                        _primeEnd:

                        add     QWORD [_i], 0x1

                        mov     r10, [_i]
                        mov     r11, [number]
                        cmp     r10, r11
                        jle     _loop
                        jmp     _loop_end
                _loop_end:

                ; end program
                mov     rsp, rbp
                pop     rbp
                retn
