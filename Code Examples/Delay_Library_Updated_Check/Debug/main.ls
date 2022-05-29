   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  79                     ; 8 void main (void)
  79                     ; 9 {
  81                     	switch	.text
  82  0000               _main:
  84  0000 88            	push	a
  85       00000001      OFST:	set	1
  88                     ; 10 		bool i = FALSE;
  90  0001 0f01          	clr	(OFST+0,sp)
  92                     ; 12 		GPIO_setup();
  94  0003 ad43          	call	_GPIO_setup
  96                     ; 13 		clock_setup();
  98  0005 ad64          	call	_clock_setup
 100  0007               L34:
 101                     ; 17 			if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == FALSE)
 103  0007 4b80          	push	#128
 104  0009 ae5005        	ldw	x,#20485
 105  000c cd0000        	call	_GPIO_ReadInputPin
 107  000f 5b01          	addw	sp,#1
 108  0011 4d            	tnz	a
 109  0012 2613          	jrne	L74
 111  0014               L35:
 112                     ; 19 				while(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == FALSE);
 114  0014 4b80          	push	#128
 115  0016 ae5005        	ldw	x,#20485
 116  0019 cd0000        	call	_GPIO_ReadInputPin
 118  001c 5b01          	addw	sp,#1
 119  001e 4d            	tnz	a
 120  001f 27f3          	jreq	L35
 121                     ; 20 				i ^= 1;
 123  0021 7b01          	ld	a,(OFST+0,sp)
 124  0023 a801          	xor	a,	#1
 125  0025 6b01          	ld	(OFST+0,sp),a
 127  0027               L74:
 128                     ; 23 			switch(i)
 130  0027 7b01          	ld	a,(OFST+0,sp)
 132                     ; 33 						break;
 133  0029 4d            	tnz	a
 134  002a 270b          	jreq	L5
 135  002c 4a            	dec	a
 136  002d 260e          	jrne	L16
 137                     ; 27 						delay_us(10000);
 139  002f ae2710        	ldw	x,#10000
 140  0032 cd0000        	call	_delay_us
 142                     ; 28 						break;
 144  0035 2006          	jra	L16
 145  0037               L5:
 146                     ; 32 						delay_us(100);
 148  0037 ae0064        	ldw	x,#100
 149  003a cd0000        	call	_delay_us
 151                     ; 33 						break;
 153  003d               L16:
 154                     ; 37 			GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 156  003d 4b01          	push	#1
 157  003f ae500f        	ldw	x,#20495
 158  0042 cd0000        	call	_GPIO_WriteReverse
 160  0045 84            	pop	a
 162  0046 20bf          	jra	L34
 187                     ; 42 void GPIO_setup(void)
 187                     ; 43 {
 188                     	switch	.text
 189  0048               _GPIO_setup:
 193                     ; 45 	GPIO_DeInit(GPIOB);
 195  0048 ae5005        	ldw	x,#20485
 196  004b cd0000        	call	_GPIO_DeInit
 198                     ; 46 	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_FL_NO_IT);
 200  004e 4b00          	push	#0
 201  0050 4b80          	push	#128
 202  0052 ae5005        	ldw	x,#20485
 203  0055 cd0000        	call	_GPIO_Init
 205  0058 85            	popw	x
 206                     ; 48 	GPIO_DeInit(GPIOD);
 208  0059 ae500f        	ldw	x,#20495
 209  005c cd0000        	call	_GPIO_DeInit
 211                     ; 49 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 213  005f 4be0          	push	#224
 214  0061 4b01          	push	#1
 215  0063 ae500f        	ldw	x,#20495
 216  0066 cd0000        	call	_GPIO_Init
 218  0069 85            	popw	x
 219                     ; 50 }
 222  006a 81            	ret
 255                     ; 53 void clock_setup(void)
 255                     ; 54 {
 256                     	switch	.text
 257  006b               _clock_setup:
 261                     ; 55 	CLK_DeInit();
 263  006b cd0000        	call	_CLK_DeInit
 265                     ; 57 	CLK_HSECmd(DISABLE);
 267  006e 4f            	clr	a
 268  006f cd0000        	call	_CLK_HSECmd
 270                     ; 58 	CLK_LSICmd(DISABLE);
 272  0072 4f            	clr	a
 273  0073 cd0000        	call	_CLK_LSICmd
 275                     ; 59 	CLK_HSICmd(ENABLE);
 277  0076 a601          	ld	a,#1
 278  0078 cd0000        	call	_CLK_HSICmd
 281  007b               L501:
 282                     ; 60 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 284  007b ae0102        	ldw	x,#258
 285  007e cd0000        	call	_CLK_GetFlagStatus
 287  0081 4d            	tnz	a
 288  0082 27f7          	jreq	L501
 289                     ; 62 	CLK_ClockSwitchCmd(ENABLE);
 291  0084 a601          	ld	a,#1
 292  0086 cd0000        	call	_CLK_ClockSwitchCmd
 294                     ; 63 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 296  0089 4f            	clr	a
 297  008a cd0000        	call	_CLK_HSIPrescalerConfig
 299                     ; 64 											  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 301  008d a680          	ld	a,#128
 302  008f cd0000        	call	_CLK_SYSCLKConfig
 304                     ; 66 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
 304                     ; 67 											  CLK_SOURCE_HSI, 
 304                     ; 68 											  DISABLE, 
 304                     ; 69 											  CLK_CURRENTCLOCKSTATE_ENABLE);
 306  0092 4b01          	push	#1
 307  0094 4b00          	push	#0
 308  0096 ae01e1        	ldw	x,#481
 309  0099 cd0000        	call	_CLK_ClockSwitchConfig
 311  009c 85            	popw	x
 312                     ; 71 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 314  009d ae0001        	ldw	x,#1
 315  00a0 cd0000        	call	_CLK_PeripheralClockConfig
 317                     ; 72 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 319  00a3 ae0100        	ldw	x,#256
 320  00a6 cd0000        	call	_CLK_PeripheralClockConfig
 322                     ; 73 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 324  00a9 ae1300        	ldw	x,#4864
 325  00ac cd0000        	call	_CLK_PeripheralClockConfig
 327                     ; 74 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 329  00af ae1200        	ldw	x,#4608
 330  00b2 cd0000        	call	_CLK_PeripheralClockConfig
 332                     ; 75 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 334  00b5 ae0300        	ldw	x,#768
 335  00b8 cd0000        	call	_CLK_PeripheralClockConfig
 337                     ; 76 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 339  00bb ae0700        	ldw	x,#1792
 340  00be cd0000        	call	_CLK_PeripheralClockConfig
 342                     ; 77 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 344  00c1 ae0500        	ldw	x,#1280
 345  00c4 cd0000        	call	_CLK_PeripheralClockConfig
 347                     ; 78 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 349  00c7 ae0400        	ldw	x,#1024
 350  00ca cd0000        	call	_CLK_PeripheralClockConfig
 352                     ; 79 }
 355  00cd 81            	ret
 368                     	xdef	_main
 369                     	xdef	_clock_setup
 370                     	xdef	_GPIO_setup
 371                     	xref	_GPIO_ReadInputPin
 372                     	xref	_GPIO_WriteReverse
 373                     	xref	_GPIO_Init
 374                     	xref	_GPIO_DeInit
 375                     	xref	_CLK_GetFlagStatus
 376                     	xref	_CLK_SYSCLKConfig
 377                     	xref	_CLK_HSIPrescalerConfig
 378                     	xref	_CLK_ClockSwitchConfig
 379                     	xref	_CLK_PeripheralClockConfig
 380                     	xref	_CLK_ClockSwitchCmd
 381                     	xref	_CLK_LSICmd
 382                     	xref	_CLK_HSICmd
 383                     	xref	_CLK_HSECmd
 384                     	xref	_CLK_DeInit
 385                     	xref	_delay_us
 404                     	end
