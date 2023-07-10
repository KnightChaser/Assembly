; For x86 architecture
; On WSL Ubuntu 22.04 (on Windows 11)

; From cdecl.c
; Compile: gcc -fno-asynchronous-unwind-tables -nostdlib -masm=intel \
;          -fomit-frame-pointer -S cdecl.c -w -m32 -fno-pic -O0

        .file   "cdecl.c"
        .intel_syntax noprefix
        .text
        .globl  callee
        .type   callee, @function
        
; void __attribute__((cdecl)) callee(int a1, int a2) { }
callee:
        nop             ; "callee" was supposed do nothing
        ret             ; return (finish running) without arranging stack
        .size   callee, .-callee
        .globl  caller
        .type   caller, @function
        
; void caller() { callee(1, 2); }
caller: 
        push    2        ; Second argument
        push    1        ; First argument
        call    callee   ; call fuction
        add     esp, 8   ; arranging stack after running "callee", 8 bytes because 2 integer arguments
        nop
        ret              ; program ends
        .size   caller, .-caller
        .ident  "GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
        .section        .note.GNU-stack,"",@progbits
