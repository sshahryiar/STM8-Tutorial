   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  59                     ; 4 void delay_us(unsigned int  value)
  59                     ; 5 {
  60                     	switch	.text
  61  0000               f_delay_us:
  63  0000 89            	pushw	x
  64       00000002      OFST:	set	2
  67                     ; 6 	register unsigned int loops =  (dly_const * value) ;
  69  0001 8d000000      	callf	d_uitof
  71  0005 ae0000        	ldw	x,#L33
  72  0008 8d000000      	callf	d_fmul
  74  000c 8d000000      	callf	d_ftoi
  76  0010 1f01          	ldw	(OFST-1,sp),x
  79  0012 2008          	jra	L34
  80  0014               L73:
  81                     ; 10 		_asm ("nop");
  84  0014 9d            nop
  86                     ; 11 		loops--;
  88  0015 1e01          	ldw	x,(OFST-1,sp)
  89  0017 1d0001        	subw	x,#1
  90  001a 1f01          	ldw	(OFST-1,sp),x
  92  001c               L34:
  93                     ; 8 	while(loops)
  95  001c 1e01          	ldw	x,(OFST-1,sp)
  96  001e 26f4          	jrne	L73
  97                     ; 13 }
 101  0020 85            	popw	x
 102  0021 87            	retf
 134                     ; 16 void delay_ms(unsigned int  value)
 134                     ; 17 {
 135                     	switch	.text
 136  0022               f_delay_ms:
 138  0022 89            	pushw	x
 139       00000000      OFST:	set	0
 142  0023 200e          	jra	L56
 143  0025               L36:
 144                     ; 20 		delay_us(1000);
 146  0025 ae03e8        	ldw	x,#1000
 147  0028 8d000000      	callf	f_delay_us
 149                     ; 21 		value--;
 151  002c 1e01          	ldw	x,(OFST+1,sp)
 152  002e 1d0001        	subw	x,#1
 153  0031 1f01          	ldw	(OFST+1,sp),x
 154  0033               L56:
 155                     ; 18 	while(value)
 157  0033 1e01          	ldw	x,(OFST+1,sp)
 158  0035 26ee          	jrne	L36
 159                     ; 23 }
 163  0037 85            	popw	x
 164  0038 87            	retf
 176                     	xdef	f_delay_ms
 177                     	xdef	f_delay_us
 178                     .const:	section	.text
 179  0000               L33:
 180  0000 3f800000      	dc.w	16256,0
 181                     	xref.b	c_x
 201                     	xref	d_ftoi
 202                     	xref	d_fmul
 203                     	xref	d_uitof
 204                     	end
