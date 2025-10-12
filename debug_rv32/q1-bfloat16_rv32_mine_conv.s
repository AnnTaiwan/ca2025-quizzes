.data
msg1:   .asciz "Testing basic conversions...\n"
newline:   .asciz "\n"
msg_fail: .asciz "\n=== TESTS FAILED ===\n"
msg_pass: .asciz "\n=== ALL TESTS PASSED ===\n"


BF16_SIGN_MASK:  .word 0x8000      # Sign bit mask
BF16_EXP_MASK:   .word 0x7F80      # Exponent mask
BF16_MANT_MASK:  .word 0x007F      # Mantissa mask
BF16_EXP_BIAS:   .word 127         # Exponent bias

BF16_NAN:        .word 0x7FC0      # NaN representation
BF16_ZERO:       .word 0x0000      # Zero representation

# --- Test case for test_basic_conversions ---
# --- Float test cases for f32 <-> bf16 conversion ---
# Values: 0.0, 1.0, -1.0, 2.0, -2.0, 0.5, -0.5, 3.14159, -3.14159, 1e10, -1e10

D1:
    .word 0x00000000   # 0.0
    .word 0x3F800000   # 1.0
    .word 0xBF800000   # -1.0
    .word 0x40000000   # 2.0
    .word 0xC0000000   # -2.0
    .word 0x3F000000   # 0.5
    .word 0xBF000000   # -0.5
    .word 0x40490FDB   # 3.14159
    .word 0xC0490FDB   # -3.14159
    .word 0x501502F9   # 1e10
    .word 0xD01502F9   # -1e10
len_D1:
    .word 11     # auto compute number of words


msg_conv_start: .asciz "Testing basic conversions...\n"
msg_conv_done:  .asciz "  Basic conversions: PASS\n"
msg_conv_err_sign: .asciz "Sign mismatch"
msg_conv_err_too_large: .asciz "Relative error too large"

.align 2
.text
.globl main
main:
    li s0, 0 # failed value
    la a0, D1 # base address of test array
    la t0, len_D1
    lw a1, 0(t0) # number of test elements
    jal ra, test_basic_conversions
    or s0, s0, a0


    beqz s0, print_pass
print_fail:
    la a0, msg_fail
    li a7, 4
    ecall
    li a7, 10         # ecall: exit
    li a0, 1 # exit code is 1, not successful
    ecall
print_pass:
    la a0, msg_pass
    li a7, 4
    ecall
    li a7, 10         # ecall: exit
    li a0, 0 # exit code is 0, successful
    ecall
# Function: test_basic_conversions
# Purpose : Test basic f32 <-> bf16 conversions
# Arguments:
#   a0 - base address of test data array (32-bit uint32_t)
#   a1 - number of test elements
# Returns:
#   a0 - 0 if all tests pass, 1 if any fail
test_basic_conversions:
    addi sp, sp, -28
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    sw s4, 20(sp)
    sw s5, 24(sp)

    mv s0, a0 # base address of test array
    mv s1, a1 # number of elements
    # Print message: start of conversion test
    la a0, msg_conv_start 
    li a7, 4
    ecall
    # Compute end address
    slli t0, s1, 2        # s1 * 4 bytes
    add s2, s0, t0       # s2 = end address

loop_test_conv:
    beq s0, s2, done_test_conv # all elements tested?
    
    lw a0, 0(s0) # load test value (uint32_t)
    ##
    li a7, 34
    ecall
    ##
    mv s3, a0 # orig (uint32_t)
    jal ra, f32_to_bf16 # convert to bf16
    mv s4, a0 # bf (bf16)
    ##
    li a7, 34
    ecall
    ##
    jal ra, bf16_to_f32 # convert to f32
    mv s5, a0 # conv (uint32_t)
    ##
    li a7, 34
    ecall
    ##
    # check sign bit
    srli t0, s3, 31 # sign bit
    srli t1, s5, 31 # sign bit
    xor t0, t0, t1 # sign match result => 0: match, 1: mismatch
    bnez t0, print_sign_mismatch
    
    # check approximate relative error by bit-difference
    xor t2, s3, s5     # t2 = bit difference
    # one bit difference = 0.78% relative error (in original c code, is 1%)
    # so, I choose acceptable difference is 0x10000, which means 2^-7 in mantissa(fp32)
    # due to only use blt, so set t3 as 0x10000 + 1
    li t3, 0x10001 
    blt t2, t3, rel_err_ok
    j print_rel_err_too_large
