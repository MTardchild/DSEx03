%include "io.inc"

section .data
A DD 1h
B DD 2h
C DD 3h
RES DD 0
COUNT DD 0

%macro OUTPUT 0
    PRINT_STRING "A: "
    PRINT_HEX 4, A
    NEWLINE
    PRINT_STRING "B: "
    PRINT_HEX 4, B
    NEWLINE
    PRINT_STRING "C: "
    PRINT_HEX 4, C
    NEWLINE
    PRINT_STRING "Result: "
    PRINT_HEX 4, RES
    NEWLINE
    PRINT_STRING "Count: "
    PRINT_HEX 4, COUNT
%endmacro

%macro CALCULATE_RES 0
    mov eax, [A]
    sub eax, [B]
    add eax, [C]
    jo LEAVE_THIS_FILTHY_PLACE 
    mov [RES], eax
%endmacro

%macro DOUBLE 1
    mov eax, [%1]
    shl eax, 1
    jo LEAVE_THIS_FILTHY_PLACE
    mov [%1], eax
%endmacro

%macro INCREMENT 1
    mov eax, [%1]
    inc eax
    mov [%1], eax
%endmacro

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    
    FILTHY_PLACE:
    CALCULATE_RES
    DOUBLE A
    DOUBLE B
    DOUBLE C
    INCREMENT COUNT
    jmp FILTHY_PLACE
    
    LEAVE_THIS_FILTHY_PLACE:
    OUTPUT
    
    xor eax, eax
    ret