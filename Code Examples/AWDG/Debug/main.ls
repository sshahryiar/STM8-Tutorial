   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  69                     ; 10 void main()
  69                     ; 11 {
  71                     	switch	.text
  72  0000               _main:
  74  0000 89            	pushw	x
  75       00000002      OFST:	set	2
  78                     ; 12 	unsigned int a1 = 0x0000;
  80                     ; 14 	clock_setup();
  82  0001 ad6a          	call	_clock_setup
  84                     ; 15 	GPIO_setup();
  86  0003 cd00cf        	call	_GPIO_setup
  88                     ; 16 	ADC1_setup();
  90  0006 cd00fd        	call	_ADC1_setup
  92                     ; 18 	LCD_init();  
  94  0009 cd0000        	call	_LCD_init
  96                     ; 19 	LCD_clear_home(); 
  98  000c cd0000        	call	_LCD_clear_home
 100                     ; 21 	LCD_goto(0, 0);
 102  000f 5f            	clrw	x
 103  0010 cd0000        	call	_LCD_goto
 105                     ; 22 	LCD_putstr("STM8 AWD");
 107  0013 ae0003        	ldw	x,#L72
 108  0016 cd0000        	call	_LCD_putstr
 110                     ; 23 	LCD_goto(0, 1);
 112  0019 ae0001        	ldw	x,#1
 113  001c cd0000        	call	_LCD_goto
 115                     ; 24 	LCD_putstr("A1");
 117  001f ae0000        	ldw	x,#L13
 118  0022 cd0000        	call	_LCD_putstr
 120  0025               L33:
 121                     ; 28 		ADC1_ClearFlag(ADC1_FLAG_EOC);		
 123  0025 a680          	ld	a,#128
 124  0027 cd0000        	call	_ADC1_ClearFlag
 126                     ; 30 		ADC1_StartConversion();
 128  002a cd0000        	call	_ADC1_StartConversion
 131  002d               L14:
 132                     ; 31 		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == 0);
 134  002d a680          	ld	a,#128
 135  002f cd0000        	call	_ADC1_GetFlagStatus
 137  0032 4d            	tnz	a
 138  0033 27f8          	jreq	L14
 139                     ; 33 		a1 = ADC1_GetConversionValue();
 141  0035 cd0000        	call	_ADC1_GetConversionValue
 143  0038 1f01          	ldw	(OFST-1,sp),x
 145                     ; 34 		lcd_print(4, 1, a1);
 147  003a 1e01          	ldw	x,(OFST-1,sp)
 148  003c 89            	pushw	x
 149  003d ae0401        	ldw	x,#1025
 150  0040 cd012c        	call	_lcd_print
 152  0043 85            	popw	x
 153                     ; 36 		if(ADC1_GetFlagStatus(ADC1_FLAG_AWD))
 155  0044 a640          	ld	a,#64
 156  0046 cd0000        	call	_ADC1_GetFlagStatus
 158  0049 4d            	tnz	a
 159  004a 2710          	jreq	L54
 160                     ; 38 			GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 162  004c 4b01          	push	#1
 163  004e ae500f        	ldw	x,#20495
 164  0051 cd0000        	call	_GPIO_WriteReverse
 166  0054 84            	pop	a
 167                     ; 39 			ADC1_ClearFlag(ADC1_FLAG_AWD);
 169  0055 a640          	ld	a,#64
 170  0057 cd0000        	call	_ADC1_ClearFlag
 173  005a 2009          	jra	L74
 174  005c               L54:
 175                     ; 43 			GPIO_WriteHigh(GPIOD, GPIO_PIN_0);
 177  005c 4b01          	push	#1
 178  005e ae500f        	ldw	x,#20495
 179  0061 cd0000        	call	_GPIO_WriteHigh
 181  0064 84            	pop	a
 182  0065               L74:
 183                     ; 46 		delay_ms(90);
 185  0065 ae005a        	ldw	x,#90
 186  0068 cd0000        	call	_delay_ms
 189  006b 20b8          	jra	L33
 222                     ; 51 void clock_setup(void)
 222                     ; 52 {
 223                     	switch	.text
 224  006d               _clock_setup:
 228                     ; 53 	CLK_DeInit();
 230  006d cd0000        	call	_CLK_DeInit
 232                     ; 55 	CLK_HSECmd(DISABLE);
 234  0070 4f            	clr	a
 235  0071 cd0000        	call	_CLK_HSECmd
 237                     ; 56 	CLK_LSICmd(DISABLE);
 239  0074 4f            	clr	a
 240  0075 cd0000        	call	_CLK_LSICmd
 242                     ; 57 	CLK_HSICmd(ENABLE);
 244  0078 a601          	ld	a,#1
 245  007a cd0000        	call	_CLK_HSICmd
 248  007d               L36:
 249                     ; 58 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 251  007d ae0102        	ldw	x,#258
 252  0080 cd0000        	call	_CLK_GetFlagStatus
 254  0083 4d            	tnz	a
 255  0084 27f7          	jreq	L36
 256                     ; 60 	CLK_ClockSwitchCmd(ENABLE);
 258  0086 a601          	ld	a,#1
 259  0088 cd0000        	call	_CLK_ClockSwitchCmd
 261                     ; 61 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
 263  008b a608          	ld	a,#8
 264  008d cd0000        	call	_CLK_HSIPrescalerConfig
 266                     ; 62 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV4);
 268  0090 a682          	ld	a,#130
 269  0092 cd0000        	call	_CLK_SYSCLKConfig
 271                     ; 64 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 271                     ; 65 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 273  0095 4b01          	push	#1
 274  0097 4b00          	push	#0
 275  0099 ae01e1        	ldw	x,#481
 276  009c cd0000        	call	_CLK_ClockSwitchConfig
 278  009f 85            	popw	x
 279                     ; 67 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 281  00a0 ae0100        	ldw	x,#256
 282  00a3 cd0000        	call	_CLK_PeripheralClockConfig
 284                     ; 68 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 286  00a6 5f            	clrw	x
 287  00a7 cd0000        	call	_CLK_PeripheralClockConfig
 289                     ; 69 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
 291  00aa ae1301        	ldw	x,#4865
 292  00ad cd0000        	call	_CLK_PeripheralClockConfig
 294                     ; 70 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 296  00b0 ae1200        	ldw	x,#4608
 297  00b3 cd0000        	call	_CLK_PeripheralClockConfig
 299                     ; 71 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 301  00b6 ae0300        	ldw	x,#768
 302  00b9 cd0000        	call	_CLK_PeripheralClockConfig
 304                     ; 72 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 306  00bc ae0700        	ldw	x,#1792
 307  00bf cd0000        	call	_CLK_PeripheralClockConfig
 309                     ; 73 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 311  00c2 ae0500        	ldw	x,#1280
 312  00c5 cd0000        	call	_CLK_PeripheralClockConfig
 314                     ; 74 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 316  00c8 ae0400        	ldw	x,#1024
 317  00cb cd0000        	call	_CLK_PeripheralClockConfig
 319                     ; 75 }
 322  00ce 81            	ret
 347                     ; 78 void GPIO_setup(void)
 347                     ; 79 {
 348                     	switch	.text
 349  00cf               _GPIO_setup:
 353                     ; 80 	GPIO_DeInit(GPIOB);
 355  00cf ae5005        	ldw	x,#20485
 356  00d2 cd0000        	call	_GPIO_DeInit
 358                     ; 81 	GPIO_Init(GPIOB, GPIO_PIN_0, GPIO_MODE_IN_FL_NO_IT);
 360  00d5 4b00          	push	#0
 361  00d7 4b01          	push	#1
 362  00d9 ae5005        	ldw	x,#20485
 363  00dc cd0000        	call	_GPIO_Init
 365  00df 85            	popw	x
 366                     ; 83 	GPIO_DeInit(GPIOD);
 368  00e0 ae500f        	ldw	x,#20495
 369  00e3 cd0000        	call	_GPIO_DeInit
 371                     ; 84 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_HIGH_FAST);
 373  00e6 4bf0          	push	#240
 374  00e8 4b01          	push	#1
 375  00ea ae500f        	ldw	x,#20495
 376  00ed cd0000        	call	_GPIO_Init
 378  00f0 85            	popw	x
 379                     ; 85 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_NO_IT);
 381  00f1 4b40          	push	#64
 382  00f3 4b08          	push	#8
 383  00f5 ae500f        	ldw	x,#20495
 384  00f8 cd0000        	call	_GPIO_Init
 386  00fb 85            	popw	x
 387                     ; 86 }
 390  00fc 81            	ret
 419                     ; 89 void ADC1_setup(void)
 419                     ; 90 {
 420                     	switch	.text
 421  00fd               _ADC1_setup:
 425                     ; 91 	ADC1_DeInit();	
 427  00fd cd0000        	call	_ADC1_DeInit
 429                     ; 92 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
 429                     ; 93 					  ADC1_CHANNEL_1, 
 429                     ; 94 					  ADC1_PRESSEL_FCPU_D10, 
 429                     ; 95 					  ADC1_EXTTRIG_GPIO, 
 429                     ; 96 					  DISABLE, 
 429                     ; 97 					  ADC1_ALIGN_RIGHT, 
 429                     ; 98 					  ADC1_SCHMITTTRIG_CHANNEL1, 
 429                     ; 99 					  ENABLE);
 431  0100 4b01          	push	#1
 432  0102 4b01          	push	#1
 433  0104 4b08          	push	#8
 434  0106 4b00          	push	#0
 435  0108 4b10          	push	#16
 436  010a 4b50          	push	#80
 437  010c ae0001        	ldw	x,#1
 438  010f cd0000        	call	_ADC1_Init
 440  0112 5b06          	addw	sp,#6
 441                     ; 101 	ADC1_AWDChannelConfig(ADC1_CHANNEL_1, ENABLE);
 443  0114 ae0101        	ldw	x,#257
 444  0117 cd0000        	call	_ADC1_AWDChannelConfig
 446                     ; 102 	ADC1_SetHighThreshold(600);
 448  011a ae0258        	ldw	x,#600
 449  011d cd0000        	call	_ADC1_SetHighThreshold
 451                     ; 103 	ADC1_SetLowThreshold(200);
 453  0120 ae00c8        	ldw	x,#200
 454  0123 cd0000        	call	_ADC1_SetLowThreshold
 456                     ; 105 	ADC1_Cmd(ENABLE);
 458  0126 a601          	ld	a,#1
 459  0128 cd0000        	call	_ADC1_Cmd
 461                     ; 106 }
 464  012b 81            	ret
 527                     ; 109 void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
 527                     ; 110 {
 528                     	switch	.text
 529  012c               _lcd_print:
 531  012c 89            	pushw	x
 532  012d 88            	push	a
 533       00000001      OFST:	set	1
 536                     ; 111 	char chr = 0x00;
 538                     ; 113 	chr = ((value / 1000) + 0x30);	
 540  012e 1e06          	ldw	x,(OFST+5,sp)
 541  0130 90ae03e8      	ldw	y,#1000
 542  0134 65            	divw	x,y
 543  0135 1c0030        	addw	x,#48
 544  0138 01            	rrwa	x,a
 545  0139 6b01          	ld	(OFST+0,sp),a
 546  013b 02            	rlwa	x,a
 548                     ; 114 	LCD_goto(x_pos, y_pos);
 550  013c 7b03          	ld	a,(OFST+2,sp)
 551  013e 97            	ld	xl,a
 552  013f 7b02          	ld	a,(OFST+1,sp)
 553  0141 95            	ld	xh,a
 554  0142 cd0000        	call	_LCD_goto
 556                     ; 115 	LCD_putchar(chr); 
 558  0145 7b01          	ld	a,(OFST+0,sp)
 559  0147 cd0000        	call	_LCD_putchar
 561                     ; 117 	chr = (((value / 100) % 10) + 0x30);
 563  014a 1e06          	ldw	x,(OFST+5,sp)
 564  014c a664          	ld	a,#100
 565  014e 62            	div	x,a
 566  014f a60a          	ld	a,#10
 567  0151 62            	div	x,a
 568  0152 5f            	clrw	x
 569  0153 97            	ld	xl,a
 570  0154 1c0030        	addw	x,#48
 571  0157 01            	rrwa	x,a
 572  0158 6b01          	ld	(OFST+0,sp),a
 573  015a 02            	rlwa	x,a
 575                     ; 118 	LCD_goto((x_pos + 1), y_pos);
 577  015b 7b03          	ld	a,(OFST+2,sp)
 578  015d 97            	ld	xl,a
 579  015e 7b02          	ld	a,(OFST+1,sp)
 580  0160 4c            	inc	a
 581  0161 95            	ld	xh,a
 582  0162 cd0000        	call	_LCD_goto
 584                     ; 119 	LCD_putchar(chr); 
 586  0165 7b01          	ld	a,(OFST+0,sp)
 587  0167 cd0000        	call	_LCD_putchar
 589                     ; 121 	chr = (((value / 10) % 10) + 0x30);
 591  016a 1e06          	ldw	x,(OFST+5,sp)
 592  016c a60a          	ld	a,#10
 593  016e 62            	div	x,a
 594  016f a60a          	ld	a,#10
 595  0171 62            	div	x,a
 596  0172 5f            	clrw	x
 597  0173 97            	ld	xl,a
 598  0174 1c0030        	addw	x,#48
 599  0177 01            	rrwa	x,a
 600  0178 6b01          	ld	(OFST+0,sp),a
 601  017a 02            	rlwa	x,a
 603                     ; 122 	LCD_goto((x_pos + 2), y_pos);
 605  017b 7b03          	ld	a,(OFST+2,sp)
 606  017d 97            	ld	xl,a
 607  017e 7b02          	ld	a,(OFST+1,sp)
 608  0180 ab02          	add	a,#2
 609  0182 95            	ld	xh,a
 610  0183 cd0000        	call	_LCD_goto
 612                     ; 123 	LCD_putchar(chr); 
 614  0186 7b01          	ld	a,(OFST+0,sp)
 615  0188 cd0000        	call	_LCD_putchar
 617                     ; 125 	chr = ((value % 10) + 0x30);
 619  018b 1e06          	ldw	x,(OFST+5,sp)
 620  018d a60a          	ld	a,#10
 621  018f 62            	div	x,a
 622  0190 5f            	clrw	x
 623  0191 97            	ld	xl,a
 624  0192 1c0030        	addw	x,#48
 625  0195 01            	rrwa	x,a
 626  0196 6b01          	ld	(OFST+0,sp),a
 627  0198 02            	rlwa	x,a
 629                     ; 126 	LCD_goto((x_pos + 3), y_pos);
 631  0199 7b03          	ld	a,(OFST+2,sp)
 632  019b 97            	ld	xl,a
 633  019c 7b02          	ld	a,(OFST+1,sp)
 634  019e ab03          	add	a,#3
 635  01a0 95            	ld	xh,a
 636  01a1 cd0000        	call	_LCD_goto
 638                     ; 127 	LCD_putchar(chr); 
 640  01a4 7b01          	ld	a,(OFST+0,sp)
 641  01a6 cd0000        	call	_LCD_putchar
 643                     ; 128 }
 646  01a9 5b03          	addw	sp,#3
 647  01ab 81            	ret
 660                     	xdef	_main
 661                     	xdef	_lcd_print
 662                     	xdef	_ADC1_setup
 663                     	xdef	_GPIO_setup
 664                     	xdef	_clock_setup
 665                     	xref	_LCD_goto
 666                     	xref	_LCD_clear_home
 667                     	xref	_LCD_putchar
 668                     	xref	_LCD_putstr
 669                     	xref	_LCD_init
 670                     	xref	_GPIO_WriteReverse
 671                     	xref	_GPIO_WriteHigh
 672                     	xref	_GPIO_Init
 673                     	xref	_GPIO_DeInit
 674                     	xref	_CLK_GetFlagStatus
 675                     	xref	_CLK_SYSCLKConfig
 676                     	xref	_CLK_HSIPrescalerConfig
 677                     	xref	_CLK_ClockSwitchConfig
 678                     	xref	_CLK_PeripheralClockConfig
 679                     	xref	_CLK_ClockSwitchCmd
 680                     	xref	_CLK_LSICmd
 681                     	xref	_CLK_HSICmd
 682                     	xref	_CLK_HSECmd
 683                     	xref	_CLK_DeInit
 684                     	xref	_ADC1_ClearFlag
 685                     	xref	_ADC1_GetFlagStatus
 686                     	xref	_ADC1_SetLowThreshold
 687                     	xref	_ADC1_SetHighThreshold
 688                     	xref	_ADC1_GetConversionValue
 689                     	xref	_ADC1_StartConversion
 690                     	xref	_ADC1_AWDChannelConfig
 691                     	xref	_ADC1_Cmd
 692                     	xref	_ADC1_Init
 693                     	xref	_ADC1_DeInit
 694                     	xref	_delay_ms
 695                     .const:	section	.text
 696  0000               L13:
 697  0000 413100        	dc.b	"A1",0
 698  0003               L72:
 699  0003 53544d382041  	dc.b	"STM8 AWD",0
 719                     	end
