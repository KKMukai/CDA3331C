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
;Memory allocation of Arrays must be done before the RESET and Stop WDT
ARY1 		.set 0x0200 ;Memory allocation ARY1
ARY1S		.set 0x0210 ;Memory allocation ARY1S
ARY2 		.set 0x0220 ;Memory allocation ARY2
ARY2S 		.set 0x0230 ;Memory allocation AR2S

			clr R4 ;clearing all register being use is a good
			clr R5 ;programming practice

SORT1		mov.w #ARY1, R4 ;initialize R4 as a pointer to array1
			mov.w #ARY1S, R6 ;initialize R4 as a pointer to array1 sorted
			call #ArraySetup1;then call subroutine ArraySetup1
			call #COPY ;Copy elements from ARY1 to ARY1S space
			call #SORT ;Sort elements in ARAY1

SORT2		mov.w #ARY2, R4 ;initialize R4 as a pointer to array2
			mov.w #ARY2S, R6 ;initialize R4 as a pointer to array2 sorted
			call #ArraySetup2;then call subroutine ArraySetup2
			call #COPY ;Copy elements from ARY2 to ARY2S space
			call #SORT ;Sort elements in ARAY2


ArraySetup1 mov.b #10,  0(R4) ;Define the number of elements in the array
			mov.b #45,  1(R4) ;store an element
			mov.b #-23, 2(R4) ;store an element
			mov.b #-78, 3(R4) ;store an element
			mov.b #32,  4(R4) ;store an element
			mov.b #89,  5(R4) ;store an element
			mov.b #-19, 6(R4) ;store an element
			mov.b #-99, 7(R4) ;store an element
			mov.b #73,  8(R4) ;store an element
			mov.b #-18, 9(R4) ;store an element
			mov.b #56,  10(R4) ;store an element
			ret

;Array element initialization Subroutine
ArraySetup2 mov.b #10,  0(R4) ;Define the number of elements in the array
			mov.b #22,  1(R4) ;store an element
			mov.b #45,  2(R4) ;store an element
			mov.b #21,  3(R4) ;store an element
			mov.b #-39, 4(R4) ;store an element
			mov.b #-63, 5(R4) ;store an element
			mov.b #69,  6(R4) ;store an element
			mov.b #72,  7(R4) ;store an element
			mov.b #41,  8(R4) ;store an element
			mov.b #28,  9(R4) ;store an element
			mov.b #-28, 10(R4) ;store an element
			ret

;Copy original Array to allocated Array-Sorted space
COPY		mov.b 0(R4), R10 ;save n (number of elements) in R10
			inc.b R10 ;increment by 1 to account for the byte n to be copied as well
			mov.w R4, R5 ;copy R4 to R5 so we keep R4 unchanged for later use
			mov.w R6, R7 ;copy R6 to R7 so we keep R6 unchanged for later use

LP 			mov.b @R5+, 0(R7) ;copy elements using R5/R7 as pointers
			inc.w R7
			dec R10
			jnz LP
			ret

;Sort the copy of Array saved in the allocated Array-Sorted space, while keeping original Array unchanged
;replace the following two lines with your actual sorting algorithm.

SORT 		clr R7
			clr R8
			clr R9
			clr R10
			clr R11
			clr R12
			clr R12
			clr R13
			clr R14
			clr R15 		;clear register's that will be used
			mov.b R5, R11 	;counter
			dec R11			;dec counter

Sort_Loop	mov.b @R4+, R7
			mov.b @R4, R8
			cmp.b R7, R8
			jz Stop_Sort
			jge Stop_Sort

			mov.b R7, R9
			mov.b R8, R7
			mov.b R9, R8
			inc R10
			mov.b R8, 0(R4)
			mov.b R7, -1(R4)

Stop_Sort	dec R11
			tst R11
			jnz SORT2
			cmp.w #0, R10 	;swap counter
			jnz Sort_Loop
			ret

;To bubble sort, you need to scan the array n-1 times,
;In every scan, you compare from top down each two consecutive elements, and you swap them if they are not in ascending order.
;Notice that in the first scan you get the largest element (no matter where it is in the array) pushed all the way to the bottom.
;So your next scan should be n-1 iterations, and then n-2 and so on.
;So every time you come back to the top of the array for a new scan, your n (the number of comparisons) must be decremented by 1.
;In the last scan, you need only one comparison.

;Hints:
;Your sorting algorithm starts with R6 as a pointer to the array
;you need to save n (number of elements) in R8, then decrement it by 1 (n-1) to become the number of comparisons.
;Copy R6 to R7 so you keep R6 unchanged as it points to the top of the array for every new scan.
;Copy n-1 to R9 and use R9 as a loop counter, while keeping the current n-1 value in R8 for the next scan.
;In the scan loop get an element and auto increment pointer R7, then get next element without changing R7.
;Compare the two elements, if not in ascending order, swap them.
;Repeat the scan from the top as pointed to by (R6), and every time decrement the number of comparisons (R8).
;-----  Your Sorting lab ends here   -------------------------------------------
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;Stack Pointer definition
			.global __STACK_END
			.sect .stack
;-------------------------------------------------------------------------------
;Interrupt Vectors
			.sect   ".reset"    ;MSP430 RESET Vector
			.short  RESET
