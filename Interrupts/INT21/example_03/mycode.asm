
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
MSG     DB  "This is a test routine","$"		
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
	    ;
	    CALL CLEAR
	    CALL SETCUR
	    CALL DISP   
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;  
CLEAR   PROC
        MOV AH, 06H
        MOV BH, 07H
        MOV CX, 0
        MOV DX, 184FH
        INT 10H
        RET
CLEAR   ENDP

SETCUR  PROC
        MOV AH, 02H
        MOV BH, 0
        MOV DH, 12; ROW
        MOV DL, 39; COL
        INT 10H
        RET
SETCUR  ENDP

DISP    PROC
        MOV DX, OFFSET MSG
        MOV AH, 9
        INT 21H
        RET
DISP    ENDP
		END MAIN
ret




