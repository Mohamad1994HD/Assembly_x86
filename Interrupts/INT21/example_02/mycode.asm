
org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		; 
CR      EQU 0DH
LF      EQU 0AH

NO_MSG  DB  CR, LF, 'No Messages','$'    
MSG     DB  CR, LF, 'Hi I must leave town tomorrow','$'
PROMPT  DB  CR, LF,'There is message press Y,y to enter','$'
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;
		CALL CLEAR                  
		;
		MOV DX, OFFSET PROMPT
		CALL DISP
		;
		CALL GETCHR
		CMP AL,'y'
		JZ OVER
		CMP AL, 'Y'
		JZ OVER    
		MOV DX, OFFSET NO_MSG 
		CALL DISP   
		JMP EXIT

OVER:   MOV DX, OFFSET MSG
        CALL DISP  
    
EXIT:      
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;     

GETCHR     PROC
            MOV AH, 07H
            INT 21H 
            RET
GETCHR     ENDP    

DISP    PROC
        MOV AH, 09H
        INT 21H
        RET
DISP    ENDP
                 
CLEAR   PROC
        MOV AH, 06H
        MOV BH, 07H
        MOV CX, 0
        MOV DX, 184FH
        RET
CLEAR   ENDP
		END MAIN
ret




