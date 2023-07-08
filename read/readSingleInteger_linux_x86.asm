; Nasm v2.15.05 (on Linux x86)

section .data
    integer times 4 db 0           ; 32-bits integer = 4 bytes
    integerLength equ $-integer    ; the length of the variable integer
    
section .text
    global _start
    
_start:
    ; read(FILE_DESCRIPTOR, BUFFER, LENGTH)
    mov eax, 0x3              ; read(
    mov ebx, 0x0              ;     fd = stdin,
    mov ecx, integer          ;     buf = integer,
    mov edx, integerLength    ;     length = integerLength);
    int 0x80
    
    ; write(FILE_DESCRIPTOR, BUFFER, LENGTH)
    mov eax, 0x4              ; write(
    mov ebx, 1                ;     fd = stdout,
    mov ecx, integer          ;     buf = integer,
    mov edx, integerLength    ;     length = integerLength);
    int 0x80
    
    ; sys_exit()
    mov eax, 0x1              ; sys_exit();
    int 0x80
