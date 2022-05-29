   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  76                     ; 15 void main()
  76                     ; 16 {
  78                     	switch	.text
  79  0000               _main:
  81  0000 5204          	subw	sp,#4
  82       00000004      OFST:	set	4
  85                     ; 17 	unsigned int A0 = 0x0000;
  87                     ; 18 	unsigned int A1 = 0x0000;
  89                     ; 20 	clock_setup();
  91  0002 ad6e          	call	_clock_setup
  93                     ; 21 	GPIO_setup();
  95  0004 cd00d6        	call	_GPIO_setup
  97                     ; 22 	ADC1_setup();
  99  0007 cd00f9        	call	_ADC1_setup
 101                     ; 24 	LCD_init();  
 103  000a cd0000        	call	_LCD_init
 105                     ; 25 	LCD_clear_home(); 
 107  000d cd0000        	call	_LCD_clear_home
 109                     ; 27 	LCD_goto(1, 0);
 111  0010 ae0100        	ldw	x,#256
 112  0013 cd0000        	call	_LCD_goto
 114                     ; 28 	LCD_putstr("STM8 Multi-ADC");
 116  0016 ae0006        	ldw	x,#L33
 117  0019 cd0000        	call	_LCD_putstr
 119                     ; 29 	LCD_goto(0, 1);
 121  001c ae0001        	ldw	x,#1
 122  001f cd0000        	call	_LCD_goto
 124                     ; 30 	LCD_putstr("A0");
 126  0022 ae0003        	ldw	x,#L53
 127  0025 cd0000        	call	_LCD_putstr
 129                     ; 31 	LCD_goto(9, 1);
 131  0028 ae0901        	ldw	x,#2305
 132  002b cd0000        	call	_LCD_goto
 134                     ; 32 	LCD_putstr("A1");
 136  002e ae0000        	ldw	x,#L73
 137  0031 cd0000        	call	_LCD_putstr
 139  0034               L14:
 140                     ; 36 		ADC1_ScanModeCmd(ENABLE);
 142  0034 a601          	ld	a,#1
 143  0036 cd0000        	call	_ADC1_ScanModeCmd
 145                     ; 37 		ADC1_StartConversion();
 147  0039 cd0000        	call	_ADC1_StartConversion
 150  003c               L74:
 151                     ; 38 		while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == FALSE);
 153  003c a680          	ld	a,#128
 154  003e cd0000        	call	_ADC1_GetFlagStatus
 156  0041 4d            	tnz	a
 157  0042 27f8          	jreq	L74
 158                     ; 40 		ADC1_ClearFlag(ADC1_FLAG_EOC);
 160  0044 a680          	ld	a,#128
 161  0046 cd0000        	call	_ADC1_ClearFlag
 163                     ; 42 		A0 = ADC1_GetBufferValue(0);
 165  0049 4f            	clr	a
 166  004a cd0000        	call	_ADC1_GetBufferValue
 168  004d 1f01          	ldw	(OFST-3,sp),x
 170                     ; 43 		A1 = ADC1_GetBufferValue(1);
 172  004f a601          	ld	a,#1
 173  0051 cd0000        	call	_ADC1_GetBufferValue
 175  0054 1f03          	ldw	(OFST-1,sp),x
 177                     ; 45 		lcd_print(3, 1, A0);
 179  0056 1e01          	ldw	x,(OFST-3,sp)
 180  0058 89            	pushw	x
 181  0059 ae0301        	ldw	x,#769
 182  005c cd0138        	call	_lcd_print
 184  005f 85            	popw	x
 185                     ; 46 		lcd_print(12, 1, A1);
 187  0060 1e03          	ldw	x,(OFST-1,sp)
 188  0062 89            	pushw	x
 189  0063 ae0c01        	ldw	x,#3073
 190  0066 cd0138        	call	_lcd_print
 192  0069 85            	popw	x
 193                     ; 47 		delay_ms(90);
 195  006a ae005a        	ldw	x,#90
 196  006d cd0000        	call	_delay_ms
 199  0070 20c2          	jra	L14
 232                     ; 52 void clock_setup(void)
 232                     ; 53 {
 233                     	switch	.text
 234  0072               _clock_setup:
 238                     ; 54 	CLK_DeInit();
 240  0072 cd0000        	call	_CLK_DeInit
 242                     ; 56 	CLK_HSECmd(DISABLE);
 244  0075 4f            	clr	a
 245  0076 cd0000        	call	_CLK_HSECmd
 247                     ; 57 	CLK_LSICmd(DISABLE);
 249  0079 4f            	clr	a
 250  007a cd0000        	call	_CLK_LSICmd
 252                     ; 58 	CLK_HSICmd(ENABLE);
 254  007d a601          	ld	a,#1
 255  007f cd0000        	call	_CLK_HSICmd
 258  0082               L56:
 259                     ; 59 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 261  0082 ae0102        	ldw	x,#258
 262  0085 cd0000        	call	_CLK_GetFlagStatus
 264  0088 4d            	tnz	a
 265  0089 27f7          	jreq	L56
 266                     ; 61 	CLK_ClockSwitchCmd(ENABLE);
 268  008b a601          	ld	a,#1
 269  008d cd0000        	call	_CLK_ClockSwitchCmd
 271                     ; 62 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV4);
 273  0090 a610          	ld	a,#16
 274  0092 cd0000        	call	_CLK_HSIPrescalerConfig
 276                     ; 63 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 278  0095 a680          	ld	a,#128
 279  0097 cd0000        	call	_CLK_SYSCLKConfig
 281                     ; 65 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 281                     ; 66 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 283  009a 4b01          	push	#1
 284  009c 4b00          	push	#0
 285  009e ae01e1        	ldw	x,#481
 286  00a1 cd0000        	call	_CLK_ClockSwitchConfig
 288  00a4 85            	popw	x
 289                     ; 68 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 291  00a5 ae0001        	ldw	x,#1
 292  00a8 cd0000        	call	_CLK_PeripheralClockConfig
 294                     ; 69 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
 296  00ab ae1301        	ldw	x,#4865
 297  00ae cd0000        	call	_CLK_PeripheralClockConfig
 299                     ; 70 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 301  00b1 ae0100        	ldw	x,#256
 302  00b4 cd0000        	call	_CLK_PeripheralClockConfig
 304                     ; 71 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 306  00b7 ae1200        	ldw	x,#4608
 307  00ba cd0000        	call	_CLK_PeripheralClockConfig
 309                     ; 72 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 311  00bd ae0300        	ldw	x,#768
 312  00c0 cd0000        	call	_CLK_PeripheralClockConfig
 314                     ; 73 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 316  00c3 ae0700        	ldw	x,#1792
 317  00c6 cd0000        	call	_CLK_PeripheralClockConfig
 319                     ; 74 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 321  00c9 ae0500        	ldw	x,#1280
 322  00cc cd0000        	call	_CLK_PeripheralClockConfig
 324                     ; 75 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 326  00cf ae0400        	ldw	x,#1024
 327  00d2 cd0000        	call	_CLK_PeripheralClockConfig
 329                     ; 76 }
 332  00d5 81            	ret
 357                     ; 79 void GPIO_setup(void)
 357                     ; 80 {
 358                     	switch	.text
 359  00d6               _GPIO_setup:
 363                     ; 81 	GPIO_DeInit(GPIOB);
 365  00d6 ae5005        	ldw	x,#20485
 366  00d9 cd0000        	call	_GPIO_DeInit
 368                     ; 82 	GPIO_Init(GPIOB, ((GPIO_Pin_TypeDef)(GPIO_PIN_0 | GPIO_PIN_1)), GPIO_MODE_IN_FL_NO_IT);
 370  00dc 4b00          	push	#0
 371  00de 4b03          	push	#3
 372  00e0 ae5005        	ldw	x,#20485
 373  00e3 cd0000        	call	_GPIO_Init
 375  00e6 85            	popw	x
 376                     ; 84 	GPIO_DeInit(GPIOD);
 378  00e7 ae500f        	ldw	x,#20495
 379  00ea cd0000        	call	_GPIO_DeInit
 381                     ; 85 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_FAST);
 383  00ed 4bb0          	push	#176
 384  00ef 4b01          	push	#1
 385  00f1 ae500f        	ldw	x,#20495
 386  00f4 cd0000        	call	_GPIO_Init
 388  00f7 85            	popw	x
 389                     ; 86 }
 392  00f8 81            	ret
 420                     ; 89 void ADC1_setup(void)
 420                     ; 90 {
 421                     	switch	.text
 422  00f9               _ADC1_setup:
 426                     ; 91 	ADC1_DeInit();	
 428  00f9 cd0000        	call	_ADC1_DeInit
 430                     ; 93 	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, 
 430                     ; 94 					  ADC1_CHANNEL_0,
 430                     ; 95 					  ADC1_PRESSEL_FCPU_D18, 
 430                     ; 96 					  ADC1_EXTTRIG_GPIO, 
 430                     ; 97 					  DISABLE, 
 430                     ; 98 					  ADC1_ALIGN_RIGHT, 
 430                     ; 99 					  ADC1_SCHMITTTRIG_CHANNEL0, 
 430                     ; 100 					  DISABLE);
 432  00fc 4b00          	push	#0
 433  00fe 4b00          	push	#0
 434  0100 4b08          	push	#8
 435  0102 4b00          	push	#0
 436  0104 4b10          	push	#16
 437  0106 4b70          	push	#112
 438  0108 ae0100        	ldw	x,#256
 439  010b cd0000        	call	_ADC1_Init
 441  010e 5b06          	addw	sp,#6
 442                     ; 102 	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, 
 442                     ; 103 					  ADC1_CHANNEL_1,
 442                     ; 104 					  ADC1_PRESSEL_FCPU_D18, 
 442                     ; 105 					  ADC1_EXTTRIG_GPIO, 
 442                     ; 106 					  DISABLE, 
 442                     ; 107 					  ADC1_ALIGN_RIGHT, 
 442                     ; 108 					  ADC1_SCHMITTTRIG_CHANNEL1, 
 442                     ; 109 					  DISABLE);
 444  0110 4b00          	push	#0
 445  0112 4b01          	push	#1
 446  0114 4b08          	push	#8
 447  0116 4b00          	push	#0
 448  0118 4b10          	push	#16
 449  011a 4b70          	push	#112
 450  011c ae0101        	ldw	x,#257
 451  011f cd0000        	call	_ADC1_Init
 453  0122 5b06          	addw	sp,#6
 454                     ; 111 	ADC1_ConversionConfig(ADC1_CONVERSIONMODE_CONTINUOUS, 
 454                     ; 112 												((ADC1_Channel_TypeDef)(ADC1_CHANNEL_0 | ADC1_CHANNEL_1)), 
 454                     ; 113 												ADC1_ALIGN_RIGHT);
 456  0124 4b08          	push	#8
 457  0126 ae0101        	ldw	x,#257
 458  0129 cd0000        	call	_ADC1_ConversionConfig
 460  012c 84            	pop	a
 461                     ; 115 	ADC1_DataBufferCmd(ENABLE);
 463  012d a601          	ld	a,#1
 464  012f cd0000        	call	_ADC1_DataBufferCmd
 466                     ; 116 	ADC1_Cmd(ENABLE);
 468  0132 a601          	ld	a,#1
 469  0134 cd0000        	call	_ADC1_Cmd
 471                     ; 117 }
 474  0137 81            	ret
 537                     ; 120 void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
 537                     ; 121 {
 538                     	switch	.text
 539  0138               _lcd_print:
 541  0138 89            	pushw	x
 542  0139 88            	push	a
 543       00000001      OFST:	set	1
 546                     ; 122 	char chr = 0x00;
 548                     ; 124 	chr = ((value / 1000) + 0x30);	
 550  013a 1e06          	ldw	x,(OFST+5,sp)
 551  013c 90ae03e8      	ldw	y,#1000
 552  0140 65            	divw	x,y
 553  0141 1c0030        	addw	x,#48
 554  0144 01            	rrwa	x,a
 555  0145 6b01          	ld	(OFST+0,sp),a
 556  0147 02            	rlwa	x,a
 558                     ; 125 	LCD_goto(x_pos, y_pos);
 560  0148 7b03          	ld	a,(OFST+2,sp)
 561  014a 97            	ld	xl,a
 562  014b 7b02          	ld	a,(OFST+1,sp)
 563  014d 95            	ld	xh,a
 564  014e cd0000        	call	_LCD_goto
 566                     ; 126 	LCD_putchar(chr); 
 568  0151 7b01          	ld	a,(OFST+0,sp)
 569  0153 cd0000        	call	_LCD_putchar
 571                     ; 128 	chr = (((value / 100) % 10) + 0x30);
 573  0156 1e06          	ldw	x,(OFST+5,sp)
 574  0158 a664          	ld	a,#100
 575  015a 62            	div	x,a
 576  015b a60a          	ld	a,#10
 577  015d 62            	div	x,a
 578  015e 5f            	clrw	x
 579  015f 97            	ld	xl,a
 580  0160 1c0030        	addw	x,#48
 581  0163 01            	rrwa	x,a
 582  0164 6b01          	ld	(OFST+0,sp),a
 583  0166 02            	rlwa	x,a
 585                     ; 129 	LCD_goto((x_pos + 1), y_pos);
 587  0167 7b03          	ld	a,(OFST+2,sp)
 588  0169 97            	ld	xl,a
 589  016a 7b02          	ld	a,(OFST+1,sp)
 590  016c 4c            	inc	a
 591  016d 95            	ld	xh,a
 592  016e cd0000        	call	_LCD_goto
 594                     ; 130 	LCD_putchar(chr); 
 596  0171 7b01          	ld	a,(OFST+0,sp)
 597  0173 cd0000        	call	_LCD_putchar
 599                     ; 132 	chr = (((value / 10) % 10) + 0x30);
 601  0176 1e06          	ldw	x,(OFST+5,sp)
 602  0178 a60a          	ld	a,#10
 603  017a 62            	div	x,a
 604  017b a60a          	ld	a,#10
 605  017d 62            	div	x,a
 606  017e 5f            	clrw	x
 607  017f 97            	ld	xl,a
 608  0180 1c0030        	addw	x,#48
 609  0183 01            	rrwa	x,a
 610  0184 6b01          	ld	(OFST+0,sp),a
 611  0186 02            	rlwa	x,a
 613                     ; 133 	LCD_goto((x_pos + 2), y_pos);
 615  0187 7b03          	ld	a,(OFST+2,sp)
 616  0189 97            	ld	xl,a
 617  018a 7b02          	ld	a,(OFST+1,sp)
 618  018c ab02          	add	a,#2
 619  018e 95            	ld	xh,a
 620  018f cd0000        	call	_LCD_goto
 622                     ; 134 	LCD_putchar(chr); 
 624  0192 7b01          	ld	a,(OFST+0,sp)
 625  0194 cd0000        	call	_LCD_putchar
 627                     ; 136 	chr = ((value % 10) + 0x30);
 629  0197 1e06          	ldw	x,(OFST+5,sp)
 630  0199 a60a          	ld	a,#10
 631  019b 62            	div	x,a
 632  019c 5f            	clrw	x
 633  019d 97            	ld	xl,a
 634  019e 1c0030        	addw	x,#48
 635  01a1 01            	rrwa	x,a
 636  01a2 6b01          	ld	(OFST+0,sp),a
 637  01a4 02            	rlwa	x,a
 639                     ; 137 	LCD_goto((x_pos + 3), y_pos);
 641  01a5 7b03          	ld	a,(OFST+2,sp)
 642  01a7 97            	ld	xl,a
 643  01a8 7b02          	ld	a,(OFST+1,sp)
 644  01aa ab03          	add	a,#3
 645  01ac 95            	ld	xh,a
 646  01ad cd0000        	call	_LCD_goto
 648                     ; 138 	LCD_putchar(chr); 
 650  01b0 7b01          	ld	a,(OFST+0,sp)
 651  01b2 cd0000        	call	_LCD_putchar
 653                     ; 139 }
 656  01b5 5b03          	addw	sp,#3
 657  01b7 81            	ret
 690                     	xdef	_main
 691                     	xdef	_lcd_print
 692                     	xdef	_ADC1_setup
 693                     	xdef	_GPIO_setup
 694                     	xdef	_clock_setup
 695                     	xref	_LCD_goto
 696                     	xref	_LCD_clear_home
 697                     	xref	_LCD_putchar
 698                     	xref	_LCD_putstr
 699                     	xref	_LCD_init
 700                     	switch	.ubsct
 701  0000               _data_value:
 702  0000 00            	ds.b	1
 703                     	xdef	_data_value
 704  0001               _bl_state:
 705  0001 00            	ds.b	1
 706                     	xdef	_bl_state
 707                     	xref	_GPIO_Init
 708                     	xref	_GPIO_DeInit
 709                     	xref	_CLK_GetFlagStatus
 710                     	xref	_CLK_SYSCLKConfig
 711                     	xref	_CLK_HSIPrescalerConfig
 712                     	xref	_CLK_ClockSwitchConfig
 713                     	xref	_CLK_PeripheralClockConfig
 714                     	xref	_CLK_ClockSwitchCmd
 715                     	xref	_CLK_LSICmd
 716                     	xref	_CLK_HSICmd
 717                     	xref	_CLK_HSECmd
 718                     	xref	_CLK_DeInit
 719                     	xref	_ADC1_ClearFlag
 720                     	xref	_ADC1_GetFlagStatus
 721                     	xref	_ADC1_GetBufferValue
 722                     	xref	_ADC1_StartConversion
 723                     	xref	_ADC1_ConversionConfig
 724                     	xref	_ADC1_DataBufferCmd
 725                     	xref	_ADC1_ScanModeCmd
 726                     	xref	_ADC1_Cmd
 727                     	xref	_ADC1_Init
 728                     	xref	_ADC1_DeInit
 729                     	xref	_delay_ms
 730                     .const:	section	.text
 731  0000               L73:
 732  0000 413100        	dc.b	"A1",0
 733  0003               L53:
 734  0003 413000        	dc.b	"A0",0
 735  0006               L33:
 736  0006 53544d38204d  	dc.b	"STM8 Multi-ADC",0
 756                     	end
