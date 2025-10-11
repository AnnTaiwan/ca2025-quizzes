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
BF16_INF:       .word 0x7F80      # positive inf representation

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
    .word 11     # number of words


msg_conv_start: .asciz "Testing basic conversions...\n"
msg_conv_done:  .asciz "  Basic conversions: PASS\n"
msg_conv_err_sign: .asciz "Sign mismatch"
msg_conv_err_too_large: .asciz "Relative error too large"

# --- Test case for test_arithmetic_add_sub ---
D2_add_sub:
# --- Test case 1 ---
    .word 0x3f800000   # a = 1.0
    .word 0x40000000   # b = 2.0
    .word 0x40400000   # ans_add = 3.0  (1.0 + 2.0)
    .word 0xBF800000   # ans_sub = -1.0 (1.0 - 2.0)

# --- Test case 2 ---
    .word 0xC0000000   # a = -2.0
    .word 0x3F000000   # b = 0.5
    .word 0xBFC00000   # ans_add = -1.5 (-2.0 + 0.5)
    .word 0xC0200000   # ans_sub = -2.5 (-2.0 - 0.5)

# --- Test case 3 ---
    .word 0xBF000000   # a = -0.5
    .word 0x40490fd0   # b = 3.14159
    .word 0x40290fd0   # ans_add ≈ 2.64159 (-0.5 + 3.14159 ≈ 2.6416)
    .word 0xc0690fd0   # ans_sub ≈ -3.64159 (-0.5 - 3.14159 ≈ -3.6416)


len_D2_add_sub:
    .word 12     # number of words


msg_add_sub_start: .asciz "Testing arithmetic operations (add & sub)...\n"
msg_add_sub_done:  .asciz "  Arithmetic (add & sub): PASS\n"
msg_add_err_too_large: .asciz "Addition failed"
msg_sub_err_too_large: .asciz "Subtraction failed"

# --- Test case for test_arithmetic_mul_div ---
D2_mul_div:
# --- Test case 1 ---
    .word 0x41200000   # a = 10.0
    .word 0x40000000   # b = 2.0
    .word 0x41a00000   # ans_mul = 20.0 (10.0 * 2.0)
    .word 0x40a00000   # ans_div = 5.0  (10.0 / 2.0)

# --- Test case 2 ---
    .word 0x40400000   # a = 3.0
    .word 0x3FC00000   # b = 1.5
    .word 0x40900000   # ans_mul = 4.5 (3.0 * 1.5)
    .word 0x40000000   # ans_div = 2.0  (3.0 / 1.5)

# --- Test case 3 ---
    .word 0x40400000   # a = 3.0
    .word 0x40800000   # b = 4.0
    .word 0x41400000   # ans_mul = 12.0 (3.0 * 4.0)
    .word 0x3f400000   # ans_div = 0.75  (3.0 / 4.0)

# --- Test case 4 ---
    .word 0x3F000000   # a = 0.5
    .word 0xBF000000   # b = -0.5
    .word 0xBE800000   # ans_mul = -0.25 (0.5 * -0.5)
    .word 0xBF800000   # ans_div = -1.0  (0.5 / -0.5)

# --- Test case 5 ---
    .word 0x40490FD0   # a = 3.14159
    .word 0x3FC90FD0   # b = 1.570795
    .word 0x409de9e2   # ans_mul ≈ 4.9348 (3.14159 * 1.570795)
    .word 0x40000000   # ans_div ≈ 2.0 (3.14159 / 1.570795)

len_D2_mul_div:
    .word 20     # number of words (5 cases × 4 words each)

msg_mul_div_start: .asciz "Testing arithmetic operations (mul & div)...\n"
msg_mul_div_done:  .asciz "  Arithmetic (mul & div): PASS\n"
msg_mul_err_too_large: .asciz "Multiplication failed"
msg_div_err_too_large: .asciz "Division failed"

# --- Test cases for test_comparisons ---
D2_comparisons:
# --- Test case 1: simple equality and inequality ---
    .word 0x3F800000   # a = 1.0
    .word 0x40000000   # b = 2.0
    .word 0x3F800000   # c = 1.0

# --- Test case 2: NaN comparisons ---
    .word 0x7FC00000   # nan_val1
    .word 0x7FC00000   # nan_val2
    .word 0x3F800000   # a = 1.0 (for NaN comparison)

len_D2_comparisons:
    .word 6    # number of words (3 test cases, 3 words each)

