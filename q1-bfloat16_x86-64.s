	.file	"q1-bfloat16.c"
	.text
	.type	bf16_isnan, @function
bf16_isnan:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movw	%di, -2(%rbp)
	movzwl	-2(%rbp), %eax
	movzwl	%ax, %eax
	andl	$32640, %eax
	cmpl	$32640, %eax
	jne	.L2
	movzwl	-2(%rbp), %eax
	movzwl	%ax, %eax
	andl	$127, %eax
	testl	%eax, %eax
	je	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	movl	$0, %eax
.L3:
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	bf16_isnan, .-bf16_isnan
	.type	bf16_isinf, @function
bf16_isinf:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movw	%di, -2(%rbp)
	movzwl	-2(%rbp), %eax
	movzwl	%ax, %eax
	andl	$32640, %eax
	cmpl	$32640, %eax
	jne	.L6
	movzwl	-2(%rbp), %eax
	movzwl	%ax, %eax
	andl	$127, %eax
	testl	%eax, %eax
	jne	.L6
	movl	$1, %eax
	jmp	.L7
.L6:
	movl	$0, %eax
.L7:
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	bf16_isinf, .-bf16_isinf
	.type	bf16_iszero, @function
bf16_iszero:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movw	%di, -2(%rbp)
	movzwl	-2(%rbp), %eax
	movzwl	%ax, %eax
	andl	$32767, %eax
	testl	%eax, %eax
	sete	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	bf16_iszero, .-bf16_iszero
	.type	f32_to_bf16, @function
