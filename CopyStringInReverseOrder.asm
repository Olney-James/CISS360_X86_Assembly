; PrimeNumbers.asm - program that generates all prime numbers between 2 and 1000, using the Sieve of Eratosthenes method. You can find many articles that describe the method for finding primes in this manner on the Internet. Display all the prime values.
; Chapter 7
; Section 7.10 Exercise 5
; Author: James Olney
include Irvine32.inc

.data
	SPACE=32
	TRUE=1
	FALSE=0
	myString byte "prime numbers between 2 & 1000:",0
	myArray dword 1000 DUP(?)
	check dword 2
	divisor dword 2
	remainder dword ?
	isPrime byte FALSE

.code
    main PROC
        Clrscr
		mov ecx,1000
		mov eax,0
		mov edi,OFFSET myArray
		cld
		rep stosw
		by edi
		call sieveOfErastothenes
		mov edx,OFFSET myString
		call WriteString
		call Crlf
		mov ecx,1000
		dec ecx
		mov esi,2
		myLoop:
			cmp myArray[esi],0
			jne L1
			mov eax,esi
			call WriteDec;write value in eax
			mov al,SPACE
			call WriteChar; write al
			L1:
			inc esi
		loop myLoop
	invoke ExitProcess,0
main endp

sieveOfErastothenes PROC ;USES eax ebx ecx esi edi
	mov ecx,1000
	dec ecx
	myloop2:
		mov eax,check
		call IsPrime
		cmp isPrime,FALSE
		je L3 ;jump if not prime
		mov eax,1000
		mov ebx,check
		div ebx
		mov ecx,eax
		mov multiple,2
		myLoop3:
			mov myArray[multiple*checkPrime],1
			its multiples
			inc multiple
		loop myLoop3
		L3:
		inc check
	loop myloop2
	ret
sieveOfErastothenes ENDP

IsPrime PROC ;USES eax ebx edx
	L4:
	mov edx,0
	mov ebx,divisor
	div ebx
	mov remainder,edx
	divisor
	cmp remainder,0
	je L4
	inc ebx
	ret
IsPrime ENDP
end main