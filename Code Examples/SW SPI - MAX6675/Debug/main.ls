   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     .const:	section	.text
  15  0000               _symbol:
  16  0000 00            	dc.b	0
  17  0001 06            	dc.b	6
  18  0002 09            	dc.b	9
  19  0003 09            	dc.b	9
  20  0004 06            	dc.b	6
  21  0005 00            	dc.b	0
  22  0006 00            	dc.b	0
  23  0007 00            	dc.b	0
  93                     ; 23 void main(void)
  93                     ; 24 {		
  95                     	switch	.text
  96  0000               _main:
  98  0000 5207          	subw	sp,#7
  99       00000007      OFST:	set	7
 102                     ; 25 	unsigned char state = close_contact;
 104                     ; 26 	unsigned int ti = 0x0000;
 106  0002 5f            	clrw	x
 107  0003 1f02          	ldw	(OFST-5,sp),x
 109                     ; 27 	float tf = 0.0;
 111                     ; 29 	clock_setup();
 113  0005 cd009d        	call	_clock_setup
 115                     ; 31 	MAX6675_init();
 117  0008 cd0000        	call	_MAX6675_init
 119                     ; 33 	LCD_init();  
 121  000b cd0000        	call	_LCD_init
 123                     ; 34 	LCD_clear_home(); 
 125  000e cd0000        	call	_LCD_clear_home
 127                     ; 35 	lcd_symbol();
 129  0011 cd0101        	call	_lcd_symbol
 131                     ; 37 	LCD_goto(0, 0);
 133  0014 5f            	clrw	x
 134  0015 cd0000        	call	_LCD_goto
 136                     ; 38 	LCD_putstr("STM8 SW-SPI Test");
 138  0018 ae0063        	ldw	x,#L35
 139  001b cd0000        	call	_LCD_putstr
 141  001e               L55:
 142                     ; 42 		  state = MAX6657_get_ADC(&ti);
 144  001e 96            	ldw	x,sp
 145  001f 1c0002        	addw	x,#OFST-5
 146  0022 cd0000        	call	_MAX6657_get_ADC
 148  0025 6b01          	ld	(OFST-6,sp),a
 150                     ; 44 		  switch(state)
 152  0027 7b01          	ld	a,(OFST-6,sp)
 154                     ; 70 				  break;
 155  0029 4d            	tnz	a
 156  002a 2724          	jreq	L5
 157  002c a004          	sub	a,#4
 158  002e 26ee          	jrne	L55
 159                     ; 48 				  LCD_goto(0, 1);
 161  0030 ae0001        	ldw	x,#1
 162  0033 cd0000        	call	_LCD_goto
 164                     ; 49 				  LCD_putstr("     Error!     ");
 166  0036 ae0052        	ldw	x,#L56
 167  0039 cd0000        	call	_LCD_putstr
 169                     ; 50 				  delay_ms(200);
 171  003c ae00c8        	ldw	x,#200
 172  003f cd0000        	call	_delay_ms
 174                     ; 51 				  LCD_goto(0, 1);
 176  0042 ae0001        	ldw	x,#1
 177  0045 cd0000        	call	_LCD_goto
 179                     ; 52 				  LCD_putstr("                ");
 181  0048 ae0041        	ldw	x,#L76
 182  004b cd0000        	call	_LCD_putstr
 184                     ; 53 				  break;
 186  004e 20ce          	jra	L55
 187  0050               L5:
 188                     ; 57 				  tf = MAX6675_get_T(ti, deg_C);  
 190  0050 4b00          	push	#0
 191  0052 1e03          	ldw	x,(OFST-4,sp)
 192  0054 cd0000        	call	_MAX6675_get_T
 194  0057 84            	pop	a
 195  0058 96            	ldw	x,sp
 196  0059 1c0004        	addw	x,#OFST-3
 197  005c cd0000        	call	c_rtol
 200                     ; 59 				  LCD_goto(0, 1);
 202  005f ae0001        	ldw	x,#1
 203  0062 cd0000        	call	_LCD_goto
 205                     ; 60 				  LCD_putstr("T/              ");
 207  0065 ae0030        	ldw	x,#L17
 208  0068 cd0000        	call	_LCD_putstr
 210                     ; 62 				  LCD_goto(2, 1); 
 212  006b ae0201        	ldw	x,#513
 213  006e cd0000        	call	_LCD_goto
 215                     ; 63 				  LCD_send(0, DAT);
 217  0071 ae0001        	ldw	x,#1
 218  0074 cd0000        	call	_LCD_send
 220                     ; 64 				  LCD_goto(3, 1);
 222  0077 ae0301        	ldw	x,#769
 223  007a cd0000        	call	_LCD_goto
 225                     ; 65 				  LCD_putstr("C:");
 227  007d ae002d        	ldw	x,#L37
 228  0080 cd0000        	call	_LCD_putstr
 230                     ; 67 				  print_F(9, 1, tf, 2);
 232  0083 4b02          	push	#2
 233  0085 1e07          	ldw	x,(OFST+0,sp)
 234  0087 89            	pushw	x
 235  0088 1e07          	ldw	x,(OFST+0,sp)
 236  008a 89            	pushw	x
 237  008b ae0901        	ldw	x,#2305
 238  008e cd04c0        	call	_print_F
 240  0091 5b05          	addw	sp,#5
 241                     ; 68 				  delay_ms(100);
 243  0093 ae0064        	ldw	x,#100
 244  0096 cd0000        	call	_delay_ms
 246                     ; 70 				  break;
 248  0099 2083          	jra	L55
 249  009b               L36:
 251  009b 2081          	jra	L55
 284                     ; 77 void clock_setup(void)
 284                     ; 78 {
 285                     	switch	.text
 286  009d               _clock_setup:
 290                     ; 79 	CLK_DeInit();
 292  009d cd0000        	call	_CLK_DeInit
 294                     ; 81 	CLK_HSECmd(DISABLE);
 296  00a0 4f            	clr	a
 297  00a1 cd0000        	call	_CLK_HSECmd
 299                     ; 82 	CLK_LSICmd(DISABLE);
 301  00a4 4f            	clr	a
 302  00a5 cd0000        	call	_CLK_LSICmd
 304                     ; 83 	CLK_HSICmd(ENABLE);
 306  00a8 a601          	ld	a,#1
 307  00aa cd0000        	call	_CLK_HSICmd
 310  00ad               L701:
 311                     ; 84 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 313  00ad ae0102        	ldw	x,#258
 314  00b0 cd0000        	call	_CLK_GetFlagStatus
 316  00b3 4d            	tnz	a
 317  00b4 27f7          	jreq	L701
 318                     ; 86 	CLK_ClockSwitchCmd(ENABLE);
 320  00b6 a601          	ld	a,#1
 321  00b8 cd0000        	call	_CLK_ClockSwitchCmd
 323                     ; 87 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 325  00bb a618          	ld	a,#24
 326  00bd cd0000        	call	_CLK_HSIPrescalerConfig
 328                     ; 88 											  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 330  00c0 a680          	ld	a,#128
 331  00c2 cd0000        	call	_CLK_SYSCLKConfig
 333                     ; 90 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
 333                     ; 91 											  CLK_SOURCE_HSI, 
 333                     ; 92 											  DISABLE, 
 333                     ; 93 											  CLK_CURRENTCLOCKSTATE_ENABLE);
 335  00c5 4b01          	push	#1
 336  00c7 4b00          	push	#0
 337  00c9 ae01e1        	ldw	x,#481
 338  00cc cd0000        	call	_CLK_ClockSwitchConfig
 340  00cf 85            	popw	x
 341                     ; 95 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 343  00d0 ae0001        	ldw	x,#1
 344  00d3 cd0000        	call	_CLK_PeripheralClockConfig
 346                     ; 96 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 348  00d6 ae0100        	ldw	x,#256
 349  00d9 cd0000        	call	_CLK_PeripheralClockConfig
 351                     ; 97 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 353  00dc ae1300        	ldw	x,#4864
 354  00df cd0000        	call	_CLK_PeripheralClockConfig
 356                     ; 98 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 358  00e2 ae1200        	ldw	x,#4608
 359  00e5 cd0000        	call	_CLK_PeripheralClockConfig
 361                     ; 99 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 363  00e8 ae0300        	ldw	x,#768
 364  00eb cd0000        	call	_CLK_PeripheralClockConfig
 366                     ; 100 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 368  00ee ae0700        	ldw	x,#1792
 369  00f1 cd0000        	call	_CLK_PeripheralClockConfig
 371                     ; 101 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 373  00f4 ae0500        	ldw	x,#1280
 374  00f7 cd0000        	call	_CLK_PeripheralClockConfig
 376                     ; 102 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 378  00fa ae0400        	ldw	x,#1024
 379  00fd cd0000        	call	_CLK_PeripheralClockConfig
 381                     ; 103 }
 384  0100 81            	ret
 420                     ; 106 void lcd_symbol(void)  
 420                     ; 107 {
 421                     	switch	.text
 422  0101               _lcd_symbol:
 424  0101 88            	push	a
 425       00000001      OFST:	set	1
 428                     ; 108 	unsigned char s = 0;  
 430                     ; 110    LCD_send(0x40, CMD);
 432  0102 ae4000        	ldw	x,#16384
 433  0105 cd0000        	call	_LCD_send
 435                     ; 112    for(s = 0; s < 8; s++)
 437  0108 0f01          	clr	(OFST+0,sp)
 439  010a               L131:
 440                     ; 114         LCD_send(symbol[s], DAT);
 442  010a 7b01          	ld	a,(OFST+0,sp)
 443  010c 5f            	clrw	x
 444  010d 97            	ld	xl,a
 445  010e d60000        	ld	a,(_symbol,x)
 446  0111 ae0001        	ldw	x,#1
 447  0114 95            	ld	xh,a
 448  0115 cd0000        	call	_LCD_send
 450                     ; 112    for(s = 0; s < 8; s++)
 452  0118 0c01          	inc	(OFST+0,sp)
 456  011a 7b01          	ld	a,(OFST+0,sp)
 457  011c a108          	cp	a,#8
 458  011e 25ea          	jrult	L131
 459                     ; 117    LCD_send(0x80, CMD);
 461  0120 ae8000        	ldw	x,#32768
 462  0123 cd0000        	call	_LCD_send
 464                     ; 118 } 
 467  0126 84            	pop	a
 468  0127 81            	ret
 471                     	switch	.const
 472  0008               L731_ch:
 473  0008 20            	dc.b	32
 474  0009 20            	dc.b	32
 475  000a 20            	dc.b	32
 476  000b 20            	dc.b	32
 477  000c 00            	dc.b	0
 539                     ; 121 void print_C(unsigned char x_pos, unsigned char y_pos, signed int value)
 539                     ; 122 {
 540                     	switch	.text
 541  0128               _print_C:
 543  0128 89            	pushw	x
 544  0129 5205          	subw	sp,#5
 545       00000005      OFST:	set	5
 548                     ; 123      unsigned char ch[5] = {0x20, 0x20, 0x20, 0x20, '\0'};
 550  012b 96            	ldw	x,sp
 551  012c 1c0001        	addw	x,#OFST-4
 552  012f 90ae0008      	ldw	y,#L731_ch
 553  0133 a605          	ld	a,#5
 554  0135 cd0000        	call	c_xymvx
 556                     ; 125      if(value < 0x00)
 558  0138 9c            	rvf
 559  0139 1e0a          	ldw	x,(OFST+5,sp)
 560  013b 2e0b          	jrsge	L371
 561                     ; 127         ch[0] = 0x2D;
 563  013d a62d          	ld	a,#45
 564  013f 6b01          	ld	(OFST-4,sp),a
 566                     ; 128         value = -value;
 568  0141 1e0a          	ldw	x,(OFST+5,sp)
 569  0143 50            	negw	x
 570  0144 1f0a          	ldw	(OFST+5,sp),x
 572  0146 2004          	jra	L571
 573  0148               L371:
 574                     ; 132         ch[0] = 0x20;
 576  0148 a620          	ld	a,#32
 577  014a 6b01          	ld	(OFST-4,sp),a
 579  014c               L571:
 580                     ; 135      if((value > 99) && (value <= 999))
 582  014c 9c            	rvf
 583  014d 1e0a          	ldw	x,(OFST+5,sp)
 584  014f a30064        	cpw	x,#100
 585  0152 2f39          	jrslt	L771
 587  0154 9c            	rvf
 588  0155 1e0a          	ldw	x,(OFST+5,sp)
 589  0157 a303e8        	cpw	x,#1000
 590  015a 2e31          	jrsge	L771
 591                     ; 137          ch[1] = ((value / 100) + 0x30);
 593  015c 1e0a          	ldw	x,(OFST+5,sp)
 594  015e a664          	ld	a,#100
 595  0160 cd0000        	call	c_sdivx
 597  0163 1c0030        	addw	x,#48
 598  0166 01            	rrwa	x,a
 599  0167 6b02          	ld	(OFST-3,sp),a
 600  0169 02            	rlwa	x,a
 602                     ; 138          ch[2] = (((value % 100) / 10) + 0x30);
 604  016a 1e0a          	ldw	x,(OFST+5,sp)
 605  016c a664          	ld	a,#100
 606  016e cd0000        	call	c_smodx
 608  0171 a60a          	ld	a,#10
 609  0173 cd0000        	call	c_sdivx
 611  0176 1c0030        	addw	x,#48
 612  0179 01            	rrwa	x,a
 613  017a 6b03          	ld	(OFST-2,sp),a
 614  017c 02            	rlwa	x,a
 616                     ; 139          ch[3] = ((value % 10) + 0x30);
 618  017d 1e0a          	ldw	x,(OFST+5,sp)
 619  017f a60a          	ld	a,#10
 620  0181 cd0000        	call	c_smodx
 622  0184 1c0030        	addw	x,#48
 623  0187 01            	rrwa	x,a
 624  0188 6b04          	ld	(OFST-1,sp),a
 625  018a 02            	rlwa	x,a
 628  018b 205a          	jra	L102
 629  018d               L771:
 630                     ; 141      else if((value > 9) && (value <= 99))
 632  018d 9c            	rvf
 633  018e 1e0a          	ldw	x,(OFST+5,sp)
 634  0190 a3000a        	cpw	x,#10
 635  0193 2f2f          	jrslt	L302
 637  0195 9c            	rvf
 638  0196 1e0a          	ldw	x,(OFST+5,sp)
 639  0198 a30064        	cpw	x,#100
 640  019b 2e27          	jrsge	L302
 641                     ; 143          ch[1] = (((value % 100) / 10) + 0x30);
 643  019d 1e0a          	ldw	x,(OFST+5,sp)
 644  019f a664          	ld	a,#100
 645  01a1 cd0000        	call	c_smodx
 647  01a4 a60a          	ld	a,#10
 648  01a6 cd0000        	call	c_sdivx
 650  01a9 1c0030        	addw	x,#48
 651  01ac 01            	rrwa	x,a
 652  01ad 6b02          	ld	(OFST-3,sp),a
 653  01af 02            	rlwa	x,a
 655                     ; 144          ch[2] = ((value % 10) + 0x30);
 657  01b0 1e0a          	ldw	x,(OFST+5,sp)
 658  01b2 a60a          	ld	a,#10
 659  01b4 cd0000        	call	c_smodx
 661  01b7 1c0030        	addw	x,#48
 662  01ba 01            	rrwa	x,a
 663  01bb 6b03          	ld	(OFST-2,sp),a
 664  01bd 02            	rlwa	x,a
 666                     ; 145          ch[3] = 0x20;
 668  01be a620          	ld	a,#32
 669  01c0 6b04          	ld	(OFST-1,sp),a
 672  01c2 2023          	jra	L102
 673  01c4               L302:
 674                     ; 147      else if((value >= 0) && (value <= 9))
 676  01c4 9c            	rvf
 677  01c5 1e0a          	ldw	x,(OFST+5,sp)
 678  01c7 2f1e          	jrslt	L102
 680  01c9 9c            	rvf
 681  01ca 1e0a          	ldw	x,(OFST+5,sp)
 682  01cc a3000a        	cpw	x,#10
 683  01cf 2e16          	jrsge	L102
 684                     ; 149          ch[1] = ((value % 10) + 0x30);
 686  01d1 1e0a          	ldw	x,(OFST+5,sp)
 687  01d3 a60a          	ld	a,#10
 688  01d5 cd0000        	call	c_smodx
 690  01d8 1c0030        	addw	x,#48
 691  01db 01            	rrwa	x,a
 692  01dc 6b02          	ld	(OFST-3,sp),a
 693  01de 02            	rlwa	x,a
 695                     ; 150          ch[2] = 0x20;
 697  01df a620          	ld	a,#32
 698  01e1 6b03          	ld	(OFST-2,sp),a
 700                     ; 151          ch[3] = 0x20;
 702  01e3 a620          	ld	a,#32
 703  01e5 6b04          	ld	(OFST-1,sp),a
 705  01e7               L102:
 706                     ; 154 	 LCD_goto(x_pos, y_pos);
 708  01e7 7b07          	ld	a,(OFST+2,sp)
 709  01e9 97            	ld	xl,a
 710  01ea 7b06          	ld	a,(OFST+1,sp)
 711  01ec 95            	ld	xh,a
 712  01ed cd0000        	call	_LCD_goto
 714                     ; 155      LCD_putstr(ch);
 716  01f0 96            	ldw	x,sp
 717  01f1 1c0001        	addw	x,#OFST-4
 718  01f4 cd0000        	call	_LCD_putstr
 720                     ; 156 }
 723  01f7 5b07          	addw	sp,#7
 724  01f9 81            	ret
 727                     	switch	.const
 728  000d               L112_ch:
 729  000d 20            	dc.b	32
 730  000e 20            	dc.b	32
 731  000f 20            	dc.b	32
 732  0010 20            	dc.b	32
 733  0011 20            	dc.b	32
 734  0012 20            	dc.b	32
 735  0013 00            	dc.b	0
 797                     	switch	.const
 798  0014               L61:
 799  0014 00002710      	dc.l	10000
 800  0018               L02:
 801  0018 000003e8      	dc.l	1000
 802  001c               L22:
 803  001c 00000064      	dc.l	100
 804  0020               L42:
 805  0020 0000000a      	dc.l	10
 806                     ; 159 void print_I(unsigned char x_pos, unsigned char y_pos, signed long value)
 806                     ; 160 {
 807                     	switch	.text
 808  01fa               _print_I:
 810  01fa 89            	pushw	x
 811  01fb 5207          	subw	sp,#7
 812       00000007      OFST:	set	7
 815                     ; 161     unsigned char ch[7] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20, '\0'};
 817  01fd 96            	ldw	x,sp
 818  01fe 1c0001        	addw	x,#OFST-6
 819  0201 90ae000d      	ldw	y,#L112_ch
 820  0205 a607          	ld	a,#7
 821  0207 cd0000        	call	c_xymvx
 823                     ; 163     if(value < 0)
 825  020a 9c            	rvf
 826  020b 9c            	rvf
 827  020c 0d0c          	tnz	(OFST+5,sp)
 828  020e 2e0d          	jrsge	L542
 829                     ; 165         ch[0] = 0x2D;
 831  0210 a62d          	ld	a,#45
 832  0212 6b01          	ld	(OFST-6,sp),a
 834                     ; 166         value = -value;
 836  0214 96            	ldw	x,sp
 837  0215 1c000c        	addw	x,#OFST+5
 838  0218 cd0000        	call	c_lgneg
 841  021b 2004          	jra	L742
 842  021d               L542:
 843                     ; 170         ch[0] = 0x20;
 845  021d a620          	ld	a,#32
 846  021f 6b01          	ld	(OFST-6,sp),a
 848  0221               L742:
 849                     ; 173     if(value > 9999)
 851  0221 9c            	rvf
 852  0222 96            	ldw	x,sp
 853  0223 1c000c        	addw	x,#OFST+5
 854  0226 cd0000        	call	c_ltor
 856  0229 ae0014        	ldw	x,#L61
 857  022c cd0000        	call	c_lcmp
 859  022f 2e03          	jrsge	L62
 860  0231 cc02b8        	jp	L152
 861  0234               L62:
 862                     ; 175         ch[1] = ((value / 10000) + 0x30);
 864  0234 96            	ldw	x,sp
 865  0235 1c000c        	addw	x,#OFST+5
 866  0238 cd0000        	call	c_ltor
 868  023b ae0014        	ldw	x,#L61
 869  023e cd0000        	call	c_ldiv
 871  0241 a630          	ld	a,#48
 872  0243 cd0000        	call	c_ladc
 874  0246 b603          	ld	a,c_lreg+3
 875  0248 6b02          	ld	(OFST-5,sp),a
 877                     ; 176         ch[2] = (((value % 10000)/ 1000) + 0x30);
 879  024a 96            	ldw	x,sp
 880  024b 1c000c        	addw	x,#OFST+5
 881  024e cd0000        	call	c_ltor
 883  0251 ae0014        	ldw	x,#L61
 884  0254 cd0000        	call	c_lmod
 886  0257 ae0018        	ldw	x,#L02
 887  025a cd0000        	call	c_ldiv
 889  025d a630          	ld	a,#48
 890  025f cd0000        	call	c_ladc
 892  0262 b603          	ld	a,c_lreg+3
 893  0264 6b03          	ld	(OFST-4,sp),a
 895                     ; 177         ch[3] = (((value % 1000) / 100) + 0x30);
 897  0266 96            	ldw	x,sp
 898  0267 1c000c        	addw	x,#OFST+5
 899  026a cd0000        	call	c_ltor
 901  026d ae0018        	ldw	x,#L02
 902  0270 cd0000        	call	c_lmod
 904  0273 ae001c        	ldw	x,#L22
 905  0276 cd0000        	call	c_ldiv
 907  0279 a630          	ld	a,#48
 908  027b cd0000        	call	c_ladc
 910  027e b603          	ld	a,c_lreg+3
 911  0280 6b04          	ld	(OFST-3,sp),a
 913                     ; 178         ch[4] = (((value % 100) / 10) + 0x30);
 915  0282 96            	ldw	x,sp
 916  0283 1c000c        	addw	x,#OFST+5
 917  0286 cd0000        	call	c_ltor
 919  0289 ae001c        	ldw	x,#L22
 920  028c cd0000        	call	c_lmod
 922  028f ae0020        	ldw	x,#L42
 923  0292 cd0000        	call	c_ldiv
 925  0295 a630          	ld	a,#48
 926  0297 cd0000        	call	c_ladc
 928  029a b603          	ld	a,c_lreg+3
 929  029c 6b05          	ld	(OFST-2,sp),a
 931                     ; 179         ch[5] = ((value % 10) + 0x30);
 933  029e 96            	ldw	x,sp
 934  029f 1c000c        	addw	x,#OFST+5
 935  02a2 cd0000        	call	c_ltor
 937  02a5 ae0020        	ldw	x,#L42
 938  02a8 cd0000        	call	c_lmod
 940  02ab a630          	ld	a,#48
 941  02ad cd0000        	call	c_ladc
 943  02b0 b603          	ld	a,c_lreg+3
 944  02b2 6b06          	ld	(OFST-1,sp),a
 947  02b4 ac4f044f      	jpf	L352
 948  02b8               L152:
 949                     ; 182     else if((value > 999) && (value <= 9999))
 951  02b8 9c            	rvf
 952  02b9 96            	ldw	x,sp
 953  02ba 1c000c        	addw	x,#OFST+5
 954  02bd cd0000        	call	c_ltor
 956  02c0 ae0018        	ldw	x,#L02
 957  02c3 cd0000        	call	c_lcmp
 959  02c6 2e03          	jrsge	L03
 960  02c8 cc034f        	jp	L552
 961  02cb               L03:
 963  02cb 9c            	rvf
 964  02cc 96            	ldw	x,sp
 965  02cd 1c000c        	addw	x,#OFST+5
 966  02d0 cd0000        	call	c_ltor
 968  02d3 ae0014        	ldw	x,#L61
 969  02d6 cd0000        	call	c_lcmp
 971  02d9 2f02          	jrslt	L23
 972  02db 2072          	jp	L552
 973  02dd               L23:
 974                     ; 184         ch[1] = (((value % 10000)/ 1000) + 0x30);
 976  02dd 96            	ldw	x,sp
 977  02de 1c000c        	addw	x,#OFST+5
 978  02e1 cd0000        	call	c_ltor
 980  02e4 ae0014        	ldw	x,#L61
 981  02e7 cd0000        	call	c_lmod
 983  02ea ae0018        	ldw	x,#L02
 984  02ed cd0000        	call	c_ldiv
 986  02f0 a630          	ld	a,#48
 987  02f2 cd0000        	call	c_ladc
 989  02f5 b603          	ld	a,c_lreg+3
 990  02f7 6b02          	ld	(OFST-5,sp),a
 992                     ; 185         ch[2] = (((value % 1000) / 100) + 0x30);
 994  02f9 96            	ldw	x,sp
 995  02fa 1c000c        	addw	x,#OFST+5
 996  02fd cd0000        	call	c_ltor
 998  0300 ae0018        	ldw	x,#L02
 999  0303 cd0000        	call	c_lmod
