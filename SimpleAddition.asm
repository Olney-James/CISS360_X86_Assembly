; SimpleAddition.asm - program that clears the screen, locates the cursor near the middle of the screen, prompts the user for two integers, adds the integers, and displays their sum. This is repeated 3 times, using a loop. The screen is cleard after each loop iteration.
; Chapter 5
; Section 5.10 Exercise 4
; Author: James Olney
include Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
yAxis = 11
xAxis = 32
intVal1 DWORD ?
intVal2 DWORD ?
intValSum DWORD 0
prompt1 BYTE "enter intVal1: ",0
prompt2 BYTE "enter intVal2: ",0
result1 BYTE "sum: ",0

.code
    main PROC
		mov ecx,3					;set ecx to loop 3 times
		myLoop:									
			call Clrscr
			mov dh,yAxis			;set y
			mov dl,xAxis			;set x
			call Gotoxy

			mov edx,OFFSET prompt1
			call WriteString		;prompt user to enter intVal1
			call ReadDec
			mov intVal1,eax			;read in intVal1
			add intValSum,eax		;add intVal1 to intValSum
			mov dh,yAxis+1			;set y
			mov dl,xAxis			;set x
			call Gotoxy

			mov edx,OFFSET prompt2
			call WriteString		;prompt user to enter intVa; RandomStrings.asm - A procedure generates a random string of length L, containing all capital letters. When calling the procedure, the value of L is passed in EAX, and pass a pointer to an array of byte that will hold the random string. This program calls the procedure 20 times, and displays the strings in the console window.
; Chapter 5
; Section 5.10 Exercise 6
; Author: James Olney
include Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
randVal byte ?
count DWORD ?
STRING_SIZE = 15
randomString DWORD ?

.code
	main PROC
		mov esi, OFFSET randomString
		mov ecx,20					;set ECX to loop 20 times
		myloop:
			mov count,ecx
			call myProcedure
			mov ecx,count
	;		mov edx,OFFSET randomString
			call WriteString
		loop myLoop
	invoke ExitProcess,0
main endp


myProcedure PROC
	mov ecx,STRING_SIZE						;set loop length
	myloop2:								;begin loop
		mov eax,26							;# in alphabet
		call RandomRange					;sets eax randomly 0-25
		add eax,65							;mov up to capital letters
		mov [esi],eax						;add variable to array
		inc esi
		;call WriteChar
	loop myloop2						;end loop
	ret
myProcedure endp

end mainl2
			call ReadDec
			mov intVal2,eax			;read in intVal2
			add intValSum,eax		;add intVal2 to intValSum
			
			mov dh,yAxis+2			;set y
			mov dl,xAxis			;set x
			call Gotoxy

			mov edx,OFFSET result1	
			call WriteString
			mov eax,intValSum
			call WriteDec			;write intValSum to the screen
			mov dh,yAxis+3			;set y
			;mov dl,xAxis			;set x
			call Gotoxy
			call waitmsg

			mov intValSum,0			;set intValSum to zero to loop through again.
		loop myLoop
		

	invoke ExitProcess,0
main endp
end main