# --- Messages ---
msg_comparisons_start:      .asciz "Testing comparison operations...\n"
msg_comparisons_done:       .asciz "  Comparisons: PASS\n"
msg_eq_fail:                .asciz "Equality test failed"
msg_neq_fail:               .asciz "Inequality test failed"
msg_lt_fail:                .asciz "Less than test failed"
msg_notlt_fail:             .asciz "Not less than test failed"
msg_enotlt_fail:             .asciz "Equal not less than test failed"
msg_gt_fail:                .asciz "Greater than test failed"
msg_notgt_fail:             .asciz "Not greater than test failed"
msg_nan_eq_fail:            .asciz "NaN equality test failed"
msg_nan_lt_fail:            .asciz "NaN less than test failed"
msg_nan_gt_fail:            .asciz "NaN greater than test failed"


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
    jal ra, test_arithmetic
    or s0, s0, a0

    jal ra, test_comparisons
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
    mv s3, a0 # orig (uint32_t)
    jal ra, f32_to_bf16 # convert to bf16
    mv s4, a0 # bf (bf16)
    jal ra, bf16_to_f32 # convert to f32
    mv s5, a0 # conv (uint32_t)
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
# Function: test_arithmetic
# Purpose : Test bf16's add, sub, mul, div, and sqrt
# Arguments:
#   None
# Returns:
#   a0 - 0 if all tests pass, 1 if any fail
test_arithmetic:
    addi sp, sp, -4
    sw ra, 0(sp)
    la a0, D2_add_sub
    la a1, len_D2_add_sub
    lw a1, 0(a1)
    jal ra, test_arithmetic_add_sub

    la a0, D2_mul_div
    la a1, len_D2_mul_div
    lw a1, 0(a1)
    jal ra, test_arithmetic_mul_div

    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra
# Function: test_arithmetic_add_sub
# Purpose : Test bf16's add, sub
# Arguments:
#   a0 - base address of test data array (32-bit uint32_t)
#   a1 - number of test elements
# Returns:
#   a0 - 0 if all tests pass, 1 if any fail
test_arithmetic_add_sub:
    addi sp, sp, -40
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    sw s4, 20(sp)
    sw s5, 24(sp)
    sw s6, 28(sp)
    sw s7, 32(sp)
    sw s8, 36(sp)

    mv s0, a0 # base address of test array
    mv s1, a1 # number of elements
    # Print message: start of conversion test
    la a0, msg_add_sub_start 
    li a7, 4
    ecall
    # Compute end address
    slli t0, s1, 2        # s1 * 4 bytes
    add s2, s0, t0       # s2 = end address
loop_test_as:
    beq s0, s2, done_test_as # all elements tested?
    lw a0, 0(s0) # load test value (uint32_t)
    jal ra, f32_to_bf16 # convert to bf16
    mv s3, a0 # a (bf16)
    lw a0, 4(s0) # load test value (uint32_t)
    jal ra, f32_to_bf16 # convert to bf16
    mv s4, a0 # b (bf16)
    lw s5, 8(s0) # add answer (uint32_t)
    # add
    mv a0, s3
    mv a1, s4
    jal ra, bf16_add
    jal ra, bf16_to_f32
   
    mv s6, a0 # add result (uint32_t)

    # compare s5 s6
    xor t0, s5, s6
    li t1, 0x10001
    blt t0, t1, do_sub
    j print_rel_err_too_large_add
do_sub:
    # sub
    lw s7, 12(s0) # sub answer (uint32_t)
    mv a0, s3
    mv a1, s4
    jal ra, bf16_sub
    jal ra, bf16_to_f32
   
    mv s8, a0 # sub result (uint32_t)

    # compare s7 s8
    xor t0, s7, s8
    li t1, 0x10001
    blt t0, t1, rel_err_ok_as
    j print_rel_err_too_large_sub
rel_err_ok_as:
    addi s0, s0, 16
    j loop_test_as    
done_test_as:
    # Print message: add_sub test done
    la a0, msg_add_sub_done
    li a7, 4
    ecall
    li a0, 0 # return 0
    j end_test_as
print_rel_err_too_large_add:
    la a0, msg_add_err_too_large
    li a7, 4
    ecall
    li a0, 1 # return 1
    j end_test_as
print_rel_err_too_large_sub:
    la a0, msg_sub_err_too_large
    li a7, 4
    ecall
    li a0, 1 # return 1
    j end_test_as
end_test_as:
    lw s8, 36(sp)
    lw s7, 32(sp)
    lw s6, 28(sp)
    lw s5, 24(sp)
    lw s4, 20(sp)
    lw s3, 16(sp)
    lw s2, 12(sp)
    lw s1, 8(sp)
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 40
    jr ra

