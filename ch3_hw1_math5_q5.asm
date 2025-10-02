			; number = 7-number*3
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
scanf		PROTO arg2:Ptr Sdword, inputlist:VARARG
			.data
in1fmt		byte "%d",0
msg1fmt		byte 0Ah,"%s",0
msg2fmt		byte 0Ah,"%s%d",0Ah,0Ah,0
msg1		byte "Enter an integer: ",0
msg2		byte "The integer is: ",0
three		sdword 3 ; int three (can't multiply directly by immediate value) 
number		sdword ? ; int number 
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			INVOKE printf, ADDR msg1fmt, ADDR msg1		
			INVOKE scanf, ADDR in1fmt, ADDR number
			mov eax,number			; load number into eax for imul
			imul three				; multiply eax * 3
			mov number,eax			; move result back into number
			mov eax, 7				; put 7 in eax
			sub eax,number			; subtract eax (7) - number
			mov number, eax			; put result of 7 - number
			INVOKE printf, ADDR msg2fmt, ADDR msg2, number
			ret
main		endp
			end