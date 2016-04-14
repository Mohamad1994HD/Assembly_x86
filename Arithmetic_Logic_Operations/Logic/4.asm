

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;       
A       DD  8F6E4937H
B       DD  ?
C       DD  ?
D       DD  ?
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;     
		;     
        CALL GET_DATA
        ;a
        CALL do_A
        ;  
        CALL GET_DATA
        ;
        ;b
        CALL do_B
        ;    
        ;c
        CALL do_C
        
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;          
		;        
GET_DATA:   MOV SI, OFFSET A
            MOV AX, WORD PTR [SI]
            MOV BX, WORD PTR [SI+2]
            RET
            ;
            ;            
do_A:   OR BX, 1000000000000000B
        AND AX, 0
        MOV SI, OFFSET B
        MOV [SI], AX
        MOV [SI]+2, BX         
        RET
        ;
do_B:   XOR AX, 0000000000001111B   ;LSB toggle
        XOR BX, 1111000000000000B   ;MSB toggle
        MOV SI, OFFSET C
        MOV [SI], AX
        MOV [SI]+2, BX
        RET  
        ; 
do_C:   CALL GET_DATA
        XCHG BH, AL
        MOV SI, OFFSET D
        MOV [SI], AX
        MOV [DI], BX
        RET
        ;
		END MAIN
ret




