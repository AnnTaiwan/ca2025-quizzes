	.file	"q1-bfloat16_fix.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	bf16_isnan, @function
bf16_isnan:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sh	a0,-20(s0)
	lhu	a5,-20(s0)
	mv	a4,a5
	li	a5,32768
	addi	a5,a5,-128
	and	a4,a4,a5
	li	a5,32768
	addi	a5,a5,-128
	bne	a4,a5,.L2
	lhu	a5,-20(s0)
	andi	a5,a5,127
	beq	a5,zero,.L2
	li	a5,1
	j	.L3
.L2:
	li	a5,0
.L3:
	andi	a5,a5,1
	andi	a5,a5,0xff
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	bf16_isnan, .-bf16_isnan
	.align	2
	.type	bf16_isinf, @function
bf16_isinf:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sh	a0,-20(s0)
	lhu	a5,-20(s0)
	mv	a4,a5
	li	a5,32768
	addi	a5,a5,-128
	and	a4,a4,a5
	li	a5,32768
	addi	a5,a5,-128
	bne	a4,a5,.L6
	lhu	a5,-20(s0)
	andi	a5,a5,127
	bne	a5,zero,.L6
	li	a5,1
	j	.L7
.L6:
	li	a5,0
.L7:
	andi	a5,a5,1
	andi	a5,a5,0xff
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	bf16_isinf, .-bf16_isinf
	.align	2
	.type	bf16_iszero, @function
bf16_iszero:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sh	a0,-20(s0)
	lhu	a5,-20(s0)
	mv	a4,a5
	li	a5,32768
	addi	a5,a5,-1
	and	a5,a4,a5
	seqz	a5,a5
	andi	a5,a5,0xff
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	bf16_iszero, .-bf16_iszero
	.align	2
	.type	f32_to_bf16, @function
f32_to_bf16:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	addi	a4,s0,-36
	addi	a5,s0,-20
	li	a2,4
	mv	a1,a4
	mv	a0,a5
	call	memcpy
	lw	a5,-20(s0)
	srli	a5,a5,23
	andi	a4,a5,255
	li	a5,255
	bne	a4,a5,.L12
	lw	a5,-20(s0)
	srli	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L14
.L12:
	lw	a5,-20(s0)
	srli	a5,a5,16
	andi	a4,a5,1
	lw	a5,-20(s0)
	add	a4,a4,a5
	li	a5,32768
	addi	a5,a5,-1
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
.L14:
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	f32_to_bf16, .-f32_to_bf16
	.align	2
	.type	bf16_to_f32, @function
