#       CSE 3666 Lab 2

        .globl  main

        .text
main:   
        # use system call 5 to read integer
        addi    a7, x0, 5
        ecall
        add     s1, a0, x0       # copy to s1


        add     t0, x0, s1 # t1
        add     s2, x0, x0 # s2

        addi    x15, x0, 32     # value of 32
        addi    x16, x0, 0      # var i
Loop:   # Loop ends, go to print
        bge x16, x15, Print 

        slli s2, s2, 1 # shift 1

        andi t2, t0, 1 #
        or s2, s2, t2
        srli t0, t0, 1

        addi x16, x16, 1 # i++
        beq x0, x0, Loop # Loop again 



Print:  # Print values and go to exit 
        addi a0, s1, 0 # print s1 in binary
        addi a7, x0, 35
        ecall

        addi a7, x0, 11 # print new line
        addi a0, x0, '\n'
        ecall

        addi a0, s2, 0 # print s2 in binary
        addi a7, x0, 35
        ecall

        addi a7, x0, 11 # print new line
        addi a0, x0, '\n'
        ecall

        beq x0, x0, exit

exit:   # end program
        addi    a7, x0, 10      
        ecall


# what if we copy LSB then shift every time??

        # TODO
        # Add you code here
        #   reverse bits in s1 and save the results in s2
        #   print s1 in binary, with a system call
        #   print newline
        #   print s2 in binary
        #   print newline
        
        # exit



