				.386
				.model flat,c
printf 			PROTO arg1:Ptr Byte, printlist:VARARG
				.data
msg1fmt			byte "%d",0Ah,0
				.code
includelib		libucrt.lib
includelib		legacy_stdio_definitions.lib
includelib		libcmt.lib

;includelib		;libcvruntime.lib
main			proc		

				mov eax,10
				mov ebx,4

				mov edx,0
				.while eax >= ebx
				sub eax,ebx
				inc edx
				.endw
				xchg eax,edx
				ret
main			endp
end