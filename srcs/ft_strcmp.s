section .text

global _ft_strcmp

_ft_strcmp:
	XOR		RCX, RCX

loop:
	MOV		DH, BYTE [RDI + RCX]
	MOV		DL, BYTE [RSI + RCX]
	CMP		DH, DL
	JB		exit_neg
	JA		exit_pos
	CMP		BYTE [RDI + RCX], 0
	JE		exit
	INC		RCX
	JMP		loop

exit_neg:
	MOV		EAX, -1
	RET

exit_pos:
	MOV		EAX, 1
	RET

exit:
	MOV		EAX, 0
	RET
