;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
;set the pointers
REPFR   mov.w #LIST_IN, R4		;set pointer to LIST_IN array
		mov.w #LIST_OUT, R5		;set pointer to LIST_OUT array
        mov.w R5, R6			;save R6 as a pointer where m need to be stored
        clr.w R10				;counter for the updated m number

 ;get the n number an exit if the array is empty

		mov.w @R4+, R11			;save n number in R11 as a loop counter
		jz done					;exit if LIST_IN is empty
		incd.w R5				;manually increment the pointer to LIST_OUT array

;copy the first element to LIST_OUT, and exit if that is the only element

		mov.w @R4+, 0(R5)		;copy first element from LIST_IN to LIST_OUT
		incd R5					;manually increment pointer R5
		inc R10					;increment the m counter to count for first element move
		dec R11					;decrement the n counter to count for first element move
		jz done

;create a loop to compare the next element to the one before it, and if different copy it to
;the LIST_OUT, but if it is the same skip copying, then check the loop counter and loop again.
loop
		mov.w @R4+, R10
		dec R11
		cmp.w R4, R10 		;compare to list out
		incd R5
		jz done
		add.w R10, (R5) 	;add to pointer
		inc R5				;inc
		tst R11
		jmp loop			;loop

done	mov.w R10, 0(R6)               ;save the m value at the top of the LIST_OUT array
		ret
;-------------------------------------------------------------------------------

                                            

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
