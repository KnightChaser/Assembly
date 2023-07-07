; Nasm v2.15.05 (on Linux x86)

section .data
    name db 'KnightChaser'
    nameLength equ $-name
    
    newLineMsg db 0xA
    newLineLen equ $-newLineMsg
    
section .text
    global _start
    
_start:
    
    ; Writing the original name 'KnightRider'
    mov eax, 0x4        ; write
    mov ebx, 0x1        ;  (fd = stdout,
    mov ecx, name       ;   buf = name,
    mov edx, nameLength ;   length = nameLength);
    int 0x80
    
    ; For printing newline
    mov edx, newLineLen
    mov ecx, newLineMsg
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    ; overwrite the data amount of DWORD
    mov [name + 0x6], BYTE 'R'
    mov [name + 0x7], BYTE 'i'
    mov [name + 0x8], BYTE 'd'
    mov [name + 0x9], BYTE 'e'
    mov [name + 0xA], BYTE 'r'
    mov [name + 0xB], BYTE 0x0
    
    ; Writing the (fixed) name again
    mov eax, 0x4        ; write
    mov ebx, 0x1        ;  (fd = stdout,
    mov ecx, name       ;   buf = name,
    mov edx, nameLength ;   length = nameLength);
    int 0x80
    
    ; For printing newline
    mov edx, newLineLen
    mov ecx, newLineMsg
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    mov eax, 0x1
    int 0x80
