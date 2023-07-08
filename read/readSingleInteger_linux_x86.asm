; Nasm v2.15.05 (on Linux x86)

section .bss
    number RESB 0x4             ; int number;   (uninitialized)
                                ; RESB(1 byte reserve) * 4 times = 4 bytes (int)
    numberLength equ $-number
    
section .text
    global _start
    
_start:
    ; read(FILE_DESCRIPTOR, BUFFER, LENGTH)
    mov eax, 0x3             
    mov ebx, 0x0              
    mov ecx, number          
    mov edx, numberLength  
    int 0x80
    
    ; write(FILE_DESCRIPTOR, BUFFER, LENGTH)
    mov eax, 0x4             
    mov ebx, 0x1            
    mov ecx, number        
    mov edx, numberLength   
    int 0x80
    
    ; sys_exit()
    mov eax, 0x1              ; sys_exit();
    int 0x80
