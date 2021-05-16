	.file	"simplesync.c"
	.text
.Ltext0:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"About to increase variable %d times\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"pthread_mutex_lock"
.LC2:
	.string	"pthread_mutex_unlock"
.LC3:
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
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
.LBB12:
.LBB13:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 100 10 view .LVU5
	movl	$10000000, %ecx
	leaq	.LC0(%rip), %rdx
	xorl	%eax, %eax
.LBE13:
.LBE12:
	.loc 1 42 1 view .LVU6
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
.LVL1:
	.loc 1 46 2 is_stmt 1 view .LVU7
.LBB17:
.LBI12:
	.loc 2 98 1 view .LVU8
.LBB14:
	.loc 2 100 3 view .LVU9
	.loc 2 100 10 is_stmt 0 view .LVU10
	movl	$1, %esi
.LBE14:
.LBE17:
	.loc 1 55 10 view .LVU11
	leaq	mutex(%rip), %r13
	.loc 1 42 1 view .LVU12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
.LBB18:
.LBB15:
	.loc 2 100 10 view .LVU13
	movl	$10000000, %ebp
.LBE15:
.LBE18:
	.loc 1 42 1 view .LVU14
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.LBB19:
.LBB16:
	.loc 2 100 10 view .LVU15
	movq	stderr(%rip), %rdi
.LVL2:
	.loc 2 100 10 view .LVU16
	call	__fprintf_chk@PLT
.LVL3:
	.loc 2 100 10 view .LVU17
.LBE16:
.LBE19:
	.loc 1 47 2 is_stmt 1 view .LVU18
	.loc 1 47 14 view .LVU19
	.p2align 4,,10
	.p2align 3
.L4:
	.loc 1 48 3 view .LVU20
	.loc 1 55 4 view .LVU21
	.loc 1 55 10 is_stmt 0 view .LVU22
	movq	%r13, %rdi
	call	pthread_mutex_lock@PLT
.LVL4:
	movl	%eax, %ebx
.LVL5:
	.loc 1 56 4 is_stmt 1 view .LVU23
	.loc 1 56 7 is_stmt 0 view .LVU24
	testl	%eax, %eax
	jne	.L8
	.loc 1 61 4 is_stmt 1 view .LVU25
	.loc 1 61 7 is_stmt 0 view .LVU26
	movl	(%r12), %eax
.LVL6:
	.loc 1 63 10 view .LVU27
	movq	%r13, %rdi
	.loc 1 61 4 view .LVU28
	addl	$1, %eax
	movl	%eax, (%r12)
	.loc 1 63 4 is_stmt 1 view .LVU29
	.loc 1 63 10 is_stmt 0 view .LVU30
	call	pthread_mutex_unlock@PLT
.LVL7:
	movl	%eax, %ebx
.LVL8:
	.loc 1 64 4 is_stmt 1 view .LVU31
	.loc 1 64 7 is_stmt 0 view .LVU32
	testl	%eax, %eax
	jne	.L9
	.loc 1 47 21 is_stmt 1 discriminator 2 view .LVU33
.LVL9:
	.loc 1 47 14 discriminator 2 view .LVU34
	.loc 1 47 2 is_stmt 0 discriminator 2 view .LVU35
	subl	$1, %ebp
.LVL10:
	.loc 1 47 2 discriminator 2 view .LVU36
	jne	.L4
	.loc 1 70 2 is_stmt 1 view .LVU37
.LVL11:
.LBB20:
.LBI20:
	.loc 2 98 1 view .LVU38
.LBB21:
	.loc 2 100 3 view .LVU39
	.loc 2 100 10 is_stmt 0 view .LVU40
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
.LVL12:
	.loc 2 100 10 view .LVU41
.LBE21:
.LBE20:
	.loc 1 72 2 is_stmt 1 view .LVU42
	.loc 1 73 1 is_stmt 0 view .LVU43
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL13:
	.loc 1 73 1 view .LVU44
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL14:
	.loc 1 73 1 view .LVU45
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL15:
	.loc 1 73 1 view .LVU46
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.LVL16:
.L8:
	.cfi_restore_state
	.loc 1 57 5 is_stmt 1 view .LVU47
	.loc 1 57 5 view .LVU48
	call	__errno_location@PLT
