				;complete program - farenheit -> celsius
				;c = (f-32)/9*5
				.386
				.model flat, c
				.stack 100h
printf 			PROTO arg1:Ptr Byte, printlist:VARARG
scanf			PROTO arg2:Ptr Sdword, inputlist:VARARG
				.data
in1fmt			byte "%d",0
msg1fmt			byte "%s",0
msg2fmt			byte "%s%d",0Ah,0
msg1			byte "Enter the degrees in Fahrenheit: ",0
msg3			byte "The degrees in Celsius is: ",0
nine			sdword 9
five			sdword 5
fahrenheit		sdword ? ; degrees in fahrenheit
celsius			sdword ? ; degrees in celsius
				.code
				includelib libucrt.lib
				includelib legacy_stdio_definitions.lib
				includelib libcmt.lib
				;includelib libvcruntime.lib
main			proc
				INVOKE printf, ADDR msg1fmt, ADDR msg1		
				INVOKE scanf, ADDR in1fmt, ADDR fahrenheit
				; celsius = (fahrenheit-32)/9*5
				sub fahrenheit,32		; subtract f - 32
				mov	eax,fahrenheit		; move f to eax
				cdq						; propogate sign bit into edx register
				idiv nine				; divide edx:eax by nine
				imul five				; multiply edx:eax by five
				mov celsius,eax			; move eax into celcius
				INVOKE printf, ADDR msg2fmt, ADDR msg3, celsius
				ret
main			endp
				end