			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0
w			sdword 1
x			sdword 2
y			sdword 3
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			; if (w==1 && x==2) ---> y-;
if01:		cmp w,1
			jne endif01
			cmp x,2
			jne endif01
then01:		dec y
endif01:	nop
			INVOKE printf, ADDR msg1fmt, y	
			ret
main		endp
			end