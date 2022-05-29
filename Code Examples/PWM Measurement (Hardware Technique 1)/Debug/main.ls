   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     	bsct
  15  0000               _duty_cycle:
  16  0000 00000000      	dc.l	0
  72                     ; 18 void main()
  72                     ; 19 {	
  74                     	switch	.text
  75  0000               _main:
  77  0000 89            	pushw	x
  78       00000002      OFST:	set	2
  81                     ; 20 	unsigned int i = 100;
  83  0001 ae0064        	ldw	x,#100
  84  0004 1f01          	ldw	(OFST-1,sp),x
  86                     ; 22 	clock_setup();
  88  0006 cd0099        	call	_clock_setup
  90                     ; 23 	GPIO_setup();
  92  0009 cd00fd        	call	_GPIO_setup
  94                     ; 24 	TIM1_setup();
  96  000c cd0147        	call	_TIM1_setup
  98                     ; 25 	TIM2_setup();
 100  000f cd019d        	call	_TIM2_setup
 102                     ; 26 	LCD_init();  
 104  0012 cd0000        	call	_LCD_init
 106                     ; 28 	LCD_clear_home(); 
 108  0015 cd0000        	call	_LCD_clear_home
 110                     ; 29 	LCD_goto(0, 0);
 112  0018 5f            	clrw	x
 113  0019 cd0000        	call	_LCD_goto
 115                     ; 30 	LCD_putstr("PWM Capture Test");
 117  001c ae001c        	ldw	x,#L72
 118  001f cd0000        	call	_LCD_putstr
 120                     ; 31 	LCD_goto(0, 1);
 122  0022 ae0001        	ldw	x,#1
 123  0025 cd0000        	call	_LCD_goto
 125                     ; 32 	LCD_putstr("T/ms:");
 127  0028 ae0016        	ldw	x,#L13
 128  002b cd0000        	call	_LCD_putstr
 130                     ; 33 	delay_ms(10);
 132  002e ae000a        	ldw	x,#10
 133  0031 cd0000        	call	_delay_ms
 135  0034               L33:
 136                     ; 37 		if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == RESET)
 138  0034 4b80          	push	#128
 139  0036 ae5005        	ldw	x,#20485
 140  0039 cd0000        	call	_GPIO_ReadInputPin
 142  003c 5b01          	addw	sp,#1
 143  003e 4d            	tnz	a
 144  003f 2642          	jrne	L73
 145                     ; 39 			GPIO_WriteLow(GPIOD, GPIO_PIN_0);
 147  0041 4b01          	push	#1
 148  0043 ae500f        	ldw	x,#20495
 149  0046 cd0000        	call	_GPIO_WriteLow
 151  0049 84            	pop	a
 152                     ; 40 			delay_ms(100);
 154  004a ae0064        	ldw	x,#100
 155  004d cd0000        	call	_delay_ms
 158  0050               L34:
 159                     ; 41 			while(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == RESET);
 161  0050 4b80          	push	#128
 162  0052 ae5005        	ldw	x,#20485
 163  0055 cd0000        	call	_GPIO_ReadInputPin
 165  0058 5b01          	addw	sp,#1
 166  005a 4d            	tnz	a
 167  005b 27f3          	jreq	L34
 168                     ; 42 			GPIO_WriteHigh(GPIOD, GPIO_PIN_0);
 170  005d 4b01          	push	#1
 171  005f ae500f        	ldw	x,#20495
 172  0062 cd0000        	call	_GPIO_WriteHigh
 174  0065 84            	pop	a
 175                     ; 44 			i += 100;
 177  0066 1e01          	ldw	x,(OFST-1,sp)
 178  0068 1c0064        	addw	x,#100
 179  006b 1f01          	ldw	(OFST-1,sp),x
 181                     ; 45 			if(i  > 1000)
 183  006d 1e01          	ldw	x,(OFST-1,sp)
 184  006f a303e9        	cpw	x,#1001
 185  0072 2505          	jrult	L74
 186                     ; 47 				i = 100;
 188  0074 ae0064        	ldw	x,#100
 189  0077 1f01          	ldw	(OFST-1,sp),x
 191  0079               L74:
 192                     ; 50 			TIM2_SetCompare1(i);
 194  0079 1e01          	ldw	x,(OFST-1,sp)
 195  007b cd0000        	call	_TIM2_SetCompare1
 197                     ; 51 			TIM2_SetCompare2(i);
 199  007e 1e01          	ldw	x,(OFST-1,sp)
 200  0080 cd0000        	call	_TIM2_SetCompare2
 202  0083               L73:
 203                     ; 54 		print_I(11, 1, duty_cycle);
 205  0083 be02          	ldw	x,_duty_cycle+2
 206  0085 89            	pushw	x
 207  0086 be00          	ldw	x,_duty_cycle
 208  0088 89            	pushw	x
 209  0089 ae0b01        	ldw	x,#2817
 210  008c cd01d8        	call	_print_I
 212  008f 5b04          	addw	sp,#4
 213                     ; 55 		delay_ms(100);
 215  0091 ae0064        	ldw	x,#100
 216  0094 cd0000        	call	_delay_ms
 219  0097 209b          	jra	L33
 252                     ; 60 void clock_setup(void)
 252                     ; 61 {
 253                     	switch	.text
 254  0099               _clock_setup:
 258                     ; 62 	CLK_DeInit();
 260  0099 cd0000        	call	_CLK_DeInit
 262                     ; 64 	CLK_HSECmd(DISABLE);
 264  009c 4f            	clr	a
 265  009d cd0000        	call	_CLK_HSECmd
 267                     ; 65 	CLK_LSICmd(DISABLE);
 269  00a0 4f            	clr	a
 270  00a1 cd0000        	call	_CLK_LSICmd
 272                     ; 66 	CLK_HSICmd(ENABLE);
 274  00a4 a601          	ld	a,#1
 275  00a6 cd0000        	call	_CLK_HSICmd
 278  00a9               L36:
 279                     ; 67 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 281  00a9 ae0102        	ldw	x,#258
 282  00ac cd0000        	call	_CLK_GetFlagStatus
 284  00af 4d            	tnz	a
 285  00b0 27f7          	jreq	L36
 286                     ; 69 	CLK_ClockSwitchCmd(ENABLE);
 288  00b2 a601          	ld	a,#1
 289  00b4 cd0000        	call	_CLK_ClockSwitchCmd
 291                     ; 70 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 293  00b7 a618          	ld	a,#24
 294  00b9 cd0000        	call	_CLK_HSIPrescalerConfig
 296                     ; 71 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 298  00bc a680          	ld	a,#128
 299  00be cd0000        	call	_CLK_SYSCLKConfig
 301                     ; 73 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 301                     ; 74 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 303  00c1 4b01          	push	#1
 304  00c3 4b00          	push	#0
 305  00c5 ae01e1        	ldw	x,#481
 306  00c8 cd0000        	call	_CLK_ClockSwitchConfig
 308  00cb 85            	popw	x
 309                     ; 76 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 311  00cc ae0001        	ldw	x,#1
 312  00cf cd0000        	call	_CLK_PeripheralClockConfig
 314                     ; 77 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 316  00d2 ae0701        	ldw	x,#1793
 317  00d5 cd0000        	call	_CLK_PeripheralClockConfig
 319                     ; 78 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 321  00d8 ae0501        	ldw	x,#1281
 322  00db cd0000        	call	_CLK_PeripheralClockConfig
 324                     ; 79 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 326  00de ae0100        	ldw	x,#256
 327  00e1 cd0000        	call	_CLK_PeripheralClockConfig
 329                     ; 80 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 331  00e4 ae1300        	ldw	x,#4864
 332  00e7 cd0000        	call	_CLK_PeripheralClockConfig
 334                     ; 81 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 336  00ea ae1200        	ldw	x,#4608
 337  00ed cd0000        	call	_CLK_PeripheralClockConfig
 339                     ; 82 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 341  00f0 ae0300        	ldw	x,#768
 342  00f3 cd0000        	call	_CLK_PeripheralClockConfig
 344                     ; 83 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 346  00f6 ae0400        	ldw	x,#1024
 347  00f9 cd0000        	call	_CLK_PeripheralClockConfig
 349                     ; 84 }
 352  00fc 81            	ret
 377                     ; 87 void GPIO_setup(void)
 377                     ; 88 {	
 378                     	switch	.text
 379  00fd               _GPIO_setup:
 383                     ; 89 	GPIO_DeInit(GPIOB);
 385  00fd ae5005        	ldw	x,#20485
 386  0100 cd0000        	call	_GPIO_DeInit
 388                     ; 90 	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
 390  0103 4b40          	push	#64
 391  0105 4b80          	push	#128
 392  0107 ae5005        	ldw	x,#20485
 393  010a cd0000        	call	_GPIO_Init
 395  010d 85            	popw	x
 396                     ; 92 	GPIO_DeInit(GPIOC);
 398  010e ae500a        	ldw	x,#20490
 399  0111 cd0000        	call	_GPIO_DeInit
 401                     ; 93 	GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT);
 403  0114 4b00          	push	#0
 404  0116 4b02          	push	#2
 405  0118 ae500a        	ldw	x,#20490
 406  011b cd0000        	call	_GPIO_Init
 408  011e 85            	popw	x
 409                     ; 95 	GPIO_DeInit(GPIOD);
 411  011f ae500f        	ldw	x,#20495
 412  0122 cd0000        	call	_GPIO_DeInit
 414                     ; 96 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_HIGH_FAST);
 416  0125 4bf0          	push	#240
 417  0127 4b01          	push	#1
 418  0129 ae500f        	ldw	x,#20495
 419  012c cd0000        	call	_GPIO_Init
 421  012f 85            	popw	x
 422                     ; 97 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
 424  0130 4bf0          	push	#240
 425  0132 4b08          	push	#8
 426  0134 ae500f        	ldw	x,#20495
 427  0137 cd0000        	call	_GPIO_Init
 429  013a 85            	popw	x
 430                     ; 98 	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);
 432  013b 4bf0          	push	#240
 433  013d 4b10          	push	#16
 434  013f ae500f        	ldw	x,#20495
 435  0142 cd0000        	call	_GPIO_Init
 437  0145 85            	popw	x
 438                     ; 99 }
 441  0146 81            	ret
 474                     ; 102 void TIM1_setup(void)
 474                     ; 103 {
 475                     	switch	.text
 476  0147               _TIM1_setup:
 480                     ; 104 	TIM1_DeInit();
 482  0147 cd0000        	call	_TIM1_DeInit
 484                     ; 105 	TIM1_TimeBaseInit(2000, TIM1_COUNTERMODE_UP, 55535, 1);
 486  014a 4b01          	push	#1
 487  014c aed8ef        	ldw	x,#55535
 488  014f 89            	pushw	x
 489  0150 4b00          	push	#0
 490  0152 ae07d0        	ldw	x,#2000
 491  0155 cd0000        	call	_TIM1_TimeBaseInit
 493  0158 5b04          	addw	sp,#4
 494                     ; 106 	TIM1_CCxCmd(TIM1_CHANNEL_1, ENABLE);
 496  015a ae0001        	ldw	x,#1
 497  015d cd0000        	call	_TIM1_CCxCmd
 499                     ; 107 	TIM1_CCxCmd(TIM1_CHANNEL_2, ENABLE);
 501  0160 ae0101        	ldw	x,#257
 502  0163 cd0000        	call	_TIM1_CCxCmd
 504                     ; 113 	TIM1_PWMIConfig(TIM1_CHANNEL_1, 
 504                     ; 114 									 TIM1_ICPOLARITY_RISING, 
 504                     ; 115 									 TIM1_ICSELECTION_DIRECTTI, 
 504                     ; 116 									 TIM1_ICPSC_DIV1, 
 504                     ; 117 									 0);
 506  0166 4b00          	push	#0
 507  0168 4b00          	push	#0
 508  016a 4b01          	push	#1
 509  016c 5f            	clrw	x
 510  016d cd0000        	call	_TIM1_PWMIConfig
 512  0170 5b03          	addw	sp,#3
 513                     ; 119 	TIM1_PWMIConfig(TIM1_CHANNEL_2, 
 513                     ; 120 									 TIM1_ICPOLARITY_FALLING, 
 513                     ; 121 									 TIM1_ICSELECTION_INDIRECTTI, 
 513                     ; 122 									 TIM1_ICPSC_DIV1, 
 513                     ; 123 									 0);		
 515  0172 4b00          	push	#0
 516  0174 4b00          	push	#0
 517  0176 4b02          	push	#2
 518  0178 ae0101        	ldw	x,#257
 519  017b cd0000        	call	_TIM1_PWMIConfig
 521  017e 5b03          	addw	sp,#3
 522                     ; 124 	TIM1_SelectInputTrigger(TIM1_TS_TI1FP1);
 524  0180 a650          	ld	a,#80
 525  0182 cd0000        	call	_TIM1_SelectInputTrigger
 527                     ; 125 	TIM1_SelectSlaveMode(TIM1_SLAVEMODE_RESET);
 529  0185 a604          	ld	a,#4
 530  0187 cd0000        	call	_TIM1_SelectSlaveMode
 532                     ; 127 	TIM1_ClearFlag(TIM1_FLAG_CC2);
 534  018a ae0004        	ldw	x,#4
 535  018d cd0000        	call	_TIM1_ClearFlag
 537                     ; 128 	TIM1_ITConfig(TIM1_IT_CC2, ENABLE);	
 539  0190 ae0401        	ldw	x,#1025
 540  0193 cd0000        	call	_TIM1_ITConfig
 542                     ; 129 	TIM1_Cmd(ENABLE);
 544  0196 a601          	ld	a,#1
 545  0198 cd0000        	call	_TIM1_Cmd
 547                     ; 130 	enableInterrupts();
 550  019b 9a            rim
 552                     ; 131 }
 556  019c 81            	ret
 586                     ; 134 void TIM2_setup(void)
 586                     ; 135 {
 587                     	switch	.text
 588  019d               _TIM2_setup:
 592                     ; 136 	TIM2_DeInit();
 594  019d cd0000        	call	_TIM2_DeInit
 596                     ; 137 	TIM2_TimeBaseInit(TIM2_PRESCALER_32, 1250);
 598  01a0 ae04e2        	ldw	x,#1250
 599  01a3 89            	pushw	x
 600  01a4 a605          	ld	a,#5
 601  01a6 cd0000        	call	_TIM2_TimeBaseInit
 603  01a9 85            	popw	x
 604                     ; 138 	TIM2_OC1Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_LOW);
 606  01aa 4b22          	push	#34
 607  01ac ae03e8        	ldw	x,#1000
 608  01af 89            	pushw	x
 609  01b0 ae7011        	ldw	x,#28689
 610  01b3 cd0000        	call	_TIM2_OC1Init
 612  01b6 5b03          	addw	sp,#3
 613                     ; 139 	TIM2_OC2Init(TIM2_OCMODE_PWM2, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_LOW);
 615  01b8 4b22          	push	#34
 616  01ba ae03e8        	ldw	x,#1000
 617  01bd 89            	pushw	x
 618  01be ae7011        	ldw	x,#28689
 619  01c1 cd0000        	call	_TIM2_OC2Init
 621  01c4 5b03          	addw	sp,#3
 622                     ; 140 	TIM2_SetCompare1(100);
 624  01c6 ae0064        	ldw	x,#100
 625  01c9 cd0000        	call	_TIM2_SetCompare1
 627                     ; 141 	TIM2_SetCompare2(100);
 629  01cc ae0064        	ldw	x,#100
 630  01cf cd0000        	call	_TIM2_SetCompare2
 632                     ; 142 	TIM2_Cmd(ENABLE);
 634  01d2 a601          	ld	a,#1
 635  01d4 cd0000        	call	_TIM2_Cmd
 637                     ; 143 }
 640  01d7 81            	ret
 643                     .const:	section	.text
 644  0000               L711_tmp:
 645  0000 20            	dc.b	32
 646  0001 20            	dc.b	32
 647  0002 20            	dc.b	32
 648  0003 20            	dc.b	32
 649  0004 20            	dc.b	32
 650  0005 00            	dc.b	0
 712                     	switch	.const
 713  0006               L02:
 714  0006 00002710      	dc.l	10000
 715  000a               L22:
 716  000a 000003e8      	dc.l	1000
 717  000e               L42:
 718  000e 0000000a      	dc.l	10
 719  0012               L62:
 720  0012 00000064      	dc.l	100
 721                     ; 146 void print_I(unsigned char x_pos, unsigned char y_pos, signed long value)
 721                     ; 147 {
 722                     	switch	.text
 723  01d8               _print_I:
 725  01d8 89            	pushw	x
 726  01d9 5206          	subw	sp,#6
 727       00000006      OFST:	set	6
 730                     ; 148 	char tmp[6] = {0x20, 0x20, 0x20, 0x20, 0x20, '\0'} ;
 732  01db 96            	ldw	x,sp
 733  01dc 1c0001        	addw	x,#OFST-5
 734  01df 90ae0000      	ldw	y,#L711_tmp
 735  01e3 a606          	ld	a,#6
 736  01e5 cd0000        	call	c_xymvx
 738                     ; 150 	tmp[0] = ((value / 10000) + 0x30);
 740  01e8 96            	ldw	x,sp
 741  01e9 1c000b        	addw	x,#OFST+5
 742  01ec cd0000        	call	c_ltor
 744  01ef ae0006        	ldw	x,#L02
 745  01f2 cd0000        	call	c_ldiv
 747  01f5 a630          	ld	a,#48
 748  01f7 cd0000        	call	c_ladc
 750  01fa b603          	ld	a,c_lreg+3
 751  01fc 6b01          	ld	(OFST-5,sp),a
 753                     ; 151     tmp[1] = (((value / 1000) % 10) + 0x30);
 755  01fe 96            	ldw	x,sp
 756  01ff 1c000b        	addw	x,#OFST+5
 757  0202 cd0000        	call	c_ltor
 759  0205 ae000a        	ldw	x,#L22
 760  0208 cd0000        	call	c_ldiv
 762  020b ae000e        	ldw	x,#L42
 763  020e cd0000        	call	c_lmod
 765  0211 a630          	ld	a,#48
 766  0213 cd0000        	call	c_ladc
 768  0216 b603          	ld	a,c_lreg+3
 769  0218 6b02          	ld	(OFST-4,sp),a
 771                     ; 152 	tmp[2] = (((value / 100) % 10) + 0x30);
 773  021a 96            	ldw	x,sp
 774  021b 1c000b        	addw	x,#OFST+5
 775  021e cd0000        	call	c_ltor
 777  0221 ae0012        	ldw	x,#L62
 778  0224 cd0000        	call	c_ldiv
 780  0227 ae000e        	ldw	x,#L42
 781  022a cd0000        	call	c_lmod
 783  022d a630          	ld	a,#48
 784  022f cd0000        	call	c_ladc
 786  0232 b603          	ld	a,c_lreg+3
 787  0234 6b03          	ld	(OFST-3,sp),a
 789                     ; 153     tmp[3] = (((value / 10) % 10) + 0x30);
 791  0236 96            	ldw	x,sp
 792  0237 1c000b        	addw	x,#OFST+5
 793  023a cd0000        	call	c_ltor
 795  023d ae000e        	ldw	x,#L42
 796  0240 cd0000        	call	c_ldiv
 798  0243 ae000e        	ldw	x,#L42
 799  0246 cd0000        	call	c_lmod
 801  0249 a630          	ld	a,#48
 802  024b cd0000        	call	c_ladc
 804  024e b603          	ld	a,c_lreg+3
 805  0250 6b04          	ld	(OFST-2,sp),a
 807                     ; 154     tmp[4] = ((value % 10) + 0x30);
 809  0252 96            	ldw	x,sp
 810  0253 1c000b        	addw	x,#OFST+5
 811  0256 cd0000        	call	c_ltor
 813  0259 ae000e        	ldw	x,#L42
 814  025c cd0000        	call	c_lmod
 816  025f a630          	ld	a,#48
 817  0261 cd0000        	call	c_ladc
 819  0264 b603          	ld	a,c_lreg+3
 820  0266 6b05          	ld	(OFST-1,sp),a
 822                     ; 156 	LCD_goto(x_pos, y_pos);
 824  0268 7b08          	ld	a,(OFST+2,sp)
 825  026a 97            	ld	xl,a
 826  026b 7b07          	ld	a,(OFST+1,sp)
 827  026d 95            	ld	xh,a
 828  026e cd0000        	call	_LCD_goto
 830                     ; 157 	LCD_putstr(tmp);  
 832  0271 96            	ldw	x,sp
 833  0272 1c0001        	addw	x,#OFST-5
 834  0275 cd0000        	call	_LCD_putstr
 836                     ; 158 }
 839  0278 5b08          	addw	sp,#8
 840  027a 81            	ret
 882                     	xdef	_main
 883                     	xdef	_print_I
 884                     	xdef	_TIM2_setup
 885                     	xdef	_TIM1_setup
 886                     	xdef	_GPIO_setup
 887                     	xdef	_clock_setup
 888                     	xdef	_duty_cycle
 889                     	xref	_LCD_goto
 890                     	xref	_LCD_clear_home
 891                     	xref	_LCD_putstr
 892                     	xref	_LCD_init
 893                     	switch	.ubsct
 894  0000               _data_value:
 895  0000 00            	ds.b	1
 896                     	xdef	_data_value
 897  0001               _bl_state:
 898  0001 00            	ds.b	1
 899                     	xdef	_bl_state
 900                     	xref	_TIM2_SetCompare2
 901                     	xref	_TIM2_SetCompare1
 902                     	xref	_TIM2_Cmd
 903                     	xref	_TIM2_OC2Init
 904                     	xref	_TIM2_OC1Init
 905                     	xref	_TIM2_TimeBaseInit
 906                     	xref	_TIM2_DeInit
 907                     	xref	_TIM1_ClearFlag
 908                     	xref	_TIM1_CCxCmd
 909                     	xref	_TIM1_SelectSlaveMode
 910                     	xref	_TIM1_SelectInputTrigger
 911                     	xref	_TIM1_ITConfig
 912                     	xref	_TIM1_Cmd
 913                     	xref	_TIM1_PWMIConfig
 914                     	xref	_TIM1_TimeBaseInit
 915                     	xref	_TIM1_DeInit
 916                     	xref	_GPIO_ReadInputPin
 917                     	xref	_GPIO_WriteLow
 918                     	xref	_GPIO_WriteHigh
 919                     	xref	_GPIO_Init
 920                     	xref	_GPIO_DeInit
 921                     	xref	_CLK_GetFlagStatus
 922                     	xref	_CLK_SYSCLKConfig
 923                     	xref	_CLK_HSIPrescalerConfig
 924                     	xref	_CLK_ClockSwitchConfig
 925                     	xref	_CLK_PeripheralClockConfig
 926                     	xref	_CLK_ClockSwitchCmd
 927                     	xref	_CLK_LSICmd
 928                     	xref	_CLK_HSICmd
 929                     	xref	_CLK_HSECmd
 930                     	xref	_CLK_DeInit
 931                     	xref	_delay_ms
 932                     	switch	.const
 933  0016               L13:
 934  0016 542f6d733a00  	dc.b	"T/ms:",0
 935  001c               L72:
 936  001c 50574d204361  	dc.b	"PWM Capture Test",0
 937                     	xref.b	c_lreg
 938                     	xref.b	c_x
 958                     	xref	c_lmod
 959                     	xref	c_ladc
 960                     	xref	c_ldiv
 961                     	xref	c_ltor
 962                     	xref	c_xymvx
 963                     	end
