	.file	"simplesync.c"
	.text
.Ltext0:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"About to increase variable %d times\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Done increasing variable.\n"
	.text
	.p2align 4
	.globl	increase_fn
	.type	increase_fn, @function
increase_fn:
.LVL0:
.LFB51:
	.file 1 "simplesync.c"
	.loc 1 42 1 view -0
	.cfi_startproc
	.loc 1 42 1 is_stmt 0 view .LVU1
	endbr64
	.loc 1 43 2 is_stmt 1 view .LVU2
	.loc 1 44 2 view .LVU3
	.loc 1 42 1 is_stmt 0 view .LVU4
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 42 1 view .LVU5
	movq	%rdi, %rbx
.LVL1:
	.loc 1 46 2 is_stmt 1 view .LVU6
.LBB12:
.LBI12:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 98 1 view .LVU7
.LBB13:
	.loc 2 100 3 view .LVU8
	.loc 2 100 10 is_stmt 0 view .LVU9
	movq	stderr(%rip), %rdi
.LVL2:
	.loc 2 100 10 view .LVU10
	movl	$10000000, %ecx
	leaq	.LC0(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.LVL3:
	.loc 2 100 10 view .LVU11
.LBE13:
.LBE12:
	.loc 1 47 2 is_stmt 1 view .LVU12
	.loc 1 47 14 view .LVU13
.LBB15:
.LBB14:
	.loc 2 100 10 is_stmt 0 view .LVU14
	movl	$10000000, %eax
.LVL4:
	.p2align 4,,10
	.p2align 3
.L2:
	.loc 2 100 10 view .LVU15
.LBE14:
.LBE15:
	.loc 1 48 3 is_stmt 1 view .LVU16
	.loc 1 51 4 view .LVU17
	lock addl	$1, (%rbx)
	.loc 1 47 21 view .LVU18
.LVL5:
	.loc 1 47 14 view .LVU19
	.loc 1 47 2 is_stmt 0 view .LVU20
	subl	$1, %eax
.LVL6:
	.loc 1 47 2 view .LVU21
	jne	.L2
	.loc 1 70 2 is_stmt 1 view .LVU22
.LVL7:
.LBB16:
.LBI16:
	.loc 2 98 1 view .LVU23
.LBB17:
	.loc 2 100 3 view .LVU24
	.loc 2 100 10 is_stmt 0 view .LVU25
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rdi
	call	fwrite@PLT
.LVL8:
	.loc 2 100 10 view .LVU26
.LBE17:
.LBE16:
	.loc 1 72 2 is_stmt 1 view .LVU27
	.loc 1 73 1 is_stmt 0 view .LVU28
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL9:
	.loc 1 73 1 view .LVU29
	ret
	.cfi_endproc
.LFE51:
	.size	increase_fn, .-increase_fn
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"About to decrease variable %d times\n"
	.section	.rodata.str1.1
.LC3:
	.string	"Done decreasing variable.\n"
	.text
	.p2align 4
	.globl	decrease_fn
	.type	decrease_fn, @function
decrease_fn:
.LVL10:
.LFB52:
	.loc 1 76 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 76 1 is_stmt 0 view .LVU31
	endbr64
	.loc 1 77 2 is_stmt 1 view .LVU32
	.loc 1 78 2 view .LVU33
	.loc 1 76 1 is_stmt 0 view .LVU34
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 76 1 view .LVU35
	movq	%rdi, %rbx
.LVL11:
	.loc 1 80 2 is_stmt 1 view .LVU36
.LBB18:
.LBI18:
	.loc 2 98 1 view .LVU37
.LBB19:
	.loc 2 100 3 view .LVU38
	.loc 2 100 10 is_stmt 0 view .LVU39
	movq	stderr(%rip), %rdi
.LVL12:
	.loc 2 100 10 view .LVU40
	movl	$10000000, %ecx
	leaq	.LC2(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.LVL13:
	.loc 2 100 10 view .LVU41
.LBE19:
.LBE18:
	.loc 1 81 2 is_stmt 1 view .LVU42
	.loc 1 81 14 view .LVU43
.LBB21:
.LBB20:
	.loc 2 100 10 is_stmt 0 view .LVU44
	movl	$10000000, %eax
.LVL14:
	.p2align 4,,10
	.p2align 3
.L7:
	.loc 2 100 10 view .LVU45
.LBE20:
.LBE21:
	.loc 1 82 3 is_stmt 1 view .LVU46
	.loc 1 85 4 view .LVU47
	lock subl	$1, (%rbx)
	.loc 1 81 21 view .LVU48
.LVL15:
	.loc 1 81 14 view .LVU49
	.loc 1 81 2 is_stmt 0 view .LVU50
	subl	$1, %eax
.LVL16:
	.loc 1 81 2 view .LVU51
	jne	.L7
	.loc 1 104 2 is_stmt 1 view .LVU52
.LVL17:
.LBB22:
.LBI22:
	.loc 2 98 1 view .LVU53
.LBB23:
	.loc 2 100 3 view .LVU54
	.loc 2 100 10 is_stmt 0 view .LVU55
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
.LVL18:
	.loc 2 100 10 view .LVU56
.LBE23:
.LBE22:
	.loc 1 106 2 is_stmt 1 view .LVU57
	.loc 1 107 1 is_stmt 0 view .LVU58
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL19:
	.loc 1 107 1 view .LVU59
	ret
	.cfi_endproc
.LFE52:
	.size	decrease_fn, .-decrease_fn
	.section	.rodata.str1.1
.LC4:
	.string	""
.LC5:
	.string	"NOT "
.LC6:
	.string	"pthread_create"
.LC7:
	.string	"pthread_join"
.LC8:
	.string	"%sOK, val = %d.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LVL20:
.LFB53:
	.loc 1 111 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 111 1 is_stmt 0 view .LVU61
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	.loc 1 123 8 view .LVU62
	xorl	%esi, %esi
.LVL21:
	.loc 1 123 8 view .LVU63
	leaq	increase_fn(%rip), %rdx
	.loc 1 111 1 view .LVU64
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 111 1 view .LVU65
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	.loc 1 112 2 is_stmt 1 view .LVU66
	.loc 1 113 2 view .LVU67
	.loc 1 118 2 view .LVU68
	.loc 1 123 8 is_stmt 0 view .LVU69
	leaq	4(%rsp), %r12
	leaq	8(%rsp), %rdi
.LVL22:
	.loc 1 118 6 view .LVU70
	movl	$0, 4(%rsp)
	.loc 1 123 2 is_stmt 1 view .LVU71
	.loc 1 123 8 is_stmt 0 view .LVU72
	movq	%r12, %rcx
	call	pthread_create@PLT
.LVL23:
	.loc 1 124 2 is_stmt 1 view .LVU73
	.loc 1 124 5 is_stmt 0 view .LVU74
	testl	%eax, %eax
	jne	.L26
	.loc 1 128 2 is_stmt 1 view .LVU75
	.loc 1 128 8 is_stmt 0 view .LVU76
	leaq	16(%rsp), %rdi
	movq	%r12, %rcx
	leaq	decrease_fn(%rip), %rdx
	xorl	%esi, %esi
	call	pthread_create@PLT
.LVL24:
	.loc 1 128 8 view .LVU77
	movl	%eax, %ebx
.LVL25:
	.loc 1 129 2 is_stmt 1 view .LVU78
	.loc 1 129 5 is_stmt 0 view .LVU79
	testl	%eax, %eax
	jne	.L25
	.loc 1 137 2 is_stmt 1 view .LVU80
	.loc 1 137 8 is_stmt 0 view .LVU81
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL26:
	.loc 1 137 8 view .LVU82
	movl	%eax, %ebx
.LVL27:
	.loc 1 138 2 is_stmt 1 view .LVU83
	.loc 1 138 5 is_stmt 0 view .LVU84
	testl	%eax, %eax
	jne	.L27
.LVL28:
.L13:
	.loc 1 139 3 is_stmt 1 discriminator 1 view .LVU85
	.loc 1 140 2 discriminator 1 view .LVU86
	.loc 1 140 8 is_stmt 0 discriminator 1 view .LVU87
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL29:
	movl	%eax, %ebx
.LVL30:
	.loc 1 141 2 is_stmt 1 discriminator 1 view .LVU88
	.loc 1 141 5 is_stmt 0 discriminator 1 view .LVU89
	testl	%eax, %eax
	jne	.L28
.LVL31:
.L14:
	.loc 1 142 3 is_stmt 1 discriminator 1 view .LVU90
	.loc 1 147 2 discriminator 1 view .LVU91
	.loc 1 147 12 is_stmt 0 discriminator 1 view .LVU92
	movl	4(%rsp), %ecx
	xorl	%r12d, %r12d
	.loc 1 149 2 discriminator 1 view .LVU93
	leaq	.LC5(%rip), %rax
	leaq	.LC4(%rip), %rdx
.LBB24:
.LBB25:
	.loc 2 107 10 discriminator 1 view .LVU94
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
.LBE25:
.LBE24:
	.loc 1 147 12 discriminator 1 view .LVU95
	testl	%ecx, %ecx
	.loc 1 149 2 discriminator 1 view .LVU96
	cmovne	%rax, %rdx
	.loc 1 147 12 discriminator 1 view .LVU97
	sete	%r12b
.LVL32:
	.loc 1 149 2 is_stmt 1 discriminator 1 view .LVU98
.LBB27:
.LBI24:
	.loc 2 105 1 discriminator 1 view .LVU99
.LBB26:
	.loc 2 107 3 discriminator 1 view .LVU100
	.loc 2 107 10 is_stmt 0 discriminator 1 view .LVU101
	xorl	%eax, %eax
	call	__printf_chk@PLT
.LVL33:
	.loc 2 107 10 discriminator 1 view .LVU102
.LBE26:
.LBE27:
	.loc 1 151 2 is_stmt 1 discriminator 1 view .LVU103
	.loc 1 152 1 is_stmt 0 discriminator 1 view .LVU104
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L29
	.loc 1 152 1 view .LVU105
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
.LVL34:
	.loc 1 152 1 view .LVU106
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL35:
	.loc 1 152 1 view .LVU107
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.LVL36:
.L27:
	.cfi_restore_state
	.loc 1 139 3 is_stmt 1 view .LVU108
	.loc 1 139 3 view .LVU109
	call	__errno_location@PLT
.LVL37:
	.loc 1 139 3 is_stmt 0 view .LVU110
	leaq	.LC7(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 139 3 is_stmt 1 view .LVU111
	call	perror@PLT
.LVL38:
	jmp	.L13
.LVL39:
.L28:
	.loc 1 142 3 view .LVU112
	.loc 1 142 3 view .LVU113
	call	__errno_location@PLT
.LVL40:
	.loc 1 142 3 is_stmt 0 view .LVU114
	leaq	.LC7(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 142 3 is_stmt 1 view .LVU115
	call	perror@PLT
.LVL41:
	jmp	.L14
.LVL42:
.L26:
	.loc 1 142 3 is_stmt 0 view .LVU116
	movl	%eax, %ebx
	.loc 1 125 3 is_stmt 1 view .LVU117
	.loc 1 125 3 view .LVU118
.LVL43:
.L25:
	.loc 1 130 3 view .LVU119
	.loc 1 130 3 view .LVU120
	call	__errno_location@PLT
.LVL44:
	leaq	.LC6(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 130 3 view .LVU121
	call	perror@PLT
.LVL45:
	.loc 1 130 3 view .LVU122
	.loc 1 131 3 view .LVU123
	movl	$1, %edi
	call	exit@PLT
.LVL46:
.L29:
	.loc 1 152 1 is_stmt 0 view .LVU124
	call	__stack_chk_fail@PLT
.LVL47:
	.cfi_endproc
.LFE53:
	.size	main, .-main
	.globl	mutex
	.bss
	.align 32
	.type	mutex, @object
	.size	mutex, 40
mutex:
	.zero	40
	.text
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 12 "/usr/include/unistd.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 14 "/usr/include/time.h"
	.file 15 "/usr/include/pthread.h"
	.file 16 "/usr/include/errno.h"
	.file 17 "/usr/include/stdlib.h"
	.file 18 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9ee
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF106
	.byte	0xc
	.long	.LASF107
	.long	.LASF108
	.long	.Ldebug_ranges0+0x90
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.long	0x35
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.long	0x61
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x98
	.byte	0x19
	.long	0x6d
	.uleb128 0x2
	.long	.LASF9
	.byte	0x4
	.byte	0x99
	.byte	0x1b
	.long	0x6d
	.uleb128 0x7
	.byte	0x8
	.long	0x92
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x8
	.long	0x92
	.uleb128 0x9
	.long	.LASF50
	.byte	0xd8
	.byte	0x5
	.byte	0x31
	.byte	0x8
	.long	0x225
	.uleb128 0xa
	.long	.LASF11
	.byte	0x5
	.byte	0x33
	.byte	0x7
	.long	0x61
	.byte	0
	.uleb128 0xa
	.long	.LASF12
	.byte	0x5
	.byte	0x36
	.byte	0x9
	.long	0x8c
	.byte	0x8
	.uleb128 0xa
	.long	.LASF13
	.byte	0x5
	.byte	0x37
	.byte	0x9
	.long	0x8c
	.byte	0x10
	.uleb128 0xa
	.long	.LASF14
	.byte	0x5
	.byte	0x38
	.byte	0x9
	.long	0x8c
	.byte	0x18
	.uleb128 0xa
	.long	.LASF15
	.byte	0x5
	.byte	0x39
	.byte	0x9
	.long	0x8c
	.byte	0x20
	.uleb128 0xa
	.long	.LASF16
	.byte	0x5
	.byte	0x3a
	.byte	0x9
	.long	0x8c
	.byte	0x28
	.uleb128 0xa
	.long	.LASF17
	.byte	0x5
	.byte	0x3b
	.byte	0x9
	.long	0x8c
	.byte	0x30
	.uleb128 0xa
	.long	.LASF18
	.byte	0x5
	.byte	0x3c
	.byte	0x9
	.long	0x8c
	.byte	0x38
	.uleb128 0xa
	.long	.LASF19
	.byte	0x5
	.byte	0x3d
	.byte	0x9
	.long	0x8c
	.byte	0x40
	.uleb128 0xa
	.long	.LASF20
	.byte	0x5
	.byte	0x40
	.byte	0x9
	.long	0x8c
	.byte	0x48
	.uleb128 0xa
	.long	.LASF21
	.byte	0x5
	.byte	0x41
	.byte	0x9
	.long	0x8c
	.byte	0x50
	.uleb128 0xa
	.long	.LASF22
	.byte	0x5
	.byte	0x42
	.byte	0x9
	.long	0x8c
	.byte	0x58
	.uleb128 0xa
	.long	.LASF23
	.byte	0x5
	.byte	0x44
	.byte	0x16
	.long	0x23e
	.byte	0x60
	.uleb128 0xa
	.long	.LASF24
	.byte	0x5
	.byte	0x46
	.byte	0x14
	.long	0x244
	.byte	0x68
	.uleb128 0xa
	.long	.LASF25
	.byte	0x5
	.byte	0x48
	.byte	0x7
	.long	0x61
	.byte	0x70
	.uleb128 0xa
	.long	.LASF26
	.byte	0x5
	.byte	0x49
	.byte	0x7
	.long	0x61
	.byte	0x74
	.uleb128 0xa
	.long	.LASF27
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.long	0x74
	.byte	0x78
	.uleb128 0xa
	.long	.LASF28
	.byte	0x5
	.byte	0x4d
	.byte	0x12
	.long	0x4c
	.byte	0x80
	.uleb128 0xa
	.long	.LASF29
	.byte	0x5
	.byte	0x4e
	.byte	0xf
	.long	0x53
	.byte	0x82
	.uleb128 0xa
	.long	.LASF30
	.byte	0x5
	.byte	0x4f
	.byte	0x8
	.long	0x24a
	.byte	0x83
	.uleb128 0xa
	.long	.LASF31
	.byte	0x5
	.byte	0x51
	.byte	0xf
	.long	0x25a
	.byte	0x88
	.uleb128 0xa
	.long	.LASF32
	.byte	0x5
	.byte	0x59
	.byte	0xd
	.long	0x80
	.byte	0x90
	.uleb128 0xa
	.long	.LASF33
	.byte	0x5
	.byte	0x5b
	.byte	0x17
	.long	0x265
	.byte	0x98
	.uleb128 0xa
	.long	.LASF34
	.byte	0x5
	.byte	0x5c
	.byte	0x19
	.long	0x270
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF35
	.byte	0x5
	.byte	0x5d
	.byte	0x14
	.long	0x244
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF36
	.byte	0x5
	.byte	0x5e
	.byte	0x9
	.long	0x43
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF37
	.byte	0x5
	.byte	0x5f
	.byte	0xa
	.long	0x29
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF38
	.byte	0x5
	.byte	0x60
	.byte	0x7
	.long	0x61
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF39
	.byte	0x5
	.byte	0x62
	.byte	0x8
	.long	0x276
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x6
	.byte	0x7
	.byte	0x19
	.long	0x9e
	.uleb128 0xb
	.long	.LASF109
	.byte	0x5
	.byte	0x2b
	.byte	0xe
	.uleb128 0xc
	.long	.LASF41
	.uleb128 0x7
	.byte	0x8
	.long	0x239
	.uleb128 0x7
	.byte	0x8
	.long	0x9e
	.uleb128 0xd
	.long	0x92
	.long	0x25a
	.uleb128 0xe
	.long	0x35
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x231
	.uleb128 0xc
	.long	.LASF42
	.uleb128 0x7
	.byte	0x8
	.long	0x260
	.uleb128 0xc
	.long	.LASF43
	.uleb128 0x7
	.byte	0x8
	.long	0x26b
	.uleb128 0xd
	.long	0x92
	.long	0x286
	.uleb128 0xe
	.long	0x35
	.byte	0x13
	.byte	0
	.uleb128 0xf
	.long	.LASF44
	.byte	0x7
	.byte	0x89
	.byte	0xe
	.long	0x292
	.uleb128 0x7
	.byte	0x8
	.long	0x225
	.uleb128 0x10
	.long	0x292
	.uleb128 0xf
	.long	.LASF45
	.byte	0x7
	.byte	0x8a
	.byte	0xe
	.long	0x292
	.uleb128 0xf
	.long	.LASF46
	.byte	0x7
	.byte	0x8b
	.byte	0xe
	.long	0x292
	.uleb128 0xf
	.long	.LASF47
	.byte	0x8
	.byte	0x1a
	.byte	0xc
	.long	0x61
	.uleb128 0xd
	.long	0x2d7
	.long	0x2cc
	.uleb128 0x11
	.byte	0
	.uleb128 0x8
	.long	0x2c1
	.uleb128 0x7
	.byte	0x8
	.long	0x99
	.uleb128 0x8
	.long	0x2d1
	.uleb128 0x10
	.long	0x2d1
	.uleb128 0xf
	.long	.LASF48
	.byte	0x8
	.byte	0x1b
	.byte	0x1a
	.long	0x2cc
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF49
	.uleb128 0x9
	.long	.LASF51
	.byte	0x10
	.byte	0x9
	.byte	0x31
	.byte	0x10
	.long	0x31c
	.uleb128 0xa
	.long	.LASF52
	.byte	0x9
	.byte	0x33
	.byte	0x23
	.long	0x31c
	.byte	0
	.uleb128 0xa
	.long	.LASF53
	.byte	0x9
	.byte	0x34
	.byte	0x23
	.long	0x31c
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x2f4
	.uleb128 0x2
	.long	.LASF54
	.byte	0x9
	.byte	0x35
	.byte	0x3
	.long	0x2f4
	.uleb128 0x9
	.long	.LASF55
	.byte	0x28
	.byte	0xa
	.byte	0x16
	.byte	0x8
	.long	0x3a4
	.uleb128 0xa
	.long	.LASF56
	.byte	0xa
	.byte	0x18
	.byte	0x7
	.long	0x61
	.byte	0
	.uleb128 0xa
	.long	.LASF57
	.byte	0xa
	.byte	0x19
	.byte	0x10
	.long	0x3c
	.byte	0x4
	.uleb128 0xa
	.long	.LASF58
	.byte	0xa
	.byte	0x1a
	.byte	0x7
	.long	0x61
	.byte	0x8
	.uleb128 0xa
	.long	.LASF59
	.byte	0xa
	.byte	0x1c
	.byte	0x10
	.long	0x3c
	.byte	0xc
	.uleb128 0xa
	.long	.LASF60
	.byte	0xa
	.byte	0x20
	.byte	0x7
	.long	0x61
	.byte	0x10
	.uleb128 0xa
	.long	.LASF61
	.byte	0xa
	.byte	0x22
	.byte	0x9
	.long	0x5a
	.byte	0x14
	.uleb128 0xa
	.long	.LASF62
	.byte	0xa
	.byte	0x23
	.byte	0x9
	.long	0x5a
	.byte	0x16
	.uleb128 0xa
	.long	.LASF63
	.byte	0xa
	.byte	0x24
	.byte	0x14
	.long	0x322
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF64
	.uleb128 0x2
	.long	.LASF65
	.byte	0xb
	.byte	0x1b
	.byte	0x1b
	.long	0x35
	.uleb128 0x12
	.byte	0x28
	.byte	0xb
	.byte	0x43
	.byte	0x9
	.long	0x3e5
	.uleb128 0x13
	.long	.LASF66
	.byte	0xb
	.byte	0x45
	.byte	0x1c
	.long	0x32e
	.uleb128 0x13
	.long	.LASF67
	.byte	0xb
	.byte	0x46
	.byte	0x8
	.long	0x3e5
	.uleb128 0x13
	.long	.LASF68
	.byte	0xb
	.byte	0x47
	.byte	0xc
	.long	0x6d
	.byte	0
	.uleb128 0xd
	.long	0x92
	.long	0x3f5
	.uleb128 0xe
	.long	0x35
	.byte	0x27
	.byte	0
	.uleb128 0x2
	.long	.LASF69
	.byte	0xb
	.byte	0x48
	.byte	0x3
	.long	0x3b7
	.uleb128 0x14
	.long	.LASF70
	.byte	0xc
	.value	0x21f
	.byte	0xf
	.long	0x40e
	.uleb128 0x7
	.byte	0x8
	.long	0x8c
	.uleb128 0xf
	.long	.LASF71
	.byte	0xd
	.byte	0x24
	.byte	0xe
	.long	0x8c
	.uleb128 0xf
	.long	.LASF72
	.byte	0xd
	.byte	0x32
	.byte	0xc
	.long	0x61
	.uleb128 0xf
	.long	.LASF73
	.byte	0xd
	.byte	0x37
	.byte	0xc
	.long	0x61
	.uleb128 0xf
	.long	.LASF74
	.byte	0xd
	.byte	0x3b
	.byte	0xc
	.long	0x61
	.uleb128 0xd
	.long	0x8c
	.long	0x454
	.uleb128 0xe
	.long	0x35
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.long	.LASF75
	.byte	0xe
	.byte	0x9f
	.byte	0xe
	.long	0x444
	.uleb128 0xf
	.long	.LASF76
	.byte	0xe
	.byte	0xa0
	.byte	0xc
	.long	0x61
	.uleb128 0xf
	.long	.LASF77
	.byte	0xe
	.byte	0xa1
	.byte	0x11
	.long	0x6d
	.uleb128 0xf
	.long	.LASF78
	.byte	0xe
	.byte	0xa6
	.byte	0xe
	.long	0x444
	.uleb128 0xf
	.long	.LASF79
	.byte	0xe
	.byte	0xae
	.byte	0xc
	.long	0x61
	.uleb128 0xf
	.long	.LASF80
	.byte	0xe
	.byte	0xaf
	.byte	0x11
	.long	0x6d
	.uleb128 0x15
	.byte	0x7
	.byte	0x4
	.long	0x3c
	.byte	0xf
	.byte	0x2c
	.byte	0x1
	.long	0x4db
	.uleb128 0x16
	.long	.LASF81
	.byte	0
	.uleb128 0x16
	.long	.LASF82
	.byte	0x1
	.uleb128 0x16
	.long	.LASF83
	.byte	0x2
	.uleb128 0x16
	.long	.LASF84
	.byte	0x3
	.uleb128 0x16
	.long	.LASF85
	.byte	0
	.uleb128 0x16
	.long	.LASF86
	.byte	0x1
	.uleb128 0x16
	.long	.LASF87
	.byte	0x2
	.uleb128 0x16
	.long	.LASF88
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LASF89
	.byte	0x1
	.byte	0x27
	.byte	0x11
	.long	0x3f5
	.uleb128 0x9
	.byte	0x3
	.quad	mutex
	.uleb128 0x18
	.long	.LASF92
	.byte	0x1
	.byte	0x6e
	.byte	0x5
	.long	0x61
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0x70b
	.uleb128 0x19
	.long	.LASF90
	.byte	0x1
	.byte	0x6e
	.byte	0xe
	.long	0x61
	.long	.LLST10
	.long	.LVUS10
	.uleb128 0x19
	.long	.LASF91
	.byte	0x1
	.byte	0x6e
	.byte	0x1a
	.long	0x40e
	.long	.LLST11
	.long	.LVUS11
	.uleb128 0x1a
	.string	"val"
	.byte	0x1
	.byte	0x70
	.byte	0x6
	.long	0x61
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1b
	.string	"ret"
	.byte	0x1
	.byte	0x70
	.byte	0xb
	.long	0x61
	.long	.LLST12
	.long	.LVUS12
	.uleb128 0x1b
	.string	"ok"
	.byte	0x1
	.byte	0x70
	.byte	0x10
	.long	0x61
	.long	.LLST13
	.long	.LVUS13
	.uleb128 0x1a
	.string	"t1"
	.byte	0x1
	.byte	0x71
	.byte	0xc
	.long	0x3ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1a
	.string	"t2"
	.byte	0x1
	.byte	0x71
	.byte	0x10
	.long	0x3ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.long	0x93d
	.quad	.LBI24
	.byte	.LVU99
	.long	.Ldebug_ranges0+0x60
	.byte	0x1
	.byte	0x95
	.byte	0x2
	.long	0x5d4
	.uleb128 0x1d
	.long	0x94e
	.long	.LLST14
	.long	.LVUS14
	.uleb128 0x1e
	.quad	.LVL33
	.long	0x987
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.byte	0
	.uleb128 0x20
	.quad	.LVL23
	.long	0x993
	.long	0x604
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	increase_fn
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL24
	.long	0x993
	.long	0x634
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	decrease_fn
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL26
	.long	0x99f
	.long	0x64b
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x20
	.quad	.LVL29
	.long	0x99f
	.long	0x662
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x21
	.quad	.LVL37
	.long	0x9ab
	.uleb128 0x20
	.quad	.LVL38
	.long	0x9b7
	.long	0x68e
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.uleb128 0x21
	.quad	.LVL40
	.long	0x9ab
	.uleb128 0x20
	.quad	.LVL41
	.long	0x9b7
	.long	0x6ba
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.uleb128 0x21
	.quad	.LVL44
	.long	0x9ab
	.uleb128 0x20
	.quad	.LVL45
	.long	0x9b7
	.long	0x6e6
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.uleb128 0x20
	.quad	.LVL46
	.long	0x9c4
	.long	0x6fd
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x21
	.quad	.LVL47
	.long	0x9d1
	.byte	0
	.uleb128 0x18
	.long	.LASF93
	.byte	0x1
	.byte	0x4b
	.byte	0x7
	.long	0x43
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.long	0x821
	.uleb128 0x22
	.string	"arg"
	.byte	0x1
	.byte	0x4b
	.byte	0x19
	.long	0x43
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.byte	0x4d
	.byte	0x6
	.long	0x61
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0x23
	.string	"ret"
	.byte	0x1
	.byte	0x4d
	.byte	0x9
	.long	0x61
	.uleb128 0x1b
	.string	"ip"
	.byte	0x1
	.byte	0x4e
	.byte	0x10
	.long	0x821
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x1c
	.long	0x95c
	.quad	.LBI18
	.byte	.LVU37
	.long	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.long	0x7c7
	.uleb128 0x1d
	.long	0x979
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x24
	.long	0x96d
	.uleb128 0x1e
	.quad	.LVL13
	.long	0x9da
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0xc
	.long	0x989680
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	0x95c
	.quad	.LBI22
	.byte	.LVU53
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.uleb128 0x1d
	.long	0x979
	.long	.LLST9
	.long	.LVUS9
	.uleb128 0x24
	.long	0x96d
	.uleb128 0x1e
	.quad	.LVL18
	.long	0x9e6
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x68
	.uleb128 0x18
	.long	.LASF94
	.byte	0x1
	.byte	0x29
	.byte	0x7
	.long	0x43
	.quad	.LFB51
	.quad	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.long	0x93d
	.uleb128 0x22
	.string	"arg"
	.byte	0x1
	.byte	0x29
	.byte	0x19
	.long	0x43
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.byte	0x2b
	.byte	0x6
	.long	0x61
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x23
	.string	"ret"
	.byte	0x1
	.byte	0x2b
	.byte	0x9
	.long	0x61
	.uleb128 0x1b
	.string	"ip"
	.byte	0x1
	.byte	0x2c
	.byte	0x10
	.long	0x821
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x1c
	.long	0x95c
	.quad	.LBI12
	.byte	.LVU7
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x2e
	.byte	0x2
	.long	0x8e3
	.uleb128 0x1d
	.long	0x979
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x24
	.long	0x96d
	.uleb128 0x1e
	.quad	.LVL3
	.long	0x9da
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0xc
	.long	0x989680
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	0x95c
	.quad	.LBI16
	.byte	.LVU23
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.byte	0x1
	.byte	0x46
	.byte	0x2
	.uleb128 0x1d
	.long	0x979
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x24
	.long	0x96d
	.uleb128 0x1e
	.quad	.LVL8
	.long	0x9e6
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.long	.LASF95
	.byte	0x2
	.byte	0x69
	.byte	0x1
	.long	0x61
	.byte	0x3
	.long	0x95c
	.uleb128 0x27
	.long	.LASF97
	.byte	0x2
	.byte	0x69
	.byte	0x20
	.long	0x2dc
	.uleb128 0x28
	.byte	0
	.uleb128 0x26
	.long	.LASF96
	.byte	0x2
	.byte	0x62
	.byte	0x1
	.long	0x61
	.byte	0x3
	.long	0x987
	.uleb128 0x27
	.long	.LASF98
	.byte	0x2
	.byte	0x62
	.byte	0x1b
	.long	0x298
	.uleb128 0x27
	.long	.LASF97
	.byte	0x2
	.byte	0x62
	.byte	0x3c
	.long	0x2dc
	.uleb128 0x28
	.byte	0
	.uleb128 0x29
	.long	.LASF99
	.long	.LASF99
	.byte	0x2
	.byte	0x5a
	.byte	0xc
	.uleb128 0x29
	.long	.LASF100
	.long	.LASF100
	.byte	0xf
	.byte	0xc6
	.byte	0xc
	.uleb128 0x29
	.long	.LASF101
	.long	.LASF101
	.byte	0xf
	.byte	0xd7
	.byte	0xc
	.uleb128 0x29
	.long	.LASF102
	.long	.LASF102
	.byte	0x10
	.byte	0x25
	.byte	0xd
	.uleb128 0x2a
	.long	.LASF103
	.long	.LASF103
	.byte	0x7
	.value	0x307
	.byte	0xd
	.uleb128 0x2a
	.long	.LASF104
	.long	.LASF104
	.byte	0x11
	.value	0x269
	.byte	0xd
	.uleb128 0x2b
	.long	.LASF110
	.long	.LASF110
	.uleb128 0x29
	.long	.LASF105
	.long	.LASF105
	.byte	0x2
	.byte	0x58
	.byte	0xc
	.uleb128 0x2c
	.long	.LASF111
	.long	.LASF112
	.byte	0x12
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS10:
	.uleb128 0
	.uleb128 .LVU70
	.uleb128 .LVU70
	.uleb128 0
.LLST10:
	.quad	.LVL20
	.quad	.LVL22
	.value	0x1
	.byte	0x55
	.quad	.LVL22
	.quad	.LFE53
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS11:
	.uleb128 0
	.uleb128 .LVU63
	.uleb128 .LVU63
	.uleb128 0
.LLST11:
	.quad	.LVL20
	.quad	.LVL21
	.value	0x1
	.byte	0x54
	.quad	.LVL21
	.quad	.LFE53
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS12:
	.uleb128 .LVU73
	.uleb128 .LVU77
	.uleb128 .LVU78
	.uleb128 .LVU82
	.uleb128 .LVU82
	.uleb128 .LVU83
	.uleb128 .LVU83
	.uleb128 .LVU85
	.uleb128 .LVU85
	.uleb128 .LVU88
	.uleb128 .LVU88
	.uleb128 .LVU90
	.uleb128 .LVU90
	.uleb128 .LVU107
	.uleb128 .LVU108
	.uleb128 .LVU110
	.uleb128 .LVU110
	.uleb128 .LVU112
	.uleb128 .LVU112
	.uleb128 .LVU114
	.uleb128 .LVU114
	.uleb128 .LVU116
	.uleb128 .LVU116
	.uleb128 .LVU119
	.uleb128 .LVU124
	.uleb128 0
.LLST12:
	.quad	.LVL23
	.quad	.LVL24-1
	.value	0x1
	.byte	0x50
	.quad	.LVL25
	.quad	.LVL26-1
	.value	0x1
	.byte	0x50
	.quad	.LVL26-1
	.quad	.LVL27
	.value	0x1
	.byte	0x53
	.quad	.LVL27
	.quad	.LVL28
	.value	0x1
	.byte	0x50
	.quad	.LVL28
	.quad	.LVL30
	.value	0x1
	.byte	0x53
	.quad	.LVL30
	.quad	.LVL31
	.value	0x1
	.byte	0x50
	.quad	.LVL31
	.quad	.LVL35
	.value	0x1
	.byte	0x53
	.quad	.LVL36
	.quad	.LVL37-1
	.value	0x1
	.byte	0x50
	.quad	.LVL37-1
	.quad	.LVL39
	.value	0x1
	.byte	0x53
	.quad	.LVL39
	.quad	.LVL40-1
	.value	0x1
	.byte	0x50
	.quad	.LVL40-1
	.quad	.LVL42
	.value	0x1
	.byte	0x53
	.quad	.LVL42
	.quad	.LVL43
	.value	0x1
	.byte	0x50
	.quad	.LVL46
	.quad	.LFE53
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS13:
	.uleb128 .LVU98
	.uleb128 .LVU106
	.uleb128 .LVU106
	.uleb128 .LVU108
	.uleb128 .LVU124
	.uleb128 0
.LLST13:
	.quad	.LVL32
	.quad	.LVL34
	.value	0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.quad	.LVL34
	.quad	.LVL36
	.value	0x1
	.byte	0x50
	.quad	.LVL46
	.quad	.LFE53
	.value	0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS14:
	.uleb128 .LVU99
	.uleb128 .LVU102
.LLST14:
	.quad	.LVL32
	.quad	.LVL33
	.value	0xa
	.byte	0x3
	.quad	.LC8
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS5:
	.uleb128 0
	.uleb128 .LVU40
	.uleb128 .LVU40
	.uleb128 .LVU59
	.uleb128 .LVU59
	.uleb128 0
.LLST5:
	.quad	.LVL10
	.quad	.LVL12
	.value	0x1
	.byte	0x55
	.quad	.LVL12
	.quad	.LVL19
	.value	0x1
	.byte	0x53
	.quad	.LVL19
	.quad	.LFE52
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS6:
	.uleb128 .LVU43
	.uleb128 .LVU45
	.uleb128 .LVU45
	.uleb128 .LVU49
	.uleb128 .LVU49
	.uleb128 .LVU51
	.uleb128 .LVU51
	.uleb128 .LVU56
.LLST6:
	.quad	.LVL13
	.quad	.LVL14
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL14
	.quad	.LVL15
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL15
	.quad	.LVL16
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL16
	.quad	.LVL18-1
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS7:
	.uleb128 .LVU36
	.uleb128 .LVU40
	.uleb128 .LVU40
	.uleb128 .LVU59
	.uleb128 .LVU59
	.uleb128 0
.LLST7:
	.quad	.LVL11
	.quad	.LVL12
	.value	0x1
	.byte	0x55
	.quad	.LVL12
	.quad	.LVL19
	.value	0x1
	.byte	0x53
	.quad	.LVL19
	.quad	.LFE52
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS8:
	.uleb128 .LVU37
	.uleb128 .LVU41
.LLST8:
	.quad	.LVL11
	.quad	.LVL13
	.value	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS9:
	.uleb128 .LVU53
	.uleb128 .LVU56
.LLST9:
	.quad	.LVL17
	.quad	.LVL18
	.value	0xa
	.byte	0x3
	.quad	.LC3
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU10
	.uleb128 .LVU10
	.uleb128 .LVU29
	.uleb128 .LVU29
	.uleb128 0
.LLST0:
	.quad	.LVL0
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LVL9
	.value	0x1
	.byte	0x53
	.quad	.LVL9
	.quad	.LFE51
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS1:
	.uleb128 .LVU13
	.uleb128 .LVU15
	.uleb128 .LVU15
	.uleb128 .LVU19
	.uleb128 .LVU19
	.uleb128 .LVU21
	.uleb128 .LVU21
	.uleb128 .LVU26
.LLST1:
	.quad	.LVL3
	.quad	.LVL4
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL4
	.quad	.LVL5
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL6
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL6
	.quad	.LVL8-1
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS2:
	.uleb128 .LVU6
	.uleb128 .LVU10
	.uleb128 .LVU10
	.uleb128 .LVU29
	.uleb128 .LVU29
	.uleb128 0
.LLST2:
	.quad	.LVL1
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LVL9
	.value	0x1
	.byte	0x53
	.quad	.LVL9
	.quad	.LFE51
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS3:
	.uleb128 .LVU7
	.uleb128 .LVU11
.LLST3:
	.quad	.LVL1
	.quad	.LVL3
	.value	0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS4:
	.uleb128 .LVU23
	.uleb128 .LVU26
.LLST4:
	.quad	.LVL7
	.quad	.LVL8
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB12
	.quad	.LBE12
	.quad	.LBB15
	.quad	.LBE15
	.quad	0
	.quad	0
	.quad	.LBB18
	.quad	.LBE18
	.quad	.LBB21
	.quad	.LBE21
	.quad	0
	.quad	0
	.quad	.LBB24
	.quad	.LBE24
	.quad	.LBB27
	.quad	.LBE27
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB53
	.quad	.LFE53
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF102:
	.string	"__errno_location"
.LASF71:
	.string	"optarg"
.LASF99:
	.string	"__printf_chk"
.LASF50:
	.string	"_IO_FILE"
.LASF47:
	.string	"sys_nerr"
.LASF22:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF32:
	.string	"_offset"
.LASF88:
	.string	"PTHREAD_MUTEX_DEFAULT"
.LASF51:
	.string	"__pthread_internal_list"
.LASF84:
	.string	"PTHREAD_MUTEX_ADAPTIVE_NP"
.LASF92:
	.string	"main"
.LASF16:
	.string	"_IO_write_ptr"
.LASF11:
	.string	"_flags"
.LASF69:
	.string	"pthread_mutex_t"
.LASF57:
	.string	"__count"
.LASF31:
	.string	"_lock"
.LASF70:
	.string	"__environ"
.LASF23:
	.string	"_markers"
.LASF13:
	.string	"_IO_read_end"
.LASF36:
	.string	"_freeres_buf"
.LASF79:
	.string	"daylight"
.LASF52:
	.string	"__prev"
.LASF105:
	.string	"__fprintf_chk"
.LASF12:
	.string	"_IO_read_ptr"
.LASF53:
	.string	"__next"
.LASF91:
	.string	"argv"
.LASF40:
	.string	"FILE"
.LASF46:
	.string	"stderr"
.LASF41:
	.string	"_IO_marker"
.LASF49:
	.string	"long long int"
.LASF101:
	.string	"pthread_join"
.LASF77:
	.string	"__timezone"
.LASF100:
	.string	"pthread_create"
.LASF76:
	.string	"__daylight"
.LASF6:
	.string	"long int"
.LASF80:
	.string	"timezone"
.LASF95:
	.string	"printf"
.LASF28:
	.string	"_cur_column"
.LASF103:
	.string	"perror"
.LASF96:
	.string	"fprintf"
.LASF61:
	.string	"__spins"
.LASF15:
	.string	"_IO_write_base"
.LASF83:
	.string	"PTHREAD_MUTEX_ERRORCHECK_NP"
.LASF104:
	.string	"exit"
.LASF27:
	.string	"_old_offset"
.LASF112:
	.string	"__builtin_fwrite"
.LASF108:
	.string	"/home/george/oslab/ex3"
.LASF2:
	.string	"unsigned char"
.LASF90:
	.string	"argc"
.LASF75:
	.string	"__tzname"
.LASF4:
	.string	"signed char"
.LASF33:
	.string	"_codecvt"
.LASF64:
	.string	"long long unsigned int"
.LASF93:
	.string	"decrease_fn"
.LASF1:
	.string	"unsigned int"
.LASF97:
	.string	"__fmt"
.LASF30:
	.string	"_shortbuf"
.LASF78:
	.string	"tzname"
.LASF39:
	.string	"_unused2"
.LASF73:
	.string	"opterr"
.LASF89:
	.string	"mutex"
.LASF67:
	.string	"__size"
.LASF19:
	.string	"_IO_buf_end"
.LASF66:
	.string	"__data"
.LASF10:
	.string	"char"
.LASF59:
	.string	"__nusers"
.LASF72:
	.string	"optind"
.LASF107:
	.string	"simplesync.c"
.LASF34:
	.string	"_wide_data"
.LASF35:
	.string	"_freeres_list"
.LASF106:
	.string	"GNU C17 9.3.0 -mtune=generic -march=x86-64 -g -O2 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF82:
	.string	"PTHREAD_MUTEX_RECURSIVE_NP"
.LASF37:
	.string	"__pad5"
.LASF56:
	.string	"__lock"
.LASF58:
	.string	"__owner"
.LASF85:
	.string	"PTHREAD_MUTEX_NORMAL"
.LASF3:
	.string	"short unsigned int"
.LASF94:
	.string	"increase_fn"
.LASF55:
	.string	"__pthread_mutex_s"
.LASF111:
	.string	"fwrite"
.LASF0:
	.string	"long unsigned int"
.LASF17:
	.string	"_IO_write_end"
.LASF9:
	.string	"__off64_t"
.LASF62:
	.string	"__elision"
.LASF25:
	.string	"_fileno"
.LASF24:
	.string	"_chain"
.LASF54:
	.string	"__pthread_list_t"
.LASF87:
	.string	"PTHREAD_MUTEX_ERRORCHECK"
.LASF38:
	.string	"_mode"
.LASF81:
	.string	"PTHREAD_MUTEX_TIMED_NP"
.LASF8:
	.string	"__off_t"
.LASF21:
	.string	"_IO_backup_base"
.LASF44:
	.string	"stdin"
.LASF18:
	.string	"_IO_buf_base"
.LASF26:
	.string	"_flags2"
.LASF42:
	.string	"_IO_codecvt"
.LASF14:
	.string	"_IO_read_base"
.LASF63:
	.string	"__list"
.LASF29:
	.string	"_vtable_offset"
.LASF43:
	.string	"_IO_wide_data"
.LASF86:
	.string	"PTHREAD_MUTEX_RECURSIVE"
.LASF20:
	.string	"_IO_save_base"
.LASF48:
	.string	"sys_errlist"
.LASF74:
	.string	"optopt"
.LASF110:
	.string	"__stack_chk_fail"
.LASF60:
	.string	"__kind"
.LASF98:
	.string	"__stream"
.LASF65:
	.string	"pthread_t"
.LASF68:
	.string	"__align"
.LASF45:
	.string	"stdout"
.LASF109:
	.string	"_IO_lock_t"
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
