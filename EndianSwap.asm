; EndianSwap.asm - Uses the variables in .data and MOV instructions to copy the value from bigEndian to littleEndian, reversing the order of the bytes. The number's 32-bit value is understood to be 12345678 hexadecimal.
; Chapter 4
; 4.10 Exercise 1
; Author: James Olney

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
bigEndian BYTE 12h,34h,56h,78h			; &bigEndian = 12 34 56 78
littleEndian DWORD ?

.code
main proc
	mov al,byte ptr bigEndian			; al = 12
	mov byte ptr littleEndian+3, al		; &littleEndian = 00 00 00 12
	mov al,byte ptr bigEndian+1			; al = 34
	mov byte ptr littleEndian+2, al		; &littleEndian = 00 00 34 12
	mov al,byte ptr bigEndian+2			; al = 56
	mov byte ptr littleEndian+1, al		; &littleEndian = 00 56 34 12
	mov al,byte ptr bigEndian+3			; al = 78
	mov byte ptr littleEndian, al		; &littleEndian = 78 56 34 12


	invoke ExitProcess,0
main endp
end main