      
        
CLEAR MACRO R1, C1, R2, C2
    MOV AH, 06H
    MOV CL, C1
    MOV CH, R1
    MOV DL, C2
    MOV DH, R2
    MOV BH, 07H
    INT 10H
            
ENDM           

CLEAR_SCREEN MACRO 
    CLEAR 0,0, 18H, 4FH
ENDM               

SET_CURSOR MACRO R,C
    MOV DL, C
    MOV DH, R
    MOV AH, 02H
    MOV BH, 0
    INT 10H
    ENDM
  
MODE_CGA_TXT MACRO
    MOV AH,0
    MOV AL,03H
    INT 10H                   
                   
ENDM           
      
MODE_MONO MACRO
    MOV AH,0
    MOV AL,07H
    INT 10H
ENDM

MODE_GRAPH MACRO
    MOV AH,0
    MOV AL,13H
    INT 10H
ENDM
  
PLOT_POINT MACRO X,Y,COLOR
    LOCAL SET_WHITE, OVR 
    AND AX, 0
    MOV AH, 0CH
    MOV CX, Y
    MOV DX, X 
    MOV BX, COLOR     
    CMP BX, 'b'
    JE SET_WHITE
 SET_WHITE: MOV AL, 01H
            JMP OVR
 OVR: INT 10H      
ENDM         

POINT MACRO X,Y  
    MOV BX, X                         
    MOV AX, Y
    PLOT_POINT BX,AX, 'b'
ENDM                   

