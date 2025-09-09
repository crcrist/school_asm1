		.386
		.model flat, c
printf	PROTO arg1: Ptr Byte, printlist:VARARG
		.data
msg1fmt byte "%s", 0Ah, 0
msg1	byte "Hello Brookie! ", 0Ah, 0
		.code
		include lib liburcrt.lib
		includelib legacy_stdio_definitions.lib
		includelib libcmt.lib
		;includelib libvcruntime.lib
main	PROC
		INVOKE printf, ADDR msg1fmt, ADDR msg1
		ret
main	endp
		end