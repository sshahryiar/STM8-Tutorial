   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  52                     ; 4 void delay_cycles(register unsigned short value)
  52                     ; 5 {
  54                     	switch	.text
  55  0000               _delay_cycles:
  59                     ; 6 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", value);
  62  0000 9d            nop
  63  0001                L6:
  64  0001 5a             decw X
  65  0002 26fd           jrne L6
  66  0004 9d             nop
  67                      
  69                     ; 7 }
  72  0005 81            	ret
 105                     .const:	section	.text
 106  0000               L21:
 107  0000 00000003      	dc.l	3
 108                     ; 10 void delay_us(register unsigned int  value)
 108                     ; 11 {
 109                     	switch	.text
 110  0006               _delay_us:
 114                     ; 12 	delay_cycles(ticks(value));
 116  0006 a610          	ld	a,#16
 117  0008 cd0000        	call	c_cmulx
 119  000b a603          	ld	a,#3
 120  000d cd0000        	call	c_lsbc
 122  0010 ae0000        	ldw	x,#L21
 123  0013 cd0000        	call	c_ludv
 125  0016 be02          	ldw	x,c_lreg+2
 126  0018 ade6          	call	_delay_cycles
 128                     ; 13 }
 131  001a 81            	ret
 164                     ; 16 void delay_ms(register unsigned int  value)
 164                     ; 17 {
 165                     	switch	.text
 166  001b               _delay_ms:
 168  001b 89            	pushw	x
 169       00000000      OFST:	set	0
 172  001c 2005          	jra	L75
 173  001e               L55:
 174                     ; 20 		delay_us(1000);
 176  001e ae03e8        	ldw	x,#1000
 177  0021 ade3          	call	_delay_us
 179  0023               L75:
 180                     ; 18 	while(value--)
 182  0023 1e01          	ldw	x,(OFST+1,sp)
 183  0025 1d0001        	subw	x,#1
 184  0028 1f01          	ldw	(OFST+1,sp),x
 185  002a 1c0001        	addw	x,#1
 186  002d a30000        	cpw	x,#0
 187  0030 26ec          	jrne	L55
 188                     ; 22 }
 191  0032 85            	popw	x
 192  0033 81            	ret
 205                     	xdef	_delay_ms
 206                     	xdef	_delay_us
 207                     	xdef	_delay_cycles
 208                     	xref.b	c_lreg
 209                     	xref.b	c_x
 228                     	xref	c_ludv
 229                     	xref	c_lsbc
 230                     	xref	c_cmulx
 231                     	end