f32_to_bf16:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movss	%xmm0, -20(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-20(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	andl	$2139095040, %eax
	cmpl	$2139095040, %eax
	jne	.L12
	movl	-12(%rbp), %eax
	shrl	$16, %eax
	jmp	.L14
.L12:
	movl	-12(%rbp), %eax
	shrl	$16, %eax
	andl	$1, %eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	addl	$32767, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	shrl	$16, %eax
.L14:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	f32_to_bf16, .-f32_to_bf16
	.type	bf16_to_f32, @function
bf16_to_f32:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movw	%di, -18(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movzwl	-18(%rbp), %eax
	movzwl	%ax, %eax
	sall	$16, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
	movss	-12(%rbp), %xmm0
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	bf16_to_f32, .-bf16_to_f32
	.type	bf16_add, @function
bf16_add:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movw	%di, -34(%rbp)
	movw	%si, -36(%rbp)
	movzwl	-34(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -14(%rbp)
	movzwl	-36(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -12(%rbp)
	movzwl	-34(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -10(%rbp)
	movzwl	-36(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -8(%rbp)
	movzwl	-34(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -22(%rbp)
	movzwl	-36(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -20(%rbp)
	cmpw	$255, -10(%rbp)
	jne	.L20
	cmpw	$0, -22(%rbp)
	je	.L21
	movzwl	-34(%rbp), %eax
	jmp	.L43
.L21:
	cmpw	$255, -8(%rbp)
	jne	.L23
	cmpw	$0, -20(%rbp)
	jne	.L24
	movzwl	-14(%rbp), %eax
	cmpw	-12(%rbp), %ax
	je	.L24
	movl	$32704, %eax
	jmp	.L43
.L24:
	movzwl	-36(%rbp), %eax
	jmp	.L43
.L23:
	movzwl	-34(%rbp), %eax
	jmp	.L43
.L20:
	cmpw	$255, -8(%rbp)
	jne	.L26
	movzwl	-36(%rbp), %eax
	jmp	.L43
.L26:
	cmpw	$0, -10(%rbp)
	jne	.L27
	cmpw	$0, -22(%rbp)
	jne	.L27
	movzwl	-36(%rbp), %eax
	jmp	.L43
.L27:
	cmpw	$0, -8(%rbp)
	jne	.L28
	cmpw	$0, -20(%rbp)
	jne	.L28
	movzwl	-34(%rbp), %eax
	jmp	.L43
.L28:
	cmpw	$0, -10(%rbp)
	je	.L29
	orw	$128, -22(%rbp)
.L29:
	cmpw	$0, -8(%rbp)
	je	.L30
	orw	$128, -20(%rbp)
.L30:
	movzwl	-10(%rbp), %eax
	movzwl	-8(%rbp), %edx
	subl	%edx, %eax
	movw	%ax, -6(%rbp)
	cmpw	$0, -6(%rbp)
	jle	.L31
	movzwl	-10(%rbp), %eax
	movw	%ax, -16(%rbp)
	cmpw	$8, -6(%rbp)
	jle	.L32
	movzwl	-34(%rbp), %eax
	jmp	.L43
.L32:
	movzwl	-20(%rbp), %edx
	movswl	-6(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movw	%ax, -20(%rbp)
	jmp	.L33
.L31:
	cmpw	$0, -6(%rbp)
	jns	.L34
	movzwl	-8(%rbp), %eax
	movw	%ax, -16(%rbp)
	cmpw	$-8, -6(%rbp)
	jge	.L35
	movzwl	-36(%rbp), %eax
	jmp	.L43
.L35:
	movzwl	-22(%rbp), %edx
	movswl	-6(%rbp), %eax
	negl	%eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movw	%ax, -22(%rbp)
	jmp	.L33
.L34:
	movzwl	-10(%rbp), %eax
	movw	%ax, -16(%rbp)
.L33:
	movzwl	-14(%rbp), %eax
	cmpw	-12(%rbp), %ax
	jne	.L36
	movzwl	-14(%rbp), %eax
	movw	%ax, -18(%rbp)
	movzwl	-22(%rbp), %edx
	movzwl	-20(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	andl	$256, %eax
	testl	%eax, %eax
	je	.L37
	shrl	-4(%rbp)
	movzwl	-16(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -16(%rbp)
	cmpw	$254, -16(%rbp)
	jle	.L37
	movzwl	-18(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L43
.L36:
	movzwl	-22(%rbp), %eax
	cmpw	-20(%rbp), %ax
	jb	.L38
	movzwl	-14(%rbp), %eax
	movw	%ax, -18(%rbp)
	movzwl	-22(%rbp), %edx
	movzwl	-20(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, -4(%rbp)
	jmp	.L39
.L38:
	movzwl	-12(%rbp), %eax
	movw	%ax, -18(%rbp)
	movzwl	-20(%rbp), %edx
	movzwl	-22(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, -4(%rbp)
.L39:
	cmpl	$0, -4(%rbp)
	jne	.L41
	movl	$0, %eax
	jmp	.L43
.L42:
	sall	-4(%rbp)
	movzwl	-16(%rbp), %eax
	subl	$1, %eax
	movw	%ax, -16(%rbp)
	cmpw	$0, -16(%rbp)
	jg	.L41
	movl	$0, %eax
	jmp	.L43
.L41:
	movl	-4(%rbp), %eax
	andl	$128, %eax
	testl	%eax, %eax
	je	.L42
.L37:
	movzwl	-18(%rbp), %eax
	sall	$15, %eax
	movl	%eax, %edx
	movzwl	-16(%rbp), %eax
	sall	$7, %eax
	andw	$32640, %ax
	orl	%edx, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	andl	$127, %eax
	orl	%edx, %eax
.L43:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	bf16_add, .-bf16_add
	.type	bf16_sub, @function
bf16_sub:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movw	%di, -2(%rbp)
	movw	%si, -4(%rbp)
	movzwl	-4(%rbp), %eax
	xorw	$-32768, %ax
	movw	%ax, -4(%rbp)
	movzwl	-4(%rbp), %edx
	movzwl	-2(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_add
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	bf16_sub, .-bf16_sub
	.type	bf16_mul, @function
bf16_mul:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movw	%di, -34(%rbp)
	movw	%si, -36(%rbp)
	movzwl	-34(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -14(%rbp)
	movzwl	-36(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -12(%rbp)
	movzwl	-34(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -24(%rbp)
	movzwl	-36(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -22(%rbp)
	movzwl	-34(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -20(%rbp)
	movzwl	-36(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -18(%rbp)
	movzwl	-14(%rbp), %eax
	xorw	-12(%rbp), %ax
	movw	%ax, -10(%rbp)
	cmpw	$255, -24(%rbp)
	jne	.L47
	cmpw	$0, -20(%rbp)
	je	.L48
	movzwl	-34(%rbp), %eax
	jmp	.L72
.L48:
	cmpw	$0, -22(%rbp)
	jne	.L50
	cmpw	$0, -18(%rbp)
	jne	.L50
	movl	$32704, %eax
	jmp	.L72
.L50:
	movzwl	-10(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L72
.L47:
	cmpw	$255, -22(%rbp)
	jne	.L52
	cmpw	$0, -18(%rbp)
	je	.L53
	movzwl	-36(%rbp), %eax
	jmp	.L72
.L53:
	cmpw	$0, -24(%rbp)
	jne	.L55
	cmpw	$0, -20(%rbp)
	jne	.L55
	movl	$32704, %eax
	jmp	.L72
.L55:
	movzwl	-10(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L72
.L52:
	cmpw	$0, -24(%rbp)
	jne	.L56
	cmpw	$0, -20(%rbp)
	je	.L57
.L56:
	cmpw	$0, -22(%rbp)
	jne	.L58
	cmpw	$0, -18(%rbp)
	jne	.L58
.L57:
	movzwl	-10(%rbp), %eax
	sall	$15, %eax
	jmp	.L72
.L58:
	movw	$0, -16(%rbp)
	cmpw	$0, -24(%rbp)
	jne	.L59
	jmp	.L60
.L61:
	salw	-20(%rbp)
	movzwl	-16(%rbp), %eax
	subl	$1, %eax
	movw	%ax, -16(%rbp)
.L60:
	movzwl	-20(%rbp), %eax
	andl	$128, %eax
	testl	%eax, %eax
	je	.L61
	movw	$1, -24(%rbp)
	jmp	.L62
.L59:
	orw	$128, -20(%rbp)
.L62:
	cmpw	$0, -22(%rbp)
	jne	.L63
	jmp	.L64
.L65:
	salw	-18(%rbp)
	movzwl	-16(%rbp), %eax
	subl	$1, %eax
	movw	%ax, -16(%rbp)
.L64:
	movzwl	-18(%rbp), %eax
	andl	$128, %eax
	testl	%eax, %eax
	je	.L65
	movw	$1, -22(%rbp)
	jmp	.L66
.L63:
	orw	$128, -18(%rbp)
.L66:
	movzwl	-20(%rbp), %edx
	movzwl	-18(%rbp), %eax
	imull	%edx, %eax
	movl	%eax, -8(%rbp)
	movswl	-24(%rbp), %edx
	movswl	-22(%rbp), %eax
	addl	%edx, %eax
	leal	-127(%rax), %edx
	movswl	-16(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	andl	$32768, %eax
	testl	%eax, %eax
	je	.L67
	movl	-8(%rbp), %eax
	shrl	$8, %eax
	andl	$127, %eax
	movl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
	jmp	.L68
.L67:
	movl	-8(%rbp), %eax
	shrl	$7, %eax
	andl	$127, %eax
	movl	%eax, -8(%rbp)
.L68:
	cmpl	$254, -4(%rbp)
	jle	.L69
	movzwl	-10(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L72
.L69:
	cmpl	$0, -4(%rbp)
	jg	.L70
	cmpl	$-6, -4(%rbp)
	jge	.L71
	movzwl	-10(%rbp), %eax
	sall	$15, %eax
	jmp	.L72
.L71:
	movl	$1, %eax
	subl	-4(%rbp), %eax
	movl	%eax, %ecx
	shrl	%cl, -8(%rbp)
	movl	$0, -4(%rbp)
.L70:
	movzwl	-10(%rbp), %eax
	sall	$15, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	sall	$7, %eax
	andw	$32640, %ax
	orl	%edx, %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	andl	$127, %eax
	orl	%edx, %eax
.L72:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	bf16_mul, .-bf16_mul
	.type	bf16_div, @function
bf16_div:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movw	%di, -50(%rbp)
	movw	%si, -52(%rbp)
	movzwl	-50(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -30(%rbp)
	movzwl	-52(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -28(%rbp)
	movzwl	-50(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -26(%rbp)
	movzwl	-52(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -24(%rbp)
	movzwl	-50(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -34(%rbp)
	movzwl	-52(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -32(%rbp)
	movzwl	-30(%rbp), %eax
	xorw	-28(%rbp), %ax
	movw	%ax, -22(%rbp)
	cmpw	$255, -24(%rbp)
	jne	.L74
	cmpw	$0, -32(%rbp)
	je	.L75
	movzwl	-52(%rbp), %eax
	jmp	.L100
.L75:
	cmpw	$255, -26(%rbp)
	jne	.L77
	cmpw	$0, -34(%rbp)
	jne	.L77
	movl	$32704, %eax
	jmp	.L100
.L77:
	movzwl	-22(%rbp), %eax
	sall	$15, %eax
	jmp	.L100
.L74:
	cmpw	$0, -24(%rbp)
	jne	.L79
	cmpw	$0, -32(%rbp)
	jne	.L79
	cmpw	$0, -26(%rbp)
	jne	.L80
	cmpw	$0, -34(%rbp)
	jne	.L80
	movl	$32704, %eax
	jmp	.L100
.L80:
	movzwl	-22(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L100
.L79:
	cmpw	$255, -26(%rbp)
	jne	.L82
	cmpw	$0, -34(%rbp)
	je	.L83
	movzwl	-50(%rbp), %eax
	jmp	.L100
.L83:
	movzwl	-22(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L100
.L82:
	cmpw	$0, -26(%rbp)
	jne	.L85
	cmpw	$0, -34(%rbp)
	jne	.L85
	movzwl	-22(%rbp), %eax
	sall	$15, %eax
	jmp	.L100
.L85:
	cmpw	$0, -26(%rbp)
	je	.L86
	orw	$128, -34(%rbp)
.L86:
	cmpw	$0, -24(%rbp)
	je	.L87
	orw	$128, -32(%rbp)
.L87:
	movzwl	-34(%rbp), %eax
	sall	$15, %eax
	movl	%eax, -20(%rbp)
	movzwl	-32(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L88
.L90:
	sall	-16(%rbp)
	movl	$15, %eax
	subl	-12(%rbp), %eax
	movl	-4(%rbp), %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	cmpl	%eax, -20(%rbp)
	jb	.L89
	movl	$15, %eax
	subl	-12(%rbp), %eax
	movl	-4(%rbp), %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	subl	%eax, -20(%rbp)
	orl	$1, -16(%rbp)
.L89:
	addl	$1, -12(%rbp)
.L88:
	cmpl	$15, -12(%rbp)
	jle	.L90
	movswl	-26(%rbp), %edx
	movswl	-24(%rbp), %eax
	subl	%eax, %edx
	leal	127(%rdx), %eax
	movl	%eax, -8(%rbp)
	cmpw	$0, -26(%rbp)
	jne	.L91
	subl	$1, -8(%rbp)
.L91:
	cmpw	$0, -24(%rbp)
	jne	.L92
	addl	$1, -8(%rbp)
.L92:
	movl	-16(%rbp), %eax
	andl	$32768, %eax
	testl	%eax, %eax
	je	.L95
	shrl	$8, -16(%rbp)
	jmp	.L94
.L97:
	sall	-16(%rbp)
	subl	$1, -8(%rbp)
.L95:
	movl	-16(%rbp), %eax
	andl	$32768, %eax
	testl	%eax, %eax
	jne	.L96
	cmpl	$1, -8(%rbp)
	jg	.L97
.L96:
	shrl	$8, -16(%rbp)
.L94:
	andl	$127, -16(%rbp)
	cmpl	$254, -8(%rbp)
	jle	.L98
	movzwl	-22(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L100
.L98:
	cmpl	$0, -8(%rbp)
	jg	.L99
	movzwl	-22(%rbp), %eax
	sall	$15, %eax
	jmp	.L100
.L99:
	movzwl	-22(%rbp), %eax
	sall	$15, %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	sall	$7, %eax
	andw	$32640, %ax
	orl	%edx, %eax
	movl	%eax, %edx
	movl	-16(%rbp), %eax
	andl	$127, %eax
	orl	%edx, %eax
.L100:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	bf16_div, .-bf16_div
	.type	bf16_sqrt, @function
bf16_sqrt:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movw	%di, -50(%rbp)
	movzwl	-50(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -40(%rbp)
	movzwl	-50(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -38(%rbp)
	movzwl	-50(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -36(%rbp)
	cmpw	$255, -38(%rbp)
	jne	.L102
	cmpw	$0, -36(%rbp)
	je	.L103
	movzwl	-50(%rbp), %eax
	jmp	.L121
.L103:
	cmpw	$0, -40(%rbp)
	je	.L105
	movl	$32704, %eax
	jmp	.L121
.L105:
	movzwl	-50(%rbp), %eax
	jmp	.L121
.L102:
	cmpw	$0, -38(%rbp)
	jne	.L106
	cmpw	$0, -36(%rbp)
	jne	.L106
	movl	$0, %eax
	jmp	.L121
.L106:
	cmpw	$0, -40(%rbp)
	je	.L107
	movl	$32704, %eax
	jmp	.L121
.L107:
	cmpw	$0, -38(%rbp)
	jne	.L108
	movl	$0, %eax
	jmp	.L121
.L108:
	movswl	-38(%rbp), %eax
	subl	$127, %eax
	movl	%eax, -12(%rbp)
	movzwl	-36(%rbp), %eax
	orb	$-128, %al
	movzwl	%ax, %eax
	movl	%eax, -28(%rbp)
	movl	-12(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L109
	sall	-28(%rbp)
	movl	-12(%rbp), %eax
	subl	$1, %eax
	sarl	%eax
	addl	$127, %eax
	movl	%eax, -32(%rbp)
	jmp	.L110
.L109:
	movl	-12(%rbp), %eax
	sarl	%eax
	addl	$127, %eax
	movl	%eax, -32(%rbp)
.L110:
	movl	$90, -24(%rbp)
	movl	$256, -20(%rbp)
	movl	$128, -16(%rbp)
	jmp	.L111
.L114:
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	shrl	%eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	imull	%eax, %eax
	shrl	$7, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	%eax, -28(%rbp)
	jb	.L112
	movl	-8(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.L111
.L112:
	movl	-8(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -20(%rbp)
.L111:
	movl	-24(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jnb	.L114
	cmpl	$255, -16(%rbp)
	jbe	.L115
	shrl	-16(%rbp)
	addl	$1, -32(%rbp)
	jmp	.L116
.L115:
	cmpl	$127, -16(%rbp)
	ja	.L116
	jmp	.L117
.L118:
	sall	-16(%rbp)
	subl	$1, -32(%rbp)
.L117:
	cmpl	$127, -16(%rbp)
	ja	.L116
	cmpl	$1, -32(%rbp)
	jg	.L118
.L116:
	movl	-16(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -34(%rbp)
	cmpl	$254, -32(%rbp)
	jle	.L119
	movl	$32640, %eax
	jmp	.L121
.L119:
	cmpl	$0, -32(%rbp)
	jg	.L120
	movl	$0, %eax
	jmp	.L121
.L120:
	movl	-32(%rbp), %eax
	sall	$7, %eax
	andw	$32640, %ax
	movl	%eax, %edx
	movzwl	-34(%rbp), %eax
	orl	%edx, %eax
.L121:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	bf16_sqrt, .-bf16_sqrt
	.type	bf16_eq, @function
bf16_eq:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movw	%di, -2(%rbp)
	movw	%si, -4(%rbp)
	movzwl	-2(%rbp), %eax
	movl	%eax, %edi
	call	bf16_isnan
	testb	%al, %al
	jne	.L123
	movzwl	-4(%rbp), %eax
	movl	%eax, %edi
	call	bf16_isnan
	testb	%al, %al
	je	.L124
.L123:
	movl	$0, %eax
	jmp	.L125
.L124:
	movzwl	-2(%rbp), %eax
	movl	%eax, %edi
	call	bf16_iszero
	testb	%al, %al
	je	.L126
	movzwl	-4(%rbp), %eax
	movl	%eax, %edi
	call	bf16_iszero
	testb	%al, %al
	je	.L126
	movl	$1, %eax
	jmp	.L125
.L126:
	movzwl	-2(%rbp), %edx
	movzwl	-4(%rbp), %eax
	cmpw	%ax, %dx
	sete	%al
.L125:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	bf16_eq, .-bf16_eq
	.type	bf16_lt, @function
bf16_lt:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movw	%di, -18(%rbp)
	movw	%si, -20(%rbp)
	movzwl	-18(%rbp), %eax
	movl	%eax, %edi
	call	bf16_isnan
	testb	%al, %al
	jne	.L128
	movzwl	-20(%rbp), %eax
	movl	%eax, %edi
	call	bf16_isnan
	testb	%al, %al
	je	.L129
.L128:
	movl	$0, %eax
	jmp	.L130
.L129:
	movzwl	-18(%rbp), %eax
	movl	%eax, %edi
	call	bf16_iszero
	testb	%al, %al
	je	.L131
	movzwl	-20(%rbp), %eax
	movl	%eax, %edi
	call	bf16_iszero
	testb	%al, %al
	je	.L131
	movl	$0, %eax
	jmp	.L130
.L131:
	movzwl	-18(%rbp), %eax
	shrw	$15, %ax
	movzwl	%ax, %eax
	andl	$1, %eax
	testl	%eax, %eax
	setne	%al
	movb	%al, -2(%rbp)
	movzwl	-20(%rbp), %eax
	shrw	$15, %ax
	movzwl	%ax, %eax
	andl	$1, %eax
	testl	%eax, %eax
	setne	%al
	movb	%al, -1(%rbp)
	movzbl	-2(%rbp), %eax
	cmpb	-1(%rbp), %al
	je	.L132
	movzbl	-2(%rbp), %eax
	cmpb	%al, -1(%rbp)
	setb	%al
	jmp	.L130
.L132:
	cmpb	$0, -2(%rbp)
	je	.L133
	movzwl	-18(%rbp), %eax
	movzwl	-20(%rbp), %edx
	cmpw	%ax, %dx
	setb	%al
	jmp	.L130
.L133:
	movzwl	-18(%rbp), %edx
	movzwl	-20(%rbp), %eax
	cmpw	%ax, %dx
	setb	%al
.L130:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	bf16_lt, .-bf16_lt
	.type	bf16_gt, @function
bf16_gt:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movw	%di, -2(%rbp)
	movw	%si, -4(%rbp)
	movzwl	-2(%rbp), %edx
	movzwl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_lt
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	bf16_gt, .-bf16_gt
	.section	.rodata
.LC0:
	.string	"Testing basic conversions..."
.LC12:
	.string	"Sign mismatch"
.LC13:
	.string	"FAIL: %s\n"
.LC16:
	.string	"Relative error too large"
.LC17:
	.string	"  Basic conversions: PASS"
	.text
	.type	test_basic_conversions, @function
test_basic_conversions:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	pxor	%xmm0, %xmm0
	movss	%xmm0, -64(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -60(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -56(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, -52(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, -48(%rbp)
	movss	.LC6(%rip), %xmm0
	movss	%xmm0, -44(%rbp)
	movss	.LC7(%rip), %xmm0
	movss	%xmm0, -40(%rbp)
	movss	.LC8(%rip), %xmm0
	movss	%xmm0, -36(%rbp)
	movss	.LC9(%rip), %xmm0
	movss	%xmm0, -32(%rbp)
	movss	.LC10(%rip), %xmm0
	movss	%xmm0, -28(%rbp)
	movss	.LC11(%rip), %xmm0
	movss	%xmm0, -24(%rbp)
	movq	$0, -72(%rbp)
	jmp	.L138
.L148:
	movq	-72(%rbp), %rax
	movss	-64(%rbp,%rax,4), %xmm0
	movss	%xmm0, -88(%rbp)
	movl	-88(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -90(%rbp)
	movzwl	-90(%rbp), %eax
	movl	%eax, %edi
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -84(%rbp)
	pxor	%xmm0, %xmm0
	ucomiss	-88(%rbp), %xmm0
	jp	.L151
	pxor	%xmm0, %xmm0
	ucomiss	-88(%rbp), %xmm0
	je	.L139
.L151:
	pxor	%xmm0, %xmm0
	comiss	-88(%rbp), %xmm0
	seta	%dl
	pxor	%xmm0, %xmm0
	comiss	-84(%rbp), %xmm0
	seta	%al
	xorl	%edx, %eax
	testb	%al, %al
	je	.L139
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L149
.L139:
	pxor	%xmm0, %xmm0
	ucomiss	-88(%rbp), %xmm0
	jp	.L152
	pxor	%xmm0, %xmm0
	ucomiss	-88(%rbp), %xmm0
	je	.L142
.L152:
	movl	-88(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movl	%eax, %edi
	call	bf16_isinf
	xorl	$1, %eax
	testb	%al, %al
	je	.L142
	movss	-84(%rbp), %xmm0
	subss	-88(%rbp), %xmm0
	movss	%xmm0, -80(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-80(%rbp), %xmm0
	jbe	.L154
	movss	-80(%rbp), %xmm0
	movss	.LC14(%rip), %xmm1
	xorps	%xmm1, %xmm0
	divss	-88(%rbp), %xmm0
	jmp	.L146
.L154:
	movss	-80(%rbp), %xmm0
	divss	-88(%rbp), %xmm0
.L146:
	movss	%xmm0, -76(%rbp)
	movss	.LC15(%rip), %xmm0
	comiss	-76(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	testb	%al, %al
	je	.L142
	leaq	.LC16(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L149
.L142:
	addq	$1, -72(%rbp)
.L138:
	cmpq	$10, -72(%rbp)
	jbe	.L148
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
.L149:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L150
	call	__stack_chk_fail@PLT
.L150:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	test_basic_conversions, .-test_basic_conversions
	.section	.rodata
.LC18:
	.string	"Testing special values..."
	.align 8
.LC19:
	.string	"Positive infinity not detected"
.LC20:
	.string	"Infinity detected as NaN"
	.align 8
.LC21:
	.string	"Negative infinity not detected"
.LC22:
	.string	"NaN not detected"
.LC23:
	.string	"NaN detected as infinity"
.LC24:
	.string	"Zero not detected"
.LC26:
	.string	"Negative zero not detected"
.LC27:
	.string	"  Special values: PASS"
	.text
	.type	test_special_values, @function
test_special_values:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movw	$32640, -10(%rbp)
	movzwl	-10(%rbp), %eax
	movl	%eax, %edi
	call	bf16_isinf
	xorl	$1, %eax
	testb	%al, %al
	je	.L156
	leaq	.LC19(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L164
.L156:
	movzwl	-10(%rbp), %eax
	movl	%eax, %edi
	call	bf16_isnan
	testb	%al, %al
	je	.L158
	leaq	.LC20(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L164
.L158:
	movw	$-128, -8(%rbp)
	movzwl	-8(%rbp), %eax
	movl	%eax, %edi
	call	bf16_isinf
	xorl	$1, %eax
	testb	%al, %al
	je	.L159
	leaq	.LC21(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L164
.L159:
	movw	$32704, -6(%rbp)
	movzwl	-6(%rbp), %eax
	movl	%eax, %edi
	call	bf16_isnan
	xorl	$1, %eax
	testb	%al, %al
	je	.L160
	leaq	.LC22(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L164
.L160:
	movzwl	-6(%rbp), %eax
	movl	%eax, %edi
	call	bf16_isinf
	testb	%al, %al
	je	.L161
	leaq	.LC23(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L164
.L161:
	movl	.LC1(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -4(%rbp)
	movzwl	-4(%rbp), %eax
	movl	%eax, %edi
	call	bf16_iszero
	xorl	$1, %eax
	testb	%al, %al
	je	.L162
	leaq	.LC24(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L164
.L162:
	movl	.LC25(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -2(%rbp)
	movzwl	-2(%rbp), %eax
	movl	%eax, %edi
	call	bf16_iszero
	xorl	$1, %eax
	testb	%al, %al
	je	.L163
	leaq	.LC26(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L164
.L163:
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
.L164:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	test_special_values, .-test_special_values
	.section	.rodata
	.align 8
.LC28:
	.string	"Testing arithmetic operations..."
.LC31:
	.string	"Addition failed"
.LC32:
	.string	"Subtraction failed"
.LC37:
	.string	"Multiplication failed"
.LC40:
	.string	"Division failed"
.LC41:
	.string	"sqrt(4) failed"
.LC43:
	.string	"sqrt(9) failed"
.LC44:
	.string	"  Arithmetic: PASS"
	.text
	.type	test_arithmetic, @function
test_arithmetic:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	.LC2(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -14(%rbp)
	movl	.LC4(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -12(%rbp)
	movzwl	-12(%rbp), %edx
	movzwl	-14(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_add
	movw	%ax, -10(%rbp)
	movzwl	-10(%rbp), %eax
	movl	%eax, %edi
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	movss	.LC29(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-4(%rbp), %xmm0
	jbe	.L198
	movss	-4(%rbp), %xmm0
	comiss	.LC30(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L168
.L198:
	movss	.LC15(%rip), %xmm0
	comiss	-4(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L168:
	testb	%al, %al
	je	.L169
	leaq	.LC31(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L191
.L169:
	movzwl	-14(%rbp), %edx
	movzwl	-12(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_sub
	movw	%ax, -10(%rbp)
	movzwl	-10(%rbp), %eax
	movl	%eax, %edi
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-4(%rbp), %xmm0
	jbe	.L199
	movss	-4(%rbp), %xmm0
	comiss	.LC30(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L173
.L199:
	movss	.LC15(%rip), %xmm0
	comiss	-4(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L173:
	testb	%al, %al
	je	.L174
	leaq	.LC32(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L191
.L174:
	movl	.LC29(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -14(%rbp)
	movl	.LC33(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -12(%rbp)
	movzwl	-12(%rbp), %edx
	movzwl	-14(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_mul
	movw	%ax, -10(%rbp)
	movzwl	-10(%rbp), %eax
	movl	%eax, %edi
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	movss	.LC34(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-4(%rbp), %xmm0
	jbe	.L200
	movss	-4(%rbp), %xmm0
	comiss	.LC35(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L177
.L200:
	movss	.LC36(%rip), %xmm0
	comiss	-4(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L177:
	testb	%al, %al
	je	.L178
	leaq	.LC37(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L191
.L178:
	movl	.LC38(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -14(%rbp)
	movl	.LC4(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -12(%rbp)
	movzwl	-12(%rbp), %edx
	movzwl	-14(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_div
	movw	%ax, -10(%rbp)
	movzwl	-10(%rbp), %eax
	movl	%eax, %edi
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	movss	.LC39(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-4(%rbp), %xmm0
	jbe	.L201
	movss	-4(%rbp), %xmm0
	comiss	.LC35(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L181
.L201:
	movss	.LC36(%rip), %xmm0
	comiss	-4(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L181:
	testb	%al, %al
	je	.L182
	leaq	.LC40(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L191
.L182:
	movl	.LC33(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -14(%rbp)
	movzwl	-14(%rbp), %eax
	movl	%eax, %edi
	call	bf16_sqrt
	movw	%ax, -10(%rbp)
	movzwl	-10(%rbp), %eax
	movl	%eax, %edi
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	movss	.LC4(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-4(%rbp), %xmm0
	jbe	.L202
	movss	-4(%rbp), %xmm0
	comiss	.LC30(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L185
.L202:
	movss	.LC15(%rip), %xmm0
	comiss	-4(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L185:
	testb	%al, %al
	je	.L186
	leaq	.LC41(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L191
.L186:
	movl	.LC42(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -14(%rbp)
	movzwl	-14(%rbp), %eax
	movl	%eax, %edi
	call	bf16_sqrt
	movw	%ax, -10(%rbp)
	movzwl	-10(%rbp), %eax
	movl	%eax, %edi
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	movss	.LC29(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-4(%rbp), %xmm0
	jbe	.L203
	movss	-4(%rbp), %xmm0
	comiss	.LC30(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L189
.L203:
	movss	.LC15(%rip), %xmm0
	comiss	-4(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L189:
	testb	%al, %al
	je	.L190
	leaq	.LC43(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L191
.L190:
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
.L191:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	test_arithmetic, .-test_arithmetic
	.section	.rodata
	.align 8
.LC45:
	.string	"Testing comparison operations..."
.LC46:
	.string	"Equality test failed"
.LC47:
	.string	"Inequality test failed"
.LC48:
	.string	"Less than test failed"
.LC49:
	.string	"Not less than test failed"
	.align 8
.LC50:
	.string	"Equal not less than test failed"
.LC51:
	.string	"Greater than test failed"
.LC52:
	.string	"Not greater than test failed"
.LC53:
	.string	"NaN equality test failed"
.LC54:
	.string	"NaN less than test failed"
.LC55:
	.string	"NaN greater than test failed"
.LC56:
	.string	"  Comparisons: PASS"
	.text
	.type	test_comparisons, @function
test_comparisons:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	.LC2(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -8(%rbp)
	movl	.LC4(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -6(%rbp)
	movl	.LC2(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -4(%rbp)
	movzwl	-4(%rbp), %edx
	movzwl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_eq
	xorl	$1, %eax
	testb	%al, %al
	je	.L205
	leaq	.LC46(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L216
.L205:
	movzwl	-6(%rbp), %edx
	movzwl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_eq
	testb	%al, %al
	je	.L207
	leaq	.LC47(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L216
.L207:
	movzwl	-6(%rbp), %edx
	movzwl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_lt
	xorl	$1, %eax
	testb	%al, %al
	je	.L208
	leaq	.LC48(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L216
.L208:
	movzwl	-8(%rbp), %edx
	movzwl	-6(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_lt
	testb	%al, %al
	je	.L209
	leaq	.LC49(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L216
.L209:
	movzwl	-4(%rbp), %edx
	movzwl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_lt
	testb	%al, %al
	je	.L210
	leaq	.LC50(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L216
.L210:
	movzwl	-8(%rbp), %edx
	movzwl	-6(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_gt
	xorl	$1, %eax
	testb	%al, %al
	je	.L211
	leaq	.LC51(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L216
.L211:
	movzwl	-6(%rbp), %edx
	movzwl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_gt
	testb	%al, %al
	je	.L212
	leaq	.LC52(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L216
.L212:
	movw	$32704, -2(%rbp)
	movzwl	-2(%rbp), %edx
	movzwl	-2(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_eq
	testb	%al, %al
	je	.L213
	leaq	.LC53(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L216
.L213:
	movzwl	-8(%rbp), %edx
	movzwl	-2(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_lt
	testb	%al, %al
	je	.L214
	leaq	.LC54(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L216
.L214:
	movzwl	-8(%rbp), %edx
	movzwl	-2(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_gt
	testb	%al, %al
	je	.L215
	leaq	.LC55(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L216
.L215:
	leaq	.LC56(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
.L216:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	test_comparisons, .-test_comparisons
	.section	.rodata
.LC57:
	.string	"Testing edge cases..."
.LC61:
	.string	"Tiny value handling"
	.align 8
.LC63:
	.string	"Overflow should produce infinity"
	.align 8
.LC66:
	.string	"Underflow should produce zero or denormal"
.LC67:
	.string	"  Edge cases: PASS"
	.text
	.type	test_edge_cases, @function
test_edge_cases:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	.LC57(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movss	.LC58(%rip), %xmm0
	movss	%xmm0, -16(%rbp)
	movl	-16(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -26(%rbp)
	movzwl	-26(%rbp), %eax
	movl	%eax, %edi
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -12(%rbp)
	movzwl	-26(%rbp), %eax
	movl	%eax, %edi
	call	bf16_iszero
	xorl	$1, %eax
	testb	%al, %al
	je	.L218
	pxor	%xmm0, %xmm0
	comiss	-12(%rbp), %xmm0
	jbe	.L231
	movss	-12(%rbp), %xmm0
	comiss	.LC59(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L221
.L231:
	movss	.LC60(%rip), %xmm0
	comiss	-12(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L221:
	testb	%al, %al
	je	.L218
	leaq	.LC61(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L228
.L218:
	movss	.LC62(%rip), %xmm0
	movss	%xmm0, -8(%rbp)
	movl	-8(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -24(%rbp)
	movl	.LC38(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movl	%eax, %edx
	movzwl	-24(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_mul
	movw	%ax, -22(%rbp)
	movzwl	-22(%rbp), %eax
	movl	%eax, %edi
	call	bf16_isinf
	xorl	$1, %eax
	testb	%al, %al
	je	.L223
	leaq	.LC63(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L228
.L223:
	movl	.LC64(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -20(%rbp)
	movl	.LC10(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movl	%eax, %edx
	movzwl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	bf16_div
	movw	%ax, -18(%rbp)
	movzwl	-18(%rbp), %eax
	movl	%eax, %edi
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movzwl	-18(%rbp), %eax
	movl	%eax, %edi
	call	bf16_iszero
	xorl	$1, %eax
	testb	%al, %al
	je	.L224
	pxor	%xmm0, %xmm0
	comiss	-4(%rbp), %xmm0
	jbe	.L232
	movss	-4(%rbp), %xmm0
	comiss	.LC65(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L227
.L232:
	movss	.LC58(%rip), %xmm0
	comiss	-4(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L227:
	testb	%al, %al
	je	.L224
	leaq	.LC66(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L228
.L224:
	leaq	.LC67(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
.L228:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	test_edge_cases, .-test_edge_cases
	.section	.rodata
.LC68:
	.string	"Testing rounding behavior..."
	.align 8
.LC70:
	.string	"Exact representation should be preserved"
	.align 8
.LC74:
	.string	"Rounding error should be small"
.LC75:
	.string	"  Rounding: PASS"
	.text
	.type	test_rounding, @function
test_rounding:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	.LC68(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movss	.LC69(%rip), %xmm0
	movss	%xmm0, -20(%rbp)
	movl	-20(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -24(%rbp)
	movzwl	-24(%rbp), %eax
	movl	%eax, %edi
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	movss	-16(%rbp), %xmm0
	ucomiss	-20(%rbp), %xmm0
	jp	.L242
	movss	-16(%rbp), %xmm0
	ucomiss	-20(%rbp), %xmm0
	je	.L234
.L242:
	leaq	.LC70(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L241
.L234:
	movss	.LC71(%rip), %xmm0
	movss	%xmm0, -12(%rbp)
	movl	-12(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -22(%rbp)
	movzwl	-22(%rbp), %eax
	movl	%eax, %edi
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	subss	-12(%rbp), %xmm0
	movss	%xmm0, -4(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-4(%rbp), %xmm0
	jbe	.L244
	movss	-4(%rbp), %xmm0
	comiss	.LC72(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L239
.L244:
	movss	.LC73(%rip), %xmm0
	comiss	-4(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L239:
	testb	%al, %al
	je	.L240
	leaq	.LC74(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L241
.L240:
	leaq	.LC75(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
.L241:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	test_rounding, .-test_rounding
	.section	.rodata
.LC76:
	.string	"\n=== bfloat16 Test Suite ===\n"
.LC77:
	.string	"\n=== TESTS FAILED ==="
.LC78:
	.string	"\n=== ALL TESTS PASSED ==="
	.text
	.globl	main
	.type	main, @function
main:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC76(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -4(%rbp)
	call	test_basic_conversions
	orl	%eax, -4(%rbp)
	call	test_special_values
	orl	%eax, -4(%rbp)
	call	test_arithmetic
	orl	%eax, -4(%rbp)
	call	test_comparisons
	orl	%eax, -4(%rbp)
	call	test_edge_cases
	orl	%eax, -4(%rbp)
	call	test_rounding
	orl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L246
	leaq	.LC77(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L247
.L246:
	leaq	.LC78(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
.L247:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC1:
	.long	0
	.align 4
.LC2:
	.long	1065353216
	.align 4
.LC3:
	.long	-1082130432
	.align 4
.LC4:
	.long	1073741824
	.align 4
.LC5:
	.long	-1073741824
	.align 4
.LC6:
	.long	1056964608
	.align 4
.LC7:
	.long	-1090519040
	.align 4
.LC8:
	.long	1078530000
	.align 4
.LC9:
	.long	-1068953648
	.align 4
.LC10:
	.long	1343554297
	.align 4
.LC11:
	.long	-803929351
	.align 16
.LC14:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.align 4
.LC15:
	.long	1008981770
	.align 4
.LC25:
	.long	-2147483648
	.align 4
.LC29:
	.long	1077936128
	.align 4
.LC30:
	.long	-1138501878
	.align 4
.LC33:
	.long	1082130432
	.align 4
.LC34:
	.long	1094713344
	.align 4
.LC35:
	.long	-1110651699
	.align 4
.LC36:
	.long	1036831949
	.align 4
.LC38:
	.long	1092616192
	.align 4
.LC39:
	.long	1084227584
	.align 4
.LC42:
	.long	1091567616
	.align 4
.LC58:
	.long	1
	.align 4
.LC59:
	.long	-2113397526
	.align 4
.LC60:
	.long	34086122
	.align 4
.LC62:
	.long	2123789977
	.align 4
.LC64:
	.long	7136238
	.align 4
.LC65:
	.long	-2147483647
	.align 4
.LC69:
	.long	1069547520
	.align 4
.LC71:
	.long	1065354055
	.align 4
.LC72:
	.long	-1165815185
	.align 4
.LC73:
	.long	981668463
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
