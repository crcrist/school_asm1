			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0
num			sdword 0
count		sdword 2
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			; if (!(num > 0 && num <= 3)) --> count = count - 2;
			; if (num!>0 || num!<=3) --> count = count - 2;
if01:		cmp num,0
			jle then01
			cmp num,3
			jg then01
			jmp endif01		; if not here the code falls through into then01, so sub always happens 
then01:		sub count,2
endif01:	nop
			INVOKE printf, ADDR msg1fmt, count	
			ret
main		endp
			end