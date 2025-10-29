				.386
				.model flat,c
printf 			PROTO arg1:Ptr Byte, printlist:VARARG
				.data
msg1fmt			byte "%d",0Ah,0
ans				sdword ?
i				sdword ?
x				sdword 2
y				sdword 5
				.code
includelib		libucrt.lib
includelib		legacy_stdio_definitions.lib
includelib		libcmt.lib

;includelib		;libcvruntime.lib
main			proc		


								mov ans,0
				while01:		cmp x,0
								je endwhile01
								mov ecx,1
				while02:		cmp ecx,y
								jg	endwhile02
								mov eax,ans
								add eax,x
								mov ans,eax
								inc ecx
								jmp while02
				endwhile02:		mov i,ecx
				endwhile01:		nop

				INVOKE printf, ADDR msg1fmt, ans
				ret
main			endp
end