arm-linux-as -mthumb -o write.o write.s
arm-linux-ld -o write write.o
arm-linux-objdump -d write > write_rev.s
