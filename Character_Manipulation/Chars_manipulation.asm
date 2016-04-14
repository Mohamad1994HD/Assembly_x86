; Convert All letters in the following sentence 
; to small letters   & Save total number of letters

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;               
SEN     DB  'I am virgin in cyprus.'
COUNT   DB  ?		
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;
		MOV SI, OFFSET SEN 
		MOV DL, 00H
		CALL CONV_
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		
CONV_:  
LP:     MOV AL,[SI]
        CMP AL,'.'
        JE  EXIT_LOOP
        CMP AL, 41H
        JB  PASS
        CMP AL, 5AH
        JA  PASS 
        OR  AL, 00100000B
        MOV [SI],AL
PASS:   INC DL
        INC SI
        JMP LP
EXIT_LOOP:  MOV COUNT, DL
        RET
        
        
        END MAIN
ret




