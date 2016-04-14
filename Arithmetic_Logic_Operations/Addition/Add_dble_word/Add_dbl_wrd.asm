;

;

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
X       DD  4B1023A6H
Y       DD  C147C023H
Z       DD  ?,?
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;    
		MOV SI, OFFSET X
		MOV DI, OFFSET Y
		MOV BX, OFFSET Z
		
		CLC
		MOV CL, 2
		
RE:     MOV AX, [SI]
        ADC AX, DI
        MOV [BX], AX
        ;
        INC BX
        INC BX
        
        INC DI
        INC DI   
        
        INC SI
        INC SI
        LOOP RE
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




