

org 100h

SET_READ_MODE MACRO
	MOV DX, 037AH
	IN AL, DX
	OR AL, 00100000B
	OUT DX, AL
ENDM 

READ MACRO VAL
	MOV DX, 0378H
	IN AL, DX
	MOV VAL, AL
ENDM


; add your code here 
        INCLUDE "GRAPHICS.mac"
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;   
		CLEAR_SCREEN   
		;SET_CURSOR 12,39 
		MODE_GRAPH  
		MOV CX, 100      
		MOV SI, 30
		MOV DI, 30
      ;  PLOT_POINT SI,DI,'w'
J:      PUSH CX
 ;       POINT SI,DI
        PLOT_POINT SI,DI,'b'
        INC SI
        INC DI 
        POP CX
        LOOP J
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




