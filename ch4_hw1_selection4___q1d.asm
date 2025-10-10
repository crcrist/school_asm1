			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0Ah,0
x			sdword 8
y			sdword 4
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
if01:	 	mov eax,y
			cmp x,eax
			jle endif01
then01:		inc x
endif01: 	nop
			INVOKE printf, ADDR msg1fmt, x
			INVOKE printf, ADDR msg1fmt, y
			ret
main		endp
			end