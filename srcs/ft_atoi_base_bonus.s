section .text

extern _ft_strlen

global _search_idx
global _check_base
global _convert_num
global _ft_atoi_base

_search_except_idx:
	XOR		RAX, RAX

	CMP		RDI, 9
	JE		is_t

	CMP		RDI, 10
	JE		is_n

	CMP		RDI, 11
	JE		is_v

	CMP		RDI, 12
	JE		is_f

	CMP		RDI, 13
	JE		is_r

	CMP		RDI, 32
	JE		is_space

	CMP		RDI, '+'
	JE		is_plus

	CMP		RDI, '-'
	JE		is_minus

	MOV		RAX, -1
	RET

is_t:
	XOR		RAX, RAX
	RET

is_n:
	MOV		RAX, 1
	RET

is_v:
	MOV		RAX, 2
	RET

is_f:
	MOV		RAX, 3
	RET

is_r:
	MOV		RAX, 4
	RET

is_space:
	MOV		RAX, 5
	RET

is_plus:
	MOV		RAX, 6
	RET

is_minus:
	MOV		RAX, 7
	RET

_search_idx:				;	target, str
	XOR		RAX, RAX
	MOV		RBX, RDI

loop_search:
	CMP		BYTE [RSI + RAX], 0
	JE		no_idx

	CMP		BYTE [RSI + RAX], BL
	JE		exit_search

	INC		RAX
	JMP		loop_search

no_idx:
	MOV		RAX, -1

exit_search:
	RET

_check_base:				;	base
	CMP		RDI, 0
	JE		exit_check_base

	CALL	_ft_strlen
	CMP		RAX, 1
	JBE		exit_check_base

	MOV		R8, 1 ;					base_idx
	MOV		R10, RAX ;				base_len
	MOV		R11, RDI ;				base_ptr

	MOVZX	RDI, BYTE [R11] ;		target_char
	CALL	_search_except_idx
	CMP		RAX, -1
	JNE		exit_check_base

loop_check_base:
	CMP		R8, R10
	JE		correct_base

	MOV		DL, BYTE [R11 + R8] ;	target_char
	MOVZX	RDI, DL
	CALL	_search_except_idx
	CMP		RAX, -1
	JNE		exit_check_base

	XOR		R9, R9 ;				base_sub_idx

sub_loop_check_base:
	CMP		R8, R9
	JE		loop_end_check_base

	CMP		DL, BYTE [R11 + R9] ;	sub_target_char
	JE		exit_check_base

	INC		R9
	JMP		sub_loop_check_base

loop_end_check_base:
	INC		R8
	JMP		loop_check_base

correct_base:
	MOV		RAX, R10
	RET

exit_check_base:
	MOV		RAX, 0
	RET

_convert_num:		;	base_len, base, str_idx, str
	XOR		R8, R8
	MOV		R9, RDI
	MOV		R10, RDX

loop:
	MOVZX	RDI, BYTE [RCX + R10]
	CALL	_search_idx
	CMP		RAX, -1
	JE		exit_convert_num

	MOV		R11, RAX
	MOV		RAX, R9
	MUL		R8			;check overflow
	ADD		RAX, R11	;check overflow
	MOV		R8, RAX

	INC		R10
	JMP		loop

exit_convert_num:
	MOV		RAX, R8
	RET

_ft_atoi_base:
	XOR		R15, R15
	MOV		R14, RDI
	XOR		R13, R13
	MOV		R12, RSI

	MOV		RDI, RSI

	CALL	_check_base
	CMP		RAX, 0
	JE		exit_ft_atoi_base

	MOV		R11, RAX

loop_atoi_base_space:
	MOVZX	RDI, BYTE [R14 + R13]
	CALL	_search_except_idx

	CMP		RAX, -1
	JE		loop_atoi_base_end

	CMP		RAX, 6
	JNB		loop_atoi_base_sign

	INC		R13
	JMP		loop_atoi_base_space

loop_atoi_base_sign:
	CMP		RAX, 7
	JE		update_atoi_base_sign

after_update_sign:
	INC		R13
	MOVZX	RDI, BYTE [R14 + R13]
	CALL	_search_except_idx

	CMP		RAX, -1
	JE		loop_atoi_base_end

	CMP		RAX, 6
	JB		loop_atoi_base_end

	JMP		loop_atoi_base_sign

loop_atoi_base_end:
	MOV		RDI, R11
	MOV		RSI, R12
	MOV		RDX, R13
	MOV		RCX, R14

	CALL	_convert_num

	CMP		R15, 0
	JE		exit_ft_atoi_base

	MOV		R14, -1
	IMUL	R14

exit_ft_atoi_base:
	RET

update_atoi_base_sign:
	XOR		R15, 1
	JMP		after_update_sign
