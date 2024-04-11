;-------------------------------------------------------------------------------------------;
; Author: br1ckw0rm                                                                         ;
; Date: 04/11/2024                                                                          ;
; Architecture: Intel x86_64                                                                ;
; OS: Linux                                                                                 ;
;-------------------------------------------------------------------------------------------;

section .data
	msg db "Hello World!", 0x0A, 0 ; Initialize 'Hello, World!' string.	

section .text
	global _start

_start:
	mov rsi, msg  ; Put the message into rsi
	call _strlen  ; Get the string length of the message in rsi
	mov rdx, rax  ; _strlen put the string length into the rax register
	call _print	  ; print the message
	call _exit	  ; exit

; inputs:
;	- rsi holds pointer to the string
; outputs:
;   - rax holds length of string
_strlen:
	xor rax, rax
	_strlen_loop:	
		cmp byte [rsi+rax], 0
		je _return
		inc rax
		jmp _strlen_loop

_return:
	ret

; inputs:
;  - rdx has string length
;  - rsi has the string
_print:
	mov rax, 1		
	mov rdi, 1
	syscall
	ret

_exit:
	mov rax, 60		; exit(
	mov rdi, 0		;   EXIT_SUCCESS
	syscall			; );
