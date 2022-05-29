   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  72                     ; 19 void main()
  72                     ; 20 {	
  74                     	switch	.text
  75  0000               _main:
  77  0000 5204          	subw	sp,#4
  78       00000004      OFST:	set	4
  81                     ; 21 	unsigned int present_value = 0x0000;
  83                     ; 22 	unsigned int previous_value = 0x0001;
  85  0002 ae0001        	ldw	x,#1
  86  0005 1f01          	ldw	(OFST-3,sp),x
  88                     ; 24 	clock_setup();
  90  0007 ad48          	call	_clock_setup
  92                     ; 25 	GPIO_setup();
  94  0009 cd00b5        	call	_GPIO_setup
  96                     ; 26 	TIM1_setup();
  98  000c cd00d8        	call	_TIM1_setup
 100                     ; 28 	LCD_init();  
 102  000f cd0000        	call	_LCD_init
 104                     ; 29 	LCD_clear_home(); 
 106  0012 cd0000        	call	_LCD_clear_home
 108                     ; 31 	LCD_goto(1, 0);
 110  0015 ae0100        	ldw	x,#256
 111  0018 cd0000        	call	_LCD_goto
 113                     ; 32 	LCD_putstr("STM8S QEI Test");
 115  001b ae000c        	ldw	x,#L33
 116  001e cd0000        	call	_LCD_putstr
 118                     ; 33 	LCD_goto(0, 1);
 120  0021 ae0001        	ldw	x,#1
 121  0024 cd0000        	call	_LCD_goto
 123                     ; 34 	LCD_putstr("Value:");
 125  0027 ae0005        	ldw	x,#L53
 126  002a cd0000        	call	_LCD_putstr
 128  002d               L73:
 129                     ; 38 		present_value = TIM1_GetCounter();
 131  002d cd0000        	call	_TIM1_GetCounter
 133  0030 1f03          	ldw	(OFST-1,sp),x
 135                     ; 39 		if(present_value != previous_value)
 137  0032 1e03          	ldw	x,(OFST-1,sp)
 138  0034 1301          	cpw	x,(OFST-3,sp)
 139  0036 2713          	jreq	L34
 140                     ; 41 			lcd_print(12, 1, present_value);
 142  0038 1e03          	ldw	x,(OFST-1,sp)
 143  003a 89            	pushw	x
 144  003b ae0c01        	ldw	x,#3073
 145  003e cd00fa        	call	_lcd_print
 147  0041 85            	popw	x
 148                     ; 42 			GPIO_WriteReverse(LED_Port, LED_Pin);
 150  0042 4b01          	push	#1
 151  0044 ae500f        	ldw	x,#20495
 152  0047 cd0000        	call	_GPIO_WriteReverse
 154  004a 84            	pop	a
 155  004b               L34:
 156                     ; 45 		previous_value = present_value;
 158  004b 1e03          	ldw	x,(OFST-1,sp)
 159  004d 1f01          	ldw	(OFST-3,sp),x
 162  004f 20dc          	jra	L73
 195                     ; 50 void clock_setup(void)
 195                     ; 51 {
 196                     	switch	.text
 197  0051               _clock_setup:
 201                     ; 52 	CLK_DeInit();
 203  0051 cd0000        	call	_CLK_DeInit
 205                     ; 54 	CLK_HSECmd(DISABLE);
 207  0054 4f            	clr	a
 208  0055 cd0000        	call	_CLK_HSECmd
 210                     ; 55 	CLK_LSICmd(DISABLE);
 212  0058 4f            	clr	a
 213  0059 cd0000        	call	_CLK_LSICmd
 215                     ; 56 	CLK_HSICmd(ENABLE);
 217  005c a601          	ld	a,#1
 218  005e cd0000        	call	_CLK_HSICmd
 221  0061               L75:
 222                     ; 57 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 224  0061 ae0102        	ldw	x,#258
 225  0064 cd0000        	call	_CLK_GetFlagStatus
 227  0067 4d            	tnz	a
 228  0068 27f7          	jreq	L75
 229                     ; 59 	CLK_ClockSwitchCmd(ENABLE);
 231  006a a601          	ld	a,#1
 232  006c cd0000        	call	_CLK_ClockSwitchCmd
 234                     ; 60 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV4);
 236  006f a610          	ld	a,#16
 237  0071 cd0000        	call	_CLK_HSIPrescalerConfig
 239                     ; 61 											  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 241  0074 a680          	ld	a,#128
 242  0076 cd0000        	call	_CLK_SYSCLKConfig
 244                     ; 63 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
 244                     ; 64 											  CLK_SOURCE_HSI, 
 244                     ; 65 											  DISABLE, 
 244                     ; 66 											  CLK_CURRENTCLOCKSTATE_ENABLE);
 246  0079 4b01          	push	#1
 247  007b 4b00          	push	#0
 248  007d ae01e1        	ldw	x,#481
 249  0080 cd0000        	call	_CLK_ClockSwitchConfig
 251  0083 85            	popw	x
 252                     ; 68 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 254  0084 ae0001        	ldw	x,#1
 255  0087 cd0000        	call	_CLK_PeripheralClockConfig
 257                     ; 69 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 259  008a ae0701        	ldw	x,#1793
 260  008d cd0000        	call	_CLK_PeripheralClockConfig
 262                     ; 70 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 264  0090 ae0100        	ldw	x,#256
 265  0093 cd0000        	call	_CLK_PeripheralClockConfig
 267                     ; 71 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 269  0096 ae1300        	ldw	x,#4864
 270  0099 cd0000        	call	_CLK_PeripheralClockConfig
 272                     ; 72 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 274  009c ae1200        	ldw	x,#4608
 275  009f cd0000        	call	_CLK_PeripheralClockConfig
 277                     ; 73 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 279  00a2 ae0300        	ldw	x,#768
 280  00a5 cd0000        	call	_CLK_PeripheralClockConfig
 282                     ; 74 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 284  00a8 ae0500        	ldw	x,#1280
 285  00ab cd0000        	call	_CLK_PeripheralClockConfig
 287                     ; 75 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 289  00ae ae0400        	ldw	x,#1024
 290  00b1 cd0000        	call	_CLK_PeripheralClockConfig
 292                     ; 76 }
 295  00b4 81            	ret
 320                     ; 79 void GPIO_setup(void)
 320                     ; 80 {
 321                     	switch	.text
 322  00b5               _GPIO_setup:
 326                     ; 81 	GPIO_DeInit(GPIOC);
 328  00b5 ae500a        	ldw	x,#20490
 329  00b8 cd0000        	call	_GPIO_DeInit
 331                     ; 82 	GPIO_Init(GPIOC, 
 331                     ; 83 					 ((GPIO_Pin_TypeDef)(GPIO_PIN_1 | GPIO_PIN_2)), 
 331                     ; 84 					 GPIO_MODE_IN_PU_NO_IT);
 333  00bb 4b40          	push	#64
 334  00bd 4b06          	push	#6
 335  00bf ae500a        	ldw	x,#20490
 336  00c2 cd0000        	call	_GPIO_Init
 338  00c5 85            	popw	x
 339                     ; 86 	GPIO_DeInit(GPIOD);
 341  00c6 ae500f        	ldw	x,#20495
 342  00c9 cd0000        	call	_GPIO_DeInit
 344                     ; 87 	GPIO_Init(LED_Port, LED_Pin, GPIO_MODE_OUT_OD_HIZ_FAST);
 346  00cc 4bb0          	push	#176
 347  00ce 4b01          	push	#1
 348  00d0 ae500f        	ldw	x,#20495
 349  00d3 cd0000        	call	_GPIO_Init
 351  00d6 85            	popw	x
 352                     ; 88 }
 355  00d7 81            	ret
 382                     ; 91 void TIM1_setup(void)
 382                     ; 92 {
 383                     	switch	.text
 384  00d8               _TIM1_setup:
 388                     ; 93 	TIM1_DeInit();
 390  00d8 cd0000        	call	_TIM1_DeInit
 392                     ; 95 	TIM1_TimeBaseInit(10, TIM1_COUNTERMODE_UP, 1000, 1);
 394  00db 4b01          	push	#1
 395  00dd ae03e8        	ldw	x,#1000
 396  00e0 89            	pushw	x
 397  00e1 4b00          	push	#0
 398  00e3 ae000a        	ldw	x,#10
 399  00e6 cd0000        	call	_TIM1_TimeBaseInit
 401  00e9 5b04          	addw	sp,#4
 402                     ; 97 	TIM1_EncoderInterfaceConfig(TIM1_ENCODERMODE_TI12, 
 402                     ; 98                                  TIM1_ICPOLARITY_FALLING, 
 402                     ; 99                                  TIM1_ICPOLARITY_FALLING);
 404  00eb 4b01          	push	#1
 405  00ed ae0301        	ldw	x,#769
 406  00f0 cd0000        	call	_TIM1_EncoderInterfaceConfig
 408  00f3 84            	pop	a
 409                     ; 101 	TIM1_Cmd(ENABLE);
 411  00f4 a601          	ld	a,#1
 412  00f6 cd0000        	call	_TIM1_Cmd
 414                     ; 102 }
 417  00f9 81            	ret
 420                     .const:	section	.text
 421  0000               L301_tmp:
 422  0000 20            	dc.b	32
 423  0001 20            	dc.b	32
 424  0002 20            	dc.b	32
 425  0003 20            	dc.b	32
 426  0004 00            	dc.b	0
 488                     ; 105 void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
 488                     ; 106 {
 489                     	switch	.text
 490  00fa               _lcd_print:
 492  00fa 89            	pushw	x
 493  00fb 5205          	subw	sp,#5
 494       00000005      OFST:	set	5
 497                     ; 107 	char tmp[5] = {0x20, 0x20, 0x20, 0x20, '\0'} ;
 499  00fd 96            	ldw	x,sp
 500  00fe 1c0001        	addw	x,#OFST-4
 501  0101 90ae0000      	ldw	y,#L301_tmp
 502  0105 a605          	ld	a,#5
 503  0107 cd0000        	call	c_xymvx
 505                     ; 109 	tmp[0] = ((value / 1000) + 0x30);
 507  010a 1e0a          	ldw	x,(OFST+5,sp)
 508  010c 90ae03e8      	ldw	y,#1000
 509  0110 65            	divw	x,y
 510  0111 1c0030        	addw	x,#48
 511  0114 01            	rrwa	x,a
 512  0115 6b01          	ld	(OFST-4,sp),a
 513  0117 02            	rlwa	x,a
 515                     ; 110     tmp[1] = (((value / 100) % 10) + 0x30);
 517  0118 1e0a          	ldw	x,(OFST+5,sp)
 518  011a a664          	ld	a,#100
 519  011c 62            	div	x,a
 520  011d a60a          	ld	a,#10
 521  011f 62            	div	x,a
 522  0120 5f            	clrw	x
 523  0121 97            	ld	xl,a
 524  0122 1c0030        	addw	x,#48
 525  0125 01            	rrwa	x,a
 526  0126 6b02          	ld	(OFST-3,sp),a
 527  0128 02            	rlwa	x,a
 529                     ; 111 	tmp[2] = (((value / 10) % 10) + 0x30);
 531  0129 1e0a          	ldw	x,(OFST+5,sp)
 532  012b a60a          	ld	a,#10
 533  012d 62            	div	x,a
 534  012e a60a          	ld	a,#10
 535  0130 62            	div	x,a
 536  0131 5f            	clrw	x
 537  0132 97            	ld	xl,a
 538  0133 1c0030        	addw	x,#48
 539  0136 01            	rrwa	x,a
 540  0137 6b03          	ld	(OFST-2,sp),a
 541  0139 02            	rlwa	x,a
 543                     ; 112     tmp[3] = ((value % 10) + 0x30);
 545  013a 1e0a          	ldw	x,(OFST+5,sp)
 546  013c a60a          	ld	a,#10
 547  013e 62            	div	x,a
 548  013f 5f            	clrw	x
 549  0140 97            	ld	xl,a
 550  0141 1c0030        	addw	x,#48
 551  0144 01            	rrwa	x,a
 552  0145 6b04          	ld	(OFST-1,sp),a
 553  0147 02            	rlwa	x,a
 555                     ; 114 	LCD_goto(x_pos, y_pos);
 557  0148 7b07          	ld	a,(OFST+2,sp)
 558  014a 97            	ld	xl,a
 559  014b 7b06          	ld	a,(OFST+1,sp)
 560  014d 95            	ld	xh,a
 561  014e cd0000        	call	_LCD_goto
 563                     ; 115 	LCD_putstr(tmp);   
 565  0151 96            	ldw	x,sp
 566  0152 1c0001        	addw	x,#OFST-4
 567  0155 cd0000        	call	_LCD_putstr
 569                     ; 116 }
 572  0158 5b07          	addw	sp,#7
 573  015a 81            	ret
 606                     	xdef	_main
 607                     	xdef	_lcd_print
 608                     	xdef	_TIM1_setup
 609                     	xdef	_GPIO_setup
 610                     	xdef	_clock_setup
 611                     	xref	_LCD_goto
 612                     	xref	_LCD_clear_home
 613                     	xref	_LCD_putstr
 614                     	xref	_LCD_init
 615                     	switch	.ubsct
 616  0000               _data_value:
 617  0000 00            	ds.b	1
 618                     	xdef	_data_value
 619  0001               _bl_state:
 620  0001 00            	ds.b	1
 621                     	xdef	_bl_state
 622                     	xref	_TIM1_GetCounter
 623                     	xref	_TIM1_EncoderInterfaceConfig
 624                     	xref	_TIM1_Cmd
 625                     	xref	_TIM1_TimeBaseInit
 626                     	xref	_TIM1_DeInit
 627                     	xref	_GPIO_WriteReverse
 628                     	xref	_GPIO_Init
 629                     	xref	_GPIO_DeInit
 630                     	xref	_CLK_GetFlagStatus
 631                     	xref	_CLK_SYSCLKConfig
 632                     	xref	_CLK_HSIPrescalerConfig
 633                     	xref	_CLK_ClockSwitchConfig
 634                     	xref	_CLK_PeripheralClockConfig
 635                     	xref	_CLK_ClockSwitchCmd
 636                     	xref	_CLK_LSICmd
 637                     	xref	_CLK_HSICmd
 638                     	xref	_CLK_HSECmd
 639                     	xref	_CLK_DeInit
 640                     	switch	.const
 641  0005               L53:
 642  0005 56616c75653a  	dc.b	"Value:",0
 643  000c               L33:
 644  000c 53544d385320  	dc.b	"STM8S QEI Test",0
 645                     	xref.b	c_x
 665                     	xref	c_xymvx
 666                     	end
