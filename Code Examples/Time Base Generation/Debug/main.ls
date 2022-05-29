   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  49                     ; 9 void main(void)
  49                     ; 10 {
  51                     	switch	.text
  52  0000               _main:
  56                     ; 11 	clock_setup();
  58  0000 ad24          	call	_clock_setup
  60                     ; 12 	GPIO_setup();
  62  0002 cd0088        	call	_GPIO_setup
  64                     ; 13 	TIM2_setup();
  66  0005 cd009a        	call	_TIM2_setup
  68  0008               L12:
  69                     ; 17 		if(TIM2_GetCounter() > 976)
  71  0008 cd0000        	call	_TIM2_GetCounter
  73  000b a303d1        	cpw	x,#977
  74  000e 250b          	jrult	L52
  75                     ; 19 			GPIO_WriteHigh(GPIOD, GPIO_PIN_0);
  77  0010 4b01          	push	#1
  78  0012 ae500f        	ldw	x,#20495
  79  0015 cd0000        	call	_GPIO_WriteHigh
  81  0018 84            	pop	a
  83  0019 20ed          	jra	L12
  84  001b               L52:
  85                     ; 23 			GPIO_WriteLow(GPIOD, GPIO_PIN_0);
  87  001b 4b01          	push	#1
  88  001d ae500f        	ldw	x,#20495
  89  0020 cd0000        	call	_GPIO_WriteLow
  91  0023 84            	pop	a
  92  0024 20e2          	jra	L12
 125                     ; 29 void clock_setup(void)
 125                     ; 30 {
 126                     	switch	.text
 127  0026               _clock_setup:
 131                     ; 31 	CLK_DeInit();
 133  0026 cd0000        	call	_CLK_DeInit
 135                     ; 33 	CLK_HSECmd(DISABLE);
 137  0029 4f            	clr	a
 138  002a cd0000        	call	_CLK_HSECmd
 140                     ; 34 	CLK_LSICmd(DISABLE);
 142  002d 4f            	clr	a
 143  002e cd0000        	call	_CLK_LSICmd
 145                     ; 35 	CLK_HSICmd(ENABLE);
 147  0031 a601          	ld	a,#1
 148  0033 cd0000        	call	_CLK_HSICmd
 151  0036               L34:
 152                     ; 36 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 154  0036 ae0102        	ldw	x,#258
 155  0039 cd0000        	call	_CLK_GetFlagStatus
 157  003c 4d            	tnz	a
 158  003d 27f7          	jreq	L34
 159                     ; 38 	CLK_ClockSwitchCmd(ENABLE);
 161  003f a601          	ld	a,#1
 162  0041 cd0000        	call	_CLK_ClockSwitchCmd
 164                     ; 39 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 166  0044 a618          	ld	a,#24
 167  0046 cd0000        	call	_CLK_HSIPrescalerConfig
 169                     ; 40 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 171  0049 a680          	ld	a,#128
 172  004b cd0000        	call	_CLK_SYSCLKConfig
 174                     ; 42 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 174                     ; 43 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 176  004e 4b01          	push	#1
 177  0050 4b00          	push	#0
 178  0052 ae01e1        	ldw	x,#481
 179  0055 cd0000        	call	_CLK_ClockSwitchConfig
 181  0058 85            	popw	x
 182                     ; 45 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 184  0059 ae0100        	ldw	x,#256
 185  005c cd0000        	call	_CLK_PeripheralClockConfig
 187                     ; 46 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 189  005f 5f            	clrw	x
 190  0060 cd0000        	call	_CLK_PeripheralClockConfig
 192                     ; 47 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 194  0063 ae1300        	ldw	x,#4864
 195  0066 cd0000        	call	_CLK_PeripheralClockConfig
 197                     ; 48 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 199  0069 ae1200        	ldw	x,#4608
 200  006c cd0000        	call	_CLK_PeripheralClockConfig
 202                     ; 49 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 204  006f ae0300        	ldw	x,#768
 205  0072 cd0000        	call	_CLK_PeripheralClockConfig
 207                     ; 50 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 209  0075 ae0700        	ldw	x,#1792
 210  0078 cd0000        	call	_CLK_PeripheralClockConfig
 212                     ; 51 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 214  007b ae0501        	ldw	x,#1281
 215  007e cd0000        	call	_CLK_PeripheralClockConfig
 217                     ; 52 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 219  0081 ae0400        	ldw	x,#1024
 220  0084 cd0000        	call	_CLK_PeripheralClockConfig
 222                     ; 53 }
 225  0087 81            	ret
 250                     ; 56 void GPIO_setup(void)
 250                     ; 57 {
 251                     	switch	.text
 252  0088               _GPIO_setup:
 256                     ; 58 	GPIO_DeInit(GPIOD);
 258  0088 ae500f        	ldw	x,#20495
 259  008b cd0000        	call	_GPIO_DeInit
 261                     ; 59 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_SLOW);
 263  008e 4b90          	push	#144
 264  0090 4b01          	push	#1
 265  0092 ae500f        	ldw	x,#20495
 266  0095 cd0000        	call	_GPIO_Init
 268  0098 85            	popw	x
 269                     ; 60 }
 272  0099 81            	ret
 298                     ; 63 void TIM2_setup(void)
 298                     ; 64 {
 299                     	switch	.text
 300  009a               _TIM2_setup:
 304                     ; 65 	TIM2_DeInit();
 306  009a cd0000        	call	_TIM2_DeInit
 308                     ; 66     TIM2_TimeBaseInit(TIM2_PRESCALER_2048, 1952);
 310  009d ae07a0        	ldw	x,#1952
 311  00a0 89            	pushw	x
 312  00a1 a60b          	ld	a,#11
 313  00a3 cd0000        	call	_TIM2_TimeBaseInit
 315  00a6 85            	popw	x
 316                     ; 67 	TIM2_Cmd(ENABLE);
 318  00a7 a601          	ld	a,#1
 319  00a9 cd0000        	call	_TIM2_Cmd
 321                     ; 68 }
 324  00ac 81            	ret
 337                     	xdef	_main
 338                     	xdef	_TIM2_setup
 339                     	xdef	_GPIO_setup
 340                     	xdef	_clock_setup
 341                     	xref	_TIM2_GetCounter
 342                     	xref	_TIM2_Cmd
 343                     	xref	_TIM2_TimeBaseInit
 344                     	xref	_TIM2_DeInit
 345                     	xref	_GPIO_WriteLow
 346                     	xref	_GPIO_WriteHigh
 347                     	xref	_GPIO_Init
 348                     	xref	_GPIO_DeInit
 349                     	xref	_CLK_GetFlagStatus
 350                     	xref	_CLK_SYSCLKConfig
 351                     	xref	_CLK_HSIPrescalerConfig
 352                     	xref	_CLK_ClockSwitchConfig
 353                     	xref	_CLK_PeripheralClockConfig
 354                     	xref	_CLK_ClockSwitchCmd
 355                     	xref	_CLK_LSICmd
 356                     	xref	_CLK_HSICmd
 357                     	xref	_CLK_HSECmd
 358                     	xref	_CLK_DeInit
 377                     	end
