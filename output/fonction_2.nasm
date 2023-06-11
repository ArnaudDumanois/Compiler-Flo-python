%include	"io.asm"
section	.bss
sinput:	resb	255	;reserve a 255 byte space in memory for the users input string
v$a:	resd	1
section	.text
global _start
_h:
	push	1		
	pop	eax		
	ret			
_g:
	push	4		
	pop	eax		
	ret			
_f:
	push	2		
	pop	eax		
	ret			
_start:
	push	ebp		
	push	esp		
	mov	ebp,	[esp+0]	
	sub	ebp,	4	
	call	_f		
	add	esp,	0	
	add	esp,	4	
	pop	ebp		
	push	eax		
	push	ebp		
	push	esp		
	mov	ebp,	[esp+0]	
	sub	ebp,	4	
	call	_g		
	add	esp,	0	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	add	eax,	ebx			 ; effectue l'opération eax+ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	ebp		
	push	esp		
	mov	ebp,	[esp+0]	
	sub	ebp,	4	
	call	_h		
	add	esp,	0	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	mov	eax,	1			 ; 1 est le code de SYS_EXIT
	mov	ebx,	0	
	int	0x80				 ; exit
