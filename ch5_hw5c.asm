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

				mov eax,15
				mov ebx,4

				mov ecx,eax
				mov edx,0

				.if eax>=ebx
				.repeat
				sub eax,ebx
				inc edx
				cmp eax,ebx
				jb done
				.untilcxz
				.endif
				done:
				xchg eax,edx
				ret
main			endp
end