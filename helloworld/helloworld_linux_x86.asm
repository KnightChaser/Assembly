; Nasm v2.15.05 (on Linux x86)

section .data
    message db "Hello, World!", 0xA     ; original message
    length equ $ - message              ; length of the original message
    
section .text
    global _start
    
_start:
    ; write(FILE_DESCRIPTOR, MESSAGE, LENGTH)
    mov eax, 0x4
    mov ebx, 1      
    mov ecx, message
    mov edx, length
    int 0x80            ; syscall
    
    ; exit
    mov eax, 0x1
    int 0x80            ; syscall
