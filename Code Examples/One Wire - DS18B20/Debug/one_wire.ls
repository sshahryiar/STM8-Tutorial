   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  81                     ; 4 bool onewire_reset(void)  
  81                     ; 5 {                                         
  83                     	switch	.text
  84  0000               _onewire_reset:
  86  0000 88            	push	a
  87       00000001      OFST:	set	1
  90                     ; 6 	 bool res = FALSE; 
  92                     ; 8 	 DS18B20_OUTPUT();                 
  94  0001 ae500f        	ldw	x,#20495
  95  0004 cd0000        	call	_GPIO_DeInit
  99  0007 4bf0          	push	#240
 100  0009 4b04          	push	#4
 101  000b ae500f        	ldw	x,#20495
 102  000e cd0000        	call	_GPIO_Init
 104  0011 85            	popw	x
 105                     ; 9 	 DS18B20_OUT_LOW();
 107  0012 4b04          	push	#4
 108  0014 ae500f        	ldw	x,#20495
 109  0017 cd0000        	call	_GPIO_WriteLow
 111  001a 84            	pop	a
 112                     ; 10 	 delay_us(480);        
 114  001b ae01e0        	ldw	x,#480
 115  001e cd0000        	call	_delay_us
 117                     ; 11 	 DS18B20_OUT_HIGH();
 119  0021 4b04          	push	#4
 120  0023 ae500f        	ldw	x,#20495
 121  0026 cd0000        	call	_GPIO_WriteHigh
 123  0029 84            	pop	a
 124                     ; 12 	 delay_us(60);        
 126  002a ae003c        	ldw	x,#60
 127  002d cd0000        	call	_delay_us
 129                     ; 14 	 DS18B20_INPUT();
 131  0030 ae500f        	ldw	x,#20495
 132  0033 cd0000        	call	_GPIO_DeInit
 136  0036 4b00          	push	#0
 137  0038 4b04          	push	#4
 138  003a ae500f        	ldw	x,#20495
 139  003d cd0000        	call	_GPIO_Init
 141  0040 85            	popw	x
 142                     ; 15 	 res = DS18B20_IN();
 144  0041 4b04          	push	#4
 145  0043 ae500f        	ldw	x,#20495
 146  0046 cd0000        	call	_GPIO_ReadInputPin
 148  0049 5b01          	addw	sp,#1
 149  004b 6b01          	ld	(OFST+0,sp),a
 151                     ; 16 	 delay_us(480);       
 153  004d ae01e0        	ldw	x,#480
 154  0050 cd0000        	call	_delay_us
 156                     ; 18 	 return res; 
 158  0053 7b01          	ld	a,(OFST+0,sp)
 161  0055 5b01          	addw	sp,#1
 162  0057 81            	ret
 202                     ; 22 void onewire_write_bit(bool bit_value)
 202                     ; 23 {
 203                     	switch	.text
 204  0058               _onewire_write_bit:
 206  0058 88            	push	a
 207       00000000      OFST:	set	0
 210                     ; 24 	DS18B20_OUTPUT();
 212  0059 ae500f        	ldw	x,#20495
 213  005c cd0000        	call	_GPIO_DeInit
 217  005f 4bf0          	push	#240
 218  0061 4b04          	push	#4
 219  0063 ae500f        	ldw	x,#20495
 220  0066 cd0000        	call	_GPIO_Init
 222  0069 85            	popw	x
 223                     ; 25 	DS18B20_OUT_LOW(); 
 225  006a 4b04          	push	#4
 226  006c ae500f        	ldw	x,#20495
 227  006f cd0000        	call	_GPIO_WriteLow
 229  0072 84            	pop	a
 230                     ; 27 	if(bit_value)
 232  0073 0d01          	tnz	(OFST+1,sp)
 233  0075 270f          	jreq	L17
 234                     ; 29 		delay_us(104);
 236  0077 ae0068        	ldw	x,#104
 237  007a cd0000        	call	_delay_us
 239                     ; 30 		DS18B20_OUT_HIGH();   
 241  007d 4b04          	push	#4
 242  007f ae500f        	ldw	x,#20495
 243  0082 cd0000        	call	_GPIO_WriteHigh
 245  0085 84            	pop	a
 246  0086               L17:
 247                     ; 32 }     
 250  0086 84            	pop	a
 251  0087 81            	ret
 281                     ; 35 bool onewire_read_bit(void)        
 281                     ; 36 {     
 282                     	switch	.text
 283  0088               _onewire_read_bit:
 287                     ; 37 	DS18B20_OUTPUT();
 289  0088 ae500f        	ldw	x,#20495
 290  008b cd0000        	call	_GPIO_DeInit
 294  008e 4bf0          	push	#240
 295  0090 4b04          	push	#4
 296  0092 ae500f        	ldw	x,#20495
 297  0095 cd0000        	call	_GPIO_Init
 299  0098 85            	popw	x
 300                     ; 38 	DS18B20_OUT_LOW();  
 302  0099 4b04          	push	#4
 303  009b ae500f        	ldw	x,#20495
 304  009e cd0000        	call	_GPIO_WriteLow
 306  00a1 84            	pop	a
 307                     ; 39 	DS18B20_OUT_HIGH();  
 309  00a2 4b04          	push	#4
 310  00a4 ae500f        	ldw	x,#20495
 311  00a7 cd0000        	call	_GPIO_WriteHigh
 313  00aa 84            	pop	a
 314                     ; 40     delay_us(15);      
 316  00ab ae000f        	ldw	x,#15
 317  00ae cd0000        	call	_delay_us
 319                     ; 41     DS18B20_INPUT();
 321  00b1 ae500f        	ldw	x,#20495
 322  00b4 cd0000        	call	_GPIO_DeInit
 326  00b7 4b00          	push	#0
 327  00b9 4b04          	push	#4
 328  00bb ae500f        	ldw	x,#20495
 329  00be cd0000        	call	_GPIO_Init
 331  00c1 85            	popw	x
 332                     ; 43 	return(DS18B20_IN());    
 334  00c2 4b04          	push	#4
 335  00c4 ae500f        	ldw	x,#20495
 336  00c7 cd0000        	call	_GPIO_ReadInputPin
 338  00ca 5b01          	addw	sp,#1
 341  00cc 81            	ret
 390                     ; 47 void onewire_write(unsigned char value) 
 390                     ; 48 {                    
 391                     	switch	.text
 392  00cd               _onewire_write:
 394  00cd 88            	push	a
 395  00ce 5203          	subw	sp,#3
 396       00000003      OFST:	set	3
 399                     ; 49 	 unsigned char s = 0; 
 401  00d0 0f03          	clr	(OFST+0,sp)
 403                     ; 51 	 DS18B20_OUTPUT();
 405  00d2 ae500f        	ldw	x,#20495
 406  00d5 cd0000        	call	_GPIO_DeInit
 410  00d8 4bf0          	push	#240
 411  00da 4b04          	push	#4
 412  00dc ae500f        	ldw	x,#20495
 413  00df cd0000        	call	_GPIO_Init
 415  00e2 85            	popw	x
 417  00e3 205e          	jra	L341
 418  00e5               L141:
 419                     ; 55 		  if((value & (1 << s)))
 421  00e5 7b04          	ld	a,(OFST+1,sp)
 422  00e7 5f            	clrw	x
 423  00e8 97            	ld	xl,a
 424  00e9 1f01          	ldw	(OFST-2,sp),x
 426  00eb ae0001        	ldw	x,#1
 427  00ee 7b03          	ld	a,(OFST+0,sp)
 428  00f0 4d            	tnz	a
 429  00f1 2704          	jreq	L41
 430  00f3               L61:
 431  00f3 58            	sllw	x
 432  00f4 4a            	dec	a
 433  00f5 26fc          	jrne	L61
 434  00f7               L41:
 435  00f7 01            	rrwa	x,a
 436  00f8 1402          	and	a,(OFST-1,sp)
 437  00fa 01            	rrwa	x,a
 438  00fb 1401          	and	a,(OFST-2,sp)
 439  00fd 01            	rrwa	x,a
 440  00fe a30000        	cpw	x,#0
 441  0101 2720          	jreq	L741
 442                     ; 57 			  DS18B20_OUT_LOW(); 
 444  0103 4b04          	push	#4
 445  0105 ae500f        	ldw	x,#20495
 446  0108 cd0000        	call	_GPIO_WriteLow
 448  010b 84            	pop	a
 449                     ; 58 			  delay_cycles(1);   
 451  010c ae0001        	ldw	x,#1
 452  010f cd0000        	call	_delay_cycles
 454                     ; 59 			  DS18B20_OUT_HIGH();  
 456  0112 4b04          	push	#4
 457  0114 ae500f        	ldw	x,#20495
 458  0117 cd0000        	call	_GPIO_WriteHigh
 460  011a 84            	pop	a
 461                     ; 60 			  delay_us(60);   
 463  011b ae003c        	ldw	x,#60
 464  011e cd0000        	call	_delay_us
 467  0121 201e          	jra	L151
 468  0123               L741:
 469                     ; 65 		      DS18B20_OUT_LOW();           
 471  0123 4b04          	push	#4
 472  0125 ae500f        	ldw	x,#20495
 473  0128 cd0000        	call	_GPIO_WriteLow
 475  012b 84            	pop	a
 476                     ; 66 			  delay_us(60);           
 478  012c ae003c        	ldw	x,#60
 479  012f cd0000        	call	_delay_us
 481                     ; 67 			  DS18B20_OUT_HIGH();   
 483  0132 4b04          	push	#4
 484  0134 ae500f        	ldw	x,#20495
 485  0137 cd0000        	call	_GPIO_WriteHigh
 487  013a 84            	pop	a
 488                     ; 68 			  delay_cycles(1);  
 490  013b ae0001        	ldw	x,#1
 491  013e cd0000        	call	_delay_cycles
 493  0141               L151:
 494                     ; 70 		  s++;
 496  0141 0c03          	inc	(OFST+0,sp)
 498  0143               L341:
 499                     ; 53 	 while(s < 8)    
 501  0143 7b03          	ld	a,(OFST+0,sp)
 502  0145 a108          	cp	a,#8
 503  0147 259c          	jrult	L141
 504                     ; 72 }                                      
 507  0149 5b04          	addw	sp,#4
 508  014b 81            	ret
 558                     ; 75 unsigned char onewire_read(void)
 558                     ; 76 {
 559                     	switch	.text
 560  014c               _onewire_read:
 562  014c 89            	pushw	x
 563       00000002      OFST:	set	2
 566                     ; 77 	 unsigned char s = 0x00;
 568  014d 0f02          	clr	(OFST+0,sp)
 570                     ; 78 	 unsigned char value = 0x00;
 572  014f 0f01          	clr	(OFST-1,sp)
 575  0151 2060          	jra	L102
 576  0153               L502:
 577                     ; 82 		  DS18B20_OUTPUT();
 579  0153 ae500f        	ldw	x,#20495
 580  0156 cd0000        	call	_GPIO_DeInit
 584  0159 4bf0          	push	#240
 585  015b 4b04          	push	#4
 586  015d ae500f        	ldw	x,#20495
 587  0160 cd0000        	call	_GPIO_Init
 589  0163 85            	popw	x
 590                     ; 84 		  DS18B20_OUT_LOW();
 592  0164 4b04          	push	#4
 593  0166 ae500f        	ldw	x,#20495
 594  0169 cd0000        	call	_GPIO_WriteLow
 596  016c 84            	pop	a
 597                     ; 85 		  delay_cycles(1);                  
 599  016d ae0001        	ldw	x,#1
 600  0170 cd0000        	call	_delay_cycles
 602                     ; 86 		  DS18B20_OUT_HIGH();  
 604  0173 4b04          	push	#4
 605  0175 ae500f        	ldw	x,#20495
 606  0178 cd0000        	call	_GPIO_WriteHigh
 608  017b 84            	pop	a
 609                     ; 88 		  DS18B20_INPUT();
 611  017c ae500f        	ldw	x,#20495
 612  017f cd0000        	call	_GPIO_DeInit
 616  0182 4b00          	push	#0
 617  0184 4b04          	push	#4
 618  0186 ae500f        	ldw	x,#20495
 619  0189 cd0000        	call	_GPIO_Init
 621  018c 85            	popw	x
 622                     ; 89 		  if(DS18B20_IN())  
 624  018d 4b04          	push	#4
 625  018f ae500f        	ldw	x,#20495
 626  0192 cd0000        	call	_GPIO_ReadInputPin
 628  0195 5b01          	addw	sp,#1
 629  0197 4d            	tnz	a
 630  0198 2711          	jreq	L512
 631                     ; 91 		      value |=  (1 << s);                         
 633  019a 7b02          	ld	a,(OFST+0,sp)
 634  019c 5f            	clrw	x
 635  019d 97            	ld	xl,a
 636  019e a601          	ld	a,#1
 637  01a0 5d            	tnzw	x
 638  01a1 2704          	jreq	L22
 639  01a3               L42:
 640  01a3 48            	sll	a
 641  01a4 5a            	decw	x
 642  01a5 26fc          	jrne	L42
 643  01a7               L22:
 644  01a7 1a01          	or	a,(OFST-1,sp)
 645  01a9 6b01          	ld	(OFST-1,sp),a
 647  01ab               L512:
 648                     ; 94 		  delay_us(60);      
 650  01ab ae003c        	ldw	x,#60
 651  01ae cd0000        	call	_delay_us
 653                     ; 95 		  s++;
 655  01b1 0c02          	inc	(OFST+0,sp)
 657  01b3               L102:
 658                     ; 80 	 while(s < 8) 
 660  01b3 7b02          	ld	a,(OFST+0,sp)
 661  01b5 a108          	cp	a,#8
 662  01b7 259a          	jrult	L502
 663                     ; 98 	 return value;
 665  01b9 7b01          	ld	a,(OFST-1,sp)
 668  01bb 85            	popw	x
 669  01bc 81            	ret
 682                     	xdef	_onewire_read
 683                     	xdef	_onewire_write
 684                     	xdef	_onewire_read_bit
 685                     	xdef	_onewire_write_bit
 686                     	xdef	_onewire_reset
 687                     	xref	_GPIO_ReadInputPin
 688                     	xref	_GPIO_WriteLow
 689                     	xref	_GPIO_WriteHigh
 690                     	xref	_GPIO_Init
 691                     	xref	_GPIO_DeInit
 692                     	xref	_delay_us
 693                     	xref	_delay_cycles
 712                     	end