# Function: test_arithmetic_mul_div
# Purpose : Test bf16's mul, div
# Arguments:
#   a0 - base address of test data array (32-bit uint32_t)
#   a1 - number of test elements
# Returns:
#   a0 - 0 if all tests pass, 1 if any fail
test_arithmetic_mul_div:
    addi sp, sp, -40
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    sw s4, 20(sp)
    sw s5, 24(sp)
    sw s6, 28(sp)
    sw s7, 32(sp)
    sw s8, 36(sp)

    mv s0, a0 # base address of test array
    mv s1, a1 # number of elements
    # Print message: start of conversion test
    la a0, msg_mul_div_start 
    li a7, 4
    ecall
    # Compute end address
    slli t0, s1, 2        # s1 * 4 bytes
    add s2, s0, t0       # s2 = end address
loop_test_md:
    beq s0, s2, done_test_md # all elements tested?
    lw a0, 0(s0) # load test value (uint32_t)
    jal ra, f32_to_bf16 # convert to bf16
    mv s3, a0 # a (bf16)
    lw a0, 4(s0) # load test value (uint32_t)
    jal ra, f32_to_bf16 # convert to bf16
    mv s4, a0 # b (bf16)
    lw s5, 8(s0) # mul answer (uint32_t)
    # mul
    mv a0, s3
    mv a1, s4
    jal ra, bf16_mul
    jal ra, bf16_to_f32
   
    mv s6, a0 # mul result (uint32_t)

    # compare s5 s6
    xor t0, s5, s6
    li t1, 0xC0001 # 0.1 = 2^-4 + 2^-5 = 0xC << 16, plus 1 for branch
    blt t0, t1, do_div
    j print_rel_err_too_large_mul
do_div:
    # div
    lw s7, 12(s0) # div answer (uint32_t)
    mv a0, s3
    mv a1, s4
    jal ra, bf16_div
    jal ra, bf16_to_f32
   
    mv s8, a0 # div result (uint32_t)

    # compare s7 s8
    xor t0, s7, s8
    li t1, 0xC0001
    blt t0, t1, rel_err_ok_md
    j print_rel_err_too_large_div
rel_err_ok_md:
    addi s0, s0, 16
    j loop_test_md    
done_test_md:
    # Print message: mul_div test done
    la a0, msg_mul_div_done
    li a7, 4
    ecall
    li a0, 0 # return 0
    j end_test_md
print_rel_err_too_large_mul:
    la a0, msg_mul_err_too_large
    li a7, 4
    ecall
    li a0, 1 # return 1
    j end_test_md
print_rel_err_too_large_div:
    la a0, msg_div_err_too_large
    li a7, 4
    ecall
    li a0, 1 # return 1
    j end_test_md
end_test_md:
    lw s8, 36(sp)
    lw s7, 32(sp)
    lw s6, 28(sp)
    lw s5, 24(sp)
    lw s4, 20(sp)
    lw s3, 16(sp)
    lw s2, 12(sp)
    lw s1, 8(sp)
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 40
    jr ra

# Function: test_comparisons
# Purpose : Test bf16's eq, lt, and gt
# Arguments:
#   None
# Returns:
#   a0 - 0 if all tests pass, 1 if any fail
test_comparisons:
    addi sp, sp, -20
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)

    la s0, D2_comparisons # base address of test array
    lw s1, 0(s0) # a
    mv a0, s1
    jal ra, f32_to_bf16
    mv s1, a0
    lw s2, 4(s0) # b
    mv a0, s2
    jal ra, f32_to_bf16
    mv s2, a0
    lw s3, 8(s0) # c
    mv a0, s3
    jal ra, f32_to_bf16
    mv s3, a0
    # Print message: start of conversion test
    la a0, msg_comparisons_start 
    li a7, 4
    ecall

    mv a0, s1
    mv a1, s3
    jal ra, bf16_eq
    beqz a0, print_msg_eq_fail
    mv a0, s1
    mv a1, s2
    jal ra, bf16_eq
    bnez a0, print_msg_neq_fail
    mv a0, s1
    mv a1, s2
    jal ra, bf16_lt
    beqz a0, print_msg_lt_fail
    mv a0, s2
    mv a1, s1
    jal ra, bf16_lt
    bnez a0, print_msg_notlt_fail
    mv a0, s1
    mv a1, s3
    jal ra, bf16_lt
    bnez a0, print_msg_enotlt_fail

    mv a0, s2
    mv a1, s1
    jal ra, bf16_gt
    beqz a0, print_msg_gt_fail
    mv a0, s1
    mv a1, s2
    jal ra, bf16_gt
    bnez a0, print_msg_notgt_fail
    # Load NAN
    lw s2, 12(s0) # NAN_1
    mv a0, s2
    jal ra, f32_to_bf16
    mv s2, a0
    mv s3, s2 # NAN_2

    mv a0, s2
    mv a1, s3
    jal ra, bf16_eq
    bnez a0, print_msg_nan_eq_fail
    mv a0, s2
    mv a1, s1
    jal ra, bf16_lt
    bnez a0, print_msg_nan_lt_fail
    mv a0, s2
    mv a1, s1
    jal ra, bf16_gt
    bnez a0, print_msg_nan_gt_fail

    # success
    la a0, msg_comparisons_done
    li a7, 4
    ecall
    li a0, 0 # return 0
    j end_test_comparisons
