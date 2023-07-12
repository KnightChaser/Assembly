conditions_a_linux_x64: conditions_a_linux_x64.asm
        nasm -f elf64 -o conditions_a_linux_x64.o conditions_a_linux_x64.asm
        ld -o conditions_a_linux_x64 conditions_a_linux_x64.o

clean:
        rm -f ./conditions_a_linux_x64
        rm -f ./conditions_a_linux_x64.o
