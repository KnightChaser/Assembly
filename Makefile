# Default Form of Makefile

# For 64 bit architecture
example_assembly_file_x64: example_assembly_file_x64.asm
    nasm -f elf64 -o example_assembly_file_x64.o example_assembly_file_x64.asm
    ld -o example_assembly_file_x64 example_assembly_file_x64.o

# For 32 bit architecture
example_assembly_file_x32: example_assembly_file_x32.asm
    nasm -f elf example_assembly_file_x32.asm
    ld -m elf_i386 -s -o example_assembly_file_x32 example_assembly_file_x32.o

clean:
    rm -f ./example_assembly_file_x*        # Delete the executable file
    rm -f ./example_assembly_file_x*.o      # Delete the objective file
