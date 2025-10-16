			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0Ah,0
a			sdword 4
b			sdword 5
cc			sdword 12
d			sdword 10
two			sdword 2
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib
;includelib	;libcvruntime.lib
main		proc
			
			;if (a > b)
			mov eax,a
			.if eax > b
			sub eax,1
			mov a,eax
			.endif
			
			;if (b >= cc)
			mov eax,b
			.if eax >= cc
			sub eax,2
			mov b,eax
			.endif

			;if ( cc > d)
			mov eax,cc
			.if eax > d
			add eax,d
			mov cc,eax
			.endif
			

			;else ( d / 2 )
			.if
			mov eax,d
			cdq 
			idiv two
			mov d,eax
			.endif


			INVOKE printf, ADDR msg1fmt, a
			INVOKE printf, ADDR msg1fmt, b
			INVOKE printf, ADDR msg1fmt, cc
			INVOKE printf, ADDR msg1fmt, d
			ret
main		endp
			end