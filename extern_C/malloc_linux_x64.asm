; Nasm v. 2.15.05. (on Linux x64)

extern  printf
extern  malloc
extern  free

INTEGER_SIZE    EQU     0x4

section .data
        printFormatString       DB      "integerArray[%d]: %d", 0xA, 0x0

section .bss
        _repeat                 RESB    0x8

section .text
        global main

        main:
                push    rbp
                mov     rbp, rsp
                sub     rsp, 0x10

                ; (int *)malloc(sizeof(int) * 0x4)
                mov     rax, INTEGER_SIZE
                mov     rbx, 0x4
                mul     rbx
                mov     rdi, rbx
                call    malloc

                ; the dynamically-allocated memory space address will go to RAX
                mov    QWORD [rbp-0x8], rax

                ; apply values to the array
                mov    rax, QWORD [rbp-0x8]
                add    rax, 0x0                 ; 0th index, *(rax+0x0)
                mov    DWORD [rax], 0x0         ; integerArray[0] = 0;

                mov    rax,QWORD [rbp-0x8]
                add    rax, 0x4                 ; 1st index, *(rax+sizeof(int)*1) = *(rax+4)
                mov    DWORD [rax], 0x1         ; integerArray[1] = 1;

                mov    rax,QWORD [rbp-0x8]
                add    rax, 0x8                 ; 2nd index, *(rax+sizeof(int)*2) = *(rax+8)
                mov    DWORD [rax], 0x2         ; integerArray[2] = 2;

                mov    rax,QWORD [rbp-0x8]
                add    rax, 0xC                 ; 3rd inex, *(rax+sizeof(int)*3) = *(rax+12)
                mov    DWORD [rax], 0x3         ; integerArray[3] = 3;

                ; print the array list with loop
                mov     QWORD [_repeat], 0x0
                jmp     _printLoop
                _printLoop:
                        mov     rax, QWORD [rbp-0x8]

                        mov     rdi, printFormatString                  ; "integerArray[%d]: %d", 0xA, 0x0
                        mov     rcx, QWORD [_repeat]
                        mov     rsi, rcx                                ; index (_repeat)
                        mov     rdx, QWORD [rax + rcx * INTEGER_SIZE]   ; integerArray[index] (integerArray[_repeat])
                        call    printf

                        add     QWORD [_repeat], 0x1
                        cmp     QWORD [_repeat], 0x3

                        jle     _printLoop
                        jmp     _printLoopEnd

                _printLoopEnd:
                mov     rdi, QWORD [rbp-0x8]
                call    free

                mov     rsp, rbp
                pop     rbp
                ret
