		.386
		.model flat
		.data
mouse	sdword  ? ; first number
num2	sdword  ? ; second number 
letter1 byte    ? ; first char
letter2 byte    ? ; second char

initial byte	? ; char initial
grade	byte	? ; char grade 
x		byte	? ; char x
y		byte	? ; char y
amount	sdword	? ; int amount
count	sdword	? ; int count
number	sdword	? ; int number


		.code
main proc
		mov mouse,-7		; intialize num1 with 5
		mov eax,mouse		; load eax with contents of num1
		mov num2,eax		; store eax in num2
		; letter1 = 'A'
		mov letter1,'A'		; store 'A' in letter1
		; letter2 = letter1
		mov al,letter1		; load al with letter1
		mov letter2,al		; store al in letter2
		
		mov grade,'B'		; char grade='B';
		mov x,'P'			; char x = 'P'
		mov y,'Q'			; char y = 'Q'
		mov count,0			; int count = 0;
		mov number,-396		; int number = -396

		ret
main	endp
end		main