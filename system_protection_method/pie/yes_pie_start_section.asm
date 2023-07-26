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
   lea    rdi,[rip+0xca]        ; <main>
   call   QWORD PTR [rip+0x2f53]
   hlt
;End of assembler dump.
