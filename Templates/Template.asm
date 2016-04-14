
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here 
    
        .MODEL SMALL
        .STACK 64
        .DATA
        ;
        ;
        .CODE
MAIN    PROC FAR
        MOV AX, @DATA  ; Load data into ax
        MOV DS, AX     ; Load data into data segment
        ;       
        ;
        MOV AH, 4CH    ; setup to
        INT 21H        ; return to Operating System
MAIN    ENDP           ; End of procedure
        ;
        ;
        END MAIN       ; End of program, indicating the entry point has ended
                       ; Labels for entry point, end must maatch!!
ret




