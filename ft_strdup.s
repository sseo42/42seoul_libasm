section .text

extern _malloc
extern _ft_strlen
extern _ft_strcpy

global	_ft_strdup

_ft_strdup:
	MOV		R15, RDI
	CALL	_ft_strlen
	PUSH	R15
	INC		RAX
	MOV		RDI, RAX
	CALL	_malloc

	CMP		RAX, 0
	JE		error

	MOV		RDI, RAX
	POP		RSI
	CALL	_ft_strcpy
	RET

error:
	POP		R15
	RET
