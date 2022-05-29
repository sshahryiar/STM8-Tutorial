   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  15                     	bsct
  16  0000               _value:
  17  0000 0000          	dc.w	0
  18  0002               _n:
  19  0002 00            	dc.b	0
  20  0003               _seg:
  21  0003 01            	dc.b	1
  22                     .const:	section	.text
  23  0000               _num:
  24  0000 c0            	dc.b	192
  25  0001 f9            	dc.b	249
  26  0002 a4            	dc.b	164
  27  0003 b0            	dc.b	176
  28  0004 99            	dc.b	153
  29  0005 92            	dc.b	146
  30  0006 82            	dc.b	130
  31  0007 f8            	dc.b	248
  32  0008 80            	dc.b	128
  33  0009 90            	dc.b	144
  67                     ; 16 void main(void)
  67                     ; 17 {
  69                     	switch	.text
  70  0000               _main:
  74                     ; 18 	GPIO_setup();
  76  0000 ad14          	call	_GPIO_setup
  78                     ; 19 	clock_setup();
  80  0002 ad35          	call	_clock_setup
  82                     ; 20 	TIM4_setup();
  84  0004 cd009b        	call	_TIM4_setup
  86  0007               L12:
  87                     ; 24 		value++;
  89  0007 be00          	ldw	x,_value
  90  0009 1c0001        	addw	x,#1
  91  000c bf00          	ldw	_value,x
  92                     ; 25 		delay_ms(999);
  94  000e ae03e7        	ldw	x,#999
  95  0011 cd0000        	call	_delay_ms
  98  0014 20f1          	jra	L12
 123                     ; 30 void GPIO_setup(void)
 123                     ; 31 {
 124                     	switch	.text
 125  0016               _GPIO_setup:
 129                     ; 32 	GPIO_DeInit(GPIOC);
 131  0016 ae500a        	ldw	x,#20490
 132  0019 cd0000        	call	_GPIO_DeInit
 134                     ; 33 	GPIO_Init(GPIOC, ((GPIO_Pin_TypeDef)(GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7)), GPIO_MODE_OUT_PP_HIGH_FAST);
 136  001c 4bf0          	push	#240
 137  001e 4bf0          	push	#240
 138  0020 ae500a        	ldw	x,#20490
 139  0023 cd0000        	call	_GPIO_Init
 141  0026 85            	popw	x
 142                     ; 35 	GPIO_DeInit(GPIOD);
 144  0027 ae500f        	ldw	x,#20495
 145  002a cd0000        	call	_GPIO_DeInit
 147                     ; 36 	GPIO_Init(GPIOD, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_HIGH_FAST);
 149  002d 4bf0          	push	#240
 150  002f 4bff          	push	#255
 151  0031 ae500f        	ldw	x,#20495
 152  0034 cd0000        	call	_GPIO_Init
 154  0037 85            	popw	x
 155                     ; 37 }
 158  0038 81            	ret
 191                     ; 40 void clock_setup(void)
 191                     ; 41 {
 192                     	switch	.text
 193  0039               _clock_setup:
 197                     ; 42 	CLK_DeInit();
 199  0039 cd0000        	call	_CLK_DeInit
 201                     ; 44 	CLK_HSECmd(DISABLE);
 203  003c 4f            	clr	a
 204  003d cd0000        	call	_CLK_HSECmd
 206                     ; 45 	CLK_LSICmd(DISABLE);
 208  0040 4f            	clr	a
 209  0041 cd0000        	call	_CLK_LSICmd
 211                     ; 46 	CLK_HSICmd(ENABLE);
 213  0044 a601          	ld	a,#1
 214  0046 cd0000        	call	_CLK_HSICmd
 217  0049               L74:
 218                     ; 47 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 220  0049 ae0102        	ldw	x,#258
 221  004c cd0000        	call	_CLK_GetFlagStatus
 223  004f 4d            	tnz	a
 224  0050 27f7          	jreq	L74
 225                     ; 49 	CLK_ClockSwitchCmd(ENABLE);
 227  0052 a601          	ld	a,#1
 228  0054 cd0000        	call	_CLK_ClockSwitchCmd
 230                     ; 50 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 232  0057 a618          	ld	a,#24
 233  0059 cd0000        	call	_CLK_HSIPrescalerConfig
 235                     ; 51 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 237  005c a680          	ld	a,#128
 238  005e cd0000        	call	_CLK_SYSCLKConfig
 240                     ; 53 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 240                     ; 54 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 242  0061 4b01          	push	#1
 243  0063 4b00          	push	#0
 244  0065 ae01e1        	ldw	x,#481
 245  0068 cd0000        	call	_CLK_ClockSwitchConfig
 247  006b 85            	popw	x
 248                     ; 56 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 250  006c ae0100        	ldw	x,#256
 251  006f cd0000        	call	_CLK_PeripheralClockConfig
 253                     ; 57 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 255  0072 5f            	clrw	x
 256  0073 cd0000        	call	_CLK_PeripheralClockConfig
 258                     ; 58 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 260  0076 ae1300        	ldw	x,#4864
 261  0079 cd0000        	call	_CLK_PeripheralClockConfig
 263                     ; 59 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 265  007c ae1200        	ldw	x,#4608
 266  007f cd0000        	call	_CLK_PeripheralClockConfig
 268                     ; 60 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 270  0082 ae0300        	ldw	x,#768
 271  0085 cd0000        	call	_CLK_PeripheralClockConfig
 273                     ; 61 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 275  0088 ae0700        	ldw	x,#1792
 276  008b cd0000        	call	_CLK_PeripheralClockConfig
 278                     ; 62 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 280  008e ae0500        	ldw	x,#1280
 281  0091 cd0000        	call	_CLK_PeripheralClockConfig
 283                     ; 63 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 285  0094 ae0401        	ldw	x,#1025
 286  0097 cd0000        	call	_CLK_PeripheralClockConfig
 288                     ; 64 }
 291  009a 81            	ret
 319                     ; 67 void TIM4_setup(void)
 319                     ; 68 {	
 320                     	switch	.text
 321  009b               _TIM4_setup:
 325                     ; 69 	TIM4_DeInit();
 327  009b cd0000        	call	_TIM4_DeInit
 329                     ; 70 	TIM4_TimeBaseInit(TIM4_PRESCALER_32, 128);	
 331  009e ae0580        	ldw	x,#1408
 332  00a1 cd0000        	call	_TIM4_TimeBaseInit
 334                     ; 71     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 336  00a4 ae0101        	ldw	x,#257
 337  00a7 cd0000        	call	_TIM4_ITConfig
 339                     ; 72 	TIM4_Cmd(ENABLE);
 341  00aa a601          	ld	a,#1
 342  00ac cd0000        	call	_TIM4_Cmd
 344                     ; 73 	enableInterrupts();
 347  00af 9a            rim
 349                     ; 74 }
 353  00b0 81            	ret
 405                     	xdef	_main
 406                     	xdef	_TIM4_setup
 407                     	xdef	_clock_setup
 408                     	xdef	_GPIO_setup
 409                     	xdef	_num
 410                     	xdef	_seg
 411                     	xdef	_n
 412                     	xdef	_value
 413                     	xref	_TIM4_ITConfig
 414                     	xref	_TIM4_Cmd
 415                     	xref	_TIM4_TimeBaseInit
 416                     	xref	_TIM4_DeInit
 417                     	xref	_GPIO_Init
 418                     	xref	_GPIO_DeInit
 419                     	xref	_CLK_GetFlagStatus
 420                     	xref	_CLK_SYSCLKConfig
 421                     	xref	_CLK_HSIPrescalerConfig
 422                     	xref	_CLK_ClockSwitchConfig
 423                     	xref	_CLK_PeripheralClockConfig
 424                     	xref	_CLK_ClockSwitchCmd
 425                     	xref	_CLK_LSICmd
 426                     	xref	_CLK_HSICmd
 427                     	xref	_CLK_HSECmd
 428                     	xref	_CLK_DeInit
 429                     	xref	_delay_ms
 448                     	end
