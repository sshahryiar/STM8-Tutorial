   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  63                     ; 4 void delay_us(unsigned int  value)
  63                     ; 5 {
  65                     	switch	.text
  66  0000               _delay_us:
  68  0000 89            	pushw	x
  69       00000002      OFST:	set	2
  72                     ; 6 	register unsigned int loops =  (dly_const * value) ;
  74  0001 cd0000        	call	c_uitof
  76  0004 ae0000        	ldw	x,#L73
  77  0007 cd0000        	call	c_fmul
  79  000a cd0000        	call	c_ftoi
  81  000d 1f01          	ldw	(OFST-1,sp),x
  84  000f 2008          	jra	L74
  85  0011               L34:
  86                     ; 10 		_asm ("nop");
  89  0011 9d            nop
  91                     ; 11 		loops--;
  93  0012 1e01          	ldw	x,(OFST-1,sp)
  94  0014 1d0001        	subw	x,#1
  95  0017 1f01          	ldw	(OFST-1,sp),x
  97  0019               L74:
  98                     ; 8 	while(loops)
 100  0019 1e01          	ldw	x,(OFST-1,sp)
 101  001b 26f4          	jrne	L34
 102                     ; 13 }
 106  001d 85            	popw	x
 107  001e 81            	ret
 142                     ; 16 void delay_ms(unsigned int  value)
 142                     ; 17 {
 143                     	switch	.text
 144  001f               _delay_ms:
 146  001f 89            	pushw	x
 147       00000000      OFST:	set	0
 150  0020 200c          	jra	L37
 151  0022               L17:
 152                     ; 20 		delay_us(1000);
 154  0022 ae03e8        	ldw	x,#1000
 155  0025 add9          	call	_delay_us
 157                     ; 21 		value--;
 159  0027 1e01          	ldw	x,(OFST+1,sp)
 160  0029 1d0001        	subw	x,#1
 161  002c 1f01          	ldw	(OFST+1,sp),x
 162  002e               L37:
 163                     ; 18 	while(value)
 165  002e 1e01          	ldw	x,(OFST+1,sp)
 166  0030 26f0          	jrne	L17
 167                     ; 23 }
 171  0032 85            	popw	x
 172  0033 81            	ret
 185                     	xdef	_delay_ms
 186                     	xdef	_delay_us
 187                     .const:	section	.text
 188  0000               L73:
 189  0000 3e800000      	dc.w	16000,0
 190                     	xref.b	c_x
 210                     	xref	c_ftoi
 211                     	xref	c_fmul
 212                     	xref	c_uitof
 213                     	end