print_msg_eq_fail:
    la a0, msg_eq_fail 
    j print_err_msg_cp
print_msg_neq_fail:
    la a0, msg_neq_fail 
    j print_err_msg_cp
print_msg_lt_fail:
    la a0, msg_lt_fail 
    j print_err_msg_cp
print_msg_notlt_fail:
    la a0, msg_notlt_fail 
    j print_err_msg_cp
print_msg_enotlt_fail:
    la a0, msg_enotlt_fail 
    j print_err_msg_cp
print_msg_gt_fail:
    la a0, msg_gt_fail 
    j print_err_msg_cp
print_msg_notgt_fail:
    la a0, msg_notgt_fail 
    j print_err_msg_cp
print_msg_nan_eq_fail:
    la a0, msg_nan_eq_fail 
    j print_err_msg_cp
print_msg_nan_lt_fail:
    la a0, msg_nan_lt_fail 
    j print_err_msg_cp
print_msg_nan_gt_fail:
    la a0, msg_nan_gt_fail 
    j print_err_msg_cp
print_err_msg_cp:
    li a7, 4
    ecall
    li a0, 1 # return 1
    j end_test_comparisons
end_test_comparisons:
    lw s3, 16(sp)
    lw s2, 12(sp)
    lw s1, 8(sp)
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 20
    jr ra
################################################
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

# Function: CLZ
# Purpose : Count the number of leading zeros in a 32-bit integer
# Arguments:
#   a0 - input value (uint32_t x)
# Returns:
#   a0 - number of leading zeros (uint32_t)
#
# Description:
#   This function calculates the number of leading zeros in a 32-bit register
#   by iteratively shifting and checking the upper bits.
#   It initializes n = 32 and uses c = 16 as an initial shift count.
#   The loop halves the shift value each iteration:
#     - If the shifted value is not zero, subtract c from n and continue.
#     - If the shifted value is zero, reduce c by half and retry.
#   The final result (number of leading zeros) is stored in a0.
#
# Registers used:
#   t0 - current count of leading zeros (n)
#   t1 - current shift amount (c)
#   t2 - temporary for shifted value (y)
CLZ:
    li t0, 32 #n
    li t1, 16 #c
do_while:
    srl t2, a0, t1 #t2 is y
    beq t2, x0, SHIFT_TOO_MUCH
    sub t0, t0, t1
    add a0, t2, x0
SHIFT_TOO_MUCH: 
    srli t1, t1, 1
    bne t1, x0, do_while
    sub a0, t0, a0
    jr ra   # jump to ra  
# Function: bf16_add
# Purpose : Perform a+b
# Arguments:
#   a0 - input value (bf16_t a)
#   a1 - input value (bf16_t b)
# Returns:
#   a0 - addition result (bf16_t)
bf16_add:
    srli a2, a0, 15
    andi a2, a2, 1 # sign_a
    srli a3, a1, 15
    andi a3, a3, 1 # sign_b

    srli a4, a0, 7
    andi a4, a4, 0xFF # exp_a
    srli a5, a1, 7
    andi a5, a5, 0xFF # exp_b

    andi a6, a0, 0x7F # mant_a
    andi a7, a1, 0x7F # mant_b

    li t0, 0xFF
    bne a4, t0, a_Normal # if (exp_a == 0xFF) {}
    bnez a6, ret_a
    bne a5, t0, ret_a
    bnez a7, ret_b
    beq a2, a3, ret_b
    la t0, BF16_NAN
    lw a0, 0(t0)
    jr ra
ret_a:
    mv a0, a0
    jr ra
