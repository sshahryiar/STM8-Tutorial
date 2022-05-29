   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  64                     ; 4 void delay_us(unsigned int  value)
  64                     ; 5 {
  66                     	switch	.text
  67  0000               _delay_us:
  69  0000 89            	pushw	x
  70       00000002      OFST:	set	2
  73                     ; 6 	register unsigned int loops =  (dly_const * value) ;
  75  0001 cd0000        	call	c_uitof
  77  0004 ae0000        	ldw	x,#L73
  78  0007 cd0000        	call	c_fmul
  80  000a cd0000        	call	c_ftoi
  82  000d 1f01          	ldw	(OFST-1,sp),x
  85  000f 2008          	jra	L74
  86  0011               L34:
  87                     ; 10 		_asm ("nop");
  90  0011 9d            nop
  92                     ; 11 		loops--;
  94  0012 1e01          	ldw	x,(OFST-1,sp)
  95  0014 1d0001        	subw	x,#1
  96  0017 1f01          	ldw	(OFST-1,sp),x
  98  0019               L74:
  99                     ; 8 	while(loops)
 101  0019 1e01          	ldw	x,(OFST-1,sp)
 102  001b 26f4          	jrne	L34
 103                     ; 13 }
 107  001d 85            	popw	x
 108  001e 81            	ret
 143                     ; 16 void delay_ms(unsigned int  value)
 143                     ; 17 {
 144                     	switch	.text
 145  001f               _delay_ms:
 147  001f 89            	pushw	x
 148       00000000      OFST:	set	0
 151  0020 200c          	jra	L37
 152  0022               L17:
 153                     ; 20 		delay_us(1000);
 155  0022 ae03e8        	ldw	x,#1000
 156  0025 add9          	call	_delay_us
 158                     ; 21 		value--;
 160  0027 1e01          	ldw	x,(OFST+1,sp)
 161  0029 1d0001        	subw	x,#1
 162  002c 1f01          	ldw	(OFST+1,sp),x
 163  002e               L37:
 164                     ; 18 	while(value)
 166  002e 1e01          	ldw	x,(OFST+1,sp)
 167  0030 26f0          	jrne	L17
 168                     ; 23 }
 172  0032 85            	popw	x
 173  0033 81            	ret
 186                     	xdef	_delay_ms
 187                     	xdef	_delay_us
 188                     .const:	section	.text
 189  0000               L73:
 190  0000 3f000000      	dc.w	16128,0
 191                     	xref.b	c_x
 211                     	xref	c_ftoi
 212                     	xref	c_fmul
 213                     	xref	c_uitof
 214                     	end
