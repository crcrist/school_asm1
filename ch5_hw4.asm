			.386
			.model flat,c
printf 		PROTO arg1:Ptr Byte, printlist:VARARG
			.data
msg1fmt		byte "%d",0Ah,0
ans			sdword ?
y			sdword 3
x			sdword 1
i			sdword ?
			.code
includelib	libucrt.lib
includelib  legacy_stdio_definitions.lib
includelib	libcmt.lib

;includelib	;libcvruntime.lib
main		proc
			mov ans,0
if01:		cmp y,0
			jne then01
			jmp endif01
then01:		mov ecx,1
repeat01:	mov eax,ans
			add eax,x
			mov ans,eax
			inc ecx
			cmp ecx,y
			jle repeat01
endrpt01:	nop
endif01:	mov i,ecx
			nop
			ret
main		endp
end
