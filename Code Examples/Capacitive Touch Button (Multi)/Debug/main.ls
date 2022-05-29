   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 103                     ; 11 void main(void)
 103                     ; 12 {
 105                     	switch	.text
 106  0000               _main:
 108  0000 5203          	subw	sp,#3
 109       00000003      OFST:	set	3
 112                     ; 13 	bool state1 = FALSE;
 114  0002 0f01          	clr	(OFST-2,sp)
 116                     ; 14 	bool state2 = FALSE;
 118  0004 0f02          	clr	(OFST-1,sp)
 120                     ; 15 	bool state3 = FALSE;
 122  0006 0f03          	clr	(OFST+0,sp)
 124                     ; 17 	setup_clock();
 126  0008 cd0093        	call	_setup_clock
 128                     ; 18 	setup_GPIO();
 130  000b cd0101        	call	_setup_GPIO
 132                     ; 19 	setup_capacitive_touch();
 134  000e cd0113        	call	_setup_capacitive_touch
 136  0011               L74:
 137                     ; 23 		TSL_Action();
 139  0011 cd0000        	call	_TSL_Action
 141                     ; 25 		if((TSL_GlobalSetting.b.CHANGED == TRUE) && (TSLState == TSL_IDLE_STATE)) 
 143  0014 b601          	ld	a,_TSL_GlobalSetting+1
 144  0016 a508          	bcp	a,#8
 145  0018 27f7          	jreq	L74
 147  001a b600          	ld	a,_TSLState
 148  001c a101          	cp	a,#1
 149  001e 26f1          	jrne	L74
 150                     ; 27 			TSL_GlobalSetting.b.CHANGED = FALSE;
 152  0020 72170001      	bres	_TSL_GlobalSetting+1,#3
 153                     ; 29 			if(sSCKeyInfo[0].Setting.b.DETECTED) 
 155  0024 b602          	ld	a,_sSCKeyInfo+2
 156  0026 a504          	bcp	a,#4
 157  0028 271e          	jreq	L55
 158                     ; 31 				if(state1 == FALSE)
 160  002a 0d01          	tnz	(OFST-2,sp)
 161  002c 260f          	jrne	L75
 162                     ; 33 					GPIO_WriteHigh(GPIOD, GPIO_PIN_0);
 164  002e 4b01          	push	#1
 165  0030 ae500f        	ldw	x,#20495
 166  0033 cd0000        	call	_GPIO_WriteHigh
 168  0036 84            	pop	a
 169                     ; 34 					state1 = TRUE;
 171  0037 a601          	ld	a,#1
 172  0039 6b01          	ld	(OFST-2,sp),a
 175  003b 200b          	jra	L55
 176  003d               L75:
 177                     ; 38 					GPIO_WriteLow(GPIOD, GPIO_PIN_0);
 179  003d 4b01          	push	#1
 180  003f ae500f        	ldw	x,#20495
 181  0042 cd0000        	call	_GPIO_WriteLow
 183  0045 84            	pop	a
 184                     ; 39 					state1 = FALSE;
 186  0046 0f01          	clr	(OFST-2,sp)
 188  0048               L55:
 189                     ; 43 			if(sSCKeyInfo[1].Setting.b.DETECTED) 
 191  0048 b611          	ld	a,_sSCKeyInfo+17
 192  004a a504          	bcp	a,#4
 193  004c 271e          	jreq	L36
 194                     ; 45 				if(state2 == FALSE)
 196  004e 0d02          	tnz	(OFST-1,sp)
 197  0050 260f          	jrne	L56
 198                     ; 47 					GPIO_WriteHigh(GPIOD, GPIO_PIN_2);
 200  0052 4b04          	push	#4
 201  0054 ae500f        	ldw	x,#20495
 202  0057 cd0000        	call	_GPIO_WriteHigh
 204  005a 84            	pop	a
 205                     ; 48 					state2 = TRUE;
 207  005b a601          	ld	a,#1
 208  005d 6b02          	ld	(OFST-1,sp),a
 211  005f 200b          	jra	L36
 212  0061               L56:
 213                     ; 52 					GPIO_WriteLow(GPIOD, GPIO_PIN_2);
 215  0061 4b04          	push	#4
 216  0063 ae500f        	ldw	x,#20495
 217  0066 cd0000        	call	_GPIO_WriteLow
 219  0069 84            	pop	a
 220                     ; 53 					state2 = FALSE;
 222  006a 0f02          	clr	(OFST-1,sp)
 224  006c               L36:
 225                     ; 57 			if(sSCKeyInfo[2].Setting.b.DETECTED) 
 227  006c b620          	ld	a,_sSCKeyInfo+32
 228  006e a504          	bcp	a,#4
 229  0070 279f          	jreq	L74
 230                     ; 59 				if(state3 == FALSE)
 232  0072 0d03          	tnz	(OFST+0,sp)
 233  0074 260f          	jrne	L37
 234                     ; 61 					GPIO_WriteHigh(GPIOD, GPIO_PIN_3);
 236  0076 4b08          	push	#8
 237  0078 ae500f        	ldw	x,#20495
 238  007b cd0000        	call	_GPIO_WriteHigh
 240  007e 84            	pop	a
 241                     ; 62 					state3 = TRUE;
 243  007f a601          	ld	a,#1
 244  0081 6b03          	ld	(OFST+0,sp),a
 247  0083 208c          	jra	L74
 248  0085               L37:
 249                     ; 66 					GPIO_WriteLow(GPIOD, GPIO_PIN_3);
 251  0085 4b08          	push	#8
 252  0087 ae500f        	ldw	x,#20495
 253  008a cd0000        	call	_GPIO_WriteLow
 255  008d 84            	pop	a
 256                     ; 67 					state3 = FALSE;
 258  008e 0f03          	clr	(OFST+0,sp)
 260  0090 cc0011        	jra	L74
 293                     ; 75 void setup_clock(void)
 293                     ; 76 {
 294                     	switch	.text
 295  0093               _setup_clock:
 299                     ; 77 	CLK_DeInit();
 301  0093 cd0000        	call	_CLK_DeInit
 303                     ; 79 	CLK_HSECmd(ENABLE);
 305  0096 a601          	ld	a,#1
 306  0098 cd0000        	call	_CLK_HSECmd
 308                     ; 80 	CLK_LSICmd(DISABLE);
 310  009b 4f            	clr	a
 311  009c cd0000        	call	_CLK_LSICmd
 313                     ; 81 	CLK_HSICmd(ENABLE);
 315  009f a601          	ld	a,#1
 316  00a1 cd0000        	call	_CLK_HSICmd
 319  00a4               L111:
 320                     ; 82 	while(CLK_GetFlagStatus(CLK_FLAG_HSERDY) == FALSE);
 322  00a4 ae0202        	ldw	x,#514
 323  00a7 cd0000        	call	_CLK_GetFlagStatus
 325  00aa 4d            	tnz	a
 326  00ab 27f7          	jreq	L111
 327                     ; 84 	CLK_ClockSwitchCmd(ENABLE);
 329  00ad a601          	ld	a,#1
 330  00af cd0000        	call	_CLK_ClockSwitchCmd
 332                     ; 85 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 334  00b2 4f            	clr	a
 335  00b3 cd0000        	call	_CLK_HSIPrescalerConfig
 337                     ; 86 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 339  00b6 a680          	ld	a,#128
 340  00b8 cd0000        	call	_CLK_SYSCLKConfig
 342                     ; 88 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 
 342                     ; 89 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 344  00bb 4b01          	push	#1
 345  00bd 4b00          	push	#0
 346  00bf ae01b4        	ldw	x,#436
 347  00c2 cd0000        	call	_CLK_ClockSwitchConfig
 349  00c5 85            	popw	x
 350                     ; 91 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 352  00c6 ae0100        	ldw	x,#256
 353  00c9 cd0000        	call	_CLK_PeripheralClockConfig
 355                     ; 92 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 357  00cc 5f            	clrw	x
 358  00cd cd0000        	call	_CLK_PeripheralClockConfig
 360                     ; 93 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 362  00d0 ae1300        	ldw	x,#4864
 363  00d3 cd0000        	call	_CLK_PeripheralClockConfig
 365                     ; 94 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 367  00d6 ae1200        	ldw	x,#4608
 368  00d9 cd0000        	call	_CLK_PeripheralClockConfig
 370                     ; 95 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 372  00dc ae0200        	ldw	x,#512
 373  00df cd0000        	call	_CLK_PeripheralClockConfig
 375                     ; 96 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, DISABLE);
 377  00e2 ae0300        	ldw	x,#768
 378  00e5 cd0000        	call	_CLK_PeripheralClockConfig
 380                     ; 97 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 382  00e8 ae0700        	ldw	x,#1792
 383  00eb cd0000        	call	_CLK_PeripheralClockConfig
 385                     ; 98 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 387  00ee ae0500        	ldw	x,#1280
 388  00f1 cd0000        	call	_CLK_PeripheralClockConfig
 390                     ; 99 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);
 392  00f4 ae0601        	ldw	x,#1537
 393  00f7 cd0000        	call	_CLK_PeripheralClockConfig
 395                     ; 100 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 397  00fa ae0401        	ldw	x,#1025
 398  00fd cd0000        	call	_CLK_PeripheralClockConfig
 400                     ; 101 }
 403  0100 81            	ret
 428                     ; 104 void setup_GPIO(void)
 428                     ; 105 {
 429                     	switch	.text
 430  0101               _setup_GPIO:
 434                     ; 106 	GPIO_DeInit(GPIOD);
 436  0101 ae500f        	ldw	x,#20495
 437  0104 cd0000        	call	_GPIO_DeInit
 439                     ; 107 	GPIO_Init(GPIOD, ((GPIO_Pin_TypeDef)(GPIO_PIN_0 | GPIO_PIN_2 | GPIO_PIN_3)), GPIO_MODE_OUT_PP_LOW_FAST);
 441  0107 4be0          	push	#224
 442  0109 4b0d          	push	#13
 443  010b ae500f        	ldw	x,#20495
 444  010e cd0000        	call	_GPIO_Init
 446  0111 85            	popw	x
 447                     ; 108 }
 450  0112 81            	ret
 488                     ; 111 void setup_capacitive_touch(void)
 488                     ; 112 {
 489                     	switch	.text
 490  0113               _setup_capacitive_touch:
 492  0113 88            	push	a
 493       00000001      OFST:	set	1
 496                     ; 113 	unsigned char i = 0;
 498                     ; 115 	TSL_Init();
 500  0114 cd0000        	call	_TSL_Init
 502                     ; 117 	for (i = 0; i < 3; i++)
 504  0117 0f01          	clr	(OFST+0,sp)
 506  0119               L341:
 507                     ; 119 		sSCKeyInfo[i].Setting.b.IMPLEMENTED = 1;
 509  0119 7b01          	ld	a,(OFST+0,sp)
 510  011b 97            	ld	xl,a
 511  011c a60f          	ld	a,#15
 512  011e 42            	mul	x,a
 513  011f e602          	ld	a,(_sSCKeyInfo+2,x)
 514  0121 aa01          	or	a,#1
 515  0123 e702          	ld	(_sSCKeyInfo+2,x),a
 516                     ; 120 		sSCKeyInfo[i].Setting.b.ENABLED = 1;
 518  0125 7b01          	ld	a,(OFST+0,sp)
 519  0127 97            	ld	xl,a
 520  0128 a60f          	ld	a,#15
 521  012a 42            	mul	x,a
 522  012b e602          	ld	a,(_sSCKeyInfo+2,x)
 523  012d aa02          	or	a,#2
 524  012f e702          	ld	(_sSCKeyInfo+2,x),a
 525                     ; 117 	for (i = 0; i < 3; i++)
 527  0131 0c01          	inc	(OFST+0,sp)
 531  0133 7b01          	ld	a,(OFST+0,sp)
 532  0135 a103          	cp	a,#3
 533  0137 25e0          	jrult	L341
 534                     ; 123 	enableInterrupts();
 537  0139 9a            rim
 539                     ; 124 }
 543  013a 84            	pop	a
 544  013b 81            	ret
 557                     	xdef	_main
 558                     	xdef	_setup_capacitive_touch
 559                     	xdef	_setup_GPIO
 560                     	xdef	_setup_clock
 561                     	xref	_TSL_Action
 562                     	xref	_TSL_Init
 563                     	xref.b	_sSCKeyInfo
 564                     	xref.b	_TSL_GlobalSetting
 565                     	xref.b	_TSLState
 566                     	xref	_GPIO_WriteLow
 567                     	xref	_GPIO_WriteHigh
 568                     	xref	_GPIO_Init
 569                     	xref	_GPIO_DeInit
 570                     	xref	_CLK_GetFlagStatus
 571                     	xref	_CLK_SYSCLKConfig
 572                     	xref	_CLK_HSIPrescalerConfig
 573                     	xref	_CLK_ClockSwitchConfig
 574                     	xref	_CLK_PeripheralClockConfig
 575                     	xref	_CLK_ClockSwitchCmd
 576                     	xref	_CLK_LSICmd
 577                     	xref	_CLK_HSICmd
 578                     	xref	_CLK_HSECmd
 579                     	xref	_CLK_DeInit
 598                     	end
