   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  51                     ; 17 void main(void)
  51                     ; 18 {
  53                     	switch	.text
  54  0000               _main:
  58                     ; 19 	clock_setup();
  60  0000 ad2c          	call	_clock_setup
  62                     ; 20 	GPIO_setup();
  64  0002 cd0092        	call	_GPIO_setup
  66                     ; 21 	UART1_setup();
  68  0005 cd00ba        	call	_UART1_setup
  70                     ; 23 	LCD_init();  
  72  0008 cd0000        	call	_LCD_init
  74                     ; 24 	LCD_clear_home(); 
  76  000b cd0000        	call	_LCD_clear_home
  78                     ; 26 	LCD_goto(1, 0);
  80  000e ae0100        	ldw	x,#256
  81  0011 cd0000        	call	_LCD_goto
  83                     ; 27 	LCD_putstr("STM8S UART ISR");
  85  0014 ae0000        	ldw	x,#L12
  86  0017 cd0000        	call	_LCD_putstr
  88  001a               L32:
  89                     ; 31 		LCD_goto(0, 1);
  91  001a ae0001        	ldw	x,#1
  92  001d cd0000        	call	_LCD_goto
  94                     ; 32 		LCD_putstr(RX_value);
  96  0020 ae0000        	ldw	x,#_RX_value
  97  0023 cd0000        	call	_LCD_putstr
  99                     ; 33 		delay_ms(100);
 101  0026 ae0064        	ldw	x,#100
 102  0029 cd0000        	call	_delay_ms
 105  002c 20ec          	jra	L32
 138                     ; 38 void clock_setup(void)
 138                     ; 39 {
 139                     	switch	.text
 140  002e               _clock_setup:
 144                     ; 40 	CLK_DeInit();
 146  002e cd0000        	call	_CLK_DeInit
 148                     ; 42 	CLK_HSECmd(DISABLE);
 150  0031 4f            	clr	a
 151  0032 cd0000        	call	_CLK_HSECmd
 153                     ; 43 	CLK_LSICmd(DISABLE);
 155  0035 4f            	clr	a
 156  0036 cd0000        	call	_CLK_LSICmd
 158                     ; 44 	CLK_HSICmd(ENABLE);
 160  0039 a601          	ld	a,#1
 161  003b cd0000        	call	_CLK_HSICmd
 164  003e               L14:
 165                     ; 45 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 167  003e ae0102        	ldw	x,#258
 168  0041 cd0000        	call	_CLK_GetFlagStatus
 170  0044 4d            	tnz	a
 171  0045 27f7          	jreq	L14
 172                     ; 47 	CLK_ClockSwitchCmd(ENABLE);
 174  0047 a601          	ld	a,#1
 175  0049 cd0000        	call	_CLK_ClockSwitchCmd
 177                     ; 48 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV4);
 179  004c a610          	ld	a,#16
 180  004e cd0000        	call	_CLK_HSIPrescalerConfig
 182                     ; 49 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 184  0051 a680          	ld	a,#128
 185  0053 cd0000        	call	_CLK_SYSCLKConfig
 187                     ; 51 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 187                     ; 52 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 189  0056 4b01          	push	#1
 190  0058 4b00          	push	#0
 191  005a ae01e1        	ldw	x,#481
 192  005d cd0000        	call	_CLK_ClockSwitchConfig
 194  0060 85            	popw	x
 195                     ; 54 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 197  0061 ae0001        	ldw	x,#1
 198  0064 cd0000        	call	_CLK_PeripheralClockConfig
 200                     ; 55 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 202  0067 ae0301        	ldw	x,#769
 203  006a cd0000        	call	_CLK_PeripheralClockConfig
 205                     ; 56 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 207  006d ae1300        	ldw	x,#4864
 208  0070 cd0000        	call	_CLK_PeripheralClockConfig
 210                     ; 57 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 212  0073 ae0100        	ldw	x,#256
 213  0076 cd0000        	call	_CLK_PeripheralClockConfig
 215                     ; 58 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 217  0079 ae1200        	ldw	x,#4608
 218  007c cd0000        	call	_CLK_PeripheralClockConfig
 220                     ; 59 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 222  007f ae0700        	ldw	x,#1792
 223  0082 cd0000        	call	_CLK_PeripheralClockConfig
 225                     ; 60 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 227  0085 ae0500        	ldw	x,#1280
 228  0088 cd0000        	call	_CLK_PeripheralClockConfig
 230                     ; 61 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 232  008b ae0400        	ldw	x,#1024
 233  008e cd0000        	call	_CLK_PeripheralClockConfig
 235                     ; 62 }
 238  0091 81            	ret
 263                     ; 65 void GPIO_setup(void)
 263                     ; 66 {	
 264                     	switch	.text
 265  0092               _GPIO_setup:
 269                     ; 67 	GPIO_DeInit(GPIOD);
 271  0092 ae500f        	ldw	x,#20495
 272  0095 cd0000        	call	_GPIO_DeInit
 274                     ; 68 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_FAST);
 276  0098 4bb0          	push	#176
 277  009a 4b01          	push	#1
 278  009c ae500f        	ldw	x,#20495
 279  009f cd0000        	call	_GPIO_Init
 281  00a2 85            	popw	x
 282                     ; 69 	GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
 284  00a3 4bf0          	push	#240
 285  00a5 4b20          	push	#32
 286  00a7 ae500f        	ldw	x,#20495
 287  00aa cd0000        	call	_GPIO_Init
 289  00ad 85            	popw	x
 290                     ; 70 	GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
 292  00ae 4b00          	push	#0
 293  00b0 4b40          	push	#64
 294  00b2 ae500f        	ldw	x,#20495
 295  00b5 cd0000        	call	_GPIO_Init
 297  00b8 85            	popw	x
 298                     ; 71 }
 301  00b9 81            	ret
 329                     ; 74 void UART1_setup(void)
 329                     ; 75 {
 330                     	switch	.text
 331  00ba               _UART1_setup:
 335                     ; 76 	UART1_DeInit();
 337  00ba cd0000        	call	_UART1_DeInit
 339                     ; 78 	UART1_Init(9600, 
 339                     ; 79 					    UART1_WORDLENGTH_8D, 
 339                     ; 80 						UART1_STOPBITS_1, 
 339                     ; 81 						UART1_PARITY_NO, 
 339                     ; 82 						UART1_SYNCMODE_CLOCK_DISABLE, 
 339                     ; 83 						UART1_MODE_TXRX_ENABLE);
 341  00bd 4b0c          	push	#12
 342  00bf 4b80          	push	#128
 343  00c1 4b00          	push	#0
 344  00c3 4b00          	push	#0
 345  00c5 4b00          	push	#0
 346  00c7 ae2580        	ldw	x,#9600
 347  00ca 89            	pushw	x
 348  00cb ae0000        	ldw	x,#0
 349  00ce 89            	pushw	x
 350  00cf cd0000        	call	_UART1_Init
 352  00d2 5b09          	addw	sp,#9
 353                     ; 85 	UART1_ITConfig(UART1_IT_RXNE, ENABLE);
 355  00d4 4b01          	push	#1
 356  00d6 ae0255        	ldw	x,#597
 357  00d9 cd0000        	call	_UART1_ITConfig
 359  00dc 84            	pop	a
 360                     ; 86 	enableInterrupts();
 363  00dd 9a            rim
 365                     ; 88 	UART1_Cmd(ENABLE);
 368  00de a601          	ld	a,#1
 369  00e0 cd0000        	call	_UART1_Cmd
 371                     ; 89 }
 374  00e3 81            	ret
 437                     ; 92 void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
 437                     ; 93 {
 438                     	switch	.text
 439  00e4               _lcd_print:
 441  00e4 89            	pushw	x
 442  00e5 88            	push	a
 443       00000001      OFST:	set	1
 446                     ; 94 	char chr = 0x00;
 448                     ; 96 	chr = ((value / 1000) + 0x30);	
 450  00e6 1e06          	ldw	x,(OFST+5,sp)
 451  00e8 90ae03e8      	ldw	y,#1000
 452  00ec 65            	divw	x,y
 453  00ed 1c0030        	addw	x,#48
 454  00f0 01            	rrwa	x,a
 455  00f1 6b01          	ld	(OFST+0,sp),a
 456  00f3 02            	rlwa	x,a
 458                     ; 97 	LCD_goto(x_pos, y_pos);
 460  00f4 7b03          	ld	a,(OFST+2,sp)
 461  00f6 97            	ld	xl,a
 462  00f7 7b02          	ld	a,(OFST+1,sp)
 463  00f9 95            	ld	xh,a
 464  00fa cd0000        	call	_LCD_goto
 466                     ; 98 	LCD_putchar(chr); 
 468  00fd 7b01          	ld	a,(OFST+0,sp)
 469  00ff cd0000        	call	_LCD_putchar
 471                     ; 100 	chr = (((value / 100) % 10) + 0x30);
 473  0102 1e06          	ldw	x,(OFST+5,sp)
 474  0104 a664          	ld	a,#100
 475  0106 62            	div	x,a
 476  0107 a60a          	ld	a,#10
 477  0109 62            	div	x,a
 478  010a 5f            	clrw	x
 479  010b 97            	ld	xl,a
 480  010c 1c0030        	addw	x,#48
 481  010f 01            	rrwa	x,a
 482  0110 6b01          	ld	(OFST+0,sp),a
 483  0112 02            	rlwa	x,a
 485                     ; 101 	LCD_goto((x_pos + 1), y_pos);
 487  0113 7b03          	ld	a,(OFST+2,sp)
 488  0115 97            	ld	xl,a
 489  0116 7b02          	ld	a,(OFST+1,sp)
 490  0118 4c            	inc	a
 491  0119 95            	ld	xh,a
 492  011a cd0000        	call	_LCD_goto
 494                     ; 102 	LCD_putchar(chr); 
 496  011d 7b01          	ld	a,(OFST+0,sp)
 497  011f cd0000        	call	_LCD_putchar
 499                     ; 104 	chr = (((value / 10) % 10) + 0x30);
 501  0122 1e06          	ldw	x,(OFST+5,sp)
 502  0124 a60a          	ld	a,#10
 503  0126 62            	div	x,a
 504  0127 a60a          	ld	a,#10
 505  0129 62            	div	x,a
 506  012a 5f            	clrw	x
 507  012b 97            	ld	xl,a
 508  012c 1c0030        	addw	x,#48
 509  012f 01            	rrwa	x,a
 510  0130 6b01          	ld	(OFST+0,sp),a
 511  0132 02            	rlwa	x,a
 513                     ; 105 	LCD_goto((x_pos + 2), y_pos);
 515  0133 7b03          	ld	a,(OFST+2,sp)
 516  0135 97            	ld	xl,a
 517  0136 7b02          	ld	a,(OFST+1,sp)
 518  0138 ab02          	add	a,#2
 519  013a 95            	ld	xh,a
 520  013b cd0000        	call	_LCD_goto
 522                     ; 106 	LCD_putchar(chr); 
 524  013e 7b01          	ld	a,(OFST+0,sp)
 525  0140 cd0000        	call	_LCD_putchar
 527                     ; 108 	chr = ((value % 10) + 0x30);
 529  0143 1e06          	ldw	x,(OFST+5,sp)
 530  0145 a60a          	ld	a,#10
 531  0147 62            	div	x,a
 532  0148 5f            	clrw	x
 533  0149 97            	ld	xl,a
 534  014a 1c0030        	addw	x,#48
 535  014d 01            	rrwa	x,a
 536  014e 6b01          	ld	(OFST+0,sp),a
 537  0150 02            	rlwa	x,a
 539                     ; 109 	LCD_goto((x_pos + 3), y_pos);
 541  0151 7b03          	ld	a,(OFST+2,sp)
 542  0153 97            	ld	xl,a
 543  0154 7b02          	ld	a,(OFST+1,sp)
 544  0156 ab03          	add	a,#3
 545  0158 95            	ld	xh,a
 546  0159 cd0000        	call	_LCD_goto
 548                     ; 110 	LCD_putchar(chr); 
 550  015c 7b01          	ld	a,(OFST+0,sp)
 551  015e cd0000        	call	_LCD_putchar
 553                     ; 111 }
 556  0161 5b03          	addw	sp,#3
 557  0163 81            	ret
 609                     	xdef	_main
 610                     	xdef	_lcd_print
 611                     	xdef	_UART1_setup
 612                     	xdef	_GPIO_setup
 613                     	xdef	_clock_setup
 614                     	switch	.ubsct
 615  0000               _RX_value:
 616  0000 000000000000  	ds.b	16
 617                     	xdef	_RX_value
 618  0010               _pos:
 619  0010 00            	ds.b	1
 620                     	xdef	_pos
 621                     	xref	_LCD_goto
 622                     	xref	_LCD_clear_home
 623                     	xref	_LCD_putchar
 624                     	xref	_LCD_putstr
 625                     	xref	_LCD_init
 626  0011               _data_value:
 627  0011 00            	ds.b	1
 628                     	xdef	_data_value
 629  0012               _bl_state:
 630  0012 00            	ds.b	1
 631                     	xdef	_bl_state
 632                     	xref	_UART1_ITConfig
 633                     	xref	_UART1_Cmd
 634                     	xref	_UART1_Init
 635                     	xref	_UART1_DeInit
 636                     	xref	_GPIO_Init
 637                     	xref	_GPIO_DeInit
 638                     	xref	_CLK_GetFlagStatus
 639                     	xref	_CLK_SYSCLKConfig
 640                     	xref	_CLK_HSIPrescalerConfig
 641                     	xref	_CLK_ClockSwitchConfig
 642                     	xref	_CLK_PeripheralClockConfig
 643                     	xref	_CLK_ClockSwitchCmd
 644                     	xref	_CLK_LSICmd
 645                     	xref	_CLK_HSICmd
 646                     	xref	_CLK_HSECmd
 647                     	xref	_CLK_DeInit
 648                     	xref	_delay_ms
 649                     .const:	section	.text
 650  0000               L12:
 651  0000 53544d385320  	dc.b	"STM8S UART ISR",0
 671                     	end
