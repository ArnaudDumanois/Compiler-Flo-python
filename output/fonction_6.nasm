%include	"io.asm"
section	.bss
sinput:	resb	255	;reserve a 255 byte space in memory for the users input string
v$a:	resd	1
section	.text
global _start
_f:
	mov	eax,	[ebp-4]	
	push	eax		
	pop	eax		
	call	iprintLF		
	push	1		
	pop	eax		
	ret			
_start:
	push	ebp		
	push	esp		
	push	5		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_f		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	mov	eax,	1			 ; 1 est le code de SYS_EXIT
	mov	ebx,	0	
	int	0x80				 ; exit
