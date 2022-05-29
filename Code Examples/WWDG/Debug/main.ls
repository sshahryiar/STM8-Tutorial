   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  62                     ; 9 void main(void)
  62                     ; 10 {
  64                     	switch	.text
  65  0000               _main:
  67  0000 88            	push	a
  68       00000001      OFST:	set	1
  71                     ; 11 	unsigned char i = 0x00;
  73                     ; 13 	clock_setup();
  75  0001 ad50          	call	_clock_setup
  77                     ; 14 	GPIO_setup();
  79  0003 cd00b5        	call	_GPIO_setup
  81                     ; 16 	for(i = 0x00; i < 0x04; i++)
  83  0006 0f01          	clr	(OFST+0,sp)
  85  0008               L72:
  86                     ; 18 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
  88  0008 4b01          	push	#1
  89  000a ae500f        	ldw	x,#20495
  90  000d cd0000        	call	_GPIO_WriteReverse
  92  0010 84            	pop	a
  93                     ; 19 		delay_ms(40);
  95  0011 ae0028        	ldw	x,#40
  96  0014 cd0000        	call	_delay_ms
  98                     ; 16 	for(i = 0x00; i < 0x04; i++)
 100  0017 0c01          	inc	(OFST+0,sp)
 104  0019 7b01          	ld	a,(OFST+0,sp)
 105  001b a104          	cp	a,#4
 106  001d 25e9          	jrult	L72
 107                     ; 22 	WWDG_setup();	
 109  001f cd00d8        	call	_WWDG_setup
 111  0022               L53:
 112                     ; 26 		if((GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == FALSE) || ((WWDG_GetCounter() > 0x60) && (WWDG_GetCounter() < 0x7F)))
 114  0022 4b80          	push	#128
 115  0024 ae5005        	ldw	x,#20485
 116  0027 cd0000        	call	_GPIO_ReadInputPin
 118  002a 5b01          	addw	sp,#1
 119  002c 4d            	tnz	a
 120  002d 270e          	jreq	L34
 122  002f cd0000        	call	_WWDG_GetCounter
 124  0032 a161          	cp	a,#97
 125  0034 250c          	jrult	L14
 127  0036 cd0000        	call	_WWDG_GetCounter
 129  0039 a17f          	cp	a,#127
 130  003b 2405          	jruge	L14
 131  003d               L34:
 132                     ; 28 			WWDG_SetCounter(0x7F);
 134  003d a67f          	ld	a,#127
 135  003f cd0000        	call	_WWDG_SetCounter
 137  0042               L14:
 138                     ; 30 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 140  0042 4b01          	push	#1
 141  0044 ae500f        	ldw	x,#20495
 142  0047 cd0000        	call	_GPIO_WriteReverse
 144  004a 84            	pop	a
 145                     ; 31 		delay_ms(20);
 147  004b ae0014        	ldw	x,#20
 148  004e cd0000        	call	_delay_ms
 151  0051 20cf          	jra	L53
 184                     ; 36 void clock_setup(void)
 184                     ; 37 {
 185                     	switch	.text
 186  0053               _clock_setup:
 190                     ; 38 	CLK_DeInit();
 192  0053 cd0000        	call	_CLK_DeInit
 194                     ; 40 	CLK_HSECmd(DISABLE);
 196  0056 4f            	clr	a
 197  0057 cd0000        	call	_CLK_HSECmd
 199                     ; 41 	CLK_LSICmd(DISABLE);
 201  005a 4f            	clr	a
 202  005b cd0000        	call	_CLK_LSICmd
 204                     ; 42 	CLK_HSICmd(ENABLE);
 206  005e a601          	ld	a,#1
 207  0060 cd0000        	call	_CLK_HSICmd
 210  0063               L75:
 211                     ; 43 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 213  0063 ae0102        	ldw	x,#258
 214  0066 cd0000        	call	_CLK_GetFlagStatus
 216  0069 4d            	tnz	a
 217  006a 27f7          	jreq	L75
 218                     ; 45 	CLK_ClockSwitchCmd(ENABLE);
 220  006c a601          	ld	a,#1
 221  006e cd0000        	call	_CLK_ClockSwitchCmd
 223                     ; 46 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 225  0071 a618          	ld	a,#24
 226  0073 cd0000        	call	_CLK_HSIPrescalerConfig
 228                     ; 47 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV64);
 230  0076 a686          	ld	a,#134
 231  0078 cd0000        	call	_CLK_SYSCLKConfig
 233                     ; 49 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 233                     ; 50 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 235  007b 4b01          	push	#1
 236  007d 4b00          	push	#0
 237  007f ae01e1        	ldw	x,#481
 238  0082 cd0000        	call	_CLK_ClockSwitchConfig
 240  0085 85            	popw	x
 241                     ; 52 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 243  0086 5f            	clrw	x
 244  0087 cd0000        	call	_CLK_PeripheralClockConfig
 246                     ; 53 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 248  008a ae0100        	ldw	x,#256
 249  008d cd0000        	call	_CLK_PeripheralClockConfig
 251                     ; 54 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 253  0090 ae1300        	ldw	x,#4864
 254  0093 cd0000        	call	_CLK_PeripheralClockConfig
 256                     ; 55 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 258  0096 ae1200        	ldw	x,#4608
 259  0099 cd0000        	call	_CLK_PeripheralClockConfig
 261                     ; 56 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);	
 263  009c ae0300        	ldw	x,#768
 264  009f cd0000        	call	_CLK_PeripheralClockConfig
 266                     ; 57 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 268  00a2 ae0700        	ldw	x,#1792
 269  00a5 cd0000        	call	_CLK_PeripheralClockConfig
 271                     ; 58 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 273  00a8 ae0500        	ldw	x,#1280
 274  00ab cd0000        	call	_CLK_PeripheralClockConfig
 276                     ; 59 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 278  00ae ae0400        	ldw	x,#1024
 279  00b1 cd0000        	call	_CLK_PeripheralClockConfig
 281                     ; 60 }
 284  00b4 81            	ret
 309                     ; 63 void GPIO_setup(void)
 309                     ; 64 {		
 310                     	switch	.text
 311  00b5               _GPIO_setup:
 315                     ; 65 	GPIO_DeInit(GPIOB);
 317  00b5 ae5005        	ldw	x,#20485
 318  00b8 cd0000        	call	_GPIO_DeInit
 320                     ; 66 	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
 322  00bb 4b40          	push	#64
 323  00bd 4b80          	push	#128
 324  00bf ae5005        	ldw	x,#20485
 325  00c2 cd0000        	call	_GPIO_Init
 327  00c5 85            	popw	x
 328                     ; 68 	GPIO_DeInit(GPIOD);
 330  00c6 ae500f        	ldw	x,#20495
 331  00c9 cd0000        	call	_GPIO_DeInit
 333                     ; 69 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_FAST);
 335  00cc 4bb0          	push	#176
 336  00ce 4b01          	push	#1
 337  00d0 ae500f        	ldw	x,#20495
 338  00d3 cd0000        	call	_GPIO_Init
 340  00d6 85            	popw	x
 341                     ; 70 }
 344  00d7 81            	ret
 368                     ; 73 void WWDG_setup(void)
 368                     ; 74 {
 369                     	switch	.text
 370  00d8               _WWDG_setup:
 374                     ; 75 	WWDG_Init(0x7F, 0x60);
 376  00d8 ae7f60        	ldw	x,#32608
 377  00db cd0000        	call	_WWDG_Init
 379                     ; 76 }
 382  00de 81            	ret
 395                     	xdef	_main
 396                     	xdef	_WWDG_setup
 397                     	xdef	_GPIO_setup
 398                     	xdef	_clock_setup
 399                     	xref	_WWDG_GetCounter
 400                     	xref	_WWDG_SetCounter
 401                     	xref	_WWDG_Init
 402                     	xref	_GPIO_ReadInputPin
 403                     	xref	_GPIO_WriteReverse
 404                     	xref	_GPIO_Init
 405                     	xref	_GPIO_DeInit
 406                     	xref	_CLK_GetFlagStatus
 407                     	xref	_CLK_SYSCLKConfig
 408                     	xref	_CLK_HSIPrescalerConfig
 409                     	xref	_CLK_ClockSwitchConfig
 410                     	xref	_CLK_PeripheralClockConfig
 411                     	xref	_CLK_ClockSwitchCmd
 412                     	xref	_CLK_LSICmd
 413                     	xref	_CLK_HSICmd
 414                     	xref	_CLK_HSECmd
 415                     	xref	_CLK_DeInit
 416                     	xref	_delay_ms
 435                     	end
