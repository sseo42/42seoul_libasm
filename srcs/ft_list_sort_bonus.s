section .text

global _ft_list_sort
extern _ft_list_size

_ft_list_sort:
	MOV		RDI, [RDI]
	MOV		R13, RDI
	MOV		R14, RSI
	CALL	_ft_list_size
	CMP		RAX, 1
	JBE		exit_list_sort

	MOV		R15, RAX

loop_list_sort:
	DEC		R15
	CMP		R15, 0
	JE		exit_list_sort

	MOV		R10, R15
	MOV		R12, R13

sub_loop_list_sort:
	MOV		RDI, [R12]			;	before_data
	MOV		R11, [R12 + 8]		;	after_list
	MOV		RSI, [R11]			;	after_data
	CALL	R14
	CMP		EAX, 2147483647
	JA		after_swap

	MOV		[R11], RDI
	MOV		[R12], RSI

after_swap:
	MOV		R12, R11
	DEC		R10
	CMP		R10, 0
	JNE		sub_loop_list_sort

	JMP		loop_list_sort

exit_list_sort:
	RET
