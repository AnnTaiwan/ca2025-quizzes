	.file	"q1-vector.c"
	.text
	.globl	vector_init
	.type	vector_init, @function
vector_init:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	vector_init, .-vector_init
	.globl	vector_push
	.type	vector_push, @function
vector_push:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L3
	movq	-24(%rbp), %rax
	movq	$16, 8(%rax)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	calloc@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
.L3:
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L4
	movq	-24(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rdx
	jnb	.L4
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	jmp	.L5
.L4:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L6
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	(%rax,%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	subq	%rax, %rdx
	salq	$3, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rcx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L6:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	salq	$3, %rax
	addq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	%rcx, 16(%rdx)
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	vector_push, .-vector_push
	.globl	vector_pop
	.type	vector_pop, @function
vector_pop:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L8
	movl	$0, %eax
	jmp	.L9
.L8:
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	leaq	-1(%rax), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, 16(%rax)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
.L9:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	vector_pop, .-vector_pop
	.globl	vector_get_at
	.type	vector_get_at, @function
vector_get_at:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, -16(%rbp)
	jnb	.L11
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L13
.L11:
	movl	$0, %eax
.L13:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	vector_get_at, .-vector_get_at
	.globl	vector_set_at
	.type	vector_set_at, @function
vector_set_at:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L15
	movl	$0, %eax
	jmp	.L16
.L15:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
.L16:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	vector_set_at, .-vector_set_at
	.globl	vector_get_end
	.type	vector_get_end, @function
vector_get_end:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L18
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	salq	$3, %rax
	subq	$8, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L20
.L18:
	movl	$0, %eax
.L20:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	vector_get_end, .-vector_get_end
	.globl	vector_delete_at
	.type	vector_delete_at, @function
vector_delete_at:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, -16(%rbp)
	jnb	.L23
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 24(%rax)
.L23:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	vector_delete_at, .-vector_delete_at
	.globl	vector_for_each
	.type	vector_for_each, @function
vector_for_each:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L25
	movl	$0, %eax
	jmp	.L26
.L25:
	movq	$0, -16(%rbp)
	jmp	.L27
.L30:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L31
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*%rcx
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L29
	movq	-8(%rbp), %rax
	jmp	.L26
.L31:
	nop
.L29:
	addq	$1, -16(%rbp)
.L27:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L30
	movl	$0, %eax
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	vector_for_each, .-vector_for_each
	.globl	vector_delete_all
	.type	vector_delete_all, @function
vector_delete_all:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	jmp	.L34
.L35:
	cmpq	$0, -32(%rbp)
	je	.L34
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rdi
	call	*%rdx
.L34:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	vector_pop
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L35
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	vector_delete_all, .-vector_delete_all
	.globl	vector_free
	.type	vector_free, @function
vector_free:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L39
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	jmp	.L36
.L39:
	nop
.L36:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	vector_free, .-vector_free
	.globl	vector_used
	.type	vector_used, @function
vector_used:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	vector_used, .-vector_used
	.globl	test_for_each_callback
	.type	test_for_each_callback, @function
test_for_each_callback:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	test_for_each_callback, .-test_for_each_callback
	.globl	test_delete_callback
	.type	test_delete_callback, @function
test_delete_callback:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	test_delete_callback, .-test_delete_callback
	.section	.rodata
.LC0:
	.string	"Testing vector_init... "
.LC1:
	.string	"q1-vector.c"
.LC2:
	.string	"v.data == NULL"
.LC3:
	.string	"v.size == 0"
.LC4:
	.string	"v.count == 0"
.LC5:
	.string	"v.free_slot == 0"
.LC6:
	.string	"PASSED"
	.text
	.globl	test_vector_init
	.type	test_vector_init, @function
test_vector_init:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_init
	movq	-48(%rbp), %rax
	testq	%rax, %rax
	je	.L46
	leaq	__PRETTY_FUNCTION__.8(%rip), %rax
	movq	%rax, %rcx
	movl	$157, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L46:
	movq	-40(%rbp), %rax
	testq	%rax, %rax
	je	.L47
	leaq	__PRETTY_FUNCTION__.8(%rip), %rax
	movq	%rax, %rcx
	movl	$158, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L47:
	movq	-32(%rbp), %rax
	testq	%rax, %rax
	je	.L48
	leaq	__PRETTY_FUNCTION__.8(%rip), %rax
	movq	%rax, %rcx
	movl	$159, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L48:
	movq	-24(%rbp), %rax
	testq	%rax, %rax
	je	.L49
	leaq	__PRETTY_FUNCTION__.8(%rip), %rax
	movq	%rax, %rcx
	movl	$160, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L49:
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L50
	call	__stack_chk_fail@PLT
.L50:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	test_vector_init, .-test_vector_init
	.section	.rodata
	.align 8
.LC7:
	.string	"Testing vector_push and vector_pop... "
.LC8:
	.string	"vector_push(&v, &data1) == 0"
.LC9:
	.string	"vector_used(&v) == 1"
.LC10:
	.string	"vector_push(&v, &data2) == 1"
.LC11:
	.string	"vector_used(&v) == 2"
.LC12:
	.string	"vector_push(&v, &data3) == 2"
.LC13:
	.string	"vector_used(&v) == 3"
.LC14:
	.string	"vector_pop(&v) == &data3"
.LC15:
	.string	"vector_pop(&v) == &data2"
.LC16:
	.string	"vector_pop(&v) == &data1"
.LC17:
	.string	"vector_used(&v) == 0"
.LC18:
	.string	"vector_pop(&v) == NULL"
	.text
	.globl	test_vector_push_pop
	.type	test_vector_push_pop, @function
test_vector_push_pop:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_init
	movl	$42, -60(%rbp)
	movl	$84, -56(%rbp)
	movl	$126, -52(%rbp)
	leaq	-60(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	testl	%eax, %eax
	je	.L52
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$172, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L52:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_used
	cmpq	$1, %rax
	je	.L53
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$173, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L53:
	leaq	-56(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	cmpl	$1, %eax
	je	.L54
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$175, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L54:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_used
	cmpq	$2, %rax
	je	.L55
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$176, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L55:
	leaq	-52(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	cmpl	$2, %eax
	je	.L56
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$178, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L56:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_used
	cmpq	$3, %rax
	je	.L57
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$179, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L57:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_pop
	movq	%rax, %rdx
	leaq	-52(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L58
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$181, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L58:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_used
	cmpq	$2, %rax
	je	.L59
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$182, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L59:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_pop
	movq	%rax, %rdx
	leaq	-56(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L60
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$184, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L60:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_used
	cmpq	$1, %rax
	je	.L61
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$185, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L61:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_pop
	movq	%rax, %rdx
	leaq	-60(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L62
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$187, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L62:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_used
	testq	%rax, %rax
	je	.L63
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$188, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L63:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_pop
	testq	%rax, %rax
	je	.L64
	leaq	__PRETTY_FUNCTION__.7(%rip), %rax
	movq	%rax, %rcx
	movl	$190, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L64:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L65
	call	__stack_chk_fail@PLT
.L65:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	test_vector_push_pop, .-test_vector_push_pop
	.section	.rodata
.LC19:
	.string	"Testing vector_get_at... "
	.align 8
.LC20:
	.string	"vector_get_at(&v, 0) == &data1"
	.align 8
.LC21:
	.string	"*(int *) vector_get_at(&v, 0) == 10"
	.align 8
.LC22:
	.string	"vector_get_at(&v, 1) == &data2"
	.align 8
.LC23:
	.string	"*(int *) vector_get_at(&v, 1) == 20"
	.align 8
.LC24:
	.string	"vector_get_at(&v, 2) == &data3"
	.align 8
.LC25:
	.string	"*(int *) vector_get_at(&v, 2) == 30"
.LC26:
	.string	"vector_get_at(&v, 3) == NULL"
	.align 8
.LC27:
	.string	"vector_get_at(&v, 100) == NULL"
	.text
	.globl	test_vector_get_at
	.type	test_vector_get_at, @function
test_vector_get_at:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_init
	movl	$10, -60(%rbp)
	movl	$20, -56(%rbp)
	movl	$30, -52(%rbp)
	leaq	-60(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-56(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-52(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	vector_get_at
	movq	%rax, %rdx
	leaq	-60(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L67
	leaq	__PRETTY_FUNCTION__.6(%rip), %rax
	movq	%rax, %rcx
	movl	$208, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L67:
	leaq	-48(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	vector_get_at
	movl	(%rax), %eax
	cmpl	$10, %eax
	je	.L68
	leaq	__PRETTY_FUNCTION__.6(%rip), %rax
	movq	%rax, %rcx
	movl	$209, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L68:
	leaq	-48(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	vector_get_at
	movq	%rax, %rdx
	leaq	-56(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L69
	leaq	__PRETTY_FUNCTION__.6(%rip), %rax
	movq	%rax, %rcx
	movl	$211, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L69:
	leaq	-48(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	vector_get_at
	movl	(%rax), %eax
	cmpl	$20, %eax
	je	.L70
	leaq	__PRETTY_FUNCTION__.6(%rip), %rax
	movq	%rax, %rcx
	movl	$212, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L70:
	leaq	-48(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	vector_get_at
	movq	%rax, %rdx
	leaq	-52(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L71
	leaq	__PRETTY_FUNCTION__.6(%rip), %rax
	movq	%rax, %rcx
	movl	$214, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L71:
	leaq	-48(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	vector_get_at
	movl	(%rax), %eax
	cmpl	$30, %eax
	je	.L72
	leaq	__PRETTY_FUNCTION__.6(%rip), %rax
	movq	%rax, %rcx
	movl	$215, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L72:
	leaq	-48(%rbp), %rax
	movl	$3, %esi
	movq	%rax, %rdi
	call	vector_get_at
	testq	%rax, %rax
	je	.L73
	leaq	__PRETTY_FUNCTION__.6(%rip), %rax
	movq	%rax, %rcx
	movl	$217, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L73:
	leaq	-48(%rbp), %rax
	movl	$100, %esi
	movq	%rax, %rdi
	call	vector_get_at
	testq	%rax, %rax
	je	.L74
	leaq	__PRETTY_FUNCTION__.6(%rip), %rax
	movq	%rax, %rcx
	movl	$218, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L74:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L75
	call	__stack_chk_fail@PLT
.L75:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	test_vector_get_at, .-test_vector_get_at
	.section	.rodata
.LC28:
	.string	"Testing vector_delete_at... "
.LC29:
	.string	"v.free_slot == 1"
.LC30:
	.string	"vector_get_at(&v, 1) == NULL"
.LC31:
	.string	"vector_push(&v, &data4) == 1"
	.align 8
.LC32:
	.string	"vector_get_at(&v, 1) == &data4"
	.align 8
.LC33:
	.string	"*(int *) vector_get_at(&v, 1) == 400"
	.text
	.globl	test_vector_delete_at
	.type	test_vector_delete_at, @function
test_vector_delete_at:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_init
	movl	$100, -64(%rbp)
	movl	$200, -60(%rbp)
	movl	$300, -56(%rbp)
	movl	$400, -52(%rbp)
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-60(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-56(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-48(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	vector_delete_at
	movq	-24(%rbp), %rax
	cmpq	$1, %rax
	je	.L77
	leaq	__PRETTY_FUNCTION__.5(%rip), %rax
	movq	%rax, %rcx
	movl	$237, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L77:
	leaq	-48(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	vector_get_at
	testq	%rax, %rax
	je	.L78
	leaq	__PRETTY_FUNCTION__.5(%rip), %rax
	movq	%rax, %rcx
	movl	$238, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L78:
	leaq	-52(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	cmpl	$1, %eax
	je	.L79
	leaq	__PRETTY_FUNCTION__.5(%rip), %rax
	movq	%rax, %rcx
	movl	$241, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L79:
	movq	-24(%rbp), %rax
	testq	%rax, %rax
	je	.L80
	leaq	__PRETTY_FUNCTION__.5(%rip), %rax
	movq	%rax, %rcx
	movl	$242, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L80:
	leaq	-48(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	vector_get_at
	movq	%rax, %rdx
	leaq	-52(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L81
	leaq	__PRETTY_FUNCTION__.5(%rip), %rax
	movq	%rax, %rcx
	movl	$243, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L81:
	leaq	-48(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	vector_get_at
	movl	(%rax), %eax
	cmpl	$400, %eax
	je	.L82
	leaq	__PRETTY_FUNCTION__.5(%rip), %rax
	movq	%rax, %rcx
	movl	$244, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L82:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L83
	call	__stack_chk_fail@PLT
.L83:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	test_vector_delete_at, .-test_vector_delete_at
	.section	.rodata
.LC34:
	.string	"Testing vector_for_each... "
.LC35:
	.string	"counter == 3"
	.text
	.globl	test_vector_for_each
	.type	test_vector_for_each, @function
test_vector_for_each:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_init
	movl	$1, -64(%rbp)
	movl	$2, -60(%rbp)
	movl	$3, -56(%rbp)
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-60(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-56(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	movl	$0, -52(%rbp)
	leaq	-52(%rbp), %rdx
	leaq	-48(%rbp), %rax
	leaq	test_for_each_callback(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	vector_for_each
	movl	-52(%rbp), %eax
	cmpl	$3, %eax
	je	.L85
	leaq	__PRETTY_FUNCTION__.4(%rip), %rax
	movq	%rax, %rcx
	movl	$264, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L85:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L86
	call	__stack_chk_fail@PLT
.L86:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	test_vector_for_each, .-test_vector_for_each
	.section	.rodata
.LC36:
	.string	"Testing vector_delete_all... "
	.text
	.globl	test_vector_delete_all
	.type	test_vector_delete_all, @function
test_vector_delete_all:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_init
	movl	$10, -60(%rbp)
	movl	$20, -56(%rbp)
	movl	$30, -52(%rbp)
	leaq	-60(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-56(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-52(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_used
	cmpq	$3, %rax
	je	.L88
	leaq	__PRETTY_FUNCTION__.3(%rip), %rax
	movq	%rax, %rcx
	movl	$282, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L88:
	leaq	-48(%rbp), %rax
	leaq	test_delete_callback(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_delete_all
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_used
	testq	%rax, %rax
	je	.L89
	leaq	__PRETTY_FUNCTION__.3(%rip), %rax
	movq	%rax, %rcx
	movl	$285, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L89:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_pop
	testq	%rax, %rax
	je	.L90
	leaq	__PRETTY_FUNCTION__.3(%rip), %rax
	movq	%rax, %rcx
	movl	$286, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L90:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L91
	call	__stack_chk_fail@PLT
.L91:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	test_vector_delete_all, .-test_vector_delete_all
	.section	.rodata
	.align 8
.LC37:
	.string	"Testing vector automatic resize... "
.LC38:
	.string	"vector_used(&v) == 100"
.LC39:
	.string	"v.size >= 100"
	.align 8
.LC40:
	.string	"(intptr_t) vector_get_at(&v, i) == i"
	.text
	.globl	test_vector_resize
	.type	test_vector_resize, @function
test_vector_resize:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_init
	movl	$0, -56(%rbp)
	jmp	.L93
.L94:
	movl	-56(%rbp), %eax
	cltq
	movq	%rax, %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	addl	$1, -56(%rbp)
.L93:
	cmpl	$99, -56(%rbp)
	jle	.L94
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_used
	cmpq	$100, %rax
	je	.L95
	leaq	__PRETTY_FUNCTION__.2(%rip), %rax
	movq	%rax, %rcx
	movl	$302, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L95:
	movq	-40(%rbp), %rax
	cmpq	$99, %rax
	ja	.L96
	leaq	__PRETTY_FUNCTION__.2(%rip), %rax
	movq	%rax, %rcx
	movl	$303, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC39(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L96:
	movl	$0, -52(%rbp)
	jmp	.L97
.L99:
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_get_at
	movq	%rax, %rdx
	movl	-52(%rbp), %eax
	cltq
	cmpq	%rax, %rdx
	je	.L98
	leaq	__PRETTY_FUNCTION__.2(%rip), %rax
	movq	%rax, %rcx
	movl	$307, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC40(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L98:
	addl	$1, -52(%rbp)
.L97:
	cmpl	$99, -52(%rbp)
	jle	.L99
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L100
	call	__stack_chk_fail@PLT
.L100:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	test_vector_resize, .-test_vector_resize
	.section	.rodata
.LC41:
	.string	"Testing vector_get_end... "
.LC42:
	.string	"vector_get_end(&v) == NULL"
.LC43:
	.string	"vector_get_end(&v) == &data1"
.LC44:
	.string	"vector_get_end(&v) == &data2"
.LC45:
	.string	"vector_get_end(&v) == &data3"
	.text
	.globl	test_vector_get_end
	.type	test_vector_get_end, @function
test_vector_get_end:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC41(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_init
	movl	$111, -60(%rbp)
	movl	$222, -56(%rbp)
	movl	$333, -52(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_get_end
	testq	%rax, %rax
	je	.L102
	leaq	__PRETTY_FUNCTION__.1(%rip), %rax
	movq	%rax, %rcx
	movl	$321, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L102:
	leaq	-60(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_get_end
	movq	%rax, %rdx
	leaq	-60(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L103
	leaq	__PRETTY_FUNCTION__.1(%rip), %rax
	movq	%rax, %rcx
	movl	$324, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L103:
	leaq	-56(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_get_end
	movq	%rax, %rdx
	leaq	-56(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L104
	leaq	__PRETTY_FUNCTION__.1(%rip), %rax
	movq	%rax, %rcx
	movl	$327, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC44(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L104:
	leaq	-52(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_get_end
	movq	%rax, %rdx
	leaq	-52(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L105
	leaq	__PRETTY_FUNCTION__.1(%rip), %rax
	movq	%rax, %rcx
	movl	$330, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L105:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L106
	call	__stack_chk_fail@PLT
.L106:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	test_vector_get_end, .-test_vector_get_end
	.section	.rodata
.LC46:
	.string	"Testing vector_set_at... "
	.align 8
.LC47:
	.string	"vector_set_at(&v, 1, &data4) == &data4"
	.align 8
.LC48:
	.string	"vector_used(&v) == initial_size"
	.align 8
.LC49:
	.string	"vector_set_at(&v, 10, &data4) == NULL"
	.text
	.globl	test_vector_set_at
	.type	test_vector_set_at, @function
test_vector_set_at:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_init
	movl	$1, -72(%rbp)
	movl	$2, -68(%rbp)
	movl	$3, -64(%rbp)
	movl	$999, -60(%rbp)
	leaq	-72(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-68(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	vector_push
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_used
	movq	%rax, -56(%rbp)
	leaq	-60(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	vector_set_at
	movq	%rax, %rdx
	leaq	-60(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L108
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$349, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC47(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L108:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_used
	cmpq	%rax, -56(%rbp)
	je	.L109
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$350, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC48(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L109:
	leaq	-48(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	vector_get_at
	movq	%rax, %rdx
	leaq	-60(%rbp), %rax
	cmpq	%rax, %rdx
	je	.L110
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$351, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L110:
	leaq	-60(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	vector_set_at
	testq	%rax, %rax
	je	.L111
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$353, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC49(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L111:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L112
	call	__stack_chk_fail@PLT
.L112:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	test_vector_set_at, .-test_vector_set_at
	.section	.rodata
.LC50:
	.string	"=== Running Vector Tests ==="
.LC51:
	.string	"\n=== All Tests Passed ==="
	.text
	.globl	main
	.type	main, @function
main:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC50(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	call	test_vector_init
	movl	$0, %eax
	call	test_vector_push_pop
	movl	$0, %eax
	call	test_vector_get_at
	movl	$0, %eax
	call	test_vector_delete_at
	movl	$0, %eax
	call	test_vector_for_each
	movl	$0, %eax
	call	test_vector_delete_all
	movl	$0, %eax
	call	test_vector_resize
	movl	$0, %eax
	call	test_vector_get_end
	movl	$0, %eax
	call	test_vector_set_at
	leaq	.LC51(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	main, .-main
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.8, @object
	.size	__PRETTY_FUNCTION__.8, 17
__PRETTY_FUNCTION__.8:
	.string	"test_vector_init"
	.align 16
	.type	__PRETTY_FUNCTION__.7, @object
	.size	__PRETTY_FUNCTION__.7, 21
__PRETTY_FUNCTION__.7:
	.string	"test_vector_push_pop"
	.align 16
	.type	__PRETTY_FUNCTION__.6, @object
	.size	__PRETTY_FUNCTION__.6, 19
__PRETTY_FUNCTION__.6:
	.string	"test_vector_get_at"
	.align 16
	.type	__PRETTY_FUNCTION__.5, @object
	.size	__PRETTY_FUNCTION__.5, 22
__PRETTY_FUNCTION__.5:
	.string	"test_vector_delete_at"
	.align 16
	.type	__PRETTY_FUNCTION__.4, @object
	.size	__PRETTY_FUNCTION__.4, 21
__PRETTY_FUNCTION__.4:
	.string	"test_vector_for_each"
	.align 16
	.type	__PRETTY_FUNCTION__.3, @object
	.size	__PRETTY_FUNCTION__.3, 23
__PRETTY_FUNCTION__.3:
	.string	"test_vector_delete_all"
	.align 16
	.type	__PRETTY_FUNCTION__.2, @object
	.size	__PRETTY_FUNCTION__.2, 19
__PRETTY_FUNCTION__.2:
	.string	"test_vector_resize"
	.align 16
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 20
__PRETTY_FUNCTION__.1:
	.string	"test_vector_get_end"
	.align 16
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 19
__PRETTY_FUNCTION__.0:
	.string	"test_vector_set_at"
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
