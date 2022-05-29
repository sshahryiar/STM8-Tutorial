   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     	bsct
  15  0000               _overflow_count:
  16  0000 0000          	dc.w	0
  17  0002               _pulse_ticks:
  18  0002 00000000      	dc.l	0
  19  0006               _duty_cycle:
  20  0006 00000000      	dc.l	0
  21  000a               _start_time:
  22  000a 00000000      	dc.l	0
  23  000e               _end_time:
  24  000e 00000000      	dc.l	0
  75                     ; 21 void main()
  75                     ; 22 {	
  77                     	switch	.text
  78  0000               _main:
  80  0000 5204          	subw	sp,#4
  81       00000004      OFST:	set	4
  84                     ; 23     unsigned long time_period = 0;
  86                     ; 25 	clock_setup();
  88  0002 ad41          	call	_clock_setup
  90                     ; 26 	GPIO_setup();
  92  0004 cd00a7        	call	_GPIO_setup
  94                     ; 27 	TIM1_setup();
  96  0007 cd00ca        	call	_TIM1_setup
  98                     ; 28 	TIM2_setup();
 100  000a cd00fc        	call	_TIM2_setup
 102                     ; 29 	LCD_init();  
 104  000d cd0000        	call	_LCD_init
 106                     ; 31 	LCD_clear_home(); 
 108  0010 cd0000        	call	_LCD_clear_home
 110                     ; 32 	LCD_goto(0, 0);
 112  0013 5f            	clrw	x
 113  0014 cd0000        	call	_LCD_goto
 115                     ; 33 	LCD_putstr("PWM Capture Test");
 117  0017 ae0016        	ldw	x,#L72
 118  001a cd0000        	call	_LCD_putstr
 120                     ; 34 	LCD_goto(0, 1);
 122  001d ae0001        	ldw	x,#1
 123  0020 cd0000        	call	_LCD_goto
 125                     ; 35 	LCD_putstr("T/ms:");
 127  0023 ae0010        	ldw	x,#L13
 128  0026 cd0000        	call	_LCD_putstr
 130                     ; 36 	delay_ms(10);
 132  0029 ae000a        	ldw	x,#10
 133  002c cd0000        	call	_delay_ms
 135  002f               L33:
 136                     ; 40 		print_I(13, 1, duty_cycle);
 138  002f be08          	ldw	x,_duty_cycle+2
 139  0031 89            	pushw	x
 140  0032 be06          	ldw	x,_duty_cycle
 141  0034 89            	pushw	x
 142  0035 ae0d01        	ldw	x,#3329
 143  0038 cd0123        	call	_print_I
 145  003b 5b04          	addw	sp,#4
 146                     ; 41 		delay_ms(900);
 148  003d ae0384        	ldw	x,#900
 149  0040 cd0000        	call	_delay_ms
 152  0043 20ea          	jra	L33
 185                     ; 46 void clock_setup(void)
 185                     ; 47 {
 186                     	switch	.text
 187  0045               _clock_setup:
 191                     ; 48 	CLK_DeInit();
 193  0045 cd0000        	call	_CLK_DeInit
 195                     ; 50 	CLK_HSECmd(DISABLE);
 197  0048 4f            	clr	a
 198  0049 cd0000        	call	_CLK_HSECmd
 200                     ; 51 	CLK_LSICmd(DISABLE);
 202  004c 4f            	clr	a
 203  004d cd0000        	call	_CLK_LSICmd
 205                     ; 52 	CLK_HSICmd(ENABLE);
 207  0050 a601          	ld	a,#1
 208  0052 cd0000        	call	_CLK_HSICmd
 211  0055               L15:
 212                     ; 53 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 214  0055 ae0102        	ldw	x,#258
 215  0058 cd0000        	call	_CLK_GetFlagStatus
 217  005b 4d            	tnz	a
 218  005c 27f7          	jreq	L15
 219                     ; 55 	CLK_ClockSwitchCmd(ENABLE);
 221  005e a601          	ld	a,#1
 222  0060 cd0000        	call	_CLK_ClockSwitchCmd
 224                     ; 56 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 226  0063 a618          	ld	a,#24
 227  0065 cd0000        	call	_CLK_HSIPrescalerConfig
 229                     ; 57 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 231  0068 a680          	ld	a,#128
 232  006a cd0000        	call	_CLK_SYSCLKConfig
 234                     ; 59 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 234                     ; 60 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 236  006d 4b01          	push	#1
 237  006f 4b00          	push	#0
 238  0071 ae01e1        	ldw	x,#481
 239  0074 cd0000        	call	_CLK_ClockSwitchConfig
 241  0077 85            	popw	x
 242                     ; 62 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
 244  0078 ae0101        	ldw	x,#257
 245  007b cd0000        	call	_CLK_PeripheralClockConfig
 247                     ; 63 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 249  007e ae0701        	ldw	x,#1793
 250  0081 cd0000        	call	_CLK_PeripheralClockConfig
 252                     ; 64 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 254  0084 ae0501        	ldw	x,#1281
 255  0087 cd0000        	call	_CLK_PeripheralClockConfig
 257                     ; 65 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 259  008a 5f            	clrw	x
 260  008b cd0000        	call	_CLK_PeripheralClockConfig
 262                     ; 66 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 264  008e ae1300        	ldw	x,#4864
 265  0091 cd0000        	call	_CLK_PeripheralClockConfig
 267                     ; 67 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 269  0094 ae1200        	ldw	x,#4608
 270  0097 cd0000        	call	_CLK_PeripheralClockConfig
 272                     ; 68 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 274  009a ae0300        	ldw	x,#768
 275  009d cd0000        	call	_CLK_PeripheralClockConfig
 277                     ; 69 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 279  00a0 ae0400        	ldw	x,#1024
 280  00a3 cd0000        	call	_CLK_PeripheralClockConfig
 282                     ; 70 }
 285  00a6 81            	ret
 310                     ; 73 void GPIO_setup(void)
 310                     ; 74 {	
 311                     	switch	.text
 312  00a7               _GPIO_setup:
 316                     ; 75 	GPIO_DeInit(GPIOC);
 318  00a7 ae500a        	ldw	x,#20490
 319  00aa cd0000        	call	_GPIO_DeInit
 321                     ; 76 	GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT);
 323  00ad 4b00          	push	#0
 324  00af 4b02          	push	#2
 325  00b1 ae500a        	ldw	x,#20490
 326  00b4 cd0000        	call	_GPIO_Init
 328  00b7 85            	popw	x
 329                     ; 78 	GPIO_DeInit(GPIOD);
 331  00b8 ae500f        	ldw	x,#20495
 332  00bb cd0000        	call	_GPIO_DeInit
 334                     ; 79 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);
 336  00be 4bf0          	push	#240
 337  00c0 4b10          	push	#16
 338  00c2 ae500f        	ldw	x,#20495
 339  00c5 cd0000        	call	_GPIO_Init
 341  00c8 85            	popw	x
 342                     ; 80 }
 345  00c9 81            	ret
 375                     ; 83 void TIM1_setup(void)
 375                     ; 84 {
 376                     	switch	.text
 377  00ca               _TIM1_setup:
 381                     ; 85 	TIM1_DeInit();
 383  00ca cd0000        	call	_TIM1_DeInit
 385                     ; 86 	TIM1_TimeBaseInit(2000, TIM1_COUNTERMODE_UP, 55535, 1);
 387  00cd 4b01          	push	#1
 388  00cf aed8ef        	ldw	x,#55535
 389  00d2 89            	pushw	x
 390  00d3 4b00          	push	#0
 391  00d5 ae07d0        	ldw	x,#2000
 392  00d8 cd0000        	call	_TIM1_TimeBaseInit
 394  00db 5b04          	addw	sp,#4
 395                     ; 87 	TIM1_CCxCmd(TIM1_CHANNEL_1, ENABLE);
 397  00dd ae0001        	ldw	x,#1
 398  00e0 cd0000        	call	_TIM1_CCxCmd
 400                     ; 88 	TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, 1, 1);
 402  00e3 4b01          	push	#1
 403  00e5 4b01          	push	#1
 404  00e7 4b01          	push	#1
 405  00e9 5f            	clrw	x
 406  00ea cd0000        	call	_TIM1_ICInit
 408  00ed 5b03          	addw	sp,#3
 409                     ; 89 	TIM1_ITConfig(TIM1_IT_CC1, ENABLE);	
 411  00ef ae0201        	ldw	x,#513
 412  00f2 cd0000        	call	_TIM1_ITConfig
 414                     ; 90 	TIM1_Cmd(ENABLE);
 416  00f5 a601          	ld	a,#1
 417  00f7 cd0000        	call	_TIM1_Cmd
 419                     ; 91 	enableInterrupts();
 422  00fa 9a            rim
 424                     ; 92 }
 428  00fb 81            	ret
 456                     ; 95 void TIM2_setup(void)
 456                     ; 96 {
 457                     	switch	.text
 458  00fc               _TIM2_setup:
 462                     ; 97 	TIM2_DeInit();
 464  00fc cd0000        	call	_TIM2_DeInit
 466                     ; 98 	TIM2_TimeBaseInit(TIM2_PRESCALER_32, 1250);
 468  00ff ae04e2        	ldw	x,#1250
 469  0102 89            	pushw	x
 470  0103 a605          	ld	a,#5
 471  0105 cd0000        	call	_TIM2_TimeBaseInit
 473  0108 85            	popw	x
 474                     ; 99 	TIM2_OC1Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_LOW);
 476  0109 4b22          	push	#34
 477  010b ae03e8        	ldw	x,#1000
 478  010e 89            	pushw	x
 479  010f ae7011        	ldw	x,#28689
 480  0112 cd0000        	call	_TIM2_OC1Init
 482  0115 5b03          	addw	sp,#3
 483                     ; 100 	TIM2_SetCompare1(1125);
 485  0117 ae0465        	ldw	x,#1125
 486  011a cd0000        	call	_TIM2_SetCompare1
 488                     ; 101 	TIM2_Cmd(ENABLE);
 490  011d a601          	ld	a,#1
 491  011f cd0000        	call	_TIM2_Cmd
 493                     ; 102 }
 496  0122 81            	ret
 559                     .const:	section	.text
 560  0000               L02:
 561  0000 00002710      	dc.l	10000
 562  0004               L22:
 563  0004 000003e8      	dc.l	1000
 564  0008               L42:
 565  0008 00000064      	dc.l	100
 566  000c               L62:
 567  000c 0000000a      	dc.l	10
 568                     ; 105 void print_I(unsigned char x_pos, unsigned char y_pos, signed long value)
 568                     ; 106 {
 569                     	switch	.text
 570  0123               _print_I:
 572  0123 89            	pushw	x
 573  0124 88            	push	a
 574       00000001      OFST:	set	1
 577                     ; 107     unsigned char ch = 0x00;
 579                     ; 109     if(value < 0)
 581  0125 9c            	rvf
 582  0126 9c            	rvf
 583  0127 0d06          	tnz	(OFST+5,sp)
 584  0129 2e16          	jrsge	L731
 585                     ; 111         LCD_goto(x_pos, y_pos);
 587  012b 9f            	ld	a,xl
 588  012c 97            	ld	xl,a
 589  012d 7b02          	ld	a,(OFST+1,sp)
 590  012f 95            	ld	xh,a
 591  0130 cd0000        	call	_LCD_goto
 593                     ; 112 		LCD_putchar(0x2D);
 595  0133 a62d          	ld	a,#45
 596  0135 cd0000        	call	_LCD_putchar
 598                     ; 113         value = -value;
 600  0138 96            	ldw	x,sp
 601  0139 1c0006        	addw	x,#OFST+5
 602  013c cd0000        	call	c_lgneg
 605  013f 200e          	jra	L141
 606  0141               L731:
 607                     ; 117         LCD_goto(x_pos, y_pos);
 609  0141 7b03          	ld	a,(OFST+2,sp)
 610  0143 97            	ld	xl,a
 611  0144 7b02          	ld	a,(OFST+1,sp)
 612  0146 95            	ld	xh,a
 613  0147 cd0000        	call	_LCD_goto
 615                     ; 118 		LCD_putchar(0x20);
 617  014a a620          	ld	a,#32
 618  014c cd0000        	call	_LCD_putchar
 620  014f               L141:
 621                     ; 121     if(value > 9999)
 623  014f 9c            	rvf
 624  0150 96            	ldw	x,sp
 625  0151 1c0006        	addw	x,#OFST+5
 626  0154 cd0000        	call	c_ltor
 628  0157 ae0000        	ldw	x,#L02
 629  015a cd0000        	call	c_lcmp
 631  015d 2e03          	jrsge	L03
 632  015f cc0235        	jp	L341
 633  0162               L03:
 634                     ; 123 		ch = ((value / 10000) + 0x30);
 636  0162 96            	ldw	x,sp
 637  0163 1c0006        	addw	x,#OFST+5
 638  0166 cd0000        	call	c_ltor
 640  0169 ae0000        	ldw	x,#L02
 641  016c cd0000        	call	c_ldiv
 643  016f a630          	ld	a,#48
 644  0171 cd0000        	call	c_ladc
 646  0174 b603          	ld	a,c_lreg+3
 647  0176 6b01          	ld	(OFST+0,sp),a
 649                     ; 124 		LCD_goto((x_pos + 1), y_pos);
 651  0178 7b03          	ld	a,(OFST+2,sp)
 652  017a 97            	ld	xl,a
 653  017b 7b02          	ld	a,(OFST+1,sp)
 654  017d 4c            	inc	a
 655  017e 95            	ld	xh,a
 656  017f cd0000        	call	_LCD_goto
 658                     ; 125 		LCD_putchar(ch);
 660  0182 7b01          	ld	a,(OFST+0,sp)
 661  0184 cd0000        	call	_LCD_putchar
 663                     ; 127         ch = (((value % 10000)/ 1000) + 0x30);
 665  0187 96            	ldw	x,sp
 666  0188 1c0006        	addw	x,#OFST+5
 667  018b cd0000        	call	c_ltor
 669  018e ae0000        	ldw	x,#L02
 670  0191 cd0000        	call	c_lmod
 672  0194 ae0004        	ldw	x,#L22
 673  0197 cd0000        	call	c_ldiv
 675  019a a630          	ld	a,#48
 676  019c cd0000        	call	c_ladc
 678  019f b603          	ld	a,c_lreg+3
 679  01a1 6b01          	ld	(OFST+0,sp),a
 681                     ; 128 		LCD_goto((x_pos + 2), y_pos);
 683  01a3 7b03          	ld	a,(OFST+2,sp)
 684  01a5 97            	ld	xl,a
 685  01a6 7b02          	ld	a,(OFST+1,sp)
 686  01a8 ab02          	add	a,#2
 687  01aa 95            	ld	xh,a
 688  01ab cd0000        	call	_LCD_goto
 690                     ; 129 		LCD_putchar(ch);
 692  01ae 7b01          	ld	a,(OFST+0,sp)
 693  01b0 cd0000        	call	_LCD_putchar
 695                     ; 131         ch = (((value % 1000) / 100) + 0x30);
 697  01b3 96            	ldw	x,sp
 698  01b4 1c0006        	addw	x,#OFST+5
 699  01b7 cd0000        	call	c_ltor
 701  01ba ae0004        	ldw	x,#L22
 702  01bd cd0000        	call	c_lmod
 704  01c0 ae0008        	ldw	x,#L42
 705  01c3 cd0000        	call	c_ldiv
 707  01c6 a630          	ld	a,#48
 708  01c8 cd0000        	call	c_ladc
 710  01cb b603          	ld	a,c_lreg+3
 711  01cd 6b01          	ld	(OFST+0,sp),a
 713                     ; 132 		LCD_goto((x_pos + 3), y_pos);
 715  01cf 7b03          	ld	a,(OFST+2,sp)
 716  01d1 97            	ld	xl,a
 717  01d2 7b02          	ld	a,(OFST+1,sp)
 718  01d4 ab03          	add	a,#3
 719  01d6 95            	ld	xh,a
 720  01d7 cd0000        	call	_LCD_goto
 722                     ; 133 		LCD_putchar(ch);
 724  01da 7b01          	ld	a,(OFST+0,sp)
 725  01dc cd0000        	call	_LCD_putchar
 727                     ; 135         ch = (((value % 100) / 10) + 0x30);
 729  01df 96            	ldw	x,sp
 730  01e0 1c0006        	addw	x,#OFST+5
 731  01e3 cd0000        	call	c_ltor
 733  01e6 ae0008        	ldw	x,#L42
 734  01e9 cd0000        	call	c_lmod
 736  01ec ae000c        	ldw	x,#L62
 737  01ef cd0000        	call	c_ldiv
 739  01f2 a630          	ld	a,#48
 740  01f4 cd0000        	call	c_ladc
 742  01f7 b603          	ld	a,c_lreg+3
 743  01f9 6b01          	ld	(OFST+0,sp),a
 745                     ; 136         LCD_goto((x_pos + 4), y_pos);
 747  01fb 7b03          	ld	a,(OFST+2,sp)
 748  01fd 97            	ld	xl,a
 749  01fe 7b02          	ld	a,(OFST+1,sp)
 750  0200 ab04          	add	a,#4
 751  0202 95            	ld	xh,a
 752  0203 cd0000        	call	_LCD_goto
 754                     ; 137 		LCD_putchar(ch);
 756  0206 7b01          	ld	a,(OFST+0,sp)
 757  0208 cd0000        	call	_LCD_putchar
 759                     ; 139 		ch = ((value % 10) + 0x30);
 761  020b 96            	ldw	x,sp
 762  020c 1c0006        	addw	x,#OFST+5
 763  020f cd0000        	call	c_ltor
 765  0212 ae000c        	ldw	x,#L62
 766  0215 cd0000        	call	c_lmod
 768  0218 a630          	ld	a,#48
 769  021a cd0000        	call	c_ladc
 771  021d b603          	ld	a,c_lreg+3
 772  021f 6b01          	ld	(OFST+0,sp),a
 774                     ; 140 		LCD_goto((x_pos + 5), y_pos);
 776  0221 7b03          	ld	a,(OFST+2,sp)
 777  0223 97            	ld	xl,a
 778  0224 7b02          	ld	a,(OFST+1,sp)
 779  0226 ab05          	add	a,#5
 780  0228 95            	ld	xh,a
 781  0229 cd0000        	call	_LCD_goto
 783                     ; 141 		LCD_putchar(ch);
 785  022c 7b01          	ld	a,(OFST+0,sp)
 786  022e cd0000        	call	_LCD_putchar
 789  0231 aced04ed      	jpf	L541
 790  0235               L341:
 791                     ; 144     else if((value > 999) && (value <= 9999))
 793  0235 9c            	rvf
 794  0236 96            	ldw	x,sp
 795  0237 1c0006        	addw	x,#OFST+5
 796  023a cd0000        	call	c_ltor
 798  023d ae0004        	ldw	x,#L22
 799  0240 cd0000        	call	c_lcmp
 801  0243 2e03          	jrsge	L23
 802  0245 cc0318        	jp	L741
 803  0248               L23:
 805  0248 9c            	rvf
 806  0249 96            	ldw	x,sp
 807  024a 1c0006        	addw	x,#OFST+5
 808  024d cd0000        	call	c_ltor
 810  0250 ae0000        	ldw	x,#L02
 811  0253 cd0000        	call	c_lcmp
 813  0256 2f03          	jrslt	L43
 814  0258 cc0318        	jp	L741
 815  025b               L43:
 816                     ; 146         ch = (((value % 10000)/ 1000) + 0x30);
 818  025b 96            	ldw	x,sp
 819  025c 1c0006        	addw	x,#OFST+5
 820  025f cd0000        	call	c_ltor
 822  0262 ae0000        	ldw	x,#L02
 823  0265 cd0000        	call	c_lmod
 825  0268 ae0004        	ldw	x,#L22
 826  026b cd0000        	call	c_ldiv
 828  026e a630          	ld	a,#48
 829  0270 cd0000        	call	c_ladc
 831  0273 b603          	ld	a,c_lreg+3
 832  0275 6b01          	ld	(OFST+0,sp),a
 834                     ; 147 		LCD_goto((x_pos + 1), y_pos);
 836  0277 7b03          	ld	a,(OFST+2,sp)
 837  0279 97            	ld	xl,a
 838  027a 7b02          	ld	a,(OFST+1,sp)
 839  027c 4c            	inc	a
 840  027d 95            	ld	xh,a
 841  027e cd0000        	call	_LCD_goto
 843                     ; 148 		LCD_putchar(ch);
 845  0281 7b01          	ld	a,(OFST+0,sp)
 846  0283 cd0000        	call	_LCD_putchar
 848                     ; 150         ch = (((value % 1000) / 100) + 0x30);
 850  0286 96            	ldw	x,sp
 851  0287 1c0006        	addw	x,#OFST+5
 852  028a cd0000        	call	c_ltor
 854  028d ae0004        	ldw	x,#L22
 855  0290 cd0000        	call	c_lmod
 857  0293 ae0008        	ldw	x,#L42
 858  0296 cd0000        	call	c_ldiv
 860  0299 a630          	ld	a,#48
 861  029b cd0000        	call	c_ladc
 863  029e b603          	ld	a,c_lreg+3
 864  02a0 6b01          	ld	(OFST+0,sp),a
 866                     ; 151 		LCD_goto((x_pos + 2), y_pos);
 868  02a2 7b03          	ld	a,(OFST+2,sp)
 869  02a4 97            	ld	xl,a
 870  02a5 7b02          	ld	a,(OFST+1,sp)
 871  02a7 ab02          	add	a,#2
 872  02a9 95            	ld	xh,a
 873  02aa cd0000        	call	_LCD_goto
 875                     ; 152 		LCD_putchar(ch);
 877  02ad 7b01          	ld	a,(OFST+0,sp)
 878  02af cd0000        	call	_LCD_putchar
 880                     ; 154         ch = (((value % 100) / 10) + 0x30);
 882  02b2 96            	ldw	x,sp
 883  02b3 1c0006        	addw	x,#OFST+5
 884  02b6 cd0000        	call	c_ltor
 886  02b9 ae0008        	ldw	x,#L42
 887  02bc cd0000        	call	c_lmod
 889  02bf ae000c        	ldw	x,#L62
 890  02c2 cd0000        	call	c_ldiv
 892  02c5 a630          	ld	a,#48
 893  02c7 cd0000        	call	c_ladc
 895  02ca b603          	ld	a,c_lreg+3
 896  02cc 6b01          	ld	(OFST+0,sp),a
 898                     ; 155 		LCD_goto((x_pos + 3), y_pos);
 900  02ce 7b03          	ld	a,(OFST+2,sp)
 901  02d0 97            	ld	xl,a
 902  02d1 7b02          	ld	a,(OFST+1,sp)
 903  02d3 ab03          	add	a,#3
 904  02d5 95            	ld	xh,a
 905  02d6 cd0000        	call	_LCD_goto
 907                     ; 156 		LCD_putchar(ch);
 909  02d9 7b01          	ld	a,(OFST+0,sp)
 910  02db cd0000        	call	_LCD_putchar
 912                     ; 158         ch = ((value % 10) + 0x30);
 914  02de 96            	ldw	x,sp
 915  02df 1c0006        	addw	x,#OFST+5
 916  02e2 cd0000        	call	c_ltor
 918  02e5 ae000c        	ldw	x,#L62
 919  02e8 cd0000        	call	c_lmod
 921  02eb a630          	ld	a,#48
 922  02ed cd0000        	call	c_ladc
 924  02f0 b603          	ld	a,c_lreg+3
 925  02f2 6b01          	ld	(OFST+0,sp),a
 927                     ; 159 		LCD_goto((x_pos + 4), y_pos);
 929  02f4 7b03          	ld	a,(OFST+2,sp)
 930  02f6 97            	ld	xl,a
 931  02f7 7b02          	ld	a,(OFST+1,sp)
 932  02f9 ab04          	add	a,#4
 933  02fb 95            	ld	xh,a
 934  02fc cd0000        	call	_LCD_goto
 936                     ; 160 		LCD_putchar(ch);
 938  02ff 7b01          	ld	a,(OFST+0,sp)
 939  0301 cd0000        	call	_LCD_putchar
 941                     ; 162         LCD_goto((x_pos + 5), y_pos);
 943  0304 7b03          	ld	a,(OFST+2,sp)
 944  0306 97            	ld	xl,a
 945  0307 7b02          	ld	a,(OFST+1,sp)
 946  0309 ab05          	add	a,#5
 947  030b 95            	ld	xh,a
 948  030c cd0000        	call	_LCD_goto
 950                     ; 163 		LCD_putchar(0x20);
 952  030f a620          	ld	a,#32
 953  0311 cd0000        	call	_LCD_putchar
 956  0314 aced04ed      	jpf	L541
 957  0318               L741:
 958                     ; 165     else if((value > 99) && (value <= 999))
 960  0318 9c            	rvf
 961  0319 96            	ldw	x,sp
 962  031a 1c0006        	addw	x,#OFST+5
 963  031d cd0000        	call	c_ltor
 965  0320 ae0008        	ldw	x,#L42
 966  0323 cd0000        	call	c_lcmp
 968  0326 2e03          	jrsge	L63
 969  0328 cc03df        	jp	L351
 970  032b               L63:
 972  032b 9c            	rvf
 973  032c 96            	ldw	x,sp
 974  032d 1c0006        	addw	x,#OFST+5
 975  0330 cd0000        	call	c_ltor
 977  0333 ae0004        	ldw	x,#L22
 978  0336 cd0000        	call	c_lcmp
 980  0339 2f03          	jrslt	L04
 981  033b cc03df        	jp	L351
 982  033e               L04:
 983                     ; 167         ch = (((value % 1000) / 100) + 0x30);
 985  033e 96            	ldw	x,sp
 986  033f 1c0006        	addw	x,#OFST+5
 987  0342 cd0000        	call	c_ltor
 989  0345 ae0004        	ldw	x,#L22
 990  0348 cd0000        	call	c_lmod
 992  034b ae0008        	ldw	x,#L42
 993  034e cd0000        	call	c_ldiv
 995  0351 a630          	ld	a,#48
 996  0353 cd0000        	call	c_ladc
 998  0356 b603          	ld	a,c_lreg+3
 999  0358 6b01          	ld	(OFST+0,sp),a
1001                     ; 168 		LCD_goto((x_pos + 1), y_pos);
1003  035a 7b03          	ld	a,(OFST+2,sp)
1004  035c 97            	ld	xl,a
1005  035d 7b02          	ld	a,(OFST+1,sp)
1006  035f 4c            	inc	a
1007  0360 95            	ld	xh,a
1008  0361 cd0000        	call	_LCD_goto
1010                     ; 169 		LCD_putchar(ch);
1012  0364 7b01          	ld	a,(OFST+0,sp)
1013  0366 cd0000        	call	_LCD_putchar
1015                     ; 171         ch = (((value % 100) / 10) + 0x30);
1017  0369 96            	ldw	x,sp
1018  036a 1c0006        	addw	x,#OFST+5
1019  036d cd0000        	call	c_ltor
1021  0370 ae0008        	ldw	x,#L42
1022  0373 cd0000        	call	c_lmod
1024  0376 ae000c        	ldw	x,#L62
1025  0379 cd0000        	call	c_ldiv
1027  037c a630          	ld	a,#48
1028  037e cd0000        	call	c_ladc
1030  0381 b603          	ld	a,c_lreg+3
1031  0383 6b01          	ld	(OFST+0,sp),a
1033                     ; 172 		LCD_goto((x_pos + 2), y_pos);
1035  0385 7b03          	ld	a,(OFST+2,sp)
1036  0387 97            	ld	xl,a
1037  0388 7b02          	ld	a,(OFST+1,sp)
1038  038a ab02          	add	a,#2
1039  038c 95            	ld	xh,a
1040  038d cd0000        	call	_LCD_goto
1042                     ; 173 		LCD_putchar(ch);
1044  0390 7b01          	ld	a,(OFST+0,sp)
1045  0392 cd0000        	call	_LCD_putchar
1047                     ; 175         ch = ((value % 10) + 0x30);
1049  0395 96            	ldw	x,sp
1050  0396 1c0006        	addw	x,#OFST+5
1051  0399 cd0000        	call	c_ltor
1053  039c ae000c        	ldw	x,#L62
1054  039f cd0000        	call	c_lmod
1056  03a2 a630          	ld	a,#48
1057  03a4 cd0000        	call	c_ladc
1059  03a7 b603          	ld	a,c_lreg+3
1060  03a9 6b01          	ld	(OFST+0,sp),a
1062                     ; 176 		LCD_goto((x_pos + 3), y_pos);
1064  03ab 7b03          	ld	a,(OFST+2,sp)
1065  03ad 97            	ld	xl,a
1066  03ae 7b02          	ld	a,(OFST+1,sp)
1067  03b0 ab03          	add	a,#3
1068  03b2 95            	ld	xh,a
1069  03b3 cd0000        	call	_LCD_goto
1071                     ; 177 		LCD_putchar(ch);
1073  03b6 7b01          	ld	a,(OFST+0,sp)
1074  03b8 cd0000        	call	_LCD_putchar
1076                     ; 179         LCD_goto((x_pos + 4), y_pos);
1078  03bb 7b03          	ld	a,(OFST+2,sp)
1079  03bd 97            	ld	xl,a
1080  03be 7b02          	ld	a,(OFST+1,sp)
1081  03c0 ab04          	add	a,#4
1082  03c2 95            	ld	xh,a
1083  03c3 cd0000        	call	_LCD_goto
1085                     ; 180 		LCD_putchar(0x20);
1087  03c6 a620          	ld	a,#32
1088  03c8 cd0000        	call	_LCD_putchar
1090                     ; 182 		LCD_goto((x_pos + 5), y_pos);
1092  03cb 7b03          	ld	a,(OFST+2,sp)
1093  03cd 97            	ld	xl,a
1094  03ce 7b02          	ld	a,(OFST+1,sp)
1095  03d0 ab05          	add	a,#5
1096  03d2 95            	ld	xh,a
1097  03d3 cd0000        	call	_LCD_goto
1099                     ; 183 		LCD_putchar(0x20);
1101  03d6 a620          	ld	a,#32
1102  03d8 cd0000        	call	_LCD_putchar
1105  03db aced04ed      	jpf	L541
1106  03df               L351:
1107                     ; 185     else if((value > 9) && (value <= 99))
1109  03df 9c            	rvf
1110  03e0 96            	ldw	x,sp
1111  03e1 1c0006        	addw	x,#OFST+5
1112  03e4 cd0000        	call	c_ltor
1114  03e7 ae000c        	ldw	x,#L62
1115  03ea cd0000        	call	c_lcmp
1117  03ed 2e03          	jrsge	L24
1118  03ef cc0488        	jp	L751
1119  03f2               L24:
1121  03f2 9c            	rvf
1122  03f3 96            	ldw	x,sp
1123  03f4 1c0006        	addw	x,#OFST+5
1124  03f7 cd0000        	call	c_ltor
1126  03fa ae0008        	ldw	x,#L42
1127  03fd cd0000        	call	c_lcmp
1129  0400 2f03          	jrslt	L44
1130  0402 cc0488        	jp	L751
1131  0405               L44:
1132                     ; 187         ch = (((value % 100) / 10) + 0x30);
1134  0405 96            	ldw	x,sp
1135  0406 1c0006        	addw	x,#OFST+5
1136  0409 cd0000        	call	c_ltor
1138  040c ae0008        	ldw	x,#L42
1139  040f cd0000        	call	c_lmod
1141  0412 ae000c        	ldw	x,#L62
1142  0415 cd0000        	call	c_ldiv
1144  0418 a630          	ld	a,#48
1145  041a cd0000        	call	c_ladc
1147  041d b603          	ld	a,c_lreg+3
1148  041f 6b01          	ld	(OFST+0,sp),a
1150                     ; 188 		LCD_goto((x_pos + 1), y_pos);
1152  0421 7b03          	ld	a,(OFST+2,sp)
1153  0423 97            	ld	xl,a
1154  0424 7b02          	ld	a,(OFST+1,sp)
1155  0426 4c            	inc	a
1156  0427 95            	ld	xh,a
1157  0428 cd0000        	call	_LCD_goto
1159                     ; 189 		LCD_putchar(ch);
1161  042b 7b01          	ld	a,(OFST+0,sp)
1162  042d cd0000        	call	_LCD_putchar
1164                     ; 191         ch = ((value % 10) + 0x30);
1166  0430 96            	ldw	x,sp
1167  0431 1c0006        	addw	x,#OFST+5
1168  0434 cd0000        	call	c_ltor
1170  0437 ae000c        	ldw	x,#L62
1171  043a cd0000        	call	c_lmod
1173  043d a630          	ld	a,#48
1174  043f cd0000        	call	c_ladc
1176  0442 b603          	ld	a,c_lreg+3
1177  0444 6b01          	ld	(OFST+0,sp),a
1179                     ; 192 		LCD_goto((x_pos + 2), y_pos);
1181  0446 7b03          	ld	a,(OFST+2,sp)
1182  0448 97            	ld	xl,a
1183  0449 7b02          	ld	a,(OFST+1,sp)
1184  044b ab02          	add	a,#2
1185  044d 95            	ld	xh,a
1186  044e cd0000        	call	_LCD_goto
1188                     ; 193 		LCD_putchar(ch);
1190  0451 7b01          	ld	a,(OFST+0,sp)
1191  0453 cd0000        	call	_LCD_putchar
1193                     ; 195         LCD_goto((x_pos + 3), y_pos);
1195  0456 7b03          	ld	a,(OFST+2,sp)
1196  0458 97            	ld	xl,a
1197  0459 7b02          	ld	a,(OFST+1,sp)
1198  045b ab03          	add	a,#3
1199  045d 95            	ld	xh,a
1200  045e cd0000        	call	_LCD_goto
1202                     ; 196 		LCD_putchar(0x20);
1204  0461 a620          	ld	a,#32
1205  0463 cd0000        	call	_LCD_putchar
1207                     ; 198 		LCD_goto((x_pos + 4), y_pos);
1209  0466 7b03          	ld	a,(OFST+2,sp)
1210  0468 97            	ld	xl,a
1211  0469 7b02          	ld	a,(OFST+1,sp)
1212  046b ab04          	add	a,#4
1213  046d 95            	ld	xh,a
1214  046e cd0000        	call	_LCD_goto
1216                     ; 199 		LCD_putchar(0x20);
1218  0471 a620          	ld	a,#32
1219  0473 cd0000        	call	_LCD_putchar
1221                     ; 201 		LCD_goto((x_pos + 5), y_pos);
1223  0476 7b03          	ld	a,(OFST+2,sp)
1224  0478 97            	ld	xl,a
1225  0479 7b02          	ld	a,(OFST+1,sp)
1226  047b ab05          	add	a,#5
1227  047d 95            	ld	xh,a
1228  047e cd0000        	call	_LCD_goto
1230                     ; 202 		LCD_putchar(0x20);
1232  0481 a620          	ld	a,#32
1233  0483 cd0000        	call	_LCD_putchar
1236  0486 2065          	jra	L541
1237  0488               L751:
1238                     ; 206         ch = ((value % 10) + 0x30);
1240  0488 96            	ldw	x,sp
1241  0489 1c0006        	addw	x,#OFST+5
1242  048c cd0000        	call	c_ltor
1244  048f ae000c        	ldw	x,#L62
1245  0492 cd0000        	call	c_lmod
1247  0495 a630          	ld	a,#48
1248  0497 cd0000        	call	c_ladc
1250  049a b603          	ld	a,c_lreg+3
1251  049c 6b01          	ld	(OFST+0,sp),a
1253                     ; 207 		LCD_goto((x_pos + 1), y_pos);
1255  049e 7b03          	ld	a,(OFST+2,sp)
1256  04a0 97            	ld	xl,a
1257  04a1 7b02          	ld	a,(OFST+1,sp)
1258  04a3 4c            	inc	a
1259  04a4 95            	ld	xh,a
1260  04a5 cd0000        	call	_LCD_goto
1262                     ; 208 		LCD_putchar(ch);
1264  04a8 7b01          	ld	a,(OFST+0,sp)
1265  04aa cd0000        	call	_LCD_putchar
1267                     ; 210 		LCD_goto((x_pos + 2), y_pos);
1269  04ad 7b03          	ld	a,(OFST+2,sp)
1270  04af 97            	ld	xl,a
1271  04b0 7b02          	ld	a,(OFST+1,sp)
1272  04b2 ab02          	add	a,#2
1273  04b4 95            	ld	xh,a
1274  04b5 cd0000        	call	_LCD_goto
1276                     ; 211 		LCD_putchar(0x20);
1278  04b8 a620          	ld	a,#32
1279  04ba cd0000        	call	_LCD_putchar
1281                     ; 213 	    LCD_goto((x_pos + 3), y_pos);
1283  04bd 7b03          	ld	a,(OFST+2,sp)
1284  04bf 97            	ld	xl,a
1285  04c0 7b02          	ld	a,(OFST+1,sp)
1286  04c2 ab03          	add	a,#3
1287  04c4 95            	ld	xh,a
1288  04c5 cd0000        	call	_LCD_goto
1290                     ; 214 		LCD_putchar(0x20);
1292  04c8 a620          	ld	a,#32
1293  04ca cd0000        	call	_LCD_putchar
1295                     ; 216 		LCD_goto((x_pos + 4), y_pos);
1297  04cd 7b03          	ld	a,(OFST+2,sp)
1298  04cf 97            	ld	xl,a
1299  04d0 7b02          	ld	a,(OFST+1,sp)
1300  04d2 ab04          	add	a,#4
1301  04d4 95            	ld	xh,a
1302  04d5 cd0000        	call	_LCD_goto
1304                     ; 217 		LCD_putchar(0x20);
1306  04d8 a620          	ld	a,#32
1307  04da cd0000        	call	_LCD_putchar
1309                     ; 219 		LCD_goto((x_pos + 5), y_pos);
1311  04dd 7b03          	ld	a,(OFST+2,sp)
1312  04df 97            	ld	xl,a
1313  04e0 7b02          	ld	a,(OFST+1,sp)
1314  04e2 ab05          	add	a,#5
1315  04e4 95            	ld	xh,a
1316  04e5 cd0000        	call	_LCD_goto
1318                     ; 220 		LCD_putchar(0x20);
1320  04e8 a620          	ld	a,#32
1321  04ea cd0000        	call	_LCD_putchar
1323  04ed               L541:
1324                     ; 222 }
1327  04ed 5b03          	addw	sp,#3
1328  04ef 81            	ret
1397                     	xdef	_main
1398                     	xdef	_print_I
1399                     	xdef	_TIM2_setup
1400                     	xdef	_TIM1_setup
1401                     	xdef	_GPIO_setup
1402                     	xdef	_clock_setup
1403                     	xdef	_end_time
1404                     	xdef	_start_time
1405                     	xdef	_duty_cycle
1406                     	xdef	_pulse_ticks
1407                     	xdef	_overflow_count
1408                     	xref	_LCD_goto
1409                     	xref	_LCD_clear_home
1410                     	xref	_LCD_putchar
1411                     	xref	_LCD_putstr
1412                     	xref	_LCD_init
1413                     	switch	.ubsct
1414  0000               _data_value:
1415  0000 00            	ds.b	1
1416                     	xdef	_data_value
1417                     	xref	_TIM2_SetCompare1
1418                     	xref	_TIM2_Cmd
1419                     	xref	_TIM2_OC1Init
1420                     	xref	_TIM2_TimeBaseInit
1421                     	xref	_TIM2_DeInit
1422                     	xref	_TIM1_CCxCmd
1423                     	xref	_TIM1_ITConfig
1424                     	xref	_TIM1_Cmd
1425                     	xref	_TIM1_ICInit
1426                     	xref	_TIM1_TimeBaseInit
1427                     	xref	_TIM1_DeInit
1428                     	xref	_GPIO_Init
1429                     	xref	_GPIO_DeInit
1430                     	xref	_CLK_GetFlagStatus
1431                     	xref	_CLK_SYSCLKConfig
1432                     	xref	_CLK_HSIPrescalerConfig
1433                     	xref	_CLK_ClockSwitchConfig
1434                     	xref	_CLK_PeripheralClockConfig
1435                     	xref	_CLK_ClockSwitchCmd
1436                     	xref	_CLK_LSICmd
1437                     	xref	_CLK_HSICmd
1438                     	xref	_CLK_HSECmd
1439                     	xref	_CLK_DeInit
1440                     	xref	_delay_ms
1441                     	switch	.const
1442  0010               L13:
1443  0010 542f6d733a00  	dc.b	"T/ms:",0
1444  0016               L72:
1445  0016 50574d204361  	dc.b	"PWM Capture Test",0
1446                     	xref.b	c_lreg
1447                     	xref.b	c_x
1467                     	xref	c_lmod
1468                     	xref	c_ladc
1469                     	xref	c_ldiv
1470                     	xref	c_lcmp
1471                     	xref	c_ltor
1472                     	xref	c_lgneg
1473                     	end
