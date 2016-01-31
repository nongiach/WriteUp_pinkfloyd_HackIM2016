# HackIM CTF 2016 : Exploit 100

**Category:** exploit |
**Name:** pinkfloyd |
**Solves:** 16 |
**Description:**

> 52.72.171.221 9981

___

## Write-up
 
This was a fun since it was my first ARM exploit :)

### Step 0: war of information

    $ file pinkfloyd
    pinkfloyd: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, for GNU/Linux 2.6.32,  BuildID[sha1]=62c86841d0c0384ce39d70fef5afe0eee5cad7b4, not stripped
    checksec --file pinkfloyd
    RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      FILE
    Partial RELRO   No canary found   NX disabled   No PIE          No RPATH   No RUNPATH   pinkfloyd


So it's a statically linked ARM elf with no advanced protection.

### Step 1: find the white rabbit

After playing a little we can crash the program using the create command by filling the tags parameter.

### Step 2: $pc
Now we want to overwrite the current instruction pointer $pc because it's sexy and this way we can control the flow of execution.
We need as much information as possible that why we need either a arm device or arm vm, we also need some decompiler/debugger ida and gdb will do the work.
Because you'r cool I share with you this 2.9M [qemu-arm](google) standalone :)

Using python and your prefered pattern generator inject 300 bytes in the tags field, using gdb we now know the offset for overwriting $pc is 88.

### Step 3: store the shellcode
During a static IDA analysis we saw that one allocation of buffer where the name is stored. This buffer addr can be found using gdb.
ptr = 0x8f830
![IDA](/IDA_malloc_Capture.PNG)

### Step 4: write the shellcode
Playing around with arm-linux-as and arm-linux-ld we can write our own shellcode. Make sure to avoid null byte !! and don't forget do dup2 stdin, stdout, stderr to the socket :p
[help here shellstorm] (http://shell-storm.org/blog/Shellcode-On-ARM-Architecture/)
![IDA](/Shellcode_Capture.PNG)

### Step 5: finish him
We got almost everything but don't forget the flag :)
We wrote the shellcode
We overwrote $pc
The shell is running but there is no ls on the system

    >$ls
    ls: command not found
    >echo *
    ls output here :D flagBlaBla.txt
    > cat flag*
    FlagHere

Enjoy :)

----
[@chaign\_c](https://twitter.com/chaign_c) from [HexpressoTeam](http://hexpresso.github.io/)
