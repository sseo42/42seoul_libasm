section .text

global _ft_list_remove_if
extern _free

_ft_list_remove_if:
	PUSH	RBP

	MOV		RBX, RSI
	MOV		R13, RDI
	MOV		R14, RDX
	MOV		R15, RCX

	MOV		R12, [R13]

init_loop_list_remove_if:
	CMP		R12, 0
	JE		exit_zero_list_remove_if
	
	MOV		RDI, [R12]
	MOV		RSI, RBX
	CALL	R14
	CMP		RAX, 0
	JNE		init_loop_end_list_remove_if

	CALL	R15
	MOV		RDI, R12
	MOV		R12, [R12 + 8]
	CALL	_free

	JMP		init_loop_list_remove_if

init_loop_end_list_remove_if:
	MOV		[R13], R12

loop_list_remove_if:
	MOV		R13, R12
	MOV		R12, [R12 + 8]

after_remove_list:
	CMP		R12, 0
	JE		exit_list_remove_if

	MOV		RDI, [R12]
	MOV		RSI, RBX
	CALL	R14
	CMP		RAX, 0
	JNE		loop_list_remove_if

	CALL	R15
	MOV		RDI, R12
	MOV		R12, [R12 + 8]
	MOV		[R13 + 8], R12
	CALL	_free
	JMP		after_remove_list

exit_zero_list_remove_if:
	MOV		R11, 0
	MOV		[R13], R11

exit_list_remove_if:
	POP		RBP
	RET
