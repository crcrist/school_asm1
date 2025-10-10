			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0
count		sdword -5
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			;    .if count >= 0
			;     sub count,2
			;    .else
			;     add count,3
			;    .endif

			if01:		cmp count,0
			jl else01
			then01:		add count,3
						jmp endif01
			else01:		sub count,2
			endif01:	nop
			
			INVOKE printf, ADDR msg1fmt, count	
			ret
main		endp
			end