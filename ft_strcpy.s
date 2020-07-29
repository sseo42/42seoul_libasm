section .text

global _ft_strcpy

_ft_strcpy:
	XOR		RCX, RCX

loop:
	MOV		DL, BYTE [RSI + RCX]
	MOV		BYTE [RDI + RCX], DL
	CMP		DL, 0
	JE		exit
	INC		RCX
	JMP		loop

exit:
	MOV		RAX, RDI
	RET
