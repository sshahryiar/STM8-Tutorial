   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     	bsct
  15  0000               _set:
  16  0000 00            	dc.b	0
  17  0001               _menu:
  18  0001 00            	dc.b	0
  61                     ; 36 void main(void)
  61                     ; 37 {
  63                     	switch	.text
  64  0000               _main:
  68                     ; 38 	clock_setup();
  70  0000 ad64          	call	_clock_setup
  72                     ; 39 	GPIO_setup();
  74  0002 cd00c8        	call	_GPIO_setup
  76                     ; 41 	DS1307_init();
  78  0005 cd0000        	call	_DS1307_init
  80                     ; 43 	LCD_init();
  82  0008 cd0000        	call	_LCD_init
  84                     ; 44     LCD_clear_home();
  86  000b cd0000        	call	_LCD_clear_home
  88                     ; 46 	LCD_goto(0, 0);
  90  000e 5f            	clrw	x
  91  000f cd0000        	call	_LCD_goto
  93                     ; 47 	LCD_putstr("STM8 SW-I2C Test");
  95  0012 ae0006        	ldw	x,#L12
  96  0015 cd0000        	call	_LCD_putstr
  98  0018               L32:
  99                     ; 51 		if((GPIO_ReadInputPin(Button_port, Button_pin) == FALSE) && (set == FALSE))
 101  0018 4b80          	push	#128
 102  001a ae5005        	ldw	x,#20485
 103  001d cd0000        	call	_GPIO_ReadInputPin
 105  0020 5b01          	addw	sp,#1
 106  0022 4d            	tnz	a
 107  0023 2630          	jrne	L72
 109  0025 3d00          	tnz	_set
 110  0027 262c          	jrne	L72
 111                     ; 53 			delay_ms(1000);
 113  0029 ae03e8        	ldw	x,#1000
 114  002c cd0000        	call	_delay_ms
 116                     ; 54 			if(GPIO_ReadInputPin(Button_port, Button_pin) == FALSE)
 118  002f 4b80          	push	#128
 119  0031 ae5005        	ldw	x,#20485
 120  0034 cd0000        	call	_GPIO_ReadInputPin
 122  0037 5b01          	addw	sp,#1
 123  0039 4d            	tnz	a
 124  003a 2619          	jrne	L72
 126  003c               L53:
 127                     ; 56 				while(GPIO_ReadInputPin(Button_port, Button_pin) == FALSE);
 129  003c 4b80          	push	#128
 130  003e ae5005        	ldw	x,#20485
 131  0041 cd0000        	call	_GPIO_ReadInputPin
 133  0044 5b01          	addw	sp,#1
 134  0046 4d            	tnz	a
 135  0047 27f3          	jreq	L53
 136                     ; 57 				delay_ms(1000);
 138  0049 ae03e8        	ldw	x,#1000
 139  004c cd0000        	call	_delay_ms
 141                     ; 59 				menu = 0;
 143  004f 3f01          	clr	_menu
 144                     ; 60 				set = TRUE;
 146  0051 35010000      	mov	_set,#1
 147  0055               L72:
 148                     ; 64 		if(set)
 150  0055 3d00          	tnz	_set
 151  0057 2705          	jreq	L14
 152                     ; 66 			setup_time();
 154  0059 cd0158        	call	_setup_time
 157  005c 20ba          	jra	L32
 158  005e               L14:
 159                     ; 70 			get_time();
 161  005e cd0000        	call	_get_time
 163                     ; 71 			display_time();
 165  0061 cd0120        	call	_display_time
 167  0064 20b2          	jra	L32
 200                     ; 77 void clock_setup(void)
 200                     ; 78 {
 201                     	switch	.text
 202  0066               _clock_setup:
 206                     ; 79 	CLK_DeInit();
 208  0066 cd0000        	call	_CLK_DeInit
 210                     ; 81 	CLK_HSECmd(DISABLE);
 212  0069 4f            	clr	a
 213  006a cd0000        	call	_CLK_HSECmd
 215                     ; 82 	CLK_LSICmd(DISABLE);
 217  006d 4f            	clr	a
 218  006e cd0000        	call	_CLK_LSICmd
 220                     ; 83 	CLK_HSICmd(ENABLE);
 222  0071 a601          	ld	a,#1
 223  0073 cd0000        	call	_CLK_HSICmd
 226  0076               L75:
 227                     ; 84 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 229  0076 ae0102        	ldw	x,#258
 230  0079 cd0000        	call	_CLK_GetFlagStatus
 232  007c 4d            	tnz	a
 233  007d 27f7          	jreq	L75
 234                     ; 86 	CLK_ClockSwitchCmd(ENABLE);
 236  007f a601          	ld	a,#1
 237  0081 cd0000        	call	_CLK_ClockSwitchCmd
 239                     ; 87 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
 241  0084 a608          	ld	a,#8
 242  0086 cd0000        	call	_CLK_HSIPrescalerConfig
 244                     ; 88 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 246  0089 a680          	ld	a,#128
 247  008b cd0000        	call	_CLK_SYSCLKConfig
 249                     ; 90 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 249                     ; 91 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 251  008e 4b01          	push	#1
 252  0090 4b00          	push	#0
 253  0092 ae01e1        	ldw	x,#481
 254  0095 cd0000        	call	_CLK_ClockSwitchConfig
 256  0098 85            	popw	x
 257                     ; 93 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
 259  0099 ae0101        	ldw	x,#257
 260  009c cd0000        	call	_CLK_PeripheralClockConfig
 262                     ; 94 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 264  009f 5f            	clrw	x
 265  00a0 cd0000        	call	_CLK_PeripheralClockConfig
 267                     ; 95 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 269  00a3 ae1300        	ldw	x,#4864
 270  00a6 cd0000        	call	_CLK_PeripheralClockConfig
 272                     ; 96 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 274  00a9 ae1200        	ldw	x,#4608
 275  00ac cd0000        	call	_CLK_PeripheralClockConfig
 277                     ; 97 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 279  00af ae0300        	ldw	x,#768
 280  00b2 cd0000        	call	_CLK_PeripheralClockConfig
 282                     ; 98 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 284  00b5 ae0700        	ldw	x,#1792
 285  00b8 cd0000        	call	_CLK_PeripheralClockConfig
 287                     ; 99 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 289  00bb ae0500        	ldw	x,#1280
 290  00be cd0000        	call	_CLK_PeripheralClockConfig
 292                     ; 100 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 294  00c1 ae0400        	ldw	x,#1024
 295  00c4 cd0000        	call	_CLK_PeripheralClockConfig
 297                     ; 101 }
 300  00c7 81            	ret
 325                     ; 104 void GPIO_setup(void)
 325                     ; 105 {
 326                     	switch	.text
 327  00c8               _GPIO_setup:
 331                     ; 106 	GPIO_DeInit(GPIOB);
 333  00c8 ae5005        	ldw	x,#20485
 334  00cb cd0000        	call	_GPIO_DeInit
 336                     ; 107 	GPIO_Init(Button_port, Button_pin, GPIO_MODE_IN_PU_NO_IT);
 338  00ce 4b40          	push	#64
 339  00d0 4b80          	push	#128
 340  00d2 ae5005        	ldw	x,#20485
 341  00d5 cd0000        	call	_GPIO_Init
 343  00d8 85            	popw	x
 344                     ; 108 }
 347  00d9 81            	ret
 350                     .const:	section	.text
 351  0000               L37_ch:
 352  0000 20            	dc.b	32
 353  0001 20            	dc.b	32
 354  0002 00            	dc.b	0
 416                     ; 111 void show_value(unsigned char x_pos, unsigned char y_pos, unsigned char value)
 416                     ; 112 {
 417                     	switch	.text
 418  00da               _show_value:
 420  00da 89            	pushw	x
 421  00db 5203          	subw	sp,#3
 422       00000003      OFST:	set	3
 425                     ; 113 	char ch[0x03] = {0x20, 0x20, '\0'};
 427  00dd 96            	ldw	x,sp
 428  00de 1c0001        	addw	x,#OFST-2
 429  00e1 90ae0000      	ldw	y,#L37_ch
 430  00e5 a603          	ld	a,#3
 431  00e7 cd0000        	call	c_xymvx
 433                     ; 115    ch[0] = (((value / 10) % 10) + 0x30);
 435  00ea 7b08          	ld	a,(OFST+5,sp)
 436  00ec 5f            	clrw	x
 437  00ed 97            	ld	xl,a
 438  00ee a60a          	ld	a,#10
 439  00f0 cd0000        	call	c_sdivx
 441  00f3 a60a          	ld	a,#10
 442  00f5 cd0000        	call	c_smodx
 444  00f8 1c0030        	addw	x,#48
 445  00fb 01            	rrwa	x,a
 446  00fc 6b01          	ld	(OFST-2,sp),a
 447  00fe 02            	rlwa	x,a
 449                     ; 116    ch[1] = ((value % 10) + 0x30);
 451  00ff 7b08          	ld	a,(OFST+5,sp)
 452  0101 5f            	clrw	x
 453  0102 97            	ld	xl,a
 454  0103 a60a          	ld	a,#10
 455  0105 62            	div	x,a
 456  0106 5f            	clrw	x
 457  0107 97            	ld	xl,a
 458  0108 9f            	ld	a,xl
 459  0109 ab30          	add	a,#48
 460  010b 6b02          	ld	(OFST-1,sp),a
 462                     ; 118    LCD_goto(x_pos, y_pos);
 464  010d 7b05          	ld	a,(OFST+2,sp)
 465  010f 97            	ld	xl,a
 466  0110 7b04          	ld	a,(OFST+1,sp)
 467  0112 95            	ld	xh,a
 468  0113 cd0000        	call	_LCD_goto
 470                     ; 119    LCD_putstr(ch);
 472  0116 96            	ldw	x,sp
 473  0117 1c0001        	addw	x,#OFST-2
 474  011a cd0000        	call	_LCD_putstr
 476                     ; 120 }
 479  011d 5b05          	addw	sp,#5
 480  011f 81            	ret
 508                     ; 123 void display_time(void)
 508                     ; 124 {	
 509                     	switch	.text
 510  0120               _display_time:
 514                     ; 125 	show_value(4, 1, time.h);
 516  0120 3b0002        	push	_time+2
 517  0123 ae0401        	ldw	x,#1025
 518  0126 adb2          	call	_show_value
 520  0128 84            	pop	a
 521                     ; 126 	show_value(7, 1, time.m);
 523  0129 3b0001        	push	_time+1
 524  012c ae0701        	ldw	x,#1793
 525  012f ada9          	call	_show_value
 527  0131 84            	pop	a
 528                     ; 127 	show_value(10, 1, time.s);
 530  0132 3b0000        	push	_time
 531  0135 ae0a01        	ldw	x,#2561
 532  0138 ada0          	call	_show_value
 534  013a 84            	pop	a
 535                     ; 129 	LCD_goto(6, 1);
 537  013b ae0601        	ldw	x,#1537
 538  013e cd0000        	call	_LCD_goto
 540                     ; 130 	LCD_putchar(':');
 542  0141 a63a          	ld	a,#58
 543  0143 cd0000        	call	_LCD_putchar
 545                     ; 131 	LCD_goto(9, 1);
 547  0146 ae0901        	ldw	x,#2305
 548  0149 cd0000        	call	_LCD_goto
 550                     ; 132 	LCD_putchar(':');	
 552  014c a63a          	ld	a,#58
 553  014e cd0000        	call	_LCD_putchar
 555                     ; 133 	delay_ms(100);
 557  0151 ae0064        	ldw	x,#100
 558  0154 cd0000        	call	_delay_ms
 560                     ; 134 }
 563  0157 81            	ret
 589                     ; 137 void setup_time(void)
 589                     ; 138 {
 590                     	switch	.text
 591  0158               _setup_time:
 595                     ; 139 	switch(menu)
 597  0158 b601          	ld	a,_menu
 599                     ; 154 			break;
 600  015a 4d            	tnz	a
 601  015b 2708          	jreq	L731
 602  015d 4a            	dec	a
 603  015e 2717          	jreq	L141
 604  0160 4a            	dec	a
 605  0161 2726          	jreq	L341
 606  0163 2034          	jra	L751
 607  0165               L731:
 608                     ; 143 			time.h = adjust(4, 1, 23, 0, time.h);
 610  0165 3b0002        	push	_time+2
 611  0168 4b00          	push	#0
 612  016a 4b17          	push	#23
 613  016c ae0401        	ldw	x,#1025
 614  016f ad29          	call	_adjust
 616  0171 5b03          	addw	sp,#3
 617  0173 b702          	ld	_time+2,a
 618                     ; 144 			break;
 620  0175 2022          	jra	L751
 621  0177               L141:
 622                     ; 148 			time.m = adjust(7, 1, 59, 0, time.m);
 624  0177 3b0001        	push	_time+1
 625  017a 4b00          	push	#0
 626  017c 4b3b          	push	#59
 627  017e ae0701        	ldw	x,#1793
 628  0181 ad17          	call	_adjust
 630  0183 5b03          	addw	sp,#3
 631  0185 b701          	ld	_time+1,a
 632                     ; 149 			break;
 634  0187 2010          	jra	L751
 635  0189               L341:
 636                     ; 153 			time.s = adjust(10, 1, 59, 0, time.s);
 638  0189 3b0000        	push	_time
 639  018c 4b00          	push	#0
 640  018e 4b3b          	push	#59
 641  0190 ae0a01        	ldw	x,#2561
 642  0193 ad05          	call	_adjust
 644  0195 5b03          	addw	sp,#3
 645  0197 b700          	ld	_time,a
 646                     ; 154 			break;
 648  0199               L751:
 649                     ; 157 }
 652  0199 81            	ret
 731                     ; 160 unsigned char adjust(unsigned char x_pos, unsigned char y_pos, signed char value_max, signed char value_min, signed char value)
 731                     ; 161 {
 732                     	switch	.text
 733  019a               _adjust:
 735  019a 89            	pushw	x
 736       00000000      OFST:	set	0
 739                     ; 162 	if(GPIO_ReadInputPin(Button_port, Button_pin) == FALSE)
 741  019b 4b80          	push	#128
 742  019d ae5005        	ldw	x,#20485
 743  01a0 cd0000        	call	_GPIO_ReadInputPin
 745  01a3 5b01          	addw	sp,#1
 746  01a5 4d            	tnz	a
 747  01a6 2645          	jrne	L712
 748                     ; 164 		delay_ms(900);
 750  01a8 ae0384        	ldw	x,#900
 751  01ab cd0000        	call	_delay_ms
 753                     ; 166 		if(GPIO_ReadInputPin(Button_port, Button_pin) == FALSE)
 755  01ae 4b80          	push	#128
 756  01b0 ae5005        	ldw	x,#20485
 757  01b3 cd0000        	call	_GPIO_ReadInputPin
 759  01b6 5b01          	addw	sp,#1
 760  01b8 4d            	tnz	a
 761  01b9 263f          	jrne	L332
 763  01bb               L522:
 764                     ; 168 			while(GPIO_ReadInputPin(Button_port, Button_pin) == FALSE);
 766  01bb 4b80          	push	#128
 767  01bd ae5005        	ldw	x,#20485
 768  01c0 cd0000        	call	_GPIO_ReadInputPin
 770  01c3 5b01          	addw	sp,#1
 771  01c5 4d            	tnz	a
 772  01c6 27f3          	jreq	L522
 773                     ; 169 			menu++; 
 775  01c8 3c01          	inc	_menu
 776                     ; 171 			if(menu >= 3)
 778  01ca b601          	ld	a,_menu
 779  01cc a103          	cp	a,#3
 780  01ce 252a          	jrult	L332
 781                     ; 173 				LCD_goto(3, 1);
 783  01d0 ae0301        	ldw	x,#769
 784  01d3 cd0000        	call	_LCD_goto
 786                     ; 174 				LCD_putchar(' ');
 788  01d6 a620          	ld	a,#32
 789  01d8 cd0000        	call	_LCD_putchar
 791                     ; 175 				LCD_goto(12, 1);
 793  01db ae0c01        	ldw	x,#3073
 794  01de cd0000        	call	_LCD_goto
 796                     ; 176 				LCD_putchar(' ');	
 798  01e1 a620          	ld	a,#32
 799  01e3 cd0000        	call	_LCD_putchar
 801                     ; 177 				set_time();
 803  01e6 cd0000        	call	_set_time
 805                     ; 178 				set = FALSE;
 807  01e9 3f00          	clr	_set
 808                     ; 180 				return;
 810  01eb 204d          	jra	L22
 811  01ed               L712:
 812                     ; 187 		value++;
 814  01ed 0c07          	inc	(OFST+7,sp)
 815                     ; 189 		if(value > value_max)
 817  01ef 9c            	rvf
 818  01f0 7b07          	ld	a,(OFST+7,sp)
 819  01f2 1105          	cp	a,(OFST+5,sp)
 820  01f4 2d04          	jrsle	L332
 821                     ; 191 			value = value_min;
 823  01f6 7b06          	ld	a,(OFST+6,sp)
 824  01f8 6b07          	ld	(OFST+7,sp),a
 825  01fa               L332:
 826                     ; 195 	LCD_goto(3, 1);
 828  01fa ae0301        	ldw	x,#769
 829  01fd cd0000        	call	_LCD_goto
 831                     ; 196 	LCD_putchar('<');
 833  0200 a63c          	ld	a,#60
 834  0202 cd0000        	call	_LCD_putchar
 836                     ; 197 	LCD_goto(12, 1);
 838  0205 ae0c01        	ldw	x,#3073
 839  0208 cd0000        	call	_LCD_goto
 841                     ; 198 	LCD_putchar('>');	
 843  020b a63e          	ld	a,#62
 844  020d cd0000        	call	_LCD_putchar
 846                     ; 200 	LCD_goto(x_pos, y_pos);
 848  0210 7b02          	ld	a,(OFST+2,sp)
 849  0212 97            	ld	xl,a
 850  0213 7b01          	ld	a,(OFST+1,sp)
 851  0215 95            	ld	xh,a
 852  0216 cd0000        	call	_LCD_goto
 854                     ; 201 	LCD_putstr("  ");
 856  0219 ae0003        	ldw	x,#L732
 857  021c cd0000        	call	_LCD_putstr
 859                     ; 202 	delay_ms(90);
 861  021f ae005a        	ldw	x,#90
 862  0222 cd0000        	call	_delay_ms
 864                     ; 204 	show_value(x_pos, y_pos, value);
 866  0225 7b07          	ld	a,(OFST+7,sp)
 867  0227 88            	push	a
 868  0228 7b03          	ld	a,(OFST+3,sp)
 869  022a 97            	ld	xl,a
 870  022b 7b02          	ld	a,(OFST+2,sp)
 871  022d 95            	ld	xh,a
 872  022e cd00da        	call	_show_value
 874  0231 84            	pop	a
 875                     ; 205 	delay_ms(90);
 877  0232 ae005a        	ldw	x,#90
 878  0235 cd0000        	call	_delay_ms
 880                     ; 207 	return value;
 882  0238 7b07          	ld	a,(OFST+7,sp)
 884  023a               L22:
 886  023a 85            	popw	x
 887  023b 81            	ret
1016                     	xdef	_main
1017                     	xdef	_adjust
1018                     	xdef	_setup_time
1019                     	xdef	_display_time
1020                     	xdef	_show_value
1021                     	xdef	_GPIO_setup
1022                     	xdef	_clock_setup
1023                     	xdef	_menu
1024                     	xdef	_set
1025                     	switch	.ubsct
1026  0000               _time:
1027  0000 000000000000  	ds.b	7
1028                     	xdef	_time
1029                     	xref	_set_time
1030                     	xref	_get_time
1031                     	xref	_DS1307_init
1032                     	xref	_LCD_goto
1033                     	xref	_LCD_clear_home
1034                     	xref	_LCD_putchar
1035                     	xref	_LCD_putstr
1036                     	xref	_LCD_init
1037  0007               _data_value:
1038  0007 00            	ds.b	1
1039                     	xdef	_data_value
1040                     	xref	_GPIO_ReadInputPin
1041                     	xref	_GPIO_Init
1042                     	xref	_GPIO_DeInit
1043                     	xref	_CLK_GetFlagStatus
1044                     	xref	_CLK_SYSCLKConfig
1045                     	xref	_CLK_HSIPrescalerConfig
1046                     	xref	_CLK_ClockSwitchConfig
1047                     	xref	_CLK_PeripheralClockConfig
1048                     	xref	_CLK_ClockSwitchCmd
1049                     	xref	_CLK_LSICmd
1050                     	xref	_CLK_HSICmd
1051                     	xref	_CLK_HSECmd
1052                     	xref	_CLK_DeInit
1053                     	xref	_delay_ms
1054                     	switch	.const
1055  0003               L732:
1056  0003 202000        	dc.b	"  ",0
1057  0006               L12:
1058  0006 53544d382053  	dc.b	"STM8 SW-I2C Test",0
1059                     	xref.b	c_x
1079                     	xref	c_smodx
1080                     	xref	c_sdivx
1081                     	xref	c_xymvx
1082                     	end
