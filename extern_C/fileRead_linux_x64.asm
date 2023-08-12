; Nasm v. 2.15.05. (on Linux x64)

; This Assembly code assumes that "./example.txt" is located in the same folder.
; The content of example.txt is:
;   ======= file start =======
;   Hello Hello, Happiness!
;   You make me feel so smile!
;   ======= file ends ========

extern  printf
extern  fopen
extern  fread
extern  fclose

MAX_READ_LIMIT  EQU     0x3E8   ; 1,000 bytes

section .data
        printfFormatString      DB      "%s", 0xA, 0x0
        filePath                DB      "./example.txt", 0x0
        fopenMode               DB      "r", 0x0

section .text
        global  main

        main:
                push    rbp
                mov     rbp, rsp
                mov     rcx, 0x3E8      ; buffer size
                add     rcx, 0x8        ; file descriptor size
                sub     rsp, rcx

                ; FILE *fp = fopen("./example.txt", "r");
                lea     rax, [filePath]
                mov     rdi, rax
                lea     rax, [fopenMode]
                mov     rsi, rax
                call    fopen
                mov     QWORD [rbp-0x8], rax            ; file descriptor

                ; char buffer[MAX_READ_LIMIT] = { 0, };
                ; buffer range: [rbp-0x3F0] ~ [rbp-0x8] (1,000 bytes worth)i
                lea     rdx, [rbp-0x3F0]
                mov     rdi, rdx
                mov     rcx, 0x7D               ; 0x7D * 0x8(QWORD) = 0x3E8 = 1,000 (bytes)
                mov     rax, 0x0                ; wrap every 8 bytes of buffer with 0
                REP STOSQ

                ; fread(buffer, 1, MAX_READ_LIMIT, fp);
                lea     rax, [rbp-0x3F0]
                mov     rdi, rax                ; buffer
                mov     rsi, 0x1                ; size_t size (0x1)
                mov     rdx, MAX_READ_LIMIT     ; MAX_READ_LIMIT
                mov     rax, QWORD [rbp-0x8]
                mov     rcx, rax                ; file descriptor
                call    fread

                ; printf("%s", buffer);
                mov     rdi, printfFormatString
                lea     rax, [rbp-0x3F0]        ; to print buffer until '\0'(NULL)
                                                ; give its address, not its value
                mov     rsi, rax
                call    printf

                ; fclose(fp);
                mov     rax, QWORD [rbp-0x8]    ; file descriptor
                mov     rdi, rax
                call    fclose

                mov     rsp, rbp
                pop     rbp
                ret
