			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
scanf		PROTO arg2:Ptr Byte, inputlist:VARARG
			.data
in1fmt		byte "%d",0
msg1fmt 	byte 0Ah,"%s",0
msg2fmt		byte 0Ah,"%s",0Ah,0Ah,0
msg3fmt		byte "%s%d%s%d",0Ah,0Ah
msg1 		byte "Enter a value for num1: ",0
msg2		byte "Enter a value for num2: ",0
msg3		byte "num1 num2", 0
msg4		byte " ",0
num1		sdword ?
num2		sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main 		proc
			INVOKE printf, ADDR msg1fmt, ADDR msg1  ; ask for num1 value
			INVOKE scanf, ADDR in1fmt, ADDR num1	; scans value for num1
			INVOKE printf, ADDR msg1fmt, ADDR msg2  ; ask for num2 value
			INVOKE scanf, ADDR in1fmt, ADDR num2	; scan value for num2
			INVOKE printf, ADDR msg2fmt, ADDR msg3	; print num1 and num2
			INVOKE printf, ADDR msg3fmt, ADDR msg4, num1, ADDR msg4, num2 ; print last longer string 
			ret
main		endp
			end
