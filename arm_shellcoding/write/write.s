.section .text
.global _start

_start:

    # _write()
    mov     r2, #16
    mov r1, pc      
    add r1, #24    
    mov     r0, $0x1
    mov     r7, $0x4
    svc     0

    # _exit()
    sub r0, r0, r0
    mov     r7, $0x1
    svc 0

.ascii "shell-storm.org\n"
