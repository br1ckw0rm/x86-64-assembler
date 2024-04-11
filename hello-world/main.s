;-------------------------------------------------------------------------------------------;
; Author: br1ckw0rm                                                                         ;
; Date: 04/11/2024                                                                          ;
; Architecture: Intel x86_64                                                                ;
; OS: Linux                                                                                 ;
;-------------------------------------------------------------------------------------------;

section .data
	msg db "Hello World!", 0x0A, 0 ; Initialize 'Hello, World!' string.	
	msglen equ $ - msg 			   ; Get the strings length. 

section .text
	global _start

_start:
	mov rax, 1 		; write(
	mov rdi, 1		;   stdout
	mov rsi, msg	;   buffer
	mov rdx, msglen ;   count
	syscall			; )

_exit:
	mov rax, 60		; exit(
	mov rdi, 0		;   EXIT_SUCCESS
	syscall			; );
