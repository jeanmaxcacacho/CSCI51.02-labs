	.file	"Lab5_CacachoFerolZabala_code.cpp"
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.globl	_Z13manhattanDistP7Point3DS0_
	.type	_Z13manhattanDistP7Point3DS0_, @function
_Z13manhattanDistP7Point3DS0_:
.LFB1988:
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
	movl	(%rax), %ecx
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	movl	%eax, %ecx
	movq	-8(%rbp), %rax
	movl	4(%rax), %esi
	movq	-16(%rbp), %rax
	movl	4(%rax), %edx
	movl	%esi, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	leal	(%rcx,%rax), %esi
	movq	-8(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-16(%rbp), %rax
	movl	8(%rax), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	addl	%esi, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1988:
	.size	_Z13manhattanDistP7Point3DS0_, .-_Z13manhattanDistP7Point3DS0_
	.section	.rodata
	.align 8
.LC0:
	.string	"Invalid value for T! Program terminated!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1989:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	-60(%rbp), %rax
	movq	%rax, %rsi
	leaq	_ZSt3cin(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSirsERi@PLT
	leaq	16+_ZSt3cin(%rip), %rax
	movq	%rax, %rdi
	call	_ZNKSt9basic_iosIcSt11char_traitsIcEE4failEv@PLT
	testb	%al, %al
	je	.L4
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	_ZSt4cout(%rip), %rax
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
.L4:
	movl	$0, -52(%rbp)
	jmp	.L5
.L14:
	movq	%rsp, %rax
	movq	%rax, %rbx
	cmpl	$0, -52(%rbp)
	jle	.L6
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	leaq	_ZSt4cout(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
.L6:
	leaq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	_ZSt3cin(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSirsERi@PLT
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rax
	subq	$1, %rax
	movq	%rax, -40(%rbp)
	movslq	%ecx, %rax
	movq	%rax, %rsi
	movl	$0, %edi
	movq	%rsi, %rax
	movq	%rdi, %rdx
	shldq	$1, %rax, %rdx
	addq	%rax, %rax
	addq	%rsi, %rax
	adcq	%rdi, %rdx
	shldq	$5, %rax, %rdx
	salq	$5, %rax
	movslq	%ecx, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movslq	%ecx, %rax
	movq	%rax, %rsi
	movl	$0, %edi
	movq	%rsi, %rax
	movq	%rdi, %rdx
	shldq	$1, %rax, %rdx
	addq	%rax, %rax
	addq	%rsi, %rax
	adcq	%rdi, %rdx
	shldq	$5, %rax, %rdx
	salq	$5, %rax
	movslq	%ecx, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L7:
	cmpq	%rdx, %rsp
	je	.L8
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L7
.L8:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L9
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L9:
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -32(%rbp)
	movl	$0, -48(%rbp)
	jmp	.L10
.L11:
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	-32(%rbp), %rdx
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	_ZSt3cin(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSirsERi@PLT
	movq	%rax, %rcx
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	-32(%rbp), %rdx
	addq	%rdx, %rax
	addq	$4, %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	_ZNSirsERi@PLT
	movq	%rax, %rcx
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	-32(%rbp), %rdx
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	_ZNSirsERi@PLT
	addl	$1, -48(%rbp)
.L10:
	movl	-56(%rbp), %eax
	cmpl	%eax, -48(%rbp)
	jl	.L11
	movl	$0, -44(%rbp)
	jmp	.L12
.L13:
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	-32(%rbp), %rdx
	leaq	(%rax,%rdx), %rcx
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	-32(%rbp), %rdx
	addq	%rdx, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z13manhattanDistP7Point3DS0_
	movl	%eax, %esi
	leaq	_ZSt4cout(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSolsEi@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	addl	$1, -44(%rbp)
.L12:
	movl	-56(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -44(%rbp)
	jl	.L13
	movq	%rbx, %rsp
	addl	$1, -52(%rbp)
.L5:
	movl	-60(%rbp), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L14
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1989:
	.size	main, .-main
	.section	.rodata
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
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
