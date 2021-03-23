;gcc -nostdlib -static ./example.s 
.global _start
_start:
.intel_syntax noprefix
  mov rdx, message
  int 80

message:
  .string "abc"
