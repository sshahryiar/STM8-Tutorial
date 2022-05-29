   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 4 void DHT11_init(void)
  45                     ; 5 {
  47                     	switch	.text
  48  0000               _DHT11_init:
  52                     ; 6    DHT11_INPUT();
  54  0000 ae500f        	ldw	x,#20495
  55  0003 cd0000        	call	_GPIO_DeInit
  59  0006 4b00          	push	#0
  60  0008 4b04          	push	#4
  61  000a ae500f        	ldw	x,#20495
  62  000d cd0000        	call	_GPIO_Init
  64  0010 85            	popw	x
  65                     ; 7    delay_ms(1000);
  67  0011 ae03e8        	ldw	x,#1000
  68  0014 cd0000        	call	_delay_ms
  70                     ; 8 }
  73  0017 81            	ret
 120                     ; 11 unsigned char get_byte(void)
 120                     ; 12 {
 121                     	switch	.text
 122  0018               _get_byte:
 124  0018 89            	pushw	x
 125       00000002      OFST:	set	2
 128                     ; 13    unsigned char s = 0x08;
 130  0019 a608          	ld	a,#8
 131  001b 6b01          	ld	(OFST-1,sp),a
 133                     ; 14    unsigned char value = 0x00;
 135  001d 0f02          	clr	(OFST+0,sp)
 137                     ; 16    DHT11_INPUT();
 139  001f ae500f        	ldw	x,#20495
 140  0022 cd0000        	call	_GPIO_DeInit
 144  0025 4b00          	push	#0
 145  0027 4b04          	push	#4
 146  0029 ae500f        	ldw	x,#20495
 147  002c cd0000        	call	_GPIO_Init
 149  002f 85            	popw	x
 151  0030 2037          	jra	L55
 152  0032               L35:
 153                     ; 20       value <<= 1;
 155  0032 0802          	sll	(OFST+0,sp)
 158  0034               L36:
 159                     ; 22       while(DHT11_IN() == FALSE);
 161  0034 4b04          	push	#4
 162  0036 ae500f        	ldw	x,#20495
 163  0039 cd0000        	call	_GPIO_ReadInputPin
 165  003c 5b01          	addw	sp,#1
 166  003e 4d            	tnz	a
 167  003f 27f3          	jreq	L36
 168                     ; 23       delay_us(30);
 170  0041 ae001e        	ldw	x,#30
 171  0044 cd0000        	call	_delay_us
 173                     ; 25       if(DHT11_IN())
 175  0047 4b04          	push	#4
 176  0049 ae500f        	ldw	x,#20495
 177  004c cd0000        	call	_GPIO_ReadInputPin
 179  004f 5b01          	addw	sp,#1
 180  0051 4d            	tnz	a
 181  0052 2706          	jreq	L37
 182                     ; 27           value |= 1;
 184  0054 7b02          	ld	a,(OFST+0,sp)
 185  0056 aa01          	or	a,#1
 186  0058 6b02          	ld	(OFST+0,sp),a
 188  005a               L37:
 189                     ; 30       while(DHT11_IN());
 191  005a 4b04          	push	#4
 192  005c ae500f        	ldw	x,#20495
 193  005f cd0000        	call	_GPIO_ReadInputPin
 195  0062 5b01          	addw	sp,#1
 196  0064 4d            	tnz	a
 197  0065 26f3          	jrne	L37
 198                     ; 31       s--;
 200  0067 0a01          	dec	(OFST-1,sp)
 202  0069               L55:
 203                     ; 18    while(s > 0)
 205  0069 0d01          	tnz	(OFST-1,sp)
 206  006b 26c5          	jrne	L35
 207                     ; 34    return value;
 209  006d 7b02          	ld	a,(OFST+0,sp)
 212  006f 85            	popw	x
 213  0070 81            	ret
 295                     ; 38 unsigned char get_data(void)
 295                     ; 39 {
 296                     	switch	.text
 297  0071               _get_data:
 299  0071 89            	pushw	x
 300       00000002      OFST:	set	2
 303                     ; 40 	bool chk = FALSE;
 305                     ; 41 	unsigned char s = 0x00;
 307                     ; 42 	unsigned char check_sum = 0x00;
 309  0072 0f01          	clr	(OFST-1,sp)
 311                     ; 44 	DHT11_OUTPUT();
 313  0074 ae500f        	ldw	x,#20495
 314  0077 cd0000        	call	_GPIO_DeInit
 318  007a 4bf0          	push	#240
 319  007c 4b04          	push	#4
 320  007e ae500f        	ldw	x,#20495
 321  0081 cd0000        	call	_GPIO_Init
 323  0084 85            	popw	x
 324                     ; 46 	DHT11_OUT_HIGH();
 326  0085 4b04          	push	#4
 327  0087 ae500f        	ldw	x,#20495
 328  008a cd0000        	call	_GPIO_WriteHigh
 330  008d 84            	pop	a
 331                     ; 47 	DHT11_OUT_LOW();
 333  008e 4b04          	push	#4
 334  0090 ae500f        	ldw	x,#20495
 335  0093 cd0000        	call	_GPIO_WriteLow
 337  0096 84            	pop	a
 338                     ; 49 	delay_ms(18);
 340  0097 ae0012        	ldw	x,#18
 341  009a cd0000        	call	_delay_ms
 343                     ; 51 	DHT11_OUT_HIGH();
 345  009d 4b04          	push	#4
 346  009f ae500f        	ldw	x,#20495
 347  00a2 cd0000        	call	_GPIO_WriteHigh
 349  00a5 84            	pop	a
 350                     ; 53 	delay_us(26);
 352  00a6 ae001a        	ldw	x,#26
 353  00a9 cd0000        	call	_delay_us
 355                     ; 54 	DHT11_INPUT();
 357  00ac ae500f        	ldw	x,#20495
 358  00af cd0000        	call	_GPIO_DeInit
 362  00b2 4b00          	push	#0
 363  00b4 4b04          	push	#4
 364  00b6 ae500f        	ldw	x,#20495
 365  00b9 cd0000        	call	_GPIO_Init
 367  00bc 85            	popw	x
 368                     ; 56 	chk = DHT11_IN();
 370  00bd 4b04          	push	#4
 371  00bf ae500f        	ldw	x,#20495
 372  00c2 cd0000        	call	_GPIO_ReadInputPin
 374  00c5 5b01          	addw	sp,#1
 375  00c7 6b02          	ld	(OFST+0,sp),a
 377                     ; 58 	if(chk == TRUE)
 379  00c9 7b02          	ld	a,(OFST+0,sp)
 380  00cb a101          	cp	a,#1
 381  00cd 2604          	jrne	L541
 382                     ; 60 		return 1;
 384  00cf a601          	ld	a,#1
 386  00d1 2018          	jra	L21
 387  00d3               L541:
 388                     ; 63 	delay_us(80);
 390  00d3 ae0050        	ldw	x,#80
 391  00d6 cd0000        	call	_delay_us
 393                     ; 65 	chk = DHT11_IN();
 395  00d9 4b04          	push	#4
 396  00db ae500f        	ldw	x,#20495
 397  00de cd0000        	call	_GPIO_ReadInputPin
 399  00e1 5b01          	addw	sp,#1
 400  00e3 6b02          	ld	(OFST+0,sp),a
 402                     ; 67 	if(chk == FALSE)
 404  00e5 0d02          	tnz	(OFST+0,sp)
 405  00e7 2604          	jrne	L741
 406                     ; 69 		return 2;
 408  00e9 a602          	ld	a,#2
 410  00eb               L21:
 412  00eb 85            	popw	x
 413  00ec 81            	ret
 414  00ed               L741:
 415                     ; 72 	delay_us(80);
 417  00ed ae0050        	ldw	x,#80
 418  00f0 cd0000        	call	_delay_us
 420                     ; 74 	for(s = 0; s <= 4; s += 1)
 422  00f3 0f02          	clr	(OFST+0,sp)
 424  00f5               L151:
 425                     ; 76 		values[s] = get_byte();
 427  00f5 7b02          	ld	a,(OFST+0,sp)
 428  00f7 5f            	clrw	x
 429  00f8 97            	ld	xl,a
 430  00f9 89            	pushw	x
 431  00fa cd0018        	call	_get_byte
 433  00fd 85            	popw	x
 434  00fe e700          	ld	(_values,x),a
 435                     ; 74 	for(s = 0; s <= 4; s += 1)
 437  0100 0c02          	inc	(OFST+0,sp)
 441  0102 7b02          	ld	a,(OFST+0,sp)
 442  0104 a105          	cp	a,#5
 443  0106 25ed          	jrult	L151
 444                     ; 79 	DHT11_OUTPUT();
 446  0108 ae500f        	ldw	x,#20495
 447  010b cd0000        	call	_GPIO_DeInit
 451  010e 4bf0          	push	#240
 452  0110 4b04          	push	#4
 453  0112 ae500f        	ldw	x,#20495
 454  0115 cd0000        	call	_GPIO_Init
 456  0118 85            	popw	x
 457                     ; 80 	DHT11_OUT_HIGH(); 
 459  0119 4b04          	push	#4
 460  011b ae500f        	ldw	x,#20495
 461  011e cd0000        	call	_GPIO_WriteHigh
 463  0121 84            	pop	a
 464                     ; 82 	for(s = 0; s < 4; s++)
 466  0122 0f02          	clr	(OFST+0,sp)
 468  0124               L361:
 469                     ; 84 	check_sum += values[s];
 471  0124 7b02          	ld	a,(OFST+0,sp)
 472  0126 5f            	clrw	x
 473  0127 97            	ld	xl,a
 474  0128 7b01          	ld	a,(OFST-1,sp)
 475  012a eb00          	add	a,(_values,x)
 476  012c 6b01          	ld	(OFST-1,sp),a
 478                     ; 82 	for(s = 0; s < 4; s++)
 480  012e 0c02          	inc	(OFST+0,sp)
 484  0130 7b02          	ld	a,(OFST+0,sp)
 485  0132 a104          	cp	a,#4
 486  0134 25ee          	jrult	L361
 487                     ; 87 	if(check_sum != values[4])
 489  0136 7b01          	ld	a,(OFST-1,sp)
 490  0138 b104          	cp	a,_values+4
 491  013a 2704          	jreq	L171
 492                     ; 89 		return 3;
 494  013c a603          	ld	a,#3
 496  013e 20ab          	jra	L21
 497  0140               L171:
 498                     ; 93 		return 0;
 500  0140 4f            	clr	a
 502  0141 20a8          	jra	L21
 515                     	xdef	_get_data
 516                     	xdef	_get_byte
 517                     	xdef	_DHT11_init
 518                     	xref.b	_values
 519                     	xref	_GPIO_ReadInputPin
 520                     	xref	_GPIO_WriteLow
 521                     	xref	_GPIO_WriteHigh
 522                     	xref	_GPIO_Init
 523                     	xref	_GPIO_DeInit
 524                     	xref	_delay_ms
 525                     	xref	_delay_us
 544                     	end
