;
; Write an assembly language program that will
; process the given sentence as follows:
; a) Toggle only the lower case letters to Upper case
; b) Count and save the number of letters changing
;    case and number of characters remaining unchanged

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;   
A       DB  "Eastern."
COUNT_L DB  ?
COUNT_H DB  ?
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;  
		AND AX,0
		MOV SI, OFFSET A
        MOV CX,0
TO_UPPER:   MOV AL, [SI]
    		CMP AL,'.'
    		JE  EXIT
    		CMP AL,'a'
    		JB  PASS
    		CMP AL,'z'
    		JA  PASS 
    		OR AL, 00100000B
            INC CL; CL counts the lower letters
            MOV [SI],AL ; Save back
          ;
PASS:   INC CH; CH counts the total letters
        INC SI                   
        JMP TO_UPPER
        ;
EXIT:   MOV COUNT_L, CL
        SUB CH, CL
        MOV COUNT_H, CH
		;
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




