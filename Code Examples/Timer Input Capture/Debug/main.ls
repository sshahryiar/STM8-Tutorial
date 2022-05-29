   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  15                     	bsct
  16  0000               _overflow_count:
  17  0000 0000          	dc.w	0
  18  0002               _pulse_ticks:
  19  0002 00000000      	dc.l	0
  20  0006               _start_time:
  21  0006 00000000      	dc.l	0
  22  000a               _end_time:
  23  000a 00000000      	dc.l	0
  74                     ; 18 void main()
  74                     ; 19 {	
  76                     	switch	.text
  77  0000               _main:
  79  0000 5204          	subw	sp,#4
  80       00000004      OFST:	set	4
  83                     ; 20     unsigned long time_period = 0;
  85                     ; 22 	clock_setup();
  87  0002 ad3d          	call	_clock_setup
  89                     ; 23 	GPIO_setup();
  91  0004 cd00a3        	call	_GPIO_setup
  93                     ; 24 	TIM1_setup();
  95  0007 cd00c6        	call	_TIM1_setup
  97                     ; 25 	TIM2_setup();
  99  000a cd00f8        	call	_TIM2_setup
 101                     ; 26 	LCD_init();  
 103  000d cd0000        	call	_LCD_init
 105                     ; 28 	LCD_clear_home(); 
 107  0010 cd0000        	call	_LCD_clear_home
 109                     ; 29 	LCD_goto(0, 0);
 111  0013 5f            	clrw	x
 112  0014 cd0000        	call	_LCD_goto
 114                     ; 30 	LCD_putstr("T/ms:");
 116  0017 ae001a        	ldw	x,#L72
 117  001a cd0000        	call	_LCD_putstr
 119                     ; 31 	delay_ms(10);
 121  001d ae000a        	ldw	x,#10
 122  0020 cd0000        	call	_delay_ms
 124  0023               L13:
 125                     ; 35 		time_period = pulse_ticks;
 127  0023 be04          	ldw	x,_pulse_ticks+2
 128  0025 1f03          	ldw	(OFST-1,sp),x
 129  0027 be02          	ldw	x,_pulse_ticks
 130  0029 1f01          	ldw	(OFST-3,sp),x
 132                     ; 36 		lcd_print(0, 1, time_period);
 134  002b 1e03          	ldw	x,(OFST-1,sp)
 135  002d 89            	pushw	x
 136  002e 1e03          	ldw	x,(OFST-1,sp)
 137  0030 89            	pushw	x
 138  0031 ae0001        	ldw	x,#1
 139  0034 cd011f        	call	_lcd_print
 141  0037 5b04          	addw	sp,#4
 142                     ; 37 		delay_ms(400);
 144  0039 ae0190        	ldw	x,#400
 145  003c cd0000        	call	_delay_ms
 148  003f 20e2          	jra	L13
 181                     ; 42 void clock_setup(void)
 181                     ; 43 {
 182                     	switch	.text
 183  0041               _clock_setup:
 187                     ; 44 	CLK_DeInit();
 189  0041 cd0000        	call	_CLK_DeInit
 191                     ; 46 	CLK_HSECmd(DISABLE);
 193  0044 4f            	clr	a
 194  0045 cd0000        	call	_CLK_HSECmd
 196                     ; 47 	CLK_LSICmd(DISABLE);
 198  0048 4f            	clr	a
 199  0049 cd0000        	call	_CLK_LSICmd
 201                     ; 48 	CLK_HSICmd(ENABLE);
 203  004c a601          	ld	a,#1
 204  004e cd0000        	call	_CLK_HSICmd
 207  0051               L74:
 208                     ; 49 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 210  0051 ae0102        	ldw	x,#258
 211  0054 cd0000        	call	_CLK_GetFlagStatus
 213  0057 4d            	tnz	a
 214  0058 27f7          	jreq	L74
 215                     ; 51 	CLK_ClockSwitchCmd(ENABLE);
 217  005a a601          	ld	a,#1
 218  005c cd0000        	call	_CLK_ClockSwitchCmd
 220                     ; 52 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 222  005f a618          	ld	a,#24
 223  0061 cd0000        	call	_CLK_HSIPrescalerConfig
 225                     ; 53 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
 227  0064 a681          	ld	a,#129
 228  0066 cd0000        	call	_CLK_SYSCLKConfig
 230                     ; 55 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 230                     ; 56 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 232  0069 4b01          	push	#1
 233  006b 4b00          	push	#0
 234  006d ae01e1        	ldw	x,#481
 235  0070 cd0000        	call	_CLK_ClockSwitchConfig
 237  0073 85            	popw	x
 238                     ; 58 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 240  0074 ae0100        	ldw	x,#256
 241  0077 cd0000        	call	_CLK_PeripheralClockConfig
 243                     ; 59 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 245  007a 5f            	clrw	x
 246  007b cd0000        	call	_CLK_PeripheralClockConfig
 248                     ; 60 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 250  007e ae1300        	ldw	x,#4864
 251  0081 cd0000        	call	_CLK_PeripheralClockConfig
 253                     ; 61 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 255  0084 ae1200        	ldw	x,#4608
 256  0087 cd0000        	call	_CLK_PeripheralClockConfig
 258                     ; 62 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 260  008a ae0300        	ldw	x,#768
 261  008d cd0000        	call	_CLK_PeripheralClockConfig
 263                     ; 63 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 265  0090 ae0701        	ldw	x,#1793
 266  0093 cd0000        	call	_CLK_PeripheralClockConfig
 268                     ; 64 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 270  0096 ae0501        	ldw	x,#1281
 271  0099 cd0000        	call	_CLK_PeripheralClockConfig
 273                     ; 65 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 275  009c ae0400        	ldw	x,#1024
 276  009f cd0000        	call	_CLK_PeripheralClockConfig
 278                     ; 66 }
 281  00a2 81            	ret
 306                     ; 69 void GPIO_setup(void)
 306                     ; 70 {	
 307                     	switch	.text
 308  00a3               _GPIO_setup:
 312                     ; 71 	GPIO_DeInit(GPIOC);
 314  00a3 ae500a        	ldw	x,#20490
 315  00a6 cd0000        	call	_GPIO_DeInit
 317                     ; 72 	GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT);
 319  00a9 4b00          	push	#0
 320  00ab 4b02          	push	#2
 321  00ad ae500a        	ldw	x,#20490
 322  00b0 cd0000        	call	_GPIO_Init
 324  00b3 85            	popw	x
 325                     ; 74 	GPIO_DeInit(GPIOD);
 327  00b4 ae500f        	ldw	x,#20495
 328  00b7 cd0000        	call	_GPIO_DeInit
 330                     ; 75 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);
 332  00ba 4bf0          	push	#240
 333  00bc 4b10          	push	#16
 334  00be ae500f        	ldw	x,#20495
 335  00c1 cd0000        	call	_GPIO_Init
 337  00c4 85            	popw	x
 338                     ; 76 }
 341  00c5 81            	ret
 370                     ; 79 void TIM1_setup(void)
 370                     ; 80 {
 371                     	switch	.text
 372  00c6               _TIM1_setup:
 376                     ; 81 	TIM1_DeInit();
 378  00c6 cd0000        	call	_TIM1_DeInit
 380                     ; 82 	TIM1_TimeBaseInit(2000, TIM1_COUNTERMODE_UP, 55535, 1);
 382  00c9 4b01          	push	#1
 383  00cb aed8ef        	ldw	x,#55535
 384  00ce 89            	pushw	x
 385  00cf 4b00          	push	#0
 386  00d1 ae07d0        	ldw	x,#2000
 387  00d4 cd0000        	call	_TIM1_TimeBaseInit
 389  00d7 5b04          	addw	sp,#4
 390                     ; 83 	TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, 1, 1);
 392  00d9 4b01          	push	#1
 393  00db 4b01          	push	#1
 394  00dd 4b01          	push	#1
 395  00df 5f            	clrw	x
 396  00e0 cd0000        	call	_TIM1_ICInit
 398  00e3 5b03          	addw	sp,#3
 399                     ; 84     TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
 401  00e5 ae0101        	ldw	x,#257
 402  00e8 cd0000        	call	_TIM1_ITConfig
 404                     ; 85 	TIM1_ITConfig(TIM1_IT_CC1, ENABLE);
 406  00eb ae0201        	ldw	x,#513
 407  00ee cd0000        	call	_TIM1_ITConfig
 409                     ; 86 	TIM1_Cmd(ENABLE);
 411  00f1 a601          	ld	a,#1
 412  00f3 cd0000        	call	_TIM1_Cmd
 414                     ; 87 	enableInterrupts();
 417  00f6 9a            rim
 419                     ; 88 }
 423  00f7 81            	ret
 451                     ; 91 void TIM2_setup(void)
 451                     ; 92 {
 452                     	switch	.text
 453  00f8               _TIM2_setup:
 457                     ; 93 	TIM2_DeInit();
 459  00f8 cd0000        	call	_TIM2_DeInit
 461                     ; 94 	TIM2_TimeBaseInit(TIM2_PRESCALER_32, 1250);
 463  00fb ae04e2        	ldw	x,#1250
 464  00fe 89            	pushw	x
 465  00ff a605          	ld	a,#5
 466  0101 cd0000        	call	_TIM2_TimeBaseInit
 468  0104 85            	popw	x
 469                     ; 95 	TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_LOW);
 471  0105 4b22          	push	#34
 472  0107 ae03e8        	ldw	x,#1000
 473  010a 89            	pushw	x
 474  010b ae6011        	ldw	x,#24593
 475  010e cd0000        	call	_TIM2_OC1Init
 477  0111 5b03          	addw	sp,#3
 478                     ; 96 	TIM2_SetCompare1(625);
 480  0113 ae0271        	ldw	x,#625
 481  0116 cd0000        	call	_TIM2_SetCompare1
 483                     ; 97 	TIM2_Cmd(ENABLE);
 485  0119 a601          	ld	a,#1
 486  011b cd0000        	call	_TIM2_Cmd
 488                     ; 98 }
 491  011e 81            	ret
 494                     .const:	section	.text
 495  0000               L301_tmp:
 496  0000 20            	dc.b	32
 497  0001 20            	dc.b	32
 498  0002 20            	dc.b	32
 499  0003 20            	dc.b	32
 500  0004 20            	dc.b	32
 501  0005 20            	dc.b	32
 563                     	switch	.const
 564  0006               L02:
 565  0006 000186a0      	dc.l	100000
 566  000a               L22:
 567  000a 0000000a      	dc.l	10
 568  000e               L42:
 569  000e 00002710      	dc.l	10000
 570  0012               L62:
 571  0012 000003e8      	dc.l	1000
 572  0016               L03:
 573  0016 00000064      	dc.l	100
 574                     ; 101 void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned long value)
 574                     ; 102 {
 575                     	switch	.text
 576  011f               _lcd_print:
 578  011f 89            	pushw	x
 579  0120 5206          	subw	sp,#6
 580       00000006      OFST:	set	6
 583                     ; 103 	char tmp[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20} ;
 585  0122 96            	ldw	x,sp
 586  0123 1c0001        	addw	x,#OFST-5
 587  0126 90ae0000      	ldw	y,#L301_tmp
 588  012a a606          	ld	a,#6
 589  012c cd0000        	call	c_xymvx
 591                     ; 105 	tmp[0] = (((value / 100000) % 10) + 0x30);
 593  012f 96            	ldw	x,sp
 594  0130 1c000b        	addw	x,#OFST+5
 595  0133 cd0000        	call	c_ltor
 597  0136 ae0006        	ldw	x,#L02
 598  0139 cd0000        	call	c_ludv
 600  013c ae000a        	ldw	x,#L22
 601  013f cd0000        	call	c_lumd
 603  0142 a630          	ld	a,#48
 604  0144 cd0000        	call	c_ladc
 606  0147 b603          	ld	a,c_lreg+3
 607  0149 6b01          	ld	(OFST-5,sp),a
 609                     ; 106 	tmp[1] = (((value / 10000) % 10) + 0x30);
 611  014b 96            	ldw	x,sp
 612  014c 1c000b        	addw	x,#OFST+5
 613  014f cd0000        	call	c_ltor
 615  0152 ae000e        	ldw	x,#L42
 616  0155 cd0000        	call	c_ludv
 618  0158 ae000a        	ldw	x,#L22
 619  015b cd0000        	call	c_lumd
 621  015e a630          	ld	a,#48
 622  0160 cd0000        	call	c_ladc
 624  0163 b603          	ld	a,c_lreg+3
 625  0165 6b02          	ld	(OFST-4,sp),a
 627                     ; 107     tmp[2] = (((value / 1000) % 10) + 0x30);
 629  0167 96            	ldw	x,sp
 630  0168 1c000b        	addw	x,#OFST+5
 631  016b cd0000        	call	c_ltor
 633  016e ae0012        	ldw	x,#L62
 634  0171 cd0000        	call	c_ludv
 636  0174 ae000a        	ldw	x,#L22
 637  0177 cd0000        	call	c_lumd
 639  017a a630          	ld	a,#48
 640  017c cd0000        	call	c_ladc
 642  017f b603          	ld	a,c_lreg+3
 643  0181 6b03          	ld	(OFST-3,sp),a
 645                     ; 108 	tmp[3] = (((value / 100) % 10) + 0x30);
 647  0183 96            	ldw	x,sp
 648  0184 1c000b        	addw	x,#OFST+5
 649  0187 cd0000        	call	c_ltor
 651  018a ae0016        	ldw	x,#L03
 652  018d cd0000        	call	c_ludv
 654  0190 ae000a        	ldw	x,#L22
 655  0193 cd0000        	call	c_lumd
 657  0196 a630          	ld	a,#48
 658  0198 cd0000        	call	c_ladc
 660  019b b603          	ld	a,c_lreg+3
 661  019d 6b04          	ld	(OFST-2,sp),a
 663                     ; 109     tmp[4] = (((value / 10) % 10) + 0x30);
 665  019f 96            	ldw	x,sp
 666  01a0 1c000b        	addw	x,#OFST+5
 667  01a3 cd0000        	call	c_ltor
 669  01a6 ae000a        	ldw	x,#L22
 670  01a9 cd0000        	call	c_ludv
 672  01ac ae000a        	ldw	x,#L22
 673  01af cd0000        	call	c_lumd
 675  01b2 a630          	ld	a,#48
 676  01b4 cd0000        	call	c_ladc
 678  01b7 b603          	ld	a,c_lreg+3
 679  01b9 6b05          	ld	(OFST-1,sp),a
 681                     ; 110     tmp[5] = ((value % 10) + 0x30);
 683  01bb 96            	ldw	x,sp
 684  01bc 1c000b        	addw	x,#OFST+5
 685  01bf cd0000        	call	c_ltor
 687  01c2 ae000a        	ldw	x,#L22
 688  01c5 cd0000        	call	c_lumd
 690  01c8 a630          	ld	a,#48
 691  01ca cd0000        	call	c_ladc
 693  01cd b603          	ld	a,c_lreg+3
 694  01cf 6b06          	ld	(OFST+0,sp),a
 696                     ; 112 	LCD_goto(x_pos, y_pos);
 698  01d1 7b08          	ld	a,(OFST+2,sp)
 699  01d3 97            	ld	xl,a
 700  01d4 7b07          	ld	a,(OFST+1,sp)
 701  01d6 95            	ld	xh,a
 702  01d7 cd0000        	call	_LCD_goto
 704                     ; 113 	LCD_putstr(tmp);   
 706  01da 96            	ldw	x,sp
 707  01db 1c0001        	addw	x,#OFST-5
 708  01de cd0000        	call	_LCD_putstr
 710                     ; 114 }
 713  01e1 5b08          	addw	sp,#8
 714  01e3 81            	ret
 765                     	xdef	_main
 766                     	xdef	_lcd_print
 767                     	xdef	_TIM2_setup
 768                     	xdef	_TIM1_setup
 769                     	xdef	_GPIO_setup
 770                     	xdef	_clock_setup
 771                     	xdef	_end_time
 772                     	xdef	_start_time
 773                     	xdef	_pulse_ticks
 774                     	xdef	_overflow_count
 775                     	xref	_LCD_goto
 776                     	xref	_LCD_clear_home
 777                     	xref	_LCD_putstr
 778                     	xref	_LCD_init
 779                     	xref	_TIM2_SetCompare1
 780                     	xref	_TIM2_Cmd
 781                     	xref	_TIM2_OC1Init
 782                     	xref	_TIM2_TimeBaseInit
 783                     	xref	_TIM2_DeInit
 784                     	xref	_TIM1_ITConfig
 785                     	xref	_TIM1_Cmd
 786                     	xref	_TIM1_ICInit
 787                     	xref	_TIM1_TimeBaseInit
 788                     	xref	_TIM1_DeInit
 789                     	xref	_GPIO_Init
 790                     	xref	_GPIO_DeInit
 791                     	xref	_CLK_GetFlagStatus
 792                     	xref	_CLK_SYSCLKConfig
 793                     	xref	_CLK_HSIPrescalerConfig
 794                     	xref	_CLK_ClockSwitchConfig
 795                     	xref	_CLK_PeripheralClockConfig
 796                     	xref	_CLK_ClockSwitchCmd
 797                     	xref	_CLK_LSICmd
 798                     	xref	_CLK_HSICmd
 799                     	xref	_CLK_HSECmd
 800                     	xref	_CLK_DeInit
 801                     	xref	_delay_ms
 802                     	switch	.const
 803  001a               L72:
 804  001a 542f6d733a00  	dc.b	"T/ms:",0
 805                     	xref.b	c_lreg
 806                     	xref.b	c_x
 826                     	xref	c_ladc
 827                     	xref	c_lumd
 828                     	xref	c_ludv
 829                     	xref	c_ltor
 830                     	xref	c_xymvx
 831                     	end
