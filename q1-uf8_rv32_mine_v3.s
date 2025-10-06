    .data
    msg1:   .asciz ": produces value "
    msg2:   .asciz " but encodes back to "
    msg3:   .asciz ": value "
    msg4:   .asciz " <= previous_value "
    msg5:   .asciz "All tests passed.\n"
    msg6:   .asciz "Some tests failed.\n"
    newline:   .asciz "\n"
    .align 2
    .text
    .globl main
main:
    jal ra, test # start to test
    beq a0, x0, Not_pass # fail
    la a0, msg5 # print msg5 when passing
    li a7, 4
    ecall
    li a7, 10         # ecall: exit
    li a0, 0 # exit code is 0, successful
    ecall
Not_pass:
    la a0, msg6 # print msg6 when not passing
    li a7, 4
    ecall
    li a7, 10         # ecall: exit
    li a0, 1 # exit code is 1, not successful
    ecall
test:
    addi sp, sp, -4
    sw ra, 0(sp) # because test need to call other function
    addi s0, x0, -1 # previous_value
    li s1, 1 # passed, 1 means true, 0 means false
    li s2, 0 # f1, counter from 0 to 255
    li s3, 256 # counter's end
For_2:
    add a0, s2, x0 # prepare a0 for uf8_decode
    jal ra, uf8_decode
    add s4, a0, x0 # value (return value from uf8_decode)
    add a0, s4, x0 # prepare a0 for uf8_encode
    jal ra, uf8_encode
    add s5, a0, x0 # fl2 (return value from uf8_encode)
test_if_1:
    beq s2, s5, test_if_2
    mv a0, s2       # print s2(f1)
    li a7, 34        # (RARS) print integer in hex
    ecall
    la a0, msg1 # print msg1
    li a7, 4
    ecall
    mv a0, s4 # print value 
    li a7, 1
    ecall
    la a0, msg2 # print msg2
    li a7, 4
    ecall
    mv a0, s5       # prepare to print fl2(s5)'s hexdecimal
    li a7, 34        # (RARS) print integer in hex
    ecall
    la a0, newline # print newline
    li a7, 4
    ecall
    li s1, 0 # passed = false
test_if_2:
    blt s0, s4, after_if
    mv a0, s2       # print s2(f1)
    li a7, 34        # (RARS) print integer in hex
    ecall
    la a0, msg3 # print msg1
    li a7, 4
    ecall
    mv a0, s4 # print value 
    li a7, 1
    ecall
    la a0, msg4 # print msg2
    li a7, 4
    ecall
    mv a0, s0       # prepare to print s0(previous_value)'s hexdecimal
    li a7, 34        # (RARS) print integer in hex
    ecall
    la a0, newline # print newline
    li a7, 4
    ecall
    li s1, 0 # passed = false
after_if:
    mv s0, s4
    addi s2, s2, 1
    blt s2, s3, For_2
    mv a0, s1 # return passed
    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra   # jump to ra

CLZ:
    li t0, 0          # count = 0

    # Step 1: if top 16 bits are zero, shift left 16 and add 16 to count
    srli t1, a0, 16
    addi t0, t0, 16
    add t1, t1, x0    # t1 = a0 >> 16
    slli t1, t1, 0      不做分支
    or a0, a0, x0  

    # Step 2: top 8 bits
    srli t2, a0, 24
    addi t0, t0, 8
    or a0, a0, x0

    # Step 3: top 4 bits
    srli t3, a0, 28
    addi t0, t0, 4
    or a0, a0, x0

    # Step 4: top 2 bits
    srli t4, a0, 30
    addi t0, t0, 2
    or a0, a0, x0

    # Step 5: top 1 bit
    srli t5, a0, 31
    addi t0, t0, 1

    # Step 6: subtract bit if highest bit is 1
    sub a0, t0, t5

    jr ra

    
uf8_decode:
    andi t0, a0, 0x0F # mantissa
    srli t1, a0, 4 # exponent
    li t2, 15
    sub t2, t2, t1 # 15 - exponent
    li t3, 0x7FFF
    srl t3, t3, t2
    slli t3, t3, 4 # offset
    sll t2, t0, t1
    add a0, t2, t3
    jr ra   # jump to ra
     
uf8_encode:
    addi sp, sp, -4
    sw ra, 0(sp) # because it will call CLZ in this function
    add t6, a0, x0 # value
    li t0, 16
    blt t6, t0, RETURN # if value < 16
    jal ra, CLZ # call clz
    li t0, 31
    sub t0, t0, a0 # msb,  a0 is lz(return value from CLZ)
    add t1, a0, x0 # lz

    li t2, 0 # exponent # Start from a good initial guess
    li t3, 0 # overflow
    li t4, 5
    blt t0, t4, Find_exact_exponent # go to Find_exact_exponent
    addi t2, t0, -4
    li t4, 15
    bge t4, t2, Cal_overflow # if 15 >= exponent
    li t2, 15 # exponent is 15
Cal_overflow:
    li t4, 0 # counter
For_1:
    slli t5, t3, 1
    addi t3, t5, 16 # overflow = (overflow << 1) + 16;
    addi t4, t4, 1
    blt t4, t2, For_1
while_1:
    blez t2, Find_exact_exponent
    bge  t6, t3, Find_exact_exponent
    addi t5, t3, -16 
    srli t3, t5, 1 # overflow = (overflow - 16) >> 1;
    addi t2, t2, -1
    j while_1
Find_exact_exponent:    
    li t5, 15
while_2: 
    bge t2, t5, PRE_RETURN
    slli t4, t3, 1
    addi t4, t4, 16 # next_overflow = (overflow << 1) + 16;
    blt t6, t4, PRE_RETURN
    add t3, t4, x0
    addi t2, t2, 1
    j while_2
PRE_RETURN:
    sub t1, t6, t3
    srl t1, t1, t2 # mantissa
    slli t0, t2, 4
    or a0, t0, t1 # prepare return value(a0)
RETURN:
    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra   # jump to ra