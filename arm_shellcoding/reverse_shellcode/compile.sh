arm-linux-as -mthumb -o shell.o shell.s
arm-linux-ld -o shell shell.o --relax -fPIC -shared
arm-linux-objdump -d shell > shell_rev.s
