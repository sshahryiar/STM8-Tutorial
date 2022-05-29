   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  64                     ; 4 void delay_us(unsigned int  value)
  64                     ; 5 {
  66                     	switch	.text
  67  0000               _delay_us:
  69  0000 89            	pushw	x
  70       00000002      OFST:	set	2
  73                     ; 6 	register unsigned int loops =  (dly_const * value) ;
  75  0001 cd0000        	call	c_uitof
  77  0004 ae0000        	ldw	x,#L33
  78  0007 cd0000        	call	c_fmul
  80  000a cd0000        	call	c_ftoi
  83  000d 2002          	jra	L34
  84  000f               L73:
  85                     ; 10 		_asm ("nop");
  88  000f 9d            	nop	
  90                     ; 11 		loops--;
  92  0010 5a            	decw	x
  93  0011               L34:
  94  0011 1f01          	ldw	(OFST-1,sp),x
  96                     ; 8 	while(loops)
  98  0013 26fa          	jrne	L73
  99                     ; 13 }
 103  0015 85            	popw	x
 104  0016 81            	ret	
 137                     ; 16 void delay_ms(unsigned int  value)
 137                     ; 17 {
 138                     	switch	.text
 139  0017               _delay_ms:
 141  0017 89            	pushw	x
 142       00000000      OFST:	set	0
 145  0018 200a          	jra	L56
 146  001a               L36:
 147                     ; 20 		delay_us(1000);
 149  001a ae03e8        	ldw	x,#1000
 150  001d ade1          	call	_delay_us
 152                     ; 21 		value--;
 154  001f 1e01          	ldw	x,(OFST+1,sp)
 155  0021 5a            	decw	x
 156  0022 1f01          	ldw	(OFST+1,sp),x
 157  0024               L56:
 158                     ; 18 	while(value)
 160  0024 1e01          	ldw	x,(OFST+1,sp)
 161  0026 26f2          	jrne	L36
 162                     ; 23 }
 166  0028 85            	popw	x
 167  0029 81            	ret	
 180                     	xdef	_delay_ms
 181                     	xdef	_delay_us
 182                     .const:	section	.text
 183  0000               L33:
 184  0000 3f800000      	dc.w	16256,0
 185                     	xref.b	c_x
 205                     	xref	c_ftoi
 206                     	xref	c_fmul
 207                     	xref	c_uitof
 208                     	end
