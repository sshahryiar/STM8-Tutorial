   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  75                     ; 9 void main(void)
  75                     ; 10 {
  77                     	switch	.text
  78  0000               _main:
  80  0000 89            	pushw	x
  81       00000002      OFST:	set	2
  84                     ; 11 	unsigned char i = 0;	
  86  0001 0f02          	clr	(OFST+0,sp)
  88                     ; 12 	char ch = 0;
  90                     ; 14 	clock_setup();
  92  0003 ad63          	call	_clock_setup
  94                     ; 15 	GPIO_setup();
  96  0005 cd00ca        	call	_GPIO_setup
  98                     ; 16 	UART1_setup();
 100  0008 cd00e7        	call	_UART1_setup
 102                     ; 17 	LCD_init();
 104  000b cd0000        	call	_LCD_init
 106                     ; 18 	LCD_clear_home();
 108  000e cd0000        	call	_LCD_clear_home
 110                     ; 20 	LCD_goto(0, 0);
 112  0011 5f            	clrw	x
 113  0012 cd0000        	call	_LCD_goto
 115                     ; 21 	LCD_putstr("TX:");
 117  0015 ae0004        	ldw	x,#L33
 118  0018 cd0000        	call	_LCD_putstr
 120                     ; 22 	LCD_goto(0, 1);
 122  001b ae0001        	ldw	x,#1
 123  001e cd0000        	call	_LCD_goto
 125                     ; 23 	LCD_putstr("RX:");
 127  0021 ae0000        	ldw	x,#L53
 128  0024 cd0000        	call	_LCD_putstr
 130  0027               L73:
 131                     ; 27 		if(UART1_GetFlagStatus(UART1_FLAG_RXNE) == TRUE)
 133  0027 ae0020        	ldw	x,#32
 134  002a cd0000        	call	_UART1_GetFlagStatus
 136  002d a101          	cp	a,#1
 137  002f 261d          	jrne	L34
 138                     ; 29 			ch = UART1_ReceiveData8();
 140  0031 cd0000        	call	_UART1_ReceiveData8
 142  0034 6b01          	ld	(OFST-1,sp),a
 144                     ; 30 			LCD_goto(7, 1);
 146  0036 ae0701        	ldw	x,#1793
 147  0039 cd0000        	call	_LCD_goto
 149                     ; 31 			LCD_putchar(ch);
 151  003c 7b01          	ld	a,(OFST-1,sp)
 152  003e cd0000        	call	_LCD_putchar
 154                     ; 32 			UART1_ClearFlag(UART1_FLAG_RXNE);
 156  0041 ae0020        	ldw	x,#32
 157  0044 cd0000        	call	_UART1_ClearFlag
 159                     ; 33 			UART1_SendData8(i + 0x30);
 161  0047 7b02          	ld	a,(OFST+0,sp)
 162  0049 ab30          	add	a,#48
 163  004b cd0000        	call	_UART1_SendData8
 165  004e               L34:
 166                     ; 35 		if(UART1_GetFlagStatus(UART1_FLAG_TXE) == FALSE)
 168  004e ae0080        	ldw	x,#128
 169  0051 cd0000        	call	_UART1_GetFlagStatus
 171  0054 4d            	tnz	a
 172  0055 26d0          	jrne	L73
 173                     ; 37 			LCD_goto(7, 0);
 175  0057 ae0700        	ldw	x,#1792
 176  005a cd0000        	call	_LCD_goto
 178                     ; 38 			LCD_putchar(i + 0x30);
 180  005d 7b02          	ld	a,(OFST+0,sp)
 181  005f ab30          	add	a,#48
 182  0061 cd0000        	call	_LCD_putchar
 184                     ; 39 			i++;
 186  0064 0c02          	inc	(OFST+0,sp)
 188  0066 20bf          	jra	L73
 221                     ; 45 void clock_setup(void)
 221                     ; 46 {
 222                     	switch	.text
 223  0068               _clock_setup:
 227                     ; 47 	CLK_DeInit();
 229  0068 cd0000        	call	_CLK_DeInit
 231                     ; 49 	CLK_HSECmd(DISABLE);
 233  006b 4f            	clr	a
 234  006c cd0000        	call	_CLK_HSECmd
 236                     ; 50 	CLK_LSICmd(DISABLE);
 238  006f 4f            	clr	a
 239  0070 cd0000        	call	_CLK_LSICmd
 241                     ; 51 	CLK_HSICmd(ENABLE);
 243  0073 a601          	ld	a,#1
 244  0075 cd0000        	call	_CLK_HSICmd
 247  0078               L16:
 248                     ; 52 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 250  0078 ae0102        	ldw	x,#258
 251  007b cd0000        	call	_CLK_GetFlagStatus
 253  007e 4d            	tnz	a
 254  007f 27f7          	jreq	L16
 255                     ; 54 	CLK_ClockSwitchCmd(ENABLE);
 257  0081 a601          	ld	a,#1
 258  0083 cd0000        	call	_CLK_ClockSwitchCmd
 260                     ; 55 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 262  0086 a618          	ld	a,#24
 263  0088 cd0000        	call	_CLK_HSIPrescalerConfig
 265                     ; 56 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 267  008b a680          	ld	a,#128
 268  008d cd0000        	call	_CLK_SYSCLKConfig
 270                     ; 58 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 270                     ; 59 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 272  0090 4b01          	push	#1
 273  0092 4b00          	push	#0
 274  0094 ae01e1        	ldw	x,#481
 275  0097 cd0000        	call	_CLK_ClockSwitchConfig
 277  009a 85            	popw	x
 278                     ; 61 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 280  009b 5f            	clrw	x
 281  009c cd0000        	call	_CLK_PeripheralClockConfig
 283                     ; 62 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 285  009f ae0100        	ldw	x,#256
 286  00a2 cd0000        	call	_CLK_PeripheralClockConfig
 288                     ; 63 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 290  00a5 ae1300        	ldw	x,#4864
 291  00a8 cd0000        	call	_CLK_PeripheralClockConfig
 293                     ; 64 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 295  00ab ae1200        	ldw	x,#4608
 296  00ae cd0000        	call	_CLK_PeripheralClockConfig
 298                     ; 65 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);	
 300  00b1 ae0301        	ldw	x,#769
 301  00b4 cd0000        	call	_CLK_PeripheralClockConfig
 303                     ; 66 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 305  00b7 ae0700        	ldw	x,#1792
 306  00ba cd0000        	call	_CLK_PeripheralClockConfig
 308                     ; 67 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 310  00bd ae0500        	ldw	x,#1280
 311  00c0 cd0000        	call	_CLK_PeripheralClockConfig
 313                     ; 68 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 315  00c3 ae0400        	ldw	x,#1024
 316  00c6 cd0000        	call	_CLK_PeripheralClockConfig
 318                     ; 69 }
 321  00c9 81            	ret
 346                     ; 72 void GPIO_setup(void)
 346                     ; 73 {		
 347                     	switch	.text
 348  00ca               _GPIO_setup:
 352                     ; 74 	GPIO_DeInit(GPIOD);
 354  00ca ae500f        	ldw	x,#20495
 355  00cd cd0000        	call	_GPIO_DeInit
 357                     ; 76 	GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
 359  00d0 4bf0          	push	#240
 360  00d2 4b20          	push	#32
 361  00d4 ae500f        	ldw	x,#20495
 362  00d7 cd0000        	call	_GPIO_Init
 364  00da 85            	popw	x
 365                     ; 77 	GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
 367  00db 4b40          	push	#64
 368  00dd 4b40          	push	#64
 369  00df ae500f        	ldw	x,#20495
 370  00e2 cd0000        	call	_GPIO_Init
 372  00e5 85            	popw	x
 373                     ; 78 }
 376  00e6 81            	ret
 402                     ; 81 void UART1_setup(void)
 402                     ; 82 {
 403                     	switch	.text
 404  00e7               _UART1_setup:
 408                     ; 83 	UART1_DeInit();
 410  00e7 cd0000        	call	_UART1_DeInit
 412                     ; 85 	UART1_Init(9600, 
 412                     ; 86 					    UART1_WORDLENGTH_8D, 
 412                     ; 87 						UART1_STOPBITS_1, 
 412                     ; 88 						UART1_PARITY_NO, 
 412                     ; 89 						UART1_SYNCMODE_CLOCK_DISABLE, 
 412                     ; 90 						UART1_MODE_TXRX_ENABLE);
 414  00ea 4b0c          	push	#12
 415  00ec 4b80          	push	#128
 416  00ee 4b00          	push	#0
 417  00f0 4b00          	push	#0
 418  00f2 4b00          	push	#0
 419  00f4 ae2580        	ldw	x,#9600
 420  00f7 89            	pushw	x
 421  00f8 ae0000        	ldw	x,#0
 422  00fb 89            	pushw	x
 423  00fc cd0000        	call	_UART1_Init
 425  00ff 5b09          	addw	sp,#9
 426                     ; 92 	UART1_Cmd(ENABLE);
 428  0101 a601          	ld	a,#1
 429  0103 cd0000        	call	_UART1_Cmd
 431                     ; 93 }
 434  0106 81            	ret
 447                     	xdef	_main
 448                     	xdef	_UART1_setup
 449                     	xdef	_GPIO_setup
 450                     	xdef	_clock_setup
 451                     	xref	_LCD_goto
 452                     	xref	_LCD_clear_home
 453                     	xref	_LCD_putchar
 454                     	xref	_LCD_putstr
 455                     	xref	_LCD_init
 456                     	xref	_UART1_ClearFlag
 457                     	xref	_UART1_GetFlagStatus
 458                     	xref	_UART1_SendData8
 459                     	xref	_UART1_ReceiveData8
 460                     	xref	_UART1_Cmd
 461                     	xref	_UART1_Init
 462                     	xref	_UART1_DeInit
 463                     	xref	_GPIO_Init
 464                     	xref	_GPIO_DeInit
 465                     	xref	_CLK_GetFlagStatus
 466                     	xref	_CLK_SYSCLKConfig
 467                     	xref	_CLK_HSIPrescalerConfig
 468                     	xref	_CLK_ClockSwitchConfig
 469                     	xref	_CLK_PeripheralClockConfig
 470                     	xref	_CLK_ClockSwitchCmd
 471                     	xref	_CLK_LSICmd
 472                     	xref	_CLK_HSICmd
 473                     	xref	_CLK_HSECmd
 474                     	xref	_CLK_DeInit
 475                     .const:	section	.text
 476  0000               L53:
 477  0000 52583a00      	dc.b	"RX:",0
 478  0004               L33:
 479  0004 54583a00      	dc.b	"TX:",0
 499                     	end
