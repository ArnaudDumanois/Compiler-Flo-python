%include	"io.asm"
section	.bss
sinput:	resb	255	;reserve a 255 byte space in memory for the users input string
v$a:	resd	1
section	.text
global _start
_start:
	push	0		
	pop	eax		
	call	iprintLF		
	push	1		
	pop	eax		
	call	iprintLF		
	push	0		
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	1		
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	0		
	push	0		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	or	eax,	ebx			 ; effectue l'opération eaxouebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	0		
	push	1		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	or	eax,	ebx			 ; effectue l'opération eaxouebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	1		
	push	0		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	or	eax,	ebx			 ; effectue l'opération eaxouebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	1		
	push	1		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	or	eax,	ebx			 ; effectue l'opération eaxouebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	0		
	push	0		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	0		
	push	1		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	1		
	push	0		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	1		
	push	1		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	0		
	push	0		
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	0		
	push	1		
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	1		
	push	0		
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	1		
	push	1		
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	0		
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	push	0		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	0		
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	push	1		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	1		
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	push	0		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	1		
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	push	1		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	0		
	push	0		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	0		
	push	1		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	1		
	push	0		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	push	1		
	push	1		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	and	eax,	ebx			 ; effectue l'opération eaxetebx et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax				 ; dépile la permière operande dans eax
	xor	eax,	1			 ; effectue l'opération non eax et met le résultat dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	call	iprintLF		
	mov	eax,	1			 ; 1 est le code de SYS_EXIT
	mov	ebx,	0	
	int	0x80				 ; exit
