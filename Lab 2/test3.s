	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_testovf
	.p2align	4, 0x90
_testovf:                               ## @testovf
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
Lcfi3:
	.cfi_offset %rbx, -32
Lcfi4:
	.cfi_offset %r14, -24
	movq	%rdi, %r14
	movabsq	$9223372036854775807, %rdx ## imm = 0x7FFFFFFFFFFFFFFF
	movq	%r14, %rbx
	addq	%rdx, %rbx
	jo	LBB0_1
LBB0_2:
	cmpq	%r14, %rbx
	setl	%al
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB0_1:
	leaq	l___unnamed_1(%rip), %rdi
	movq	%r14, %rsi
	callq	___ubsan_handle_add_overflow
	jmp	LBB0_2
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.src:                                 ## @.src
	.asciz	"test3.c"

	.section	__TEXT,__const
	.p2align	3               ## @0
l___unnamed_2:
	.short	0                       ## 0x0
	.short	13                      ## 0xd
	.asciz	"'long'"
	.space	1

	.section	__DATA,__data
	.p2align	4               ## @1
l___unnamed_1:
	.quad	L_.src
	.long	4                       ## 0x4
	.long	12                      ## 0xc
	.quad	l___unnamed_2


.subsections_via_symbols
