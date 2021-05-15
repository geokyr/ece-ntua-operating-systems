	.file	"simplesync.c"
	.text
.Ltext0:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"About to increase variable %d times\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"sync_add_and_fetch"
.LC2:
	.string	"Done increasing variable.\n"
	.text
	.p2align 4
	.globl	increase_fn
	.type	increase_fn, @function
increase_fn:
.LVL0:
.LFB51:
	.file 1 "simplesync.c"
	.loc 1 43 1 view -0
	.cfi_startproc
	.loc 1 43 1 is_stmt 0 view .LVU1
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
.LBB34:
.LBB35:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 100 10 view .LVU2
	movl	$10000000, %ecx
	movl	$1, %esi
.LBE35:
.LBE34:
	.loc 1 43 1 view .LVU3
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	.loc 1 44 2 is_stmt 1 view .LVU4
	.loc 1 45 2 view .LVU5
	.loc 1 45 16 is_stmt 0 view .LVU6
	movq	%rdi, (%rsp)
	.loc 1 47 2 is_stmt 1 view .LVU7
.LVL1:
.LBB38:
.LBI34:
	.loc 2 98 1 view .LVU8
.LBB36:
	.loc 2 100 3 view .LVU9
	.loc 2 100 10 is_stmt 0 view .LVU10
	movq	stderr(%rip), %rdi
.LVL2:
	.loc 2 100 10 view .LVU11
	leaq	.LC0(%rip), %rdx
	call	__fprintf_chk@PLT
.LVL3:
	.loc 2 100 10 view .LVU12
.LBE36:
.LBE38:
	.loc 1 48 2 is_stmt 1 view .LVU13
	.loc 1 48 14 view .LVU14
.LBB39:
.LBB37:
	.loc 2 100 10 is_stmt 0 view .LVU15
	movl	$10000000, %eax
.LVL4:
	.p2align 4,,10
	.p2align 3
.L3:
	.loc 2 100 10 view .LVU16
.LBE37:
.LBE39:
	.loc 1 49 3 is_stmt 1 view .LVU17
	.loc 1 52 4 view .LVU18
	lock addq	$1, (%rsp)
	.loc 1 53 4 view .LVU19
	.loc 1 53 6 is_stmt 0 view .LVU20
	cmpq	$0, (%rsp)
	je	.L8
	.loc 1 48 21 is_stmt 1 discriminator 2 view .LVU21
.LVL5:
	.loc 1 48 14 discriminator 2 view .LVU22
	.loc 1 48 2 is_stmt 0 discriminator 2 view .LVU23
	subl	$1, %eax
.LVL6:
	.loc 1 48 2 discriminator 2 view .LVU24
	jne	.L3
	.loc 1 77 2 is_stmt 1 view .LVU25
.LVL7:
.LBB40:
.LBI40:
	.loc 2 98 1 view .LVU26
.LBB41:
	.loc 2 100 3 view .LVU27
	.loc 2 100 10 is_stmt 0 view .LVU28
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	fwrite@PLT
.LVL8:
	.loc 2 100 10 view .LVU29
.LBE41:
.LBE40:
	.loc 1 79 2 is_stmt 1 view .LVU30
	.loc 1 80 1 is_stmt 0 view .LVU31
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L9
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL9:
.L8:
	.cfi_restore_state
.LBB42:
.LBI42:
	.loc 1 42 7 is_stmt 1 view .LVU32
.LBB43:
	.loc 1 54 5 view .LVU33
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
.LVL10:
	.loc 1 55 5 view .LVU34
	movl	$1, %edi
	call	exit@PLT
.LVL11:
.L9:
	.loc 1 55 5 is_stmt 0 view .LVU35
.LBE43:
.LBE42:
	.loc 1 80 1 view .LVU36
	call	__stack_chk_fail@PLT
.LVL12:
	.cfi_endproc
.LFE51:
	.size	increase_fn, .-increase_fn
	.section	.rodata.str1.1
.LC3:
	.string	"\n mutex init has failed"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"About to decrease variable %d times\n"
	.section	.rodata.str1.1
.LC5:
	.string	"sync_sub_and_fetch"
.LC6:
	.string	"Done decreasing variable.\n"
	.text
	.p2align 4
	.globl	decrease_fn
	.type	decrease_fn, @function
decrease_fn:
.LVL13:
.LFB52:
	.loc 1 83 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 83 1 is_stmt 0 view .LVU38
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 87 6 view .LVU39
	xorl	%esi, %esi
	.loc 1 83 1 view .LVU40
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	.loc 1 84 2 is_stmt 1 view .LVU41
	.loc 1 85 2 view .LVU42
	.loc 1 85 16 is_stmt 0 view .LVU43
	movq	%rdi, (%rsp)
	.loc 1 87 2 is_stmt 1 view .LVU44
	.loc 1 87 6 is_stmt 0 view .LVU45
	leaq	mutex(%rip), %rdi
