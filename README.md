# HackIM CTF 2016 : Exploit 100

**Category:** exploit |
**Name:** pinkfloyd |
**Solves:** ? |
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
We need as much information as possible that why we need either an arm device or arm VM, we also need some decompiler/debugger ida and gdb will do the work.
Because you'r cool, I share with you this 2.9M [qemu-arm](/qemu-arm) standalone :)

Using python and your prefered pattern generator inject 300 bytes in the tags field, using gdb we now know the offset for overwriting $pc is 88.

### Step 3: store the shellcode
During a static IDA analysis, we saw that one allocation of the buffer where the name is stored. This buffer addr can be found using gdb.
ptr = 0x8f830
![IDA](/IDA_malloc_Capture.PNG)

### Step 4: write the shellcode
Playing around with arm-linux-as and arm-linux-ld we can write our own shellcode. Make sure to avoid null byte !! and don't forget to dup2 stdin, stdout, stderr to the socket :p
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

### Full exploit:
[exploit](/exploit.py)

### Bonus: IRL
In real life, it wasn't that simple,
 I spend a lot of time messing to find a addr where I can jump to because we got no information about the state of the distant machine memory,
 I began to try with the stack but no luck.
 We can't rop or "ret to libc..static" because there are a lot of null byte in all addr.
 I didn't saw at the first look that we can overflow in tags too. it help because the overwrite in not dependant of the shellcode upload.
 Some shit when shellcoding...
 I realy encourage you to check out this [qemu-arm](/qemu-arm) standalone because it's very light and we don't need to setup a vm just ./quemu-arm ./pinkfloyd
 I saved it from an previous ctf ^^
 check out my gdb.gdbinit you can start it using gdb -x gdb.gdbinit
 it's awesome because I can automate everything, it's a big time saver, here it's basic but we can do a lot more complex
Enjoy :)

----
[@chaign\_c](https://twitter.com/chaign_c) from [HexpressoTeam](http://hexpresso.github.io/)
