#       CSE 3666 Lab 3: remove spaces

        .data
        # allocating space for both strings
str:    .space  128
res:    .space  128

        .globl  main

        .text
main:   
        la      s0, str
        la      s1, res

        addi    a0, s0, 0 
        addi    a1, x0, 120
        addi    a7, x0, 8
        ecall
		
	la t0,str

    li t1, 0 # i = 0
    li t2, 0 # j = 0

    li s1, 32 # ascii value of empty space

Do: 
    add t4, t1,t0
	lb t4, (t4)
	beq t4, s1, Else # if char is space 
	add t5, t2, t0
	sb t4, (t5)
	addi t2, t2, 1 #j++

Else:  
    addi t1, t1, 1 # i++
	add t5, t1, t0
	lb t5, (t5)
	bnez t5, Do # if end of string hasnt been reached yet
	add t4, t2, t0
	sb zero, (t4)
	
Exit:
	la a0, str
	li a1, 100
	addi a7, x0, 4 # print string
	ecall