ORG 00H

MOV 20H, #03FH
MOV 21H, #006H
MOV 22H, #05BH
MOV 23H, #04FH
MOV 24H, #066H
MOV 25H, #06DH
MOV 26H, #07DH
MOV 27H, #007H
MOV 28H, #07FH
MOV 29H, #06FH
 
MOV R1, #40H
MOV R2, #0AH ;counter

MOV 3FH, #0AH ;N in RAM
MOV R3, #01H

MULTIPLY:
	MOV A, 3FH
	MOV B, R3
	
	MUL AB
	MOV @R1, A
	INC R1
	INC R3
	DJNZ R2, MULTIPLY
	
DISPLAY:
	MOV R0, #40H
	MOV R2, #0AH
AGAIN:
	MOV R6, #0AH
OUTER:
	MOV R7, #030H
INNER:
	MOV A, @R0
	MOV B, @R0
	SUBB A, #064H
	JC LESS_THAN_100
	
	MOV A, @R0
	MOV B, #064H
	DIV AB
	
	ADD A, #20H
	MOV R1, A
	MOV P0, @R1
	MOV P2, #02H
	LCALL SDELAY
	MOV P2, #00H
	
LESS_THAN_100:
	MOV A, @R0
	CLR C
	SUBB A, #0AH
	JC LESS_THAN_10
	
	MOV A, B
	MOV B, #0AH
	
	DIV AB

	ADD A, #20H
	MOV R1, A
	MOV P0, @R1
	MOV P2, #04H
	LCALL SDELAY
	MOV P2, #00H

LESS_THAN_10:
	MOV A, B
	ADD A, #20H
	MOV R1, A
	MOV P0, @R1
	MOV P2, #08H
	LCALL SDELAY
	MOV P2, #00H

	DJNZ R7, INNER
	DJNZ R6, OUTER

	INC R0
	DJNZ R2, AGAIN

SJMP DISPLAY

SDELAY:
	MOV R5, #018H
	SOUTER:
	MOV R4, #018H

	SINNER:
	DJNZ R4, SINNER
	DJNZ R5, SOUTER
RET
	
END