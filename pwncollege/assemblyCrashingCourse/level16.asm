[bits 64]
mov QWORD rax, [rsp]
add QWORD rax, [rsp + 0x8]
add QWORD rax, [rsp + 0x10]
add QWORD rax, [rsp + 0x18]
mov rcx, 0x4
idiv rcx
push rax
