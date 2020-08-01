section .text

global _ft_list_size

_ft_list_size:
	XOR		RAX, RAX

loop_list_size:
	CMP		RDI, 0
	JE		exit_list_size

	MOV		RDI, [RDI + 8]
	INC		RAX
	JMP		loop_list_size

exit_list_size:
	RET
