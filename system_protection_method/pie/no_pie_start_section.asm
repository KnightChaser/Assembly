;Dump of assembler code for function _start:
   endbr64
   xor    ebp,ebp
   mov    r9,rdx
   pop    rsi
   mov    rdx,rsp
   and    rsp,0xfffffffffffffff0
   push   rax
   push   rsp
   xor    r8d,r8d
   xor    ecx,ecx
   lea    rdi,0x401136	        ; <main>
   call   QWORD PTR [rip+0x2f7b]
   hlt
;End of assembler dump.
