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
	movq	%rdi, -8(%rbp)    # p1ptr
	movq	%rsi, -16(%rbp)   # p2ptr
	movq	-8(%rbp), %rax    # copy p1ptr to %rax
	movl	(%rax), %ecx      # copy *p1ptr to %ecx
	movq	-16(%rbp), %rax   # copy p2ptr to %rax
	movl	(%rax), %edx      # copy *p2ptr to %edx
	movl	%ecx, %eax        # copy *p1tr to %eax
	subl	%edx, %eax        # *p1ptr - *p2ptr store in %eax (x-magnitude of manhattan distance)
	movl	%eax, %edx        # copy (*p1ptr - *p2ptr) to %edx
	negl	%edx              # negate, algebraically multiply by negative 1 (recall abs)
	cmovns	%edx, %eax        # if difference is non-negative, copy to %eax (recall abs)
	movl	%eax, %ecx        # copy abs(*p1ptr - *p2ptr) to %ecx
	movq	-8(%rbp), %rax    # copy p1ptr to %rax
	movl	4(%rax), %esi     # copy to %esi p1ptr->y
	movq	-16(%rbp), %rax   # copy p2ptr to %rax
	movl	4(%rax), %edx     # copy to %edx p2ptr->y
	movl	%esi, %eax        # copy p1ptr->y to %eax
	subl	%edx, %eax        # (p1ptr->y - p2ptr->y) store in %eax
	movl	%eax, %edx        # copy (p1ptr->y - p2ptr->y) to %edx
	negl	%edx              # negate, algebraically multiply by negative 1 (recall abs)
	cmovns	%edx, %eax        # if difference is non-negative, copy to %eax (recall abs)
	leal	(%rcx,%rax), %esi # put inside %esi the running sum thus far (x and y-magnitudes of manhattan dist)
	movq	-8(%rbp), %rax    # copy p1ptr to %rax
	movl	8(%rax), %ecx     # p1->z inside %ecx
	movq	-16(%rbp), %rax   # copy p2ptr to %rax
	movl	8(%rax), %edx     # p2->z inside %edx
	movl	%ecx, %eax        # copy p1->z to %eax
	subl	%edx, %eax        # p1->z - p2->z inside %eax
	movl	%eax, %edx        # copy to %edx the z difference
	negl	%edx              # negate it (recall abs)
	cmovns	%edx, %eax        # copy to %eax if the value is non-negative (recall abs)
	addl	%esi, %eax        # add it all together, remember %esi held the running sum
	popq	%rbp              # return
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1988:
	.size	_Z13manhattanDistP7Point3DS0_, .-_Z13manhattanDistP7Point3DS0_
	.section	.rodata
	.align 8
.LC0:
	.string	"Invalid value for T! Program terminated!"
	.align 8
.LC1:
	.string	"Invalid value for N! Program terminated!"
	.align 8
.LC2:
	.string	"Invalid value for one or more of the coordinates! Program terminated!"
	.align 8
.LC3:
	.string	"Unexpected extra input after final test case!"
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
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-36(%rbp), %rax
	movq	%rax, %rsi
	leaq	_ZSt3cin(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSirsERi@PLT
	movq	(%rax), %rdx
	subq	$24, %rdx
	movq	(%rdx), %rdx
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	_ZNKSt9basic_iosIcSt11char_traitsIcEEntEv@PLT
	testb	%al, %al
	jne	.L4
	movl	-36(%rbp), %eax
	testl	%eax, %eax
	jg	.L5
.L4:
	movl	$1, %eax
	jmp	.L6
.L5:
	movl	$0, %eax
.L6:
	testb	%al, %al
	je	.L7
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	_ZSt4cerr(%rip), %rax
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	movl	$-1, %eax
	jmp	.L28
.L7:
	movl	$0, -28(%rbp)
	jmp	.L9
.L26:
	cmpl	$0, -28(%rbp)
	jle	.L10
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	leaq	_ZSt4cout(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
.L10:
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	_ZSt3cin(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSirsERi@PLT
	movq	(%rax), %rdx
	subq	$24, %rdx
	movq	(%rdx), %rdx
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	_ZNKSt9basic_iosIcSt11char_traitsIcEEntEv@PLT
	testb	%al, %al
	jne	.L11
	movl	-32(%rbp), %eax
	cmpl	$1, %eax
	jg	.L12
.L11:
	movl	$1, %eax
	jmp	.L13
.L12:
	movl	$0, %eax
.L13:
	testb	%al, %al
	je	.L14
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	_ZSt4cerr(%rip), %rax
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	movl	$-1, %eax
	jmp	.L28
.L14:
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movabsq	$768614336404564650, %rax
	cmpq	%rdx, %rax
	jb	.L16
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	_Znam@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L19
.L16:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	call	__cxa_throw_bad_array_new_length@PLT
.L22:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	_ZSt3cin(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSirsERi@PLT
	movq	%rax, %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	addq	$4, %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	_ZNSirsERi@PLT
	movq	%rax, %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	_ZNSirsERi@PLT
	movq	(%rax), %rdx
	subq	$24, %rdx
	movq	(%rdx), %rdx
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	_ZNKSt9basic_iosIcSt11char_traitsIcEEntEv@PLT
	testb	%al, %al
	je	.L20
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	leaq	_ZSt4cerr(%rip), %rax
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	cmpq	$0, -16(%rbp)
	je	.L21
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdaPv@PLT
.L21:
	movl	$-1, %eax
	jmp	.L28
.L20:
	addl	$1, -24(%rbp)
.L19:
	movl	-32(%rbp), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L22
	movl	$0, -20(%rbp)
	jmp	.L23
.L24:
	movl	-20(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
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
	addl	$1, -20(%rbp)
.L23:
	movl	-32(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -20(%rbp)
	jl	.L24
	cmpq	$0, -16(%rbp)
	je	.L25
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdaPv@PLT
.L25:
	addl	$1, -28(%rbp)
.L9:
	movl	-36(%rbp), %eax
	cmpl	%eax, -28(%rbp)
	jl	.L26
	leaq	16+_ZSt3cin(%rip), %rax
	movq	%rax, %rdi
	call	_ZNKSt9basic_iosIcSt11char_traitsIcEE3eofEv@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L27
	leaq	.LC3(%rip), %rax
	movq	%rax, %rsi
	leaq	_ZSt4cerr(%rip), %rax
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	movl	$-1, %eax
	jmp	.L28
.L27:
	movl	$0, %eax
.L28:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L29
	call	__stack_chk_fail@PLT
.L29:
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
