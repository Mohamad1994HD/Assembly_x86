
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
CR      EQU 0DH
LF      EQU 0AH  
_SP     EQU 20H

BUFFER  DB  22,?,22 DUP(?)
DATA    DB  CR, LF, 22 DUP(?)		
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;
		CALL CLEAR
		CALL SETCUR
		CALL GETDATA
		CALL CONVERT
		CALL DISP
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		;
		;
		;
CONVERT PROC
        MOV BX, OFFSET BUFFER
        MOV CL, [BX]+1
        AND CH,0
        MOV DI, CX
      ;  MOV BYTE PTR [BX+DI],2,_SP ; Replate $ with space 
        MOV SI, OFFSET DATA+2

RP:     MOV AL,[BX]+2
        CMP AL, 'a'
        JB NEXT
        CMP AL, 'z'
        JA NEXT
        AND AL, 11011111B

NEXT:   MOV [SI],AL
        INC SI
        INC BX
        LOOP RP
        
        RET
CONVERT ENDP
 
CLEAR   PROC;    CLEAR 
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
        MOV DL, 01
        MOV DH, 03
        INT 10H
        RET
SETCUR  ENDP
           
DISP    PROC
        MOV AH, 09H
        MOV DX, OFFSET DATA
        INT 21H
        RET
DISP    ENDP

GETDATA PROC
        MOV AH, 0AH
        MOV DX, OFFSET BUFFER
        INT 21H
        RET
GETDATA ENDP 

		END MAIN
ret




