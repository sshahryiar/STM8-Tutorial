   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  74                     ; 12 void main()
  74                     ; 13 {	
  76                     	switch	.text
  77  0000               _main:
  79  0000 89            	pushw	x
  80       00000002      OFST:	set	2
  83                     ; 14     unsigned int LX = 0x0000;
  85                     ; 15 	unsigned int tmp = 0x0000;
  87                     ; 17 	clock_setup();
  89  0001 ad60          	call	_clock_setup
  91                     ; 18 	GPIO_setup();
  93  0003 cd00c7        	call	_GPIO_setup
  95                     ; 19 	I2C_setup();
  97  0006 cd00e4        	call	_I2C_setup
  99                     ; 20 	LCD_init();  
 101  0009 cd0000        	call	_LCD_init
 103                     ; 21 	BH1750_init();
 105  000c cd0000        	call	_BH1750_init
 107                     ; 23 	LCD_clear_home(); 
 109  000f cd0000        	call	_LCD_clear_home
 111                     ; 24 	LCD_goto(0, 0);
 113  0012 5f            	clrw	x
 114  0013 cd0000        	call	_LCD_goto
 116                     ; 25 	LCD_putstr("STM8 I2C");
 118  0016 ae000c        	ldw	x,#L33
 119  0019 cd0000        	call	_LCD_putstr
 121                     ; 26 	LCD_goto(0, 1);
 123  001c ae0001        	ldw	x,#1
 124  001f cd0000        	call	_LCD_goto
 126                     ; 27 	LCD_putstr("Lx");
 128  0022 ae0009        	ldw	x,#L53
 129  0025 cd0000        	call	_LCD_putstr
 131                     ; 28 	delay_ms(10);
 133  0028 ae000a        	ldw	x,#10
 134  002b cd0000        	call	_delay_ms
 136  002e               L73:
 137                     ; 32 		tmp = get_lux_value(cont_L_res_mode, 20);
 139  002e ae0014        	ldw	x,#20
 140  0031 89            	pushw	x
 141  0032 a613          	ld	a,#19
 142  0034 cd0000        	call	_get_lux_value
 144  0037 5b02          	addw	sp,#2
 145  0039 1f01          	ldw	(OFST-1,sp),x
 147                     ; 34         if(tmp > 10)
 149  003b 1e01          	ldw	x,(OFST-1,sp)
 150  003d a3000b        	cpw	x,#11
 151  0040 2502          	jrult	L34
 152                     ; 36             LX = tmp;
 156  0042 200d          	jra	L54
 157  0044               L34:
 158                     ; 40             LX = get_lux_value(cont_H_res_mode1, 140);
 160  0044 ae008c        	ldw	x,#140
 161  0047 89            	pushw	x
 162  0048 a610          	ld	a,#16
 163  004a cd0000        	call	_get_lux_value
 165  004d 5b02          	addw	sp,#2
 166  004f 1f01          	ldw	(OFST-1,sp),x
 168  0051               L54:
 169                     ; 43 		lcd_print(3, 1, LX);
 171  0051 1e01          	ldw	x,(OFST-1,sp)
 172  0053 89            	pushw	x
 173  0054 ae0301        	ldw	x,#769
 174  0057 cd0110        	call	_lcd_print
 176  005a 85            	popw	x
 177                     ; 45 		delay_ms(200);
 179  005b ae00c8        	ldw	x,#200
 180  005e cd0000        	call	_delay_ms
 183  0061 20cb          	jra	L73
 216                     ; 50 void clock_setup(void)
 216                     ; 51 {
 217                     	switch	.text
 218  0063               _clock_setup:
 222                     ; 52 	CLK_DeInit();
 224  0063 cd0000        	call	_CLK_DeInit
 226                     ; 54 	CLK_HSECmd(DISABLE);
 228  0066 4f            	clr	a
 229  0067 cd0000        	call	_CLK_HSECmd
 231                     ; 55 	CLK_LSICmd(DISABLE);
 233  006a 4f            	clr	a
 234  006b cd0000        	call	_CLK_LSICmd
 236                     ; 56 	CLK_HSICmd(ENABLE);
 238  006e a601          	ld	a,#1
 239  0070 cd0000        	call	_CLK_HSICmd
 242  0073               L16:
 243                     ; 57 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 245  0073 ae0102        	ldw	x,#258
 246  0076 cd0000        	call	_CLK_GetFlagStatus
 248  0079 4d            	tnz	a
 249  007a 27f7          	jreq	L16
 250                     ; 59 	CLK_ClockSwitchCmd(ENABLE);
 252  007c a601          	ld	a,#1
 253  007e cd0000        	call	_CLK_ClockSwitchCmd
 255                     ; 60 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 257  0081 a618          	ld	a,#24
 258  0083 cd0000        	call	_CLK_HSIPrescalerConfig
 260                     ; 61 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
 262  0086 a681          	ld	a,#129
 263  0088 cd0000        	call	_CLK_SYSCLKConfig
 265                     ; 63 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 265                     ; 64 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 267  008b 4b01          	push	#1
 268  008d 4b00          	push	#0
 269  008f ae01e1        	ldw	x,#481
 270  0092 cd0000        	call	_CLK_ClockSwitchConfig
 272  0095 85            	popw	x
 273                     ; 66 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 275  0096 ae0100        	ldw	x,#256
 276  0099 cd0000        	call	_CLK_PeripheralClockConfig
 278                     ; 67 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 280  009c ae0001        	ldw	x,#1
 281  009f cd0000        	call	_CLK_PeripheralClockConfig
 283                     ; 68 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 285  00a2 ae1300        	ldw	x,#4864
 286  00a5 cd0000        	call	_CLK_PeripheralClockConfig
 288                     ; 69 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 290  00a8 ae1200        	ldw	x,#4608
 291  00ab cd0000        	call	_CLK_PeripheralClockConfig
 293                     ; 70 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 295  00ae ae0300        	ldw	x,#768
 296  00b1 cd0000        	call	_CLK_PeripheralClockConfig
 298                     ; 71 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 300  00b4 ae0700        	ldw	x,#1792
 301  00b7 cd0000        	call	_CLK_PeripheralClockConfig
 303                     ; 72 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 305  00ba ae0500        	ldw	x,#1280
 306  00bd cd0000        	call	_CLK_PeripheralClockConfig
 308                     ; 73 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 310  00c0 ae0400        	ldw	x,#1024
 311  00c3 cd0000        	call	_CLK_PeripheralClockConfig
 313                     ; 74 }
 316  00c6 81            	ret
 341                     ; 77 void GPIO_setup(void)
 341                     ; 78 {	
 342                     	switch	.text
 343  00c7               _GPIO_setup:
 347                     ; 79 	GPIO_DeInit(GPIOB);
 349  00c7 ae5005        	ldw	x,#20485
 350  00ca cd0000        	call	_GPIO_DeInit
 352                     ; 80 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
 354  00cd 4bb0          	push	#176
 355  00cf 4b10          	push	#16
 356  00d1 ae5005        	ldw	x,#20485
 357  00d4 cd0000        	call	_GPIO_Init
 359  00d7 85            	popw	x
 360                     ; 81 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
 362  00d8 4bb0          	push	#176
 363  00da 4b20          	push	#32
 364  00dc ae5005        	ldw	x,#20485
 365  00df cd0000        	call	_GPIO_Init
 367  00e2 85            	popw	x
 368                     ; 82 }
 371  00e3 81            	ret
 398                     .const:	section	.text
 399  0000               L41:
 400  0000 000f4240      	dc.l	1000000
 401                     ; 84 void I2C_setup(void)
 401                     ; 85 {
 402                     	switch	.text
 403  00e4               _I2C_setup:
 407                     ; 86 	I2C_DeInit();
 409  00e4 cd0000        	call	_I2C_DeInit
 411                     ; 87 	I2C_Init(100000, 
 411                     ; 88 				  BH1750_addr, 
 411                     ; 89 				  I2C_DUTYCYCLE_2, 
 411                     ; 90 				  I2C_ACK_CURR, 
 411                     ; 91 				  I2C_ADDMODE_7BIT, 
 411                     ; 92 				  (CLK_GetClockFreq() / 1000000));
 413  00e7 cd0000        	call	_CLK_GetClockFreq
 415  00ea ae0000        	ldw	x,#L41
 416  00ed cd0000        	call	c_ludv
 418  00f0 b603          	ld	a,c_lreg+3
 419  00f2 88            	push	a
 420  00f3 4b00          	push	#0
 421  00f5 4b01          	push	#1
 422  00f7 4b00          	push	#0
 423  00f9 ae0046        	ldw	x,#70
 424  00fc 89            	pushw	x
 425  00fd ae86a0        	ldw	x,#34464
 426  0100 89            	pushw	x
 427  0101 ae0001        	ldw	x,#1
 428  0104 89            	pushw	x
 429  0105 cd0000        	call	_I2C_Init
 431  0108 5b0a          	addw	sp,#10
 432                     ; 93 	I2C_Cmd(ENABLE);
 434  010a a601          	ld	a,#1
 435  010c cd0000        	call	_I2C_Cmd
 437                     ; 94 }
 440  010f 81            	ret
 443                     	switch	.const
 444  0004               L501_tmp:
 445  0004 20            	dc.b	32
 446  0005 20            	dc.b	32
 447  0006 20            	dc.b	32
 448  0007 20            	dc.b	32
 449  0008 20            	dc.b	32
 511                     ; 98 void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
 511                     ; 99 {
 512                     	switch	.text
 513  0110               _lcd_print:
 515  0110 89            	pushw	x
 516  0111 5205          	subw	sp,#5
 517       00000005      OFST:	set	5
 520                     ; 100 	char tmp[5] = {0x20, 0x20, 0x20, 0x20, 0x20} ;
 522  0113 96            	ldw	x,sp
 523  0114 1c0001        	addw	x,#OFST-4
 524  0117 90ae0004      	ldw	y,#L501_tmp
 525  011b a605          	ld	a,#5
 526  011d cd0000        	call	c_xymvx
 528                     ; 102 	tmp[0] = ((value / 10000) + 0x30);
 530  0120 1e0a          	ldw	x,(OFST+5,sp)
 531  0122 90ae2710      	ldw	y,#10000
 532  0126 65            	divw	x,y
 533  0127 1c0030        	addw	x,#48
 534  012a 01            	rrwa	x,a
 535  012b 6b01          	ld	(OFST-4,sp),a
 536  012d 02            	rlwa	x,a
 538                     ; 103     tmp[1] = (((value / 1000) % 10) + 0x30);
 540  012e 1e0a          	ldw	x,(OFST+5,sp)
 541  0130 90ae03e8      	ldw	y,#1000
 542  0134 65            	divw	x,y
 543  0135 a60a          	ld	a,#10
 544  0137 62            	div	x,a
 545  0138 5f            	clrw	x
 546  0139 97            	ld	xl,a
 547  013a 1c0030        	addw	x,#48
 548  013d 01            	rrwa	x,a
 549  013e 6b02          	ld	(OFST-3,sp),a
 550  0140 02            	rlwa	x,a
 552                     ; 104 	tmp[2] = (((value / 100) % 10) + 0x30);
 554  0141 1e0a          	ldw	x,(OFST+5,sp)
 555  0143 a664          	ld	a,#100
 556  0145 62            	div	x,a
 557  0146 a60a          	ld	a,#10
 558  0148 62            	div	x,a
 559  0149 5f            	clrw	x
 560  014a 97            	ld	xl,a
 561  014b 1c0030        	addw	x,#48
 562  014e 01            	rrwa	x,a
 563  014f 6b03          	ld	(OFST-2,sp),a
 564  0151 02            	rlwa	x,a
 566                     ; 105     tmp[3] = (((value / 10) % 10) + 0x30);
 568  0152 1e0a          	ldw	x,(OFST+5,sp)
 569  0154 a60a          	ld	a,#10
 570  0156 62            	div	x,a
 571  0157 a60a          	ld	a,#10
 572  0159 62            	div	x,a
 573  015a 5f            	clrw	x
 574  015b 97            	ld	xl,a
 575  015c 1c0030        	addw	x,#48
 576  015f 01            	rrwa	x,a
 577  0160 6b04          	ld	(OFST-1,sp),a
 578  0162 02            	rlwa	x,a
 580                     ; 106     tmp[4] = ((value % 10) + 0x30);
 582  0163 1e0a          	ldw	x,(OFST+5,sp)
 583  0165 a60a          	ld	a,#10
 584  0167 62            	div	x,a
 585  0168 5f            	clrw	x
 586  0169 97            	ld	xl,a
 587  016a 1c0030        	addw	x,#48
 588  016d 01            	rrwa	x,a
 589  016e 6b05          	ld	(OFST+0,sp),a
 590  0170 02            	rlwa	x,a
 592                     ; 108 	LCD_goto(x_pos, y_pos);
 594  0171 7b07          	ld	a,(OFST+2,sp)
 595  0173 97            	ld	xl,a
 596  0174 7b06          	ld	a,(OFST+1,sp)
 597  0176 95            	ld	xh,a
 598  0177 cd0000        	call	_LCD_goto
 600                     ; 109 	LCD_putstr(tmp);   
 602  017a 96            	ldw	x,sp
 603  017b 1c0001        	addw	x,#OFST-4
 604  017e cd0000        	call	_LCD_putstr
 606                     ; 110 }
 609  0181 5b07          	addw	sp,#7
 610  0183 81            	ret
 623                     	xdef	_main
 624                     	xdef	_lcd_print
 625                     	xdef	_I2C_setup
 626                     	xdef	_GPIO_setup
 627                     	xdef	_clock_setup
 628                     	xref	_LCD_goto
 629                     	xref	_LCD_clear_home
 630                     	xref	_LCD_putstr
 631                     	xref	_LCD_init
 632                     	xref	_get_lux_value
 633                     	xref	_BH1750_init
 634                     	xref	_I2C_Cmd
 635                     	xref	_I2C_Init
 636                     	xref	_I2C_DeInit
 637                     	xref	_GPIO_Init
 638                     	xref	_GPIO_DeInit
 639                     	xref	_CLK_GetFlagStatus
 640                     	xref	_CLK_GetClockFreq
 641                     	xref	_CLK_SYSCLKConfig
 642                     	xref	_CLK_HSIPrescalerConfig
 643                     	xref	_CLK_ClockSwitchConfig
 644                     	xref	_CLK_PeripheralClockConfig
 645                     	xref	_CLK_ClockSwitchCmd
 646                     	xref	_CLK_LSICmd
 647                     	xref	_CLK_HSICmd
 648                     	xref	_CLK_HSECmd
 649                     	xref	_CLK_DeInit
 650                     	xref	_delay_ms
 651                     	switch	.const
 652  0009               L53:
 653  0009 4c7800        	dc.b	"Lx",0
 654  000c               L33:
 655  000c 53544d382049  	dc.b	"STM8 I2C",0
 656                     	xref.b	c_lreg
 657                     	xref.b	c_x
 677                     	xref	c_xymvx
 678                     	xref	c_ludv
 679                     	end
