; Nasm v2.15.05 (on Linux x64)

section .data
        target: DB      "/bin/sh"

section .text
        global _start

_start:
        ; execve("/bin/sh", NULL, NULL)
        mov rax, 0x3B           ; execve(
        mov rdi, target         ;       const char *filename,
        xor rsi, rsi            ;       const char *const *argv,
        xor rdx, rdx            ;       const char *const *envp)
        syscall
