			;a = b - c_var / 3 (three);
			.386
			.model flat, c
			.stack 100h
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
in1fmt		byte "%d",0
b			sdword 2
c_var		sdword 4				; c is a reservered key word i guess, took me a sec to figure that
three		sdword 3
a			sdword ?
			.code
			includelib libucrt.lib
			includelib legacy_stdio_definitions.lib
			includelib libcmt.lib
			;includelib libvcruntime.lib
main		proc
			mov eax,c_var			;eax = c
			cdq						;convert to extend sign
			idiv three				;c / 3
			mov ebx,b
			sub ebx,eax
			mov a,ebx
			INVOKE printf, ADDR in1fmt, a		;print out the a
			ret
main		endp
			end