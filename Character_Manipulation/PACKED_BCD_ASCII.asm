;
; PACKED BCD TO ASCII
;

org 100h

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;  
ASC     DW  ?
PAK     DB  29H
		;
		.CODE
MAIN		PROC FAR
    		MOV AX, @DATA
    		MOV DS, AX
    		;
    		MOV AL, PAK
    		MOV AH, AL
    		MOV CL, 4
    		SHR AH, CL
    		OR AX, 3030H
    		XCHG AH,AL ; SWAP FOR ASCII STORAGE CONVENTION
    		MOV ASC, AX
    		;
    		MOV AH, 4CH
    		INT 21H
MAIN		ENDP
		;
		END MAIN
ret