ret_b:
    mv a0, a1
    jr ra
    # END: if (exp_a == 0xFF) {}
a_Normal:
    li t0, 0xFF
    beq a5, t0, ret_b
    bnez a4, a_isnt_0
    bnez a6, a_isnt_0
    j ret_b
a_isnt_0:
    bnez a5, b_isnt_0
    bnez a7, b_isnt_0
    j ret_a
b_isnt_0:
    beqz a4, see_exp_b
    ori a6, a6, 0x80
see_exp_b:
    beqz a5, add_start
    ori a7, a7, 0x80
add_start:
    sub t0, a4, a5 # exp_diff
    # t4: result_sign
    # t5: result_exp
    # t6: result_mant
    bgez t0, diff_pos_zero
diff_neg:
    mv t5, a5
    li t1, -8
    blt t0, t1, ret_b # if (exp_diff < -8)
    sub t1, x0, t0 # -exp_diff
    srl a6, a6, t1
    j add_start_2
diff_pos_zero:
    beqz t0, diff_zero
    mv t5, a4
    li t1, 9
    bge t0, t1, ret_a # if (exp_diff > 8)
    srl a7, a7, t0
    j add_start_2
diff_zero:
    mv t5, a4
add_start_2:
    bne a2, a3, sign_no_match
    mv t4, a2
    add t6, a6, a7
    andi t1, t6, 0x100
    beqz t1, end_bf16_add 
    srli t6, t6, 1
    addi t5, t5, 1
    li t1, 0xFF
    bge t5, t1, is_inf
    j end_bf16_add
is_inf:
    slli a0, t4, 15
    li t0, 0x7F80
    or a0, a0, t0
    jr ra
sign_no_match:
    bge a6, a7, mant_a_ge_mant_b
    mv t4, a3
    sub t6, a7, a6
    j check_add_result
mant_a_ge_mant_b:
    mv t4, a2
    sub t6, a6, a7
check_add_result:
    beqz t6, ret_0
    # Prepare to call CLZ
    addi sp, sp, -8
    sw ra, 0(sp)
    sw a0, 4(sp)
    mv a0, t6 # result_mant
    jal ra, CLZ
    li t0, 32
    sub t0, t0, a0
    li t1, 8
    sub t1, t1, t0 # number of shift in while
    sll t6, t6, t1
    sub t5, t5, t1
    bltz t5, ret_0
    beqz t5, ret_0
    lw a0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8
    j end_bf16_add
ret_0: # return zero
    la a0, BF16_ZERO
    lw a0, 0(a0)
    jr ra 
end_bf16_add:
    slli a0, t4, 15
    andi t5, t5, 0xFF
    slli t5, t5, 7
    or a0, a0, t5
    andi t6, t6, 0x7F
    or a0, a0, t6
    jr ra
# Function: bf16_sub
# Purpose : Perform a-b
# Arguments:
#   a0 - input value (bf16_t a)
#   a1 - input value (bf16_t b)
# Returns:
#   a0 - subtraction result (bf16_t)
bf16_sub:
    addi sp, sp, -4
    sw ra, 0(sp)
    la t0, BF16_SIGN_MASK
    lw t0, 0(t0)
    xor a1, a1, t0
    jal ra, bf16_add # result is in a0
    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra

# Function: bf16_mul
# Purpose : Perform a*b
# Arguments:
#   a0 - input value (bf16_t a)
#   a1 - input value (bf16_t b)
# Returns:
#   a0 - multiplication result (bf16_t)
bf16_mul:
    srli a2, a0, 15
    andi a2, a2, 1 # sign_a
    srli a3, a1, 15
    andi a3, a3, 1 # sign_b

    srli a4, a0, 7
    andi a4, a4, 0xFF # exp_a
    srli a5, a1, 7
    andi a5, a5, 0xFF # exp_b

    andi a6, a0, 0x7F # mant_a
    andi a7, a1, 0x7F # mant_b

    xor t6, a2, a3 # result_sign
# if (exp_a == 0xFF)
    li t0, 0xFF
    beq a4, t0, mul_a_inf_nan
    beq a5, t0, mul_b_inf_nan
# if ((!exp_a && !mant_a) || (!exp_b && !mant_b))
    li t1, 0x7FFF
    and t2, a0, t1 # a0 without sign bit
    beq t2, x0, mul_ret_0
    and t3, a1, t1 # a1 without sign bit
    beq t3, x0, mul_ret_0
    j mul_start # finish deal with special case
mul_ret_0:
    slli a0, t6, 15
    jr ra
