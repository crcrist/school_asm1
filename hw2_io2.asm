			.386
			.model flat, c
			.stack 100h
printf 	PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt 	byte "%s%d",0
msg2fmt 	byte "%s%d",0Ah,0Ah,0Ah,0
msg3fmt 	byte "%s%d",0Ah,0
msg1 		byte "x= ",0
msg2 		byte " y= ",0
msg3 		byte "z=",0
num1 		sdword 1
num2 		sdword 2
num3 		sdword 3
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main 		proc
INVOKE printf, ADDR msg1fmt, ADDR msg1, num1
INVOKE printf, ADDR msg2fmt, ADDR msg2, num2
INVOKE printf, ADDR msg3fmt, ADDR msg3, num3
			ret
main 		endp
			end
