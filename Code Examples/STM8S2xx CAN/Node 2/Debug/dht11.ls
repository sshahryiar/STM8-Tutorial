   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  45                     ; 4 void DHT11_init(void)
  45                     ; 5 {
  47                     	switch	.text
  48  0000               _DHT11_init:
  52                     ; 6    DHT11_INPUT();
  54  0000 ae5005        	ldw	x,#20485
  55  0003 cd0000        	call	_GPIO_DeInit
  59  0006 4b00          	push	#0
  60  0008 4b01          	push	#1
  61  000a ae5005        	ldw	x,#20485
  62  000d cd0000        	call	_GPIO_Init
  64  0010 85            	popw	x
  65                     ; 7    delay_ms(1000);
  67  0011 ae03e8        	ldw	x,#1000
  68  0014 cd0000        	call	_delay_ms
  70                     ; 8 }
  73  0017 81            	ret
 116                     ; 11 unsigned char get_byte(void)
 116                     ; 12 {
 117                     	switch	.text
 118  0018               _get_byte:
 120  0018 89            	pushw	x
 121       00000002      OFST:	set	2
 124                     ; 13    unsigned char s = 0x08;
 126  0019 a608          	ld	a,#8
 127  001b 6b01          	ld	(OFST-1,sp),a
 129                     ; 14    unsigned char value = 0x00;
 131  001d 0f02          	clr	(OFST+0,sp)
 133                     ; 16    DHT11_INPUT();
 135  001f ae5005        	ldw	x,#20485
 136  0022 cd0000        	call	_GPIO_DeInit
 140  0025 4b00          	push	#0
 141  0027 4b01          	push	#1
 142  0029 ae5005        	ldw	x,#20485
 143  002c cd0000        	call	_GPIO_Init
 145  002f 85            	popw	x
 147  0030 2037          	jra	L15
 148  0032               L74:
 149                     ; 20       value <<= 1;
 151  0032 0802          	sll	(OFST+0,sp)
 154  0034               L75:
 155                     ; 22       while(DHT11_IN() == FALSE);
 157  0034 4b01          	push	#1
 158  0036 ae5005        	ldw	x,#20485
 159  0039 cd0000        	call	_GPIO_ReadInputPin
 161  003c 5b01          	addw	sp,#1
 162  003e 4d            	tnz	a
 163  003f 27f3          	jreq	L75
 164                     ; 23       delay_us(30);
 166  0041 ae001e        	ldw	x,#30
 167  0044 cd0000        	call	_delay_us
 169                     ; 25       if(DHT11_IN())
 171  0047 4b01          	push	#1
 172  0049 ae5005        	ldw	x,#20485
 173  004c cd0000        	call	_GPIO_ReadInputPin
 175  004f 5b01          	addw	sp,#1
 176  0051 4d            	tnz	a
 177  0052 2706          	jreq	L76
 178                     ; 27           value |= 1;
 180  0054 7b02          	ld	a,(OFST+0,sp)
 181  0056 aa01          	or	a,#1
 182  0058 6b02          	ld	(OFST+0,sp),a
 184  005a               L76:
 185                     ; 30       while(DHT11_IN());
 187  005a 4b01          	push	#1
 188  005c ae5005        	ldw	x,#20485
 189  005f cd0000        	call	_GPIO_ReadInputPin
 191  0062 5b01          	addw	sp,#1
 192  0064 4d            	tnz	a
 193  0065 26f3          	jrne	L76
 194                     ; 31       s--;
 196  0067 0a01          	dec	(OFST-1,sp)
 198  0069               L15:
 199                     ; 18    while(s > 0)
 201  0069 0d01          	tnz	(OFST-1,sp)
 202  006b 26c5          	jrne	L74
 203                     ; 34    return value;
 205  006d 7b02          	ld	a,(OFST+0,sp)
 208  006f 85            	popw	x
 209  0070 81            	ret
 287                     ; 38 unsigned char get_data(void)
 287                     ; 39 {
 288                     	switch	.text
 289  0071               _get_data:
 291  0071 89            	pushw	x
 292       00000002      OFST:	set	2
 295                     ; 40 	bool chk = FALSE;
 297                     ; 41 	unsigned char s = 0x00;
 299                     ; 42 	unsigned char check_sum = 0x00;
 301  0072 0f01          	clr	(OFST-1,sp)
 303                     ; 44 	DHT11_OUTPUT();
 305  0074 ae5005        	ldw	x,#20485
 306  0077 cd0000        	call	_GPIO_DeInit
 310  007a 4bf0          	push	#240
 311  007c 4b01          	push	#1
 312  007e ae5005        	ldw	x,#20485
 313  0081 cd0000        	call	_GPIO_Init
 315  0084 85            	popw	x
 316                     ; 46 	DHT11_OUT_HIGH();
 318  0085 4b01          	push	#1
 319  0087 ae5005        	ldw	x,#20485
 320  008a cd0000        	call	_GPIO_WriteHigh
 322  008d 84            	pop	a
 323                     ; 47 	DHT11_OUT_LOW();
 325  008e 4b01          	push	#1
 326  0090 ae5005        	ldw	x,#20485
 327  0093 cd0000        	call	_GPIO_WriteLow
 329  0096 84            	pop	a
 330                     ; 49 	delay_ms(18);
 332  0097 ae0012        	ldw	x,#18
 333  009a cd0000        	call	_delay_ms
 335                     ; 51 	DHT11_OUT_HIGH();
 337  009d 4b01          	push	#1
 338  009f ae5005        	ldw	x,#20485
 339  00a2 cd0000        	call	_GPIO_WriteHigh
 341  00a5 84            	pop	a
 342                     ; 53 	delay_us(26);
 344  00a6 ae001a        	ldw	x,#26
 345  00a9 cd0000        	call	_delay_us
 347                     ; 54 	DHT11_INPUT();
 349  00ac ae5005        	ldw	x,#20485
 350  00af cd0000        	call	_GPIO_DeInit
 354  00b2 4b00          	push	#0
 355  00b4 4b01          	push	#1
 356  00b6 ae5005        	ldw	x,#20485
 357  00b9 cd0000        	call	_GPIO_Init
 359  00bc 85            	popw	x
 360                     ; 56 	chk = DHT11_IN();
 362  00bd 4b01          	push	#1
 363  00bf ae5005        	ldw	x,#20485
 364  00c2 cd0000        	call	_GPIO_ReadInputPin
 366  00c5 5b01          	addw	sp,#1
 367  00c7 6b02          	ld	(OFST+0,sp),a
 369                     ; 58 	if(chk == TRUE)
 371  00c9 7b02          	ld	a,(OFST+0,sp)
 372  00cb a101          	cp	a,#1
 373  00cd 2604          	jrne	L531
 374                     ; 60 		return 1;
 376  00cf a601          	ld	a,#1
 378  00d1 2018          	jra	L21
 379  00d3               L531:
 380                     ; 63 	delay_us(80);
 382  00d3 ae0050        	ldw	x,#80
 383  00d6 cd0000        	call	_delay_us
 385                     ; 65 	chk = DHT11_IN();
 387  00d9 4b01          	push	#1
 388  00db ae5005        	ldw	x,#20485
 389  00de cd0000        	call	_GPIO_ReadInputPin
 391  00e1 5b01          	addw	sp,#1
 392  00e3 6b02          	ld	(OFST+0,sp),a
 394                     ; 67 	if(chk == FALSE)
 396  00e5 0d02          	tnz	(OFST+0,sp)
 397  00e7 2604          	jrne	L731
 398                     ; 69 		return 2;
 400  00e9 a602          	ld	a,#2
 402  00eb               L21:
 404  00eb 85            	popw	x
 405  00ec 81            	ret
 406  00ed               L731:
 407                     ; 72 	delay_us(80);
 409  00ed ae0050        	ldw	x,#80
 410  00f0 cd0000        	call	_delay_us
 412                     ; 74 	for(s = 0; s <= 4; s += 1)
 414  00f3 0f02          	clr	(OFST+0,sp)
 416  00f5               L141:
 417                     ; 76 		values[s] = get_byte();
 419  00f5 7b02          	ld	a,(OFST+0,sp)
 420  00f7 5f            	clrw	x
 421  00f8 97            	ld	xl,a
 422  00f9 89            	pushw	x
 423  00fa cd0018        	call	_get_byte
 425  00fd 85            	popw	x
 426  00fe d70000        	ld	(_values,x),a
 427                     ; 74 	for(s = 0; s <= 4; s += 1)
 429  0101 0c02          	inc	(OFST+0,sp)
 433  0103 7b02          	ld	a,(OFST+0,sp)
 434  0105 a105          	cp	a,#5
 435  0107 25ec          	jrult	L141
 436                     ; 79 	DHT11_OUTPUT();
 438  0109 ae5005        	ldw	x,#20485
 439  010c cd0000        	call	_GPIO_DeInit
 443  010f 4bf0          	push	#240
 444  0111 4b01          	push	#1
 445  0113 ae5005        	ldw	x,#20485
 446  0116 cd0000        	call	_GPIO_Init
 448  0119 85            	popw	x
 449                     ; 80 	DHT11_OUT_HIGH(); 
 451  011a 4b01          	push	#1
 452  011c ae5005        	ldw	x,#20485
 453  011f cd0000        	call	_GPIO_WriteHigh
 455  0122 84            	pop	a
 456                     ; 82 	for(s = 0; s < 4; s++)
 458  0123 0f02          	clr	(OFST+0,sp)
 460  0125               L351:
 461                     ; 84 	check_sum += values[s];
 463  0125 7b02          	ld	a,(OFST+0,sp)
 464  0127 5f            	clrw	x
 465  0128 97            	ld	xl,a
 466  0129 7b01          	ld	a,(OFST-1,sp)
 467  012b db0000        	add	a,(_values,x)
 468  012e 6b01          	ld	(OFST-1,sp),a
 470                     ; 82 	for(s = 0; s < 4; s++)
 472  0130 0c02          	inc	(OFST+0,sp)
 476  0132 7b02          	ld	a,(OFST+0,sp)
 477  0134 a104          	cp	a,#4
 478  0136 25ed          	jrult	L351
 479                     ; 87 	if(check_sum != values[4])
 481  0138 7b01          	ld	a,(OFST-1,sp)
 482  013a c10004        	cp	a,_values+4
 483  013d 2704          	jreq	L161
 484                     ; 89 		return 3;
 486  013f a603          	ld	a,#3
 488  0141 20a8          	jra	L21
 489  0143               L161:
 490                     ; 93 		return 0;
 492  0143 4f            	clr	a
 494  0144 20a5          	jra	L21
 507                     	xdef	_get_data
 508                     	xdef	_get_byte
 509                     	xdef	_DHT11_init
 510                     	xref	_values
 511                     	xref	_delay_ms
 512                     	xref	_delay_us
 513                     	xref	_GPIO_ReadInputPin
 514                     	xref	_GPIO_WriteLow
 515                     	xref	_GPIO_WriteHigh
 516                     	xref	_GPIO_Init
 517                     	xref	_GPIO_DeInit
 536                     	end
