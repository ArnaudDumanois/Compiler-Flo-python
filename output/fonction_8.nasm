%include	"io.asm"
section	.bss
sinput:	resb	255	;reserve a 255 byte space in memory for the users input string
v$a:	resd	1
section	.text
global _start
_quadriple:
	push	ebp		
	push	esp		
	push	5		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_double		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	ebp		
	push	esp		
	mov	eax,	[ebp-4]	
	push	eax		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_double		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	push	ebp		
	push	esp		
	mov	eax,	[ebp-4]	
	push	eax		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_double		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	add	eax,	ebx			 ; effectue l'opération eax+ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	ret			
_double:
	mov	eax,	[ebp-4]	
	push	eax		
	mov	eax,	[ebp-4]	
	push	eax		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	add	eax,	ebx			 ; effectue l'opération eax+ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	mov	[ebp-4],	eax	
	mov	eax,	[ebp-4]	
	push	eax		
	pop	eax		
	ret			
_start:
	push	ebp		
	push	esp		
	push	5		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_double		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	ebp		
	push	esp		
	push	10		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_quadriple		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	mov	eax,	1			 ; 1 est le code de SYS_EXIT
	mov	ebx,	0	
	int	0x80				 ; exit
