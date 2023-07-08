; Nasm v2.15.05 (on Linux x64)

O_RDONLY        equ     0x00
STDOUT          equ     0x01

section .data
        filePath:       DB "/tmp/flag"  ; filePath

section .text
        global _start

_start:
        ; open("/tmp/flag", RD_ONLY, NULL);
        mov rax, 0x02           ; open(
        mov rdi, filePath       ;       const char *filename,
        mov rsi, O_RDONLY       ;       int flags,
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
        mov rdi, STDOUT         ;       unsigned int fd,
        ;rsi                    ;       const char *buf,
        mov rdx, 0x30           ;       size_t count);
        syscall

        ; exit
        mov rax, 0x3C
        mov rdi, 0x1
        syscall