bf16_to_f32:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sh	a0,-36(s0)
	lhu	a5,-36(s0)
	slli	a5,a5,16
	sw	a5,-20(s0)
	addi	a4,s0,-20
	addi	a5,s0,-24
	li	a2,4
	mv	a1,a4
	mv	a0,a5
	call	memcpy
	lw	a5,-24(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	bf16_to_f32, .-bf16_to_f32
	.align	2
	.type	bf16_add, @function
bf16_add:
	addi	sp,sp,-64
	sw	s0,60(sp)
	addi	s0,sp,64
	sh	a0,-52(s0)
	sh	a1,-56(s0)
	lhu	a5,-52(s0)
	srli	a5,a5,15
	sh	a5,-30(s0)
	lhu	a5,-56(s0)
	srli	a5,a5,15
	sh	a5,-32(s0)
	lhu	a5,-52(s0)
	srli	a5,a5,7
	slli	a5,a5,16
	srli	a5,a5,16
	slli	a5,a5,16
	srai	a5,a5,16
	andi	a5,a5,255
	sh	a5,-34(s0)
	lhu	a5,-56(s0)
	srli	a5,a5,7
	slli	a5,a5,16
	srli	a5,a5,16
	slli	a5,a5,16
	srai	a5,a5,16
	andi	a5,a5,255
	sh	a5,-36(s0)
	lhu	a5,-52(s0)
	andi	a5,a5,127
	sh	a5,-18(s0)
	lhu	a5,-56(s0)
	andi	a5,a5,127
	sh	a5,-20(s0)
	lh	a4,-34(s0)
	li	a5,255
	bne	a4,a5,.L18
	lhu	a5,-18(s0)
	beq	a5,zero,.L19
	lhu	a5,-52(s0)
	j	.L41
.L19:
	lh	a4,-36(s0)
	li	a5,255
	bne	a4,a5,.L21
	lhu	a5,-20(s0)
	bne	a5,zero,.L22
	lhu	a4,-30(s0)
	lhu	a5,-32(s0)
	beq	a4,a5,.L22
	li	a5,-32768
	xori	a5,a5,-64
	j	.L41
.L22:
	lhu	a5,-56(s0)
	j	.L41
.L21:
	lhu	a5,-52(s0)
	j	.L41
.L18:
	lh	a4,-36(s0)
	li	a5,255
	bne	a4,a5,.L24
	lhu	a5,-56(s0)
	j	.L41
.L24:
	lh	a5,-34(s0)
	bne	a5,zero,.L25
	lhu	a5,-18(s0)
	bne	a5,zero,.L25
	lhu	a5,-56(s0)
	j	.L41
.L25:
	lh	a5,-36(s0)
	bne	a5,zero,.L26
	lhu	a5,-20(s0)
	bne	a5,zero,.L26
	lhu	a5,-52(s0)
	j	.L41
.L26:
	lh	a5,-34(s0)
	beq	a5,zero,.L27
	lhu	a5,-18(s0)
	ori	a5,a5,128
	sh	a5,-18(s0)
.L27:
	lh	a5,-36(s0)
	beq	a5,zero,.L28
	lhu	a5,-20(s0)
	ori	a5,a5,128
	sh	a5,-20(s0)
.L28:
	lhu	a4,-34(s0)
	lhu	a5,-36(s0)
	sub	a5,a4,a5
	slli	a5,a5,16
	srli	a5,a5,16
	sh	a5,-38(s0)
	lh	a5,-38(s0)
	ble	a5,zero,.L29
	lhu	a5,-34(s0)
	sh	a5,-24(s0)
	lh	a4,-38(s0)
	li	a5,8
	ble	a4,a5,.L30
	lhu	a5,-52(s0)
	j	.L41
.L30:
	lhu	a4,-20(s0)
	lh	a5,-38(s0)
	sra	a5,a4,a5
	sh	a5,-20(s0)
	j	.L31
.L29:
	lh	a5,-38(s0)
	bge	a5,zero,.L32
	lhu	a5,-36(s0)
	sh	a5,-24(s0)
	lh	a4,-38(s0)
	li	a5,-8
	bge	a4,a5,.L33
	lhu	a5,-56(s0)
	j	.L41
.L33:
	lhu	a4,-18(s0)
	lh	a5,-38(s0)
	neg	a5,a5
	sra	a5,a4,a5
	sh	a5,-18(s0)
	j	.L31
.L32:
	lhu	a5,-34(s0)
	sh	a5,-24(s0)
.L31:
	lhu	a4,-30(s0)
	lhu	a5,-32(s0)
	bne	a4,a5,.L34
	lhu	a5,-30(s0)
	sh	a5,-22(s0)
	lhu	a4,-18(s0)
	lhu	a5,-20(s0)
	add	a5,a4,a5
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	andi	a5,a5,256
	beq	a5,zero,.L35
	lw	a5,-28(s0)
	srli	a5,a5,1
	sw	a5,-28(s0)
	lhu	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,16
	srli	a5,a5,16
	sh	a5,-24(s0)
	lh	a4,-24(s0)
	li	a5,254
	ble	a4,a5,.L35
	lh	a5,-22(s0)
	slli	a5,a5,15
	slli	a4,a5,16
	srai	a4,a4,16
	li	a5,32768
	addi	a5,a5,-128
	or	a5,a4,a5
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L41
.L34:
	lhu	a4,-18(s0)
	lhu	a5,-20(s0)
	bltu	a4,a5,.L36
	lhu	a5,-30(s0)
	sh	a5,-22(s0)
	lhu	a4,-18(s0)
	lhu	a5,-20(s0)
	sub	a5,a4,a5
	sw	a5,-28(s0)
	j	.L37
.L36:
	lhu	a5,-32(s0)
	sh	a5,-22(s0)
	lhu	a4,-20(s0)
	lhu	a5,-18(s0)
	sub	a5,a4,a5
	sw	a5,-28(s0)
.L37:
	lw	a5,-28(s0)
	bne	a5,zero,.L39
	li	a5,0
	j	.L41
.L40:
	lw	a5,-28(s0)
	slli	a5,a5,1
	sw	a5,-28(s0)
	lhu	a5,-24(s0)
	addi	a5,a5,-1
	slli	a5,a5,16
	srli	a5,a5,16
	sh	a5,-24(s0)
	lh	a5,-24(s0)
	bgt	a5,zero,.L39
	li	a5,0
	j	.L41
.L39:
	lw	a5,-28(s0)
	andi	a5,a5,128
	beq	a5,zero,.L40
.L35:
	lh	a5,-22(s0)
	slli	a5,a5,15
	slli	a4,a5,16
	srai	a4,a4,16
	lhu	a5,-24(s0)
	slli	a5,a5,7
	slli	a3,a5,16
	srai	a3,a3,16
	li	a5,32768
	addi	a5,a5,-128
	and	a5,a3,a5
	slli	a5,a5,16
	srai	a5,a5,16
	or	a5,a4,a5
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a4,a5,16
	srli	a4,a4,16
	lw	a5,-28(s0)
	slli	a5,a5,16
	srli	a5,a5,16
	andi	a5,a5,127
	slli	a5,a5,16
	srli	a5,a5,16
	or	a5,a4,a5
	slli	a5,a5,16
	srli	a5,a5,16
.L41:
	mv	a0,a5
	lw	s0,60(sp)
	addi	sp,sp,64
	jr	ra
	.size	bf16_add, .-bf16_add
	.align	2
	.type	bf16_sub, @function
bf16_sub:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sh	a0,-20(s0)
	sh	a1,-24(s0)
	lhu	a4,-24(s0)
	li	a5,-32768
	xor	a5,a4,a5
	slli	a5,a5,16
	srli	a5,a5,16
	sh	a5,-24(s0)
	lhu	a5,-24(s0)
	mv	a1,a5
	lhu	a5,-20(s0)
	mv	a0,a5
	call	bf16_add
	mv	a5,a0
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	bf16_sub, .-bf16_sub
	.globl	__mulsi3
	.align	2
	.type	bf16_mul, @function
bf16_mul:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sh	a0,-52(s0)
	sh	a1,-56(s0)
	lhu	a5,-52(s0)
	srli	a5,a5,15
	sh	a5,-38(s0)
	lhu	a5,-56(s0)
	srli	a5,a5,15
	sh	a5,-40(s0)
	lhu	a5,-52(s0)
	srli	a5,a5,7
	slli	a5,a5,16
	srli	a5,a5,16
	slli	a5,a5,16
	srai	a5,a5,16
	andi	a5,a5,255
	sh	a5,-18(s0)
	lhu	a5,-56(s0)
	srli	a5,a5,7
	slli	a5,a5,16
	srli	a5,a5,16
	slli	a5,a5,16
	srai	a5,a5,16
	andi	a5,a5,255
	sh	a5,-20(s0)
	lhu	a5,-52(s0)
	andi	a5,a5,127
	sh	a5,-22(s0)
	lhu	a5,-56(s0)
	andi	a5,a5,127
	sh	a5,-24(s0)
	lhu	a5,-38(s0)
	mv	a4,a5
	lhu	a5,-40(s0)
	xor	a5,a4,a5
	sh	a5,-42(s0)
	lh	a4,-18(s0)
	li	a5,255
	bne	a4,a5,.L45
	lhu	a5,-22(s0)
	beq	a5,zero,.L46
	lhu	a5,-52(s0)
	j	.L70
.L46:
	lh	a5,-20(s0)
	bne	a5,zero,.L48
	lhu	a5,-24(s0)
	bne	a5,zero,.L48
	li	a5,-32768
	xori	a5,a5,-64
	j	.L70
.L48:
	lh	a5,-42(s0)
	slli	a5,a5,15
	slli	a4,a5,16
	srai	a4,a4,16
	li	a5,32768
	addi	a5,a5,-128
	or	a5,a4,a5
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L70
.L45:
	lh	a4,-20(s0)
	li	a5,255
	bne	a4,a5,.L50
	lhu	a5,-24(s0)
	beq	a5,zero,.L51
	lhu	a5,-56(s0)
	j	.L70
.L51:
	lh	a5,-18(s0)
	bne	a5,zero,.L53
	lhu	a5,-22(s0)
	bne	a5,zero,.L53
	li	a5,-32768
	xori	a5,a5,-64
	j	.L70
.L53:
	lh	a5,-42(s0)
	slli	a5,a5,15
	slli	a4,a5,16
	srai	a4,a4,16
	li	a5,32768
	addi	a5,a5,-128
	or	a5,a4,a5
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L70
.L50:
	lh	a5,-18(s0)
	bne	a5,zero,.L54
	lhu	a5,-22(s0)
	beq	a5,zero,.L55
.L54:
	lh	a5,-20(s0)
	bne	a5,zero,.L56
	lhu	a5,-24(s0)
	bne	a5,zero,.L56
.L55:
	lhu	a5,-42(s0)
	slli	a5,a5,15
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L70
.L56:
	sh	zero,-26(s0)
	lh	a5,-18(s0)
	bne	a5,zero,.L57
	j	.L58
.L59:
	lhu	a5,-22(s0)
	slli	a5,a5,1
	sh	a5,-22(s0)
	lh	a5,-26(s0)
	slli	a5,a5,16
	srli	a5,a5,16
	addi	a5,a5,-1
	slli	a5,a5,16
	srli	a5,a5,16
	sh	a5,-26(s0)
.L58:
	lhu	a5,-22(s0)
	andi	a5,a5,128
	beq	a5,zero,.L59
	li	a5,1
	sh	a5,-18(s0)
	j	.L60
.L57:
	lhu	a5,-22(s0)
	ori	a5,a5,128
	sh	a5,-22(s0)
.L60:
	lh	a5,-20(s0)
	bne	a5,zero,.L61
	j	.L62
.L63:
	lhu	a5,-24(s0)
	slli	a5,a5,1
	sh	a5,-24(s0)
	lh	a5,-26(s0)
	slli	a5,a5,16
	srli	a5,a5,16
	addi	a5,a5,-1
	slli	a5,a5,16
	srli	a5,a5,16
	sh	a5,-26(s0)
.L62:
	lhu	a5,-24(s0)
	andi	a5,a5,128
	beq	a5,zero,.L63
	li	a5,1
	sh	a5,-20(s0)
	j	.L64
.L61:
	lhu	a5,-24(s0)
	ori	a5,a5,128
	sh	a5,-24(s0)
.L64:
	lhu	a5,-22(s0)
	lhu	a4,-24(s0)
	mv	a1,a4
	mv	a0,a5
	call	__mulsi3
	mv	a5,a0
	sw	a5,-32(s0)
	lh	a4,-18(s0)
	lh	a5,-20(s0)
	add	a5,a4,a5
	addi	a4,a5,-127
	lh	a5,-26(s0)
	add	a5,a4,a5
	sw	a5,-36(s0)
	lw	a4,-32(s0)
	li	a5,32768
	and	a5,a4,a5
	beq	a5,zero,.L65
	lw	a5,-32(s0)
	srli	a5,a5,8
	andi	a5,a5,127
	sw	a5,-32(s0)
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
	j	.L66
.L65:
	lw	a5,-32(s0)
	srli	a5,a5,7
	andi	a5,a5,127
	sw	a5,-32(s0)
.L66:
	lw	a4,-36(s0)
	li	a5,254
	ble	a4,a5,.L67
	lh	a5,-42(s0)
	slli	a5,a5,15
	slli	a4,a5,16
	srai	a4,a4,16
	li	a5,32768
	addi	a5,a5,-128
	or	a5,a4,a5
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L70
.L67:
	lw	a5,-36(s0)
	bgt	a5,zero,.L68
	lw	a4,-36(s0)
	li	a5,-6
	bge	a4,a5,.L69
	lhu	a5,-42(s0)
	slli	a5,a5,15
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L70
.L69:
	li	a4,1
	lw	a5,-36(s0)
	sub	a5,a4,a5
	lw	a4,-32(s0)
	srl	a5,a4,a5
	sw	a5,-32(s0)
	sw	zero,-36(s0)
.L68:
	lh	a5,-42(s0)
	slli	a5,a5,15
	slli	a4,a5,16
	srai	a4,a4,16
	lw	a5,-36(s0)
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a5,a5,7
	slli	a3,a5,16
	srai	a3,a3,16
	li	a5,32768
	addi	a5,a5,-128
	and	a5,a3,a5
	slli	a5,a5,16
	srai	a5,a5,16
	or	a5,a4,a5
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a4,a5,16
	srli	a4,a4,16
	lw	a5,-32(s0)
	slli	a5,a5,16
	srli	a5,a5,16
	andi	a5,a5,127
	slli	a5,a5,16
	srli	a5,a5,16
	or	a5,a4,a5
	slli	a5,a5,16
	srli	a5,a5,16
.L70:
	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	bf16_mul, .-bf16_mul
	.align	2
	.type	bf16_div, @function
bf16_div:
	addi	sp,sp,-80
	sw	s0,76(sp)
	addi	s0,sp,80
	sh	a0,-68(s0)
	sh	a1,-72(s0)
	lhu	a5,-68(s0)
	srli	a5,a5,15
	sh	a5,-38(s0)
	lhu	a5,-72(s0)
	srli	a5,a5,15
	sh	a5,-40(s0)
	lhu	a5,-68(s0)
	srli	a5,a5,7
	slli	a5,a5,16
	srli	a5,a5,16
	slli	a5,a5,16
	srai	a5,a5,16
	andi	a5,a5,255
	sh	a5,-42(s0)
	lhu	a5,-72(s0)
	srli	a5,a5,7
	slli	a5,a5,16
	srli	a5,a5,16
	slli	a5,a5,16
	srai	a5,a5,16
	andi	a5,a5,255
	sh	a5,-44(s0)
	lhu	a5,-68(s0)
	andi	a5,a5,127
	sh	a5,-18(s0)
	lhu	a5,-72(s0)
	andi	a5,a5,127
	sh	a5,-20(s0)
	lhu	a5,-38(s0)
	mv	a4,a5
	lhu	a5,-40(s0)
	xor	a5,a4,a5
	sh	a5,-46(s0)
	lh	a4,-44(s0)
	li	a5,255
	bne	a4,a5,.L72
	lhu	a5,-20(s0)
	beq	a5,zero,.L73
	lhu	a5,-72(s0)
	j	.L98
.L73:
	lh	a4,-42(s0)
	li	a5,255
	bne	a4,a5,.L75
	lhu	a5,-18(s0)
	bne	a5,zero,.L75
	li	a5,-32768
	xori	a5,a5,-64
	j	.L98
.L75:
	lhu	a5,-46(s0)
	slli	a5,a5,15
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L98
.L72:
	lh	a5,-44(s0)
	bne	a5,zero,.L77
	lhu	a5,-20(s0)
	bne	a5,zero,.L77
	lh	a5,-42(s0)
	bne	a5,zero,.L78
	lhu	a5,-18(s0)
	bne	a5,zero,.L78
	li	a5,-32768
	xori	a5,a5,-64
	j	.L98
.L78:
	lh	a5,-46(s0)
	slli	a5,a5,15
	slli	a4,a5,16
	srai	a4,a4,16
	li	a5,32768
	addi	a5,a5,-128
	or	a5,a4,a5
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L98
.L77:
	lh	a4,-42(s0)
	li	a5,255
	bne	a4,a5,.L80
	lhu	a5,-18(s0)
	beq	a5,zero,.L81
	lhu	a5,-68(s0)
	j	.L98
.L81:
	lh	a5,-46(s0)
	slli	a5,a5,15
	slli	a4,a5,16
	srai	a4,a4,16
	li	a5,32768
	addi	a5,a5,-128
	or	a5,a4,a5
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L98
.L80:
	lh	a5,-42(s0)
	bne	a5,zero,.L83
	lhu	a5,-18(s0)
	bne	a5,zero,.L83
	lhu	a5,-46(s0)
	slli	a5,a5,15
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L98
.L83:
	lh	a5,-42(s0)
	beq	a5,zero,.L84
	lhu	a5,-18(s0)
	ori	a5,a5,128
	sh	a5,-18(s0)
.L84:
	lh	a5,-44(s0)
	beq	a5,zero,.L85
	lhu	a5,-20(s0)
	ori	a5,a5,128
	sh	a5,-20(s0)
.L85:
	lhu	a5,-18(s0)
	slli	a5,a5,15
	sw	a5,-24(s0)
	lhu	a5,-20(s0)
	sw	a5,-52(s0)
	sw	zero,-28(s0)
	sw	zero,-32(s0)
	j	.L86
.L88:
	lw	a5,-28(s0)
	slli	a5,a5,1
	sw	a5,-28(s0)
	li	a4,15
	lw	a5,-32(s0)
	sub	a5,a4,a5
	lw	a4,-52(s0)
	sll	a5,a4,a5
	lw	a4,-24(s0)
	bltu	a4,a5,.L87
	li	a4,15
	lw	a5,-32(s0)
	sub	a5,a4,a5
	lw	a4,-52(s0)
	sll	a5,a4,a5
	lw	a4,-24(s0)
	sub	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	ori	a5,a5,1
	sw	a5,-28(s0)
.L87:
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
.L86:
	lw	a4,-32(s0)
	li	a5,15
	ble	a4,a5,.L88
	lh	a4,-42(s0)
	lh	a5,-44(s0)
	sub	a5,a4,a5
	addi	a5,a5,127
	sw	a5,-36(s0)
	lh	a5,-42(s0)
	bne	a5,zero,.L89
	lw	a5,-36(s0)
	addi	a5,a5,-1
	sw	a5,-36(s0)
.L89:
	lh	a5,-44(s0)
	bne	a5,zero,.L90
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
.L90:
	lw	a4,-28(s0)
	li	a5,32768
	and	a5,a4,a5
	beq	a5,zero,.L93
	lw	a5,-28(s0)
	srli	a5,a5,8
	sw	a5,-28(s0)
	j	.L92
.L95:
	lw	a5,-28(s0)
	slli	a5,a5,1
	sw	a5,-28(s0)
	lw	a5,-36(s0)
	addi	a5,a5,-1
	sw	a5,-36(s0)
.L93:
	lw	a4,-28(s0)
	li	a5,32768
	and	a5,a4,a5
	bne	a5,zero,.L94
	lw	a4,-36(s0)
	li	a5,1
	bgt	a4,a5,.L95
.L94:
	lw	a5,-28(s0)
	srli	a5,a5,8
	sw	a5,-28(s0)
.L92:
	lw	a5,-28(s0)
	andi	a5,a5,127
	sw	a5,-28(s0)
	lw	a4,-36(s0)
	li	a5,254
	ble	a4,a5,.L96
	lh	a5,-46(s0)
	slli	a5,a5,15
	slli	a4,a5,16
	srai	a4,a4,16
	li	a5,32768
	addi	a5,a5,-128
	or	a5,a4,a5
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L98
.L96:
	lw	a5,-36(s0)
	bgt	a5,zero,.L97
	lhu	a5,-46(s0)
	slli	a5,a5,15
	slli	a5,a5,16
	srli	a5,a5,16
	j	.L98
.L97:
	lh	a5,-46(s0)
	slli	a5,a5,15
	slli	a4,a5,16
	srai	a4,a4,16
	lw	a5,-36(s0)
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a5,a5,7
	slli	a3,a5,16
	srai	a3,a3,16
	li	a5,32768
	addi	a5,a5,-128
	and	a5,a3,a5
	slli	a5,a5,16
	srai	a5,a5,16
	or	a5,a4,a5
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a4,a5,16
	srli	a4,a4,16
	lw	a5,-28(s0)
	slli	a5,a5,16
	srli	a5,a5,16
	andi	a5,a5,127
	slli	a5,a5,16
	srli	a5,a5,16
	or	a5,a4,a5
	slli	a5,a5,16
	srli	a5,a5,16
.L98:
	mv	a0,a5
	lw	s0,76(sp)
	addi	sp,sp,80
	jr	ra
	.size	bf16_div, .-bf16_div
	.align	2
	.type	bf16_sqrt, @function
bf16_sqrt:
	addi	sp,sp,-80
	sw	ra,76(sp)
	sw	s0,72(sp)
	addi	s0,sp,80
	sh	a0,-68(s0)
	lhu	a5,-68(s0)
	srli	a5,a5,15
	sh	a5,-38(s0)
	lhu	a5,-68(s0)
	srli	a5,a5,7
	slli	a5,a5,16
	srli	a5,a5,16
	slli	a5,a5,16
	srai	a5,a5,16
	andi	a5,a5,255
	sh	a5,-40(s0)
	lhu	a5,-68(s0)
	andi	a5,a5,127
	sh	a5,-42(s0)
	lh	a4,-40(s0)
	li	a5,255
	bne	a4,a5,.L100
	lhu	a5,-42(s0)
	beq	a5,zero,.L101
	lhu	a5,-68(s0)
	j	.L118
.L101:
	lhu	a5,-38(s0)
	beq	a5,zero,.L103
	li	a5,-32768
	xori	a5,a5,-64
	j	.L118
.L103:
	lhu	a5,-68(s0)
	j	.L118
.L100:
	lh	a5,-40(s0)
	bne	a5,zero,.L104
	lhu	a5,-42(s0)
	bne	a5,zero,.L104
	li	a5,0
	j	.L118
.L104:
	lhu	a5,-38(s0)
	beq	a5,zero,.L105
	li	a5,-32768
	xori	a5,a5,-64
	j	.L118
.L105:
	lh	a5,-40(s0)
	bne	a5,zero,.L106
	li	a5,0
	j	.L118
.L106:
	lh	a5,-40(s0)
	addi	a5,a5,-127
	sw	a5,-48(s0)
	lhu	a5,-42(s0)
	ori	a5,a5,128
	slli	a5,a5,16
	srli	a5,a5,16
	sw	a5,-24(s0)
	lw	a5,-48(s0)
	andi	a5,a5,1
	beq	a5,zero,.L107
	lw	a5,-24(s0)
	slli	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-48(s0)
	addi	a5,a5,-1
	srai	a5,a5,1
	addi	a5,a5,127
	sw	a5,-20(s0)
	j	.L108
.L107:
	lw	a5,-48(s0)
	srai	a5,a5,1
	addi	a5,a5,127
	sw	a5,-20(s0)
.L108:
	li	a5,90
	sw	a5,-28(s0)
	li	a5,256
	sw	a5,-32(s0)
	li	a5,128
	sw	a5,-36(s0)
	j	.L109
.L111:
	lw	a4,-28(s0)
	lw	a5,-32(s0)
	add	a5,a4,a5
	srli	a5,a5,1
	sw	a5,-56(s0)
	lw	a1,-56(s0)
	lw	a0,-56(s0)
	call	__mulsi3
	mv	a5,a0
	srli	a5,a5,7
	sw	a5,-60(s0)
	lw	a4,-60(s0)
	lw	a5,-24(s0)
	bgtu	a4,a5,.L110
	lw	a5,-56(s0)
	sw	a5,-36(s0)
	lw	a5,-56(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
	j	.L109
.L110:
	lw	a5,-56(s0)
	addi	a5,a5,-1
	sw	a5,-32(s0)
.L109:
	lw	a4,-28(s0)
	lw	a5,-32(s0)
	bleu	a4,a5,.L111
	lw	a4,-36(s0)
	li	a5,255
	bleu	a4,a5,.L112
	lw	a5,-36(s0)
	srli	a5,a5,1
	sw	a5,-36(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	.L113
.L112:
	lw	a4,-36(s0)
	li	a5,127
	bgtu	a4,a5,.L113
	j	.L114
.L115:
	lw	a5,-36(s0)
	slli	a5,a5,1
	sw	a5,-36(s0)
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
.L114:
	lw	a4,-36(s0)
	li	a5,127
	bgtu	a4,a5,.L113
	lw	a4,-20(s0)
	li	a5,1
	bgt	a4,a5,.L115
.L113:
	lw	a5,-36(s0)
	slli	a5,a5,16
	srli	a5,a5,16
	andi	a5,a5,127
	sh	a5,-50(s0)
	lw	a4,-20(s0)
	li	a5,254
	ble	a4,a5,.L116
	li	a5,-32768
	xori	a5,a5,-128
	j	.L118
.L116:
	lw	a5,-20(s0)
	bgt	a5,zero,.L117
	li	a5,0
	j	.L118
.L117:
	lw	a5,-20(s0)
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a5,a5,7
	slli	a4,a5,16
	srai	a4,a4,16
	li	a5,32768
	addi	a5,a5,-128
	and	a5,a4,a5
	slli	a4,a5,16
	srai	a4,a4,16
	lh	a5,-50(s0)
	or	a5,a4,a5
	slli	a5,a5,16
	srai	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
.L118:
	mv	a0,a5
	lw	ra,76(sp)
	lw	s0,72(sp)
	addi	sp,sp,80
	jr	ra
	.size	bf16_sqrt, .-bf16_sqrt
	.align	2
	.type	bf16_eq, @function
bf16_eq:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sh	a0,-20(s0)
	sh	a1,-24(s0)
	lhu	a5,-20(s0)
	mv	a0,a5
	call	bf16_isnan
	mv	a5,a0
	bne	a5,zero,.L120
	lhu	a5,-24(s0)
	mv	a0,a5
	call	bf16_isnan
	mv	a5,a0
	beq	a5,zero,.L121
.L120:
	li	a5,0
	j	.L122
.L121:
	lhu	a5,-20(s0)
	mv	a0,a5
	call	bf16_iszero
	mv	a5,a0
	beq	a5,zero,.L123
	lhu	a5,-24(s0)
	mv	a0,a5
	call	bf16_iszero
	mv	a5,a0
	beq	a5,zero,.L123
	li	a5,1
	j	.L122
.L123:
	lhu	a4,-20(s0)
	lhu	a5,-24(s0)
	sub	a5,a4,a5
	seqz	a5,a5
	andi	a5,a5,0xff
.L122:
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	bf16_eq, .-bf16_eq
	.align	2
	.type	bf16_lt, @function
bf16_lt:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sh	a0,-36(s0)
	sh	a1,-40(s0)
	lhu	a5,-36(s0)
	mv	a0,a5
	call	bf16_isnan
	mv	a5,a0
	bne	a5,zero,.L125
	lhu	a5,-40(s0)
	mv	a0,a5
	call	bf16_isnan
	mv	a5,a0
	beq	a5,zero,.L126
.L125:
	li	a5,0
	j	.L127
.L126:
	lhu	a5,-36(s0)
	mv	a0,a5
	call	bf16_iszero
	mv	a5,a0
	beq	a5,zero,.L128
	lhu	a5,-40(s0)
	mv	a0,a5
	call	bf16_iszero
	mv	a5,a0
	beq	a5,zero,.L128
	li	a5,0
	j	.L127
.L128:
	lhu	a5,-36(s0)
	srli	a5,a5,15
	slli	a5,a5,16
	srli	a5,a5,16
	andi	a5,a5,1
	snez	a5,a5
	sb	a5,-17(s0)
	lhu	a5,-40(s0)
	srli	a5,a5,15
	slli	a5,a5,16
	srli	a5,a5,16
	andi	a5,a5,1
	snez	a5,a5
	sb	a5,-18(s0)
	lbu	a4,-17(s0)
	lbu	a5,-18(s0)
	beq	a4,a5,.L129
	lbu	a4,-17(s0)
	lbu	a5,-18(s0)
	sgtu	a5,a4,a5
	andi	a5,a5,0xff
	j	.L127
.L129:
	lbu	a5,-17(s0)
	beq	a5,zero,.L130
	lhu	a4,-36(s0)
	lhu	a5,-40(s0)
	sgtu	a5,a4,a5
	andi	a5,a5,0xff
	j	.L127
.L130:
	lhu	a4,-36(s0)
	lhu	a5,-40(s0)
	sltu	a5,a4,a5
	andi	a5,a5,0xff
.L127:
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	bf16_lt, .-bf16_lt
	.align	2
	.type	bf16_gt, @function
bf16_gt:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sh	a0,-20(s0)
	sh	a1,-24(s0)
	lhu	a5,-20(s0)
	mv	a1,a5
	lhu	a5,-24(s0)
	mv	a0,a5
	call	bf16_lt
	mv	a5,a0
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	bf16_gt, .-bf16_gt
	.section	.rodata
	.align	2
.LC1:
	.string	"Testing basic conversions...\n"
	.globl	__nesf2
	.globl	__ltsf2
	.align	2
.LC2:
	.string	"Sign mismatch"
	.align	2
.LC3:
	.string	"FAIL: %s\n"
	.globl	__subsf3
	.globl	__divsf3
	.align	2
.LC5:
	.string	"Relative error too large"
	.align	2
.LC6:
	.string	"  Basic conversions: PASS\n"
	.align	2
.LC0:
	.word	0
	.word	1065353216
	.word	-1082130432
	.word	1073741824
	.word	-1073741824
	.word	1056964608
	.word	-1090519040
	.word	1078530000
	.word	-1068953648
	.word	1343554297
	.word	-803929351
	.text
	.align	2
	.type	test_basic_conversions, @function
test_basic_conversions:
	addi	sp,sp,-96
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	addi	s0,sp,96
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	lw	t4,0(a5)
	lw	t3,4(a5)
	lw	t1,8(a5)
	lw	a7,12(a5)
	lw	a6,16(a5)
	lw	a0,20(a5)
	lw	a1,24(a5)
	lw	a2,28(a5)
	lw	a3,32(a5)
	lw	a4,36(a5)
	lw	a5,40(a5)
	sw	t4,-80(s0)
	sw	t3,-76(s0)
	sw	t1,-72(s0)
	sw	a7,-68(s0)
	sw	a6,-64(s0)
	sw	a0,-60(s0)
	sw	a1,-56(s0)
	sw	a2,-52(s0)
	sw	a3,-48(s0)
	sw	a4,-44(s0)
	sw	a5,-40(s0)
	sw	zero,-20(s0)
	j	.L135
.L148:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-64(a5)
	sw	a5,-24(s0)
	lw	a0,-24(s0)
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-84(s0)
	lhu	a5,-84(s0)
	mv	a0,a5
	call	bf16_to_f32
	sw	a0,-28(s0)
	mv	a1,zero
	lw	a0,-24(s0)
	call	__nesf2
	mv	a5,a0
	beq	a5,zero,.L136
	li	s1,1
	mv	a1,zero
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L138
	li	s1,0
.L138:
	andi	s1,s1,0xff
	li	s2,1
	mv	a1,zero
	lw	a0,-28(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L139
	li	s2,0
.L139:
	andi	a5,s2,0xff
	xor	a5,s1,a5
	andi	a5,a5,0xff
	beq	a5,zero,.L136
	lui	a5,%hi(.LC2)
	addi	a1,a5,%lo(.LC2)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L149
.L136:
	mv	a1,zero
	lw	a0,-24(s0)
	call	__nesf2
	mv	a5,a0
	beq	a5,zero,.L141
	lw	a0,-24(s0)
	call	f32_to_bf16
	mv	a5,a0
	mv	a0,a5
	call	bf16_isinf
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L141
	lw	a1,-24(s0)
	lw	a0,-28(s0)
	call	__subsf3
	mv	a5,a0
	sw	a5,-32(s0)
	mv	a1,zero
	lw	a0,-32(s0)
	call	__ltsf2
	mv	a5,a0
	bge	a5,zero,.L153
	lw	a4,-32(s0)
	li	a5,-2147483648
	xor	a5,a4,a5
	lw	a1,-24(s0)
	mv	a0,a5
	call	__divsf3
	mv	a5,a0
	j	.L145
.L153:
	lw	a1,-24(s0)
	lw	a0,-32(s0)
	call	__divsf3
	mv	a5,a0
.L145:
	sw	a5,-36(s0)
	li	s1,1
	lui	a5,%hi(.LC4)
	lw	a1,%lo(.LC4)(a5)
	lw	a0,-36(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L146
	li	s1,0
.L146:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L141
	lui	a5,%hi(.LC5)
	addi	a1,a5,%lo(.LC5)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L149
.L141:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L135:
	lw	a4,-20(s0)
	li	a5,10
	bleu	a4,a5,.L148
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf
	li	a5,0
.L149:
	mv	a0,a5
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	addi	sp,sp,96
	jr	ra
	.size	test_basic_conversions, .-test_basic_conversions
	.section	.rodata
	.align	2
.LC7:
	.string	"Testing special values...\n"
	.align	2
.LC8:
	.string	"Positive infinity not detected"
	.align	2
.LC9:
	.string	"Infinity detected as NaN"
	.align	2
.LC10:
	.string	"Negative infinity not detected"
	.align	2
.LC11:
	.string	"NaN not detected"
	.align	2
.LC12:
	.string	"NaN detected as infinity"
	.align	2
.LC13:
	.string	"Zero not detected"
	.align	2
.LC15:
	.string	"Negative zero not detected"
	.align	2
.LC16:
	.string	"  Special values: PASS\n"
	.text
	.align	2
	.type	test_special_values, @function
test_special_values:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	printf
	li	a5,-32768
	xori	a5,a5,-128
	sh	a5,-20(s0)
	lhu	a5,-20(s0)
	mv	a0,a5
	call	bf16_isinf
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L155
	lui	a5,%hi(.LC8)
	addi	a1,a5,%lo(.LC8)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L163
.L155:
	lhu	a5,-20(s0)
	mv	a0,a5
	call	bf16_isnan
	mv	a5,a0
	beq	a5,zero,.L157
	lui	a5,%hi(.LC9)
	addi	a1,a5,%lo(.LC9)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L163
.L157:
	li	a5,-128
	sh	a5,-24(s0)
	lhu	a5,-24(s0)
	mv	a0,a5
	call	bf16_isinf
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L158
	lui	a5,%hi(.LC10)
	addi	a1,a5,%lo(.LC10)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L163
.L158:
	li	a5,-32768
	xori	a5,a5,-64
	sh	a5,-28(s0)
	lhu	a5,-28(s0)
	mv	a0,a5
	call	bf16_isnan
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L159
	lui	a5,%hi(.LC11)
	addi	a1,a5,%lo(.LC11)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L163
.L159:
	lhu	a5,-28(s0)
	mv	a0,a5
	call	bf16_isinf
	mv	a5,a0
	beq	a5,zero,.L160
	lui	a5,%hi(.LC12)
	addi	a1,a5,%lo(.LC12)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L163
.L160:
	mv	a0,zero
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-32(s0)
	lhu	a5,-32(s0)
	mv	a0,a5
	call	bf16_iszero
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L161
	lui	a5,%hi(.LC13)
	addi	a1,a5,%lo(.LC13)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L163
.L161:
	lui	a5,%hi(.LC14)
	lw	a5,%lo(.LC14)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-36(s0)
	lhu	a5,-36(s0)
	mv	a0,a5
	call	bf16_iszero
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L162
	lui	a5,%hi(.LC15)
	addi	a1,a5,%lo(.LC15)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L163
.L162:
	lui	a5,%hi(.LC16)
	addi	a0,a5,%lo(.LC16)
	call	printf
	li	a5,0
.L163:
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	test_special_values, .-test_special_values
	.section	.rodata
	.align	2
.LC17:
	.string	"Testing arithmetic operations...\n"
	.globl	__gtsf2
	.align	2
.LC22:
	.string	"Addition failed"
	.align	2
.LC23:
	.string	"Subtraction failed"
	.align	2
.LC28:
	.string	"Multiplication failed"
	.align	2
.LC31:
	.string	"Division failed"
	.align	2
.LC32:
	.string	"sqrt(4) failed"
	.align	2
.LC34:
	.string	"sqrt(9) failed"
	.align	2
.LC35:
	.string	"  Arithmetic: PASS\n"
	.text
	.align	2
	.type	test_arithmetic, @function
test_arithmetic:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	addi	s0,sp,48
	lui	a5,%hi(.LC17)
	addi	a0,a5,%lo(.LC17)
	call	printf
	lui	a5,%hi(.LC18)
	lw	a5,%lo(.LC18)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-28(s0)
	lui	a5,%hi(.LC19)
	lw	a5,%lo(.LC19)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-32(s0)
	lhu	a5,-32(s0)
	mv	a1,a5
	lhu	a5,-28(s0)
	mv	a0,a5
	call	bf16_add
	mv	a5,a0
	sh	a5,-36(s0)
	lhu	a5,-36(s0)
	mv	a0,a5
	call	bf16_to_f32
	sw	a0,-20(s0)
	lui	a5,%hi(.LC20)
	lw	a1,%lo(.LC20)(a5)
	lw	a0,-20(s0)
	call	__subsf3
	mv	a5,a0
	sw	a5,-24(s0)
	mv	a1,zero
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	bge	a5,zero,.L209
	li	s1,1
	lui	a5,%hi(.LC21)
	lw	a1,%lo(.LC21)(a5)
	lw	a0,-24(s0)
	call	__gtsf2
	mv	a5,a0
	bgt	a5,zero,.L167
	li	s1,0
.L167:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
	j	.L168
.L209:
	li	s1,1
	lui	a5,%hi(.LC4)
	lw	a1,%lo(.LC4)(a5)
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L169
	li	s1,0
.L169:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
.L168:
	beq	a5,zero,.L170
	lui	a5,%hi(.LC22)
	addi	a1,a5,%lo(.LC22)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L202
.L170:
	lhu	a5,-28(s0)
	mv	a1,a5
	lhu	a5,-32(s0)
	mv	a0,a5
	call	bf16_sub
	mv	a5,a0
	sh	a5,-36(s0)
	lhu	a5,-36(s0)
	mv	a0,a5
	call	bf16_to_f32
	sw	a0,-20(s0)
	lui	a5,%hi(.LC18)
	lw	a1,%lo(.LC18)(a5)
	lw	a0,-20(s0)
	call	__subsf3
	mv	a5,a0
	sw	a5,-24(s0)
	mv	a1,zero
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	bge	a5,zero,.L210
	li	s1,1
	lui	a5,%hi(.LC21)
	lw	a1,%lo(.LC21)(a5)
	lw	a0,-24(s0)
	call	__gtsf2
	mv	a5,a0
	bgt	a5,zero,.L174
	li	s1,0
.L174:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
	j	.L175
.L210:
	li	s1,1
	lui	a5,%hi(.LC4)
	lw	a1,%lo(.LC4)(a5)
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L176
	li	s1,0
.L176:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
.L175:
	beq	a5,zero,.L177
	lui	a5,%hi(.LC23)
	addi	a1,a5,%lo(.LC23)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L202
.L177:
	lui	a5,%hi(.LC20)
	lw	a5,%lo(.LC20)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-28(s0)
	lui	a5,%hi(.LC24)
	lw	a5,%lo(.LC24)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-32(s0)
	lhu	a5,-32(s0)
	mv	a1,a5
	lhu	a5,-28(s0)
	mv	a0,a5
	call	bf16_mul
	mv	a5,a0
	sh	a5,-36(s0)
	lhu	a5,-36(s0)
	mv	a0,a5
	call	bf16_to_f32
	sw	a0,-20(s0)
	lui	a5,%hi(.LC25)
	lw	a1,%lo(.LC25)(a5)
	lw	a0,-20(s0)
	call	__subsf3
	mv	a5,a0
	sw	a5,-24(s0)
	mv	a1,zero
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	bge	a5,zero,.L211
	li	s1,1
	lui	a5,%hi(.LC26)
	lw	a1,%lo(.LC26)(a5)
	lw	a0,-24(s0)
	call	__gtsf2
	mv	a5,a0
	bgt	a5,zero,.L180
	li	s1,0
.L180:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
	j	.L181
.L211:
	li	s1,1
	lui	a5,%hi(.LC27)
	lw	a1,%lo(.LC27)(a5)
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L182
	li	s1,0
.L182:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
.L181:
	beq	a5,zero,.L183
	lui	a5,%hi(.LC28)
	addi	a1,a5,%lo(.LC28)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L202
.L183:
	lui	a5,%hi(.LC29)
	lw	a5,%lo(.LC29)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-28(s0)
	lui	a5,%hi(.LC19)
	lw	a5,%lo(.LC19)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-32(s0)
	lhu	a5,-32(s0)
	mv	a1,a5
	lhu	a5,-28(s0)
	mv	a0,a5
	call	bf16_div
	mv	a5,a0
	sh	a5,-36(s0)
	lhu	a5,-36(s0)
	mv	a0,a5
	call	bf16_to_f32
	sw	a0,-20(s0)
	lui	a5,%hi(.LC30)
	lw	a1,%lo(.LC30)(a5)
	lw	a0,-20(s0)
	call	__subsf3
	mv	a5,a0
	sw	a5,-24(s0)
	mv	a1,zero
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	bge	a5,zero,.L212
	li	s1,1
	lui	a5,%hi(.LC26)
	lw	a1,%lo(.LC26)(a5)
	lw	a0,-24(s0)
	call	__gtsf2
	mv	a5,a0
	bgt	a5,zero,.L186
	li	s1,0
.L186:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
	j	.L187
.L212:
	li	s1,1
	lui	a5,%hi(.LC27)
	lw	a1,%lo(.LC27)(a5)
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L188
	li	s1,0
.L188:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
.L187:
	beq	a5,zero,.L189
	lui	a5,%hi(.LC31)
	addi	a1,a5,%lo(.LC31)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L202
.L189:
	lui	a5,%hi(.LC24)
	lw	a5,%lo(.LC24)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-28(s0)
	lhu	a5,-28(s0)
	mv	a0,a5
	call	bf16_sqrt
	mv	a5,a0
	sh	a5,-36(s0)
	lhu	a5,-36(s0)
	mv	a0,a5
	call	bf16_to_f32
	sw	a0,-20(s0)
	lui	a5,%hi(.LC19)
	lw	a1,%lo(.LC19)(a5)
	lw	a0,-20(s0)
	call	__subsf3
	mv	a5,a0
	sw	a5,-24(s0)
	mv	a1,zero
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	bge	a5,zero,.L213
	li	s1,1
	lui	a5,%hi(.LC21)
	lw	a1,%lo(.LC21)(a5)
	lw	a0,-24(s0)
	call	__gtsf2
	mv	a5,a0
	bgt	a5,zero,.L192
	li	s1,0
.L192:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
	j	.L193
.L213:
	li	s1,1
	lui	a5,%hi(.LC4)
	lw	a1,%lo(.LC4)(a5)
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L194
	li	s1,0
.L194:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
.L193:
	beq	a5,zero,.L195
	lui	a5,%hi(.LC32)
	addi	a1,a5,%lo(.LC32)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L202
.L195:
	lui	a5,%hi(.LC33)
	lw	a5,%lo(.LC33)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-28(s0)
	lhu	a5,-28(s0)
	mv	a0,a5
	call	bf16_sqrt
	mv	a5,a0
	sh	a5,-36(s0)
	lhu	a5,-36(s0)
	mv	a0,a5
	call	bf16_to_f32
	sw	a0,-20(s0)
	lui	a5,%hi(.LC20)
	lw	a1,%lo(.LC20)(a5)
	lw	a0,-20(s0)
	call	__subsf3
	mv	a5,a0
	sw	a5,-24(s0)
	mv	a1,zero
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	bge	a5,zero,.L214
	li	s1,1
	lui	a5,%hi(.LC21)
	lw	a1,%lo(.LC21)(a5)
	lw	a0,-24(s0)
	call	__gtsf2
	mv	a5,a0
	bgt	a5,zero,.L198
	li	s1,0
.L198:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
	j	.L199
.L214:
	li	s1,1
	lui	a5,%hi(.LC4)
	lw	a1,%lo(.LC4)(a5)
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L200
	li	s1,0
.L200:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
.L199:
	beq	a5,zero,.L201
	lui	a5,%hi(.LC34)
	addi	a1,a5,%lo(.LC34)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L202
.L201:
	lui	a5,%hi(.LC35)
	addi	a0,a5,%lo(.LC35)
	call	printf
	li	a5,0
.L202:
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
	.size	test_arithmetic, .-test_arithmetic
	.section	.rodata
	.align	2
.LC36:
	.string	"Testing comparison operations...\n"
	.align	2
.LC37:
	.string	"Equality test failed"
	.align	2
.LC38:
	.string	"Inequality test failed"
	.align	2
.LC39:
	.string	"Less than test failed"
	.align	2
.LC40:
	.string	"Not less than test failed"
	.align	2
.LC41:
	.string	"Equal not less than test failed"
	.align	2
.LC42:
	.string	"Greater than test failed"
	.align	2
.LC43:
	.string	"Not greater than test failed"
	.align	2
.LC44:
	.string	"NaN equality test failed"
	.align	2
.LC45:
	.string	"NaN less than test failed"
	.align	2
.LC46:
	.string	"NaN greater than test failed"
	.align	2
.LC47:
	.string	"  Comparisons: PASS\n"
	.text
	.align	2
	.type	test_comparisons, @function
test_comparisons:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	lui	a5,%hi(.LC36)
	addi	a0,a5,%lo(.LC36)
	call	printf
	lui	a5,%hi(.LC18)
	lw	a5,%lo(.LC18)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-20(s0)
	lui	a5,%hi(.LC19)
	lw	a5,%lo(.LC19)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-24(s0)
	lui	a5,%hi(.LC18)
	lw	a5,%lo(.LC18)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-28(s0)
	lhu	a5,-28(s0)
	mv	a1,a5
	lhu	a5,-20(s0)
	mv	a0,a5
	call	bf16_eq
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L216
	lui	a5,%hi(.LC37)
	addi	a1,a5,%lo(.LC37)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L227
.L216:
	lhu	a5,-24(s0)
	mv	a1,a5
	lhu	a5,-20(s0)
	mv	a0,a5
	call	bf16_eq
	mv	a5,a0
	beq	a5,zero,.L218
	lui	a5,%hi(.LC38)
	addi	a1,a5,%lo(.LC38)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L227
.L218:
	lhu	a5,-24(s0)
	mv	a1,a5
	lhu	a5,-20(s0)
	mv	a0,a5
	call	bf16_lt
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L219
	lui	a5,%hi(.LC39)
	addi	a1,a5,%lo(.LC39)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L227
.L219:
	lhu	a5,-20(s0)
	mv	a1,a5
	lhu	a5,-24(s0)
	mv	a0,a5
	call	bf16_lt
	mv	a5,a0
	beq	a5,zero,.L220
	lui	a5,%hi(.LC40)
	addi	a1,a5,%lo(.LC40)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L227
.L220:
	lhu	a5,-28(s0)
	mv	a1,a5
	lhu	a5,-20(s0)
	mv	a0,a5
	call	bf16_lt
	mv	a5,a0
	beq	a5,zero,.L221
	lui	a5,%hi(.LC41)
	addi	a1,a5,%lo(.LC41)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L227
.L221:
	lhu	a5,-20(s0)
	mv	a1,a5
	lhu	a5,-24(s0)
	mv	a0,a5
	call	bf16_gt
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L222
	lui	a5,%hi(.LC42)
	addi	a1,a5,%lo(.LC42)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L227
.L222:
	lhu	a5,-24(s0)
	mv	a1,a5
	lhu	a5,-20(s0)
	mv	a0,a5
	call	bf16_gt
	mv	a5,a0
	beq	a5,zero,.L223
	lui	a5,%hi(.LC43)
	addi	a1,a5,%lo(.LC43)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L227
.L223:
	li	a5,-32768
	xori	a5,a5,-64
	sh	a5,-32(s0)
	lhu	a5,-32(s0)
	mv	a1,a5
	lhu	a5,-32(s0)
	mv	a0,a5
	call	bf16_eq
	mv	a5,a0
	beq	a5,zero,.L224
	lui	a5,%hi(.LC44)
	addi	a1,a5,%lo(.LC44)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L227
.L224:
	lhu	a5,-20(s0)
	mv	a1,a5
	lhu	a5,-32(s0)
	mv	a0,a5
	call	bf16_lt
	mv	a5,a0
	beq	a5,zero,.L225
	lui	a5,%hi(.LC45)
	addi	a1,a5,%lo(.LC45)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L227
.L225:
	lhu	a5,-20(s0)
	mv	a1,a5
	lhu	a5,-32(s0)
	mv	a0,a5
	call	bf16_gt
	mv	a5,a0
	beq	a5,zero,.L226
	lui	a5,%hi(.LC46)
	addi	a1,a5,%lo(.LC46)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L227
.L226:
	lui	a5,%hi(.LC47)
	addi	a0,a5,%lo(.LC47)
	call	printf
	li	a5,0
.L227:
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	test_comparisons, .-test_comparisons
	.section	.rodata
	.align	2
.LC48:
	.string	"Testing edge cases...\n"
	.align	2
.LC52:
	.string	"Tiny value handling"
	.align	2
.LC54:
	.string	"Overflow should produce infinity"
	.align	2
.LC58:
	.string	"Underflow should produce zero or denormal"
	.align	2
.LC59:
	.string	"  Edge cases: PASS\n"
	.text
	.align	2
	.type	test_edge_cases, @function
test_edge_cases:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	addi	s0,sp,64
	lui	a5,%hi(.LC48)
	addi	a0,a5,%lo(.LC48)
	call	printf
	lui	a5,%hi(.LC49)
	lw	a5,%lo(.LC49)(a5)
	sw	a5,-20(s0)
	lw	a0,-20(s0)
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-36(s0)
	lhu	a5,-36(s0)
	mv	a0,a5
	call	bf16_to_f32
	sw	a0,-24(s0)
	lhu	a5,-36(s0)
	mv	a0,a5
	call	bf16_iszero
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L229
	mv	a1,zero
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	bge	a5,zero,.L246
	li	s1,1
	lui	a5,%hi(.LC50)
	lw	a1,%lo(.LC50)(a5)
	lw	a0,-24(s0)
	call	__gtsf2
	mv	a5,a0
	bgt	a5,zero,.L232
	li	s1,0
.L232:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
	j	.L233
.L246:
	li	s1,1
	lui	a5,%hi(.LC51)
	lw	a1,%lo(.LC51)(a5)
	lw	a0,-24(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L234
	li	s1,0
.L234:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
.L233:
	beq	a5,zero,.L229
	lui	a5,%hi(.LC52)
	addi	a1,a5,%lo(.LC52)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L243
.L229:
	lui	a5,%hi(.LC53)
	lw	a5,%lo(.LC53)(a5)
	sw	a5,-28(s0)
	lw	a0,-28(s0)
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-40(s0)
	lui	a5,%hi(.LC29)
	lw	a5,%lo(.LC29)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	mv	a1,a5
	lhu	a5,-40(s0)
	mv	a0,a5
	call	bf16_mul
	mv	a5,a0
	sh	a5,-44(s0)
	lhu	a5,-44(s0)
	mv	a0,a5
	call	bf16_isinf
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L236
	lui	a5,%hi(.LC54)
	addi	a1,a5,%lo(.LC54)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L243
.L236:
	lui	a5,%hi(.LC55)
	lw	a5,%lo(.LC55)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-48(s0)
	lui	a5,%hi(.LC56)
	lw	a5,%lo(.LC56)(a5)
	mv	a0,a5
	call	f32_to_bf16
	mv	a5,a0
	mv	a1,a5
	lhu	a5,-48(s0)
	mv	a0,a5
	call	bf16_div
	mv	a5,a0
	sh	a5,-52(s0)
	lhu	a5,-52(s0)
	mv	a0,a5
	call	bf16_to_f32
	sw	a0,-32(s0)
	lhu	a5,-52(s0)
	mv	a0,a5
	call	bf16_iszero
	mv	a5,a0
	xori	a5,a5,1
	andi	a5,a5,0xff
	beq	a5,zero,.L237
	mv	a1,zero
	lw	a0,-32(s0)
	call	__ltsf2
	mv	a5,a0
	bge	a5,zero,.L247
	li	s1,1
	lui	a5,%hi(.LC57)
	lw	a1,%lo(.LC57)(a5)
	lw	a0,-32(s0)
	call	__gtsf2
	mv	a5,a0
	bgt	a5,zero,.L240
	li	s1,0
.L240:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
	j	.L241
.L247:
	li	s1,1
	lui	a5,%hi(.LC49)
	lw	a1,%lo(.LC49)(a5)
	lw	a0,-32(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L242
	li	s1,0
.L242:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
.L241:
	beq	a5,zero,.L237
	lui	a5,%hi(.LC58)
	addi	a1,a5,%lo(.LC58)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L243
.L237:
	lui	a5,%hi(.LC59)
	addi	a0,a5,%lo(.LC59)
	call	printf
	li	a5,0
.L243:
	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
	.size	test_edge_cases, .-test_edge_cases
	.section	.rodata
	.align	2
.LC60:
	.string	"Testing rounding behavior...\n"
	.align	2
.LC62:
	.string	"Exact representation should be preserved"
	.align	2
.LC66:
	.string	"Rounding error should be small"
	.align	2
.LC67:
	.string	"  Rounding: PASS\n"
	.text
	.align	2
	.type	test_rounding, @function
test_rounding:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	addi	s0,sp,48
	lui	a5,%hi(.LC60)
	addi	a0,a5,%lo(.LC60)
	call	printf
	lui	a5,%hi(.LC61)
	lw	a5,%lo(.LC61)(a5)
	sw	a5,-20(s0)
	lw	a0,-20(s0)
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-40(s0)
	lhu	a5,-40(s0)
	mv	a0,a5
	call	bf16_to_f32
	sw	a0,-24(s0)
	lw	a1,-20(s0)
	lw	a0,-24(s0)
	call	__nesf2
	mv	a5,a0
	beq	a5,zero,.L261
	lui	a5,%hi(.LC62)
	addi	a1,a5,%lo(.LC62)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L258
.L261:
	lui	a5,%hi(.LC63)
	lw	a5,%lo(.LC63)(a5)
	sw	a5,-28(s0)
	lw	a0,-28(s0)
	call	f32_to_bf16
	mv	a5,a0
	sh	a5,-44(s0)
	lhu	a5,-44(s0)
	mv	a0,a5
	call	bf16_to_f32
	sw	a0,-32(s0)
	lw	a1,-28(s0)
	lw	a0,-32(s0)
	call	__subsf3
	mv	a5,a0
	sw	a5,-36(s0)
	mv	a1,zero
	lw	a0,-36(s0)
	call	__ltsf2
	mv	a5,a0
	bge	a5,zero,.L262
	li	s1,1
	lui	a5,%hi(.LC64)
	lw	a1,%lo(.LC64)(a5)
	lw	a0,-36(s0)
	call	__gtsf2
	mv	a5,a0
	bgt	a5,zero,.L254
	li	s1,0
.L254:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
	j	.L255
.L262:
	li	s1,1
	lui	a5,%hi(.LC65)
	lw	a1,%lo(.LC65)(a5)
	lw	a0,-36(s0)
	call	__ltsf2
	mv	a5,a0
	blt	a5,zero,.L256
	li	s1,0
.L256:
	andi	a5,s1,0xff
	xori	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a5,a5,0xff
.L255:
	beq	a5,zero,.L257
	lui	a5,%hi(.LC66)
	addi	a1,a5,%lo(.LC66)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	li	a5,1
	j	.L258
.L257:
	lui	a5,%hi(.LC67)
	addi	a0,a5,%lo(.LC67)
	call	printf
	li	a5,0
.L258:
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
	.size	test_rounding, .-test_rounding
	.section	.rodata
	.align	2
.LC68:
	.string	"\n=== bfloat16 Test Suite ===\n\n"
	.align	2
.LC69:
	.string	"\n=== TESTS FAILED ===\n"
	.align	2
.LC70:
	.string	"\n=== ALL TESTS PASSED ===\n"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	lui	a5,%hi(.LC68)
	addi	a0,a5,%lo(.LC68)
	call	printf
	sw	zero,-20(s0)
	call	test_basic_conversions
	mv	a4,a0
	lw	a5,-20(s0)
	or	a5,a5,a4
	sw	a5,-20(s0)
	call	test_special_values
	mv	a4,a0
	lw	a5,-20(s0)
	or	a5,a5,a4
	sw	a5,-20(s0)
	call	test_arithmetic
	mv	a4,a0
	lw	a5,-20(s0)
	or	a5,a5,a4
	sw	a5,-20(s0)
	call	test_comparisons
	mv	a4,a0
	lw	a5,-20(s0)
	or	a5,a5,a4
	sw	a5,-20(s0)
	call	test_edge_cases
	mv	a4,a0
	lw	a5,-20(s0)
	or	a5,a5,a4
	sw	a5,-20(s0)
	call	test_rounding
	mv	a4,a0
	lw	a5,-20(s0)
	or	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	beq	a5,zero,.L264
	lui	a5,%hi(.LC69)
	addi	a0,a5,%lo(.LC69)
	call	printf
	li	a5,1
	j	.L265
.L264:
	lui	a5,%hi(.LC70)
	addi	a0,a5,%lo(.LC70)
	call	printf
	li	a5,0
.L265:
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	2
.LC4:
	.word	1008981770
	.align	2
.LC14:
	.word	-2147483648
	.align	2
.LC18:
	.word	1065353216
	.align	2
.LC19:
	.word	1073741824
	.align	2
.LC20:
	.word	1077936128
	.align	2
.LC21:
	.word	-1138501878
	.align	2
.LC24:
	.word	1082130432
	.align	2
.LC25:
	.word	1094713344
	.align	2
.LC26:
	.word	-1110651699
	.align	2
.LC27:
	.word	1036831949
	.align	2
.LC29:
	.word	1092616192
	.align	2
.LC30:
	.word	1084227584
	.align	2
.LC33:
	.word	1091567616
	.align	2
.LC49:
	.word	1
	.align	2
.LC50:
	.word	-2113397526
	.align	2
.LC51:
	.word	34086122
	.align	2
.LC53:
	.word	2123789977
	.align	2
.LC55:
	.word	7136238
	.align	2
.LC56:
	.word	1343554297
	.align	2
.LC57:
	.word	-2147483647
	.align	2
.LC61:
	.word	1069547520
	.align	2
.LC63:
	.word	1065354055
	.align	2
.LC64:
	.word	-1165815185
	.align	2
.LC65:
	.word	981668463
	.ident	"GCC: (13.2.0-11ubuntu1+12) 13.2.0"
