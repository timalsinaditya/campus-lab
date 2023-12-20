ORG 00H

AGAIN:
	MOV R1, #9AH
	MOV R2, #7FH
	MOV R3, #89H

	MOV R4, #48H
	MOV R5, #0BCH
	MOV R6, #34H
	
	MOV R0, #40H
	
	MOV A, R1
	ADD A, R4
	MOV @R0, A
	INC R0
	MOV A, R2
	ADDC A, R5
	MOV @R0, A
	INC R0
	MOV A, R3
	ADDC A, R6
	MOV P0, A
	MOVX @DPTR, A
	
	GAGAIN:
	MOV R0, #40H
	MOV R1, #3H
	
	DISPLAY:
		MOV A, @R0
		MOV P0, A
		INC R0
		LCALL DELAY
		DJNZ R1, DISPLAY
	SJMP GAGAIN

DELAY:
	MOV R6, #0FFH
	OUTER:
	MOV R7, #0FFH

	INNER:
	DJNZ R7, INNER
	DJNZ R6, OUTER
	RET

END