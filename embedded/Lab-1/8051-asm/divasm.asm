ORG 00H

MOV 3EH, #0AFH

MOV R4, #0H
MOV R5, #0H

MOV A, 3EH

DIVIDE:
	CLR C
	INC R4
	SUBB A, #12H
	MOV R5, A
	SUBB A, #12H
	MOV A, R5 
	JNC DIVIDE
	
DISPLAY: 
	MOV P0, R4
	LCALL DELAY
	LCALL DELAY
	MOV P0, R5
	LCALL DELAY
	LCALL DELAY
	SJMP DISPLAY

DELAY:
	MOV R0, #0ffh
	OUTER:
	MOV R1, #0ffh
	INNER:
	DJNZ R1, INNER
	DJNZ R0, OUTER
	RET

END
	
	
	
	