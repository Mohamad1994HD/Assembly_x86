
org 100h
  
		; 
CLEAR MACRO 
          MOV AH, 06H
          MOV BH, 07H
          MOV CX, 0
          MOV DX, 184FH
          INT 10H
      ENDM 

SETCUR MACRO X,Y
          MOV AH, 02H
          MOV BH, 00H
          MOV DL, X
          MOV DH, Y
          INT 10H
       ENDM  
        
GETCHR  MACRO
        MOV AH, 01H
        INT 21H 
        ENDM   

CHK_CHR    MACRO   
		    CMP AL,'0'
		    JB NOT_NUM
		    CMP AL, '9'
		    JA NOT_NUM
           ENDM

TO_INT MACRO TO
        AND AL, 0FH
        MOV TO, AL
       ENDM
 
PROCESS_INPUT MACRO DATA, F, S, G, V, E
                CMP DATA, 10000000B
                JB  ELSE1
                ; excellent 
                MOV DX, OFFSET E  
                JMP ENDIF
                
         ELSE1: CMP DATA, 01110000B
                JB  ELSE2;
                ; very good 
                MOV DX, OFFSET V
                JMP ENDIF
                
         ELSE2: CMP DATA, 01100000B
                JB ELSE3
                ; good  
                MOV DX, OFFSET G
                JMP ENDIF
                
         ELSE3: CMP DATA, 01010000B
                JB ELSE4
                ; satisfactory 
                MOV DX, OFFSET S
                JMP ENDIF
         
         ELSE4: ; fail
                MOV DX, OFFSET F
                 
         ENDIF: ;
ENDM  
    
DISP MACRO 
        MOV AH, 09H
        INT 21H
     ENDM
; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
FAIL    DB  'Fail','$'
SATI    DB  'Satisfactory','$'
GOOD    DB  'Good','$'
VGOD    DB  'Very good','$'
EXCE    DB  'Excellent','$'  

CONT    DB  'Press any key to continue','$'
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX
		;     
RP:		CLEAR
		GETCHR   
		CHK_CHR 
		TO_INT BH 
		MOV CL, 4
		SHL BH, CL
		GETCHR
		CHK_CHR
		TO_INT BL
		OR BL, BH
		; Set cursor at center  
		SETCUR 35,12
		; Process Message
		;
		PROCESS_INPUT BL, FAIL, SATI, GOOD, VGOD, EXCE
		
		;
		; Display 
		DISP    
		AND DX,0
	 	; Wait for any char from user  
	 	;MOV DX, OFFSET CONT
	 	;DISP
		;GETCHR
		AND AL,0
		; Repeat 
		JMP RP
		;
NOT_NUM:  ;
        MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;  

		END MAIN
ret




