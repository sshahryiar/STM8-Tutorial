   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  67                     ; 10 void main()
  67                     ; 11 {
  69                     	switch	.text
  70  0000               _main:
  72  0000 89            	pushw	x
  73       00000002      OFST:	set	2
  76                     ; 12 	unsigned int A0 = 0x0000;
  78                     ; 14 	clock_setup();
  80  0001 ad49          	call	_clock_setup
  82                     ; 15 	GPIO_setup();
  84  0003 cd00ae        	call	_GPIO_setup
  86                     ; 16 	ADC1_setup();
  88  0006 cd00d7        	call	_ADC1_setup
  90                     ; 18 	LCD_init();  
  92  0009 cd0000        	call	_LCD_init
  94                     ; 19 	LCD_clear_home(); 
  96  000c cd0000        	call	_LCD_clear_home
  98                     ; 21 	LCD_goto(0, 0);
 100  000f 5f            	clrw	x
 101  0010 cd0000        	call	_LCD_goto
 103                     ; 22 	LCD_putstr("STM8 ADC");
 105  0013 ae0003        	ldw	x,#L72
 106  0016 cd0000        	call	_LCD_putstr
 108                     ; 23 	LCD_goto(0, 1);
 110  0019 ae0001        	ldw	x,#1
 111  001c cd0000        	call	_LCD_goto
 113                     ; 24 	LCD_putstr("A0");
 115  001f ae0000        	ldw	x,#L13
 116  0022 cd0000        	call	_LCD_putstr
 118  0025               L33:
 119                     ; 28 		ADC1_StartConversion();
 121  0025 cd0000        	call	_ADC1_StartConversion
 124  0028               L14:
 125                     ; 29 		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == FALSE);
 127  0028 a680          	ld	a,#128
 128  002a cd0000        	call	_ADC1_GetFlagStatus
 130  002d 4d            	tnz	a
 131  002e 27f8          	jreq	L14
 132                     ; 31 		A0 = ADC1_GetConversionValue();
 134  0030 cd0000        	call	_ADC1_GetConversionValue
 136  0033 1f01          	ldw	(OFST-1,sp),x
 138                     ; 32 		ADC1_ClearFlag(ADC1_FLAG_EOC);
 140  0035 a680          	ld	a,#128
 141  0037 cd0000        	call	_ADC1_ClearFlag
 143                     ; 34 		lcd_print(4, 1, A0);
 145  003a 1e01          	ldw	x,(OFST-1,sp)
 146  003c 89            	pushw	x
 147  003d ae0401        	ldw	x,#1025
 148  0040 cd00f4        	call	_lcd_print
 150  0043 85            	popw	x
 151                     ; 35 		delay_ms(90);
 153  0044 ae005a        	ldw	x,#90
 154  0047 cd0000        	call	_delay_ms
 157  004a 20d9          	jra	L33
 190                     ; 40 void clock_setup(void)
 190                     ; 41 {
 191                     	switch	.text
 192  004c               _clock_setup:
 196                     ; 42 	CLK_DeInit();
 198  004c cd0000        	call	_CLK_DeInit
 200                     ; 44 	CLK_HSECmd(DISABLE);
 202  004f 4f            	clr	a
 203  0050 cd0000        	call	_CLK_HSECmd
 205                     ; 45 	CLK_LSICmd(DISABLE);
 207  0053 4f            	clr	a
 208  0054 cd0000        	call	_CLK_LSICmd
 210                     ; 46 	CLK_HSICmd(ENABLE);
 212  0057 a601          	ld	a,#1
 213  0059 cd0000        	call	_CLK_HSICmd
 216  005c               L75:
 217                     ; 47 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 219  005c ae0102        	ldw	x,#258
 220  005f cd0000        	call	_CLK_GetFlagStatus
 222  0062 4d            	tnz	a
 223  0063 27f7          	jreq	L75
 224                     ; 49 	CLK_ClockSwitchCmd(ENABLE);
 226  0065 a601          	ld	a,#1
 227  0067 cd0000        	call	_CLK_ClockSwitchCmd
 229                     ; 50 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
 231  006a a608          	ld	a,#8
 232  006c cd0000        	call	_CLK_HSIPrescalerConfig
 234                     ; 51 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV4);
 236  006f a682          	ld	a,#130
 237  0071 cd0000        	call	_CLK_SYSCLKConfig
 239                     ; 53 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 239                     ; 54 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 241  0074 4b01          	push	#1
 242  0076 4b00          	push	#0
 243  0078 ae01e1        	ldw	x,#481
 244  007b cd0000        	call	_CLK_ClockSwitchConfig
 246  007e 85            	popw	x
 247                     ; 56 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 249  007f ae0100        	ldw	x,#256
 250  0082 cd0000        	call	_CLK_PeripheralClockConfig
 252                     ; 57 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 254  0085 5f            	clrw	x
 255  0086 cd0000        	call	_CLK_PeripheralClockConfig
 257                     ; 58 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
 259  0089 ae1301        	ldw	x,#4865
 260  008c cd0000        	call	_CLK_PeripheralClockConfig
 262                     ; 59 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 264  008f ae1200        	ldw	x,#4608
 265  0092 cd0000        	call	_CLK_PeripheralClockConfig
 267                     ; 60 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 269  0095 ae0300        	ldw	x,#768
 270  0098 cd0000        	call	_CLK_PeripheralClockConfig
 272                     ; 61 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 274  009b ae0700        	ldw	x,#1792
 275  009e cd0000        	call	_CLK_PeripheralClockConfig
 277                     ; 62 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 279  00a1 ae0500        	ldw	x,#1280
 280  00a4 cd0000        	call	_CLK_PeripheralClockConfig
 282                     ; 63 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 284  00a7 ae0400        	ldw	x,#1024
 285  00aa cd0000        	call	_CLK_PeripheralClockConfig
 287                     ; 64 }
 290  00ad 81            	ret
 315                     ; 67 void GPIO_setup(void)
 315                     ; 68 {
 316                     	switch	.text
 317  00ae               _GPIO_setup:
 321                     ; 69 	GPIO_DeInit(GPIOB);
 323  00ae ae5005        	ldw	x,#20485
 324  00b1 cd0000        	call	_GPIO_DeInit
 326                     ; 70 	GPIO_Init(GPIOB, GPIO_PIN_0, GPIO_MODE_IN_FL_NO_IT);
 328  00b4 4b00          	push	#0
 329  00b6 4b01          	push	#1
 330  00b8 ae5005        	ldw	x,#20485
 331  00bb cd0000        	call	_GPIO_Init
 333  00be 85            	popw	x
 334                     ; 72 	GPIO_DeInit(GPIOC);
 336  00bf ae500a        	ldw	x,#20490
 337  00c2 cd0000        	call	_GPIO_DeInit
 339                     ; 74 	GPIO_DeInit(GPIOD);
 341  00c5 ae500f        	ldw	x,#20495
 342  00c8 cd0000        	call	_GPIO_DeInit
 344                     ; 75 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_NO_IT);
 346  00cb 4b40          	push	#64
 347  00cd 4b08          	push	#8
 348  00cf ae500f        	ldw	x,#20495
 349  00d2 cd0000        	call	_GPIO_Init
 351  00d5 85            	popw	x
 352                     ; 76 }
 355  00d6 81            	ret
 381                     ; 79 void ADC1_setup(void)
 381                     ; 80 {
 382                     	switch	.text
 383  00d7               _ADC1_setup:
 387                     ; 81 	ADC1_DeInit();	
 389  00d7 cd0000        	call	_ADC1_DeInit
 391                     ; 83 	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, 
 391                     ; 84 					  ADC1_CHANNEL_0,
 391                     ; 85 					  ADC1_PRESSEL_FCPU_D18, 
 391                     ; 86 					  ADC1_EXTTRIG_GPIO, 
 391                     ; 87 					  DISABLE, 
 391                     ; 88 					  ADC1_ALIGN_RIGHT, 
 391                     ; 89 					  ADC1_SCHMITTTRIG_CHANNEL0, 
 391                     ; 90 					  DISABLE);
 393  00da 4b00          	push	#0
 394  00dc 4b00          	push	#0
 395  00de 4b08          	push	#8
 396  00e0 4b00          	push	#0
 397  00e2 4b10          	push	#16
 398  00e4 4b70          	push	#112
 399  00e6 ae0100        	ldw	x,#256
 400  00e9 cd0000        	call	_ADC1_Init
 402  00ec 5b06          	addw	sp,#6
 403                     ; 92 	ADC1_Cmd(ENABLE);
 405  00ee a601          	ld	a,#1
 406  00f0 cd0000        	call	_ADC1_Cmd
 408                     ; 93 }
 411  00f3 81            	ret
 474                     ; 96 void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
 474                     ; 97 {
 475                     	switch	.text
 476  00f4               _lcd_print:
 478  00f4 89            	pushw	x
 479  00f5 88            	push	a
 480       00000001      OFST:	set	1
 483                     ; 98 	char chr = 0x00;
 485                     ; 100 	chr = ((value / 1000) + 0x30);	
 487  00f6 1e06          	ldw	x,(OFST+5,sp)
 488  00f8 90ae03e8      	ldw	y,#1000
 489  00fc 65            	divw	x,y
 490  00fd 1c0030        	addw	x,#48
 491  0100 01            	rrwa	x,a
 492  0101 6b01          	ld	(OFST+0,sp),a
 493  0103 02            	rlwa	x,a
 495                     ; 101 	LCD_goto(x_pos, y_pos);
 497  0104 7b03          	ld	a,(OFST+2,sp)
 498  0106 97            	ld	xl,a
 499  0107 7b02          	ld	a,(OFST+1,sp)
 500  0109 95            	ld	xh,a
 501  010a cd0000        	call	_LCD_goto
 503                     ; 102 	LCD_putchar(chr); 
 505  010d 7b01          	ld	a,(OFST+0,sp)
 506  010f cd0000        	call	_LCD_putchar
 508                     ; 104 	chr = (((value / 100) % 10) + 0x30);
 510  0112 1e06          	ldw	x,(OFST+5,sp)
 511  0114 a664          	ld	a,#100
 512  0116 62            	div	x,a
 513  0117 a60a          	ld	a,#10
 514  0119 62            	div	x,a
 515  011a 5f            	clrw	x
 516  011b 97            	ld	xl,a
 517  011c 1c0030        	addw	x,#48
 518  011f 01            	rrwa	x,a
 519  0120 6b01          	ld	(OFST+0,sp),a
 520  0122 02            	rlwa	x,a
 522                     ; 105 	LCD_goto((x_pos + 1), y_pos);
 524  0123 7b03          	ld	a,(OFST+2,sp)
 525  0125 97            	ld	xl,a
 526  0126 7b02          	ld	a,(OFST+1,sp)
 527  0128 4c            	inc	a
 528  0129 95            	ld	xh,a
 529  012a cd0000        	call	_LCD_goto
 531                     ; 106 	LCD_putchar(chr); 
 533  012d 7b01          	ld	a,(OFST+0,sp)
 534  012f cd0000        	call	_LCD_putchar
 536                     ; 108 	chr = (((value / 10) % 10) + 0x30);
 538  0132 1e06          	ldw	x,(OFST+5,sp)
 539  0134 a60a          	ld	a,#10
 540  0136 62            	div	x,a
 541  0137 a60a          	ld	a,#10
 542  0139 62            	div	x,a
 543  013a 5f            	clrw	x
 544  013b 97            	ld	xl,a
 545  013c 1c0030        	addw	x,#48
 546  013f 01            	rrwa	x,a
 547  0140 6b01          	ld	(OFST+0,sp),a
 548  0142 02            	rlwa	x,a
 550                     ; 109 	LCD_goto((x_pos + 2), y_pos);
 552  0143 7b03          	ld	a,(OFST+2,sp)
 553  0145 97            	ld	xl,a
 554  0146 7b02          	ld	a,(OFST+1,sp)
 555  0148 ab02          	add	a,#2
 556  014a 95            	ld	xh,a
 557  014b cd0000        	call	_LCD_goto
 559                     ; 110 	LCD_putchar(chr); 
 561  014e 7b01          	ld	a,(OFST+0,sp)
 562  0150 cd0000        	call	_LCD_putchar
 564                     ; 112 	chr = ((value % 10) + 0x30);
 566  0153 1e06          	ldw	x,(OFST+5,sp)
 567  0155 a60a          	ld	a,#10
 568  0157 62            	div	x,a
 569  0158 5f            	clrw	x
 570  0159 97            	ld	xl,a
 571  015a 1c0030        	addw	x,#48
 572  015d 01            	rrwa	x,a
 573  015e 6b01          	ld	(OFST+0,sp),a
 574  0160 02            	rlwa	x,a
 576                     ; 113 	LCD_goto((x_pos + 3), y_pos);
 578  0161 7b03          	ld	a,(OFST+2,sp)
 579  0163 97            	ld	xl,a
 580  0164 7b02          	ld	a,(OFST+1,sp)
 581  0166 ab03          	add	a,#3
 582  0168 95            	ld	xh,a
 583  0169 cd0000        	call	_LCD_goto
 585                     ; 114 	LCD_putchar(chr); 
 587  016c 7b01          	ld	a,(OFST+0,sp)
 588  016e cd0000        	call	_LCD_putchar
 590                     ; 115 }
 593  0171 5b03          	addw	sp,#3
 594  0173 81            	ret
 607                     	xdef	_main
 608                     	xdef	_lcd_print
 609                     	xdef	_ADC1_setup
 610                     	xdef	_GPIO_setup
 611                     	xdef	_clock_setup
 612                     	xref	_LCD_goto
 613                     	xref	_LCD_clear_home
 614                     	xref	_LCD_putchar
 615                     	xref	_LCD_putstr
 616                     	xref	_LCD_init
 617                     	xref	_GPIO_Init
 618                     	xref	_GPIO_DeInit
 619                     	xref	_CLK_GetFlagStatus
 620                     	xref	_CLK_SYSCLKConfig
 621                     	xref	_CLK_HSIPrescalerConfig
 622                     	xref	_CLK_ClockSwitchConfig
 623                     	xref	_CLK_PeripheralClockConfig
 624                     	xref	_CLK_ClockSwitchCmd
 625                     	xref	_CLK_LSICmd
 626                     	xref	_CLK_HSICmd
 627                     	xref	_CLK_HSECmd
 628                     	xref	_CLK_DeInit
 629                     	xref	_ADC1_ClearFlag
 630                     	xref	_ADC1_GetFlagStatus
 631                     	xref	_ADC1_GetConversionValue
 632                     	xref	_ADC1_StartConversion
 633                     	xref	_ADC1_Cmd
 634                     	xref	_ADC1_Init
 635                     	xref	_ADC1_DeInit
 636                     	xref	_delay_ms
 637                     .const:	section	.text
 638  0000               L13:
 639  0000 413000        	dc.b	"A0",0
 640  0003               L72:
 641  0003 53544d382041  	dc.b	"STM8 ADC",0
 661                     	end
