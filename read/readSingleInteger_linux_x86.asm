; Nasm v2.15.05 (on Linux x86)

section .data
    integer times 4 db 0           ; 32-bits integer = 4 bytes
    integerLength equ $-integer    ; the length of the variable integer
    
section .text
    global _start
    
_start:
    ; read(FILE_DESCRIPTOR, BUFFER, LENGTH)
    mov eax, 0x3              ; syscall read() -> 0x3
    mov ebx, 0                ; stdin
    mov ecx, integer          ; buffer (variable integer)
    mov edx, integerLength    ; buffer length
    int 0x80
    
    ; write(FILE_DESCRIPTOR, BUFFER, LENGTH)
    mov eax, 0x4              ; syscall write() -> 0x4
    mov ebx, 1                ; stdout
    mov ecx, integer          ; buffer (variable integer)
    mov edx, integerLength    ; buffer length
    int 0x80
    
    ; exit
    mov eax, 0x1              ; exit
    int 0x80
