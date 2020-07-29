section .text

global _ft_strlen

_ft_strlen :
	XOR		RAX, RAX

loop:
	CMP		BYTE [RDI + RAX], 0
	JE		exit
	INC		RAX
	JMP		loop

exit :
	RET
