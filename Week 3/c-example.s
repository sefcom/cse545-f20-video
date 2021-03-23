	.file	"c-example.c"
	.text
	.globl	initI
	.type	initI, @function
initI:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	addq	$4, %rax
	movabsq	$8101821177060223056, %rdx
	movabsq	$8382079010421761384, %rcx
	movq	%rdx, (%rax)
	movq	%rcx, 8(%rax)
	movl	$6647407, 16(%rax)
	movq	-8(%rbp), %rax
	addq	$54, %rax
	movabsq	$8606187711097417290, %rsi
	movq	%rsi, (%rax)
	movl	$1735289196, 8(%rax)
	movb	$0, 12(%rax)
	movq	-8(%rbp), %rax
	movl	$223, 104(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	initI, .-initI
	.globl	initII
	.type	initII, @function
initII:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$2, 16(%rbp)
	leaq	20(%rbp), %rax
	movabsq	$2338042629975009347, %rdx
	movabsq	$7310014432013215343, %rcx
	movq	%rdx, (%rax)
	movq	%rcx, 8(%rax)
	movw	$29556, 16(%rax)
	movb	$0, 18(%rax)
	leaq	70(%rbp), %rax
	movabsq	$8606187711097417290, %rsi
	movq	%rsi, (%rax)
	movl	$1735289196, 8(%rax)
	movb	$0, 12(%rax)
	movl	$251, 120(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	initII, .-initII
	.globl	initIII
	.type	initIII, @function
initIII:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$3, (%rax)
	movq	-8(%rbp), %rax
	addq	$4, %rax
	movabsq	$8243116117928276560, %rdx
	movabsq	$7019838864322096928, %rcx
	movq	%rdx, (%rax)
	movq	%rcx, 8(%rax)
	movl	$7233890, 16(%rax)
	movq	-8(%rbp), %rax
	addq	$54, %rax
	movabsq	$8606187711097417290, %rsi
	movq	%rsi, (%rax)
	movl	$1735289196, 8(%rax)
	movb	$0, 12(%rax)
	movq	-8(%rbp), %rax
	movl	$317, 104(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	initIII, .-initIII
	.section	.rodata
	.align 8
.LC0:
	.string	"Book I's name: Harry Potter and the %s\n"
	.align 8
.LC1:
	.string	"Book II's name: Harry Potter and the %s\n"
	.align 8
.LC2:
	.string	"Book III's name: Harry Potter and the %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	initI
	subq	$112, %rsp
	movq	%rsp, %rax
	movq	-128(%rbp), %rdx
	movq	-120(%rbp), %rcx
	movq	%rdx, (%rax)
	movq	%rcx, 8(%rax)
	movq	-112(%rbp), %rdx
	movq	-104(%rbp), %rcx
	movq	%rdx, 16(%rax)
	movq	%rcx, 24(%rax)
	movq	-96(%rbp), %rdx
	movq	-88(%rbp), %rcx
	movq	%rdx, 32(%rax)
	movq	%rcx, 40(%rax)
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rcx
	movq	%rdx, 48(%rax)
	movq	%rcx, 56(%rax)
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movq	%rdx, 64(%rax)
	movq	%rcx, 72(%rax)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	%rdx, 80(%rax)
	movq	%rcx, 88(%rax)
	movq	-32(%rbp), %rdx
	movq	%rdx, 96(%rax)
	movl	-24(%rbp), %edx
	movl	%edx, 104(%rax)
	call	initII
	addq	$112, %rsp
	leaq	-240(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-128(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$108, %edi
	call	malloc@PLT
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	initIII
	movq	-248(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
