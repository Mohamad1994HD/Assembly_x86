
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;                       
CR      EQU 0DH
LF      EQU 0AH

BUFFER  DB  9, ?, 9 DUP(?)
MSG     DB  CR, LF, 'Number is $'
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;   
		CALL CLEAR
		CALL GETDATA
		;
		CALL DISP
		;
		; Get the length and convert it to character then display it
		MOV BX, OFFSET BUFFER
		MOV CL,[BX+1]
		OR CL, 30H
		MOV DL, CL
		CALL DISPCHR
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
        ;
        ;
DISPCHR PROC
        MOV AH, 02H
        INT 21H
        RET
DISPCHR ENDP

DISP    PROC  
        MOV AH, 09H
        MOV DX, OFFSET MSG
        INT 21H
        RET
DISP    ENDP   

CLEAR   PROC
        MOV AH, 06H
        MOV BH ,07H
        MOV CX, 0
        MOV DX, 184FH
        INT 10H
        RET
CLEAR   ENDP   

GETDATA PROC
        MOV AH, 0AH
        MOV DX, OFFSET BUFFER
        INT 21H
        RET
GETDATA ENDP
		;
		END MAIN
ret




