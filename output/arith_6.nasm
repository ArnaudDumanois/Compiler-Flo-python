%include	"io.asm"
section	.bss
sinput:	resb	255	;reserve a 255 byte space in memory for the users input string
v$a:	resd	1
section	.text
global _start
_start:
	push	12		
	push	13		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	mov	edx,	0			 ; met 0 dans edx pour la division
	idiv	ebx				 ; effectue l'opération eax/ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	push	13		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	imul	ebx				 ; effectue l'opération eax*ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	12		
	push	13		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	imul	ebx				 ; effectue l'opération eax*ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	push	13		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	mov	edx,	0			 ; met 0 dans edx pour la division
	idiv	ebx				 ; effectue l'opération eax/ebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	47		
	push	20		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	mov	edx,	0			 ; met 0 dans edx pour la division
	idiv	ebx				 ; effectue l'opération eax%ebx et met le reste dans edx
	mov	eax,	edx			 ; met le reste dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	mov	eax,	1			 ; 1 est le code de SYS_EXIT
	mov	ebx,	0	
	int	0x80				 ; exit
