

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
A       DD AAH,DDH,CCH
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;  
        MOV SI,OFFSET A
        MOV AX, WORD PTR [SI]
        PUSH AX
        MOV AX, WORD PTR [SI+2]
        PUSH AX
        MOV AX, WORD PTR [SI+10]
        MOV [SI], AX
        MOV AX, WORD PTR [SI+8]
        MOV [SI+2], AX
        
        POP AX
        MOV [SI+8], AX
        POP AX
        MOV [SI+10], AX	    
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