# in if (exp_a == 0xFF)
mul_a_inf_nan:
    bnez a6, mul_ret_a
    bnez a5, mul_ret_inf 
    bnez a7, mul_ret_inf
    la a0, BF16_NAN
    lw a0, 0(a0) # retrun nan
    jr ra
# in if (exp_b == 0xFF)
mul_b_inf_nan:
    bnez a7, mul_ret_b
    bnez a4, mul_ret_inf 
    bnez a6, mul_ret_inf
    la a0, BF16_NAN
    lw a0, 0(a0) # retrun nan
    jr ra
mul_ret_a:
    jr ra
mul_ret_b:
    mv a0, a1
    jr ra
mul_ret_inf:
    la t0, BF16_INF
    lw t0, 0(t0)
    slli a0, t6, 15
    or a0, a0, t0 # sign << 15 | inf
    jr ra

mul_start:
    li t5, 0 # exp_adjust
# if (!exp_a)
    bnez a4, mul_mant_a_get_implicit_one
    # Prepare to call CLZ
    addi sp, sp, -8
    sw ra, 0(sp)
    sw a0, 4(sp)
    mv a0, a6 # mant_a
    jal ra, CLZ
    li t0, 32
    sub t0, t0, a0
    li t1, 8
    sub t1, t1, t0 # number of shift in while
    sll a6, a6, t1 # mant_a <<= t1
    sub t5, t5, t1 # exp_adjust -= t1
    lw a0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8
    li a4, 1
    j mul_start_2
mul_mant_a_get_implicit_one:
    ori a6, a6, 0x80

# if (!exp_b)
    bnez a5, mul_mant_b_get_implicit_one
    # Prepare to call CLZ
    addi sp, sp, -8
    sw ra, 0(sp)
    sw a0, 4(sp)
    mv a0, a7 # mant_b
    jal ra, CLZ
    li t0, 32
    sub t0, t0, a0
    li t1, 8
    sub t1, t1, t0 # number of shift in while
    sll a7, a7, t1 # mant_b <<= t1
    sub t5, t5, t1 # exp_adjust -= t1
    lw a0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8
    li a5, 1
    j mul_start_2
mul_mant_b_get_implicit_one:
    ori a7, a7, 0x80

mul_start_2:
    j mul_mantissa
# =====================================================
# Function: mul_mantissa
# Purpose : t4 = mant_a * mant_b  (without using MUL)
# Input   : a6 = mant_a, a7 = mant_b
# Output  : t4 = result_mant
# Clobbers: t0, t1, t2, t3
# =====================================================
mul_mantissa:
    li      t4, 0          # result_mant = 0
    mv      t0, a6         # t0 = mant_a
    mv      t1, a7         # t1 = mant_b
    li      t2, 0          # loop counter (optional, for readability)

mul_loop:
    andi    t3, t1, 1      # check LSB of mant_b
    beqz    t3, skip_add   # if LSB == 0, skip add
    add     t4, t4, t0     # result += mant_a
skip_add:
    slli    t0, t0, 1      # mant_a <<= 1
    srli    t1, t1, 1      # mant_b >>= 1
    addi    t2, t2, 1
    bnez    t1, mul_loop   # repeat until mant_b == 0
# =====================================================
    mv t3, a4 # result_exp
    add t3, t3, a5
    la t2, BF16_EXP_BIAS
    lw t2, 0(t2)
    sub t3, t3, t2
    add t3, t3, t5

    li t0, 0x8000
    and t0, t4, t0
    beqz t0, mul_mant_is_zero
    srli t4, t4, 8
    andi t4, t4, 0x7F
    addi t3, t3, 1
    j mul_check_exp
mul_mant_is_zero:
    srli t4, t4, 7
    andi t4, t4, 0x7F
mul_check_exp:
    li t0, 0xFF
    bge t3, t0, mul_ret_inf
    bgtz t3, mul_end 
    li t0, -6
    blt t3, t0, mul_ret_0
    li t0, 1
    sub t0, t0, t3
    srl t4, t4, t0
    li t3, 0
mul_end:
    slli a0, t6, 15
    andi t3, t3, 0xFF
    slli t3, t3, 7
    or a0, a0, t3
    andi t4, t4, 0x7F
    or a0, a0, t4
    jr ra

