				.386
				.model flat,c
printf 			PROTO arg1:Ptr Byte, printlist:VARARG
				.data
msg1fmt			byte "%d",0Ah,0
number			sdword 3
count			sdword 0
				.code
includelib		libucrt.lib
includelib		legacy_stdio_definitions.lib
includelib		libcmt.lib
;includelib		;libcvruntime.lib
main			proc
switch01:		cmp number,0
				je case0
				cmp number,1
				je case1
				cmp number,2
				je case2
				cmp number,3
				je case3
case0:			jmp endswitch01
case1:			add count,2
				jmp endswitch01
case2:			jmp endswitch01
case3:			sub count,2
				jmp endswitch01
endswitch01:	nop
				INVOKE printf, ADDR msg1fmt, count
				ret
main			endp
				end