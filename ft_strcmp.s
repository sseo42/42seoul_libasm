section .text

global _ft_strcmp

_ft_strcmp:
	XOR		RCX, RCX

loop:
	MOV		DL, BYTE [RDI + RCX]
	SUB		DL, BYTE [RSI + RCX]
	CMP		DL, 0
	JNE		exit
	CMP		BYTE [RDI + RCX], 0
	JE		exit
	INC		RCX
	JMP		loop

exit:
	MOVSX	RAX, DL
	RET
