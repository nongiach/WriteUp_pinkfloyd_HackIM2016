arm-linux-as -mthumb -o shell.o shell.s
arm-linux-ld -o shell shell.o
arm-linux-objdump -d shell > shell_rev.s
