read_syscall_linux_x64: read_syscall_linux_x64.asm
        nasm -f elf64 -o read_syscall_linux_x64.o read_syscall_linux_x64.asm
        ld -o read_syscall_linux_x64 read_syscall_linux_x64.o

clean:
        rm -f *.o
        rm -f $(TARGET)
