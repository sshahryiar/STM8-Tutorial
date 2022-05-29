   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 9 void main(void)
  45                     ; 10 {
  47                     	switch	.text
  48  0000               _main:
  52                     ; 11 	clock_setup();
  54  0000 ad07          	call	_clock_setup
  56                     ; 12 	GPIO_setup();
  58  0002 ad76          	call	_GPIO_setup
  60                     ; 13 	TIM1_setup();
  62  0004 cd009b        	call	_TIM1_setup
  64  0007               L12:
  66  0007 20fe          	jra	L12
  99                     ; 21 void clock_setup(void)
  99                     ; 22 {
 100                     	switch	.text
 101  0009               _clock_setup:
 105                     ; 23 	CLK_DeInit();
 107  0009 cd0000        	call	_CLK_DeInit
 109                     ; 25 	CLK_HSECmd(ENABLE);
 111  000c a601          	ld	a,#1
 112  000e cd0000        	call	_CLK_HSECmd
 115  0011               L73:
 116                     ; 26 	while(CLK_GetFlagStatus(CLK_FLAG_HSERDY) == FALSE);
 118  0011 ae0202        	ldw	x,#514
 119  0014 cd0000        	call	_CLK_GetFlagStatus
 121  0017 4d            	tnz	a
 122  0018 27f7          	jreq	L73
 123                     ; 28 	CLK_LSICmd(DISABLE);
 125  001a 4f            	clr	a
 126  001b cd0000        	call	_CLK_LSICmd
 128                     ; 30 	CLK_HSICmd(ENABLE);
 130  001e a601          	ld	a,#1
 131  0020 cd0000        	call	_CLK_HSICmd
 134  0023               L54:
 135                     ; 31 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 137  0023 ae0102        	ldw	x,#258
 138  0026 cd0000        	call	_CLK_GetFlagStatus
 140  0029 4d            	tnz	a
 141  002a 27f7          	jreq	L54
 142                     ; 33 	CLK_ClockSwitchCmd(ENABLE);
 144  002c a601          	ld	a,#1
 145  002e cd0000        	call	_CLK_ClockSwitchCmd
 147                     ; 34 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 149  0031 4f            	clr	a
 150  0032 cd0000        	call	_CLK_HSIPrescalerConfig
 152                     ; 35 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 154  0035 a680          	ld	a,#128
 155  0037 cd0000        	call	_CLK_SYSCLKConfig
 157                     ; 37 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 
 157                     ; 38 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 159  003a 4b01          	push	#1
 160  003c 4b00          	push	#0
 161  003e ae01b4        	ldw	x,#436
 162  0041 cd0000        	call	_CLK_ClockSwitchConfig
 164  0044 85            	popw	x
 165                     ; 40 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 167  0045 ae0701        	ldw	x,#1793
 168  0048 cd0000        	call	_CLK_PeripheralClockConfig
 170                     ; 41 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 172  004b ae0100        	ldw	x,#256
 173  004e cd0000        	call	_CLK_PeripheralClockConfig
 175                     ; 42 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 177  0051 5f            	clrw	x
 178  0052 cd0000        	call	_CLK_PeripheralClockConfig
 180                     ; 43 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 182  0055 ae1300        	ldw	x,#4864
 183  0058 cd0000        	call	_CLK_PeripheralClockConfig
 185                     ; 44 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 187  005b ae1200        	ldw	x,#4608
 188  005e cd0000        	call	_CLK_PeripheralClockConfig
 190                     ; 45 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
 192  0061 ae0300        	ldw	x,#768
 193  0064 cd0000        	call	_CLK_PeripheralClockConfig
 195                     ; 46 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 197  0067 ae0500        	ldw	x,#1280
 198  006a cd0000        	call	_CLK_PeripheralClockConfig
 200                     ; 47 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
 202  006d ae0600        	ldw	x,#1536
 203  0070 cd0000        	call	_CLK_PeripheralClockConfig
 205                     ; 48 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 207  0073 ae0400        	ldw	x,#1024
 208  0076 cd0000        	call	_CLK_PeripheralClockConfig
 210                     ; 49 }
 213  0079 81            	ret
 240                     ; 52 void GPIO_setup(void)
 240                     ; 53 {		
 241                     	switch	.text
 242  007a               _GPIO_setup:
 246                     ; 54 	GPIO_DeInit(GPIOC);
 248  007a ae500a        	ldw	x,#20490
 249  007d cd0000        	call	_GPIO_DeInit
 251                     ; 55 	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);
 253  0080 4bf0          	push	#240
 254  0082 4b10          	push	#16
 255  0084 ae500a        	ldw	x,#20490
 256  0087 cd0000        	call	_GPIO_Init
 258  008a 85            	popw	x
 259                     ; 56 	GPIO_WriteHigh(GPIOC, GPIO_PIN_4);
 261  008b 4b10          	push	#16
 262  008d ae500a        	ldw	x,#20490
 263  0090 cd0000        	call	_GPIO_WriteHigh
 265  0093 84            	pop	a
 266                     ; 57 	delay_ms(2000);
 268  0094 ae07d0        	ldw	x,#2000
 269  0097 cd0000        	call	_delay_ms
 271                     ; 58 }
 274  009a 81            	ret
 303                     ; 61 void TIM1_setup(void)
 303                     ; 62 {
 304                     	switch	.text
 305  009b               _TIM1_setup:
 309                     ; 63 	TIM1_DeInit();
 311  009b cd0000        	call	_TIM1_DeInit
 313                     ; 65 	TIM1_TimeBaseInit(160, TIM1_COUNTERMODE_UP, 10000, 1);
 315  009e 4b01          	push	#1
 316  00a0 ae2710        	ldw	x,#10000
 317  00a3 89            	pushw	x
 318  00a4 4b00          	push	#0
 319  00a6 ae00a0        	ldw	x,#160
 320  00a9 cd0000        	call	_TIM1_TimeBaseInit
 322  00ac 5b04          	addw	sp,#4
 323                     ; 67 	TIM1_OC4Init(TIM1_OCMODE_PWM2, 
 323                     ; 68 							TIM1_OUTPUTSTATE_ENABLE,  
 323                     ; 69 							6000, 
 323                     ; 70 							TIM1_OCPOLARITY_HIGH,  
 323                     ; 71 							TIM1_OCIDLESTATE_RESET);
 325  00ae 4b00          	push	#0
 326  00b0 4b00          	push	#0
 327  00b2 ae1770        	ldw	x,#6000
 328  00b5 89            	pushw	x
 329  00b6 ae7011        	ldw	x,#28689
 330  00b9 cd0000        	call	_TIM1_OC4Init
 332  00bc 5b04          	addw	sp,#4
 333                     ; 73 	TIM1_SelectOnePulseMode(TIM1_OPMODE_SINGLE);
 335  00be a601          	ld	a,#1
 336  00c0 cd0000        	call	_TIM1_SelectOnePulseMode
 338                     ; 74 	TIM1_CtrlPWMOutputs(ENABLE);
 340  00c3 a601          	ld	a,#1
 341  00c5 cd0000        	call	_TIM1_CtrlPWMOutputs
 343                     ; 75 	TIM1_Cmd(ENABLE);
 345  00c8 a601          	ld	a,#1
 346  00ca cd0000        	call	_TIM1_Cmd
 348                     ; 76 }
 351  00cd 81            	ret
 364                     	xdef	_main
 365                     	xdef	_TIM1_setup
 366                     	xdef	_GPIO_setup
 367                     	xdef	_clock_setup
 368                     	xref	_delay_ms
 369                     	xref	_TIM1_SelectOnePulseMode
 370                     	xref	_TIM1_CtrlPWMOutputs
 371                     	xref	_TIM1_Cmd
 372                     	xref	_TIM1_OC4Init
 373                     	xref	_TIM1_TimeBaseInit
 374                     	xref	_TIM1_DeInit
 375                     	xref	_GPIO_WriteHigh
 376                     	xref	_GPIO_Init
 377                     	xref	_GPIO_DeInit
 378                     	xref	_CLK_GetFlagStatus
 379                     	xref	_CLK_SYSCLKConfig
 380                     	xref	_CLK_HSIPrescalerConfig
 381                     	xref	_CLK_ClockSwitchConfig
 382                     	xref	_CLK_PeripheralClockConfig
 383                     	xref	_CLK_ClockSwitchCmd
 384                     	xref	_CLK_LSICmd
 385                     	xref	_CLK_HSICmd
 386                     	xref	_CLK_HSECmd
 387                     	xref	_CLK_DeInit
 406                     	end
