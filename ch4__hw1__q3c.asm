			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0
w			sdword 1
y			sdword 3
x			sdword 2
z			sdword 2
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			; if ((w==1 || x==2) && y==3) --> z++;
if01:		cmp y,3
			je if02
			jmp endif01
if02:		cmp w,1
			je then01
			cmp x,2
			je	then01
			jmp endif01		; if not here the code falls through into then01, so sub always happens 
then01:		inc z
endif01:	nop
			INVOKE printf, ADDR msg1fmt, z	
			ret
main		endp
			end