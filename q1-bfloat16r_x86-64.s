	.file	"q1-bfloat16.c"
	.text
	.def	bf16_isnan;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_isnan
bf16_isnan:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movzwl	16(%rbp), %eax
	movzwl	%ax, %eax
	andl	$32640, %eax
	cmpl	$32640, %eax
	jne	.L2
	movzwl	16(%rbp), %eax
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
	ret
	.seh_endproc
	.def	bf16_isinf;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_isinf
bf16_isinf:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movzwl	16(%rbp), %eax
	movzwl	%ax, %eax
	andl	$32640, %eax
	cmpl	$32640, %eax
	jne	.L6
	movzwl	16(%rbp), %eax
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
	ret
	.seh_endproc
	.def	bf16_iszero;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_iszero
bf16_iszero:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movzwl	16(%rbp), %eax
	movzwl	%ax, %eax
	andl	$32767, %eax
	testl	%eax, %eax
	sete	%al
	popq	%rbp
	ret
	.seh_endproc
	.def	f32_to_bf16;	.scl	3;	.type	32;	.endef
	.seh_proc	f32_to_bf16
f32_to_bf16:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movss	%xmm0, 16(%rbp)
	movl	16(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	shrl	$23, %eax
	movzbl	%al, %eax
	cmpl	$255, %eax
	jne	.L12
	movl	-4(%rbp), %eax
	shrl	$16, %eax
	jmp	.L14
.L12:
	movl	-4(%rbp), %eax
	shrl	$16, %eax
	andl	$1, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	addl	$32767, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	shrl	$16, %eax
.L14:
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	bf16_to_f32;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_to_f32
bf16_to_f32:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movzwl	16(%rbp), %eax
	movzwl	%ax, %eax
	sall	$16, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	bf16_add;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_add
bf16_add:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movw	%dx, 24(%rbp)
	movzwl	16(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -14(%rbp)
	movzwl	24(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -16(%rbp)
	movzwl	16(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -18(%rbp)
	movzwl	24(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -20(%rbp)
	movzwl	16(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -2(%rbp)
	movzwl	24(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -4(%rbp)
	cmpw	$255, -18(%rbp)
	jne	.L18
	cmpw	$0, -2(%rbp)
	je	.L19
	movzwl	16(%rbp), %eax
	jmp	.L41
.L19:
	cmpw	$255, -20(%rbp)
	jne	.L21
	cmpw	$0, -4(%rbp)
	jne	.L22
	movzwl	-14(%rbp), %eax
	cmpw	-16(%rbp), %ax
	je	.L22
	movl	$32704, %eax
	jmp	.L41
.L22:
	movzwl	24(%rbp), %eax
	jmp	.L41
.L21:
	movzwl	16(%rbp), %eax
	jmp	.L41
.L18:
	cmpw	$255, -20(%rbp)
	jne	.L24
	movzwl	24(%rbp), %eax
	jmp	.L41
.L24:
	cmpw	$0, -18(%rbp)
	jne	.L25
	cmpw	$0, -2(%rbp)
	jne	.L25
	movzwl	24(%rbp), %eax
	jmp	.L41
.L25:
	cmpw	$0, -20(%rbp)
	jne	.L26
	cmpw	$0, -4(%rbp)
	jne	.L26
	movzwl	16(%rbp), %eax
	jmp	.L41
.L26:
	cmpw	$0, -18(%rbp)
	je	.L27
	orw	$128, -2(%rbp)
.L27:
	cmpw	$0, -20(%rbp)
	je	.L28
	orw	$128, -4(%rbp)
.L28:
	movzwl	-18(%rbp), %eax
	movzwl	-20(%rbp), %edx
	subl	%edx, %eax
	movw	%ax, -22(%rbp)
	cmpw	$0, -22(%rbp)
	jle	.L29
	movzwl	-18(%rbp), %eax
	movw	%ax, -8(%rbp)
	cmpw	$8, -22(%rbp)
	jle	.L30
	movzwl	16(%rbp), %eax
	jmp	.L41
.L30:
	movzwl	-4(%rbp), %edx
	movswl	-22(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movw	%ax, -4(%rbp)
	jmp	.L31
.L29:
	cmpw	$0, -22(%rbp)
	jns	.L32
	movzwl	-20(%rbp), %eax
	movw	%ax, -8(%rbp)
	cmpw	$-8, -22(%rbp)
	jge	.L33
	movzwl	24(%rbp), %eax
	jmp	.L41
.L33:
	movzwl	-2(%rbp), %edx
	movswl	-22(%rbp), %eax
	negl	%eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movw	%ax, -2(%rbp)
	jmp	.L31
.L32:
	movzwl	-18(%rbp), %eax
	movw	%ax, -8(%rbp)
.L31:
	movzwl	-14(%rbp), %eax
	cmpw	-16(%rbp), %ax
	jne	.L34
	movzwl	-14(%rbp), %eax
	movw	%ax, -6(%rbp)
	movzwl	-2(%rbp), %edx
	movzwl	-4(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	andl	$256, %eax
	testl	%eax, %eax
	je	.L35
	shrl	-12(%rbp)
	movzwl	-8(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -8(%rbp)
	cmpw	$254, -8(%rbp)
	jle	.L35
	movzwl	-6(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L41
.L34:
	movzwl	-2(%rbp), %eax
	cmpw	-4(%rbp), %ax
	jb	.L36
	movzwl	-14(%rbp), %eax
	movw	%ax, -6(%rbp)
	movzwl	-2(%rbp), %eax
	movzwl	-4(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -12(%rbp)
	jmp	.L37
.L36:
	movzwl	-16(%rbp), %eax
	movw	%ax, -6(%rbp)
	movzwl	-4(%rbp), %eax
	movzwl	-2(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -12(%rbp)
.L37:
	cmpl	$0, -12(%rbp)
	jne	.L39
	movl	$0, %eax
	jmp	.L41
.L40:
	sall	-12(%rbp)
	movzwl	-8(%rbp), %eax
	subl	$1, %eax
	movw	%ax, -8(%rbp)
	cmpw	$0, -8(%rbp)
	jg	.L39
	movl	$0, %eax
	jmp	.L41
.L39:
	movl	-12(%rbp), %eax
	andl	$128, %eax
	testl	%eax, %eax
	je	.L40
.L35:
	movzwl	-6(%rbp), %eax
	sall	$15, %eax
	movl	%eax, %edx
	movswl	-8(%rbp), %eax
	sall	$7, %eax
	andw	$32640, %ax
	orl	%edx, %eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	andl	$127, %eax
	orl	%edx, %eax
.L41:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	bf16_sub;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_sub
bf16_sub:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movw	%dx, 24(%rbp)
	movzwl	24(%rbp), %eax
	xorw	$-32768, %ax
	movw	%ax, 24(%rbp)
	movzwl	24(%rbp), %eax
	movl	%eax, %edx
	movzwl	16(%rbp), %ecx
	call	bf16_add
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	bf16_mul;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_mul
bf16_mul:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movw	%dx, 24(%rbp)
	movzwl	16(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -22(%rbp)
	movzwl	24(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -24(%rbp)
	movzwl	16(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -2(%rbp)
	movzwl	24(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -4(%rbp)
	movzwl	16(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -6(%rbp)
	movzwl	24(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -8(%rbp)
	movzwl	-22(%rbp), %eax
	xorw	-24(%rbp), %ax
	movw	%ax, -26(%rbp)
	cmpw	$255, -2(%rbp)
	jne	.L45
	cmpw	$0, -6(%rbp)
	je	.L46
	movzwl	16(%rbp), %eax
	jmp	.L70
.L46:
	cmpw	$0, -4(%rbp)
	jne	.L48
	cmpw	$0, -8(%rbp)
	jne	.L48
	movl	$32704, %eax
	jmp	.L70
.L48:
	movzwl	-26(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L70
.L45:
	cmpw	$255, -4(%rbp)
	jne	.L50
	cmpw	$0, -8(%rbp)
	je	.L51
	movzwl	24(%rbp), %eax
	jmp	.L70
.L51:
	cmpw	$0, -2(%rbp)
	jne	.L53
	cmpw	$0, -6(%rbp)
	jne	.L53
	movl	$32704, %eax
	jmp	.L70
.L53:
	movzwl	-26(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L70
.L50:
	cmpw	$0, -2(%rbp)
	jne	.L54
	cmpw	$0, -6(%rbp)
	je	.L55
.L54:
	cmpw	$0, -4(%rbp)
	jne	.L56
	cmpw	$0, -8(%rbp)
	jne	.L56
.L55:
	movzwl	-26(%rbp), %eax
	sall	$15, %eax
	jmp	.L70
.L56:
	movw	$0, -10(%rbp)
	cmpw	$0, -2(%rbp)
	jne	.L57
	jmp	.L58
.L59:
	salw	-6(%rbp)
	movzwl	-10(%rbp), %eax
	subl	$1, %eax
	movw	%ax, -10(%rbp)
.L58:
	movzwl	-6(%rbp), %eax
	andl	$128, %eax
	testl	%eax, %eax
	je	.L59
	movw	$1, -2(%rbp)
	jmp	.L60
.L57:
	orw	$128, -6(%rbp)
.L60:
	cmpw	$0, -4(%rbp)
	jne	.L61
	jmp	.L62
.L63:
	salw	-8(%rbp)
	movzwl	-10(%rbp), %eax
	subl	$1, %eax
	movw	%ax, -10(%rbp)
.L62:
	movzwl	-8(%rbp), %eax
	andl	$128, %eax
	testl	%eax, %eax
	je	.L63
	movw	$1, -4(%rbp)
	jmp	.L64
.L61:
	orw	$128, -8(%rbp)
.L64:
	movzwl	-6(%rbp), %edx
	movzwl	-8(%rbp), %eax
	imull	%edx, %eax
	movl	%eax, -16(%rbp)
	movswl	-2(%rbp), %edx
	movswl	-4(%rbp), %eax
	addl	%edx, %eax
	leal	-127(%rax), %edx
	movswl	-10(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %eax
	andl	$32768, %eax
	testl	%eax, %eax
	je	.L65
	movl	-16(%rbp), %eax
	shrl	$8, %eax
	andl	$127, %eax
	movl	%eax, -16(%rbp)
	addl	$1, -20(%rbp)
	jmp	.L66
.L65:
	movl	-16(%rbp), %eax
	shrl	$7, %eax
	andl	$127, %eax
	movl	%eax, -16(%rbp)
.L66:
	cmpl	$254, -20(%rbp)
	jle	.L67
	movzwl	-26(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L70
.L67:
	cmpl	$0, -20(%rbp)
	jg	.L68
	cmpl	$-6, -20(%rbp)
	jge	.L69
	movzwl	-26(%rbp), %eax
	sall	$15, %eax
	jmp	.L70
.L69:
	movl	$1, %eax
	subl	-20(%rbp), %eax
	movl	%eax, %ecx
	shrl	%cl, -16(%rbp)
	movl	$0, -20(%rbp)
.L68:
	movzwl	-26(%rbp), %eax
	sall	$15, %eax
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	sall	$7, %eax
	andw	$32640, %ax
	orl	%edx, %eax
	movl	%eax, %edx
	movl	-16(%rbp), %eax
	andl	$127, %eax
	orl	%edx, %eax
.L70:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	bf16_div;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_div
bf16_div:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movw	%dx, 24(%rbp)
	movzwl	16(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -22(%rbp)
	movzwl	24(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -24(%rbp)
	movzwl	16(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -26(%rbp)
	movzwl	24(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -28(%rbp)
	movzwl	16(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -2(%rbp)
	movzwl	24(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -4(%rbp)
	movzwl	-22(%rbp), %eax
	xorw	-24(%rbp), %ax
	movw	%ax, -30(%rbp)
	cmpw	$255, -28(%rbp)
	jne	.L72
	cmpw	$0, -4(%rbp)
	je	.L73
	movzwl	24(%rbp), %eax
	jmp	.L98
.L73:
	cmpw	$255, -26(%rbp)
	jne	.L75
	cmpw	$0, -2(%rbp)
	jne	.L75
	movl	$32704, %eax
	jmp	.L98
.L75:
	movzwl	-30(%rbp), %eax
	sall	$15, %eax
	jmp	.L98
.L72:
	cmpw	$0, -28(%rbp)
	jne	.L77
	cmpw	$0, -4(%rbp)
	jne	.L77
	cmpw	$0, -26(%rbp)
	jne	.L78
	cmpw	$0, -2(%rbp)
	jne	.L78
	movl	$32704, %eax
	jmp	.L98
.L78:
	movzwl	-30(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L98
.L77:
	cmpw	$255, -26(%rbp)
	jne	.L80
	cmpw	$0, -2(%rbp)
	je	.L81
	movzwl	16(%rbp), %eax
	jmp	.L98
.L81:
	movzwl	-30(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L98
.L80:
	cmpw	$0, -26(%rbp)
	jne	.L83
	cmpw	$0, -2(%rbp)
	jne	.L83
	movzwl	-30(%rbp), %eax
	sall	$15, %eax
	jmp	.L98
.L83:
	cmpw	$0, -26(%rbp)
	je	.L84
	orw	$128, -2(%rbp)
.L84:
	cmpw	$0, -28(%rbp)
	je	.L85
	orw	$128, -4(%rbp)
.L85:
	movzwl	-2(%rbp), %eax
	sall	$15, %eax
	movl	%eax, -8(%rbp)
	movzwl	-4(%rbp), %eax
	movl	%eax, -36(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L86
.L88:
	sall	-12(%rbp)
	movl	$15, %eax
	subl	-16(%rbp), %eax
	movl	-36(%rbp), %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	cmpl	%eax, -8(%rbp)
	jb	.L87
	movl	$15, %eax
	subl	-16(%rbp), %eax
	movl	-36(%rbp), %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	subl	%eax, -8(%rbp)
	orl	$1, -12(%rbp)
.L87:
	addl	$1, -16(%rbp)
.L86:
	cmpl	$15, -16(%rbp)
	jle	.L88
	movswl	-26(%rbp), %eax
	movswl	-28(%rbp), %edx
	subl	%edx, %eax
	addl	$127, %eax
	movl	%eax, -20(%rbp)
	cmpw	$0, -26(%rbp)
	jne	.L89
	subl	$1, -20(%rbp)
.L89:
	cmpw	$0, -28(%rbp)
	jne	.L90
	addl	$1, -20(%rbp)
.L90:
	movl	-12(%rbp), %eax
	andl	$32768, %eax
	testl	%eax, %eax
	je	.L93
	shrl	$8, -12(%rbp)
	jmp	.L92
.L95:
	sall	-12(%rbp)
	subl	$1, -20(%rbp)
.L93:
	movl	-12(%rbp), %eax
	andl	$32768, %eax
	testl	%eax, %eax
	jne	.L94
	cmpl	$1, -20(%rbp)
	jg	.L95
.L94:
	shrl	$8, -12(%rbp)
.L92:
	andl	$127, -12(%rbp)
	cmpl	$254, -20(%rbp)
	jle	.L96
	movzwl	-30(%rbp), %eax
	sall	$15, %eax
	orw	$32640, %ax
	jmp	.L98
.L96:
	cmpl	$0, -20(%rbp)
	jg	.L97
	movzwl	-30(%rbp), %eax
	sall	$15, %eax
	jmp	.L98
.L97:
	movzwl	-30(%rbp), %eax
	sall	$15, %eax
	movl	%eax, %edx
	movl	-20(%rbp), %eax
	sall	$7, %eax
	andw	$32640, %ax
	orl	%edx, %eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	andl	$127, %eax
	orl	%edx, %eax
.L98:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	bf16_sqrt;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_sqrt
bf16_sqrt:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movzwl	16(%rbp), %eax
	shrw	$15, %ax
	movw	%ax, -22(%rbp)
	movzwl	16(%rbp), %eax
	shrw	$7, %ax
	andw	$255, %ax
	movw	%ax, -24(%rbp)
	movzwl	16(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -26(%rbp)
	cmpw	$255, -24(%rbp)
	jne	.L100
	cmpw	$0, -26(%rbp)
	je	.L101
	movzwl	16(%rbp), %eax
	jmp	.L118
.L101:
	cmpw	$0, -22(%rbp)
	je	.L103
	movl	$32704, %eax
	jmp	.L118
.L103:
	movzwl	16(%rbp), %eax
	jmp	.L118
.L100:
	cmpw	$0, -24(%rbp)
	jne	.L104
	cmpw	$0, -26(%rbp)
	jne	.L104
	movl	$0, %eax
	jmp	.L118
.L104:
	cmpw	$0, -22(%rbp)
	je	.L105
	movl	$32704, %eax
	jmp	.L118
.L105:
	cmpw	$0, -24(%rbp)
	jne	.L106
	movl	$0, %eax
	jmp	.L118
.L106:
	movswl	-24(%rbp), %eax
	subl	$127, %eax
	movl	%eax, -32(%rbp)
	movzwl	-26(%rbp), %eax
	orb	$-128, %al
	movzwl	%ax, %eax
	movl	%eax, -8(%rbp)
	movl	-32(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L107
	sall	-8(%rbp)
	movl	-32(%rbp), %eax
	subl	$1, %eax
	sarl	%eax
	addl	$127, %eax
	movl	%eax, -4(%rbp)
	jmp	.L108
.L107:
	movl	-32(%rbp), %eax
	sarl	%eax
	addl	$127, %eax
	movl	%eax, -4(%rbp)
.L108:
	movl	$90, -12(%rbp)
	movl	$256, -16(%rbp)
	movl	$128, -20(%rbp)
	jmp	.L109
.L111:
	movl	-12(%rbp), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	shrl	%eax
	movl	%eax, -40(%rbp)
	movl	-40(%rbp), %eax
	imull	%eax, %eax
	shrl	$7, %eax
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	cmpl	-8(%rbp), %eax
	ja	.L110
	movl	-40(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L109
.L110:
	movl	-40(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -16(%rbp)
.L109:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jbe	.L111
	cmpl	$255, -20(%rbp)
	jbe	.L112
	shrl	-20(%rbp)
	addl	$1, -4(%rbp)
	jmp	.L113
.L112:
	cmpl	$127, -20(%rbp)
	ja	.L113
	jmp	.L114
.L115:
	sall	-20(%rbp)
	subl	$1, -4(%rbp)
.L114:
	cmpl	$127, -20(%rbp)
	ja	.L113
	cmpl	$1, -4(%rbp)
	jg	.L115
.L113:
	movl	-20(%rbp), %eax
	andl	$127, %eax
	movw	%ax, -34(%rbp)
	cmpl	$254, -4(%rbp)
	jle	.L116
	movl	$32640, %eax
	jmp	.L118
.L116:
	cmpl	$0, -4(%rbp)
	jg	.L117
	movl	$0, %eax
	jmp	.L118
.L117:
	movl	-4(%rbp), %eax
	sall	$7, %eax
	andw	$32640, %ax
	movl	%eax, %edx
	movzwl	-34(%rbp), %eax
	orl	%edx, %eax
.L118:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	bf16_eq;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_eq
bf16_eq:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movw	%dx, 24(%rbp)
	movzwl	16(%rbp), %ecx
	call	bf16_isnan
	testb	%al, %al
	jne	.L120
	movzwl	24(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_isnan
	testb	%al, %al
	je	.L121
.L120:
	movl	$0, %eax
	jmp	.L122
.L121:
	movzwl	16(%rbp), %ecx
	call	bf16_iszero
	testb	%al, %al
	je	.L123
	movzwl	24(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_iszero
	testb	%al, %al
	je	.L123
	movl	$1, %eax
	jmp	.L122
.L123:
	movzwl	16(%rbp), %edx
	movzwl	24(%rbp), %eax
	cmpw	%ax, %dx
	sete	%al
.L122:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	bf16_lt;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_lt
bf16_lt:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movw	%dx, 24(%rbp)
	movzwl	16(%rbp), %ecx
	call	bf16_isnan
	testb	%al, %al
	jne	.L125
	movzwl	24(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_isnan
	testb	%al, %al
	je	.L126
.L125:
	movl	$0, %eax
	jmp	.L127
.L126:
	movzwl	16(%rbp), %ecx
	call	bf16_iszero
	testb	%al, %al
	je	.L128
	movzwl	24(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_iszero
	testb	%al, %al
	je	.L128
	movl	$0, %eax
	jmp	.L127
.L128:
	movzwl	16(%rbp), %eax
	shrw	$15, %ax
	movzwl	%ax, %eax
	andl	$1, %eax
	testl	%eax, %eax
	setne	%al
	movb	%al, -1(%rbp)
	movzwl	24(%rbp), %eax
	shrw	$15, %ax
	movzwl	%ax, %eax
	andl	$1, %eax
	testl	%eax, %eax
	setne	%al
	movb	%al, -2(%rbp)
	movzbl	-1(%rbp), %eax
	cmpb	-2(%rbp), %al
	je	.L129
	movzbl	-1(%rbp), %eax
	cmpb	-2(%rbp), %al
	seta	%al
	jmp	.L127
.L129:
	cmpb	$0, -1(%rbp)
	je	.L130
	movzwl	16(%rbp), %edx
	movzwl	24(%rbp), %eax
	cmpw	%ax, %dx
	seta	%al
	jmp	.L127
.L130:
	movzwl	16(%rbp), %edx
	movzwl	24(%rbp), %eax
	cmpw	%ax, %dx
	setb	%al
.L127:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	bf16_gt;	.scl	3;	.type	32;	.endef
	.seh_proc	bf16_gt
bf16_gt:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movw	%cx, 16(%rbp)
	movw	%dx, 24(%rbp)
	movzwl	24(%rbp), %eax
	movzwl	16(%rbp), %edx
	movl	%eax, %ecx
	call	bf16_lt
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "Testing basic conversions...\0"
.LC12:
	.ascii "Sign mismatch\0"
.LC13:
	.ascii "FAIL: %s\12\0"
.LC16:
	.ascii "Relative error too large\0"
.LC17:
	.ascii "  Basic conversions: PASS\0"
	.text
	.def	test_basic_conversions;	.scl	3;	.type	32;	.endef
	.seh_proc	test_basic_conversions
test_basic_conversions:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	addq	$-128, %rsp
	.seh_stackalloc	128
	.seh_endprologue
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	puts
	pxor	%xmm0, %xmm0
	movss	%xmm0, -80(%rbp)
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -76(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -72(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, -68(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, -64(%rbp)
	movss	.LC6(%rip), %xmm0
	movss	%xmm0, -60(%rbp)
	movss	.LC7(%rip), %xmm0
	movss	%xmm0, -56(%rbp)
	movss	.LC8(%rip), %xmm0
	movss	%xmm0, -52(%rbp)
	movss	.LC9(%rip), %xmm0
	movss	%xmm0, -48(%rbp)
	movss	.LC10(%rip), %xmm0
	movss	%xmm0, -44(%rbp)
	movss	.LC11(%rip), %xmm0
	movss	%xmm0, -40(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L135
.L145:
	movq	-8(%rbp), %rax
	movss	-80(%rbp,%rax,4), %xmm0
	movss	%xmm0, -12(%rbp)
	movl	-12(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -82(%rbp)
	movzwl	-82(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	pxor	%xmm0, %xmm0
	ucomiss	-12(%rbp), %xmm0
	jp	.L147
	pxor	%xmm0, %xmm0
	ucomiss	-12(%rbp), %xmm0
	je	.L136
.L147:
	pxor	%xmm0, %xmm0
	comiss	-12(%rbp), %xmm0
	seta	%dl
	pxor	%xmm0, %xmm0
	comiss	-16(%rbp), %xmm0
	seta	%al
	xorl	%edx, %eax
	testb	%al, %al
	je	.L136
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L146
.L136:
	pxor	%xmm0, %xmm0
	ucomiss	-12(%rbp), %xmm0
	jp	.L148
	pxor	%xmm0, %xmm0
	ucomiss	-12(%rbp), %xmm0
	je	.L139
.L148:
	movl	-12(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movl	%eax, %ecx
	call	bf16_isinf
	xorl	$1, %eax
	testb	%al, %al
	je	.L139
	movss	-16(%rbp), %xmm0
	subss	-12(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-20(%rbp), %xmm0
	jbe	.L150
	movss	-20(%rbp), %xmm0
	movss	.LC14(%rip), %xmm1
	xorps	%xmm1, %xmm0
	divss	-12(%rbp), %xmm0
	jmp	.L143
.L150:
	movss	-20(%rbp), %xmm0
	divss	-12(%rbp), %xmm0
.L143:
	movss	%xmm0, -24(%rbp)
	movss	.LC15(%rip), %xmm0
	comiss	-24(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	testb	%al, %al
	je	.L139
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L146
.L139:
	addq	$1, -8(%rbp)
.L135:
	cmpq	$10, -8(%rbp)
	jbe	.L145
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
.L146:
	subq	$-128, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC18:
	.ascii "Testing special values...\0"
	.align 8
.LC19:
	.ascii "Positive infinity not detected\0"
.LC20:
	.ascii "Infinity detected as NaN\0"
	.align 8
.LC21:
	.ascii "Negative infinity not detected\0"
.LC22:
	.ascii "NaN not detected\0"
.LC23:
	.ascii "NaN detected as infinity\0"
.LC24:
	.ascii "Zero not detected\0"
.LC26:
	.ascii "Negative zero not detected\0"
.LC27:
	.ascii "  Special values: PASS\0"
	.text
	.def	test_special_values;	.scl	3;	.type	32;	.endef
	.seh_proc	test_special_values
test_special_values:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	.LC18(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movw	$32640, -2(%rbp)
	movzwl	-2(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_isinf
	xorl	$1, %eax
	testb	%al, %al
	je	.L152
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L160
.L152:
	movzwl	-2(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_isnan
	testb	%al, %al
	je	.L154
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L160
.L154:
	movw	$-128, -4(%rbp)
	movzwl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_isinf
	xorl	$1, %eax
	testb	%al, %al
	je	.L155
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L160
.L155:
	movw	$32704, -6(%rbp)
	movzwl	-6(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_isnan
	xorl	$1, %eax
	testb	%al, %al
	je	.L156
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L160
.L156:
	movzwl	-6(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_isinf
	testb	%al, %al
	je	.L157
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L160
.L157:
	movl	.LC1(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -8(%rbp)
	movzwl	-8(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_iszero
	xorl	$1, %eax
	testb	%al, %al
	je	.L158
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L160
.L158:
	movl	.LC25(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -10(%rbp)
	movzwl	-10(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_iszero
	xorl	$1, %eax
	testb	%al, %al
	je	.L159
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L160
.L159:
	leaq	.LC27(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
.L160:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC28:
	.ascii "Testing arithmetic operations...\0"
.LC31:
	.ascii "Addition failed\0"
.LC32:
	.ascii "Subtraction failed\0"
.LC37:
	.ascii "Multiplication failed\0"
.LC40:
	.ascii "Division failed\0"
.LC41:
	.ascii "sqrt(4) failed\0"
.LC43:
	.ascii "sqrt(9) failed\0"
.LC44:
	.ascii "  Arithmetic: PASS\0"
	.text
	.def	test_arithmetic;	.scl	3;	.type	32;	.endef
	.seh_proc	test_arithmetic
test_arithmetic:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	.LC28(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	.LC2(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -10(%rbp)
	movl	.LC4(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -12(%rbp)
	movzwl	-12(%rbp), %edx
	movzwl	-10(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_add
	movw	%ax, -14(%rbp)
	movzwl	-14(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movss	-4(%rbp), %xmm0
	movss	.LC29(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-8(%rbp), %xmm0
	jbe	.L194
	movss	-8(%rbp), %xmm0
	comiss	.LC30(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L164
.L194:
	movss	.LC15(%rip), %xmm0
	comiss	-8(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L164:
	testb	%al, %al
	je	.L165
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L187
.L165:
	movzwl	-10(%rbp), %edx
	movzwl	-12(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_sub
	movw	%ax, -14(%rbp)
	movzwl	-14(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movss	-4(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-8(%rbp), %xmm0
	jbe	.L195
	movss	-8(%rbp), %xmm0
	comiss	.LC30(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L169
.L195:
	movss	.LC15(%rip), %xmm0
	comiss	-8(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L169:
	testb	%al, %al
	je	.L170
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L187
.L170:
	movl	.LC29(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -10(%rbp)
	movl	.LC33(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -12(%rbp)
	movzwl	-12(%rbp), %edx
	movzwl	-10(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_mul
	movw	%ax, -14(%rbp)
	movzwl	-14(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movss	-4(%rbp), %xmm0
	movss	.LC34(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-8(%rbp), %xmm0
	jbe	.L196
	movss	-8(%rbp), %xmm0
	comiss	.LC35(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L173
.L196:
	movss	.LC36(%rip), %xmm0
	comiss	-8(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L173:
	testb	%al, %al
	je	.L174
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L187
.L174:
	movl	.LC38(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -10(%rbp)
	movl	.LC4(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -12(%rbp)
	movzwl	-12(%rbp), %edx
	movzwl	-10(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_div
	movw	%ax, -14(%rbp)
	movzwl	-14(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movss	-4(%rbp), %xmm0
	movss	.LC39(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-8(%rbp), %xmm0
	jbe	.L197
	movss	-8(%rbp), %xmm0
	comiss	.LC35(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L177
.L197:
	movss	.LC36(%rip), %xmm0
	comiss	-8(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L177:
	testb	%al, %al
	je	.L178
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L187
.L178:
	movl	.LC33(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -10(%rbp)
	movzwl	-10(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_sqrt
	movw	%ax, -14(%rbp)
	movzwl	-14(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movss	-4(%rbp), %xmm0
	movss	.LC4(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-8(%rbp), %xmm0
	jbe	.L198
	movss	-8(%rbp), %xmm0
	comiss	.LC30(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L181
.L198:
	movss	.LC15(%rip), %xmm0
	comiss	-8(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L181:
	testb	%al, %al
	je	.L182
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L187
.L182:
	movl	.LC42(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -10(%rbp)
	movzwl	-10(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_sqrt
	movw	%ax, -14(%rbp)
	movzwl	-14(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movss	-4(%rbp), %xmm0
	movss	.LC29(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-8(%rbp), %xmm0
	jbe	.L199
	movss	-8(%rbp), %xmm0
	comiss	.LC30(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L185
.L199:
	movss	.LC15(%rip), %xmm0
	comiss	-8(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L185:
	testb	%al, %al
	je	.L186
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L187
.L186:
	leaq	.LC44(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
.L187:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC45:
	.ascii "Testing comparison operations...\0"
.LC46:
	.ascii "Equality test failed\0"
.LC47:
	.ascii "Inequality test failed\0"
.LC48:
	.ascii "Less than test failed\0"
.LC49:
	.ascii "Not less than test failed\0"
	.align 8
.LC50:
	.ascii "Equal not less than test failed\0"
.LC51:
	.ascii "Greater than test failed\0"
.LC52:
	.ascii "Not greater than test failed\0"
.LC53:
	.ascii "NaN equality test failed\0"
.LC54:
	.ascii "NaN less than test failed\0"
.LC55:
	.ascii "NaN greater than test failed\0"
.LC56:
	.ascii "  Comparisons: PASS\0"
	.text
	.def	test_comparisons;	.scl	3;	.type	32;	.endef
	.seh_proc	test_comparisons
test_comparisons:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	.LC45(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	.LC2(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -2(%rbp)
	movl	.LC4(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -4(%rbp)
	movl	.LC2(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -6(%rbp)
	movzwl	-6(%rbp), %edx
	movzwl	-2(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_eq
	xorl	$1, %eax
	testb	%al, %al
	je	.L201
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L212
.L201:
	movzwl	-4(%rbp), %edx
	movzwl	-2(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_eq
	testb	%al, %al
	je	.L203
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L212
.L203:
	movzwl	-4(%rbp), %edx
	movzwl	-2(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_lt
	xorl	$1, %eax
	testb	%al, %al
	je	.L204
	leaq	.LC48(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L212
.L204:
	movzwl	-2(%rbp), %edx
	movzwl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_lt
	testb	%al, %al
	je	.L205
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L212
.L205:
	movzwl	-6(%rbp), %edx
	movzwl	-2(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_lt
	testb	%al, %al
	je	.L206
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L212
.L206:
	movzwl	-2(%rbp), %edx
	movzwl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_gt
	xorl	$1, %eax
	testb	%al, %al
	je	.L207
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L212
.L207:
	movzwl	-4(%rbp), %edx
	movzwl	-2(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_gt
	testb	%al, %al
	je	.L208
	leaq	.LC52(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L212
.L208:
	movw	$32704, -8(%rbp)
	movzwl	-8(%rbp), %edx
	movzwl	-8(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_eq
	testb	%al, %al
	je	.L209
	leaq	.LC53(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L212
.L209:
	movzwl	-2(%rbp), %edx
	movzwl	-8(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_lt
	testb	%al, %al
	je	.L210
	leaq	.LC54(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L212
.L210:
	movzwl	-2(%rbp), %edx
	movzwl	-8(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_gt
	testb	%al, %al
	je	.L211
	leaq	.LC55(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L212
.L211:
	leaq	.LC56(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
.L212:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC57:
	.ascii "Testing edge cases...\0"
.LC61:
	.ascii "Tiny value handling\0"
	.align 8
.LC63:
	.ascii "Overflow should produce infinity\0"
	.align 8
.LC66:
	.ascii "Underflow should produce zero or denormal\0"
.LC67:
	.ascii "  Edge cases: PASS\0"
	.text
	.def	test_edge_cases;	.scl	3;	.type	32;	.endef
	.seh_proc	test_edge_cases
test_edge_cases:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movss	.LC58(%rip), %xmm0
	movss	%xmm0, -4(%rbp)
	movl	-4(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -18(%rbp)
	movzwl	-18(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	movzwl	-18(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_iszero
	xorl	$1, %eax
	testb	%al, %al
	je	.L214
	pxor	%xmm0, %xmm0
	comiss	-8(%rbp), %xmm0
	jbe	.L227
	movss	-8(%rbp), %xmm0
	comiss	.LC59(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L217
.L227:
	movss	.LC60(%rip), %xmm0
	comiss	-8(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L217:
	testb	%al, %al
	je	.L214
	leaq	.LC61(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L224
.L214:
	movss	.LC62(%rip), %xmm0
	movss	%xmm0, -12(%rbp)
	movl	-12(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -20(%rbp)
	movl	.LC38(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movl	%eax, %edx
	movzwl	-20(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_mul
	movw	%ax, -22(%rbp)
	movzwl	-22(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_isinf
	xorl	$1, %eax
	testb	%al, %al
	je	.L219
	leaq	.LC63(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L224
.L219:
	movl	.LC64(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -24(%rbp)
	movl	.LC10(%rip), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movl	%eax, %edx
	movzwl	-24(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_div
	movw	%ax, -26(%rbp)
	movzwl	-26(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	movzwl	-26(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_iszero
	xorl	$1, %eax
	testb	%al, %al
	je	.L220
	pxor	%xmm0, %xmm0
	comiss	-16(%rbp), %xmm0
	jbe	.L228
	movss	-16(%rbp), %xmm0
	comiss	.LC65(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L223
.L228:
	movss	.LC58(%rip), %xmm0
	comiss	-16(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L223:
	testb	%al, %al
	je	.L220
	leaq	.LC66(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L224
.L220:
	leaq	.LC67(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
.L224:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC68:
	.ascii "Testing rounding behavior...\0"
	.align 8
.LC70:
	.ascii "Exact representation should be preserved\0"
	.align 8
.LC74:
	.ascii "Rounding error should be small\0"
.LC75:
	.ascii "  Rounding: PASS\0"
	.text
	.def	test_rounding;	.scl	3;	.type	32;	.endef
	.seh_proc	test_rounding
test_rounding:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	leaq	.LC68(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movss	.LC69(%rip), %xmm0
	movss	%xmm0, -4(%rbp)
	movl	-4(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -22(%rbp)
	movzwl	-22(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	ucomiss	-4(%rbp), %xmm0
	jp	.L238
	movss	-8(%rbp), %xmm0
	ucomiss	-4(%rbp), %xmm0
	je	.L230
.L238:
	leaq	.LC70(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L237
.L230:
	movss	.LC71(%rip), %xmm0
	movss	%xmm0, -12(%rbp)
	movl	-12(%rbp), %eax
	movd	%eax, %xmm0
	call	f32_to_bf16
	movw	%ax, -24(%rbp)
	movzwl	-24(%rbp), %eax
	movl	%eax, %ecx
	call	bf16_to_f32
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	movss	-16(%rbp), %xmm0
	subss	-12(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-20(%rbp), %xmm0
	jbe	.L240
	movss	-20(%rbp), %xmm0
	comiss	.LC72(%rip), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
	jmp	.L235
.L240:
	movss	.LC73(%rip), %xmm0
	comiss	-20(%rbp), %xmm0
	seta	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	andl	$1, %eax
.L235:
	testb	%al, %al
	je	.L236
	leaq	.LC74(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L237
.L236:
	leaq	.LC75(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
.L237:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC76:
	.ascii "\12=== bfloat16 Test Suite ===\12\0"
.LC77:
	.ascii "\12=== TESTS FAILED ===\0"
.LC78:
	.ascii "\12=== ALL TESTS PASSED ===\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	leaq	.LC76(%rip), %rax
	movq	%rax, %rcx
	call	puts
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
	je	.L242
	leaq	.LC77(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$1, %eax
	jmp	.L243
.L242:
	leaq	.LC78(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
.L243:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
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
	.ident	"GCC: (GNU) 11.4.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
