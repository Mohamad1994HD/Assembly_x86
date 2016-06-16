

org 100h

LETTER_UP MACRO LETTER, TO; save to
          MOV AL, LETTER
          CMP AL, 'a'
          JB OVER1
          CMP AL, 'z'
          JA OVER1
          AND AL, UPPER
OVER1:     MOV TO, AL  
          ENDM      
             
LETTER_DOWN MACRO   LETTER, TO; save to
            MOV AL, LETTER
            CMP AL, 'A'
            JB  OVER2
            CMP AL, 'Z'
            JA  OVER2
            OR  AL, LOWER
OVER2:       MOV TO, AL
            ENDM


DISP    MACRO   STR
        MOV DX, OFFSET STR
        MOV AH, 09H
        INT 21H
        ENDM   

; add your code here
		.MODEL SMALL
		.STACK 64
		;
		.DATA
		;
CR      EQU 0DH
LF      EQU 0AH
  
DATA1   DB  'AlBeRt EiNsTeIn',CR,LF,'$'
DATA2   DB  20 DUP(?),CR,LF,'$'
UPPER   DB  11011111B
LOWER   DB  00100000B
		;
		.CODE
MAIN		PROC FAR
		MOV AX, @DATA
		MOV DS, AX   
		;  
	
      
        DISP DATA1
        CALL CONV
        DISP DATA2
        
		MOV AH, 4CH
		INT 21H
MAIN		ENDP
		;

CONV    PROC
        AND BH,0
        MOV CX, 20
		MOV DI, OFFSET DATA1
		MOV SI, OFFSET DATA2
RP:     CMP [DI], 20H 
        JE FLG
        CMP BH, 1111B
        JE  UPPERS
        JMP LOWERS

FLG: OR BH, 1111B
     JMP OVR
        ; upper case
UPPERS: LETTER_UP [DI], [SI]
        JMP OVR
        
LOWERS: LETTER_DOWN [DI], [SI]
        
OVR:    INC SI
        INC DI     
        LOOP RP        

        RET
CONV    ENDP
		END MAIN
ret









