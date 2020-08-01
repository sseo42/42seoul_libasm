section .text

extern _malloc
global _ft_list_push_front

_ft_list_push_front:
	PUSH	RBP

	CMP		RDI, 0
	JE		exit_list_push_front

	MOV		R15, RSI
	MOV		R14, RDI
	MOV		R13, [R14]

	MOV		RDI, 16
	CALL	_malloc
	CMP		RAX, 0
	JE		exit_list_push_front

	MOV		[RAX], R15		;new->data = data
	MOV		[R14], RAX		;*begin = new
	MOV		[RAX + 8], R13	;new->next = *begin

exit_list_push_front:
	POP		RBP
	RET
