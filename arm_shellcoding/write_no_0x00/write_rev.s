
write:     file format elf32-littlearm


Disassembly of section .text:

00010054 <_start>:
   10054:	e1a01001 	mov	r1, r1
   10058:	e28f6001 	add	r6, pc, #1
   1005c:	e12fff16 	bx	r6
   10060:	2210      	movs	r2, #16
   10062:	4679      	mov	r1, pc
   10064:	310e      	adds	r1, #14
   10066:	2001      	movs	r0, #1
   10068:	2704      	movs	r7, #4
   1006a:	df01      	svc	1
   1006c:	1b24      	subs	r4, r4, r4
   1006e:	1c20      	adds	r0, r4, #0
   10070:	2701      	movs	r7, #1
   10072:	df01      	svc	1
   10074:	6c656873 	.word	0x6c656873
   10078:	74732d6c 	.word	0x74732d6c
   1007c:	2e6d726f 	.word	0x2e6d726f
   10080:	0a67726f 	.word	0x0a67726f
