%include	"io.asm"
section	.bss
sinput:	resb	255	;reserve a 255 byte space in memory for the users input string
v$a:	resd	1
section	.text
global _start
_start:
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e0		
	push	0		
	pop	eax		
	call	iprintLF		
	e0:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e1		
	push	1		
	pop	eax		
	call	iprintLF		
	e1:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e2		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e3		
	e2:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e4		
	push	2		
	pop	eax		
	call	iprintLF		
	e4:			
	e3:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e5		
	push	3		
	pop	eax		
	call	iprintLF		
	jmp	e6		
	e5:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e7		
	push	0		
	pop	eax		
	call	iprintLF		
	e7:			
	e6:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e8		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e9		
	e8:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e10		
	push	0		
	pop	eax		
	call	iprintLF		
	e10:			
	e9:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e11		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e12		
	e11:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e13		
	push	4		
	pop	eax		
	call	iprintLF		
	e13:			
	e12:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e14		
	push	5		
	pop	eax		
	call	iprintLF		
	jmp	e15		
	e14:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e16		
	push	0		
	pop	eax		
	call	iprintLF		
	e16:			
	e15:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e17		
	push	6		
	pop	eax		
	call	iprintLF		
	jmp	e18		
	e17:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e19		
	push	0		
	pop	eax		
	call	iprintLF		
	e19:			
	e18:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e20		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e21		
	e20:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e22		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e23		
	e22:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e24		
	push	7		
	pop	eax		
	call	iprintLF		
	e24:			
	e23:			
	e21:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e25		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e26		
	e25:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e27		
	push	8		
	pop	eax		
	call	iprintLF		
	jmp	e28		
	e27:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e29		
	push	0		
	pop	eax		
	call	iprintLF		
	e29:			
	e28:			
	e26:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e30		
	push	9		
	pop	eax		
	call	iprintLF		
	jmp	e31		
	e30:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e32		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e33		
	e32:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e34		
	push	0		
	pop	eax		
	call	iprintLF		
	e34:			
	e33:			
	e31:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e35		
	push	10		
	pop	eax		
	call	iprintLF		
	jmp	e36		
	e35:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e37		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e38		
	e37:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e39		
	push	0		
	pop	eax		
	call	iprintLF		
	e39:			
	e38:			
	e36:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e40		
	push	11		
	pop	eax		
	call	iprintLF		
	jmp	e41		
	e40:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e42		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e43		
	e42:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e44		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e45		
	e44:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e46		
	push	0		
	pop	eax		
	call	iprintLF		
	e46:			
	e45:			
	e43:			
	e41:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e47		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e48		
	e47:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e49		
	push	12		
	pop	eax		
	call	iprintLF		
	jmp	e50		
	e49:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e51		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e52		
	e51:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e53		
	push	0		
	pop	eax		
	call	iprintLF		
	e53:			
	e52:			
	e50:			
	e48:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e54		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e55		
	e54:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e56		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e57		
	e56:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e58		
	push	13		
	pop	eax		
	call	iprintLF		
	jmp	e59		
	e58:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e60		
	push	0		
	pop	eax		
	call	iprintLF		
	e60:			
	e59:			
	e57:			
	e55:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e61		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e62		
	e61:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e63		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e64		
	e63:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e65		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e66		
	e65:			
	push	1		
	pop	eax		
	cmp	eax,	0	
	je	e67		
	push	14		
	pop	eax		
	call	iprintLF		
	e67:			
	e66:			
	e64:			
	e62:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e68		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e69		
	e68:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e70		
	push	0		
	pop	eax		
	call	iprintLF		
	jmp	e71		
	e70:			
	push	0		
	pop	eax		
	cmp	eax,	0	
	je	e72		
	push	0		
	pop	eax		
	call	iprintLF		
	e72:			
	e71:			
	e69:			
	mov	eax,	1			 ; 1 est le code de SYS_EXIT
	mov	ebx,	0	
	int	0x80				 ; exit
