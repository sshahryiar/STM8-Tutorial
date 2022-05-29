   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  65                     ; 18 void main()
  65                     ; 19 {
  67                     	switch	.text
  68  0000               _main:
  70  0000 5204          	subw	sp,#4
  71       00000004      OFST:	set	4
  74                     ; 20 	float mv = 0x00000000;
  76                     ; 22 	clock_setup();
  78  0002 ad73          	call	_clock_setup
  80                     ; 23 	GPIO_setup();
  82  0004 cd00db        	call	_GPIO_setup
  84                     ; 24 	ADC1_setup();
  86  0007 cd00fe        	call	_ADC1_setup
  88                     ; 26 	LCD_init();  
  90  000a cd0000        	call	_LCD_init
  92                     ; 27 	LCD_clear_home(); 
  94  000d cd0000        	call	_LCD_clear_home
  96                     ; 29 	LCD_goto(2, 0);
  98  0010 ae0200        	ldw	x,#512
  99  0013 cd0000        	call	_LCD_goto
 101                     ; 30 	LCD_putstr("STM8 ADC ISR");
 103  0016 ae000e        	ldw	x,#L72
 104  0019 cd0000        	call	_LCD_putstr
 106                     ; 31 	LCD_goto(0, 1);
 108  001c ae0001        	ldw	x,#1
 109  001f cd0000        	call	_LCD_goto
 111                     ; 32 	LCD_putstr("A0/mV");
 113  0022 ae0008        	ldw	x,#L13
 114  0025 cd0000        	call	_LCD_putstr
 116  0028               L33:
 117                     ; 36 		ADC1_StartConversion();
 119  0028 cd0000        	call	_ADC1_StartConversion
 121                     ; 38 		mv = (adc_value * 5000.0);
 123  002b be00          	ldw	x,_adc_value
 124  002d cd0000        	call	c_uitof
 126  0030 ae0004        	ldw	x,#L34
 127  0033 cd0000        	call	c_fmul
 129  0036 96            	ldw	x,sp
 130  0037 1c0001        	addw	x,#OFST-3
 131  003a cd0000        	call	c_rtol
 134                     ; 39 		mv /= 1023.0; 
 136  003d ae0000        	ldw	x,#L35
 137  0040 cd0000        	call	c_ltor
 139  0043 96            	ldw	x,sp
 140  0044 1c0001        	addw	x,#OFST-3
 141  0047 cd0000        	call	c_fgdiv
 144                     ; 41 		lcd_print(7, 1, mv);		
 146  004a 96            	ldw	x,sp
 147  004b 1c0001        	addw	x,#OFST-3
 148  004e cd0000        	call	c_ltor
 150  0051 cd0000        	call	c_ftoi
 152  0054 89            	pushw	x
 153  0055 ae0701        	ldw	x,#1793
 154  0058 cd0125        	call	_lcd_print
 156  005b 85            	popw	x
 157                     ; 42 		lcd_print(12, 1, adc_value);
 159  005c be00          	ldw	x,_adc_value
 160  005e 89            	pushw	x
 161  005f ae0c01        	ldw	x,#3073
 162  0062 cd0125        	call	_lcd_print
 164  0065 85            	popw	x
 165                     ; 43 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 167  0066 4b01          	push	#1
 168  0068 ae500f        	ldw	x,#20495
 169  006b cd0000        	call	_GPIO_WriteReverse
 171  006e 84            	pop	a
 172                     ; 44 		delay_ms(160);
 174  006f ae00a0        	ldw	x,#160
 175  0072 cd0000        	call	_delay_ms
 178  0075 20b1          	jra	L33
 211                     ; 49 void clock_setup(void)
 211                     ; 50 {
 212                     	switch	.text
 213  0077               _clock_setup:
 217                     ; 51 	CLK_DeInit();
 219  0077 cd0000        	call	_CLK_DeInit
 221                     ; 53 	CLK_HSECmd(DISABLE);
 223  007a 4f            	clr	a
 224  007b cd0000        	call	_CLK_HSECmd
 226                     ; 54 	CLK_LSICmd(DISABLE);
 228  007e 4f            	clr	a
 229  007f cd0000        	call	_CLK_LSICmd
 231                     ; 55 	CLK_HSICmd(ENABLE);
 233  0082 a601          	ld	a,#1
 234  0084 cd0000        	call	_CLK_HSICmd
 237  0087               L17:
 238                     ; 56 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 240  0087 ae0102        	ldw	x,#258
 241  008a cd0000        	call	_CLK_GetFlagStatus
 243  008d 4d            	tnz	a
 244  008e 27f7          	jreq	L17
 245                     ; 58 	CLK_ClockSwitchCmd(ENABLE);
 247  0090 a601          	ld	a,#1
 248  0092 cd0000        	call	_CLK_ClockSwitchCmd
 250                     ; 59 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV4);
 252  0095 a610          	ld	a,#16
 253  0097 cd0000        	call	_CLK_HSIPrescalerConfig
 255                     ; 60 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 257  009a a680          	ld	a,#128
 258  009c cd0000        	call	_CLK_SYSCLKConfig
 260                     ; 62 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 260                     ; 63 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 262  009f 4b01          	push	#1
 263  00a1 4b00          	push	#0
 264  00a3 ae01e1        	ldw	x,#481
 265  00a6 cd0000        	call	_CLK_ClockSwitchConfig
 267  00a9 85            	popw	x
 268                     ; 65 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 270  00aa ae0001        	ldw	x,#1
 271  00ad cd0000        	call	_CLK_PeripheralClockConfig
 273                     ; 66 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
 275  00b0 ae1301        	ldw	x,#4865
 276  00b3 cd0000        	call	_CLK_PeripheralClockConfig
 278                     ; 67 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 280  00b6 ae0100        	ldw	x,#256
 281  00b9 cd0000        	call	_CLK_PeripheralClockConfig
 283                     ; 68 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 285  00bc ae1200        	ldw	x,#4608
 286  00bf cd0000        	call	_CLK_PeripheralClockConfig
 288                     ; 69 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 290  00c2 ae0300        	ldw	x,#768
 291  00c5 cd0000        	call	_CLK_PeripheralClockConfig
 293                     ; 70 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 295  00c8 ae0700        	ldw	x,#1792
 296  00cb cd0000        	call	_CLK_PeripheralClockConfig
 298                     ; 71 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 300  00ce ae0500        	ldw	x,#1280
 301  00d1 cd0000        	call	_CLK_PeripheralClockConfig
 303                     ; 72 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 305  00d4 ae0400        	ldw	x,#1024
 306  00d7 cd0000        	call	_CLK_PeripheralClockConfig
 308                     ; 73 }
 311  00da 81            	ret
 336                     ; 76 void GPIO_setup(void)
 336                     ; 77 {
 337                     	switch	.text
 338  00db               _GPIO_setup:
 342                     ; 78 	GPIO_DeInit(GPIOB);
 344  00db ae5005        	ldw	x,#20485
 345  00de cd0000        	call	_GPIO_DeInit
 347                     ; 79 	GPIO_Init(GPIOB, ((GPIO_Pin_TypeDef)(GPIO_PIN_0 | GPIO_PIN_1)), GPIO_MODE_IN_FL_NO_IT);
 349  00e1 4b00          	push	#0
 350  00e3 4b03          	push	#3
 351  00e5 ae5005        	ldw	x,#20485
 352  00e8 cd0000        	call	_GPIO_Init
 354  00eb 85            	popw	x
 355                     ; 81 	GPIO_DeInit(GPIOD);
 357  00ec ae500f        	ldw	x,#20495
 358  00ef cd0000        	call	_GPIO_DeInit
 360                     ; 82 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_OD_HIZ_FAST);
 362  00f2 4bb0          	push	#176
 363  00f4 4b01          	push	#1
 364  00f6 ae500f        	ldw	x,#20495
 365  00f9 cd0000        	call	_GPIO_Init
 367  00fc 85            	popw	x
 368                     ; 83 }
 371  00fd 81            	ret
 399                     ; 86 void ADC1_setup(void)
 399                     ; 87 {
 400                     	switch	.text
 401  00fe               _ADC1_setup:
 405                     ; 88 	ADC1_DeInit();	
 407  00fe cd0000        	call	_ADC1_DeInit
 409                     ; 90 	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, 
 409                     ; 91 					  ADC1_CHANNEL_0,
 409                     ; 92 					  ADC1_PRESSEL_FCPU_D18, 
 409                     ; 93 					  ADC1_EXTTRIG_GPIO, 
 409                     ; 94 					  DISABLE, 
 409                     ; 95 					  ADC1_ALIGN_RIGHT, 
 409                     ; 96 					  ADC1_SCHMITTTRIG_CHANNEL0, 
 409                     ; 97 					  DISABLE);
 411  0101 4b00          	push	#0
 412  0103 4b00          	push	#0
 413  0105 4b08          	push	#8
 414  0107 4b00          	push	#0
 415  0109 4b10          	push	#16
 416  010b 4b70          	push	#112
 417  010d ae0100        	ldw	x,#256
 418  0110 cd0000        	call	_ADC1_Init
 420  0113 5b06          	addw	sp,#6
 421                     ; 99 	ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 423  0115 4b01          	push	#1
 424  0117 ae0020        	ldw	x,#32
 425  011a cd0000        	call	_ADC1_ITConfig
 427  011d 84            	pop	a
 428                     ; 100 	enableInterrupts();
 431  011e 9a            rim
 433                     ; 101 	ADC1_Cmd(ENABLE);
 436  011f a601          	ld	a,#1
 437  0121 cd0000        	call	_ADC1_Cmd
 439                     ; 102 }
 442  0124 81            	ret
 505                     ; 105 void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
 505                     ; 106 {
 506                     	switch	.text
 507  0125               _lcd_print:
 509  0125 89            	pushw	x
 510  0126 88            	push	a
 511       00000001      OFST:	set	1
 514                     ; 107 	char chr = 0x00;
 516                     ; 109 	chr = ((value / 1000) + 0x30);	
 518  0127 1e06          	ldw	x,(OFST+5,sp)
 519  0129 90ae03e8      	ldw	y,#1000
 520  012d 65            	divw	x,y
 521  012e 1c0030        	addw	x,#48
 522  0131 01            	rrwa	x,a
 523  0132 6b01          	ld	(OFST+0,sp),a
 524  0134 02            	rlwa	x,a
 526                     ; 110 	LCD_goto(x_pos, y_pos);
 528  0135 7b03          	ld	a,(OFST+2,sp)
 529  0137 97            	ld	xl,a
 530  0138 7b02          	ld	a,(OFST+1,sp)
 531  013a 95            	ld	xh,a
 532  013b cd0000        	call	_LCD_goto
 534                     ; 111 	LCD_putchar(chr); 
 536  013e 7b01          	ld	a,(OFST+0,sp)
 537  0140 cd0000        	call	_LCD_putchar
 539                     ; 113 	chr = (((value / 100) % 10) + 0x30);
 541  0143 1e06          	ldw	x,(OFST+5,sp)
 542  0145 a664          	ld	a,#100
 543  0147 62            	div	x,a
 544  0148 a60a          	ld	a,#10
 545  014a 62            	div	x,a
 546  014b 5f            	clrw	x
 547  014c 97            	ld	xl,a
 548  014d 1c0030        	addw	x,#48
 549  0150 01            	rrwa	x,a
 550  0151 6b01          	ld	(OFST+0,sp),a
 551  0153 02            	rlwa	x,a
 553                     ; 114 	LCD_goto((x_pos + 1), y_pos);
 555  0154 7b03          	ld	a,(OFST+2,sp)
 556  0156 97            	ld	xl,a
 557  0157 7b02          	ld	a,(OFST+1,sp)
 558  0159 4c            	inc	a
 559  015a 95            	ld	xh,a
 560  015b cd0000        	call	_LCD_goto
 562                     ; 115 	LCD_putchar(chr); 
 564  015e 7b01          	ld	a,(OFST+0,sp)
 565  0160 cd0000        	call	_LCD_putchar
 567                     ; 117 	chr = (((value / 10) % 10) + 0x30);
 569  0163 1e06          	ldw	x,(OFST+5,sp)
 570  0165 a60a          	ld	a,#10
 571  0167 62            	div	x,a
 572  0168 a60a          	ld	a,#10
 573  016a 62            	div	x,a
 574  016b 5f            	clrw	x
 575  016c 97            	ld	xl,a
 576  016d 1c0030        	addw	x,#48
 577  0170 01            	rrwa	x,a
 578  0171 6b01          	ld	(OFST+0,sp),a
 579  0173 02            	rlwa	x,a
 581                     ; 118 	LCD_goto((x_pos + 2), y_pos);
 583  0174 7b03          	ld	a,(OFST+2,sp)
 584  0176 97            	ld	xl,a
 585  0177 7b02          	ld	a,(OFST+1,sp)
 586  0179 ab02          	add	a,#2
 587  017b 95            	ld	xh,a
 588  017c cd0000        	call	_LCD_goto
 590                     ; 119 	LCD_putchar(chr); 
 592  017f 7b01          	ld	a,(OFST+0,sp)
 593  0181 cd0000        	call	_LCD_putchar
 595                     ; 121 	chr = ((value % 10) + 0x30);
 597  0184 1e06          	ldw	x,(OFST+5,sp)
 598  0186 a60a          	ld	a,#10
 599  0188 62            	div	x,a
 600  0189 5f            	clrw	x
 601  018a 97            	ld	xl,a
 602  018b 1c0030        	addw	x,#48
 603  018e 01            	rrwa	x,a
 604  018f 6b01          	ld	(OFST+0,sp),a
 605  0191 02            	rlwa	x,a
 607                     ; 122 	LCD_goto((x_pos + 3), y_pos);
 609  0192 7b03          	ld	a,(OFST+2,sp)
 610  0194 97            	ld	xl,a
 611  0195 7b02          	ld	a,(OFST+1,sp)
 612  0197 ab03          	add	a,#3
 613  0199 95            	ld	xh,a
 614  019a cd0000        	call	_LCD_goto
 616                     ; 123 	LCD_putchar(chr); 
 618  019d 7b01          	ld	a,(OFST+0,sp)
 619  019f cd0000        	call	_LCD_putchar
 621                     ; 124 }
 624  01a2 5b03          	addw	sp,#3
 625  01a4 81            	ret
 667                     	xdef	_main
 668                     	xdef	_lcd_print
 669                     	xdef	_ADC1_setup
 670                     	xdef	_GPIO_setup
 671                     	xdef	_clock_setup
 672                     	switch	.ubsct
 673  0000               _adc_value:
 674  0000 0000          	ds.b	2
 675                     	xdef	_adc_value
 676                     	xref	_LCD_goto
 677                     	xref	_LCD_clear_home
 678                     	xref	_LCD_putchar
 679                     	xref	_LCD_putstr
 680                     	xref	_LCD_init
 681  0002               _data_value:
 682  0002 00            	ds.b	1
 683                     	xdef	_data_value
 684  0003               _bl_state:
 685  0003 00            	ds.b	1
 686                     	xdef	_bl_state
 687                     	xref	_GPIO_WriteReverse
 688                     	xref	_GPIO_Init
 689                     	xref	_GPIO_DeInit
 690                     	xref	_CLK_GetFlagStatus
 691                     	xref	_CLK_SYSCLKConfig
 692                     	xref	_CLK_HSIPrescalerConfig
 693                     	xref	_CLK_ClockSwitchConfig
 694                     	xref	_CLK_PeripheralClockConfig
 695                     	xref	_CLK_ClockSwitchCmd
 696                     	xref	_CLK_LSICmd
 697                     	xref	_CLK_HSICmd
 698                     	xref	_CLK_HSECmd
 699                     	xref	_CLK_DeInit
 700                     	xref	_ADC1_StartConversion
 701                     	xref	_ADC1_ITConfig
 702                     	xref	_ADC1_Cmd
 703                     	xref	_ADC1_Init
 704                     	xref	_ADC1_DeInit
 705                     	xref	_delay_ms
 706                     .const:	section	.text
 707  0000               L35:
 708  0000 447fc000      	dc.w	17535,-16384
 709  0004               L34:
 710  0004 459c4000      	dc.w	17820,16384
 711  0008               L13:
 712  0008 41302f6d5600  	dc.b	"A0/mV",0
 713  000e               L72:
 714  000e 53544d382041  	dc.b	"STM8 ADC ISR",0
 715                     	xref.b	c_x
 735                     	xref	c_ftoi
 736                     	xref	c_fgdiv
 737                     	xref	c_ltor
 738                     	xref	c_rtol
 739                     	xref	c_fmul
 740                     	xref	c_uitof
 741                     	end
