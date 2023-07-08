orw_shellcode_x64: orw_shellcode_x64.asm
        nasm -f elf64 -o orw_shellcode_x64.o orw_shellcode_x64.asm
        ld -o orw_shellcode_x64 orw_shellcode_x64.o

clean:
        rm -f ./orw_shellcode_x64.o
        rm -f ./orw_shellcode_x64
