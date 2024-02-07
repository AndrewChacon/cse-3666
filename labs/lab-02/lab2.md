# Reverse bits

**Deadline:** Sunday, 2/11/2024

## Learning Objectives

- Logical and bit-wise operations
- Binary representation of signed integers
- ASCII characters

  In order to print a newline character we will have to use the addi instruction to save the ASCII character ('\n') into a register as following:  
  `addi    a0, x0, '\n'`  
   Now we have to do a syscall to print the ACSII character, look in the syscall tab and find the appropriate argument to print ACSII characters.

## Description

In this lab, we write a program in RISC-V assembly language that reverse the order
of the bits in a register.

The program reads a signed integer from the console and reverse the 32 bits in the
number.

Skeleton code in `lab2.s` reads an integer, using a system call, and saves it in `s1`.

Implement the following steps with RISC-V instructions.

- Write a loop to reverse the bits in `s1` and save the results in `s2`.

  Think about the strategy/algorithm first. One method is provided in
  pseudocode at the bottom of this page. Note that we are working on bits in
  registers and do not interprete them as signed values.

- Use a system call to print `s1` in binary.

  Find the system call number in RARS's help. Using the syscall manual, which number represents PrintIntBinary functionality?

- Use a system call to print a newline character.

- Use a system call to print `s2` in binary.

- Use a system call to print a newline character.

Here are some example inputs/outputs of the program.

```
170
00000000000000000000000010101010
01010101000000000000000000000000

00000000000000000000000010101010
01010101000000000000000000000000

20232023
00000001001101001011011101010111
11101010111011010010110010000000

1431655765
01010101010101010101010101010101
10101010101010101010101010101010

-3666
11111111111111111111000110101110
01110101100011111111111111111111

-2010819982
10001000001001010101001001110010
01001110010010101010010000010001

10001000001001010101001001110010
01001110010010101010010000010001


```

## Deliverables

Please submit lab2.s by the deadline.

## Pseudocode

Here is one of the methods. All registers are unsigned.

```
1.  t0 = s1         // copy s1 to t0
2.  s2 = 0
3.  FOR (i = 0; i < 32; i += 1)  // repeat 32 times
        // copy the the LSB in t0 to s2
        s2 <<= 1            // s2 = s2 << 1
        s2 |= (t0 & 1)
        t0 >>= 1
```