.LVL14:
	.loc 1 87 6 view .LVU46
	call	pthread_mutex_init@PLT
.LVL15:
	.loc 1 87 5 view .LVU47
	testl	%eax, %eax
	jne	.L17
	.loc 1 92 2 is_stmt 1 view .LVU48
.LVL16:
.LBB56:
.LBI56:
	.loc 2 98 1 view .LVU49
.LBB57:
	.loc 2 100 3 view .LVU50
	.loc 2 100 10 is_stmt 0 view .LVU51
	movq	stderr(%rip), %rdi
	movl	$10000000, %ecx
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %esi
	call	__fprintf_chk@PLT
.LVL17:
	.loc 2 100 10 view .LVU52
.LBE57:
.LBE56:
	.loc 1 93 2 is_stmt 1 view .LVU53
	.loc 1 93 14 view .LVU54
.LBB59:
.LBB58:
	.loc 2 100 10 is_stmt 0 view .LVU55
	movl	$10000000, %eax
.LVL18:
	.p2align 4,,10
	.p2align 3
.L13:
	.loc 2 100 10 view .LVU56
.LBE58:
.LBE59:
	.loc 1 94 3 is_stmt 1 view .LVU57
	.loc 1 97 4 view .LVU58
	lock addq	$1, (%rsp)
	.loc 1 98 4 view .LVU59
	.loc 1 98 6 is_stmt 0 view .LVU60
	cmpq	$0, (%rsp)
	je	.L18
	.loc 1 93 21 is_stmt 1 discriminator 2 view .LVU61
.LVL19:
	.loc 1 93 14 discriminator 2 view .LVU62
	.loc 1 93 2 is_stmt 0 discriminator 2 view .LVU63
	subl	$1, %eax
.LVL20:
	.loc 1 93 2 discriminator 2 view .LVU64
	jne	.L13
	.loc 1 122 2 is_stmt 1 view .LVU65
.LVL21:
.LBB60:
.LBI60:
	.loc 2 98 1 view .LVU66
.LBB61:
	.loc 2 100 3 view .LVU67
	.loc 2 100 10 is_stmt 0 view .LVU68
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	fwrite@PLT
.LVL22:
	.loc 2 100 10 view .LVU69
.LBE61:
.LBE60:
	.loc 1 124 2 is_stmt 1 view .LVU70
	.loc 1 125 1 is_stmt 0 view .LVU71
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L19
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL23:
.L18:
	.cfi_restore_state
	.loc 1 99 5 is_stmt 1 view .LVU72
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
.LVL24:
	.loc 1 100 5 view .LVU73
	movl	$1, %edi
	call	exit@PLT
.LVL25:
.L17:
.LBB62:
.LBI62:
	.loc 1 82 7 view .LVU74
.LBB63:
	.loc 1 88 9 view .LVU75
.LBB64:
.LBI64:
	.loc 2 105 1 view .LVU76
.LBB65:
	.loc 2 107 3 view .LVU77
	.loc 2 107 10 is_stmt 0 view .LVU78
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
.LVL26:
	.loc 2 107 10 view .LVU79
.LBE65:
.LBE64:
	.loc 1 89 9 is_stmt 1 view .LVU80
	movl	$1, %edi
	call	exit@PLT
.LVL27:
.L19:
	.loc 1 89 9 is_stmt 0 view .LVU81
.LBE63:
.LBE62:
	.loc 1 125 1 view .LVU82
	call	__stack_chk_fail@PLT
.LVL28:
	.cfi_endproc
.LFE52:
	.size	decrease_fn, .-decrease_fn
	.section	.rodata.str1.1
.LC7:
	.string	""
.LC8:
	.string	"NOT "
.LC9:
	.string	"pthread_create"
.LC10:
	.string	"pthread_join"
.LC11:
	.string	"%sOK, val = %d.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LVL29:
.LFB53:
	.loc 1 129 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 129 1 is_stmt 0 view .LVU84
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	.loc 1 141 8 view .LVU85
	xorl	%esi, %esi
.LVL30:
	.loc 1 141 8 view .LVU86
	leaq	increase_fn(%rip), %rdx
	.loc 1 129 1 view .LVU87
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 129 1 view .LVU88
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	.loc 1 130 2 is_stmt 1 view .LVU89
	.loc 1 131 2 view .LVU90
	.loc 1 136 2 view .LVU91
	.loc 1 141 8 is_stmt 0 view .LVU92
	leaq	4(%rsp), %r12
	leaq	8(%rsp), %rdi
