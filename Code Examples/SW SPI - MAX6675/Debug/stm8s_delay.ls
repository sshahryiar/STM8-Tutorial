   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  54                     ; 4 void delay_cycles(register unsigned short value)
  54                     ; 5 {
  56                     	switch	.text
  57  0000               _delay_cycles:
  61                     ; 6 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", value);
  64  0000 9d            nop
  65  0001                L6:
  66  0001 5a             decw X
  67  0002 26fd           jrne L6
  68  0004 9d             nop
  69                      
  71                     ; 7 }
  74  0005 81            	ret
 109                     .const:	section	.text
 110  0000               L21:
 111  0000 00000003      	dc.l	3
 112                     ; 10 void delay_us(register unsigned int  value)
 112                     ; 11 {
 113                     	switch	.text
 114  0006               _delay_us:
 118                     ; 12 	delay_cycles(ticks(value));
 120  0006 a602          	ld	a,#2
 121  0008 cd0000        	call	c_cmulx
 123  000b a603          	ld	a,#3
 124  000d cd0000        	call	c_lsbc
 126  0010 ae0000        	ldw	x,#L21
 127  0013 cd0000        	call	c_ludv
 129  0016 be02          	ldw	x,c_lreg+2
 130  0018 ade6          	call	_delay_cycles
 132                     ; 13 }
 135  001a 81            	ret
 170                     ; 16 void delay_ms(register unsigned int  value)
 170                     ; 17 {
 171                     	switch	.text
 172  001b               _delay_ms:
 174  001b 89            	pushw	x
 175       00000000      OFST:	set	0
 178  001c 2005          	jra	L56
 179  001e               L36:
 180                     ; 20 		delay_us(1000);
 182  001e ae03e8        	ldw	x,#1000
 183  0021 ade3          	call	_delay_us
 185  0023               L56:
 186                     ; 18 	while(value--)
 188  0023 1e01          	ldw	x,(OFST+1,sp)
 189  0025 1d0001        	subw	x,#1
 190  0028 1f01          	ldw	(OFST+1,sp),x
 191  002a 1c0001        	addw	x,#1
 192  002d a30000        	cpw	x,#0
 193  0030 26ec          	jrne	L36
 194                     ; 22 }
 197  0032 85            	popw	x
 198  0033 81            	ret
 211                     	xdef	_delay_ms
 212                     	xdef	_delay_us
 213                     	xdef	_delay_cycles
 214                     	xref.b	c_lreg
 215                     	xref.b	c_x
 234                     	xref	c_ludv
 235                     	xref	c_lsbc
 236                     	xref	c_cmulx
 237                     	end
