ORG 00H
;60H for seconds ,61H for minutes, 62H for overflow
LJMP MAIN

ORG 0BH

INC 62H
MOV A, 62H
CJNE A, #0EH, last

INC 60H
MOV A, 60H
CJNE A, #3CH, clear_overflow
MOV 60H, #00H

INC 61H
MOV A, 62H
CJNE A, #3CH, clear_overflow
MOV 61H, #00H

clear_overflow:
MOV 62H, #00H

last:
RETI

MAIN: 
	ORG 30H
		
	MOV 60H, #00H
	MOV 61H, #00H
	MOV 62H, #00H

	MOV TMOD, #01H
	MOV TL0, #00H
	MOV TL0, #00H
	MOV IE, #82H
	SETB TR0
	
	MOV DPTR, #BCD_CODE
DISPLAY:
	MOV R1, #020H
AGAIN:
	MOV R6, #05H
OUTER:
	MOV R7, #010H
INNER:
	MOV A, 61H
	LCALL SET_DISP
	
	MOVC A, @A+DPTR
	MOV P0, A
	MOV P2, #01H
	LCALL SDELAY
	MOV P2, #00H
	
	MOV A, B
	MOVC A, @A+DPTR
	ORL A, #80h
	MOV P0, A
	MOV P2, #02H
	LCALL SDELAY
	MOV P2, #00H
	
	MOV A, 60H
	LCALL SET_DISP
	
	MOVC A, @A+DPTR
	MOV P0, A
	MOV P2, #04H
	LCALL SDELAY
	MOV P2, #00H

	MOV A, B
	MOVC A, @A+DPTR
	MOV P0, A
	MOV P2, #08H
	LCALL SDELAY
	MOV P2, #00H

	DJNZ R7, INNER
	DJNZ R6, OUTER

SJMP DISPLAY

SET_DISP:
	MOV B, #0AH	
	DIV AB
RET
	
SDELAY:
	MOV R5, #018H
	SOUTER:
	MOV R4, #018H
	SINNER:
	DJNZ R4, SINNER
	DJNZ R5, SOUTER
RET

BCD_CODE: db 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH

END