.LVL31:
	.loc 1 136 6 view .LVU93
	movl	$0, 4(%rsp)
	.loc 1 141 2 is_stmt 1 view .LVU94
	.loc 1 141 8 is_stmt 0 view .LVU95
	movq	%r12, %rcx
	call	pthread_create@PLT
.LVL32:
	.loc 1 142 2 is_stmt 1 view .LVU96
	.loc 1 142 5 is_stmt 0 view .LVU97
	testl	%eax, %eax
	jne	.L36
	.loc 1 146 2 is_stmt 1 view .LVU98
	.loc 1 146 8 is_stmt 0 view .LVU99
	leaq	16(%rsp), %rdi
	movq	%r12, %rcx
	leaq	decrease_fn(%rip), %rdx
	xorl	%esi, %esi
	call	pthread_create@PLT
.LVL33:
	.loc 1 146 8 view .LVU100
	movl	%eax, %ebx
.LVL34:
	.loc 1 147 2 is_stmt 1 view .LVU101
	.loc 1 147 5 is_stmt 0 view .LVU102
	testl	%eax, %eax
	jne	.L35
	.loc 1 155 2 is_stmt 1 view .LVU103
	.loc 1 155 8 is_stmt 0 view .LVU104
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL35:
	.loc 1 155 8 view .LVU105
	movl	%eax, %ebx
.LVL36:
	.loc 1 156 2 is_stmt 1 view .LVU106
	.loc 1 156 5 is_stmt 0 view .LVU107
	testl	%eax, %eax
	jne	.L37
.LVL37:
.L23:
	.loc 1 157 3 is_stmt 1 discriminator 1 view .LVU108
	.loc 1 158 2 discriminator 1 view .LVU109
	.loc 1 158 8 is_stmt 0 discriminator 1 view .LVU110
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL38:
	movl	%eax, %ebx
.LVL39:
	.loc 1 159 2 is_stmt 1 discriminator 1 view .LVU111
	.loc 1 159 5 is_stmt 0 discriminator 1 view .LVU112
	testl	%eax, %eax
	jne	.L38
.LVL40:
.L24:
	.loc 1 160 3 is_stmt 1 discriminator 1 view .LVU113
	.loc 1 165 2 discriminator 1 view .LVU114
	.loc 1 165 12 is_stmt 0 discriminator 1 view .LVU115
	movl	4(%rsp), %ecx
	xorl	%r12d, %r12d
	.loc 1 167 2 discriminator 1 view .LVU116
	leaq	.LC8(%rip), %rax
	leaq	.LC7(%rip), %rdx
.LBB66:
.LBB67:
	.loc 2 107 10 discriminator 1 view .LVU117
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
.LBE67:
.LBE66:
	.loc 1 165 12 discriminator 1 view .LVU118
	testl	%ecx, %ecx
	.loc 1 167 2 discriminator 1 view .LVU119
	cmovne	%rax, %rdx
	.loc 1 165 12 discriminator 1 view .LVU120
	sete	%r12b
.LVL41:
	.loc 1 167 2 is_stmt 1 discriminator 1 view .LVU121
.LBB69:
.LBI66:
	.loc 2 105 1 discriminator 1 view .LVU122
.LBB68:
	.loc 2 107 3 discriminator 1 view .LVU123
	.loc 2 107 10 is_stmt 0 discriminator 1 view .LVU124
	xorl	%eax, %eax
	call	__printf_chk@PLT
.LVL42:
	.loc 2 107 10 discriminator 1 view .LVU125
.LBE68:
.LBE69:
	.loc 1 169 2 is_stmt 1 discriminator 1 view .LVU126
	.loc 1 170 1 is_stmt 0 discriminator 1 view .LVU127
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L39
	.loc 1 170 1 view .LVU128
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
.LVL43:
	.loc 1 170 1 view .LVU129
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL44:
	.loc 1 170 1 view .LVU130
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.LVL45:
.L37:
	.cfi_restore_state
	.loc 1 157 3 is_stmt 1 view .LVU131
	.loc 1 157 3 view .LVU132
	call	__errno_location@PLT
