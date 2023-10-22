[bits 64]
mov QWORD r8, [rdi]
mov QWORD r9, [rdi + 8]
add r8, r9
mov [rsi], r8
