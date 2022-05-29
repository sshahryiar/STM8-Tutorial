   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  59                     ; 9 void main(void)
  59                     ; 10 {
  61                     	switch	.text
  62  0000               _main:
  64  0000 89            	pushw	x
  65       00000002      OFST:	set	2
  68                     ; 11 	signed int i = 0;
  70                     ; 13 	clock_setup();
  72  0001 ad41          	call	_clock_setup
  74                     ; 14 	GPIO_setup();
  76  0003 cd00a5        	call	_GPIO_setup
  78                     ; 15 	TIM1_setup();
  80  0006 cd00c8        	call	_TIM1_setup
  82  0009               L72:
  83                     ; 19 		for(i = 0; i < 1000; i += 1)
  85  0009 5f            	clrw	x
  86  000a 1f01          	ldw	(OFST-1,sp),x
  88  000c               L33:
  89                     ; 21 			TIM1_SetCompare1(i);
  91  000c 1e01          	ldw	x,(OFST-1,sp)
  92  000e cd0000        	call	_TIM1_SetCompare1
  94                     ; 22 			delay_ms(1);
  96  0011 ae0001        	ldw	x,#1
  97  0014 cd0000        	call	_delay_ms
  99                     ; 19 		for(i = 0; i < 1000; i += 1)
 101  0017 1e01          	ldw	x,(OFST-1,sp)
 102  0019 1c0001        	addw	x,#1
 103  001c 1f01          	ldw	(OFST-1,sp),x
 107  001e 9c            	rvf
 108  001f 1e01          	ldw	x,(OFST-1,sp)
 109  0021 a303e8        	cpw	x,#1000
 110  0024 2fe6          	jrslt	L33
 111                     ; 24 		for(i = 1000; i > 0; i -= 1)
 113  0026 ae03e8        	ldw	x,#1000
 114  0029 1f01          	ldw	(OFST-1,sp),x
 116  002b               L14:
 117                     ; 26 			TIM1_SetCompare1(i);
 119  002b 1e01          	ldw	x,(OFST-1,sp)
 120  002d cd0000        	call	_TIM1_SetCompare1
 122                     ; 27 			delay_ms(1);
 124  0030 ae0001        	ldw	x,#1
 125  0033 cd0000        	call	_delay_ms
 127                     ; 24 		for(i = 1000; i > 0; i -= 1)
 129  0036 1e01          	ldw	x,(OFST-1,sp)
 130  0038 1d0001        	subw	x,#1
 131  003b 1f01          	ldw	(OFST-1,sp),x
 135  003d 9c            	rvf
 136  003e 1e01          	ldw	x,(OFST-1,sp)
 137  0040 2ce9          	jrsgt	L14
 139  0042 20c5          	jra	L72
 172                     ; 33 void clock_setup(void)
 172                     ; 34 {
 173                     	switch	.text
 174  0044               _clock_setup:
 178                     ; 35 	CLK_DeInit();
 180  0044 cd0000        	call	_CLK_DeInit
 182                     ; 37 	CLK_HSECmd(DISABLE);
 184  0047 4f            	clr	a
 185  0048 cd0000        	call	_CLK_HSECmd
 187                     ; 38 	CLK_LSICmd(DISABLE);
 189  004b 4f            	clr	a
 190  004c cd0000        	call	_CLK_LSICmd
 192                     ; 39 	CLK_HSICmd(ENABLE);
 194  004f a601          	ld	a,#1
 195  0051 cd0000        	call	_CLK_HSICmd
 198  0054               L16:
 199                     ; 40 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 201  0054 ae0102        	ldw	x,#258
 202  0057 cd0000        	call	_CLK_GetFlagStatus
 204  005a 4d            	tnz	a
 205  005b 27f7          	jreq	L16
 206                     ; 42 	CLK_ClockSwitchCmd(ENABLE);
 208  005d a601          	ld	a,#1
 209  005f cd0000        	call	_CLK_ClockSwitchCmd
 211                     ; 43 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 213  0062 4f            	clr	a
 214  0063 cd0000        	call	_CLK_HSIPrescalerConfig
 216                     ; 44 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 218  0066 a680          	ld	a,#128
 219  0068 cd0000        	call	_CLK_SYSCLKConfig
 221                     ; 46 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 221                     ; 47 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 223  006b 4b01          	push	#1
 224  006d 4b00          	push	#0
 225  006f ae01e1        	ldw	x,#481
 226  0072 cd0000        	call	_CLK_ClockSwitchConfig
 228  0075 85            	popw	x
 229                     ; 49 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 231  0076 5f            	clrw	x
 232  0077 cd0000        	call	_CLK_PeripheralClockConfig
 234                     ; 50 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 236  007a ae0100        	ldw	x,#256
 237  007d cd0000        	call	_CLK_PeripheralClockConfig
 239                     ; 51 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 241  0080 ae1300        	ldw	x,#4864
 242  0083 cd0000        	call	_CLK_PeripheralClockConfig
 244                     ; 52 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 246  0086 ae1200        	ldw	x,#4608
 247  0089 cd0000        	call	_CLK_PeripheralClockConfig
 249                     ; 53 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);	
 251  008c ae0300        	ldw	x,#768
 252  008f cd0000        	call	_CLK_PeripheralClockConfig
 254                     ; 54 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 256  0092 ae0701        	ldw	x,#1793
 257  0095 cd0000        	call	_CLK_PeripheralClockConfig
 259                     ; 55 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 261  0098 ae0500        	ldw	x,#1280
 262  009b cd0000        	call	_CLK_PeripheralClockConfig
 264                     ; 56 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 266  009e ae0400        	ldw	x,#1024
 267  00a1 cd0000        	call	_CLK_PeripheralClockConfig
 269                     ; 57 }
 272  00a4 81            	ret
 297                     ; 60 void GPIO_setup(void)
 297                     ; 61 {		
 298                     	switch	.text
 299  00a5               _GPIO_setup:
 303                     ; 62 	GPIO_DeInit(GPIOB);
 305  00a5 ae5005        	ldw	x,#20485
 306  00a8 cd0000        	call	_GPIO_DeInit
 308                     ; 63 	GPIO_Init(GPIOB, GPIO_PIN_0, GPIO_MODE_OUT_PP_HIGH_FAST);
 310  00ab 4bf0          	push	#240
 311  00ad 4b01          	push	#1
 312  00af ae5005        	ldw	x,#20485
 313  00b2 cd0000        	call	_GPIO_Init
 315  00b5 85            	popw	x
 316                     ; 65 	GPIO_DeInit(GPIOC);
 318  00b6 ae500a        	ldw	x,#20490
 319  00b9 cd0000        	call	_GPIO_DeInit
 321                     ; 66 	GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_FAST);
 323  00bc 4bf0          	push	#240
 324  00be 4b02          	push	#2
 325  00c0 ae500a        	ldw	x,#20490
 326  00c3 cd0000        	call	_GPIO_Init
 328  00c6 85            	popw	x
 329                     ; 67 }
 332  00c7 81            	ret
 360                     ; 70 void TIM1_setup(void)
 360                     ; 71 {
 361                     	switch	.text
 362  00c8               _TIM1_setup:
 366                     ; 72 	TIM1_DeInit();
 368  00c8 cd0000        	call	_TIM1_DeInit
 370                     ; 74 	TIM1_TimeBaseInit(16, TIM1_COUNTERMODE_UP, 1000, 1);
 372  00cb 4b01          	push	#1
 373  00cd ae03e8        	ldw	x,#1000
 374  00d0 89            	pushw	x
 375  00d1 4b00          	push	#0
 376  00d3 ae0010        	ldw	x,#16
 377  00d6 cd0000        	call	_TIM1_TimeBaseInit
 379  00d9 5b04          	addw	sp,#4
 380                     ; 76 	TIM1_OC1Init(TIM1_OCMODE_PWM1, 
 380                     ; 77 							TIM1_OUTPUTSTATE_ENABLE, 
 380                     ; 78 						    TIM1_OUTPUTNSTATE_ENABLE, 
 380                     ; 79 							1000, 
 380                     ; 80 							TIM1_OCPOLARITY_LOW, 
 380                     ; 81 							TIM1_OCNPOLARITY_LOW, 
 380                     ; 82 							TIM1_OCIDLESTATE_RESET, 
 380                     ; 83 							TIM1_OCNIDLESTATE_RESET);
 382  00db 4b00          	push	#0
 383  00dd 4b00          	push	#0
 384  00df 4b88          	push	#136
 385  00e1 4b22          	push	#34
 386  00e3 ae03e8        	ldw	x,#1000
 387  00e6 89            	pushw	x
 388  00e7 4b44          	push	#68
 389  00e9 ae6011        	ldw	x,#24593
 390  00ec cd0000        	call	_TIM1_OC1Init
 392  00ef 5b07          	addw	sp,#7
 393                     ; 85 	TIM1_CtrlPWMOutputs(ENABLE);
 395  00f1 a601          	ld	a,#1
 396  00f3 cd0000        	call	_TIM1_CtrlPWMOutputs
 398                     ; 86 	TIM1_Cmd(ENABLE);
 400  00f6 a601          	ld	a,#1
 401  00f8 cd0000        	call	_TIM1_Cmd
 403                     ; 87 }
 406  00fb 81            	ret
 419                     	xdef	_main
 420                     	xdef	_TIM1_setup
 421                     	xdef	_GPIO_setup
 422                     	xdef	_clock_setup
 423                     	xref	_TIM1_SetCompare1
 424                     	xref	_TIM1_CtrlPWMOutputs
 425                     	xref	_TIM1_Cmd
 426                     	xref	_TIM1_OC1Init
 427                     	xref	_TIM1_TimeBaseInit
 428                     	xref	_TIM1_DeInit
 429                     	xref	_GPIO_Init
 430                     	xref	_GPIO_DeInit
 431                     	xref	_CLK_GetFlagStatus
 432                     	xref	_CLK_SYSCLKConfig
 433                     	xref	_CLK_HSIPrescalerConfig
 434                     	xref	_CLK_ClockSwitchConfig
 435                     	xref	_CLK_PeripheralClockConfig
 436                     	xref	_CLK_ClockSwitchCmd
 437                     	xref	_CLK_LSICmd
 438                     	xref	_CLK_HSICmd
 439                     	xref	_CLK_HSECmd
 440                     	xref	_CLK_DeInit
 441                     	xref	_delay_ms
 460                     	end
