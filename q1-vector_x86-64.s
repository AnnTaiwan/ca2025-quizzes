	.file	"q1-vector.c"
	.text
	.globl	vector_init
	.def	vector_init;	.scl	2;	.type	32;	.endef
	.seh_proc	vector_init
vector_init:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	16(%rbp), %rax
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	$0, 24(%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	vector_push
	.def	vector_push;	.scl	2;	.type	32;	.endef
	.seh_proc	vector_push
vector_push:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L3
	movq	16(%rbp), %rax
	movq	$16, 8(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movl	$8, %edx
	movq	%rax, %rcx
	call	calloc
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
.L3:
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L4
	movq	16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rdx
	jnb	.L4
	movq	16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	salq	$3, %rax
	addq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rax, (%rdx)
	movq	16(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	jmp	.L5
.L4:
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L6
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	leaq	(%rax,%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	realloc
	movq	16(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	16(%rax), %rcx
	movq	%rdx, %rax
	subq	%rcx, %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rcx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	%rdx, %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	memset
.L6:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	salq	$3, %rax
	addq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rax, (%rdx)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	leaq	1(%rax), %rcx
	movq	16(%rbp), %rdx
	movq	%rcx, 16(%rdx)
.L5:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	vector_pop
	.def	vector_pop;	.scl	2;	.type	32;	.endef
	.seh_proc	vector_pop
vector_pop:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L8
	movl	$0, %eax
	jmp	.L9
.L8:
	movq	16(%rbp), %rax
	movq	(%rax), %rcx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
.L9:
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	vector_get_at
	.def	vector_get_at;	.scl	2;	.type	32;	.endef
	.seh_proc	vector_get_at
vector_get_at:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%rbp)
	jnb	.L11
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L13
.L11:
	movl	$0, %eax
.L13:
	popq	%rbp
	ret
	.seh_endproc
	.globl	vector_set_at
	.def	vector_set_at;	.scl	2;	.type	32;	.endef
	.seh_proc	vector_set_at
vector_set_at:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%rbp)
	jb	.L15
	movl	$0, %eax
	jmp	.L16
.L15:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	salq	$3, %rax
	addq	%rax, %rdx
	movq	32(%rbp), %rax
	movq	%rax, (%rdx)
	movq	32(%rbp), %rax
.L16:
	popq	%rbp
	ret
	.seh_endproc
	.globl	vector_get_end
	.def	vector_get_end;	.scl	2;	.type	32;	.endef
	.seh_proc	vector_get_end
vector_get_end:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L18
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
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
	ret
	.seh_endproc
	.globl	vector_delete_at
	.def	vector_delete_at;	.scl	2;	.type	32;	.endef
	.seh_proc	vector_delete_at
vector_delete_at:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, 24(%rbp)
	jnb	.L23
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 24(%rax)
.L23:
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	vector_for_each
	.def	vector_for_each;	.scl	2;	.type	32;	.endef
	.seh_proc	vector_for_each
vector_for_each:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 24(%rbp)
	jne	.L25
	movl	$0, %eax
	jmp	.L26
.L25:
	movq	$0, -8(%rbp)
	jmp	.L27
.L30:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L31
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	32(%rbp), %rdx
	movq	24(%rbp), %r8
	movq	%rax, %rcx
	call	*%r8
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L29
	movq	-16(%rbp), %rax
	jmp	.L26
.L31:
	nop
.L29:
	addq	$1, -8(%rbp)
.L27:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L30
	movl	$0, %eax
.L26:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	vector_delete_all
	.def	vector_delete_all;	.scl	2;	.type	32;	.endef
	.seh_proc	vector_delete_all
vector_delete_all:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	jmp	.L33
.L34:
	cmpq	$0, 24(%rbp)
	je	.L33
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rax, %rcx
	call	*%rdx
.L33:
	movq	16(%rbp), %rcx
	call	vector_pop
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L34
	nop
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	vector_free
	.def	vector_free;	.scl	2;	.type	32;	.endef
	.seh_proc	vector_free
vector_free:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L38
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	16(%rbp), %rax
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	$0, 24(%rax)
	jmp	.L35
.L38:
	nop
.L35:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	vector_used
	.def	vector_used;	.scl	2;	.type	32;	.endef
	.seh_proc	vector_used
vector_used:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	popq	%rbp
	ret
	.seh_endproc
	.globl	test_for_each_callback
	.def	test_for_each_callback;	.scl	2;	.type	32;	.endef
	.seh_proc	test_for_each_callback
test_for_each_callback:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, (%rax)
	movl	$0, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	test_delete_callback
	.def	test_delete_callback;	.scl	2;	.type	32;	.endef
	.seh_proc	test_delete_callback
test_delete_callback:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "Testing vector_init... \0"
.LC1:
	.ascii "v.data == NULL\0"
.LC2:
	.ascii "q1-vector.c\0"
.LC3:
	.ascii "v.size == 0\0"
.LC4:
	.ascii "v.count == 0\0"
.LC5:
	.ascii "v.free_slot == 0\0"
.LC6:
	.ascii "PASSED\0"
	.text
	.globl	test_vector_init
	.def	test_vector_init;	.scl	2;	.type	32;	.endef
	.seh_proc	test_vector_init
test_vector_init:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_init
	movq	-32(%rbp), %rax
	testq	%rax, %rax
	je	.L45
	leaq	.LC1(%rip), %r9
	leaq	__func__.8(%rip), %r8
	movl	$157, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L45:
	movq	-24(%rbp), %rax
	testq	%rax, %rax
	je	.L46
	leaq	.LC3(%rip), %r9
	leaq	__func__.8(%rip), %r8
	movl	$158, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L46:
	movq	-16(%rbp), %rax
	testq	%rax, %rax
	je	.L47
	leaq	.LC4(%rip), %r9
	leaq	__func__.8(%rip), %r8
	movl	$159, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L47:
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L48
	leaq	.LC5(%rip), %r9
	leaq	__func__.8(%rip), %r8
	movl	$160, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L48:
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Testing vector_push and vector_pop... \0"
.LC8:
	.ascii "vector_push(&v, &data1) == 0\0"
.LC9:
	.ascii "vector_used(&v) == 1\0"
.LC10:
	.ascii "vector_push(&v, &data2) == 1\0"
.LC11:
	.ascii "vector_used(&v) == 2\0"
.LC12:
	.ascii "vector_push(&v, &data3) == 2\0"
.LC13:
	.ascii "vector_used(&v) == 3\0"
.LC14:
	.ascii "vector_pop(&v) == &data3\0"
.LC15:
	.ascii "vector_pop(&v) == &data2\0"
.LC16:
	.ascii "vector_pop(&v) == &data1\0"
.LC17:
	.ascii "vector_used(&v) == 0\0"
.LC18:
	.ascii "vector_pop(&v) == NULL\0"
	.text
	.globl	test_vector_push_pop
	.def	test_vector_push_pop;	.scl	2;	.type	32;	.endef
	.seh_proc	test_vector_push_pop
test_vector_push_pop:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_init
	movl	$42, -36(%rbp)
	movl	$84, -40(%rbp)
	movl	$126, -44(%rbp)
	leaq	-36(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	testl	%eax, %eax
	je	.L50
	leaq	.LC8(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$172, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L50:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_used
	cmpq	$1, %rax
	je	.L51
	leaq	.LC9(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$173, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L51:
	leaq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	cmpl	$1, %eax
	je	.L52
	leaq	.LC10(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$175, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L52:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_used
	cmpq	$2, %rax
	je	.L53
	leaq	.LC11(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$176, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L53:
	leaq	-44(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	cmpl	$2, %eax
	je	.L54
	leaq	.LC12(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$178, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L54:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_used
	cmpq	$3, %rax
	je	.L55
	leaq	.LC13(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$179, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L55:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_pop
	leaq	-44(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L56
	leaq	.LC14(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$181, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L56:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_used
	cmpq	$2, %rax
	je	.L57
	leaq	.LC11(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$182, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L57:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_pop
	leaq	-40(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L58
	leaq	.LC15(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$184, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L58:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_used
	cmpq	$1, %rax
	je	.L59
	leaq	.LC9(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$185, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L59:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_pop
	leaq	-36(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L60
	leaq	.LC16(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$187, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L60:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_used
	testq	%rax, %rax
	je	.L61
	leaq	.LC17(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$188, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L61:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_pop
	testq	%rax, %rax
	je	.L62
	leaq	.LC18(%rip), %r9
	leaq	__func__.7(%rip), %r8
	movl	$190, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L62:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC19:
	.ascii "Testing vector_get_at... \0"
	.align 8
.LC20:
	.ascii "vector_get_at(&v, 0) == &data1\0"
	.align 8
.LC21:
	.ascii "*(int *) vector_get_at(&v, 0) == 10\0"
	.align 8
.LC22:
	.ascii "vector_get_at(&v, 1) == &data2\0"
	.align 8
.LC23:
	.ascii "*(int *) vector_get_at(&v, 1) == 20\0"
	.align 8
.LC24:
	.ascii "vector_get_at(&v, 2) == &data3\0"
	.align 8
.LC25:
	.ascii "*(int *) vector_get_at(&v, 2) == 30\0"
.LC26:
	.ascii "vector_get_at(&v, 3) == NULL\0"
	.align 8
.LC27:
	.ascii "vector_get_at(&v, 100) == NULL\0"
	.text
	.globl	test_vector_get_at
	.def	test_vector_get_at;	.scl	2;	.type	32;	.endef
	.seh_proc	test_vector_get_at
test_vector_get_at:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	leaq	.LC19(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_init
	movl	$10, -36(%rbp)
	movl	$20, -40(%rbp)
	movl	$30, -44(%rbp)
	leaq	-36(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-44(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-32(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	vector_get_at
	leaq	-36(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L64
	leaq	.LC20(%rip), %r9
	leaq	__func__.6(%rip), %r8
	movl	$208, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L64:
	leaq	-32(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	vector_get_at
	movl	(%rax), %eax
	cmpl	$10, %eax
	je	.L65
	leaq	.LC21(%rip), %r9
	leaq	__func__.6(%rip), %r8
	movl	$209, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L65:
	leaq	-32(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	vector_get_at
	leaq	-40(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L66
	leaq	.LC22(%rip), %r9
	leaq	__func__.6(%rip), %r8
	movl	$211, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L66:
	leaq	-32(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	vector_get_at
	movl	(%rax), %eax
	cmpl	$20, %eax
	je	.L67
	leaq	.LC23(%rip), %r9
	leaq	__func__.6(%rip), %r8
	movl	$212, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L67:
	leaq	-32(%rbp), %rax
	movl	$2, %edx
	movq	%rax, %rcx
	call	vector_get_at
	leaq	-44(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L68
	leaq	.LC24(%rip), %r9
	leaq	__func__.6(%rip), %r8
	movl	$214, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L68:
	leaq	-32(%rbp), %rax
	movl	$2, %edx
	movq	%rax, %rcx
	call	vector_get_at
	movl	(%rax), %eax
	cmpl	$30, %eax
	je	.L69
	leaq	.LC25(%rip), %r9
	leaq	__func__.6(%rip), %r8
	movl	$215, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L69:
	leaq	-32(%rbp), %rax
	movl	$3, %edx
	movq	%rax, %rcx
	call	vector_get_at
	testq	%rax, %rax
	je	.L70
	leaq	.LC26(%rip), %r9
	leaq	__func__.6(%rip), %r8
	movl	$217, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L70:
	leaq	-32(%rbp), %rax
	movl	$100, %edx
	movq	%rax, %rcx
	call	vector_get_at
	testq	%rax, %rax
	je	.L71
	leaq	.LC27(%rip), %r9
	leaq	__func__.6(%rip), %r8
	movl	$218, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L71:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC28:
	.ascii "Testing vector_delete_at... \0"
.LC29:
	.ascii "v.free_slot == 1\0"
.LC30:
	.ascii "vector_get_at(&v, 1) == NULL\0"
.LC31:
	.ascii "vector_push(&v, &data4) == 1\0"
	.align 8
.LC32:
	.ascii "vector_get_at(&v, 1) == &data4\0"
	.align 8
.LC33:
	.ascii "*(int *) vector_get_at(&v, 1) == 400\0"
	.text
	.globl	test_vector_delete_at
	.def	test_vector_delete_at;	.scl	2;	.type	32;	.endef
	.seh_proc	test_vector_delete_at
test_vector_delete_at:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	leaq	.LC28(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_init
	movl	$100, -36(%rbp)
	movl	$200, -40(%rbp)
	movl	$300, -44(%rbp)
	movl	$400, -48(%rbp)
	leaq	-36(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-44(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-32(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	vector_delete_at
	movq	-8(%rbp), %rax
	cmpq	$1, %rax
	je	.L73
	leaq	.LC29(%rip), %r9
	leaq	__func__.5(%rip), %r8
	movl	$237, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L73:
	leaq	-32(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	vector_get_at
	testq	%rax, %rax
	je	.L74
	leaq	.LC30(%rip), %r9
	leaq	__func__.5(%rip), %r8
	movl	$238, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L74:
	leaq	-48(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	cmpl	$1, %eax
	je	.L75
	leaq	.LC31(%rip), %r9
	leaq	__func__.5(%rip), %r8
	movl	$241, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L75:
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	je	.L76
	leaq	.LC5(%rip), %r9
	leaq	__func__.5(%rip), %r8
	movl	$242, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L76:
	leaq	-32(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	vector_get_at
	leaq	-48(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L77
	leaq	.LC32(%rip), %r9
	leaq	__func__.5(%rip), %r8
	movl	$243, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L77:
	leaq	-32(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	vector_get_at
	movl	(%rax), %eax
	cmpl	$400, %eax
	je	.L78
	leaq	.LC33(%rip), %r9
	leaq	__func__.5(%rip), %r8
	movl	$244, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L78:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC34:
	.ascii "Testing vector_for_each... \0"
.LC35:
	.ascii "counter == 3\0"
	.text
	.globl	test_vector_for_each
	.def	test_vector_for_each;	.scl	2;	.type	32;	.endef
	.seh_proc	test_vector_for_each
test_vector_for_each:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	leaq	.LC34(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_init
	movl	$1, -36(%rbp)
	movl	$2, -40(%rbp)
	movl	$3, -44(%rbp)
	leaq	-36(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-44(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	movl	$0, -48(%rbp)
	leaq	-48(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %r8
	leaq	test_for_each_callback(%rip), %rdx
	movq	%rax, %rcx
	call	vector_for_each
	movl	-48(%rbp), %eax
	cmpl	$3, %eax
	je	.L80
	leaq	.LC35(%rip), %r9
	leaq	__func__.4(%rip), %r8
	movl	$264, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L80:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC36:
	.ascii "Testing vector_delete_all... \0"
	.text
	.globl	test_vector_delete_all
	.def	test_vector_delete_all;	.scl	2;	.type	32;	.endef
	.seh_proc	test_vector_delete_all
test_vector_delete_all:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	leaq	.LC36(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_init
	movl	$10, -36(%rbp)
	movl	$20, -40(%rbp)
	movl	$30, -44(%rbp)
	leaq	-36(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-44(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_used
	cmpq	$3, %rax
	je	.L82
	leaq	.LC13(%rip), %r9
	leaq	__func__.3(%rip), %r8
	movl	$282, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L82:
	leaq	-32(%rbp), %rax
	leaq	test_delete_callback(%rip), %rdx
	movq	%rax, %rcx
	call	vector_delete_all
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_used
	testq	%rax, %rax
	je	.L83
	leaq	.LC17(%rip), %r9
	leaq	__func__.3(%rip), %r8
	movl	$285, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L83:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_pop
	testq	%rax, %rax
	je	.L84
	leaq	.LC18(%rip), %r9
	leaq	__func__.3(%rip), %r8
	movl	$286, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L84:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC37:
	.ascii "Testing vector automatic resize... \0"
.LC38:
	.ascii "vector_used(&v) == 100\0"
.LC39:
	.ascii "v.size >= 100\0"
	.align 8
.LC40:
	.ascii "(intptr_t) vector_get_at(&v, i) == i\0"
	.text
	.globl	test_vector_resize
	.def	test_vector_resize;	.scl	2;	.type	32;	.endef
	.seh_proc	test_vector_resize
test_vector_resize:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	leaq	.LC37(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_init
	movl	$0, -4(%rbp)
	jmp	.L86
.L87:
	movl	-4(%rbp), %eax
	cltq
	movq	%rax, %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	addl	$1, -4(%rbp)
.L86:
	cmpl	$99, -4(%rbp)
	jle	.L87
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_used
	cmpq	$100, %rax
	je	.L88
	leaq	.LC38(%rip), %r9
	leaq	__func__.2(%rip), %r8
	movl	$302, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L88:
	movq	-40(%rbp), %rax
	cmpq	$99, %rax
	ja	.L89
	leaq	.LC39(%rip), %r9
	leaq	__func__.2(%rip), %r8
	movl	$303, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L89:
	movl	$0, -8(%rbp)
	jmp	.L90
.L92:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_get_at
	movq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	cmpq	%rax, %rdx
	je	.L91
	leaq	.LC40(%rip), %r9
	leaq	__func__.2(%rip), %r8
	movl	$307, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L91:
	addl	$1, -8(%rbp)
.L90:
	cmpl	$99, -8(%rbp)
	jle	.L92
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC41:
	.ascii "Testing vector_get_end... \0"
.LC42:
	.ascii "vector_get_end(&v) == NULL\0"
.LC43:
	.ascii "vector_get_end(&v) == &data1\0"
.LC44:
	.ascii "vector_get_end(&v) == &data2\0"
.LC45:
	.ascii "vector_get_end(&v) == &data3\0"
	.text
	.globl	test_vector_get_end
	.def	test_vector_get_end;	.scl	2;	.type	32;	.endef
	.seh_proc	test_vector_get_end
test_vector_get_end:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	leaq	.LC41(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_init
	movl	$111, -36(%rbp)
	movl	$222, -40(%rbp)
	movl	$333, -44(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_get_end
	testq	%rax, %rax
	je	.L94
	leaq	.LC42(%rip), %r9
	leaq	__func__.1(%rip), %r8
	movl	$321, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L94:
	leaq	-36(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_get_end
	leaq	-36(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L95
	leaq	.LC43(%rip), %r9
	leaq	__func__.1(%rip), %r8
	movl	$324, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L95:
	leaq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_get_end
	leaq	-40(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L96
	leaq	.LC44(%rip), %r9
	leaq	__func__.1(%rip), %r8
	movl	$327, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L96:
	leaq	-44(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_get_end
	leaq	-44(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L97
	leaq	.LC45(%rip), %r9
	leaq	__func__.1(%rip), %r8
	movl	$330, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L97:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC46:
	.ascii "Testing vector_set_at... \0"
	.align 8
.LC47:
	.ascii "vector_set_at(&v, 1, &data4) == &data4\0"
	.align 8
.LC48:
	.ascii "vector_used(&v) == initial_size\0"
	.align 8
.LC49:
	.ascii "vector_set_at(&v, 10, &data4) == NULL\0"
	.text
	.globl	test_vector_set_at
	.def	test_vector_set_at;	.scl	2;	.type	32;	.endef
	.seh_proc	test_vector_set_at
test_vector_set_at:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	leaq	.LC46(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_init
	movl	$1, -52(%rbp)
	movl	$2, -56(%rbp)
	movl	$3, -60(%rbp)
	movl	$999, -64(%rbp)
	leaq	-52(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-56(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-60(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_push
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_used
	movq	%rax, -8(%rbp)
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %r8
	movl	$1, %edx
	movq	%rax, %rcx
	call	vector_set_at
	leaq	-64(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L99
	leaq	.LC47(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$349, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L99:
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_used
	cmpq	%rax, -8(%rbp)
	je	.L100
	leaq	.LC48(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$350, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L100:
	leaq	-48(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	vector_get_at
	leaq	-64(%rbp), %rdx
	cmpq	%rdx, %rax
	je	.L101
	leaq	.LC32(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$351, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L101:
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %r8
	movl	$10, %edx
	movq	%rax, %rcx
	call	vector_set_at
	testq	%rax, %rax
	je	.L102
	leaq	.LC49(%rip), %r9
	leaq	__func__.0(%rip), %r8
	movl	$353, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	__assert_func
.L102:
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	vector_free
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC50:
	.ascii "=== Running Vector Tests ===\0"
.LC51:
	.ascii "\12=== All Tests Passed ===\0"
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
	leaq	.LC50(%rip), %rax
	movq	%rax, %rcx
	call	puts
	call	test_vector_init
	call	test_vector_push_pop
	call	test_vector_get_at
	call	test_vector_delete_at
	call	test_vector_for_each
	call	test_vector_delete_all
	call	test_vector_resize
	call	test_vector_get_end
	call	test_vector_set_at
	leaq	.LC51(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 16
__func__.8:
	.ascii "test_vector_init\0"
	.align 16
__func__.7:
	.ascii "test_vector_push_pop\0"
	.align 16
__func__.6:
	.ascii "test_vector_get_at\0"
	.align 16
__func__.5:
	.ascii "test_vector_delete_at\0"
	.align 16
__func__.4:
	.ascii "test_vector_for_each\0"
	.align 16
__func__.3:
	.ascii "test_vector_delete_all\0"
	.align 16
__func__.2:
	.ascii "test_vector_resize\0"
	.align 16
__func__.1:
	.ascii "test_vector_get_end\0"
	.align 16
__func__.0:
	.ascii "test_vector_set_at\0"
	.ident	"GCC: (GNU) 11.4.0"
	.def	calloc;	.scl	2;	.type	32;	.endef
	.def	realloc;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	__assert_func;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
