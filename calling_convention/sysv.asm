; For x64(x86-64) architecture
; On WSL Ubuntu 22.04 (on Windows 11)

; Compile: gcc -fno-asynchronous-unwind-tables  -masm=intel \
;		-fno-omit-frame-pointer -o sysv sysv.c -fno-pic -O0

        .file   "sysv.c"
        .intel_syntax noprefix
        .text
        .globl  called
        .type   called, @function

; ull callee(ull a1, int a2, int a3, int a4, int a5, int a6, int a7) {
;	ull ret = a1 + a2 + a3 + a4 + a5 + a6 + a7;
;	return ret;
; }
called:
        endbr64
        push    rbp				; save [caller]'s rbp (to return at the end of the function)
        mov     rbp, rsp			; stack
						; expand stack and store variables
        mov     QWORD PTR [rbp-24], rdi		; 1st parameter (123456789123456789)
        mov     DWORD PTR [rbp-28], esi		; 2nd parameter (2)
        mov     DWORD PTR [rbp-32], edx		; 3rd parameter (3)
        mov     DWORD PTR [rbp-36], ecx		; 4th parameter (4)
        mov     DWORD PTR [rbp-40], r8d		; 5th parameter (5)
        mov     DWORD PTR [rbp-44], r9d		; 6th parameter (6)
        mov     eax, DWORD PTR [rbp-28]		; 7th parameter (7/stack)

	; add...
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-24]
        add     rdx, rax
        mov     eax, DWORD PTR [rbp-32]
        cdqe
        add     rdx, rax
        mov     eax, DWORD PTR [rbp-36]
        cdqe
        add     rdx, rax
        mov     eax, DWORD PTR [rbp-40]
        cdqe
        add     rdx, rax
        mov     eax, DWORD PTR [rbp-44]
        cdqe
        add     rdx, rax
        mov     eax, DWORD PTR [rbp+16]
        cdqe
        add     rax, rdx			; the final calculation
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]		; the return value is stored in RAX register
        pop     rbp				; pop RBP position value -> [calller]'s rbp -> ready to return to the caller
        ret					; return
        .size   called, .-called
        .globl  caller
        .type   caller, @function


; void caller() { callee(123456789123456789, 2, 3, 4, 5, 6, 7); }
caller:
        endbr64
        push    rbp
        mov     rbp, rsp
        sub     rsp, 8
        push    7			; 7th parameter (stack -> rsp)
        mov     r9d, 6			; 6th parameter (r9d)
        mov     r8d, 5			; 5th parameter (r8d)
        mov     ecx, 4			; 4th parameter (rcx)
        mov     edx, 3			; 3rd parameter (rdx)
        mov     esi, 2			; 2nd parameter (rsi)
        movabs  rax, 123456789123456789	; 1st parameter (rax)
        mov     rdi, rax		;		  |--> rdi
        mov     eax, 0
        call    callee			; callee(123456789123456789, 2, 3, 4, 5, 6, 7);
        add     rsp, 16
        nop
        leave
        ret
        .size   caller, .-caller
        .globl  main
        .type   main, @function

; int main { caller() };
main:
        endbr64
        push    rbp
        mov     rbp, rsp
        mov     eax, 0
        call    caller			; just run caller
        mov     eax, 0
        pop     rbp
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
        .section        .note.GNU-stack,"",@progbits
        .section        .note.gnu.property,"a"
        .align 8
        .long   1f - 0f
        .long   4f - 1f
        .long   5
0:
        .string "GNU"
1:
        .align 8
        .long   0xc0000002
        .long   3f - 2f
2:
        .long   0x3
3:
        .align 8
4:
