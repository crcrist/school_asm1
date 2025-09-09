		.386
		.model flat, c
		.stack 100h
printf	PROTO arg1: Ptr Byte, printlist:VARARG
		.data
msg1fmt	byte "%s", 0Ah, 0
msg1	byte "Hello Brookie! ", 0Ah,0
		.code
		includelib libucrt.lib
		includelib legacy_stdio_definitions.lib
		includelib libcmt.lib
		;includelib libvcruntime.lib
main	PROC
		INVOKE printf, ADDR msg1fmt, ADDR msg1
		ret
main	endp
		end