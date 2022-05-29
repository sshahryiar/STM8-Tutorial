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
  75                     ; 24 void main(void)
  75                     ; 25 {		
  77                     	switch	.text
  78  0000               _main:
  80  0000 5204          	subw	sp,#4
  81       00000004      OFST:	set	4
  84                     ; 26 	float temp = 0.0;
  86                     ; 28 	clock_setup();
  88  0002 ad53          	call	_clock_setup
  90                     ; 29 	GPIO_setup();
  92  0004 cd00ba        	call	_GPIO_setup
  94                     ; 31 	DS18B20_init();
  96  0007 cd0000        	call	_DS18B20_init
  98                     ; 33 	LCD_init();  
 100  000a cd0000        	call	_LCD_init
 102                     ; 34 	LCD_clear_home(); 
 104  000d cd0000        	call	_LCD_clear_home
 106                     ; 35 	lcd_symbol();
 108  0010 cd00c1        	call	_lcd_symbol
 110                     ; 37 	LCD_goto(0, 0);
 112  0013 5f            	clrw	x
 113  0014 cd0000        	call	_LCD_goto
 115                     ; 38 	LCD_putstr("STM8 DS18B20 Ex.");
 117  0017 ae0032        	ldw	x,#L73
 118  001a cd0000        	call	_LCD_putstr
 120                     ; 40 	LCD_goto(0, 1); 
 122  001d ae0001        	ldw	x,#1
 123  0020 cd0000        	call	_LCD_goto
 125                     ; 41     LCD_putstr("T/ C");
 127  0023 ae002d        	ldw	x,#L14
 128  0026 cd0000        	call	_LCD_putstr
 130                     ; 42     LCD_goto(2, 1); 
 132  0029 ae0201        	ldw	x,#513
 133  002c cd0000        	call	_LCD_goto
 135                     ; 43     LCD_send(0, DAT);
 137  002f ae0001        	ldw	x,#1
 138  0032 cd0000        	call	_LCD_send
 140  0035               L34:
 141                     ; 47 		temp = DS18B20_get_temperature();
 143  0035 cd0000        	call	_DS18B20_get_temperature
 145  0038 96            	ldw	x,sp
 146  0039 1c0001        	addw	x,#OFST-3
 147  003c cd0000        	call	c_rtol
 150                     ; 48 		print_F(9, 1, temp, 3);
 152  003f 4b03          	push	#3
 153  0041 1e04          	ldw	x,(OFST+0,sp)
 154  0043 89            	pushw	x
 155  0044 1e04          	ldw	x,(OFST+0,sp)
 156  0046 89            	pushw	x
 157  0047 ae0901        	ldw	x,#2305
 158  004a cd0480        	call	_print_F
 160  004d 5b05          	addw	sp,#5
 161                     ; 49 		delay_ms(600);
 163  004f ae0258        	ldw	x,#600
 164  0052 cd0000        	call	_delay_ms
 167  0055 20de          	jra	L34
 200                     ; 54 void clock_setup(void)
 200                     ; 55 {
 201                     	switch	.text
 202  0057               _clock_setup:
 206                     ; 56 	CLK_DeInit();
 208  0057 cd0000        	call	_CLK_DeInit
 210                     ; 58 	CLK_HSECmd(DISABLE);
 212  005a 4f            	clr	a
 213  005b cd0000        	call	_CLK_HSECmd
 215                     ; 59 	CLK_LSICmd(DISABLE);
 217  005e 4f            	clr	a
 218  005f cd0000        	call	_CLK_LSICmd
 220                     ; 60 	CLK_HSICmd(ENABLE);
 222  0062 a601          	ld	a,#1
 223  0064 cd0000        	call	_CLK_HSICmd
 226  0067               L16:
 227                     ; 61 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 229  0067 ae0102        	ldw	x,#258
 230  006a cd0000        	call	_CLK_GetFlagStatus
 232  006d 4d            	tnz	a
 233  006e 27f7          	jreq	L16
 234                     ; 63 	CLK_ClockSwitchCmd(ENABLE);
 236  0070 a601          	ld	a,#1
 237  0072 cd0000        	call	_CLK_ClockSwitchCmd
 239                     ; 64 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 241  0075 4f            	clr	a
 242  0076 cd0000        	call	_CLK_HSIPrescalerConfig
 244                     ; 65 											  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 246  0079 a680          	ld	a,#128
 247  007b cd0000        	call	_CLK_SYSCLKConfig
 249                     ; 67 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
 249                     ; 68 											  CLK_SOURCE_HSI, 
 249                     ; 69 											  DISABLE, 
 249                     ; 70 											  CLK_CURRENTCLOCKSTATE_ENABLE);
 251  007e 4b01          	push	#1
 252  0080 4b00          	push	#0
 253  0082 ae01e1        	ldw	x,#481
 254  0085 cd0000        	call	_CLK_ClockSwitchConfig
 256  0088 85            	popw	x
 257                     ; 72 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 259  0089 ae0001        	ldw	x,#1
 260  008c cd0000        	call	_CLK_PeripheralClockConfig
 262                     ; 73 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 264  008f ae0100        	ldw	x,#256
 265  0092 cd0000        	call	_CLK_PeripheralClockConfig
 267                     ; 74 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 269  0095 ae1300        	ldw	x,#4864
 270  0098 cd0000        	call	_CLK_PeripheralClockConfig
 272                     ; 75 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 274  009b ae1200        	ldw	x,#4608
 275  009e cd0000        	call	_CLK_PeripheralClockConfig
 277                     ; 76 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 279  00a1 ae0300        	ldw	x,#768
 280  00a4 cd0000        	call	_CLK_PeripheralClockConfig
 282                     ; 77 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 284  00a7 ae0700        	ldw	x,#1792
 285  00aa cd0000        	call	_CLK_PeripheralClockConfig
 287                     ; 78 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 289  00ad ae0500        	ldw	x,#1280
 290  00b0 cd0000        	call	_CLK_PeripheralClockConfig
 292                     ; 79 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 294  00b3 ae0400        	ldw	x,#1024
 295  00b6 cd0000        	call	_CLK_PeripheralClockConfig
 297                     ; 80 }
 300  00b9 81            	ret
 324                     ; 83 void GPIO_setup(void)
 324                     ; 84 {
 325                     	switch	.text
 326  00ba               _GPIO_setup:
 330                     ; 85 	GPIO_DeInit(DS18B20_port);
 332  00ba ae500f        	ldw	x,#20495
 333  00bd cd0000        	call	_GPIO_DeInit
 335                     ; 86 }
 338  00c0 81            	ret
 374                     ; 89 void lcd_symbol(void)  
 374                     ; 90 {
 375                     	switch	.text
 376  00c1               _lcd_symbol:
 378  00c1 88            	push	a
 379       00000001      OFST:	set	1
 382                     ; 91 	unsigned char s = 0;  
 384                     ; 93    LCD_send(0x40, CMD);
 386  00c2 ae4000        	ldw	x,#16384
 387  00c5 cd0000        	call	_LCD_send
 389                     ; 95    for(s = 0; s < 8; s++)
 391  00c8 0f01          	clr	(OFST+0,sp)
 393  00ca               L311:
 394                     ; 97         LCD_send(symbol[s], DAT);
 396  00ca 7b01          	ld	a,(OFST+0,sp)
 397  00cc 5f            	clrw	x
 398  00cd 97            	ld	xl,a
 399  00ce d60000        	ld	a,(_symbol,x)
 400  00d1 ae0001        	ldw	x,#1
 401  00d4 95            	ld	xh,a
 402  00d5 cd0000        	call	_LCD_send
 404                     ; 95    for(s = 0; s < 8; s++)
 406  00d8 0c01          	inc	(OFST+0,sp)
 410  00da 7b01          	ld	a,(OFST+0,sp)
 411  00dc a108          	cp	a,#8
 412  00de 25ea          	jrult	L311
 413                     ; 100    LCD_send(0x80, CMD);
 415  00e0 ae8000        	ldw	x,#32768
 416  00e3 cd0000        	call	_LCD_send
 418                     ; 101 } 
 421  00e6 84            	pop	a
 422  00e7 81            	ret
 425                     	switch	.const
 426  0008               L121_ch:
 427  0008 20            	dc.b	32
 428  0009 20            	dc.b	32
 429  000a 20            	dc.b	32
 430  000b 20            	dc.b	32
 431  000c 00            	dc.b	0
 493                     ; 104 void print_C(unsigned char x_pos, unsigned char y_pos, signed int value)
 493                     ; 105 {
 494                     	switch	.text
 495  00e8               _print_C:
 497  00e8 89            	pushw	x
 498  00e9 5205          	subw	sp,#5
 499       00000005      OFST:	set	5
 502                     ; 106      unsigned char ch[5] = {0x20, 0x20, 0x20, 0x20, '\0'};
 504  00eb 96            	ldw	x,sp
 505  00ec 1c0001        	addw	x,#OFST-4
 506  00ef 90ae0008      	ldw	y,#L121_ch
 507  00f3 a605          	ld	a,#5
 508  00f5 cd0000        	call	c_xymvx
 510                     ; 108      if(value < 0x00)
 512  00f8 9c            	rvf
 513  00f9 1e0a          	ldw	x,(OFST+5,sp)
 514  00fb 2e0b          	jrsge	L551
 515                     ; 110         ch[0] = 0x2D;
 517  00fd a62d          	ld	a,#45
 518  00ff 6b01          	ld	(OFST-4,sp),a
 520                     ; 111         value = -value;
 522  0101 1e0a          	ldw	x,(OFST+5,sp)
 523  0103 50            	negw	x
 524  0104 1f0a          	ldw	(OFST+5,sp),x
 526  0106 2004          	jra	L751
 527  0108               L551:
 528                     ; 115         ch[0] = 0x20;
 530  0108 a620          	ld	a,#32
 531  010a 6b01          	ld	(OFST-4,sp),a
 533  010c               L751:
 534                     ; 118      if((value > 99) && (value <= 999))
 536  010c 9c            	rvf
 537  010d 1e0a          	ldw	x,(OFST+5,sp)
 538  010f a30064        	cpw	x,#100
 539  0112 2f39          	jrslt	L161
 541  0114 9c            	rvf
 542  0115 1e0a          	ldw	x,(OFST+5,sp)
 543  0117 a303e8        	cpw	x,#1000
 544  011a 2e31          	jrsge	L161
 545                     ; 120          ch[1] = ((value / 100) + 0x30);
 547  011c 1e0a          	ldw	x,(OFST+5,sp)
 548  011e a664          	ld	a,#100
 549  0120 cd0000        	call	c_sdivx
 551  0123 1c0030        	addw	x,#48
 552  0126 01            	rrwa	x,a
 553  0127 6b02          	ld	(OFST-3,sp),a
 554  0129 02            	rlwa	x,a
 556                     ; 121          ch[2] = (((value % 100) / 10) + 0x30);
 558  012a 1e0a          	ldw	x,(OFST+5,sp)
 559  012c a664          	ld	a,#100
 560  012e cd0000        	call	c_smodx
 562  0131 a60a          	ld	a,#10
 563  0133 cd0000        	call	c_sdivx
 565  0136 1c0030        	addw	x,#48
 566  0139 01            	rrwa	x,a
 567  013a 6b03          	ld	(OFST-2,sp),a
 568  013c 02            	rlwa	x,a
 570                     ; 122          ch[3] = ((value % 10) + 0x30);
 572  013d 1e0a          	ldw	x,(OFST+5,sp)
 573  013f a60a          	ld	a,#10
 574  0141 cd0000        	call	c_smodx
 576  0144 1c0030        	addw	x,#48
 577  0147 01            	rrwa	x,a
 578  0148 6b04          	ld	(OFST-1,sp),a
 579  014a 02            	rlwa	x,a
 582  014b 205a          	jra	L361
 583  014d               L161:
 584                     ; 124      else if((value > 9) && (value <= 99))
 586  014d 9c            	rvf
 587  014e 1e0a          	ldw	x,(OFST+5,sp)
 588  0150 a3000a        	cpw	x,#10
 589  0153 2f2f          	jrslt	L561
 591  0155 9c            	rvf
 592  0156 1e0a          	ldw	x,(OFST+5,sp)
 593  0158 a30064        	cpw	x,#100
 594  015b 2e27          	jrsge	L561
 595                     ; 126          ch[1] = (((value % 100) / 10) + 0x30);
 597  015d 1e0a          	ldw	x,(OFST+5,sp)
 598  015f a664          	ld	a,#100
 599  0161 cd0000        	call	c_smodx
 601  0164 a60a          	ld	a,#10
 602  0166 cd0000        	call	c_sdivx
 604  0169 1c0030        	addw	x,#48
 605  016c 01            	rrwa	x,a
 606  016d 6b02          	ld	(OFST-3,sp),a
 607  016f 02            	rlwa	x,a
 609                     ; 127          ch[2] = ((value % 10) + 0x30);
 611  0170 1e0a          	ldw	x,(OFST+5,sp)
 612  0172 a60a          	ld	a,#10
 613  0174 cd0000        	call	c_smodx
 615  0177 1c0030        	addw	x,#48
 616  017a 01            	rrwa	x,a
 617  017b 6b03          	ld	(OFST-2,sp),a
 618  017d 02            	rlwa	x,a
 620                     ; 128          ch[3] = 0x20;
 622  017e a620          	ld	a,#32
 623  0180 6b04          	ld	(OFST-1,sp),a
 626  0182 2023          	jra	L361
 627  0184               L561:
 628                     ; 130      else if((value >= 0) && (value <= 9))
 630  0184 9c            	rvf
 631  0185 1e0a          	ldw	x,(OFST+5,sp)
 632  0187 2f1e          	jrslt	L361
 634  0189 9c            	rvf
 635  018a 1e0a          	ldw	x,(OFST+5,sp)
 636  018c a3000a        	cpw	x,#10
 637  018f 2e16          	jrsge	L361
 638                     ; 132          ch[1] = ((value % 10) + 0x30);
 640  0191 1e0a          	ldw	x,(OFST+5,sp)
 641  0193 a60a          	ld	a,#10
 642  0195 cd0000        	call	c_smodx
 644  0198 1c0030        	addw	x,#48
 645  019b 01            	rrwa	x,a
 646  019c 6b02          	ld	(OFST-3,sp),a
 647  019e 02            	rlwa	x,a
 649                     ; 133          ch[2] = 0x20;
 651  019f a620          	ld	a,#32
 652  01a1 6b03          	ld	(OFST-2,sp),a
 654                     ; 134          ch[3] = 0x20;
 656  01a3 a620          	ld	a,#32
 657  01a5 6b04          	ld	(OFST-1,sp),a
 659  01a7               L361:
 660                     ; 137 	 LCD_goto(x_pos, y_pos);
 662  01a7 7b07          	ld	a,(OFST+2,sp)
 663  01a9 97            	ld	xl,a
 664  01aa 7b06          	ld	a,(OFST+1,sp)
 665  01ac 95            	ld	xh,a
 666  01ad cd0000        	call	_LCD_goto
 668                     ; 138      LCD_putstr(ch);
 670  01b0 96            	ldw	x,sp
 671  01b1 1c0001        	addw	x,#OFST-4
 672  01b4 cd0000        	call	_LCD_putstr
 674                     ; 139 }
 677  01b7 5b07          	addw	sp,#7
 678  01b9 81            	ret
 681                     	switch	.const
 682  000d               L371_ch:
 683  000d 20            	dc.b	32
 684  000e 20            	dc.b	32
 685  000f 20            	dc.b	32
 686  0010 20            	dc.b	32
 687  0011 20            	dc.b	32
 688  0012 20            	dc.b	32
 689  0013 00            	dc.b	0
 751                     	switch	.const
 752  0014               L02:
 753  0014 00002710      	dc.l	10000
 754  0018               L22:
 755  0018 000003e8      	dc.l	1000
 756  001c               L42:
 757  001c 00000064      	dc.l	100
 758  0020               L62:
 759  0020 0000000a      	dc.l	10
 760                     ; 142 void print_I(unsigned char x_pos, unsigned char y_pos, signed long value)
 760                     ; 143 {
 761                     	switch	.text
 762  01ba               _print_I:
 764  01ba 89            	pushw	x
 765  01bb 5207          	subw	sp,#7
 766       00000007      OFST:	set	7
 769                     ; 144     unsigned char ch[7] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20, '\0'};
 771  01bd 96            	ldw	x,sp
 772  01be 1c0001        	addw	x,#OFST-6
 773  01c1 90ae000d      	ldw	y,#L371_ch
 774  01c5 a607          	ld	a,#7
 775  01c7 cd0000        	call	c_xymvx
 777                     ; 146     if(value < 0)
 779  01ca 9c            	rvf
 780  01cb 9c            	rvf
 781  01cc 0d0c          	tnz	(OFST+5,sp)
 782  01ce 2e0d          	jrsge	L722
 783                     ; 148         ch[0] = 0x2D;
 785  01d0 a62d          	ld	a,#45
 786  01d2 6b01          	ld	(OFST-6,sp),a
 788                     ; 149         value = -value;
 790  01d4 96            	ldw	x,sp
 791  01d5 1c000c        	addw	x,#OFST+5
 792  01d8 cd0000        	call	c_lgneg
 795  01db 2004          	jra	L132
 796  01dd               L722:
 797                     ; 153         ch[0] = 0x20;
 799  01dd a620          	ld	a,#32
 800  01df 6b01          	ld	(OFST-6,sp),a
 802  01e1               L132:
 803                     ; 156     if(value > 9999)
 805  01e1 9c            	rvf
 806  01e2 96            	ldw	x,sp
 807  01e3 1c000c        	addw	x,#OFST+5
 808  01e6 cd0000        	call	c_ltor
 810  01e9 ae0014        	ldw	x,#L02
 811  01ec cd0000        	call	c_lcmp
 813  01ef 2e03          	jrsge	L03
 814  01f1 cc0278        	jp	L332
 815  01f4               L03:
 816                     ; 158         ch[1] = ((value / 10000) + 0x30);
 818  01f4 96            	ldw	x,sp
 819  01f5 1c000c        	addw	x,#OFST+5
 820  01f8 cd0000        	call	c_ltor
 822  01fb ae0014        	ldw	x,#L02
 823  01fe cd0000        	call	c_ldiv
 825  0201 a630          	ld	a,#48
 826  0203 cd0000        	call	c_ladc
 828  0206 b603          	ld	a,c_lreg+3
 829  0208 6b02          	ld	(OFST-5,sp),a
 831                     ; 159         ch[2] = (((value % 10000)/ 1000) + 0x30);
 833  020a 96            	ldw	x,sp
 834  020b 1c000c        	addw	x,#OFST+5
 835  020e cd0000        	call	c_ltor
 837  0211 ae0014        	ldw	x,#L02
 838  0214 cd0000        	call	c_lmod
 840  0217 ae0018        	ldw	x,#L22
 841  021a cd0000        	call	c_ldiv
 843  021d a630          	ld	a,#48
 844  021f cd0000        	call	c_ladc
 846  0222 b603          	ld	a,c_lreg+3
 847  0224 6b03          	ld	(OFST-4,sp),a
 849                     ; 160         ch[3] = (((value % 1000) / 100) + 0x30);
 851  0226 96            	ldw	x,sp
 852  0227 1c000c        	addw	x,#OFST+5
 853  022a cd0000        	call	c_ltor
 855  022d ae0018        	ldw	x,#L22
 856  0230 cd0000        	call	c_lmod
 858  0233 ae001c        	ldw	x,#L42
 859  0236 cd0000        	call	c_ldiv
 861  0239 a630          	ld	a,#48
 862  023b cd0000        	call	c_ladc
 864  023e b603          	ld	a,c_lreg+3
 865  0240 6b04          	ld	(OFST-3,sp),a
 867                     ; 161         ch[4] = (((value % 100) / 10) + 0x30);
 869  0242 96            	ldw	x,sp
 870  0243 1c000c        	addw	x,#OFST+5
 871  0246 cd0000        	call	c_ltor
 873  0249 ae001c        	ldw	x,#L42
 874  024c cd0000        	call	c_lmod
 876  024f ae0020        	ldw	x,#L62
 877  0252 cd0000        	call	c_ldiv
 879  0255 a630          	ld	a,#48
 880  0257 cd0000        	call	c_ladc
 882  025a b603          	ld	a,c_lreg+3
 883  025c 6b05          	ld	(OFST-2,sp),a
 885                     ; 162         ch[5] = ((value % 10) + 0x30);
 887  025e 96            	ldw	x,sp
 888  025f 1c000c        	addw	x,#OFST+5
 889  0262 cd0000        	call	c_ltor
 891  0265 ae0020        	ldw	x,#L62
 892  0268 cd0000        	call	c_lmod
 894  026b a630          	ld	a,#48
 895  026d cd0000        	call	c_ladc
 897  0270 b603          	ld	a,c_lreg+3
 898  0272 6b06          	ld	(OFST-1,sp),a
 901  0274 ac0f040f      	jpf	L532
 902  0278               L332:
 903                     ; 165     else if((value > 999) && (value <= 9999))
 905  0278 9c            	rvf
 906  0279 96            	ldw	x,sp
 907  027a 1c000c        	addw	x,#OFST+5
 908  027d cd0000        	call	c_ltor
 910  0280 ae0018        	ldw	x,#L22
 911  0283 cd0000        	call	c_lcmp
 913  0286 2e03          	jrsge	L23
 914  0288 cc030f        	jp	L732
 915  028b               L23:
 917  028b 9c            	rvf
 918  028c 96            	ldw	x,sp
 919  028d 1c000c        	addw	x,#OFST+5
 920  0290 cd0000        	call	c_ltor
 922  0293 ae0014        	ldw	x,#L02
 923  0296 cd0000        	call	c_lcmp
 925  0299 2f02          	jrslt	L43
 926  029b 2072          	jp	L732
 927  029d               L43:
 928                     ; 167         ch[1] = (((value % 10000)/ 1000) + 0x30);
 930  029d 96            	ldw	x,sp
 931  029e 1c000c        	addw	x,#OFST+5
 932  02a1 cd0000        	call	c_ltor
 934  02a4 ae0014        	ldw	x,#L02
 935  02a7 cd0000        	call	c_lmod
 937  02aa ae0018        	ldw	x,#L22
 938  02ad cd0000        	call	c_ldiv
 940  02b0 a630          	ld	a,#48
 941  02b2 cd0000        	call	c_ladc
 943  02b5 b603          	ld	a,c_lreg+3
 944  02b7 6b02          	ld	(OFST-5,sp),a
 946                     ; 168         ch[2] = (((value % 1000) / 100) + 0x30);
 948  02b9 96            	ldw	x,sp
 949  02ba 1c000c        	addw	x,#OFST+5
 950  02bd cd0000        	call	c_ltor
 952  02c0 ae0018        	ldw	x,#L22
 953  02c3 cd0000        	call	c_lmod
 955  02c6 ae001c        	ldw	x,#L42
 956  02c9 cd0000        	call	c_ldiv
 958  02cc a630          	ld	a,#48
 959  02ce cd0000        	call	c_ladc
 961  02d1 b603          	ld	a,c_lreg+3
 962  02d3 6b03          	ld	(OFST-4,sp),a
 964                     ; 169         ch[3] = (((value % 100) / 10) + 0x30);
 966  02d5 96            	ldw	x,sp
 967  02d6 1c000c        	addw	x,#OFST+5
 968  02d9 cd0000        	call	c_ltor
 970  02dc ae001c        	ldw	x,#L42
 971  02df cd0000        	call	c_lmod
 973  02e2 ae0020        	ldw	x,#L62
 974  02e5 cd0000        	call	c_ldiv
 976  02e8 a630          	ld	a,#48
 977  02ea cd0000        	call	c_ladc
 979  02ed b603          	ld	a,c_lreg+3
 980  02ef 6b04          	ld	(OFST-3,sp),a
 982                     ; 170         ch[4] = ((value % 10) + 0x30);
 984  02f1 96            	ldw	x,sp
 985  02f2 1c000c        	addw	x,#OFST+5
 986  02f5 cd0000        	call	c_ltor
 988  02f8 ae0020        	ldw	x,#L62
 989  02fb cd0000        	call	c_lmod
 991  02fe a630          	ld	a,#48
 992  0300 cd0000        	call	c_ladc
 994  0303 b603          	ld	a,c_lreg+3
 995  0305 6b05          	ld	(OFST-2,sp),a
 997                     ; 171         ch[5] = 0x20;
 999  0307 a620          	ld	a,#32
