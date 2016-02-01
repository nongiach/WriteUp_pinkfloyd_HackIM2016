
set follow-fork-mode child
set confirm off
set disassemble-next-line on

file pinkfloyd

# pop_r0_r4
# b *0x1fbe0
# b *0x1f834

# printf of cmd
# b *0x8f8c

# buffer2
b *0x7efff924
# printf buffer2
# b *0x907c
# b exit

# before memcpy
b *0x8df0

# before ret
b *0x9160

run
