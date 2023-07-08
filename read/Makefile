readSingleInteger_linux_x64: readSingleInteger_linux_x64.asm
        nasm -f elf64 -o readSingleInteger_linux_x64.o readSingleInteger_linux_x64.asm
        ld -o readSingleInteger_linux_x64 readSingleInteger_linux_x64.o

clean:
        rm -f *.o
        rm -f $(TARGET)
