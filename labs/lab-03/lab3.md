# Lab 3: Removing spaces

**Deadline:** Sunday, 2/18/2024

Read the assignment carefully. 

Try your best to complete the lab assignment during the lab session.

*If you work on computers in the learning center or a UConn virtual desktop, 
save your files on P drive. Otherwise, you may lose your files.*

## Learning Objectives

* Access data in memory

* Compute with strings

## Description

In this lab, we write a program in RISC-V assembly language that removes spaces
in a string. Recall that the strings in this course are ASCII strings.  Each
character is stored in a byte and a null character (NUL) indicates the end. 

Skeleton code is provided in `lab3.s`. The program performs the following
tasks. 

1.  Read a line from the console and store the string in `str`. This step is
    already done in the code provided.
    
2.  Remove the spaces (ASCII value 32) in `str` and save the result in `res`.

    Think aobut the strategy/algorithm first. One method is provided in
    pseudocode at the bottom of this page.

    **Constraints in your code:** Only use argument registers (like `a0` and `a1`)
    and temporary registers (like `t0` and `t1`). 

3.  Print `res`. This is done by a system call.

    Note that the address of `res` is saved in a register before the Step 2
    code.


### Input 

The user can type up to 80 characters before pressing the Enter key. The ASCII
values of the characters, other than the Enter key, is between 32 (space)
and 126, inclusive.

### Testing

The following are some examples of expected output of the program. The lines
that have spaces are input. Please test your code with strings of different
lengths. 

```
a b c
abc

RISC-V: The Free and Open RISC Instruction Set Architecture
RISC-V:TheFreeandOpenRISCInstructionSetArchitecture
```

## Deliverables

Please submit lab3.s in GradeScope by the deadline.

## Pseudocode

```
i = 0
j = 0
do
    c = str[i]
    i += 1
    if c != ' '         # space
        res[j] = c
        j += 1
while c != 0
print res
```
