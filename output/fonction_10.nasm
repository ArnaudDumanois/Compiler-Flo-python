%include	"io.asm"
section	.bss
sinput:	resb	255	;reserve a 255 byte space in memory for the users input string
v$a:	resd	1
section	.text
global _start
_fibo:
	mov	eax,	[ebp-4]	
	push	eax		
	push	1		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	cmp	eax,	ebx			 ; compare eax et ebx
	setle	al				 ; met 1 dans al si eax <= ebx, 0 sinon
	movzx	eax,	al			 ; met 0 ou 1 dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	cmp	eax,	0	
	je	e0		
	push	1		
	pop	eax		
	ret			
	e0:			
	push	ebp		
	push	esp		
	mov	eax,	[ebp-4]	
	push	eax		
	push	1		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	sub	eax,	ebx			 ; effectue l'opération eax-ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_fibo		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	push	ebp		
	push	esp		
	mov	eax,	[ebp-4]	
	push	eax		
	push	2		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	sub	eax,	ebx			 ; effectue l'opération eax-ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_fibo		
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
_start:
	push	ebp		
	push	esp		
	push	0		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_fibo		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	push	ebp		
	push	esp		
	push	1		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_fibo		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	push	ebp		
	push	esp		
	push	2		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_fibo		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	push	ebp		
	push	esp		
	push	3		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_fibo		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	push	ebp		
	push	esp		
	push	4		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_fibo		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	push	ebp		
	push	esp		
	push	5		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_fibo		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	push	ebp		
	push	esp		
	push	6		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_fibo		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	push	ebp		
	push	esp		
	push	7		
	mov	ebp,	[esp+4]	
	sub	ebp,	4	
	call	_fibo		
	add	esp,	4	
	add	esp,	4	
	pop	ebp		
	push	eax		
	pop	eax		
	call	iprintLF		
	mov	eax,	1			 ; 1 est le code de SYS_EXIT
	mov	ebx,	0	
	int	0x80				 ; exit
