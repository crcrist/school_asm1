				.386
				.model flat, c
				.stack 100h
printf 			PROTO arg1:Ptr Byte, printlist:VARARG
scanf			PROTO arg2:Ptr Byte, inputlist:VARARG
				.data
in1fmt			byte "%d",0
msg1fmt 		byte "%s",0
msg2fmt			byte "%d%s%d%s%d",0Ah,0
msg3fmt			byte 0Ah,0
msg1 			byte "Enter a number: ",0
msg2			byte "Enter a larger number: ",0
msg3			byte "Enter an even larger number: ", 0
lthan			byte " < ",0
gthan			byte " > ",0
num1			sdword ?
num2			sdword ?
num3			sdword ?
				.code
				includelib libucrt.lib
				includelib legacy_stdio_definitions.lib
				includelib libcmt.lib
				;includelib libvcruntime.lib
main 			proc
				INVOKE printf, ADDR msg1fmt, ADDR msg1  ; ask for a number
				INVOKE scanf, ADDR in1fmt, ADDR num1	; get a number
				INVOKE printf, ADDR msg1fmt, ADDR msg2  ; ask for a larger number
				INVOKE scanf, ADDR in1fmt, ADDR num2	; get a larger number
				INVOKE printf, ADDR msg1fmt, ADDR msg3	; ask for an even larger number
				INVOKE scanf, ADDR in1fmt, ADDR num3	; get an even larger number
				INVOKE printf, ADDR msg3fmt
				INVOKE printf, ADDR msg2fmt, num1, 
				ADDR lthan, num2, ADDR lthan,
				num3
				INVOKE printf, ADDR msg2fmt, num3, 
				ADDR gthan, num2, ADDR gthan, num1
				ret
main			endp
				end