1000  0309 6b06          	ld	(OFST-1,sp),a
1003  030b ac0f040f      	jpf	L532
1004  030f               L732:
1005                     ; 173     else if((value > 99) && (value <= 999))
1007  030f 9c            	rvf
1008  0310 96            	ldw	x,sp
1009  0311 1c000c        	addw	x,#OFST+5
1010  0314 cd0000        	call	c_ltor
1012  0317 ae001c        	ldw	x,#L42
1013  031a cd0000        	call	c_lcmp
1015  031d 2f6a          	jrslt	L342
1017  031f 9c            	rvf
1018  0320 96            	ldw	x,sp
1019  0321 1c000c        	addw	x,#OFST+5
1020  0324 cd0000        	call	c_ltor
1022  0327 ae0018        	ldw	x,#L22
1023  032a cd0000        	call	c_lcmp
1025  032d 2e5a          	jrsge	L342
1026                     ; 175         ch[1] = (((value % 1000) / 100) + 0x30);
1028  032f 96            	ldw	x,sp
1029  0330 1c000c        	addw	x,#OFST+5
1030  0333 cd0000        	call	c_ltor
1032  0336 ae0018        	ldw	x,#L22
1033  0339 cd0000        	call	c_lmod
1035  033c ae001c        	ldw	x,#L42
1036  033f cd0000        	call	c_ldiv
1038  0342 a630          	ld	a,#48
1039  0344 cd0000        	call	c_ladc
1041  0347 b603          	ld	a,c_lreg+3
1042  0349 6b02          	ld	(OFST-5,sp),a
1044                     ; 176         ch[2] = (((value % 100) / 10) + 0x30);
1046  034b 96            	ldw	x,sp
1047  034c 1c000c        	addw	x,#OFST+5
1048  034f cd0000        	call	c_ltor
1050  0352 ae001c        	ldw	x,#L42
1051  0355 cd0000        	call	c_lmod
1053  0358 ae0020        	ldw	x,#L62
1054  035b cd0000        	call	c_ldiv
1056  035e a630          	ld	a,#48
1057  0360 cd0000        	call	c_ladc
1059  0363 b603          	ld	a,c_lreg+3
1060  0365 6b03          	ld	(OFST-4,sp),a
1062                     ; 177         ch[3] = ((value % 10) + 0x30);
1064  0367 96            	ldw	x,sp
1065  0368 1c000c        	addw	x,#OFST+5
1066  036b cd0000        	call	c_ltor
1068  036e ae0020        	ldw	x,#L62
1069  0371 cd0000        	call	c_lmod
1071  0374 a630          	ld	a,#48
1072  0376 cd0000        	call	c_ladc
1074  0379 b603          	ld	a,c_lreg+3
1075  037b 6b04          	ld	(OFST-3,sp),a
1077                     ; 178         ch[4] = 0x20;
1079  037d a620          	ld	a,#32
1080  037f 6b05          	ld	(OFST-2,sp),a
1082                     ; 179         ch[5] = 0x20;
1084  0381 a620          	ld	a,#32
1085  0383 6b06          	ld	(OFST-1,sp),a
1088  0385 ac0f040f      	jpf	L532
1089  0389               L342:
1090                     ; 181     else if((value > 9) && (value <= 99))
1092  0389 9c            	rvf
1093  038a 96            	ldw	x,sp
1094  038b 1c000c        	addw	x,#OFST+5
1095  038e cd0000        	call	c_ltor
1097  0391 ae0020        	ldw	x,#L62
1098  0394 cd0000        	call	c_lcmp
1100  0397 2f50          	jrslt	L742
1102  0399 9c            	rvf
1103  039a 96            	ldw	x,sp
1104  039b 1c000c        	addw	x,#OFST+5
1105  039e cd0000        	call	c_ltor
1107  03a1 ae001c        	ldw	x,#L42
1108  03a4 cd0000        	call	c_lcmp
1110  03a7 2e40          	jrsge	L742
1111                     ; 183         ch[1] = (((value % 100) / 10) + 0x30);
1113  03a9 96            	ldw	x,sp
1114  03aa 1c000c        	addw	x,#OFST+5
1115  03ad cd0000        	call	c_ltor
1117  03b0 ae001c        	ldw	x,#L42
1118  03b3 cd0000        	call	c_lmod
1120  03b6 ae0020        	ldw	x,#L62
1121  03b9 cd0000        	call	c_ldiv
1123  03bc a630          	ld	a,#48
1124  03be cd0000        	call	c_ladc
1126  03c1 b603          	ld	a,c_lreg+3
1127  03c3 6b02          	ld	(OFST-5,sp),a
1129                     ; 184         ch[2] = ((value % 10) + 0x30);
1131  03c5 96            	ldw	x,sp
1132  03c6 1c000c        	addw	x,#OFST+5
1133  03c9 cd0000        	call	c_ltor
1135  03cc ae0020        	ldw	x,#L62
1136  03cf cd0000        	call	c_lmod
1138  03d2 a630          	ld	a,#48
1139  03d4 cd0000        	call	c_ladc
1141  03d7 b603          	ld	a,c_lreg+3
1142  03d9 6b03          	ld	(OFST-4,sp),a
1144                     ; 185         ch[3] = 0x20;
1146  03db a620          	ld	a,#32
1147  03dd 6b04          	ld	(OFST-3,sp),a
1149                     ; 186         ch[4] = 0x20;
1151  03df a620          	ld	a,#32
1152  03e1 6b05          	ld	(OFST-2,sp),a
1154                     ; 187         ch[5] = 0x20;
1156  03e3 a620          	ld	a,#32
1157  03e5 6b06          	ld	(OFST-1,sp),a
1160  03e7 2026          	jra	L532
1161  03e9               L742:
1162                     ; 191         ch[1] = ((value % 10) + 0x30);
1164  03e9 96            	ldw	x,sp
1165  03ea 1c000c        	addw	x,#OFST+5
1166  03ed cd0000        	call	c_ltor
1168  03f0 ae0020        	ldw	x,#L62
1169  03f3 cd0000        	call	c_lmod
1171  03f6 a630          	ld	a,#48
1172  03f8 cd0000        	call	c_ladc
1174  03fb b603          	ld	a,c_lreg+3
1175  03fd 6b02          	ld	(OFST-5,sp),a
1177                     ; 192         ch[2] = 0x20;
1179  03ff a620          	ld	a,#32
1180  0401 6b03          	ld	(OFST-4,sp),a
1182                     ; 193         ch[3] = 0x20;
1184  0403 a620          	ld	a,#32
1185  0405 6b04          	ld	(OFST-3,sp),a
1187                     ; 194         ch[4] = 0x20;
1189  0407 a620          	ld	a,#32
1190  0409 6b05          	ld	(OFST-2,sp),a
1192                     ; 195         ch[5] = 0x20;
1194  040b a620          	ld	a,#32
1195  040d 6b06          	ld	(OFST-1,sp),a
1197  040f               L532:
1198                     ; 198     LCD_goto(x_pos, y_pos);
1200  040f 7b09          	ld	a,(OFST+2,sp)
1201  0411 97            	ld	xl,a
1202  0412 7b08          	ld	a,(OFST+1,sp)
1203  0414 95            	ld	xh,a
1204  0415 cd0000        	call	_LCD_goto
1206                     ; 199     LCD_putstr(ch);
1208  0418 96            	ldw	x,sp
1209  0419 1c0001        	addw	x,#OFST-6
1210  041c cd0000        	call	_LCD_putstr
1212                     ; 200 }
1215  041f 5b09          	addw	sp,#9
1216  0421 81            	ret
1219                     	switch	.const
1220  0024               L352_ch:
1221  0024 2e            	dc.b	46
1222  0025 20            	dc.b	32
1223  0026 20            	dc.b	32
1224  0027 00            	dc.b	0
1225  0028 00            	ds.b	1
1296                     ; 203 void print_D(unsigned char x_pos, unsigned char y_pos, signed int value, unsigned char points)
1296                     ; 204 {
1297                     	switch	.text
1298  0422               _print_D:
1300  0422 89            	pushw	x
1301  0423 5205          	subw	sp,#5
1302       00000005      OFST:	set	5
1305                     ; 205     char ch[5] = {0x2E, 0x20, 0x20, '\0'};
1307  0425 96            	ldw	x,sp
1308  0426 1c0001        	addw	x,#OFST-4
1309  0429 90ae0024      	ldw	y,#L352_ch
1310  042d a605          	ld	a,#5
1311  042f cd0000        	call	c_xymvx
1313                     ; 207     ch[1] = ((value / 100) + 0x30);
1315  0432 1e0a          	ldw	x,(OFST+5,sp)
1316  0434 a664          	ld	a,#100
1317  0436 cd0000        	call	c_sdivx
1319  0439 1c0030        	addw	x,#48
1320  043c 01            	rrwa	x,a
1321  043d 6b02          	ld	(OFST-3,sp),a
1322  043f 02            	rlwa	x,a
1324                     ; 209     if(points > 1)
1326  0440 7b0c          	ld	a,(OFST+7,sp)
1327  0442 a102          	cp	a,#2
1328  0444 2527          	jrult	L313
1329                     ; 211         ch[2] = (((value / 10) % 10) + 0x30);
1331  0446 1e0a          	ldw	x,(OFST+5,sp)
1332  0448 a60a          	ld	a,#10
1333  044a cd0000        	call	c_sdivx
1335  044d a60a          	ld	a,#10
1336  044f cd0000        	call	c_smodx
1338  0452 1c0030        	addw	x,#48
1339  0455 01            	rrwa	x,a
1340  0456 6b03          	ld	(OFST-2,sp),a
1341  0458 02            	rlwa	x,a
1343                     ; 213 		if(points > 1)
1345  0459 7b0c          	ld	a,(OFST+7,sp)
1346  045b a102          	cp	a,#2
1347  045d 250e          	jrult	L313
1348                     ; 215 			ch[3] = ((value % 10) + 0x30);
1350  045f 1e0a          	ldw	x,(OFST+5,sp)
1351  0461 a60a          	ld	a,#10
1352  0463 cd0000        	call	c_smodx
1354  0466 1c0030        	addw	x,#48
1355  0469 01            	rrwa	x,a
1356  046a 6b04          	ld	(OFST-1,sp),a
1357  046c 02            	rlwa	x,a
1359  046d               L313:
1360                     ; 219     LCD_goto(x_pos, y_pos);
1362  046d 7b07          	ld	a,(OFST+2,sp)
1363  046f 97            	ld	xl,a
1364  0470 7b06          	ld	a,(OFST+1,sp)
1365  0472 95            	ld	xh,a
1366  0473 cd0000        	call	_LCD_goto
1368                     ; 220     LCD_putstr(ch);
1370  0476 96            	ldw	x,sp
1371  0477 1c0001        	addw	x,#OFST-4
1372  047a cd0000        	call	_LCD_putstr
1374                     ; 221 }
1377  047d 5b07          	addw	sp,#7
1378  047f 81            	ret
1452                     ; 224 void print_F(unsigned char x_pos, unsigned char y_pos, float value, unsigned char points)
1452                     ; 225 {
1453                     	switch	.text
1454  0480               _print_F:
1456  0480 89            	pushw	x
1457  0481 5208          	subw	sp,#8
1458       00000008      OFST:	set	8
1461                     ; 226     signed long tmp = 0x0000;
1463                     ; 228     tmp = value;
1465  0483 96            	ldw	x,sp
1466  0484 1c000d        	addw	x,#OFST+5
1467  0487 cd0000        	call	c_ltor
1469  048a cd0000        	call	c_ftol
1471  048d 96            	ldw	x,sp
1472  048e 1c0005        	addw	x,#OFST-3
1473  0491 cd0000        	call	c_rtol
1476                     ; 229     print_I(x_pos, y_pos, tmp);
1478  0494 1e07          	ldw	x,(OFST-1,sp)
1479  0496 89            	pushw	x
1480  0497 1e07          	ldw	x,(OFST-1,sp)
1481  0499 89            	pushw	x
1482  049a 7b0e          	ld	a,(OFST+6,sp)
1483  049c 97            	ld	xl,a
1484  049d 7b0d          	ld	a,(OFST+5,sp)
1485  049f 95            	ld	xh,a
1486  04a0 cd01ba        	call	_print_I
1488  04a3 5b04          	addw	sp,#4
1489                     ; 230     tmp = ((value - tmp) * 1000);
1491  04a5 96            	ldw	x,sp
1492  04a6 1c0005        	addw	x,#OFST-3
1493  04a9 cd0000        	call	c_ltor
1495  04ac cd0000        	call	c_ltof
1497  04af 96            	ldw	x,sp
1498  04b0 1c0001        	addw	x,#OFST-7
1499  04b3 cd0000        	call	c_rtol
1502  04b6 96            	ldw	x,sp
1503  04b7 1c000d        	addw	x,#OFST+5
1504  04ba cd0000        	call	c_ltor
1506  04bd 96            	ldw	x,sp
1507  04be 1c0001        	addw	x,#OFST-7
1508  04c1 cd0000        	call	c_fsub
1510  04c4 ae0029        	ldw	x,#L163
1511  04c7 cd0000        	call	c_fmul
1513  04ca cd0000        	call	c_ftol
1515  04cd 96            	ldw	x,sp
1516  04ce 1c0005        	addw	x,#OFST-3
1517  04d1 cd0000        	call	c_rtol
1520                     ; 232     if(tmp < 0)
1522  04d4 9c            	rvf
1523  04d5 9c            	rvf
1524  04d6 0d05          	tnz	(OFST-3,sp)
1525  04d8 2e07          	jrsge	L563
1526                     ; 234        tmp = -tmp;
1528  04da 96            	ldw	x,sp
1529  04db 1c0005        	addw	x,#OFST-3
1530  04de cd0000        	call	c_lgneg
1533  04e1               L563:
1534                     ; 237     if(value < 0)
1536  04e1 9c            	rvf
1537  04e2 9c            	rvf
1538  04e3 0d0d          	tnz	(OFST+5,sp)
1539  04e5 2e17          	jrsge	L763
1540                     ; 239         value = -value;
1542  04e7 96            	ldw	x,sp
1543  04e8 1c000d        	addw	x,#OFST+5
1544  04eb cd0000        	call	c_fgneg
1546                     ; 240 		LCD_goto(x_pos, y_pos);
1548  04ee 7b0a          	ld	a,(OFST+2,sp)
1549  04f0 97            	ld	xl,a
1550  04f1 7b09          	ld	a,(OFST+1,sp)
1551  04f3 95            	ld	xh,a
1552  04f4 cd0000        	call	_LCD_goto
1554                     ; 241         LCD_putchar(0x2D);
1556  04f7 a62d          	ld	a,#45
1557  04f9 cd0000        	call	_LCD_putchar
1560  04fc 200e          	jra	L173
1561  04fe               L763:
1562                     ; 245         LCD_goto(x_pos, y_pos);
1564  04fe 7b0a          	ld	a,(OFST+2,sp)
1565  0500 97            	ld	xl,a
1566  0501 7b09          	ld	a,(OFST+1,sp)
1567  0503 95            	ld	xh,a
1568  0504 cd0000        	call	_LCD_goto
1570                     ; 246         LCD_putchar(0x20);
1572  0507 a620          	ld	a,#32
1573  0509 cd0000        	call	_LCD_putchar
1575  050c               L173:
1576                     ; 249     if((value >= 10000) && (value < 100000))
1578  050c 9c            	rvf
1579  050d ae2710        	ldw	x,#10000
1580  0510 cd0000        	call	c_itof
1582  0513 96            	ldw	x,sp
1583  0514 1c0001        	addw	x,#OFST-7
1584  0517 cd0000        	call	c_rtol
1587  051a 96            	ldw	x,sp
1588  051b 1c000d        	addw	x,#OFST+5
1589  051e cd0000        	call	c_ltor
1591  0521 96            	ldw	x,sp
1592  0522 1c0001        	addw	x,#OFST-7
1593  0525 cd0000        	call	c_fcmp
1595  0528 2f3c          	jrslt	L373
1597  052a 9c            	rvf
1598  052b ae86a0        	ldw	x,#34464
1599  052e bf02          	ldw	c_lreg+2,x
1600  0530 ae0001        	ldw	x,#1
1601  0533 bf00          	ldw	c_lreg,x
1602  0535 cd0000        	call	c_ltof
1604  0538 96            	ldw	x,sp
1605  0539 1c0001        	addw	x,#OFST-7
1606  053c cd0000        	call	c_rtol
1609  053f 96            	ldw	x,sp
1610  0540 1c000d        	addw	x,#OFST+5
1611  0543 cd0000        	call	c_ltor
1613  0546 96            	ldw	x,sp
1614  0547 1c0001        	addw	x,#OFST-7
1615  054a cd0000        	call	c_fcmp
1617  054d 2e17          	jrsge	L373
1618                     ; 251         print_D((x_pos + 6), y_pos, tmp, points);
1620  054f 7b11          	ld	a,(OFST+9,sp)
1621  0551 88            	push	a
1622  0552 1e08          	ldw	x,(OFST+0,sp)
1623  0554 89            	pushw	x
1624  0555 7b0d          	ld	a,(OFST+5,sp)
1625  0557 97            	ld	xl,a
1626  0558 7b0c          	ld	a,(OFST+4,sp)
1627  055a ab06          	add	a,#6
1628  055c 95            	ld	xh,a
1629  055d cd0422        	call	_print_D
1631  0560 5b03          	addw	sp,#3
1633  0562 ac8a068a      	jpf	L573
1634  0566               L373:
1635                     ; 253     else if((value >= 1000) && (value < 10000))
1637  0566 9c            	rvf
1638  0567 ae03e8        	ldw	x,#1000
1639  056a cd0000        	call	c_itof
1641  056d 96            	ldw	x,sp
1642  056e 1c0001        	addw	x,#OFST-7
1643  0571 cd0000        	call	c_rtol
1646  0574 96            	ldw	x,sp
1647  0575 1c000d        	addw	x,#OFST+5
1648  0578 cd0000        	call	c_ltor
1650  057b 96            	ldw	x,sp
1651  057c 1c0001        	addw	x,#OFST-7
1652  057f cd0000        	call	c_fcmp
1654  0582 2f35          	jrslt	L773
1656  0584 9c            	rvf
1657  0585 ae2710        	ldw	x,#10000
1658  0588 cd0000        	call	c_itof
1660  058b 96            	ldw	x,sp
1661  058c 1c0001        	addw	x,#OFST-7
1662  058f cd0000        	call	c_rtol
1665  0592 96            	ldw	x,sp
1666  0593 1c000d        	addw	x,#OFST+5
1667  0596 cd0000        	call	c_ltor
1669  0599 96            	ldw	x,sp
1670  059a 1c0001        	addw	x,#OFST-7
1671  059d cd0000        	call	c_fcmp
1673  05a0 2e17          	jrsge	L773
1674                     ; 255         print_D((x_pos + 5), y_pos, tmp, points);
1676  05a2 7b11          	ld	a,(OFST+9,sp)
1677  05a4 88            	push	a
1678  05a5 1e08          	ldw	x,(OFST+0,sp)
1679  05a7 89            	pushw	x
1680  05a8 7b0d          	ld	a,(OFST+5,sp)
1681  05aa 97            	ld	xl,a
1682  05ab 7b0c          	ld	a,(OFST+4,sp)
1683  05ad ab05          	add	a,#5
1684  05af 95            	ld	xh,a
1685  05b0 cd0422        	call	_print_D
1687  05b3 5b03          	addw	sp,#3
1689  05b5 ac8a068a      	jpf	L573
1690  05b9               L773:
1691                     ; 257     else if((value >= 100) && (value < 1000))
1693  05b9 9c            	rvf
1694  05ba a664          	ld	a,#100
1695  05bc cd0000        	call	c_ctof
1697  05bf 96            	ldw	x,sp
1698  05c0 1c0001        	addw	x,#OFST-7
1699  05c3 cd0000        	call	c_rtol
1702  05c6 96            	ldw	x,sp
1703  05c7 1c000d        	addw	x,#OFST+5
1704  05ca cd0000        	call	c_ltor
1706  05cd 96            	ldw	x,sp
1707  05ce 1c0001        	addw	x,#OFST-7
1708  05d1 cd0000        	call	c_fcmp
1710  05d4 2f35          	jrslt	L304
1712  05d6 9c            	rvf
1713  05d7 ae03e8        	ldw	x,#1000
1714  05da cd0000        	call	c_itof
1716  05dd 96            	ldw	x,sp
1717  05de 1c0001        	addw	x,#OFST-7
1718  05e1 cd0000        	call	c_rtol
1721  05e4 96            	ldw	x,sp
1722  05e5 1c000d        	addw	x,#OFST+5
1723  05e8 cd0000        	call	c_ltor
1725  05eb 96            	ldw	x,sp
1726  05ec 1c0001        	addw	x,#OFST-7
1727  05ef cd0000        	call	c_fcmp
1729  05f2 2e17          	jrsge	L304
1730                     ; 259         print_D((x_pos + 4), y_pos, tmp, points);
1732  05f4 7b11          	ld	a,(OFST+9,sp)
1733  05f6 88            	push	a
1734  05f7 1e08          	ldw	x,(OFST+0,sp)
1735  05f9 89            	pushw	x
1736  05fa 7b0d          	ld	a,(OFST+5,sp)
1737  05fc 97            	ld	xl,a
1738  05fd 7b0c          	ld	a,(OFST+4,sp)
1739  05ff ab04          	add	a,#4
1740  0601 95            	ld	xh,a
1741  0602 cd0422        	call	_print_D
1743  0605 5b03          	addw	sp,#3
1745  0607 ac8a068a      	jpf	L573
1746  060b               L304:
1747                     ; 261     else if((value >= 10) && (value < 100))
1749  060b 9c            	rvf
1750  060c a60a          	ld	a,#10
1751  060e cd0000        	call	c_ctof
1753  0611 96            	ldw	x,sp
1754  0612 1c0001        	addw	x,#OFST-7
1755  0615 cd0000        	call	c_rtol
1758  0618 96            	ldw	x,sp
1759  0619 1c000d        	addw	x,#OFST+5
1760  061c cd0000        	call	c_ltor
1762  061f 96            	ldw	x,sp
1763  0620 1c0001        	addw	x,#OFST-7
1764  0623 cd0000        	call	c_fcmp
1766  0626 2f32          	jrslt	L704
1768  0628 9c            	rvf
1769  0629 a664          	ld	a,#100
1770  062b cd0000        	call	c_ctof
1772  062e 96            	ldw	x,sp
1773  062f 1c0001        	addw	x,#OFST-7
1774  0632 cd0000        	call	c_rtol
1777  0635 96            	ldw	x,sp
1778  0636 1c000d        	addw	x,#OFST+5
1779  0639 cd0000        	call	c_ltor
1781  063c 96            	ldw	x,sp
1782  063d 1c0001        	addw	x,#OFST-7
1783  0640 cd0000        	call	c_fcmp
1785  0643 2e15          	jrsge	L704
1786                     ; 263         print_D((x_pos + 3), y_pos, tmp, points);
1788  0645 7b11          	ld	a,(OFST+9,sp)
1789  0647 88            	push	a
1790  0648 1e08          	ldw	x,(OFST+0,sp)
1791  064a 89            	pushw	x
1792  064b 7b0d          	ld	a,(OFST+5,sp)
1793  064d 97            	ld	xl,a
1794  064e 7b0c          	ld	a,(OFST+4,sp)
1795  0650 ab03          	add	a,#3
1796  0652 95            	ld	xh,a
1797  0653 cd0422        	call	_print_D
1799  0656 5b03          	addw	sp,#3
1801  0658 2030          	jra	L573
1802  065a               L704:
1803                     ; 265     else if(value < 10)
1805  065a 9c            	rvf
1806  065b a60a          	ld	a,#10
1807  065d cd0000        	call	c_ctof
1809  0660 96            	ldw	x,sp
1810  0661 1c0001        	addw	x,#OFST-7
1811  0664 cd0000        	call	c_rtol
1814  0667 96            	ldw	x,sp
1815  0668 1c000d        	addw	x,#OFST+5
1816  066b cd0000        	call	c_ltor
1818  066e 96            	ldw	x,sp
1819  066f 1c0001        	addw	x,#OFST-7
1820  0672 cd0000        	call	c_fcmp
1822  0675 2e13          	jrsge	L573
1823                     ; 267         print_D((x_pos + 2), y_pos, tmp, points);
1825  0677 7b11          	ld	a,(OFST+9,sp)
1826  0679 88            	push	a
1827  067a 1e08          	ldw	x,(OFST+0,sp)
1828  067c 89            	pushw	x
1829  067d 7b0d          	ld	a,(OFST+5,sp)
1830  067f 97            	ld	xl,a
1831  0680 7b0c          	ld	a,(OFST+4,sp)
1832  0682 ab02          	add	a,#2
1833  0684 95            	ld	xh,a
1834  0685 cd0422        	call	_print_D
1836  0688 5b03          	addw	sp,#3
1837  068a               L573:
1838                     ; 269 }
1841  068a 5b0a          	addw	sp,#10
1842  068c 81            	ret
1885                     	xdef	_main
1886                     	xdef	_print_F
1887                     	xdef	_print_D
1888                     	xdef	_print_I
1889                     	xdef	_print_C
1890                     	xdef	_lcd_symbol
1891                     	xdef	_GPIO_setup
1892                     	xdef	_clock_setup
1893                     	xdef	_symbol
1894                     	xref	_DS18B20_get_temperature
1895                     	xref	_DS18B20_init
1896                     	xref	_LCD_goto
1897                     	xref	_LCD_clear_home
1898                     	xref	_LCD_putchar
1899                     	xref	_LCD_putstr
1900                     	xref	_LCD_send
1901                     	xref	_LCD_init
1902                     	switch	.ubsct
1903  0000               _data_value:
1904  0000 00            	ds.b	1
1905                     	xdef	_data_value
1906  0001               _bl_state:
1907  0001 00            	ds.b	1
1908                     	xdef	_bl_state
1909                     	xref	_GPIO_DeInit
1910                     	xref	_CLK_GetFlagStatus
1911                     	xref	_CLK_SYSCLKConfig
1912                     	xref	_CLK_HSIPrescalerConfig
1913                     	xref	_CLK_ClockSwitchConfig
1914                     	xref	_CLK_PeripheralClockConfig
1915                     	xref	_CLK_ClockSwitchCmd
1916                     	xref	_CLK_LSICmd
1917                     	xref	_CLK_HSICmd
1918                     	xref	_CLK_HSECmd
1919                     	xref	_CLK_DeInit
1920                     	xref	_delay_ms
1921                     	switch	.const
1922  0029               L163:
1923  0029 447a0000      	dc.w	17530,0
1924  002d               L14:
1925  002d 542f204300    	dc.b	"T/ C",0
1926  0032               L73:
1927  0032 53544d382044  	dc.b	"STM8 DS18B20 Ex.",0
1928  0043               L33:
1929  0043 00000000      	dc.w	0,0
1930                     	xref.b	c_lreg
1931                     	xref.b	c_x
1951                     	xref	c_ctof
1952                     	xref	c_fcmp
1953                     	xref	c_itof
1954                     	xref	c_fgneg
1955                     	xref	c_fmul
1956                     	xref	c_fsub
1957                     	xref	c_ltof
1958                     	xref	c_ftol
1959                     	xref	c_lmod
1960                     	xref	c_ladc
1961                     	xref	c_ldiv
1962                     	xref	c_lcmp
1963                     	xref	c_ltor
1964                     	xref	c_lgneg
1965                     	xref	c_smodx
1966                     	xref	c_sdivx
1967                     	xref	c_xymvx
1968                     	xref	c_rtol
1969                     	end
