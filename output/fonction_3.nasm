%include	"io.asm"
section	.bss
sinput:	resb	255	;reserve a 255 byte space in memory for the users input string
v$a:	resd	1
section	.text
global _start
_h:
	push	7		
	pop	eax		
	ret			
_g:
	push	ebp		
	push	esp		
	mov	ebp,	[esp+0]	
	sub	ebp,	4	
	call	_h		
	add	esp,	0	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	ret			
_start:
	push	ebp		
	push	esp		
	mov	ebp,	[esp+0]	
	sub	ebp,	4	
	call	_g		
	add	esp,	0	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	mov	eax,	1			 ; 1 est le code de SYS_EXIT
	mov	ebx,	0	
	int	0x80				 ; exit
