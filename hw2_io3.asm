			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt 	byte 0Ah,"%s%d%s%d%s",0Ah,0
msg2fmt 	byte 0Ah,"%s%d",0Ah,0Ah,0
msg11 		byte "The first number is ",0
msg12 		byte ", but the second number is ",0
msg13 		byte ",",0
msg2 		byte "while the third number is ",0
num1 		sdword 5
num2 		sdword 7
num3 		sdword 11
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main 		proc
INVOKE printf, ADDR msg1fmt, ADDR msg11, num1,
ADDR msg12, num2, ADDR msg13
INVOKE printf, ADDR msg2fmt, ADDR msg2, num3
			ret
main		endp
			end
