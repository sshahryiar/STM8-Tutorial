   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     	bsct
  15  0000               _state:
  16  0000 00            	dc.b	0
  63                     ; 12 void main(void)
  63                     ; 13 {
  65                     	switch	.text
  66  0000               _main:
  68  0000 88            	push	a
  69       00000001      OFST:	set	1
  72                     ; 14 	unsigned char i = 0;
  74                     ; 16 	GPIO_setup();
  76  0001 ad54          	call	_GPIO_setup
  78                     ; 17 	EXTI_setup();
  80  0003 ad75          	call	_EXTI_setup
  82                     ; 18 	clock_setup();
  84  0005 cd0092        	call	_clock_setup
  86                     ; 20 	for(i = 0; i <= 6; i++)
  88  0008 0f01          	clr	(OFST+0,sp)
  90  000a               L72:
  91                     ; 22 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
  93  000a 4b01          	push	#1
  94  000c ae500f        	ldw	x,#20495
  95  000f cd0000        	call	_GPIO_WriteReverse
  97  0012 84            	pop	a
  98                     ; 23 		delay_ms(900);
 100  0013 ae0384        	ldw	x,#900
 101  0016 cd0000        	call	_delay_ms
 103                     ; 20 	for(i = 0; i <= 6; i++)
 105  0019 0c01          	inc	(OFST+0,sp)
 109  001b 7b01          	ld	a,(OFST+0,sp)
 110  001d a107          	cp	a,#7
 111  001f 25e9          	jrult	L72
 112                     ; 25 	wfi();
 115  0021 8f            wfi
 117  0022               L53:
 118                     ; 29 		for(i = 0; i < 4; i++)
 120  0022 0f01          	clr	(OFST+0,sp)
 122  0024               L14:
 123                     ; 31 			GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 125  0024 4b01          	push	#1
 126  0026 ae500f        	ldw	x,#20495
 127  0029 cd0000        	call	_GPIO_WriteReverse
 129  002c 84            	pop	a
 130                     ; 32 			delay_ms(600);
 132  002d ae0258        	ldw	x,#600
 133  0030 cd0000        	call	_delay_ms
 135                     ; 29 		for(i = 0; i < 4; i++)
 137  0033 0c01          	inc	(OFST+0,sp)
 141  0035 7b01          	ld	a,(OFST+0,sp)
 142  0037 a104          	cp	a,#4
 143  0039 25e9          	jrult	L14
 144                     ; 34 		for(i = 0; i < 4; i++)
 146  003b 0f01          	clr	(OFST+0,sp)
 148  003d               L74:
 149                     ; 36 			GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 151  003d 4b01          	push	#1
 152  003f ae500f        	ldw	x,#20495
 153  0042 cd0000        	call	_GPIO_WriteReverse
 155  0045 84            	pop	a
 156                     ; 37 			delay_ms(300);
 158  0046 ae012c        	ldw	x,#300
 159  0049 cd0000        	call	_delay_ms
 161                     ; 34 		for(i = 0; i < 4; i++)
 163  004c 0c01          	inc	(OFST+0,sp)
 167  004e 7b01          	ld	a,(OFST+0,sp)
 168  0050 a104          	cp	a,#4
 169  0052 25e9          	jrult	L74
 170                     ; 39 		halt();
 173  0054 8e            halt
 177  0055 20cb          	jra	L53
 202                     ; 44 void GPIO_setup(void)
 202                     ; 45 {
 203                     	switch	.text
 204  0057               _GPIO_setup:
 208                     ; 46 	GPIO_DeInit(GPIOB);    
 210  0057 ae5005        	ldw	x,#20485
 211  005a cd0000        	call	_GPIO_DeInit
 213                     ; 47 	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_IT);
 215  005d 4b60          	push	#96
 216  005f 4b80          	push	#128
 217  0061 ae5005        	ldw	x,#20485
 218  0064 cd0000        	call	_GPIO_Init
 220  0067 85            	popw	x
 221                     ; 49 	GPIO_DeInit(GPIOD);
 223  0068 ae500f        	ldw	x,#20495
 224  006b cd0000        	call	_GPIO_DeInit
 226                     ; 50 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 228  006e 4be0          	push	#224
 229  0070 4b01          	push	#1
 230  0072 ae500f        	ldw	x,#20495
 231  0075 cd0000        	call	_GPIO_Init
 233  0078 85            	popw	x
 234                     ; 51 }
 237  0079 81            	ret
 266                     ; 54 void EXTI_setup(void)
 266                     ; 55 {
 267                     	switch	.text
 268  007a               _EXTI_setup:
 272                     ; 56 	ITC_DeInit();
 274  007a cd0000        	call	_ITC_DeInit
 276                     ; 57 	ITC_SetSoftwarePriority(ITC_IRQ_PORTB, ITC_PRIORITYLEVEL_0);
 278  007d ae0402        	ldw	x,#1026
 279  0080 cd0000        	call	_ITC_SetSoftwarePriority
 281                     ; 59 	EXTI_DeInit();
 283  0083 cd0000        	call	_EXTI_DeInit
 285                     ; 60 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_FALL_ONLY);
 287  0086 ae0102        	ldw	x,#258
 288  0089 cd0000        	call	_EXTI_SetExtIntSensitivity
 290                     ; 61 	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 292  008c 4f            	clr	a
 293  008d cd0000        	call	_EXTI_SetTLISensitivity
 295                     ; 63 	rim();
 298  0090 9a            rim
 300                     ; 64 }
 304  0091 81            	ret
 337                     ; 67 void clock_setup(void)
 337                     ; 68 {
 338                     	switch	.text
 339  0092               _clock_setup:
 343                     ; 69 	CLK_DeInit();
 345  0092 cd0000        	call	_CLK_DeInit
 347                     ; 71 	CLK_HSECmd(DISABLE);
 349  0095 4f            	clr	a
 350  0096 cd0000        	call	_CLK_HSECmd
 352                     ; 72 	CLK_LSICmd(DISABLE);
 354  0099 4f            	clr	a
 355  009a cd0000        	call	_CLK_LSICmd
 357                     ; 73 	CLK_HSICmd(ENABLE);
 359  009d a601          	ld	a,#1
 360  009f cd0000        	call	_CLK_HSICmd
 363  00a2               L701:
 364                     ; 74 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 366  00a2 ae0102        	ldw	x,#258
 367  00a5 cd0000        	call	_CLK_GetFlagStatus
 369  00a8 4d            	tnz	a
 370  00a9 27f7          	jreq	L701
 371                     ; 76 	CLK_ClockSwitchCmd(ENABLE);
 373  00ab a601          	ld	a,#1
 374  00ad cd0000        	call	_CLK_ClockSwitchCmd
 376                     ; 77 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 378  00b0 4f            	clr	a
 379  00b1 cd0000        	call	_CLK_HSIPrescalerConfig
 381                     ; 78 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 383  00b4 a680          	ld	a,#128
 384  00b6 cd0000        	call	_CLK_SYSCLKConfig
 386                     ; 80 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 386                     ; 81 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 388  00b9 4b01          	push	#1
 389  00bb 4b00          	push	#0
 390  00bd ae01e1        	ldw	x,#481
 391  00c0 cd0000        	call	_CLK_ClockSwitchConfig
 393  00c3 85            	popw	x
 394                     ; 83 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 396  00c4 ae0100        	ldw	x,#256
 397  00c7 cd0000        	call	_CLK_PeripheralClockConfig
 399                     ; 84 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 401  00ca 5f            	clrw	x
 402  00cb cd0000        	call	_CLK_PeripheralClockConfig
 404                     ; 85 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 406  00ce ae1300        	ldw	x,#4864
 407  00d1 cd0000        	call	_CLK_PeripheralClockConfig
 409                     ; 86 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 411  00d4 ae1200        	ldw	x,#4608
 412  00d7 cd0000        	call	_CLK_PeripheralClockConfig
 414                     ; 87 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 416  00da ae0300        	ldw	x,#768
 417  00dd cd0000        	call	_CLK_PeripheralClockConfig
 419                     ; 88 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 421  00e0 ae0700        	ldw	x,#1792
 422  00e3 cd0000        	call	_CLK_PeripheralClockConfig
 424                     ; 89 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 426  00e6 ae0500        	ldw	x,#1280
 427  00e9 cd0000        	call	_CLK_PeripheralClockConfig
 429                     ; 90 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 431  00ec ae0400        	ldw	x,#1024
 432  00ef cd0000        	call	_CLK_PeripheralClockConfig
 434                     ; 91 }
 437  00f2 81            	ret
 482                     	xdef	_main
 483                     	xdef	_clock_setup
 484                     	xdef	_EXTI_setup
 485                     	xdef	_GPIO_setup
 486                     	xdef	_state
 487                     	xref	_ITC_SetSoftwarePriority
 488                     	xref	_ITC_DeInit
 489                     	xref	_GPIO_WriteReverse
 490                     	xref	_GPIO_Init
 491                     	xref	_GPIO_DeInit
 492                     	xref	_EXTI_SetTLISensitivity
 493                     	xref	_EXTI_SetExtIntSensitivity
 494                     	xref	_EXTI_DeInit
 495                     	xref	_CLK_GetFlagStatus
 496                     	xref	_CLK_SYSCLKConfig
 497                     	xref	_CLK_HSIPrescalerConfig
 498                     	xref	_CLK_ClockSwitchConfig
 499                     	xref	_CLK_PeripheralClockConfig
 500                     	xref	_CLK_ClockSwitchCmd
 501                     	xref	_CLK_LSICmd
 502                     	xref	_CLK_HSICmd
 503                     	xref	_CLK_HSECmd
 504                     	xref	_CLK_DeInit
 505                     	xref	_delay_ms
 524                     	end
