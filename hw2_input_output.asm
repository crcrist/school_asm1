		.386
		.model flat, c
		.stack 100h
printf	PROTO arg1:Ptr Byte, printlist:VARARG
scanf	PROTO arg2:Ptr Byte, inputlist:VARARG
		.data
inlfmt	byte "%d",0
msg0fmt	byte 0Ah, "%s%",0
msg1fmt byte 0Ah,"%s%d",0Ah,0Ah,0
msg0	byte "Enter an integer: ",0
msg1	byte "The integer in num2 is: ",0
num1	sdword ? ; first number
num2	sdword ? ; second number
		.code
		includelib libucrt.lib
		includelib legacy_stdio_definitions.lib
		includelib libcmt.lib
		;includelib libvcruntime.lib
main	PROC
		INVOKE printf, ADDR msg0fmt, ADDR msg0
		INVOKE scanf, ADDR inlfmt, ADDR num1
		mov eax,num1	; loading or initializing the content of eax with num1
		mov num2,eax	; store contents of eaxa into  num2
		INVOKE printf, ADDR msg1fmt, ADDR msg1, num2
		ret
main	endp
		end