# Function: bf16_div
# Purpose : Perform a/b
# Arguments:
#   a0 - input value (bf16_t a)
#   a1 - input value (bf16_t b)
# Returns:
#   a0 - multiplication result (bf16_t)
bf16_div:
    srli a2, a0, 15
    andi a2, a2, 1 # sign_a
    srli a3, a1, 15
    andi a3, a3, 1 # sign_b

    srli a4, a0, 7
    andi a4, a4, 0xFF # exp_a
    srli a5, a1, 7
    andi a5, a5, 0xFF # exp_b

    andi a6, a0, 0x7F # mant_a
    andi a7, a1, 0x7F # mant_b

    xor t6, a2, a3 # result_sign
# if (exp_b == 0xFF) {
div_check_b:
    li t0, 0xFF
    beq a5, t0, div_b_inf_nan
    bnez a5, div_check_a
    bnez a7, div_check_a
    bnez a4, div_ret_inf
    bnez a6, div_ret_inf
    la a0, BF16_NAN
    lw a0, 0(a0) # return nan
    jr ra
div_b_inf_nan:
    bnez a7, div_ret_b
    bne a4, t0, div_ret_0
    bnez a6, div_ret_0
    la a0, BF16_NAN
    lw a0, 0(a0) # return nan
    jr ra

div_ret_b:
    mv a0, a1 # return b
    jr ra
div_ret_0:
    slli a0, t6, 15
    jr ra
div_ret_inf:
    slli t0, t6, 15
    la a0, BF16_INF
    lw a0, 0(a0) # return +/- inf
    or a0, a0, t0
    jr ra
# if (exp_a == 0xFF) {
div_check_a:
    li t0, 0xFF
    beq a4, t0, div_a_inf_nan
    bnez a4, div_mant_a_get_implicit_one
    bnez a6, div_mant_a_get_implicit_one
    j div_ret_0
div_a_inf_nan:
    bnez a6, div_ret_a
    j div_ret_inf
div_ret_a:
    jr ra
div_mant_a_get_implicit_one:
    beqz a4, div_mant_b_get_implicit_one
    ori a6, a6, 0x80
div_mant_b_get_implicit_one:
    beqz a5, div_start
    ori a7, a7, 0x80
div_start:
    slli t5, a6, 15 # dividend
    mv t4, a7 # divisor
    li t3, 0 # quotient
# =====================================================
# Function: bitwise_divide
# Purpose : Compute quotient of two 16-bit integers
# Input   : t5 = dividend (numerator)
#           t4 = divisor  (denominator)
# Output  : t3 = quotient
#           t5 = remainder (optional)
# Clobbers: t0, t1, t2
#
# Description:
#   This function performs bitwise division using a restoring
#   division method. It iteratively shifts the divisor and 
#   compares it with the dividend:
#     quotient <<= 1
#     if dividend >= (divisor << shift):
#         dividend -= (divisor << shift)
#         quotient |= 1
#   The loop runs 16 times to produce a 16-bit quotient.
# =====================================================
bitwise_divide:
    li      t3, 0            # quotient = 0
    li      t1, 0            # loop counter i = 0

div_loop:
    slli    t3, t3, 1        # quotient <<= 1

    li      t2, 15
    sub     t2, t2, t1       # shift = 15 - i
    sll     t0, t4, t2       # t0 = divisor << shift

    # if dividend >= shifted divisor
    bltu    t5, t0, div_skip_sub
    sub     t5, t5, t0       # dividend -= shifted divisor
    ori     t3, t3, 1        # quotient |= 1
div_skip_sub:
    addi    t1, t1, 1        # i++
    li      t2, 16
    blt     t1, t2, div_loop

    # Result: t3 = quotient, t5 = remainder
# =====================================================
    sub t2, a4, a5 # result_exp
    la t0, BF16_EXP_BIAS
    lw t0, 0(t0)
    add t2, t2, t0

    beqz a4, div_exp_minus1
    beqz a5, div_exp_plus1
    j div_start2
div_exp_minus1:
    addi t2, t2, -1
div_exp_plus1:
    addi t2, t2, 1

div_start2:
    li t0, 0x8000
    and t1, t3, t0
    beqz t1, div_normalize_loop
    srli t3, t3, 8
    j div_skip_normalize_loop
# =====================================================
# Normalize quotient to have MSB = 1
# while (!(quotient & 0x8000) && result_exp > 1)
#     quotient <<= 1
#     result_exp--
# Input/Output:
#   t3 = quotient
#   t2 = result_exp
# Clobbers: t0
# =====================================================
div_normalize_loop:
    li   t0, 0x8000        # mask for MSB of 16-bit
