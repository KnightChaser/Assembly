[bits 64]
mov DWORD [rdi], 0x00001337
mov DWORD [rdi + 4], 0xDEADBEEF
mov DWORD [rsi], 0xFFEE0000
mov DWORD [rsi + 4], 0xC0
