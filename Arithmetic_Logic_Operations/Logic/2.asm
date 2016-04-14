;
;   MOHAMAD ALHADDAD    139098  
;   Microprocessor Lab 02 Homework
;   Implementing Assembly language program to
;   determine smallest number in array
;
;
;---------------------------------------------------

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
A       DB  19H, 93H, 69H, 55H, 99H 
LOWEST  DB  ?
COUNT   EQU 5H
		;
		.CODE
MAIN		PROC FAR
    		MOV AX, @DATA
    		MOV DS, AX
    		;
    		MOV SI, OFFSET A
    		MOV CX, COUNT
    		;
    	    CALL FIND_LOWEST 
    		;
    		MOV LOWEST, BL                
    		;
    		MOV AH, 4CH
    		INT 21H
MAIN		ENDP
		;
             
; Function will find the lowest element in the array
FIND_LOWEST: 
            MOV BL, [SI]
    	    JMP CONT ; To eliminate unnecassry first loop
    	    
COMPARE:    CMP [SI], BL 
            JA  CONT
            MOV BL, [SI]
            
CONT:       INC SI    
            
            LOOP COMPARE
            ;
            RET
            
		END MAIN
ret




