%include	"io.asm"
section	.bss
sinput:	resb	255	;reserve a 255 byte space in memory for the users input string
v$a:	resd	1
section	.text
global _start
_h:
	mov	eax,	[ebp-4]	
	push	eax		
	mov	eax,	[ebp-8]	
	push	eax		
	mov	eax,	[ebp-12]	
	push	eax		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	imul	ebx				 ; effectue l'opération eax*ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	add	eax,	ebx			 ; effectue l'opération eax+ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	ret			
_g:
	mov	eax,	[ebp-4]	
	push	eax		
	pop	eax		
	cmp	eax,	0	
	je	e0		
	mov	eax,	[ebp-8]	
	push	eax		
	pop	eax		
	ret			
	e0:			
	push	-1		
	mov	eax,	[ebp-8]	
	push	eax		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	imul	ebx				 ; effectue l'opération eax*ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	ret			
_f:
	mov	eax,	[ebp-4]	
	push	eax		
	mov	eax,	[ebp-8]	
	push	eax		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	cmp	eax,	ebx			 ; compare eax et ebx
	setg	al				 ; met 1 dans al si eax > ebx, 0 sinon
	movzx	eax,	al			 ; met 0 ou 1 dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	ret			
_start:
	push	ebp		
	push	esp		
	push	1		
	push	2		
	mov	ebp,	[esp+8]	
	sub	ebp,	4	
	call	_f		
	add	esp,	8	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	push	ebp		
	push	esp		
	push	0		
	push	4		
	mov	ebp,	[esp+8]	
	sub	ebp,	4	
	call	_g		
	add	esp,	8	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	push	ebp		
	push	esp		
	push	1		
	push	5		
	mov	ebp,	[esp+8]	
	sub	ebp,	4	
	call	_g		
	add	esp,	8	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	push	ebp		
	push	esp		
	push	1		
	push	2		
	push	3		
	mov	ebp,	[esp+12]	
	sub	ebp,	4	
	call	_h		
	add	esp,	12	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	mov	eax,	1			 ; 1 est le code de SYS_EXIT
	mov	ebx,	0	
	int	0x80				 ; exit
