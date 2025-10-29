			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0Ah,0
i			sdword ?
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			mov i,1
			.while i<=3
			;body of the loop
			inc i
while01:	cmp i,3
			jg endw01
			inc i
			jmp while01
endw01:		nop
			INVOKE printf, ADDR msg1fmt, i	
			.endw
			ret
main		endp
			end