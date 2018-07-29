; IntegerExpressionCalculation.asm - Calculates the following expression using registers: A =(A + B) - (C + D).
; Chapter 3
; 3.10 Exercise 1
; Author: James Olney

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
varA DWORD 4						; create varA
varB DWORD 3						; create varB
varC DWORD 2						; create varC
varD DWORD 3						; create varD 

.code
main proc
	mov	eax,varA					; assign value varA to EAX
	mov ebx,varB					; assign value varB to EBX
	mov ecx,varC					; assign value varC to ECX
	mov edx,varD					; assign value varD to EDX				
	add eax,ebx						; (A + B)
	add ecx,edx						; (C + D)
	sub eax,ecx						; (A + B) - (C + D)
	mov varA,eax					; A = (A + B) - (C + D)	

	invoke ExitProcess,0
main endp
end main