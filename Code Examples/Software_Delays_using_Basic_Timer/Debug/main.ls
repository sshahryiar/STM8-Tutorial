   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  46                     ; 10 void main(void)
  46                     ; 11 {
  48                     	switch	.text
  49  0000               _main:
  53                     ; 12 	clock_setup();
  55  0000 ad13          	call	_clock_setup
  57                     ; 13 	GPIO_setup();
  59  0002 ad72          	call	_GPIO_setup
  61  0004               L12:
  62                     ; 17 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
  64  0004 4b01          	push	#1
  65  0006 ae500f        	ldw	x,#20495
  66  0009 cd0000        	call	_GPIO_WriteReverse
  68  000c 84            	pop	a
  69                     ; 18 		delay_ms(400);
  71  000d ae0190        	ldw	x,#400
  72  0010 cd011e        	call	_delay_ms
  75  0013 20ef          	jra	L12
 108                     ; 23 void clock_setup(void)
 108                     ; 24 {
 109                     	switch	.text
 110  0015               _clock_setup:
 114                     ; 25 	CLK_DeInit();
 116  0015 cd0000        	call	_CLK_DeInit
 118                     ; 27 	CLK_HSECmd(DISABLE);
 120  0018 4f            	clr	a
 121  0019 cd0000        	call	_CLK_HSECmd
 123                     ; 28 	CLK_LSICmd(DISABLE);
 125  001c 4f            	clr	a
 126  001d cd0000        	call	_CLK_LSICmd
 128                     ; 29 	CLK_HSICmd(ENABLE);
 130  0020 a601          	ld	a,#1
 131  0022 cd0000        	call	_CLK_HSICmd
 134  0025               L73:
 135                     ; 30 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 137  0025 ae0102        	ldw	x,#258
 138  0028 cd0000        	call	_CLK_GetFlagStatus
 140  002b 4d            	tnz	a
 141  002c 27f7          	jreq	L73
 142                     ; 32 	CLK_ClockSwitchCmd(ENABLE);
 144  002e a601          	ld	a,#1
 145  0030 cd0000        	call	_CLK_ClockSwitchCmd
 147                     ; 33 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 149  0033 4f            	clr	a
 150  0034 cd0000        	call	_CLK_HSIPrescalerConfig
 152                     ; 34 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 154  0037 a680          	ld	a,#128
 155  0039 cd0000        	call	_CLK_SYSCLKConfig
 157                     ; 36 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 157                     ; 37 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 159  003c 4b01          	push	#1
 160  003e 4b00          	push	#0
 161  0040 ae01e1        	ldw	x,#481
 162  0043 cd0000        	call	_CLK_ClockSwitchConfig
 164  0046 85            	popw	x
 165                     ; 39 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 167  0047 ae0100        	ldw	x,#256
 168  004a cd0000        	call	_CLK_PeripheralClockConfig
 170                     ; 40 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 172  004d 5f            	clrw	x
 173  004e cd0000        	call	_CLK_PeripheralClockConfig
 175                     ; 41 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 177  0051 ae1300        	ldw	x,#4864
 178  0054 cd0000        	call	_CLK_PeripheralClockConfig
 180                     ; 42 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 182  0057 ae1200        	ldw	x,#4608
 183  005a cd0000        	call	_CLK_PeripheralClockConfig
 185                     ; 43 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 187  005d ae0300        	ldw	x,#768
 188  0060 cd0000        	call	_CLK_PeripheralClockConfig
 190                     ; 44 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 192  0063 ae0700        	ldw	x,#1792
 193  0066 cd0000        	call	_CLK_PeripheralClockConfig
 195                     ; 45 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 197  0069 ae0500        	ldw	x,#1280
 198  006c cd0000        	call	_CLK_PeripheralClockConfig
 200                     ; 46 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 202  006f ae0401        	ldw	x,#1025
 203  0072 cd0000        	call	_CLK_PeripheralClockConfig
 205                     ; 47 }
 208  0075 81            	ret
 233                     ; 50 void GPIO_setup(void)
 233                     ; 51 {
 234                     	switch	.text
 235  0076               _GPIO_setup:
 239                     ; 52 	GPIO_DeInit(GPIOD);
 241  0076 ae500f        	ldw	x,#20495
 242  0079 cd0000        	call	_GPIO_DeInit
 244                     ; 53 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_SLOW);
 246  007c 4b90          	push	#144
 247  007e 4b01          	push	#1
 248  0080 ae500f        	ldw	x,#20495
 249  0083 cd0000        	call	_GPIO_Init
 251  0086 85            	popw	x
 252                     ; 54 }
 255  0087 81            	ret
 294                     ; 57 void delay_us(signed int us)
 294                     ; 58 {
 295                     	switch	.text
 296  0088               _delay_us:
 298  0088 89            	pushw	x
 299       00000000      OFST:	set	0
 302                     ; 59 	TIM4_Cmd(DISABLE);     
 304  0089 4f            	clr	a
 305  008a cd0000        	call	_TIM4_Cmd
 307                     ; 60 	TIM4_DeInit();	
 309  008d cd0000        	call	_TIM4_DeInit
 311                     ; 62 	if((us <= 200) && (us >= 0))
 313  0090 9c            	rvf
 314  0091 1e01          	ldw	x,(OFST+1,sp)
 315  0093 a300c9        	cpw	x,#201
 316  0096 2e12          	jrsge	L17
 318  0098 9c            	rvf
 319  0099 1e01          	ldw	x,(OFST+1,sp)
 320  009b 2f0d          	jrslt	L17
 321                     ; 64 		TIM4_TimeBaseInit(TIM4_PRESCALER_16, 200);
 323  009d ae04c8        	ldw	x,#1224
 324  00a0 cd0000        	call	_TIM4_TimeBaseInit
 326                     ; 65 		TIM4_Cmd(ENABLE);   
 328  00a3 a601          	ld	a,#1
 329  00a5 cd0000        	call	_TIM4_Cmd
 332  00a8 2063          	jra	L111
 333  00aa               L17:
 334                     ; 68 	else if((us <= 400) && (us > 200))
 336  00aa 9c            	rvf
 337  00ab 1e01          	ldw	x,(OFST+1,sp)
 338  00ad a30191        	cpw	x,#401
 339  00b0 2e19          	jrsge	L57
 341  00b2 9c            	rvf
 342  00b3 1e01          	ldw	x,(OFST+1,sp)
 343  00b5 a300c9        	cpw	x,#201
 344  00b8 2f11          	jrslt	L57
 345                     ; 70 		us >>= 1;
 347  00ba 0701          	sra	(OFST+1,sp)
 348  00bc 0602          	rrc	(OFST+2,sp)
 349                     ; 71 		TIM4_TimeBaseInit(TIM4_PRESCALER_32, 200);
 351  00be ae05c8        	ldw	x,#1480
 352  00c1 cd0000        	call	_TIM4_TimeBaseInit
 354                     ; 72 		TIM4_Cmd(ENABLE);   
 356  00c4 a601          	ld	a,#1
 357  00c6 cd0000        	call	_TIM4_Cmd
 360  00c9 2042          	jra	L111
 361  00cb               L57:
 362                     ; 75 	else if((us <= 800) && (us > 400))
 364  00cb 9c            	rvf
 365  00cc 1e01          	ldw	x,(OFST+1,sp)
 366  00ce a30321        	cpw	x,#801
 367  00d1 2e1e          	jrsge	L101
 369  00d3 9c            	rvf
 370  00d4 1e01          	ldw	x,(OFST+1,sp)
 371  00d6 a30191        	cpw	x,#401
 372  00d9 2f16          	jrslt	L101
 373                     ; 77 		us >>= 2;
 375  00db a602          	ld	a,#2
 376  00dd               L41:
 377  00dd 0701          	sra	(OFST+1,sp)
 378  00df 0602          	rrc	(OFST+2,sp)
 379  00e1 4a            	dec	a
 380  00e2 26f9          	jrne	L41
 381                     ; 78 		TIM4_TimeBaseInit(TIM4_PRESCALER_64, 200);
 383  00e4 ae06c8        	ldw	x,#1736
 384  00e7 cd0000        	call	_TIM4_TimeBaseInit
 386                     ; 79 		TIM4_Cmd(ENABLE);   
 388  00ea a601          	ld	a,#1
 389  00ec cd0000        	call	_TIM4_Cmd
 392  00ef 201c          	jra	L111
 393  00f1               L101:
 394                     ; 82 	else if(us > 800)
 396  00f1 9c            	rvf
 397  00f2 1e01          	ldw	x,(OFST+1,sp)
 398  00f4 a30321        	cpw	x,#801
 399  00f7 2f14          	jrslt	L111
 400                     ; 84 		us >>= 3;
 402  00f9 a603          	ld	a,#3
 403  00fb               L61:
 404  00fb 0701          	sra	(OFST+1,sp)
 405  00fd 0602          	rrc	(OFST+2,sp)
 406  00ff 4a            	dec	a
 407  0100 26f9          	jrne	L61
 408                     ; 85 		TIM4_TimeBaseInit(TIM4_PRESCALER_128, 200);
 410  0102 ae07c8        	ldw	x,#1992
 411  0105 cd0000        	call	_TIM4_TimeBaseInit
 413                     ; 86 		TIM4_Cmd(ENABLE);   
 415  0108 a601          	ld	a,#1
 416  010a cd0000        	call	_TIM4_Cmd
 418  010d               L111:
 419                     ; 89 	while(TIM4_GetCounter() < us);
 421  010d 9c            	rvf
 422  010e cd0000        	call	_TIM4_GetCounter
 424  0111 5f            	clrw	x
 425  0112 97            	ld	xl,a
 426  0113 1301          	cpw	x,(OFST+1,sp)
 427  0115 2ff6          	jrslt	L111
 428                     ; 90 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 430  0117 a601          	ld	a,#1
 431  0119 cd0000        	call	_TIM4_ClearFlag
 433                     ; 91 }
 436  011c 85            	popw	x
 437  011d 81            	ret
 472                     ; 94 void delay_ms(signed int ms)
 472                     ; 95 {
 473                     	switch	.text
 474  011e               _delay_ms:
 476  011e 89            	pushw	x
 477       00000000      OFST:	set	0
 480  011f 2006          	jra	L531
 481  0121               L331:
 482                     ; 98 		delay_us(1000);
 484  0121 ae03e8        	ldw	x,#1000
 485  0124 cd0088        	call	_delay_us
 487  0127               L531:
 488                     ; 96 	while(ms --)
 490  0127 1e01          	ldw	x,(OFST+1,sp)
 491  0129 1d0001        	subw	x,#1
 492  012c 1f01          	ldw	(OFST+1,sp),x
 493  012e 1c0001        	addw	x,#1
 494  0131 a30000        	cpw	x,#0
 495  0134 26eb          	jrne	L331
 496                     ; 100 }    
 500  0136 85            	popw	x
 501  0137 81            	ret
 514                     	xdef	_main
 515                     	xdef	_delay_ms
 516                     	xdef	_delay_us
 517                     	xdef	_GPIO_setup
 518                     	xdef	_clock_setup
 519                     	xref	_TIM4_ClearFlag
 520                     	xref	_TIM4_GetCounter
 521                     	xref	_TIM4_Cmd
 522                     	xref	_TIM4_TimeBaseInit
 523                     	xref	_TIM4_DeInit
 524                     	xref	_GPIO_WriteReverse
 525                     	xref	_GPIO_Init
 526                     	xref	_GPIO_DeInit
 527                     	xref	_CLK_GetFlagStatus
 528                     	xref	_CLK_SYSCLKConfig
 529                     	xref	_CLK_HSIPrescalerConfig
 530                     	xref	_CLK_ClockSwitchConfig
 531                     	xref	_CLK_PeripheralClockConfig
 532                     	xref	_CLK_ClockSwitchCmd
 533                     	xref	_CLK_LSICmd
 534                     	xref	_CLK_HSICmd
 535                     	xref	_CLK_HSECmd
 536                     	xref	_CLK_DeInit
 555                     	end
