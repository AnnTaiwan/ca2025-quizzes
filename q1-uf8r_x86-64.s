	.file	"q1-uf8.c"
	.text
	.def	clz;	.scl	3;	.type	32;	.endef
	.seh_proc	clz
clz:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	$32, -4(%rbp)
	movl	$16, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	movl	16(%rbp), %edx
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	je	.L2
	movl	-8(%rbp), %eax
	subl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, 16(%rbp)
.L2:
	sarl	-8(%rbp)
	cmpl	$0, -8(%rbp)
	jne	.L3
	movl	-4(%rbp), %eax
	subl	16(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	uf8_decode
	.def	uf8_decode;	.scl	2;	.type	32;	.endef
	.seh_proc	uf8_decode
uf8_decode:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, %eax
	movb	%al, 16(%rbp)
	movzbl	16(%rbp), %eax
	andl	$15, %eax
	movl	%eax, -4(%rbp)
	movzbl	16(%rbp), %eax
	shrb	$4, %al
	movb	%al, -5(%rbp)
	movzbl	-5(%rbp), %edx
	movl	$15, %eax
	subl	%edx, %eax
	movl	$32767, %edx
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	sall	$4, %eax
	movl	%eax, -12(%rbp)
	movzbl	-5(%rbp), %eax
	movl	-4(%rbp), %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	uf8_encode
	.def	uf8_encode;	.scl	2;	.type	32;	.endef
	.seh_proc	uf8_encode
uf8_encode:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cmpl	$15, 16(%rbp)
	ja	.L8
	movl	16(%rbp), %eax
	jmp	.L9
.L8:
	movl	16(%rbp), %ecx
	call	clz
	movl	%eax, -16(%rbp)
	movl	$31, %eax
	subl	-16(%rbp), %eax
	movl	%eax, -20(%rbp)
	movb	$0, -1(%rbp)
	movl	$0, -8(%rbp)
	cmpl	$4, -20(%rbp)
	jle	.L16
	movl	-20(%rbp), %eax
	subl	$4, %eax
	movb	%al, -1(%rbp)
	cmpb	$15, -1(%rbp)
	jbe	.L11
	movb	$15, -1(%rbp)
.L11:
	movb	$0, -9(%rbp)
	jmp	.L12
.L13:
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	addl	$16, %eax
	movl	%eax, -8(%rbp)
	movzbl	-9(%rbp), %eax
	addl	$1, %eax
	movb	%al, -9(%rbp)
.L12:
	movzbl	-9(%rbp), %eax
	cmpb	-1(%rbp), %al
	jb	.L13
	jmp	.L14
.L15:
	movl	-8(%rbp), %eax
	subl	$16, %eax
	shrl	%eax
	movl	%eax, -8(%rbp)
	movzbl	-1(%rbp), %eax
	subl	$1, %eax
	movb	%al, -1(%rbp)
.L14:
	cmpb	$0, -1(%rbp)
	je	.L16
	movl	16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jb	.L15
	jmp	.L16
.L19:
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	addl	$16, %eax
	movl	%eax, -24(%rbp)
	movl	16(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jb	.L20
	movl	-24(%rbp), %eax
	movl	%eax, -8(%rbp)
	movzbl	-1(%rbp), %eax
	addl	$1, %eax
	movb	%al, -1(%rbp)
.L16:
	cmpb	$14, -1(%rbp)
	jbe	.L19
	jmp	.L18
.L20:
	nop
.L18:
	movl	16(%rbp), %eax
	subl	-8(%rbp), %eax
	movl	%eax, %edx
	movzbl	-1(%rbp), %eax
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	movb	%al, -25(%rbp)
	movzbl	-1(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movzbl	-25(%rbp), %eax
	orl	%edx, %eax
.L9:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "%02x: produces value %d but encodes back to %02x\12\0"
	.align 8
.LC1:
	.ascii "%02x: value %d <= previous_value %d\12\0"
	.text
	.def	test;	.scl	3;	.type	32;	.endef
	.seh_proc	test
test:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movl	$-1, -4(%rbp)
	movb	$1, -5(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L22
.L25:
	movl	-12(%rbp), %eax
	movb	%al, -13(%rbp)
	movzbl	-13(%rbp), %eax
	movl	%eax, %ecx
	call	uf8_decode
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	call	uf8_encode
	movb	%al, -21(%rbp)
	movzbl	-13(%rbp), %eax
	cmpb	-21(%rbp), %al
	je	.L23
	movzbl	-21(%rbp), %ecx
	movzbl	-13(%rbp), %eax
	movl	-20(%rbp), %edx
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movb	$0, -5(%rbp)
.L23:
	movl	-20(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jg	.L24
	movzbl	-13(%rbp), %eax
	movl	-4(%rbp), %ecx
	movl	-20(%rbp), %edx
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movb	$0, -5(%rbp)
.L24:
	movl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	addl	$1, -12(%rbp)
.L22:
	cmpl	$255, -12(%rbp)
	jle	.L25
	movzbl	-5(%rbp), %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC2:
	.ascii "All tests passed.\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	__main
	call	test
	testb	%al, %al
	je	.L28
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
	jmp	.L29
.L28:
	movl	$1, %eax
.L29:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.4.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
