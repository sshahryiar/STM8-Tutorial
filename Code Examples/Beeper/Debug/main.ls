   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  50                     ; 9 void main(void)
  50                     ; 10 {
  52                     	switch	.text
  53  0000               _main:
  57                     ; 11 	clock_setup();
  59  0000 ad2f          	call	_clock_setup
  61                     ; 12 	GPIO_setup();
  63  0002 cd009c        	call	_GPIO_setup
  65                     ; 13 	beeper_setup();	
  67  0005 cd00b9        	call	_beeper_setup
  69  0008               L12:
  70                     ; 17 		GPIO_WriteLow(GPIOD, GPIO_PIN_0);
  72  0008 4b01          	push	#1
  73  000a ae500f        	ldw	x,#20495
  74  000d cd0000        	call	_GPIO_WriteLow
  76  0010 84            	pop	a
  77                     ; 18 		BEEP_Cmd(ENABLE);
  79  0011 a601          	ld	a,#1
  80  0013 cd0000        	call	_BEEP_Cmd
  82                     ; 19 		delay_ms(200);
  84  0016 ae00c8        	ldw	x,#200
  85  0019 cd0000        	call	_delay_ms
  87                     ; 21 		GPIO_WriteHigh(GPIOD, GPIO_PIN_0);
  89  001c 4b01          	push	#1
  90  001e ae500f        	ldw	x,#20495
  91  0021 cd0000        	call	_GPIO_WriteHigh
  93  0024 84            	pop	a
  94                     ; 22 		BEEP_Cmd(DISABLE);
  96  0025 4f            	clr	a
  97  0026 cd0000        	call	_BEEP_Cmd
  99                     ; 23 		delay_ms(200);
 101  0029 ae00c8        	ldw	x,#200
 102  002c cd0000        	call	_delay_ms
 105  002f 20d7          	jra	L12
 138                     ; 28 void clock_setup(void)
 138                     ; 29 {
 139                     	switch	.text
 140  0031               _clock_setup:
 144                     ; 30 	CLK_DeInit();
 146  0031 cd0000        	call	_CLK_DeInit
 148                     ; 32 	CLK_HSECmd(DISABLE);
 150  0034 4f            	clr	a
 151  0035 cd0000        	call	_CLK_HSECmd
 153                     ; 33 	CLK_LSICmd(ENABLE);
 155  0038 a601          	ld	a,#1
 156  003a cd0000        	call	_CLK_LSICmd
 159  003d               L73:
 160                     ; 34 	while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == FALSE);
 162  003d ae0110        	ldw	x,#272
 163  0040 cd0000        	call	_CLK_GetFlagStatus
 165  0043 4d            	tnz	a
 166  0044 27f7          	jreq	L73
 167                     ; 35 	CLK_HSICmd(ENABLE);
 169  0046 a601          	ld	a,#1
 170  0048 cd0000        	call	_CLK_HSICmd
 173  004b               L54:
 174                     ; 36 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 176  004b ae0102        	ldw	x,#258
 177  004e cd0000        	call	_CLK_GetFlagStatus
 179  0051 4d            	tnz	a
 180  0052 27f7          	jreq	L54
 181                     ; 38 	CLK_ClockSwitchCmd(ENABLE);
 183  0054 a601          	ld	a,#1
 184  0056 cd0000        	call	_CLK_ClockSwitchCmd
 186                     ; 39 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 188  0059 4f            	clr	a
 189  005a cd0000        	call	_CLK_HSIPrescalerConfig
 191                     ; 40 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 193  005d a680          	ld	a,#128
 194  005f cd0000        	call	_CLK_SYSCLKConfig
 196                     ; 42 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 196                     ; 43 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 198  0062 4b01          	push	#1
 199  0064 4b00          	push	#0
 200  0066 ae01e1        	ldw	x,#481
 201  0069 cd0000        	call	_CLK_ClockSwitchConfig
 203  006c 85            	popw	x
 204                     ; 45 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 206  006d ae0100        	ldw	x,#256
 207  0070 cd0000        	call	_CLK_PeripheralClockConfig
 209                     ; 46 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 211  0073 5f            	clrw	x
 212  0074 cd0000        	call	_CLK_PeripheralClockConfig
 214                     ; 47 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 216  0077 ae1300        	ldw	x,#4864
 217  007a cd0000        	call	_CLK_PeripheralClockConfig
 219                     ; 48 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, ENABLE);
 221  007d ae1201        	ldw	x,#4609
 222  0080 cd0000        	call	_CLK_PeripheralClockConfig
 224                     ; 49 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
 226  0083 ae0300        	ldw	x,#768
 227  0086 cd0000        	call	_CLK_PeripheralClockConfig
 229                     ; 50 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 231  0089 ae0700        	ldw	x,#1792
 232  008c cd0000        	call	_CLK_PeripheralClockConfig
 234                     ; 51 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 236  008f ae0500        	ldw	x,#1280
 237  0092 cd0000        	call	_CLK_PeripheralClockConfig
 239                     ; 52 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 241  0095 ae0400        	ldw	x,#1024
 242  0098 cd0000        	call	_CLK_PeripheralClockConfig
 244                     ; 53 }
 247  009b 81            	ret
 272                     ; 56 void GPIO_setup(void)
 272                     ; 57 {
 273                     	switch	.text
 274  009c               _GPIO_setup:
 278                     ; 58 	GPIO_DeInit(GPIOD);
 280  009c ae500f        	ldw	x,#20495
 281  009f cd0000        	call	_GPIO_DeInit
 283                     ; 59 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_LOW_FAST);
 285  00a2 4ba0          	push	#160
 286  00a4 4b01          	push	#1
 287  00a6 ae500f        	ldw	x,#20495
 288  00a9 cd0000        	call	_GPIO_Init
 290  00ac 85            	popw	x
 291                     ; 60 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);
 293  00ad 4bf0          	push	#240
 294  00af 4b10          	push	#16
 295  00b1 ae500f        	ldw	x,#20495
 296  00b4 cd0000        	call	_GPIO_Init
 298  00b7 85            	popw	x
 299                     ; 61 }
 302  00b8 81            	ret
 328                     ; 64 void beeper_setup(void)
 328                     ; 65 {
 329                     	switch	.text
 330  00b9               _beeper_setup:
 334                     ; 66 	BEEP_DeInit(); 
 336  00b9 cd0000        	call	_BEEP_DeInit
 338                     ; 67 	BEEP_LSICalibrationConfig(128000);
 340  00bc aef400        	ldw	x,#62464
 341  00bf 89            	pushw	x
 342  00c0 ae0001        	ldw	x,#1
 343  00c3 89            	pushw	x
 344  00c4 cd0000        	call	_BEEP_LSICalibrationConfig
 346  00c7 5b04          	addw	sp,#4
 347                     ; 68 	BEEP_Init(BEEP_FREQUENCY_2KHZ);
 349  00c9 a640          	ld	a,#64
 350  00cb cd0000        	call	_BEEP_Init
 352                     ; 69 }
 355  00ce 81            	ret
 368                     	xdef	_main
 369                     	xdef	_beeper_setup
 370                     	xdef	_GPIO_setup
 371                     	xdef	_clock_setup
 372                     	xref	_GPIO_WriteLow
 373                     	xref	_GPIO_WriteHigh
 374                     	xref	_GPIO_Init
 375                     	xref	_GPIO_DeInit
 376                     	xref	_CLK_GetFlagStatus
 377                     	xref	_CLK_SYSCLKConfig
 378                     	xref	_CLK_HSIPrescalerConfig
 379                     	xref	_CLK_ClockSwitchConfig
 380                     	xref	_CLK_PeripheralClockConfig
 381                     	xref	_CLK_ClockSwitchCmd
 382                     	xref	_CLK_LSICmd
 383                     	xref	_CLK_HSICmd
 384                     	xref	_CLK_HSECmd
 385                     	xref	_CLK_DeInit
 386                     	xref	_BEEP_LSICalibrationConfig
 387                     	xref	_BEEP_Cmd
 388                     	xref	_BEEP_Init
 389                     	xref	_BEEP_DeInit
 390                     	xref	_delay_ms
 409                     	end
