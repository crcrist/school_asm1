			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0
a			sdword 1
b			sdword 2
cc			sdword 4
d			sdword 5
e			sdword 2
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			; if (a==1 ||b==2 && c>3 || d<= 4) --> e--;
if01:		cmp a,1
			je then01
			cmp b,2
			jne if02
			cmp cc,3
			jg then01

if02:		cmp d,4
			jle then01
			jmp endif01
then01:		dec e
endif01:	nop
			INVOKE printf, ADDR msg1fmt, e
			ret
main		endp
			end