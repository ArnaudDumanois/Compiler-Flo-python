%include	"io.asm"
section	.bss
sinput:	resb	255	;reserve a 255 byte space in memory for the users input string
v$a:	resd	1
section	.text
global _start
_start:
	e0:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e1		
	push	42		
	pop	eax		
	call	iprintLF		
	jmp	e0		
	e1:			
	mov	eax,	1			 ; 1 est le code de SYS_EXIT
	int	0x80				 ; exit
