
; FindLargest.asm - program with a procedure named FindLargest that receives two parameters: a pointer to a signed doubleword array, and a count of the array's 
;length. The procedure will return the value of the largest array member in EAX. The PROC directive is used with a parameter list when declaring the procedure. All 
;registers are preserved (except EAX) that are modified by the procedure. The program calls FindLargest and passes three different arrays of different lengths. 
;Negative values are included in the arrays. A PROTO declaration is used for FindLargest.
; Chapter 8
; Section 8.11 Exercise 1
; Author: James Olney
include Irvine32.inc

.data
	Ex1Array SDWORD -1,2,3,4
	Ex2Array SDWORD -1, +1, -2, +3, +4
	Ex3Array SDWORD -2, +3, +4, +6, +1, +5
	
.code
	FindLargest PROTO,
		ptrArray:PTR SDWORD,
		szArray:SDWORD
	
    main PROC
        invoke FindLargest, ADDR Ex1Array, LENGTHOF Ex1Array
		call WriteInt
		invoke FindLargest, ADDR Ex2Array, LENGTHOF Ex2Array
		call WriteInt
		invoke FindLargest, ADDR Ex3Array, LENGTHOF Ex3Array
		call WriteInt
	invoke ExitProcess,0
main endp

FindLargest PROC USES esi ecx,
		ptrArray:PTR SDWORD,
		szArray:SDWORD
		mov esi,ptrArray
		mov ecx,szArray
		mov eax,[esi]
		cmp ecx,0					;length=0?
		je L2						;if yes: quit
			L1:
				add esi,4
				;.IF eax > [esi]
				;	mov eax,[esi]
				;.ENDIF
				cmp eax,[esi]			;eax > [esi]?
				jg L3					;go to next
					mov eax,[esi]
				L3:
			loop L1		
		L2:
		ret
	FindLargest ENDP


end main