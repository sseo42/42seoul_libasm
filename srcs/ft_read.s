section .text

global	_ft_read
extern	___error

_ft_read:
	MOV		RAX, 0x2000003
	SYSCALL
	JNC		exit
	PUSH	RAX
	CALL	___error
	POP		R15
	MOV		[RAX], R15
	MOV		RAX, -1

exit:
	RET
