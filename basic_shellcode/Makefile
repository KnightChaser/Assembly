# For orw_shellcode_x64
orw_shellcode_x64: orw_shellcode_x64.asm
        nasm -f elf64 -o orw_shellcode_x64.o orw_shellcode_x64.asm
        ld -o orw_shellcode_x64 orw_shellcode_x64.o

clean:
        rm -f ./orw_shellcode_x64.o
        rm -f ./orw_shellcode_x64

# For execve_shellcode_x64
execve_shellcode_x64: execve_shellcode_x64.asm
        nasm -f elf64 -o execve_shellcode_x64.o execve_shellcode_x64.asm
        ld -o execve_shellcode_x64 execve_shellcode_x64.o

clean:
        rm -f ./execve_shellcode_x64.o
        rm -f ./execve_shellcode_x64
