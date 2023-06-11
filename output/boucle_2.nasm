%include	"io.asm"
section	.bss
sinput:	resb	255	;reserve a 255 byte space in memory for the users input string
v$a:	resd	1
section	.text
global _start
_start:
	e0:			
	mov	eax,	sinput	
	call	readline		
	call	atoi		
	push	eax		
	push	0		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	cmp	eax,	ebx			 ; compare eax et ebx
	sete	al				 ; met 1 dans al si eax == ebx, 0 sinon
	movzx	eax,	al			 ; met 0 ou 1 dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	cmp	eax,	0	
	je	e1		
	push	0		
	pop	eax		
	call	iprintLF		
	e2:			
	mov	eax,	sinput	
	call	readline		
	call	atoi		
	push	eax		
	push	1		
	pop	ebx				 ; dépile la seconde operande dans ebx
	pop	eax				 ; dépile la permière operande dans eax
	cmp	eax,	ebx			 ; compare eax et ebx
	sete	al				 ; met 1 dans al si eax == ebx, 0 sinon
	movzx	eax,	al			 ; met 0 ou 1 dans eax
	push	eax				 ; empile le résultat
	pop	eax		
	cmp	eax,	0	
	je	e3		
	push	1		
	pop	eax		
	call	iprintLF		
	jmp	e2		
	e3:			
	push	2		
	pop	eax		
	call	iprintLF		
	jmp	e0		
	e1:			
	push	3		
	pop	eax		
	call	iprintLF		
	mov	eax,	1			 ; 1 est le code de SYS_EXIT
	mov	ebx,	0	
	int	0x80				 ; exit