1001  0306 ae001c        	ldw	x,#L22
1002  0309 cd0000        	call	c_ldiv
1004  030c a630          	ld	a,#48
1005  030e cd0000        	call	c_ladc
1007  0311 b603          	ld	a,c_lreg+3
1008  0313 6b03          	ld	(OFST-4,sp),a
1010                     ; 186         ch[3] = (((value % 100) / 10) + 0x30);
1012  0315 96            	ldw	x,sp
1013  0316 1c000c        	addw	x,#OFST+5
1014  0319 cd0000        	call	c_ltor
1016  031c ae001c        	ldw	x,#L22
1017  031f cd0000        	call	c_lmod
1019  0322 ae0020        	ldw	x,#L42
1020  0325 cd0000        	call	c_ldiv
1022  0328 a630          	ld	a,#48
1023  032a cd0000        	call	c_ladc
1025  032d b603          	ld	a,c_lreg+3
1026  032f 6b04          	ld	(OFST-3,sp),a
1028                     ; 187         ch[4] = ((value % 10) + 0x30);
1030  0331 96            	ldw	x,sp
1031  0332 1c000c        	addw	x,#OFST+5
1032  0335 cd0000        	call	c_ltor
1034  0338 ae0020        	ldw	x,#L42
1035  033b cd0000        	call	c_lmod
1037  033e a630          	ld	a,#48
1038  0340 cd0000        	call	c_ladc
1040  0343 b603          	ld	a,c_lreg+3
1041  0345 6b05          	ld	(OFST-2,sp),a
1043                     ; 188         ch[5] = 0x20;
1045  0347 a620          	ld	a,#32
1046  0349 6b06          	ld	(OFST-1,sp),a
1049  034b ac4f044f      	jpf	L352
1050  034f               L552:
1051                     ; 190     else if((value > 99) && (value <= 999))
1053  034f 9c            	rvf
1054  0350 96            	ldw	x,sp
1055  0351 1c000c        	addw	x,#OFST+5
1056  0354 cd0000        	call	c_ltor
1058  0357 ae001c        	ldw	x,#L22
1059  035a cd0000        	call	c_lcmp
1061  035d 2f6a          	jrslt	L162
1063  035f 9c            	rvf
1064  0360 96            	ldw	x,sp
1065  0361 1c000c        	addw	x,#OFST+5
1066  0364 cd0000        	call	c_ltor
1068  0367 ae0018        	ldw	x,#L02
1069  036a cd0000        	call	c_lcmp
1071  036d 2e5a          	jrsge	L162
1072                     ; 192         ch[1] = (((value % 1000) / 100) + 0x30);
1074  036f 96            	ldw	x,sp
1075  0370 1c000c        	addw	x,#OFST+5
1076  0373 cd0000        	call	c_ltor
1078  0376 ae0018        	ldw	x,#L02
1079  0379 cd0000        	call	c_lmod
1081  037c ae001c        	ldw	x,#L22
1082  037f cd0000        	call	c_ldiv
1084  0382 a630          	ld	a,#48
1085  0384 cd0000        	call	c_ladc
1087  0387 b603          	ld	a,c_lreg+3
1088  0389 6b02          	ld	(OFST-5,sp),a
1090                     ; 193         ch[2] = (((value % 100) / 10) + 0x30);
1092  038b 96            	ldw	x,sp
1093  038c 1c000c        	addw	x,#OFST+5
1094  038f cd0000        	call	c_ltor
1096  0392 ae001c        	ldw	x,#L22
1097  0395 cd0000        	call	c_lmod
1099  0398 ae0020        	ldw	x,#L42
1100  039b cd0000        	call	c_ldiv
1102  039e a630          	ld	a,#48
1103  03a0 cd0000        	call	c_ladc
1105  03a3 b603          	ld	a,c_lreg+3
1106  03a5 6b03          	ld	(OFST-4,sp),a
1108                     ; 194         ch[3] = ((value % 10) + 0x30);
1110  03a7 96            	ldw	x,sp
1111  03a8 1c000c        	addw	x,#OFST+5
1112  03ab cd0000        	call	c_ltor
1114  03ae ae0020        	ldw	x,#L42
1115  03b1 cd0000        	call	c_lmod
1117  03b4 a630          	ld	a,#48
1118  03b6 cd0000        	call	c_ladc
1120  03b9 b603          	ld	a,c_lreg+3
1121  03bb 6b04          	ld	(OFST-3,sp),a
1123                     ; 195         ch[4] = 0x20;
1125  03bd a620          	ld	a,#32
1126  03bf 6b05          	ld	(OFST-2,sp),a
1128                     ; 196         ch[5] = 0x20;
1130  03c1 a620          	ld	a,#32
1131  03c3 6b06          	ld	(OFST-1,sp),a
1134  03c5 ac4f044f      	jpf	L352
1135  03c9               L162:
1136                     ; 198     else if((value > 9) && (value <= 99))
1138  03c9 9c            	rvf
1139  03ca 96            	ldw	x,sp
1140  03cb 1c000c        	addw	x,#OFST+5
1141  03ce cd0000        	call	c_ltor
1143  03d1 ae0020        	ldw	x,#L42
1144  03d4 cd0000        	call	c_lcmp
1146  03d7 2f50          	jrslt	L562
1148  03d9 9c            	rvf
1149  03da 96            	ldw	x,sp
1150  03db 1c000c        	addw	x,#OFST+5
1151  03de cd0000        	call	c_ltor
1153  03e1 ae001c        	ldw	x,#L22
1154  03e4 cd0000        	call	c_lcmp
1156  03e7 2e40          	jrsge	L562
1157                     ; 200         ch[1] = (((value % 100) / 10) + 0x30);
1159  03e9 96            	ldw	x,sp
1160  03ea 1c000c        	addw	x,#OFST+5
1161  03ed cd0000        	call	c_ltor
1163  03f0 ae001c        	ldw	x,#L22
1164  03f3 cd0000        	call	c_lmod
1166  03f6 ae0020        	ldw	x,#L42
1167  03f9 cd0000        	call	c_ldiv
1169  03fc a630          	ld	a,#48
1170  03fe cd0000        	call	c_ladc
1172  0401 b603          	ld	a,c_lreg+3
1173  0403 6b02          	ld	(OFST-5,sp),a
1175                     ; 201         ch[2] = ((value % 10) + 0x30);
1177  0405 96            	ldw	x,sp
1178  0406 1c000c        	addw	x,#OFST+5
1179  0409 cd0000        	call	c_ltor
1181  040c ae0020        	ldw	x,#L42
1182  040f cd0000        	call	c_lmod
1184  0412 a630          	ld	a,#48
1185  0414 cd0000        	call	c_ladc
1187  0417 b603          	ld	a,c_lreg+3
1188  0419 6b03          	ld	(OFST-4,sp),a
1190                     ; 202         ch[3] = 0x20;
1192  041b a620          	ld	a,#32
1193  041d 6b04          	ld	(OFST-3,sp),a
1195                     ; 203         ch[4] = 0x20;
1197  041f a620          	ld	a,#32
1198  0421 6b05          	ld	(OFST-2,sp),a
1200                     ; 204         ch[5] = 0x20;
1202  0423 a620          	ld	a,#32
1203  0425 6b06          	ld	(OFST-1,sp),a
1206  0427 2026          	jra	L352
1207  0429               L562:
1208                     ; 208         ch[1] = ((value % 10) + 0x30);
1210  0429 96            	ldw	x,sp
1211  042a 1c000c        	addw	x,#OFST+5
1212  042d cd0000        	call	c_ltor
1214  0430 ae0020        	ldw	x,#L42
1215  0433 cd0000        	call	c_lmod
1217  0436 a630          	ld	a,#48
1218  0438 cd0000        	call	c_ladc
1220  043b b603          	ld	a,c_lreg+3
1221  043d 6b02          	ld	(OFST-5,sp),a
1223                     ; 209         ch[2] = 0x20;
1225  043f a620          	ld	a,#32
1226  0441 6b03          	ld	(OFST-4,sp),a
1228                     ; 210         ch[3] = 0x20;
1230  0443 a620          	ld	a,#32
1231  0445 6b04          	ld	(OFST-3,sp),a
1233                     ; 211         ch[4] = 0x20;
1235  0447 a620          	ld	a,#32
1236  0449 6b05          	ld	(OFST-2,sp),a
1238                     ; 212         ch[5] = 0x20;
1240  044b a620          	ld	a,#32
1241  044d 6b06          	ld	(OFST-1,sp),a
1243  044f               L352:
1244                     ; 215     LCD_goto(x_pos, y_pos);
1246  044f 7b09          	ld	a,(OFST+2,sp)
1247  0451 97            	ld	xl,a
1248  0452 7b08          	ld	a,(OFST+1,sp)
1249  0454 95            	ld	xh,a
1250  0455 cd0000        	call	_LCD_goto
1252                     ; 216     LCD_putstr(ch);
1254  0458 96            	ldw	x,sp
1255  0459 1c0001        	addw	x,#OFST-6
1256  045c cd0000        	call	_LCD_putstr
1258                     ; 217 }
1261  045f 5b09          	addw	sp,#9
1262  0461 81            	ret
1265                     	switch	.const
1266  0024               L172_ch:
1267  0024 2e            	dc.b	46
1268  0025 20            	dc.b	32
1269  0026 20            	dc.b	32
1270  0027 00            	dc.b	0
1271  0028 00            	ds.b	1
1342                     ; 220 void print_D(unsigned char x_pos, unsigned char y_pos, signed int value, unsigned char points)
1342                     ; 221 {
1343                     	switch	.text
1344  0462               _print_D:
1346  0462 89            	pushw	x
1347  0463 5205          	subw	sp,#5
1348       00000005      OFST:	set	5
1351                     ; 222     char ch[5] = {0x2E, 0x20, 0x20, '\0'};
1353  0465 96            	ldw	x,sp
1354  0466 1c0001        	addw	x,#OFST-4
1355  0469 90ae0024      	ldw	y,#L172_ch
1356  046d a605          	ld	a,#5
1357  046f cd0000        	call	c_xymvx
1359                     ; 224     ch[1] = ((value / 100) + 0x30);
1361  0472 1e0a          	ldw	x,(OFST+5,sp)
1362  0474 a664          	ld	a,#100
1363  0476 cd0000        	call	c_sdivx
1365  0479 1c0030        	addw	x,#48
1366  047c 01            	rrwa	x,a
1367  047d 6b02          	ld	(OFST-3,sp),a
1368  047f 02            	rlwa	x,a
1370                     ; 226     if(points > 1)
1372  0480 7b0c          	ld	a,(OFST+7,sp)
1373  0482 a102          	cp	a,#2
1374  0484 2527          	jrult	L133
1375                     ; 228         ch[2] = (((value / 10) % 10) + 0x30);
1377  0486 1e0a          	ldw	x,(OFST+5,sp)
1378  0488 a60a          	ld	a,#10
1379  048a cd0000        	call	c_sdivx
1381  048d a60a          	ld	a,#10
1382  048f cd0000        	call	c_smodx
1384  0492 1c0030        	addw	x,#48
1385  0495 01            	rrwa	x,a
1386  0496 6b03          	ld	(OFST-2,sp),a
1387  0498 02            	rlwa	x,a
1389                     ; 230 		if(points > 1)
1391  0499 7b0c          	ld	a,(OFST+7,sp)
1392  049b a102          	cp	a,#2
1393  049d 250e          	jrult	L133
1394                     ; 232 			ch[3] = ((value % 10) + 0x30);
1396  049f 1e0a          	ldw	x,(OFST+5,sp)
1397  04a1 a60a          	ld	a,#10
1398  04a3 cd0000        	call	c_smodx
1400  04a6 1c0030        	addw	x,#48
1401  04a9 01            	rrwa	x,a
1402  04aa 6b04          	ld	(OFST-1,sp),a
1403  04ac 02            	rlwa	x,a
1405  04ad               L133:
1406                     ; 236     LCD_goto(x_pos, y_pos);
1408  04ad 7b07          	ld	a,(OFST+2,sp)
1409  04af 97            	ld	xl,a
1410  04b0 7b06          	ld	a,(OFST+1,sp)
1411  04b2 95            	ld	xh,a
1412  04b3 cd0000        	call	_LCD_goto
1414                     ; 237     LCD_putstr(ch);
1416  04b6 96            	ldw	x,sp
1417  04b7 1c0001        	addw	x,#OFST-4
1418  04ba cd0000        	call	_LCD_putstr
1420                     ; 238 }
1423  04bd 5b07          	addw	sp,#7
1424  04bf 81            	ret
1498                     ; 241 void print_F(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points)
1498                     ; 242 {
1499                     	switch	.text
1500  04c0               _print_F:
1502  04c0 89            	pushw	x
1503  04c1 5208          	subw	sp,#8
1504       00000008      OFST:	set	8
1507                     ; 243     signed long tmp = 0x0000;
1509                     ; 245     tmp = value;
1511  04c3 96            	ldw	x,sp
1512  04c4 1c000d        	addw	x,#OFST+5
1513  04c7 cd0000        	call	c_ltor
1515  04ca cd0000        	call	c_ftol
1517  04cd 96            	ldw	x,sp
1518  04ce 1c0005        	addw	x,#OFST-3
1519  04d1 cd0000        	call	c_rtol
1522                     ; 246     print_I(x_pos, y_pos, tmp);
1524  04d4 1e07          	ldw	x,(OFST-1,sp)
1525  04d6 89            	pushw	x
1526  04d7 1e07          	ldw	x,(OFST-1,sp)
1527  04d9 89            	pushw	x
1528  04da 7b0e          	ld	a,(OFST+6,sp)
1529  04dc 97            	ld	xl,a
1530  04dd 7b0d          	ld	a,(OFST+5,sp)
1531  04df 95            	ld	xh,a
1532  04e0 cd01fa        	call	_print_I
1534  04e3 5b04          	addw	sp,#4
1535                     ; 247     tmp = ((value - tmp) * 1000);
1537  04e5 96            	ldw	x,sp
1538  04e6 1c0005        	addw	x,#OFST-3
1539  04e9 cd0000        	call	c_ltor
1541  04ec cd0000        	call	c_ltof
1543  04ef 96            	ldw	x,sp
1544  04f0 1c0001        	addw	x,#OFST-7
1545  04f3 cd0000        	call	c_rtol
1548  04f6 96            	ldw	x,sp
1549  04f7 1c000d        	addw	x,#OFST+5
1550  04fa cd0000        	call	c_ltor
1552  04fd 96            	ldw	x,sp
1553  04fe 1c0001        	addw	x,#OFST-7
1554  0501 cd0000        	call	c_fsub
1556  0504 ae0029        	ldw	x,#L773
1557  0507 cd0000        	call	c_fmul
1559  050a cd0000        	call	c_ftol
1561  050d 96            	ldw	x,sp
1562  050e 1c0005        	addw	x,#OFST-3
1563  0511 cd0000        	call	c_rtol
1566                     ; 249     if(tmp < 0)
1568  0514 9c            	rvf
1569  0515 9c            	rvf
1570  0516 0d05          	tnz	(OFST-3,sp)
1571  0518 2e07          	jrsge	L304
1572                     ; 251        tmp = -tmp;
1574  051a 96            	ldw	x,sp
1575  051b 1c0005        	addw	x,#OFST-3
1576  051e cd0000        	call	c_lgneg
1579  0521               L304:
1580                     ; 254     if(value < 0)
1582  0521 9c            	rvf
1583  0522 9c            	rvf
1584  0523 0d0d          	tnz	(OFST+5,sp)
1585  0525 2e17          	jrsge	L504
1586                     ; 256         value = -value;
1588  0527 96            	ldw	x,sp
1589  0528 1c000d        	addw	x,#OFST+5
1590  052b cd0000        	call	c_fgneg
1592                     ; 257 		LCD_goto(x_pos, y_pos);
1594  052e 7b0a          	ld	a,(OFST+2,sp)
1595  0530 97            	ld	xl,a
1596  0531 7b09          	ld	a,(OFST+1,sp)
1597  0533 95            	ld	xh,a
1598  0534 cd0000        	call	_LCD_goto
1600                     ; 258         LCD_putchar(0x2D);
1602  0537 a62d          	ld	a,#45
1603  0539 cd0000        	call	_LCD_putchar
1606  053c 200e          	jra	L704
1607  053e               L504:
1608                     ; 262         LCD_goto(x_pos, y_pos);
1610  053e 7b0a          	ld	a,(OFST+2,sp)
1611  0540 97            	ld	xl,a
1612  0541 7b09          	ld	a,(OFST+1,sp)
1613  0543 95            	ld	xh,a
1614  0544 cd0000        	call	_LCD_goto
1616                     ; 263         LCD_putchar(0x20);
1618  0547 a620          	ld	a,#32
1619  0549 cd0000        	call	_LCD_putchar
1621  054c               L704:
1622                     ; 266     if((value >= 10000) && (value < 100000))
1624  054c 9c            	rvf
1625  054d ae2710        	ldw	x,#10000
1626  0550 cd0000        	call	c_itof
1628  0553 96            	ldw	x,sp
1629  0554 1c0001        	addw	x,#OFST-7
1630  0557 cd0000        	call	c_rtol
1633  055a 96            	ldw	x,sp
1634  055b 1c000d        	addw	x,#OFST+5
1635  055e cd0000        	call	c_ltor
1637  0561 96            	ldw	x,sp
1638  0562 1c0001        	addw	x,#OFST-7
1639  0565 cd0000        	call	c_fcmp
1641  0568 2f3c          	jrslt	L114
1643  056a 9c            	rvf
1644  056b ae86a0        	ldw	x,#34464
1645  056e bf02          	ldw	c_lreg+2,x
1646  0570 ae0001        	ldw	x,#1
1647  0573 bf00          	ldw	c_lreg,x
1648  0575 cd0000        	call	c_ltof
1650  0578 96            	ldw	x,sp
1651  0579 1c0001        	addw	x,#OFST-7
1652  057c cd0000        	call	c_rtol
1655  057f 96            	ldw	x,sp
1656  0580 1c000d        	addw	x,#OFST+5
1657  0583 cd0000        	call	c_ltor
1659  0586 96            	ldw	x,sp
1660  0587 1c0001        	addw	x,#OFST-7
1661  058a cd0000        	call	c_fcmp
1663  058d 2e17          	jrsge	L114
1664                     ; 268         print_D((x_pos + 6), y_pos, tmp, points);
1666  058f 7b11          	ld	a,(OFST+9,sp)
1667  0591 88            	push	a
1668  0592 1e08          	ldw	x,(OFST+0,sp)
1669  0594 89            	pushw	x
1670  0595 7b0d          	ld	a,(OFST+5,sp)
1671  0597 97            	ld	xl,a
1672  0598 7b0c          	ld	a,(OFST+4,sp)
1673  059a ab06          	add	a,#6
1674  059c 95            	ld	xh,a
1675  059d cd0462        	call	_print_D
1677  05a0 5b03          	addw	sp,#3
1679  05a2 acca06ca      	jpf	L314
1680  05a6               L114:
1681                     ; 270     else if((value >= 1000) && (value < 10000))
1683  05a6 9c            	rvf
1684  05a7 ae03e8        	ldw	x,#1000
1685  05aa cd0000        	call	c_itof
1687  05ad 96            	ldw	x,sp
1688  05ae 1c0001        	addw	x,#OFST-7
1689  05b1 cd0000        	call	c_rtol
1692  05b4 96            	ldw	x,sp
1693  05b5 1c000d        	addw	x,#OFST+5
1694  05b8 cd0000        	call	c_ltor
1696  05bb 96            	ldw	x,sp
1697  05bc 1c0001        	addw	x,#OFST-7
1698  05bf cd0000        	call	c_fcmp
1700  05c2 2f35          	jrslt	L514
1702  05c4 9c            	rvf
1703  05c5 ae2710        	ldw	x,#10000
1704  05c8 cd0000        	call	c_itof
1706  05cb 96            	ldw	x,sp
1707  05cc 1c0001        	addw	x,#OFST-7
1708  05cf cd0000        	call	c_rtol
1711  05d2 96            	ldw	x,sp
1712  05d3 1c000d        	addw	x,#OFST+5
1713  05d6 cd0000        	call	c_ltor
1715  05d9 96            	ldw	x,sp
1716  05da 1c0001        	addw	x,#OFST-7
1717  05dd cd0000        	call	c_fcmp
1719  05e0 2e17          	jrsge	L514
1720                     ; 272         print_D((x_pos + 5), y_pos, tmp, points);
1722  05e2 7b11          	ld	a,(OFST+9,sp)
1723  05e4 88            	push	a
1724  05e5 1e08          	ldw	x,(OFST+0,sp)
1725  05e7 89            	pushw	x
1726  05e8 7b0d          	ld	a,(OFST+5,sp)
1727  05ea 97            	ld	xl,a
1728  05eb 7b0c          	ld	a,(OFST+4,sp)
1729  05ed ab05          	add	a,#5
1730  05ef 95            	ld	xh,a
1731  05f0 cd0462        	call	_print_D
1733  05f3 5b03          	addw	sp,#3
1735  05f5 acca06ca      	jpf	L314
1736  05f9               L514:
1737                     ; 274     else if((value >= 100) && (value < 1000))
1739  05f9 9c            	rvf
1740  05fa a664          	ld	a,#100
1741  05fc cd0000        	call	c_ctof
1743  05ff 96            	ldw	x,sp
1744  0600 1c0001        	addw	x,#OFST-7
1745  0603 cd0000        	call	c_rtol
1748  0606 96            	ldw	x,sp
1749  0607 1c000d        	addw	x,#OFST+5
1750  060a cd0000        	call	c_ltor
1752  060d 96            	ldw	x,sp
1753  060e 1c0001        	addw	x,#OFST-7
1754  0611 cd0000        	call	c_fcmp
1756  0614 2f35          	jrslt	L124
1758  0616 9c            	rvf
1759  0617 ae03e8        	ldw	x,#1000
1760  061a cd0000        	call	c_itof
1762  061d 96            	ldw	x,sp
1763  061e 1c0001        	addw	x,#OFST-7
1764  0621 cd0000        	call	c_rtol
1767  0624 96            	ldw	x,sp
1768  0625 1c000d        	addw	x,#OFST+5
1769  0628 cd0000        	call	c_ltor
1771  062b 96            	ldw	x,sp
1772  062c 1c0001        	addw	x,#OFST-7
1773  062f cd0000        	call	c_fcmp
1775  0632 2e17          	jrsge	L124
1776                     ; 276         print_D((x_pos + 4), y_pos, tmp, points);
1778  0634 7b11          	ld	a,(OFST+9,sp)
1779  0636 88            	push	a
1780  0637 1e08          	ldw	x,(OFST+0,sp)
1781  0639 89            	pushw	x
1782  063a 7b0d          	ld	a,(OFST+5,sp)
1783  063c 97            	ld	xl,a
1784  063d 7b0c          	ld	a,(OFST+4,sp)
1785  063f ab04          	add	a,#4
1786  0641 95            	ld	xh,a
1787  0642 cd0462        	call	_print_D
1789  0645 5b03          	addw	sp,#3
1791  0647 acca06ca      	jpf	L314
1792  064b               L124:
1793                     ; 278     else if((value >= 10) && (value < 100))
1795  064b 9c            	rvf
1796  064c a60a          	ld	a,#10
1797  064e cd0000        	call	c_ctof
1799  0651 96            	ldw	x,sp
1800  0652 1c0001        	addw	x,#OFST-7
1801  0655 cd0000        	call	c_rtol
1804  0658 96            	ldw	x,sp
1805  0659 1c000d        	addw	x,#OFST+5
1806  065c cd0000        	call	c_ltor
1808  065f 96            	ldw	x,sp
1809  0660 1c0001        	addw	x,#OFST-7
1810  0663 cd0000        	call	c_fcmp
1812  0666 2f32          	jrslt	L524
1814  0668 9c            	rvf
1815  0669 a664          	ld	a,#100
1816  066b cd0000        	call	c_ctof
1818  066e 96            	ldw	x,sp
1819  066f 1c0001        	addw	x,#OFST-7
1820  0672 cd0000        	call	c_rtol
1823  0675 96            	ldw	x,sp
1824  0676 1c000d        	addw	x,#OFST+5
1825  0679 cd0000        	call	c_ltor
1827  067c 96            	ldw	x,sp
1828  067d 1c0001        	addw	x,#OFST-7
1829  0680 cd0000        	call	c_fcmp
1831  0683 2e15          	jrsge	L524
1832                     ; 280         print_D((x_pos + 3), y_pos, tmp, points);
1834  0685 7b11          	ld	a,(OFST+9,sp)
1835  0687 88            	push	a
1836  0688 1e08          	ldw	x,(OFST+0,sp)
1837  068a 89            	pushw	x
1838  068b 7b0d          	ld	a,(OFST+5,sp)
1839  068d 97            	ld	xl,a
1840  068e 7b0c          	ld	a,(OFST+4,sp)
1841  0690 ab03          	add	a,#3
1842  0692 95            	ld	xh,a
1843  0693 cd0462        	call	_print_D
1845  0696 5b03          	addw	sp,#3
1847  0698 2030          	jra	L314
1848  069a               L524:
1849                     ; 282     else if(value < 10)
1851  069a 9c            	rvf
1852  069b a60a          	ld	a,#10
1853  069d cd0000        	call	c_ctof
1855  06a0 96            	ldw	x,sp
1856  06a1 1c0001        	addw	x,#OFST-7
1857  06a4 cd0000        	call	c_rtol
1860  06a7 96            	ldw	x,sp
1861  06a8 1c000d        	addw	x,#OFST+5
1862  06ab cd0000        	call	c_ltor
1864  06ae 96            	ldw	x,sp
1865  06af 1c0001        	addw	x,#OFST-7
1866  06b2 cd0000        	call	c_fcmp
1868  06b5 2e13          	jrsge	L314
1869                     ; 284         print_D((x_pos + 2), y_pos, tmp, points);
1871  06b7 7b11          	ld	a,(OFST+9,sp)
1872  06b9 88            	push	a
1873  06ba 1e08          	ldw	x,(OFST+0,sp)
1874  06bc 89            	pushw	x
1875  06bd 7b0d          	ld	a,(OFST+5,sp)
1876  06bf 97            	ld	xl,a
1877  06c0 7b0c          	ld	a,(OFST+4,sp)
1878  06c2 ab02          	add	a,#2
1879  06c4 95            	ld	xh,a
1880  06c5 cd0462        	call	_print_D
1882  06c8 5b03          	addw	sp,#3
1883  06ca               L314:
1884                     ; 286 }
1887  06ca 5b0a          	addw	sp,#10
1888  06cc 81            	ret
1931                     	xdef	_main
1932                     	xdef	_print_F
1933                     	xdef	_print_D
1934                     	xdef	_print_I
1935                     	xdef	_print_C
1936                     	xdef	_lcd_symbol
1937                     	xdef	_clock_setup
1938                     	xdef	_symbol
1939                     	xref	_LCD_goto
1940                     	xref	_LCD_clear_home
1941                     	xref	_LCD_putchar
1942                     	xref	_LCD_putstr
1943                     	xref	_LCD_send
1944                     	xref	_LCD_init
1945                     	switch	.ubsct
1946  0000               _data_value:
1947  0000 00            	ds.b	1
1948                     	xdef	_data_value
1949  0001               _bl_state:
1950  0001 00            	ds.b	1
1951                     	xdef	_bl_state
1952                     	xref	_MAX6675_get_T
1953                     	xref	_MAX6657_get_ADC
1954                     	xref	_MAX6675_init
1955                     	xref	_CLK_GetFlagStatus
1956                     	xref	_CLK_SYSCLKConfig
1957                     	xref	_CLK_HSIPrescalerConfig
1958                     	xref	_CLK_ClockSwitchConfig
1959                     	xref	_CLK_PeripheralClockConfig
1960                     	xref	_CLK_ClockSwitchCmd
1961                     	xref	_CLK_LSICmd
1962                     	xref	_CLK_HSICmd
1963                     	xref	_CLK_HSECmd
1964                     	xref	_CLK_DeInit
1965                     	xref	_delay_ms
1966                     	switch	.const
1967  0029               L773:
1968  0029 447a0000      	dc.w	17530,0
1969  002d               L37:
1970  002d 433a00        	dc.b	"C:",0
1971  0030               L17:
1972  0030 542f20202020  	dc.b	"T/              ",0
1973  0041               L76:
1974  0041 202020202020  	dc.b	"                ",0
1975  0052               L56:
1976  0052 202020202045  	dc.b	"     Error!     ",0
1977  0063               L35:
1978  0063 53544d382053  	dc.b	"STM8 SW-SPI Test",0
1979  0074               L74:
1980  0074 00000000      	dc.w	0,0
1981                     	xref.b	c_lreg
1982                     	xref.b	c_x
2002                     	xref	c_ctof
2003                     	xref	c_fcmp
2004                     	xref	c_itof
2005                     	xref	c_fgneg
2006                     	xref	c_fmul
2007                     	xref	c_fsub
2008                     	xref	c_ltof
2009                     	xref	c_ftol
2010                     	xref	c_lmod
2011                     	xref	c_ladc
2012                     	xref	c_ldiv
2013                     	xref	c_lcmp
2014                     	xref	c_ltor
2015                     	xref	c_lgneg
2016                     	xref	c_smodx
2017                     	xref	c_sdivx
2018                     	xref	c_xymvx
2019                     	xref	c_rtol
2020                     	end
