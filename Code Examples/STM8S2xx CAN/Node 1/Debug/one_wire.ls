   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
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
 100  0009 4b01          	push	#1
 101  000b ae500f        	ldw	x,#20495
 102  000e cd0000        	call	_GPIO_Init
 104  0011 85            	popw	x
 105                     ; 9 	 DS18B20_OUT_LOW();
 107  0012 4b01          	push	#1
 108  0014 ae500f        	ldw	x,#20495
 109  0017 cd0000        	call	_GPIO_WriteLow
 111  001a 84            	pop	a
 112                     ; 10 	 delay_us(480);        
 114  001b ae01e0        	ldw	x,#480
 115  001e cd0000        	call	_delay_us
 117                     ; 11 	 DS18B20_OUT_HIGH();
 119  0021 4b01          	push	#1
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
 137  0038 4b01          	push	#1
 138  003a ae500f        	ldw	x,#20495
 139  003d cd0000        	call	_GPIO_Init
 141  0040 85            	popw	x
 142                     ; 15 	 res = DS18B20_IN();
 144  0041 4b01          	push	#1
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
 218  0061 4b01          	push	#1
 219  0063 ae500f        	ldw	x,#20495
 220  0066 cd0000        	call	_GPIO_Init
 222  0069 85            	popw	x
 223                     ; 25 	DS18B20_OUT_LOW(); 
 225  006a 4b01          	push	#1
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
 241  007d 4b01          	push	#1
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
 295  0090 4b01          	push	#1
 296  0092 ae500f        	ldw	x,#20495
 297  0095 cd0000        	call	_GPIO_Init
 299  0098 85            	popw	x
 300                     ; 38 	DS18B20_OUT_LOW();  
 302  0099 4b01          	push	#1
 303  009b ae500f        	ldw	x,#20495
 304  009e cd0000        	call	_GPIO_WriteLow
 306  00a1 84            	pop	a
 307                     ; 39 	DS18B20_OUT_HIGH();  
 309  00a2 4b01          	push	#1
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
 327  00b9 4b01          	push	#1
 328  00bb ae500f        	ldw	x,#20495
 329  00be cd0000        	call	_GPIO_Init
 331  00c1 85            	popw	x
 332                     ; 43 	return(DS18B20_IN());    
 334  00c2 4b01          	push	#1
 335  00c4 ae500f        	ldw	x,#20495
 336  00c7 cd0000        	call	_GPIO_ReadInputPin
 338  00ca 5b01          	addw	sp,#1
 341  00cc 81            	ret
 386                     ; 47 void onewire_write(unsigned char value) 
 386                     ; 48 {                    
 387                     	switch	.text
 388  00cd               _onewire_write:
 390  00cd 88            	push	a
 391  00ce 5203          	subw	sp,#3
 392       00000003      OFST:	set	3
 395                     ; 49 	 unsigned char s = 0; 
 397  00d0 0f03          	clr	(OFST+0,sp)
 399                     ; 51 	 DS18B20_OUTPUT();
 401  00d2 ae500f        	ldw	x,#20495
 402  00d5 cd0000        	call	_GPIO_DeInit
 406  00d8 4bf0          	push	#240
 407  00da 4b01          	push	#1
 408  00dc ae500f        	ldw	x,#20495
 409  00df cd0000        	call	_GPIO_Init
 411  00e2 85            	popw	x
 413  00e3 205e          	jra	L731
 414  00e5               L531:
 415                     ; 55 		  if((value & (1 << s)))
 417  00e5 7b04          	ld	a,(OFST+1,sp)
 418  00e7 5f            	clrw	x
 419  00e8 97            	ld	xl,a
 420  00e9 1f01          	ldw	(OFST-2,sp),x
 422  00eb ae0001        	ldw	x,#1
 423  00ee 7b03          	ld	a,(OFST+0,sp)
 424  00f0 4d            	tnz	a
 425  00f1 2704          	jreq	L41
 426  00f3               L61:
 427  00f3 58            	sllw	x
 428  00f4 4a            	dec	a
 429  00f5 26fc          	jrne	L61
 430  00f7               L41:
 431  00f7 01            	rrwa	x,a
 432  00f8 1402          	and	a,(OFST-1,sp)
 433  00fa 01            	rrwa	x,a
 434  00fb 1401          	and	a,(OFST-2,sp)
 435  00fd 01            	rrwa	x,a
 436  00fe a30000        	cpw	x,#0
 437  0101 2720          	jreq	L341
 438                     ; 57 			  DS18B20_OUT_LOW(); 
 440  0103 4b01          	push	#1
 441  0105 ae500f        	ldw	x,#20495
 442  0108 cd0000        	call	_GPIO_WriteLow
 444  010b 84            	pop	a
 445                     ; 58 			  delay_cycles(1);   
 447  010c ae0001        	ldw	x,#1
 448  010f cd0000        	call	_delay_cycles
 450                     ; 59 			  DS18B20_OUT_HIGH();  
 452  0112 4b01          	push	#1
 453  0114 ae500f        	ldw	x,#20495
 454  0117 cd0000        	call	_GPIO_WriteHigh
 456  011a 84            	pop	a
 457                     ; 60 			  delay_us(60);   
 459  011b ae003c        	ldw	x,#60
 460  011e cd0000        	call	_delay_us
 463  0121 201e          	jra	L541
 464  0123               L341:
 465                     ; 65 		      DS18B20_OUT_LOW();           
 467  0123 4b01          	push	#1
 468  0125 ae500f        	ldw	x,#20495
 469  0128 cd0000        	call	_GPIO_WriteLow
 471  012b 84            	pop	a
 472                     ; 66 			  delay_us(60);           
 474  012c ae003c        	ldw	x,#60
 475  012f cd0000        	call	_delay_us
 477                     ; 67 			  DS18B20_OUT_HIGH();   
 479  0132 4b01          	push	#1
 480  0134 ae500f        	ldw	x,#20495
 481  0137 cd0000        	call	_GPIO_WriteHigh
 483  013a 84            	pop	a
 484                     ; 68 			  delay_cycles(1);  
 486  013b ae0001        	ldw	x,#1
 487  013e cd0000        	call	_delay_cycles
 489  0141               L541:
 490                     ; 70 		  s++;
 492  0141 0c03          	inc	(OFST+0,sp)
 494  0143               L731:
 495                     ; 53 	 while(s < 8)    
 497  0143 7b03          	ld	a,(OFST+0,sp)
 498  0145 a108          	cp	a,#8
 499  0147 259c          	jrult	L531
 500                     ; 72 }                                      
 503  0149 5b04          	addw	sp,#4
 504  014b 81            	ret
 550                     ; 75 unsigned char onewire_read(void)
 550                     ; 76 {
 551                     	switch	.text
 552  014c               _onewire_read:
 554  014c 89            	pushw	x
 555       00000002      OFST:	set	2
 558                     ; 77 	 unsigned char s = 0x00;
 560  014d 0f02          	clr	(OFST+0,sp)
 562                     ; 78 	 unsigned char value = 0x00;
 564  014f 0f01          	clr	(OFST-1,sp)
 567  0151 2060          	jra	L171
 568  0153               L571:
 569                     ; 82 		  DS18B20_OUTPUT();
 571  0153 ae500f        	ldw	x,#20495
 572  0156 cd0000        	call	_GPIO_DeInit
 576  0159 4bf0          	push	#240
 577  015b 4b01          	push	#1
 578  015d ae500f        	ldw	x,#20495
 579  0160 cd0000        	call	_GPIO_Init
 581  0163 85            	popw	x
 582                     ; 84 		  DS18B20_OUT_LOW();
 584  0164 4b01          	push	#1
 585  0166 ae500f        	ldw	x,#20495
 586  0169 cd0000        	call	_GPIO_WriteLow
 588  016c 84            	pop	a
 589                     ; 85 		  delay_cycles(1);                  
 591  016d ae0001        	ldw	x,#1
 592  0170 cd0000        	call	_delay_cycles
 594                     ; 86 		  DS18B20_OUT_HIGH();  
 596  0173 4b01          	push	#1
 597  0175 ae500f        	ldw	x,#20495
 598  0178 cd0000        	call	_GPIO_WriteHigh
 600  017b 84            	pop	a
 601                     ; 88 		  DS18B20_INPUT();
 603  017c ae500f        	ldw	x,#20495
 604  017f cd0000        	call	_GPIO_DeInit
 608  0182 4b00          	push	#0
 609  0184 4b01          	push	#1
 610  0186 ae500f        	ldw	x,#20495
 611  0189 cd0000        	call	_GPIO_Init
 613  018c 85            	popw	x
 614                     ; 89 		  if(DS18B20_IN())  
 616  018d 4b01          	push	#1
 617  018f ae500f        	ldw	x,#20495
 618  0192 cd0000        	call	_GPIO_ReadInputPin
 620  0195 5b01          	addw	sp,#1
 621  0197 4d            	tnz	a
 622  0198 2711          	jreq	L502
 623                     ; 91 		      value |=  (1 << s);                         
 625  019a 7b02          	ld	a,(OFST+0,sp)
 626  019c 5f            	clrw	x
 627  019d 97            	ld	xl,a
 628  019e a601          	ld	a,#1
 629  01a0 5d            	tnzw	x
 630  01a1 2704          	jreq	L22
 631  01a3               L42:
 632  01a3 48            	sll	a
 633  01a4 5a            	decw	x
 634  01a5 26fc          	jrne	L42
 635  01a7               L22:
 636  01a7 1a01          	or	a,(OFST-1,sp)
 637  01a9 6b01          	ld	(OFST-1,sp),a
 639  01ab               L502:
 640                     ; 94 		  delay_us(60);      
 642  01ab ae003c        	ldw	x,#60
 643  01ae cd0000        	call	_delay_us
 645                     ; 95 		  s++;
 647  01b1 0c02          	inc	(OFST+0,sp)
 649  01b3               L171:
 650                     ; 80 	 while(s < 8) 
 652  01b3 7b02          	ld	a,(OFST+0,sp)
 653  01b5 a108          	cp	a,#8
 654  01b7 259a          	jrult	L571
 655                     ; 98 	 return value;
 657  01b9 7b01          	ld	a,(OFST-1,sp)
 660  01bb 85            	popw	x
 661  01bc 81            	ret
 674                     	xdef	_onewire_read
 675                     	xdef	_onewire_write
 676                     	xdef	_onewire_read_bit
 677                     	xdef	_onewire_write_bit
 678                     	xdef	_onewire_reset
 679                     	xref	_delay_us
 680                     	xref	_delay_cycles
 681                     	xref	_GPIO_ReadInputPin
 682                     	xref	_GPIO_WriteLow
 683                     	xref	_GPIO_WriteHigh
 684                     	xref	_GPIO_Init
 685                     	xref	_GPIO_DeInit
 704                     	end