.LVL46:
	.loc 1 157 3 is_stmt 0 view .LVU133
	leaq	.LC10(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 157 3 is_stmt 1 view .LVU134
	call	perror@PLT
.LVL47:
	jmp	.L23
.LVL48:
.L38:
	.loc 1 160 3 view .LVU135
	.loc 1 160 3 view .LVU136
	call	__errno_location@PLT
.LVL49:
	.loc 1 160 3 is_stmt 0 view .LVU137
	leaq	.LC10(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 160 3 is_stmt 1 view .LVU138
	call	perror@PLT
.LVL50:
	jmp	.L24
.LVL51:
.L36:
	.loc 1 160 3 is_stmt 0 view .LVU139
	movl	%eax, %ebx
	.loc 1 143 3 is_stmt 1 view .LVU140
	.loc 1 143 3 view .LVU141
.LVL52:
.L35:
	.loc 1 148 3 view .LVU142
	.loc 1 148 3 view .LVU143
	call	__errno_location@PLT
.LVL53:
	leaq	.LC9(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 148 3 view .LVU144
	call	perror@PLT
.LVL54:
	.loc 1 148 3 view .LVU145
	.loc 1 149 3 view .LVU146
	movl	$1, %edi
	call	exit@PLT
.LVL55:
.L39:
	.loc 1 170 1 is_stmt 0 view .LVU147
	call	__stack_chk_fail@PLT
.LVL56:
	.cfi_endproc
.LFE53:
	.size	main, .-main
	.comm	mutex,40,32
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
	.long	0xbb3
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF104
	.byte	0xc
	.long	.LASF105
	.long	.LASF106
	.long	.Ldebug_ranges0+0xa0
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
	.long	.LASF107
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
	.long	.LASF81
	.byte	0x1
	.byte	0x28
	.byte	0x11
	.long	0x3f5
	.uleb128 0x9
	.byte	0x3
	.quad	mutex
	.uleb128 0x16
	.long	.LASF108
	.byte	0x1
	.byte	0x80
	.byte	0x5
	.long	0x61
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0x6cc
	.uleb128 0x17
	.long	.LASF82
	.byte	0x1
	.byte	0x80
	.byte	0xe
	.long	0x61
	.long	.LLST11
	.long	.LVUS11
	.uleb128 0x17
	.long	.LASF83
	.byte	0x1
	.byte	0x80
	.byte	0x1a
	.long	0x40e
	.long	.LLST12
	.long	.LVUS12
	.uleb128 0x18
	.string	"val"
	.byte	0x1
	.byte	0x82
	.byte	0x6
	.long	0x61
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x19
	.string	"ret"
	.byte	0x1
	.byte	0x82
	.byte	0xb
	.long	0x61
	.long	.LLST13
	.long	.LVUS13
	.uleb128 0x19
	.string	"ok"
	.byte	0x1
	.byte	0x82
	.byte	0x10
	.long	0x61
	.long	.LLST14
	.long	.LVUS14
	.uleb128 0x18
	.string	"t1"
	.byte	0x1
	.byte	0x83
	.byte	0xc
	.long	0x3ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x18
	.string	"t2"
	.byte	0x1
	.byte	0x83
	.byte	0x10
	.long	0x3ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	0x76c
	.quad	.LBI66
	.byte	.LVU122
	.long	.Ldebug_ranges0+0x70
	.byte	0x1
	.byte	0xa7
	.byte	0x2
	.long	0x595
	.uleb128 0x1b
	.long	0x77d
	.long	.LLST15
	.long	.LVUS15
	.uleb128 0x1c
	.quad	.LVL42
	.long	0xb17
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.byte	0
	.byte	0
	.uleb128 0x1e
	.quad	.LVL32
	.long	0xb23
	.long	0x5c5
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	increase_fn
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.quad	.LVL33
	.long	0xb23
	.long	0x5f5
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	decrease_fn
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.quad	.LVL35
	.long	0xb2f
	.long	0x60c
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1e
	.quad	.LVL38
	.long	0xb2f
	.long	0x623
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1f
	.quad	.LVL46
	.long	0xb3b
	.uleb128 0x1e
	.quad	.LVL47
	.long	0xb47
	.long	0x64f
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.byte	0
	.uleb128 0x1f
	.quad	.LVL49
	.long	0xb3b
	.uleb128 0x1e
	.quad	.LVL50
	.long	0xb47
	.long	0x67b
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.byte	0
	.uleb128 0x1f
	.quad	.LVL53
	.long	0xb3b
	.uleb128 0x1e
	.quad	.LVL54
	.long	0xb47
	.long	0x6a7
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.uleb128 0x1e
	.quad	.LVL55
	.long	0xb54
	.long	0x6be
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1f
	.quad	.LVL56
	.long	0xb61
	.byte	0
	.uleb128 0x20
	.long	.LASF86
	.byte	0x1
	.byte	0x52
	.byte	0x7
	.long	0x43
	.byte	0x1
	.long	0x719
	.uleb128 0x21
	.string	"arg"
	.byte	0x1
	.byte	0x52
	.byte	0x19
	.long	0x43
	.uleb128 0x22
	.string	"i"
	.byte	0x1
	.byte	0x54
	.byte	0x6
	.long	0x61
	.uleb128 0x22
	.string	"ip"
	.byte	0x1
	.byte	0x55
	.byte	0x10
	.long	0x719
	.uleb128 0x23
	.uleb128 0x24
	.long	.LASF84
	.byte	0x1
	.byte	0x6a
	.byte	0x8
	.long	0x61
	.uleb128 0x24
	.long	.LASF85
	.byte	0x1
	.byte	0x73
	.byte	0x8
	.long	0x61
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x68
	.uleb128 0x20
	.long	.LASF87
	.byte	0x1
	.byte	0x2a
	.byte	0x7
	.long	0x43
	.byte	0x1
	.long	0x76c
	.uleb128 0x21
	.string	"arg"
	.byte	0x1
	.byte	0x2a
	.byte	0x19
	.long	0x43
	.uleb128 0x22
	.string	"i"
	.byte	0x1
	.byte	0x2c
	.byte	0x6
	.long	0x61
	.uleb128 0x22
	.string	"ip"
	.byte	0x1
	.byte	0x2d
	.byte	0x10
	.long	0x719
	.uleb128 0x23
	.uleb128 0x24
	.long	.LASF84
	.byte	0x1
	.byte	0x3d
	.byte	0x8
	.long	0x61
	.uleb128 0x24
	.long	.LASF85
	.byte	0x1
	.byte	0x46
	.byte	0x8
	.long	0x61
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.LASF89
	.byte	0x2
	.byte	0x69
	.byte	0x1
	.long	0x61
	.byte	0x3
	.long	0x78b
	.uleb128 0x26
	.long	.LASF88
	.byte	0x2
	.byte	0x69
	.byte	0x20
	.long	0x2dc
	.uleb128 0x27
	.byte	0
	.uleb128 0x25
	.long	.LASF90
	.byte	0x2
	.byte	0x62
	.byte	0x1
	.long	0x61
	.byte	0x3
	.long	0x7b6
	.uleb128 0x26
	.long	.LASF91
	.byte	0x2
	.byte	0x62
	.byte	0x1b
	.long	0x298
	.uleb128 0x26
	.long	.LASF88
	.byte	0x2
	.byte	0x62
	.byte	0x3c
	.long	0x2dc
	.uleb128 0x27
	.byte	0
	.uleb128 0x28
	.long	0x71f
	.quad	.LFB51
	.quad	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.long	0x922
	.uleb128 0x1b
	.long	0x730
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x29
	.long	0x73c
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x2a
	.long	0x746
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	0x78b
	.quad	.LBI34
	.byte	.LVU8
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x2f
	.byte	0x2
	.long	0x848
	.uleb128 0x1b
	.long	0x7a8
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x2b
	.long	0x79c
	.uleb128 0x1c
	.quad	.LVL3
	.long	0xb6a
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0xc
	.long	0x989680
	.byte	0
	.byte	0
	.uleb128 0x2c
	.long	0x78b
	.quad	.LBI40
	.byte	.LVU26
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.byte	0x1
	.byte	0x4d
	.byte	0x2
	.long	0x8a5
	.uleb128 0x1b
	.long	0x7a8
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x2b
	.long	0x79c
	.uleb128 0x1c
	.quad	.LVL8
	.long	0xb76
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.uleb128 0x2c
	.long	0x71f
	.quad	.LBI42
	.byte	.LVU32
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.byte	0x1
	.byte	0x2a
	.byte	0x7
	.long	0x914
	.uleb128 0x1b
	.long	0x730
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x2d
	.long	0x73c
	.uleb128 0x2d
	.long	0x746
	.uleb128 0x1e
	.quad	.LVL10
	.long	0xb47
	.long	0x900
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.byte	0
	.uleb128 0x1c
	.quad	.LVL11
	.long	0xb54
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL12
	.long	0xb61
	.byte	0
	.uleb128 0x28
	.long	0x6cc
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.long	0xb17
	.uleb128 0x1b
	.long	0x6dd
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0x29
	.long	0x6e9
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0x2a
	.long	0x6f3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	0x78b
	.quad	.LBI56
	.byte	.LVU49
	.long	.Ldebug_ranges0+0x40
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.long	0x9b4
	.uleb128 0x1b
	.long	0x7a8
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x2b
	.long	0x79c
	.uleb128 0x1c
	.quad	.LVL17
	.long	0xb6a
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0xc
	.long	0x989680
	.byte	0
	.byte	0
	.uleb128 0x2c
	.long	0x78b
	.quad	.LBI60
	.byte	.LVU66
	.quad	.LBB60
	.quad	.LBE60-.LBB60
	.byte	0x1
	.byte	0x7a
	.byte	0x2
	.long	0xa11
	.uleb128 0x1b
	.long	0x7a8
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x2b
	.long	0x79c
	.uleb128 0x1c
	.quad	.LVL22
	.long	0xb76
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.uleb128 0x2c
	.long	0x6cc
	.quad	.LBI62
	.byte	.LVU74
	.quad	.LBB62
	.quad	.LBE62-.LBB62
	.byte	0x1
	.byte	0x52
	.byte	0x7
	.long	0xaaf
	.uleb128 0x1b
	.long	0x6dd
	.long	.LLST9
	.long	.LVUS9
	.uleb128 0x2d
	.long	0x6e9
	.uleb128 0x2d
	.long	0x6f3
	.uleb128 0x2c
	.long	0x76c
	.quad	.LBI64
	.byte	.LVU76
	.quad	.LBB64
	.quad	.LBE64-.LBB64
	.byte	0x1
	.byte	0x58
	.byte	0x9
	.long	0xa9b
	.uleb128 0x1b
	.long	0x77d
	.long	.LLST10
	.long	.LVUS10
	.uleb128 0x1c
	.quad	.LVL26
	.long	0xb9e
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.byte	0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL27
	.long	0xb54
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x1e
	.quad	.LVL15
	.long	0xba9
	.long	0xad3
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	mutex
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1e
	.quad	.LVL24
	.long	0xb47
	.long	0xaf2
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.byte	0
	.uleb128 0x1e
	.quad	.LVL25
	.long	0xb54
	.long	0xb09
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1f
	.quad	.LVL28
	.long	0xb61
	.byte	0
	.uleb128 0x2e
	.long	.LASF92
	.long	.LASF92
	.byte	0x2
	.byte	0x5a
	.byte	0xc
	.uleb128 0x2e
	.long	.LASF93
	.long	.LASF93
	.byte	0xf
	.byte	0xc6
	.byte	0xc
	.uleb128 0x2e
	.long	.LASF94
	.long	.LASF94
	.byte	0xf
	.byte	0xd7
	.byte	0xc
	.uleb128 0x2e
	.long	.LASF95
	.long	.LASF95
	.byte	0x10
	.byte	0x25
	.byte	0xd
	.uleb128 0x2f
	.long	.LASF96
	.long	.LASF96
	.byte	0x7
	.value	0x307
	.byte	0xd
	.uleb128 0x2f
	.long	.LASF97
	.long	.LASF97
	.byte	0x11
	.value	0x269
	.byte	0xd
	.uleb128 0x30
	.long	.LASF109
	.long	.LASF109
	.uleb128 0x2e
	.long	.LASF98
	.long	.LASF98
	.byte	0x2
	.byte	0x58
	.byte	0xc
	.uleb128 0x31
	.long	.LASF99
	.long	.LASF101
	.byte	0x12
	.byte	0
	.uleb128 0x32
	.uleb128 0x1b
	.byte	0x9e
	.uleb128 0x19
	.byte	0xa
	.byte	0x20
	.byte	0x6d
	.byte	0x75
	.byte	0x74
	.byte	0x65
	.byte	0x78
	.byte	0x20
	.byte	0x69
	.byte	0x6e
	.byte	0x69
	.byte	0x74
	.byte	0x20
	.byte	0x68
	.byte	0x61
	.byte	0x73
	.byte	0x20
	.byte	0x66
	.byte	0x61
	.byte	0x69
	.byte	0x6c
	.byte	0x65
	.byte	0x64
	.byte	0xa
	.byte	0
	.uleb128 0x31
	.long	.LASF100
	.long	.LASF102
	.byte	0x12
	.byte	0
	.uleb128 0x2f
	.long	.LASF103
	.long	.LASF103
	.byte	0xf
	.value	0x2d5
	.byte	0xc
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0x29
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
	.uleb128 0x36
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS11:
	.uleb128 0
	.uleb128 .LVU93
	.uleb128 .LVU93
	.uleb128 0
.LLST11:
	.quad	.LVL29
	.quad	.LVL31
	.value	0x1
	.byte	0x55
	.quad	.LVL31
	.quad	.LFE53
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS12:
	.uleb128 0
	.uleb128 .LVU86
	.uleb128 .LVU86
	.uleb128 0
.LLST12:
	.quad	.LVL29
	.quad	.LVL30
	.value	0x1
	.byte	0x54
	.quad	.LVL30
	.quad	.LFE53
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS13:
	.uleb128 .LVU96
	.uleb128 .LVU100
	.uleb128 .LVU101
	.uleb128 .LVU105
	.uleb128 .LVU105
	.uleb128 .LVU106
	.uleb128 .LVU106
	.uleb128 .LVU108
	.uleb128 .LVU108
	.uleb128 .LVU111
	.uleb128 .LVU111
	.uleb128 .LVU113
	.uleb128 .LVU113
	.uleb128 .LVU130
	.uleb128 .LVU131
	.uleb128 .LVU133
	.uleb128 .LVU133
	.uleb128 .LVU135
	.uleb128 .LVU135
	.uleb128 .LVU137
	.uleb128 .LVU137
	.uleb128 .LVU139
	.uleb128 .LVU139
	.uleb128 .LVU142
	.uleb128 .LVU147
	.uleb128 0
.LLST13:
	.quad	.LVL32
	.quad	.LVL33-1
	.value	0x1
	.byte	0x50
	.quad	.LVL34
	.quad	.LVL35-1
	.value	0x1
	.byte	0x50
	.quad	.LVL35-1
	.quad	.LVL36
	.value	0x1
	.byte	0x53
	.quad	.LVL36
	.quad	.LVL37
	.value	0x1
	.byte	0x50
	.quad	.LVL37
	.quad	.LVL39
	.value	0x1
	.byte	0x53
	.quad	.LVL39
	.quad	.LVL40
	.value	0x1
	.byte	0x50
	.quad	.LVL40
	.quad	.LVL44
	.value	0x1
	.byte	0x53
	.quad	.LVL45
	.quad	.LVL46-1
	.value	0x1
	.byte	0x50
	.quad	.LVL46-1
	.quad	.LVL48
	.value	0x1
	.byte	0x53
	.quad	.LVL48
	.quad	.LVL49-1
	.value	0x1
	.byte	0x50
	.quad	.LVL49-1
	.quad	.LVL51
	.value	0x1
	.byte	0x53
	.quad	.LVL51
	.quad	.LVL52
	.value	0x1
	.byte	0x50
	.quad	.LVL55
	.quad	.LFE53
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS14:
	.uleb128 .LVU121
	.uleb128 .LVU129
	.uleb128 .LVU129
	.uleb128 .LVU131
	.uleb128 .LVU147
	.uleb128 0
.LLST14:
	.quad	.LVL41
	.quad	.LVL43
	.value	0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.quad	.LVL43
	.quad	.LVL45
	.value	0x1
	.byte	0x50
	.quad	.LVL55
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
.LVUS15:
	.uleb128 .LVU122
	.uleb128 .LVU125
.LLST15:
	.quad	.LVL41
	.quad	.LVL42
	.value	0xa
	.byte	0x3
	.quad	.LC11
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU11
	.uleb128 .LVU11
	.uleb128 .LVU12
	.uleb128 .LVU12
	.uleb128 0
.LLST0:
	.quad	.LVL0
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LVL3-1
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL3-1
	.quad	.LFE51
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS1:
	.uleb128 .LVU14
	.uleb128 .LVU16
	.uleb128 .LVU16
	.uleb128 .LVU22
	.uleb128 .LVU22
	.uleb128 .LVU24
	.uleb128 .LVU24
	.uleb128 .LVU29
	.uleb128 .LVU32
	.uleb128 .LVU34
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
	.quad	.LVL9
	.quad	.LVL10-1
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
	.uleb128 .LVU8
	.uleb128 .LVU12
.LLST2:
	.quad	.LVL1
	.quad	.LVL3
	.value	0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS3:
	.uleb128 .LVU26
	.uleb128 .LVU29
.LLST3:
	.quad	.LVL7
	.quad	.LVL8
	.value	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS4:
	.uleb128 .LVU33
	.uleb128 .LVU35
.LLST4:
	.quad	.LVL9
	.quad	.LVL11
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS5:
	.uleb128 0
	.uleb128 .LVU46
	.uleb128 .LVU46
	.uleb128 .LVU47
	.uleb128 .LVU47
	.uleb128 0
.LLST5:
	.quad	.LVL13
	.quad	.LVL14
	.value	0x1
	.byte	0x55
	.quad	.LVL14
	.quad	.LVL15-1
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL15-1
	.quad	.LFE52
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS6:
	.uleb128 .LVU54
	.uleb128 .LVU56
	.uleb128 .LVU56
	.uleb128 .LVU62
	.uleb128 .LVU62
	.uleb128 .LVU64
	.uleb128 .LVU64
	.uleb128 .LVU69
	.uleb128 .LVU72
	.uleb128 .LVU73
.LLST6:
	.quad	.LVL17
	.quad	.LVL18
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL18
	.quad	.LVL19
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL19
	.quad	.LVL20
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL20
	.quad	.LVL22-1
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL23
	.quad	.LVL24-1
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
	.uleb128 .LVU49
	.uleb128 .LVU52
.LLST7:
	.quad	.LVL16
	.quad	.LVL17
	.value	0xa
	.byte	0x3
	.quad	.LC4
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS8:
	.uleb128 .LVU66
	.uleb128 .LVU69
.LLST8:
	.quad	.LVL21
	.quad	.LVL22
	.value	0xa
	.byte	0x3
	.quad	.LC6
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS9:
	.uleb128 .LVU75
	.uleb128 .LVU81
.LLST9:
	.quad	.LVL25
	.quad	.LVL27
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS10:
	.uleb128 .LVU76
	.uleb128 .LVU79
.LLST10:
	.quad	.LVL25
	.quad	.LVL26
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2945
	.sleb128 0
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
	.quad	.LBB34
	.quad	.LBE34
	.quad	.LBB38
	.quad	.LBE38
	.quad	.LBB39
	.quad	.LBE39
	.quad	0
	.quad	0
	.quad	.LBB56
	.quad	.LBE56
	.quad	.LBB59
	.quad	.LBE59
	.quad	0
	.quad	0
	.quad	.LBB66
	.quad	.LBE66
	.quad	.LBB69
	.quad	.LBE69
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
.LASF95:
	.string	"__errno_location"
.LASF71:
	.string	"optarg"
.LASF102:
	.string	"__builtin_puts"
.LASF92:
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
.LASF51:
	.string	"__pthread_internal_list"
.LASF108:
	.string	"main"
.LASF16:
	.string	"_IO_write_ptr"
.LASF11:
	.string	"_flags"
.LASF69:
	.string	"pthread_mutex_t"
.LASF52:
	.string	"__prev"
.LASF57:
	.string	"__count"
.LASF31:
	.string	"_lock"
.LASF84:
	.string	"ret1"
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
.LASF103:
	.string	"pthread_mutex_init"
.LASF98:
	.string	"__fprintf_chk"
.LASF12:
	.string	"_IO_read_ptr"
.LASF53:
	.string	"__next"
.LASF40:
	.string	"FILE"
.LASF46:
	.string	"stderr"
.LASF41:
	.string	"_IO_marker"
.LASF49:
	.string	"long long int"
.LASF94:
	.string	"pthread_join"
.LASF77:
	.string	"__timezone"
.LASF93:
	.string	"pthread_create"
.LASF76:
	.string	"__daylight"
.LASF6:
	.string	"long int"
.LASF80:
	.string	"timezone"
.LASF89:
	.string	"printf"
.LASF28:
	.string	"_cur_column"
.LASF85:
	.string	"ret2"
.LASF96:
	.string	"perror"
.LASF90:
	.string	"fprintf"
.LASF61:
	.string	"__spins"
.LASF15:
	.string	"_IO_write_base"
.LASF83:
	.string	"argv"
.LASF97:
	.string	"exit"
.LASF27:
	.string	"_old_offset"
.LASF101:
	.string	"__builtin_fwrite"
.LASF106:
	.string	"/home/george/oslab/ex3"
.LASF2:
	.string	"unsigned char"
.LASF82:
	.string	"argc"
.LASF75:
	.string	"__tzname"
.LASF4:
	.string	"signed char"
.LASF33:
	.string	"_codecvt"
.LASF64:
	.string	"long long unsigned int"
.LASF86:
	.string	"decrease_fn"
.LASF1:
	.string	"unsigned int"
.LASF88:
	.string	"__fmt"
.LASF30:
	.string	"_shortbuf"
.LASF100:
	.string	"puts"
.LASF78:
	.string	"tzname"
.LASF39:
	.string	"_unused2"
.LASF73:
	.string	"opterr"
.LASF81:
	.string	"mutex"
.LASF67:
	.string	"__size"
.LASF19:
	.string	"_IO_buf_end"
.LASF10:
	.string	"char"
.LASF59:
	.string	"__nusers"
.LASF72:
	.string	"optind"
.LASF105:
	.string	"simplesync.c"
.LASF34:
	.string	"_wide_data"
.LASF35:
	.string	"_freeres_list"
.LASF104:
	.string	"GNU C17 9.3.0 -mtune=generic -march=x86-64 -g -O2 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF37:
	.string	"__pad5"
.LASF56:
	.string	"__lock"
.LASF58:
	.string	"__owner"
.LASF3:
	.string	"short unsigned int"
.LASF87:
	.string	"increase_fn"
.LASF55:
	.string	"__pthread_mutex_s"
.LASF99:
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
.LASF38:
	.string	"_mode"
.LASF66:
	.string	"__data"
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
.LASF20:
	.string	"_IO_save_base"
.LASF48:
	.string	"sys_errlist"
.LASF74:
	.string	"optopt"
.LASF109:
	.string	"__stack_chk_fail"
.LASF60:
	.string	"__kind"
.LASF91:
	.string	"__stream"
.LASF65:
	.string	"pthread_t"
.LASF68:
	.string	"__align"
.LASF45:
	.string	"stdout"
.LASF107:
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
