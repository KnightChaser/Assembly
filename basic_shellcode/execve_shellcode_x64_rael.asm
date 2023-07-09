; Nasm v2.15.05 (on Linux x64)

section .text
        global _start

_start:
        mov rax, 0x68732f6e69622f ; /bin/sh
        push rax

        mov rax, 0x3B   ; execve(
        mov rdi, rsp    ;       const char *filename,
        xor rsi, rsi    ;       const char *const *argv,
        xor rdx, rdx    ;       const char *const *envp);
        syscall