.LVL17:
	.loc 1 57 5 is_stmt 0 view .LVU49
	leaq	.LC1(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 57 5 is_stmt 1 view .LVU50
	call	perror@PLT
.LVL18:
	.loc 1 57 5 view .LVU51
	.loc 1 58 5 view .LVU52
	movl	$1, %edi
	call	exit@PLT
.LVL19:
.L9:
	.loc 1 65 5 view .LVU53
	.loc 1 65 5 view .LVU54
	call	__errno_location@PLT
.LVL20:
	.loc 1 65 5 is_stmt 0 view .LVU55
	leaq	.LC2(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 65 5 is_stmt 1 view .LVU56
	call	perror@PLT
.LVL21:
	.loc 1 65 5 view .LVU57
	.loc 1 66 5 view .LVU58
	movl	$1, %edi
	call	exit@PLT
.LVL22:
	.cfi_endproc
.LFE51:
	.size	increase_fn, .-increase_fn
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"About to decrease variable %d times\n"
	.section	.rodata.str1.1
.LC5:
	.string	"Done decreasing variable.\n"
	.text
	.p2align 4
	.globl	decrease_fn
	.type	decrease_fn, @function
decrease_fn:
.LVL23:
.LFB52:
	.loc 1 76 1 view -0
	.cfi_startproc
	.loc 1 76 1 is_stmt 0 view .LVU60
	endbr64
	.loc 1 77 2 is_stmt 1 view .LVU61
	.loc 1 78 2 view .LVU62
	.loc 1 76 1 is_stmt 0 view .LVU63
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
.LBB22:
.LBB23:
	.loc 2 100 10 view .LVU64
	movl	$10000000, %ecx
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
.LBE23:
.LBE22:
	.loc 1 76 1 view .LVU65
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
.LVL24:
	.loc 1 80 2 is_stmt 1 view .LVU66
.LBB27:
.LBI22:
	.loc 2 98 1 view .LVU67
.LBB24:
	.loc 2 100 3 view .LVU68
	.loc 2 100 10 is_stmt 0 view .LVU69
	movl	$1, %esi
.LBE24:
.LBE27:
	.loc 1 89 10 view .LVU70
	leaq	mutex(%rip), %r13
	.loc 1 76 1 view .LVU71
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
.LBB28:
.LBB25:
	.loc 2 100 10 view .LVU72
	movl	$10000000, %ebp
.LBE25:
.LBE28:
	.loc 1 76 1 view .LVU73
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.LBB29:
.LBB26:
	.loc 2 100 10 view .LVU74
	movq	stderr(%rip), %rdi
.LVL25:
	.loc 2 100 10 view .LVU75
	call	__fprintf_chk@PLT
.LVL26:
	.loc 2 100 10 view .LVU76
.LBE26:
.LBE29:
	.loc 1 81 2 is_stmt 1 view .LVU77
	.loc 1 81 14 view .LVU78
	.p2align 4,,10
	.p2align 3
.L13:
	.loc 1 82 3 view .LVU79
	.loc 1 89 4 view .LVU80
	.loc 1 89 10 is_stmt 0 view .LVU81
	movq	%r13, %rdi
	call	pthread_mutex_lock@PLT
.LVL27:
	movl	%eax, %ebx
.LVL28:
	.loc 1 90 4 is_stmt 1 view .LVU82
	.loc 1 90 7 is_stmt 0 view .LVU83
	testl	%eax, %eax
	jne	.L16
	.loc 1 95 4 is_stmt 1 view .LVU84
	.loc 1 95 7 is_stmt 0 view .LVU85
	movl	(%r12), %eax
.LVL29:
	.loc 1 97 10 view .LVU86
	movq	%r13, %rdi
	.loc 1 95 4 view .LVU87
	subl	$1, %eax
	movl	%eax, (%r12)
	.loc 1 97 4 is_stmt 1 view .LVU88
	.loc 1 97 10 is_stmt 0 view .LVU89
	call	pthread_mutex_unlock@PLT
.LVL30:
	movl	%eax, %ebx
.LVL31:
	.loc 1 98 4 is_stmt 1 view .LVU90
	.loc 1 98 7 is_stmt 0 view .LVU91
	testl	%eax, %eax
	jne	.L17
	.loc 1 81 21 is_stmt 1 discriminator 2 view .LVU92
.LVL32:
	.loc 1 81 14 discriminator 2 view .LVU93
	.loc 1 81 2 is_stmt 0 discriminator 2 view .LVU94
	subl	$1, %ebp
.LVL33:
	.loc 1 81 2 discriminator 2 view .LVU95
	jne	.L13
	.loc 1 104 2 is_stmt 1 view .LVU96
.LVL34:
.LBB30:
.LBI30:
	.loc 2 98 1 view .LVU97
.LBB31:
	.loc 2 100 3 view .LVU98
	.loc 2 100 10 is_stmt 0 view .LVU99
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
.LVL35:
	.loc 2 100 10 view .LVU100
.LBE31:
.LBE30:
	.loc 1 106 2 is_stmt 1 view .LVU101
	.loc 1 107 1 is_stmt 0 view .LVU102
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL36:
	.loc 1 107 1 view .LVU103
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL37:
	.loc 1 107 1 view .LVU104
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL38:
	.loc 1 107 1 view .LVU105
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.LVL39:
.L16:
	.cfi_restore_state
	.loc 1 91 5 is_stmt 1 view .LVU106
	.loc 1 91 5 view .LVU107
	call	__errno_location@PLT
.LVL40:
	.loc 1 91 5 is_stmt 0 view .LVU108
	leaq	.LC1(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 91 5 is_stmt 1 view .LVU109
	call	perror@PLT
.LVL41:
	.loc 1 91 5 view .LVU110
	.loc 1 92 5 view .LVU111
	movl	$1, %edi
	call	exit@PLT
.LVL42:
.L17:
	.loc 1 99 5 view .LVU112
	.loc 1 99 5 view .LVU113
	call	__errno_location@PLT
.LVL43:
	.loc 1 99 5 is_stmt 0 view .LVU114
	leaq	.LC2(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 99 5 is_stmt 1 view .LVU115
	call	perror@PLT
.LVL44:
	.loc 1 99 5 view .LVU116
	.loc 1 100 5 view .LVU117
	movl	$1, %edi
	call	exit@PLT
.LVL45:
	.cfi_endproc
.LFE52:
	.size	decrease_fn, .-decrease_fn
	.section	.rodata.str1.1
.LC6:
	.string	""
.LC7:
	.string	"NOT "
.LC8:
	.string	"pthread_create"
.LC9:
	.string	"pthread_join"
.LC10:
	.string	"%sOK, val = %d.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LVL46:
.LFB53:
	.loc 1 111 1 view -0
	.cfi_startproc
	.loc 1 111 1 is_stmt 0 view .LVU119
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	.loc 1 123 8 view .LVU120
	xorl	%esi, %esi
.LVL47:
	.loc 1 123 8 view .LVU121
	leaq	increase_fn(%rip), %rdx
	.loc 1 111 1 view .LVU122
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 111 1 view .LVU123
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	.loc 1 112 2 is_stmt 1 view .LVU124
	.loc 1 113 2 view .LVU125
	.loc 1 118 2 view .LVU126
	.loc 1 123 8 is_stmt 0 view .LVU127
	leaq	4(%rsp), %r12
	leaq	8(%rsp), %rdi
.LVL48:
	.loc 1 118 6 view .LVU128
	movl	$0, 4(%rsp)
	.loc 1 123 2 is_stmt 1 view .LVU129
	.loc 1 123 8 is_stmt 0 view .LVU130
	movq	%r12, %rcx
	call	pthread_create@PLT
.LVL49:
	.loc 1 124 2 is_stmt 1 view .LVU131
	.loc 1 124 5 is_stmt 0 view .LVU132
	testl	%eax, %eax
	jne	.L34
	.loc 1 128 2 is_stmt 1 view .LVU133
	.loc 1 128 8 is_stmt 0 view .LVU134
	leaq	16(%rsp), %rdi
	movq	%r12, %rcx
	leaq	decrease_fn(%rip), %rdx
	xorl	%esi, %esi
	call	pthread_create@PLT
.LVL50:
	.loc 1 128 8 view .LVU135
	movl	%eax, %ebx
.LVL51:
	.loc 1 129 2 is_stmt 1 view .LVU136
	.loc 1 129 5 is_stmt 0 view .LVU137
	testl	%eax, %eax
	jne	.L33
	.loc 1 137 2 is_stmt 1 view .LVU138
	.loc 1 137 8 is_stmt 0 view .LVU139
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL52:
	.loc 1 137 8 view .LVU140
	movl	%eax, %ebx
.LVL53:
	.loc 1 138 2 is_stmt 1 view .LVU141
	.loc 1 138 5 is_stmt 0 view .LVU142
	testl	%eax, %eax
	jne	.L35
.LVL54:
.L21:
	.loc 1 139 3 is_stmt 1 discriminator 1 view .LVU143
	.loc 1 140 2 discriminator 1 view .LVU144
	.loc 1 140 8 is_stmt 0 discriminator 1 view .LVU145
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL55:
	movl	%eax, %ebx
.LVL56:
	.loc 1 141 2 is_stmt 1 discriminator 1 view .LVU146
	.loc 1 141 5 is_stmt 0 discriminator 1 view .LVU147
	testl	%eax, %eax
	jne	.L36
.LVL57:
.L22:
	.loc 1 142 3 is_stmt 1 discriminator 1 view .LVU148
	.loc 1 147 2 discriminator 1 view .LVU149
	.loc 1 147 12 is_stmt 0 discriminator 1 view .LVU150
	movl	4(%rsp), %ecx
	xorl	%r12d, %r12d
	.loc 1 149 2 discriminator 1 view .LVU151
	leaq	.LC7(%rip), %rax
	leaq	.LC6(%rip), %rdx
.LBB32:
.LBB33:
	.loc 2 107 10 discriminator 1 view .LVU152
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
.LBE33:
.LBE32:
	.loc 1 147 12 discriminator 1 view .LVU153
	testl	%ecx, %ecx
	.loc 1 149 2 discriminator 1 view .LVU154
	cmovne	%rax, %rdx
	.loc 1 147 12 discriminator 1 view .LVU155
	sete	%r12b
.LVL58:
	.loc 1 149 2 is_stmt 1 discriminator 1 view .LVU156
.LBB35:
.LBI32:
	.loc 2 105 1 discriminator 1 view .LVU157
.LBB34:
	.loc 2 107 3 discriminator 1 view .LVU158
	.loc 2 107 10 is_stmt 0 discriminator 1 view .LVU159
	xorl	%eax, %eax
	call	__printf_chk@PLT
.LVL59:
	.loc 2 107 10 discriminator 1 view .LVU160
.LBE34:
.LBE35:
	.loc 1 151 2 is_stmt 1 discriminator 1 view .LVU161
	.loc 1 152 1 is_stmt 0 discriminator 1 view .LVU162
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L37
	.loc 1 152 1 view .LVU163
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
.LVL60:
	.loc 1 152 1 view .LVU164
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL61:
	.loc 1 152 1 view .LVU165
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.LVL62:
.L35:
	.cfi_restore_state
	.loc 1 139 3 is_stmt 1 view .LVU166
	.loc 1 139 3 view .LVU167
	call	__errno_location@PLT
.LVL63:
	.loc 1 139 3 is_stmt 0 view .LVU168
	leaq	.LC9(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 139 3 is_stmt 1 view .LVU169
	call	perror@PLT
.LVL64:
	jmp	.L21
.LVL65:
.L36:
	.loc 1 142 3 view .LVU170
	.loc 1 142 3 view .LVU171
	call	__errno_location@PLT
.LVL66:
	.loc 1 142 3 is_stmt 0 view .LVU172
	leaq	.LC9(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 142 3 is_stmt 1 view .LVU173
	call	perror@PLT
.LVL67:
	jmp	.L22
.LVL68:
.L34:
	.loc 1 142 3 is_stmt 0 view .LVU174
	movl	%eax, %ebx
	.loc 1 125 3 is_stmt 1 view .LVU175
	.loc 1 125 3 view .LVU176
.LVL69:
.L33:
	.loc 1 130 3 view .LVU177
	.loc 1 130 3 view .LVU178
	call	__errno_location@PLT
.LVL70:
	leaq	.LC8(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 130 3 view .LVU179
	call	perror@PLT
.LVL71:
	.loc 1 130 3 view .LVU180
	.loc 1 131 3 view .LVU181
	movl	$1, %edi
	call	exit@PLT
.LVL72:
.L37:
	.loc 1 152 1 is_stmt 0 view .LVU182
	call	__stack_chk_fail@PLT
.LVL73:
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
	.long	0xb7e
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF108
	.byte	0xc
	.long	.LASF109
	.long	.LASF110
	.long	.Ldebug_ranges0+0xd0
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
	.long	.LASF111
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
	.long	.LLST12
	.long	.LVUS12
	.uleb128 0x19
	.long	.LASF91
	.byte	0x1
	.byte	0x6e
	.byte	0x1a
	.long	0x40e
	.long	.LLST13
	.long	.LVUS13
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
	.long	.LLST14
	.long	.LVUS14
	.uleb128 0x1b
	.string	"ok"
	.byte	0x1
	.byte	0x70
	.byte	0x10
	.long	0x61
	.long	.LLST15
	.long	.LVUS15
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
	.long	0xab3
	.quad	.LBI32
	.byte	.LVU157
	.long	.Ldebug_ranges0+0xa0
	.byte	0x1
	.byte	0x95
	.byte	0x2
	.long	0x5d4
	.uleb128 0x1d
	.long	0xac4
	.long	.LLST16
	.long	.LVUS16
	.uleb128 0x1e
	.quad	.LVL59
	.long	0xafd
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
	.quad	.LC10
	.byte	0
	.byte	0
	.uleb128 0x20
	.quad	.LVL49
	.long	0xb09
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
	.quad	.LVL50
	.long	0xb09
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
	.quad	.LVL52
	.long	0xb15
	.long	0x64b
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x20
	.quad	.LVL55
	.long	0xb15
	.long	0x662
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x21
	.quad	.LVL63
	.long	0xb21
	.uleb128 0x20
	.quad	.LVL64
	.long	0xb2d
	.long	0x68e
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.uleb128 0x21
	.quad	.LVL66
	.long	0xb21
	.uleb128 0x20
	.quad	.LVL67
	.long	0xb2d
	.long	0x6ba
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.uleb128 0x21
	.quad	.LVL70
	.long	0xb21
	.uleb128 0x20
	.quad	.LVL71
	.long	0xb2d
	.long	0x6e6
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.uleb128 0x20
	.quad	.LVL72
	.long	0xb3a
	.long	0x6fd
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x21
	.quad	.LVL73
	.long	0xb47
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
	.long	0x8dc
	.uleb128 0x22
	.string	"arg"
	.byte	0x1
	.byte	0x4b
	.byte	0x19
	.long	0x43
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.byte	0x4d
	.byte	0x6
	.long	0x61
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x1b
	.string	"ret"
	.byte	0x1
	.byte	0x4d
	.byte	0x9
	.long	0x61
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x1b
	.string	"ip"
	.byte	0x1
	.byte	0x4e
	.byte	0x10
	.long	0x8dc
	.long	.LLST9
	.long	.LVUS9
	.uleb128 0x1c
	.long	0xad2
	.quad	.LBI22
	.byte	.LVU67
	.long	.Ldebug_ranges0+0x50
	.byte	0x1
	.byte	0x50
	.byte	0x2
	.long	0x7cc
	.uleb128 0x1d
	.long	0xaef
	.long	.LLST10
	.long	.LVUS10
	.uleb128 0x23
	.long	0xae3
	.uleb128 0x1e
	.quad	.LVL26
	.long	0xb50
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
	.quad	.LC4
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	0xad2
	.quad	.LBI30
	.byte	.LVU97
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.long	0x829
	.uleb128 0x1d
	.long	0xaef
	.long	.LLST11
	.long	.LVUS11
	.uleb128 0x23
	.long	0xae3
	.uleb128 0x1e
	.quad	.LVL35
	.long	0xb5c
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
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
	.uleb128 0x20
	.quad	.LVL27
	.long	0xb67
	.long	0x841
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL30
	.long	0xb74
	.long	0x859
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x21
	.quad	.LVL40
	.long	0xb21
	.uleb128 0x20
	.quad	.LVL41
	.long	0xb2d
	.long	0x885
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.byte	0
	.uleb128 0x20
	.quad	.LVL42
	.long	0xb3a
	.long	0x89c
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x21
	.quad	.LVL43
	.long	0xb21
	.uleb128 0x20
	.quad	.LVL44
	.long	0xb2d
	.long	0x8c8
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.uleb128 0x1e
	.quad	.LVL45
	.long	0xb3a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
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
	.long	0xab3
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
	.uleb128 0x1b
	.string	"ret"
	.byte	0x1
	.byte	0x2b
	.byte	0x9
	.long	0x61
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x1b
	.string	"ip"
	.byte	0x1
	.byte	0x2c
	.byte	0x10
	.long	0x8dc
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x1c
	.long	0xad2
	.quad	.LBI12
	.byte	.LVU8
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x2e
	.byte	0x2
	.long	0x9a3
	.uleb128 0x1d
	.long	0xaef
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x23
	.long	0xae3
	.uleb128 0x1e
	.quad	.LVL3
	.long	0xb50
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
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	0xad2
	.quad	.LBI20
	.byte	.LVU38
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.byte	0x1
	.byte	0x46
	.byte	0x2
	.long	0xa00
	.uleb128 0x1d
	.long	0xaef
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0x23
	.long	0xae3
	.uleb128 0x1e
	.quad	.LVL12
	.long	0xb5c
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
	.uleb128 0x20
	.quad	.LVL4
	.long	0xb67
	.long	0xa18
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL7
	.long	0xb74
	.long	0xa30
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x21
	.quad	.LVL17
	.long	0xb21
	.uleb128 0x20
	.quad	.LVL18
	.long	0xb2d
	.long	0xa5c
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.byte	0
	.uleb128 0x20
	.quad	.LVL19
	.long	0xb3a
	.long	0xa73
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x21
	.quad	.LVL20
	.long	0xb21
	.uleb128 0x20
	.quad	.LVL21
	.long	0xb2d
	.long	0xa9f
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.uleb128 0x1e
	.quad	.LVL22
	.long	0xb3a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.LASF95
	.byte	0x2
	.byte	0x69
	.byte	0x1
	.long	0x61
	.byte	0x3
	.long	0xad2
	.uleb128 0x26
	.long	.LASF97
	.byte	0x2
	.byte	0x69
	.byte	0x20
	.long	0x2dc
	.uleb128 0x27
	.byte	0
	.uleb128 0x25
	.long	.LASF96
	.byte	0x2
	.byte	0x62
	.byte	0x1
	.long	0x61
	.byte	0x3
	.long	0xafd
	.uleb128 0x26
	.long	.LASF98
	.byte	0x2
	.byte	0x62
	.byte	0x1b
	.long	0x298
	.uleb128 0x26
	.long	.LASF97
	.byte	0x2
	.byte	0x62
	.byte	0x3c
	.long	0x2dc
	.uleb128 0x27
	.byte	0
	.uleb128 0x28
	.long	.LASF99
	.long	.LASF99
	.byte	0x2
	.byte	0x5a
	.byte	0xc
	.uleb128 0x28
	.long	.LASF100
	.long	.LASF100
	.byte	0xf
	.byte	0xc6
	.byte	0xc
	.uleb128 0x28
	.long	.LASF101
	.long	.LASF101
	.byte	0xf
	.byte	0xd7
	.byte	0xc
	.uleb128 0x28
	.long	.LASF102
	.long	.LASF102
	.byte	0x10
	.byte	0x25
	.byte	0xd
	.uleb128 0x29
	.long	.LASF103
	.long	.LASF103
	.byte	0x7
	.value	0x307
	.byte	0xd
	.uleb128 0x29
	.long	.LASF104
	.long	.LASF104
	.byte	0x11
	.value	0x269
	.byte	0xd
	.uleb128 0x2a
	.long	.LASF112
	.long	.LASF112
	.uleb128 0x28
	.long	.LASF105
	.long	.LASF105
	.byte	0x2
	.byte	0x58
	.byte	0xc
	.uleb128 0x2b
	.long	.LASF113
	.long	.LASF114
	.byte	0x12
	.byte	0
	.uleb128 0x29
	.long	.LASF106
	.long	.LASF106
	.byte	0xf
	.value	0x2e2
	.byte	0xc
	.uleb128 0x29
	.long	.LASF107
	.long	.LASF107
	.byte	0xf
	.value	0x2f4
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x5
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
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS12:
	.uleb128 0
	.uleb128 .LVU128
	.uleb128 .LVU128
	.uleb128 0
.LLST12:
	.quad	.LVL46
	.quad	.LVL48
	.value	0x1
	.byte	0x55
	.quad	.LVL48
	.quad	.LFE53
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS13:
	.uleb128 0
	.uleb128 .LVU121
	.uleb128 .LVU121
	.uleb128 0
.LLST13:
	.quad	.LVL46
	.quad	.LVL47
	.value	0x1
	.byte	0x54
	.quad	.LVL47
	.quad	.LFE53
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS14:
	.uleb128 .LVU131
	.uleb128 .LVU135
	.uleb128 .LVU136
	.uleb128 .LVU140
	.uleb128 .LVU140
	.uleb128 .LVU141
	.uleb128 .LVU141
	.uleb128 .LVU143
	.uleb128 .LVU143
	.uleb128 .LVU146
	.uleb128 .LVU146
	.uleb128 .LVU148
	.uleb128 .LVU148
	.uleb128 .LVU165
	.uleb128 .LVU166
	.uleb128 .LVU168
	.uleb128 .LVU168
	.uleb128 .LVU170
	.uleb128 .LVU170
	.uleb128 .LVU172
	.uleb128 .LVU172
	.uleb128 .LVU174
	.uleb128 .LVU174
	.uleb128 .LVU177
	.uleb128 .LVU182
	.uleb128 0
.LLST14:
	.quad	.LVL49
	.quad	.LVL50-1
	.value	0x1
	.byte	0x50
	.quad	.LVL51
	.quad	.LVL52-1
	.value	0x1
	.byte	0x50
	.quad	.LVL52-1
	.quad	.LVL53
	.value	0x1
	.byte	0x53
	.quad	.LVL53
	.quad	.LVL54
	.value	0x1
	.byte	0x50
	.quad	.LVL54
	.quad	.LVL56
	.value	0x1
	.byte	0x53
	.quad	.LVL56
	.quad	.LVL57
	.value	0x1
	.byte	0x50
	.quad	.LVL57
	.quad	.LVL61
	.value	0x1
	.byte	0x53
	.quad	.LVL62
	.quad	.LVL63-1
	.value	0x1
	.byte	0x50
	.quad	.LVL63-1
	.quad	.LVL65
	.value	0x1
	.byte	0x53
	.quad	.LVL65
	.quad	.LVL66-1
	.value	0x1
	.byte	0x50
	.quad	.LVL66-1
	.quad	.LVL68
	.value	0x1
	.byte	0x53
	.quad	.LVL68
	.quad	.LVL69
	.value	0x1
	.byte	0x50
	.quad	.LVL72
	.quad	.LFE53
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS15:
	.uleb128 .LVU156
	.uleb128 .LVU164
	.uleb128 .LVU164
	.uleb128 .LVU166
	.uleb128 .LVU182
	.uleb128 0
.LLST15:
	.quad	.LVL58
	.quad	.LVL60
	.value	0x6
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.quad	.LVL60
	.quad	.LVL62
	.value	0x1
	.byte	0x50
	.quad	.LVL72
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
.LVUS16:
	.uleb128 .LVU157
	.uleb128 .LVU160
.LLST16:
	.quad	.LVL58
	.quad	.LVL59
	.value	0xa
	.byte	0x3
	.quad	.LC10
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS6:
	.uleb128 0
	.uleb128 .LVU75
	.uleb128 .LVU75
	.uleb128 .LVU105
	.uleb128 .LVU105
	.uleb128 .LVU106
	.uleb128 .LVU106
	.uleb128 0
.LLST6:
	.quad	.LVL23
	.quad	.LVL25
	.value	0x1
	.byte	0x55
	.quad	.LVL25
	.quad	.LVL38
	.value	0x1
	.byte	0x5c
	.quad	.LVL38
	.quad	.LVL39
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL39
	.quad	.LFE52
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LVUS7:
	.uleb128 .LVU78
	.uleb128 .LVU79
	.uleb128 .LVU79
	.uleb128 .LVU93
	.uleb128 .LVU93
	.uleb128 .LVU95
	.uleb128 .LVU95
	.uleb128 .LVU104
	.uleb128 .LVU106
	.uleb128 0
.LLST7:
	.quad	.LVL26
	.quad	.LVL26
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL26
	.quad	.LVL32
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL32
	.quad	.LVL33
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL33
	.quad	.LVL37
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL39
	.quad	.LFE52
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS8:
	.uleb128 .LVU82
	.uleb128 .LVU86
	.uleb128 .LVU86
	.uleb128 .LVU90
	.uleb128 .LVU90
	.uleb128 .LVU100
	.uleb128 .LVU100
	.uleb128 .LVU103
	.uleb128 .LVU106
	.uleb128 .LVU108
	.uleb128 .LVU108
	.uleb128 .LVU112
	.uleb128 .LVU112
	.uleb128 .LVU114
	.uleb128 .LVU114
	.uleb128 0
.LLST8:
	.quad	.LVL28
	.quad	.LVL29
	.value	0x1
	.byte	0x50
	.quad	.LVL29
	.quad	.LVL31
	.value	0x1
	.byte	0x53
	.quad	.LVL31
	.quad	.LVL35-1
	.value	0x1
	.byte	0x50
	.quad	.LVL35-1
	.quad	.LVL36
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
	.quad	.LVL43-1
	.value	0x1
	.byte	0x50
	.quad	.LVL43-1
	.quad	.LFE52
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS9:
	.uleb128 .LVU66
	.uleb128 .LVU75
	.uleb128 .LVU75
	.uleb128 .LVU105
	.uleb128 .LVU105
	.uleb128 .LVU106
	.uleb128 .LVU106
	.uleb128 0
.LLST9:
	.quad	.LVL24
	.quad	.LVL25
	.value	0x1
	.byte	0x55
	.quad	.LVL25
	.quad	.LVL38
	.value	0x1
	.byte	0x5c
	.quad	.LVL38
	.quad	.LVL39
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL39
	.quad	.LFE52
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LVUS10:
	.uleb128 .LVU67
	.uleb128 .LVU76
.LLST10:
	.quad	.LVL24
	.quad	.LVL26
	.value	0xa
	.byte	0x3
	.quad	.LC4
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS11:
	.uleb128 .LVU97
	.uleb128 .LVU100
.LLST11:
	.quad	.LVL34
	.quad	.LVL35
	.value	0xa
	.byte	0x3
	.quad	.LC5
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU16
	.uleb128 .LVU16
	.uleb128 .LVU46
	.uleb128 .LVU46
	.uleb128 .LVU47
	.uleb128 .LVU47
	.uleb128 0
.LLST0:
	.quad	.LVL0
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LVL15
	.value	0x1
	.byte	0x5c
	.quad	.LVL15
	.quad	.LVL16
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL16
	.quad	.LFE51
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LVUS1:
	.uleb128 .LVU19
	.uleb128 .LVU20
	.uleb128 .LVU20
	.uleb128 .LVU34
	.uleb128 .LVU34
	.uleb128 .LVU36
	.uleb128 .LVU36
	.uleb128 .LVU45
	.uleb128 .LVU47
	.uleb128 0
.LLST1:
	.quad	.LVL3
	.quad	.LVL3
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL3
	.quad	.LVL9
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL9
	.quad	.LVL10
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL10
	.quad	.LVL14
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL16
	.quad	.LFE51
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS2:
	.uleb128 .LVU23
	.uleb128 .LVU27
	.uleb128 .LVU27
	.uleb128 .LVU31
	.uleb128 .LVU31
	.uleb128 .LVU41
	.uleb128 .LVU41
	.uleb128 .LVU44
	.uleb128 .LVU47
	.uleb128 .LVU49
	.uleb128 .LVU49
	.uleb128 .LVU53
	.uleb128 .LVU53
	.uleb128 .LVU55
	.uleb128 .LVU55
	.uleb128 0
.LLST2:
	.quad	.LVL5
	.quad	.LVL6
	.value	0x1
	.byte	0x50
	.quad	.LVL6
	.quad	.LVL8
	.value	0x1
	.byte	0x53
	.quad	.LVL8
	.quad	.LVL12-1
	.value	0x1
	.byte	0x50
	.quad	.LVL12-1
	.quad	.LVL13
	.value	0x1
	.byte	0x53
	.quad	.LVL16
	.quad	.LVL17-1
	.value	0x1
	.byte	0x50
	.quad	.LVL17-1
	.quad	.LVL19
	.value	0x1
	.byte	0x53
	.quad	.LVL19
	.quad	.LVL20-1
	.value	0x1
	.byte	0x50
	.quad	.LVL20-1
	.quad	.LFE51
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS3:
	.uleb128 .LVU7
	.uleb128 .LVU16
	.uleb128 .LVU16
	.uleb128 .LVU46
	.uleb128 .LVU46
	.uleb128 .LVU47
	.uleb128 .LVU47
	.uleb128 0
.LLST3:
	.quad	.LVL1
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LVL15
	.value	0x1
	.byte	0x5c
	.quad	.LVL15
	.quad	.LVL16
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL16
	.quad	.LFE51
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LVUS4:
	.uleb128 .LVU8
	.uleb128 .LVU17
.LLST4:
	.quad	.LVL1
	.quad	.LVL3
	.value	0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS5:
	.uleb128 .LVU38
	.uleb128 .LVU41
.LLST5:
	.quad	.LVL11
	.quad	.LVL12
	.value	0xa
	.byte	0x3
	.quad	.LC3
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
	.quad	.LBB17
	.quad	.LBE17
	.quad	.LBB18
	.quad	.LBE18
	.quad	.LBB19
	.quad	.LBE19
	.quad	0
	.quad	0
	.quad	.LBB22
	.quad	.LBE22
	.quad	.LBB27
	.quad	.LBE27
	.quad	.LBB28
	.quad	.LBE28
	.quad	.LBB29
	.quad	.LBE29
	.quad	0
	.quad	0
	.quad	.LBB32
	.quad	.LBE32
	.quad	.LBB35
	.quad	.LBE35
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
.LASF106:
	.string	"pthread_mutex_lock"
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
.LASF114:
	.string	"__builtin_fwrite"
.LASF110:
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
.LASF109:
	.string	"simplesync.c"
.LASF34:
	.string	"_wide_data"
.LASF35:
	.string	"_freeres_list"
.LASF108:
	.string	"GNU C17 9.3.0 -mtune=generic -march=x86-64 -g -O2 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF82:
	.string	"PTHREAD_MUTEX_RECURSIVE_NP"
.LASF37:
	.string	"__pad5"
.LASF107:
	.string	"pthread_mutex_unlock"
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
.LASF113:
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
.LASF112:
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
.LASF111:
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
