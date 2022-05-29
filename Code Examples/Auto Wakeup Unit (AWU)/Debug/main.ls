   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  60                     ; 9 void main(void)
  60                     ; 10 {
  62                     	switch	.text
  63  0000               _main:
  65  0000 88            	push	a
  66       00000001      OFST:	set	1
  69                     ; 11 	unsigned char s = 0x00;
  71                     ; 13 	clock_setup();
  73  0001 ad31          	call	_clock_setup
  75                     ; 14 	GPIO_setup();
  77  0003 cd00a0        	call	_GPIO_setup
  79                     ; 15 	AWU_setup();
  81  0006 cd00b2        	call	_AWU_setup
  83  0009               L72:
  84                     ; 19 		for(s = 0x00; s < 0x04; s++)
  86  0009 0f01          	clr	(OFST+0,sp)
  88  000b               L33:
  89                     ; 21 			GPIO_WriteLow(GPIOD, GPIO_PIN_0);
  91  000b 4b01          	push	#1
  92  000d ae500f        	ldw	x,#20495
  93  0010 cd0000        	call	_GPIO_WriteLow
  95  0013 84            	pop	a
  96                     ; 22 			delay_ms(60);
  98  0014 ae003c        	ldw	x,#60
  99  0017 cd0000        	call	_delay_ms
 101                     ; 23 			GPIO_WriteHigh(GPIOD, GPIO_PIN_0);
 103  001a 4b01          	push	#1
 104  001c ae500f        	ldw	x,#20495
 105  001f cd0000        	call	_GPIO_WriteHigh
 107  0022 84            	pop	a
 108                     ; 24 			delay_ms(60);
 110  0023 ae003c        	ldw	x,#60
 111  0026 cd0000        	call	_delay_ms
 113                     ; 19 		for(s = 0x00; s < 0x04; s++)
 115  0029 0c01          	inc	(OFST+0,sp)
 119  002b 7b01          	ld	a,(OFST+0,sp)
 120  002d a104          	cp	a,#4
 121  002f 25da          	jrult	L33
 122                     ; 27 		halt();				
 125  0031 8e            halt
 129  0032 20d5          	jra	L72
 162                     ; 32 void clock_setup(void)
 162                     ; 33 {
 163                     	switch	.text
 164  0034               _clock_setup:
 168                     ; 34 	CLK_DeInit();
 170  0034 cd0000        	call	_CLK_DeInit
 172                     ; 36 	CLK_HSECmd(DISABLE);
 174  0037 4f            	clr	a
 175  0038 cd0000        	call	_CLK_HSECmd
 177                     ; 38 	CLK_LSICmd(ENABLE);
 179  003b a601          	ld	a,#1
 180  003d cd0000        	call	_CLK_LSICmd
 183  0040               L35:
 184                     ; 39 	while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == FALSE);
 186  0040 ae0110        	ldw	x,#272
 187  0043 cd0000        	call	_CLK_GetFlagStatus
 189  0046 4d            	tnz	a
 190  0047 27f7          	jreq	L35
 191                     ; 40 	CLK_HSICmd(ENABLE);
 193  0049 a601          	ld	a,#1
 194  004b cd0000        	call	_CLK_HSICmd
 197  004e               L16:
 198                     ; 41 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 200  004e ae0102        	ldw	x,#258
 201  0051 cd0000        	call	_CLK_GetFlagStatus
 203  0054 4d            	tnz	a
 204  0055 27f7          	jreq	L16
 205                     ; 43 	CLK_ClockSwitchCmd(ENABLE);
 207  0057 a601          	ld	a,#1
 208  0059 cd0000        	call	_CLK_ClockSwitchCmd
 210                     ; 44 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 212  005c a618          	ld	a,#24
 213  005e cd0000        	call	_CLK_HSIPrescalerConfig
 215                     ; 45 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 217  0061 a680          	ld	a,#128
 218  0063 cd0000        	call	_CLK_SYSCLKConfig
 220                     ; 47 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 220                     ; 48 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 222  0066 4b01          	push	#1
 223  0068 4b00          	push	#0
 224  006a ae01e1        	ldw	x,#481
 225  006d cd0000        	call	_CLK_ClockSwitchConfig
 227  0070 85            	popw	x
 228                     ; 50 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, ENABLE);	
 230  0071 ae1201        	ldw	x,#4609
 231  0074 cd0000        	call	_CLK_PeripheralClockConfig
 233                     ; 51 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 235  0077 ae0100        	ldw	x,#256
 236  007a cd0000        	call	_CLK_PeripheralClockConfig
 238                     ; 52 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 240  007d 5f            	clrw	x
 241  007e cd0000        	call	_CLK_PeripheralClockConfig
 243                     ; 53 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 245  0081 ae1300        	ldw	x,#4864
 246  0084 cd0000        	call	_CLK_PeripheralClockConfig
 248                     ; 54 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 250  0087 ae0300        	ldw	x,#768
 251  008a cd0000        	call	_CLK_PeripheralClockConfig
 253                     ; 55 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 255  008d ae0700        	ldw	x,#1792
 256  0090 cd0000        	call	_CLK_PeripheralClockConfig
 258                     ; 56 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 260  0093 ae0500        	ldw	x,#1280
 261  0096 cd0000        	call	_CLK_PeripheralClockConfig
 263                     ; 57 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 265  0099 ae0400        	ldw	x,#1024
 266  009c cd0000        	call	_CLK_PeripheralClockConfig
 268                     ; 58 }
 271  009f 81            	ret
 296                     ; 61 void GPIO_setup(void)
 296                     ; 62 {		
 297                     	switch	.text
 298  00a0               _GPIO_setup:
 302                     ; 63 	GPIO_DeInit(GPIOD);
 304  00a0 ae500f        	ldw	x,#20495
 305  00a3 cd0000        	call	_GPIO_DeInit
 307                     ; 64 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_FAST);
 309  00a6 4bb0          	push	#176
 310  00a8 4b01          	push	#1
 311  00aa ae500f        	ldw	x,#20495
 312  00ad cd0000        	call	_GPIO_Init
 314  00b0 85            	popw	x
 315                     ; 65 }
 318  00b1 81            	ret
 347                     ; 68 void AWU_setup(void)
 347                     ; 69 {
 348                     	switch	.text
 349  00b2               _AWU_setup:
 353                     ; 70 	AWU_IdleModeEnable();	
 355  00b2 cd0000        	call	_AWU_IdleModeEnable
 357                     ; 71 	AWU_DeInit();
 359  00b5 cd0000        	call	_AWU_DeInit
 361                     ; 72 	AWU_LSICalibrationConfig(128000);
 363  00b8 aef400        	ldw	x,#62464
 364  00bb 89            	pushw	x
 365  00bc ae0001        	ldw	x,#1
 366  00bf 89            	pushw	x
 367  00c0 cd0000        	call	_AWU_LSICalibrationConfig
 369  00c3 5b04          	addw	sp,#4
 370                     ; 73 	AWU_Init(AWU_TIMEBASE_2S);
 372  00c5 a60e          	ld	a,#14
 373  00c7 cd0000        	call	_AWU_Init
 375                     ; 74 	AWU_Cmd(ENABLE);
 377  00ca a601          	ld	a,#1
 378  00cc cd0000        	call	_AWU_Cmd
 380                     ; 75 	enableInterrupts(); 
 383  00cf 9a            rim
 385                     ; 76 }
 389  00d0 81            	ret
 402                     	xdef	_main
 403                     	xdef	_AWU_setup
 404                     	xdef	_GPIO_setup
 405                     	xdef	_clock_setup
 406                     	xref	_GPIO_WriteLow
 407                     	xref	_GPIO_WriteHigh
 408                     	xref	_GPIO_Init
 409                     	xref	_GPIO_DeInit
 410                     	xref	_CLK_GetFlagStatus
 411                     	xref	_CLK_SYSCLKConfig
 412                     	xref	_CLK_HSIPrescalerConfig
 413                     	xref	_CLK_ClockSwitchConfig
 414                     	xref	_CLK_PeripheralClockConfig
 415                     	xref	_CLK_ClockSwitchCmd
 416                     	xref	_CLK_LSICmd
 417                     	xref	_CLK_HSICmd
 418                     	xref	_CLK_HSECmd
 419                     	xref	_CLK_DeInit
 420                     	xref	_AWU_IdleModeEnable
 421                     	xref	_AWU_LSICalibrationConfig
 422                     	xref	_AWU_Cmd
 423                     	xref	_AWU_Init
 424                     	xref	_AWU_DeInit
 425                     	xref	_delay_ms
 444                     	end
