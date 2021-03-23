	.file	"c-example1.c"
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
	.section	.rodata
	.align 8
.LC0:
	.string	"Book I's name: Harry Potter and the %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	leaq	-112(%rbp), %rdx
	movl	$0, %eax
	movl	$13, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movl	%eax, (%rdx)
	addq	$4, %rdx
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	initI
	leaq	-112(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
