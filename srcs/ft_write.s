section .text

global	_ft_write
extern	___error

_ft_write:
	MOV			RAX, 0x2000004
	SYSCALL
	JNC			exit
	PUSH		RAX
	CALL		___error
	POP			R15
	MOV			[RAX], R15
	MOV			RAX, -1

exit:
	RET
