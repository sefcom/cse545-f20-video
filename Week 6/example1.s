;nasm -felf64 example.s -o example
section .data
	message:    db 'Hello world!'     ; Declare message to contain the bytes 'Hello world!' (without quotes)
	msglength:  equ 12                ; Declare msglength to have the constant value 12
	buffersize: dw 1024               ; Declare buffersize to be a word containing 1024
section .bss
	filename:   resb    255           ; Reserve 255 bytes
	number:     resb    1             ; Reserve 1 byte
	bignum:     resw    1             ; Reserve 1 word (1 word = 2 bytes)
	realarray:  resq    10            ; Reserve an array of 10 reals
section .text
	global _start
_start:
  mov edx, $message
  int 80h