div_normalize_check:
    and  t1, t3, t0        # t1 = quotient & 0x8000
    bnez t1, div_normalize_done   # if MSB = 1, exit
    li   t1, 1
    ble  t2, t1, div_normalize_done  # if result_exp <= 1, exit
    slli t3, t3, 1         # quotient <<= 1
    addi t2, t2, -1        # result_exp--
    j    div_normalize_check
div_normalize_done:
    srli t3, t3, 8
# =====================================================
div_skip_normalize_loop:
    andi t3, t3, 0x7F

    li t0, 0xFF
    bge t2, t0, div_ret_inf
    blez t2, div_ret_0
div_end:
    slli a0, t6, 15
    andi t2, t2, 0xFF
    slli t2, t2, 7
    or a0, a0, t2
    andi t3, t3, 0x7F
    or a0, a0, t3
    jr ra

# =====================================================
# Function: bf16_eq
# Purpose : Check if two bf16 numbers are equal
# Arguments:
#   a0 - bf16 a
#   a1 - bf16 b
# Returns:
#   a0 - 1 if equal, 0 if not
# =====================================================
bf16_eq:
    addi sp, sp, -12
    sw   ra, 0(sp)
    sw   a0, 4(sp)
    sw   a1, 8(sp)

    # Check if a is NaN
    jal  ra, bf16_isnan
    bnez a0, bf16_eq_false
    lw   a0, 8(sp)  # reload b
    jal  ra, bf16_isnan
    bnez a0, bf16_eq_false

    # Check if both are zero
    lw   a0, 4(sp)
    jal  ra, bf16_iszero
    beqz a0, bf16_eq_check_bits
    lw   a0, 8(sp)
    jal  ra, bf16_iszero
    beqz a0, bf16_eq_check_bits
    li   a0, 1
    j    bf16_eq_end

bf16_eq_check_bits:
    lw   a0, 4(sp)
    lw   t0, 8(sp)
    beq  a0, t0, bf16_eq_true

bf16_eq_false:
    li   a0, 0
    j    bf16_eq_end

bf16_eq_true:
    li   a0, 1

bf16_eq_end:
    lw   ra, 0(sp)
    addi sp, sp, 12
    jr   ra


# =====================================================
# Function: bf16_lt
# Purpose : Check if a < b (bf16)
# Arguments:
#   a0 - bf16 a
#   a1 - bf16 b
# Returns:
#   a0 - 1 if a < b, 0 otherwise
# =====================================================
bf16_lt:
    addi sp, sp, -12
    sw   ra, 0(sp)
    sw   a0, 4(sp)
    sw   a1, 8(sp)

    # NaN check
    jal  ra, bf16_isnan
    bnez a0, bf16_lt_false
    lw   a0, 8(sp)
    jal  ra, bf16_isnan
    bnez a0, bf16_lt_false

    # both zero check
    lw   a0, 4(sp)
    jal  ra, bf16_iszero
    beqz a0, bf16_lt_check_signs
    lw   a0, 8(sp)
    jal  ra, bf16_iszero
    beqz a0, bf16_lt_check_signs
    li   a0, 0
    j    bf16_lt_end

bf16_lt_check_signs:
    lw   a0, 4(sp)
    srli t0, a0, 15
    andi t0, t0, 1  # sign_a
    lw   a1, 8(sp)
    srli t1, a1, 15
    andi t1, t1, 1  # sign_b

    bne  t0, t1, bf16_lt_diff_signs
    # same sign
    beqz t0, bf16_lt_pos_compare  # positive
    blt  a1, a0, bf16_lt_true     # negative
    j    bf16_lt_false

bf16_lt_diff_signs:
    beqz t0, bf16_lt_false
    li   a0, 1
    j    bf16_lt_end

bf16_lt_pos_compare:
    blt  a0, a1, bf16_lt_true
    j    bf16_lt_false

bf16_lt_true:
    li   a0, 1
    j    bf16_lt_end

bf16_lt_false:
    li   a0, 0

bf16_lt_end:
    lw   ra, 0(sp)
    addi sp, sp, 12
    jr   ra


# =====================================================
# Function: bf16_gt
# Purpose : Check if a > b (bf16)
# Arguments:
#   a0 - bf16 a
#   a1 - bf16 b
# Returns:
#   a0 - 1 if a > b, 0 otherwise
# =====================================================
bf16_gt:
    addi sp, sp, -8
    sw   ra, 0(sp)
    sw   a0, 4(sp)

    # swap a0, a1 and call bf16_lt
    mv   t0, a0
    mv   a0, a1
    mv   a1, t0
    jal  ra, bf16_lt

    lw   ra, 0(sp)
    addi sp, sp, 8
    jr   ra
