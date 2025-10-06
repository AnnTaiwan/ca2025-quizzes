	.file	"q1-uf8.c"
	.text
	.type	clz, @function
clz:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$32, -12(%rbp)
	movl	$16, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	movl	-20(%rbp), %edx
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L2
	movl	-8(%rbp), %eax
	subl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -20(%rbp)
.L2:
	sarl	-8(%rbp)
	cmpl	$0, -8(%rbp)
	jne	.L3
	movl	-12(%rbp), %eax
	subl	-20(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	clz, .-clz
	.globl	uf8_decode
	.type	uf8_decode, @function
uf8_decode:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -20(%rbp)
	movzbl	-20(%rbp), %eax
	andl	$15, %eax
	movl	%eax, -8(%rbp)
	movzbl	-20(%rbp), %eax
	shrb	$4, %al
	movb	%al, -9(%rbp)
	movzbl	-9(%rbp), %eax
	movl	$15, %edx
	subl	%eax, %edx
	movl	$32767, %eax
	movl	%edx, %ecx
	sarl	%cl, %eax
	sall	$4, %eax
	movl	%eax, -4(%rbp)
	movzbl	-9(%rbp), %eax
	movl	-8(%rbp), %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	uf8_decode, .-uf8_decode
	.globl	uf8_encode
	.type	uf8_encode, @function
uf8_encode:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$40, %rsp
	movl	%edi, -36(%rbp)
	cmpl	$15, -36(%rbp)
	ja	.L8
	movl	-36(%rbp), %eax
	jmp	.L9
.L8:
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	clz
	movl	%eax, -12(%rbp)
	movl	$31, %eax
	subl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
	movb	$0, -19(%rbp)
	movl	$0, -16(%rbp)
	cmpl	$4, -8(%rbp)
	jle	.L16
	movl	-8(%rbp), %eax
	subl	$4, %eax
	movb	%al, -19(%rbp)
	cmpb	$15, -19(%rbp)
	jbe	.L11
	movb	$15, -19(%rbp)
.L11:
	movb	$0, -18(%rbp)
	jmp	.L12
.L13:
	movl	-16(%rbp), %eax
	addl	%eax, %eax
	addl	$16, %eax
	movl	%eax, -16(%rbp)
	movzbl	-18(%rbp), %eax
	addl	$1, %eax
	movb	%al, -18(%rbp)
.L12:
	movzbl	-18(%rbp), %eax
	cmpb	-19(%rbp), %al
	jb	.L13
	jmp	.L14
.L15:
	movl	-16(%rbp), %eax
	subl	$16, %eax
	shrl	%eax
	movl	%eax, -16(%rbp)
	movzbl	-19(%rbp), %eax
	subl	$1, %eax
	movb	%al, -19(%rbp)
.L14:
	cmpb	$0, -19(%rbp)
	je	.L16
	movl	-36(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jb	.L15
	jmp	.L16
.L19:
	movl	-16(%rbp), %eax
	addl	%eax, %eax
	addl	$16, %eax
	movl	%eax, -4(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jb	.L20
	movl	-4(%rbp), %eax
	movl	%eax, -16(%rbp)
	movzbl	-19(%rbp), %eax
	addl	$1, %eax
	movb	%al, -19(%rbp)
.L16:
	cmpb	$14, -19(%rbp)
	jbe	.L19
	jmp	.L18
.L20:
	nop
.L18:
	movl	-36(%rbp), %eax
	subl	-16(%rbp), %eax
	movl	%eax, %edx
	movzbl	-19(%rbp), %eax
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	movb	%al, -17(%rbp)
	movzbl	-19(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movzbl	-17(%rbp), %eax
	orl	%edx, %eax
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	uf8_encode, .-uf8_encode
	.section	.rodata
	.align 8
.LC0:
	.string	"%02x: produces value %d but encodes back to %02x\n"
	.align 8
.LC1:
	.string	"%02x: value %d <= previous_value %d\n"
	.text
	.type	test, @function
test:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$-1, -12(%rbp)
	movb	$1, -15(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L22
.L25:
	movl	-8(%rbp), %eax
	movb	%al, -14(%rbp)
	movzbl	-14(%rbp), %eax
	movl	%eax, %edi
	call	uf8_decode
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	uf8_encode
	movb	%al, -13(%rbp)
	movzbl	-14(%rbp), %eax
	cmpb	-13(%rbp), %al
	je	.L23
	movzbl	-13(%rbp), %ecx
	movzbl	-14(%rbp), %eax
	movl	-4(%rbp), %edx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movb	$0, -15(%rbp)
.L23:
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jg	.L24
	movzbl	-14(%rbp), %eax
	movl	-12(%rbp), %ecx
	movl	-4(%rbp), %edx
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movb	$0, -15(%rbp)
.L24:
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
	addl	$1, -8(%rbp)
.L22:
	cmpl	$255, -8(%rbp)
	jle	.L25
	movzbl	-15(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	test, .-test
	.section	.rodata
.LC2:
	.string	"All tests passed."
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	test
	testb	%al, %al
	je	.L28
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L29
.L28:
	movl	$1, %eax
.L29:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
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
