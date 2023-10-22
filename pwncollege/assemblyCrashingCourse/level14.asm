[bits 64]
mov r8, 0x7FFFFF1FFFF8
mov r9, [r8]
sub r9, rdi
mov [r8], r9