rel_err_ok:
    addi s0, s0, 4
    j loop_test_conv
done_test_conv:
    # Print message: conversion test done
    la a0, msg_conv_done
    li a7, 4
    ecall
    li a0, 0 # return 0
    j end_test_basic_conversions
print_sign_mismatch:
    la a0, msg_conv_err_sign
    li a7, 4
    ecall
    li a0, 1 # return 1
    j end_test_basic_conversions
print_rel_err_too_large:
    la a0, msg_conv_err_too_large
    li a7, 4
    ecall
    li a0, 1 # return 1
    j end_test_basic_conversions
end_test_basic_conversions:
    lw s5, 24(sp)
    lw s4, 20(sp)
    lw s3, 16(sp)
    lw s2, 12(sp)
    lw s1, 8(sp)
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 28
    jr ra
################################################
# Function: bf16_isnan
# Purpose : Determine if the input BF16 value is NaN.
# Arguments:
#   a0 - input value (bf16_t a)
# Returns:
#   a0 - 1 if NaN, 0 otherwise
bf16_isnan:
    la t0, BF16_EXP_MASK
    lw t0, 0(t0) 
    and t2, a0, t0 # exp
    la t1, BF16_MANT_MASK
    lw t1, 0(t1)
    and t3, a0, t1 # mant
    bne t2, t0, return_false
    beq t3, x0, return_false
    j return_true
# Function: bf16_isinf
# Purpose : Determine if the input BF16 value is inf.
# Arguments:
#   a0 - input value (bf16_t a)
# Returns:
#   a0 - 1 if inf, 0 otherwise
bf16_isinf:
    la t0, BF16_EXP_MASK
    lw t0, 0(t0) 
    and t2, a0, t0 # exp
    la t1, BF16_MANT_MASK
    lw t1, 0(t1)
    and t3, a0, t1 # mant
    bne t2, t0, return_false
    bne t3, x0, return_false
    j return_true
# Function: bf16_iszero
# Purpose : Determine if the input BF16 value is zero.
# Arguments:
#   a0 - input value (bf16_t a)
# Returns:
#   a0 - 1 if zero, 0 otherwise
bf16_iszero:
    li t1, 0x7FFF
    and t0, a0, t1
    beqz t0, return_true
    j return_false
# set return value as 0
return_false:
    li a0, 0
    jr ra   # jump to ra
# set return value as 1
return_true:
    li a0, 1
    jr ra   # jump to ra

# Function: f32_to_bf16
# Purpose : Transform float32 into bfloat16
# Arguments:
#   a0 - input value (uint32_t val)
# Returns:
#   a0 - transformed result (bf16_t)
f32_to_bf16:
    mv t0, a0 # val (fp32)
    li t1, 0x7F800000 # try to see if the exp part is all one
    and t2, t0, t1 # exp << 23
    beq t2, t1, return_bf16 # return due to inf or NaN
    li t1, 0x7FFF
    srli t3, t0, 16
    andi t3, t3, 1
    add t3, t3, t1
    add t0, t0, t3
return_bf16:
    srli a0, t0, 16 # bf16 return value is in a0
    jr ra   # jump to ra
    
# Function: bf16_to_f32
# Purpose : Transform bfloat16 into float32
# Arguments:
#   a0 - input value (bf16_t val)
# Returns:
#   a0 - transformed result (uint32_t)
bf16_to_f32:
    slli a0, a0, 16 # fp32bits
    jr ra   # jump to ra
    
