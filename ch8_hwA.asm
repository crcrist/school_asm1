				.386
				.model flat,c
printf 			PROTO arg1:Ptr Byte, printlist:VARARG
				.data
msg1fmt			byte "%d",0Ah,0
x				sdword ?,?,?
y				sdword 3 dup(5)
sum				sdword ?
				.code
includelib		libucrt.lib
includelib		legacy_stdio_definitions.lib
includelib		libcmt.lib

;includelib		;libcvruntime.lib
main			proc		
				mov eax,x+8
				mov x+0,eax
				mov eax,y+8
				mov y+0,eax

				mov sum,0
				mov ecx,3
				mov ebx,0
				.repeat
				mov eax,x[ebx]
				add sum,eax
				add ebx,4
				.untilcxz

				ret
main			endp
end