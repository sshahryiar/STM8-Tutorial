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
  96                     ; 23 void main()
  96                     ; 24 {	
  98                     	switch	.text
  99  0000               _main:
 101  0000 5205          	subw	sp,#5
 102       00000005      OFST:	set	5
 105                     ; 25 	unsigned char state = 0x00;
 107                     ; 27 	unsigned int RH = 0x0000;
 109                     ; 28 	unsigned int t = 0x0000;
 111                     ; 30 	clock_setup();
 113  0002 cd00c3        	call	_clock_setup
 115                     ; 31 	GPIO_setup();
 117  0005 cd0126        	call	_GPIO_setup
 119                     ; 33 	DHT11_init();
 121  0008 cd0000        	call	_DHT11_init
 123                     ; 35 	LCD_init();  
 125  000b cd0000        	call	_LCD_init
 127                     ; 36 	LCD_clear_home(); 
 129  000e cd0000        	call	_LCD_clear_home
 131                     ; 37 	lcd_symbol();
 133  0011 cd0138        	call	_lcd_symbol
 135  0014               L74:
 136                     ; 41 		  GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 138  0014 4b01          	push	#1
 139  0016 ae500f        	ldw	x,#20495
 140  0019 cd0000        	call	_GPIO_WriteReverse
 142  001c 84            	pop	a
 143                     ; 43 		  state = get_data();
 145  001d cd0000        	call	_get_data
 147  0020 6b05          	ld	(OFST+0,sp),a
 149                     ; 45 		  switch(state)
 151  0022 7b05          	ld	a,(OFST+0,sp)
 153                     ; 90 				   break;
 154  0024 4a            	dec	a
 155  0025 2766          	jreq	L5
 156  0027 4a            	dec	a
 157  0028 2763          	jreq	L5
 158  002a 4a            	dec	a
 159  002b 276b          	jreq	L7
 160  002d               L11:
 161                     ; 64 				   LCD_goto(0, 0); 
 163  002d 5f            	clrw	x
 164  002e cd0000        	call	_LCD_goto
 166                     ; 65 				   LCD_putstr("R.H/ %:       ");
 168  0031 ae0014        	ldw	x,#L36
 169  0034 cd0000        	call	_LCD_putstr
 171                     ; 67 				   RH = make_word(values[0], values[1]);
 173  0037 b601          	ld	a,_values+1
 174  0039 97            	ld	xl,a
 175  003a b600          	ld	a,_values
 176  003c 95            	ld	xh,a
 177  003d cd015f        	call	_make_word
 179                     ; 68 				   lcd_print(14, 0, values[0]);
 181  0040 3b0000        	push	_values
 182  0043 ae0e00        	ldw	x,#3584
 183  0046 cd017e        	call	_lcd_print
 185  0049 84            	pop	a
 186                     ; 70 				   LCD_goto(0, 1); 
 188  004a ae0001        	ldw	x,#1
 189  004d cd0000        	call	_LCD_goto
 191                     ; 71 				   LCD_putstr("Tmp/");
 193  0050 ae000f        	ldw	x,#L56
 194  0053 cd0000        	call	_LCD_putstr
 196                     ; 72 				   LCD_goto(4, 1); 
 198  0056 ae0401        	ldw	x,#1025
 199  0059 cd0000        	call	_LCD_goto
 201                     ; 73 				   LCD_send(0, DAT);
 203  005c ae0001        	ldw	x,#1
 204  005f cd0000        	call	_LCD_send
 206                     ; 74 				   LCD_goto(5, 1); 
 208  0062 ae0501        	ldw	x,#1281
 209  0065 cd0000        	call	_LCD_goto
 211                     ; 75 				   LCD_putstr("C:");
 213  0068 ae000c        	ldw	x,#L76
 214  006b cd0000        	call	_LCD_putstr
 216                     ; 77 				   t = make_word(values[2], values[3]);
 218  006e b603          	ld	a,_values+3
 219  0070 97            	ld	xl,a
 220  0071 b602          	ld	a,_values+2
 221  0073 95            	ld	xh,a
 222  0074 cd015f        	call	_make_word
 224                     ; 78 				   if((values[2] & 0x80) == 1)
 226  0077 b602          	ld	a,_values+2
 227  0079 a480          	and	a,#128
 228  007b a101          	cp	a,#1
 229  007d 2624          	jrne	L17
 230                     ; 80 					   LCD_goto(13, 1); 
 232  007f ae0d01        	ldw	x,#3329
 233  0082 cd0000        	call	_LCD_goto
 235                     ; 81 					   LCD_putstr("-");
 237  0085 ae000a        	ldw	x,#L37
 238  0088 cd0000        	call	_LCD_putstr
 241  008b 2022          	jra	L57
 242  008d               L5:
 243                     ; 52 				   LCD_clear_home(); 
 245  008d cd0000        	call	_LCD_clear_home
 247                     ; 53 				   LCD_putstr("No Sensor Found!");
 249  0090 ae0033        	ldw	x,#L75
 250  0093 cd0000        	call	_LCD_putstr
 252                     ; 54 				   break;
 254  0096 2021          	jra	L55
 255  0098               L7:
 256                     ; 58 				   LCD_clear_home(); 
 258  0098 cd0000        	call	_LCD_clear_home
 260                     ; 59 				   LCD_putstr("Checksum Error!");
 262  009b ae0023        	ldw	x,#L16
 263  009e cd0000        	call	_LCD_putstr
 265                     ; 60 				   break;
 267  00a1 2016          	jra	L55
 268  00a3               L17:
 269                     ; 85 					   LCD_goto(13, 1); 
 271  00a3 ae0d01        	ldw	x,#3329
 272  00a6 cd0000        	call	_LCD_goto
 274                     ; 86 					   LCD_putstr(" ");
 276  00a9 ae0008        	ldw	x,#L77
 277  00ac cd0000        	call	_LCD_putstr
 279  00af               L57:
 280                     ; 89 				   lcd_print(14, 1, values[2]); 
 282  00af 3b0002        	push	_values+2
 283  00b2 ae0e01        	ldw	x,#3585
 284  00b5 cd017e        	call	_lcd_print
 286  00b8 84            	pop	a
 287                     ; 90 				   break;
 289  00b9               L55:
 290                     ; 93 		  delay_ms(1000);
 292  00b9 ae03e8        	ldw	x,#1000
 293  00bc cd0000        	call	_delay_ms
 296  00bf ac140014      	jpf	L74
 329                     ; 98 void clock_setup(void)
 329                     ; 99 {
 330                     	switch	.text
 331  00c3               _clock_setup:
 335                     ; 100 	CLK_DeInit();
 337  00c3 cd0000        	call	_CLK_DeInit
 339                     ; 102 	CLK_HSECmd(DISABLE);
 341  00c6 4f            	clr	a
 342  00c7 cd0000        	call	_CLK_HSECmd
 344                     ; 103 	CLK_LSICmd(DISABLE);
 346  00ca 4f            	clr	a
 347  00cb cd0000        	call	_CLK_LSICmd
 349                     ; 104 	CLK_HSICmd(ENABLE);
 351  00ce a601          	ld	a,#1
 352  00d0 cd0000        	call	_CLK_HSICmd
 355  00d3               L311:
 356                     ; 105 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 358  00d3 ae0102        	ldw	x,#258
 359  00d6 cd0000        	call	_CLK_GetFlagStatus
 361  00d9 4d            	tnz	a
 362  00da 27f7          	jreq	L311
 363                     ; 107 	CLK_ClockSwitchCmd(ENABLE);
 365  00dc a601          	ld	a,#1
 366  00de cd0000        	call	_CLK_ClockSwitchCmd
 368                     ; 108 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 370  00e1 4f            	clr	a
 371  00e2 cd0000        	call	_CLK_HSIPrescalerConfig
 373                     ; 109 											  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 375  00e5 a680          	ld	a,#128
 376  00e7 cd0000        	call	_CLK_SYSCLKConfig
 378                     ; 111 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
 378                     ; 112 											  CLK_SOURCE_HSI, 
 378                     ; 113 											  DISABLE, 
 378                     ; 114 											  CLK_CURRENTCLOCKSTATE_ENABLE);
 380  00ea 4b01          	push	#1
 381  00ec 4b00          	push	#0
 382  00ee ae01e1        	ldw	x,#481
 383  00f1 cd0000        	call	_CLK_ClockSwitchConfig
 385  00f4 85            	popw	x
 386                     ; 116 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 388  00f5 ae0001        	ldw	x,#1
 389  00f8 cd0000        	call	_CLK_PeripheralClockConfig
 391                     ; 117 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 393  00fb ae0100        	ldw	x,#256
 394  00fe cd0000        	call	_CLK_PeripheralClockConfig
 396                     ; 118 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 398  0101 ae1300        	ldw	x,#4864
 399  0104 cd0000        	call	_CLK_PeripheralClockConfig
 401                     ; 119 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 403  0107 ae1200        	ldw	x,#4608
 404  010a cd0000        	call	_CLK_PeripheralClockConfig
 406                     ; 120 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 408  010d ae0300        	ldw	x,#768
 409  0110 cd0000        	call	_CLK_PeripheralClockConfig
 411                     ; 121 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 413  0113 ae0700        	ldw	x,#1792
 414  0116 cd0000        	call	_CLK_PeripheralClockConfig
 416                     ; 122 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 418  0119 ae0500        	ldw	x,#1280
 419  011c cd0000        	call	_CLK_PeripheralClockConfig
 421                     ; 123 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 423  011f ae0400        	ldw	x,#1024
 424  0122 cd0000        	call	_CLK_PeripheralClockConfig
 426                     ; 124 }
 429  0125 81            	ret
 454                     ; 127 void GPIO_setup(void)
 454                     ; 128 {
 455                     	switch	.text
 456  0126               _GPIO_setup:
 460                     ; 129 	GPIO_DeInit(DHT11_port);
 462  0126 ae500f        	ldw	x,#20495
 463  0129 cd0000        	call	_GPIO_DeInit
 465                     ; 130 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_HIGH_FAST);
 467  012c 4bf0          	push	#240
 468  012e 4b01          	push	#1
 469  0130 ae500f        	ldw	x,#20495
 470  0133 cd0000        	call	_GPIO_Init
 472  0136 85            	popw	x
 473                     ; 131 }
 476  0137 81            	ret
 512                     ; 134 void lcd_symbol(void)  
 512                     ; 135 {
 513                     	switch	.text
 514  0138               _lcd_symbol:
 516  0138 88            	push	a
 517       00000001      OFST:	set	1
 520                     ; 136 	unsigned char s = 0;  
 522                     ; 138    LCD_send(0x40, CMD);
 524  0139 ae4000        	ldw	x,#16384
 525  013c cd0000        	call	_LCD_send
 527                     ; 140    for(s = 0; s < 8; s++)
 529  013f 0f01          	clr	(OFST+0,sp)
 531  0141               L541:
 532                     ; 142         LCD_send(symbol[s], DAT);
 534  0141 7b01          	ld	a,(OFST+0,sp)
 535  0143 5f            	clrw	x
 536  0144 97            	ld	xl,a
 537  0145 d60000        	ld	a,(_symbol,x)
 538  0148 ae0001        	ldw	x,#1
 539  014b 95            	ld	xh,a
 540  014c cd0000        	call	_LCD_send
 542                     ; 140    for(s = 0; s < 8; s++)
 544  014f 0c01          	inc	(OFST+0,sp)
 548  0151 7b01          	ld	a,(OFST+0,sp)
 549  0153 a108          	cp	a,#8
 550  0155 25ea          	jrult	L541
 551                     ; 145    LCD_send(0x80, CMD);
 553  0157 ae8000        	ldw	x,#32768
 554  015a cd0000        	call	_LCD_send
 556                     ; 146 } 
 559  015d 84            	pop	a
 560  015e 81            	ret
 612                     ; 149 unsigned int make_word(unsigned char HB, unsigned char LB)
 612                     ; 150 {
 613                     	switch	.text
 614  015f               _make_word:
 616  015f 89            	pushw	x
 617  0160 89            	pushw	x
 618       00000002      OFST:	set	2
 621                     ; 151   unsigned int value = 0x0000;
 623                     ; 153   value = HB;
 625  0161 9e            	ld	a,xh
 626  0162 5f            	clrw	x
 627  0163 97            	ld	xl,a
 628  0164 1f01          	ldw	(OFST-1,sp),x
 630                     ; 154   value <<= 8;
 632  0166 7b02          	ld	a,(OFST+0,sp)
 633  0168 6b01          	ld	(OFST-1,sp),a
 634  016a 0f02          	clr	(OFST+0,sp)
 636                     ; 155   value |= LB;
 638  016c 7b04          	ld	a,(OFST+2,sp)
 639  016e 5f            	clrw	x
 640  016f 97            	ld	xl,a
 641  0170 01            	rrwa	x,a
 642  0171 1a02          	or	a,(OFST+0,sp)
 643  0173 01            	rrwa	x,a
 644  0174 1a01          	or	a,(OFST-1,sp)
 645  0176 01            	rrwa	x,a
 646  0177 1f01          	ldw	(OFST-1,sp),x
 648                     ; 157   return value;
 650  0179 1e01          	ldw	x,(OFST-1,sp)
 653  017b 5b04          	addw	sp,#4
 654  017d 81            	ret
 717                     ; 161 void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned char value)
 717                     ; 162 {
 718                     	switch	.text
 719  017e               _lcd_print:
 721  017e 89            	pushw	x
 722  017f 88            	push	a
 723       00000001      OFST:	set	1
 726                     ; 163 	char chr = 0x00;
 728                     ; 165 	chr = ((value / 10) + 0x30);
 730  0180 7b06          	ld	a,(OFST+5,sp)
 731  0182 5f            	clrw	x
 732  0183 97            	ld	xl,a
 733  0184 a60a          	ld	a,#10
 734  0186 62            	div	x,a
 735  0187 9f            	ld	a,xl
 736  0188 ab30          	add	a,#48
 737  018a 6b01          	ld	(OFST+0,sp),a
 739                     ; 166 	LCD_goto(x_pos, y_pos);
 741  018c 7b03          	ld	a,(OFST+2,sp)
 742  018e 97            	ld	xl,a
 743  018f 7b02          	ld	a,(OFST+1,sp)
 744  0191 95            	ld	xh,a
 745  0192 cd0000        	call	_LCD_goto
 747                     ; 167 	LCD_putchar(chr); 
 749  0195 7b01          	ld	a,(OFST+0,sp)
 750  0197 cd0000        	call	_LCD_putchar
 752                     ; 169 	chr = ((value % 10) + 0x30);
 754  019a 7b06          	ld	a,(OFST+5,sp)
 755  019c 5f            	clrw	x
 756  019d 97            	ld	xl,a
 757  019e a60a          	ld	a,#10
 758  01a0 62            	div	x,a
 759  01a1 5f            	clrw	x
 760  01a2 97            	ld	xl,a
 761  01a3 9f            	ld	a,xl
 762  01a4 ab30          	add	a,#48
 763  01a6 6b01          	ld	(OFST+0,sp),a
 765                     ; 170 	LCD_goto((x_pos + 1), y_pos);
 767  01a8 7b03          	ld	a,(OFST+2,sp)
 768  01aa 97            	ld	xl,a
 769  01ab 7b02          	ld	a,(OFST+1,sp)
 770  01ad 4c            	inc	a
 771  01ae 95            	ld	xh,a
 772  01af cd0000        	call	_LCD_goto
 774                     ; 171 	LCD_putchar(chr); 
 776  01b2 7b01          	ld	a,(OFST+0,sp)
 777  01b4 cd0000        	call	_LCD_putchar
 779                     ; 172 }
 782  01b7 5b03          	addw	sp,#3
 783  01b9 81            	ret
 836                     	xdef	_main
 837                     	xdef	_lcd_print
 838                     	xdef	_make_word
 839                     	xdef	_lcd_symbol
 840                     	xdef	_GPIO_setup
 841                     	xdef	_clock_setup
 842                     	xdef	_symbol
 843                     	xref	_get_data
 844                     	xref	_DHT11_init
 845                     	switch	.ubsct
 846  0000               _values:
 847  0000 0000000000    	ds.b	5
 848                     	xdef	_values
 849                     	xref	_LCD_goto
 850                     	xref	_LCD_clear_home
 851                     	xref	_LCD_putchar
 852                     	xref	_LCD_putstr
 853                     	xref	_LCD_send
 854                     	xref	_LCD_init
 855  0005               _data_value:
 856  0005 00            	ds.b	1
 857                     	xdef	_data_value
 858  0006               _bl_state:
 859  0006 00            	ds.b	1
 860                     	xdef	_bl_state
 861                     	xref	_GPIO_WriteReverse
 862                     	xref	_GPIO_Init
 863                     	xref	_GPIO_DeInit
 864                     	xref	_CLK_GetFlagStatus
 865                     	xref	_CLK_SYSCLKConfig
 866                     	xref	_CLK_HSIPrescalerConfig
 867                     	xref	_CLK_ClockSwitchConfig
 868                     	xref	_CLK_PeripheralClockConfig
 869                     	xref	_CLK_ClockSwitchCmd
 870                     	xref	_CLK_LSICmd
 871                     	xref	_CLK_HSICmd
 872                     	xref	_CLK_HSECmd
 873                     	xref	_CLK_DeInit
 874                     	xref	_delay_ms
 875                     	switch	.const
 876  0008               L77:
 877  0008 2000          	dc.b	" ",0
 878  000a               L37:
 879  000a 2d00          	dc.b	"-",0
 880  000c               L76:
 881  000c 433a00        	dc.b	"C:",0
 882  000f               L56:
 883  000f 546d702f00    	dc.b	"Tmp/",0
 884  0014               L36:
 885  0014 522e482f2025  	dc.b	"R.H/ %:       ",0
 886  0023               L16:
 887  0023 436865636b73  	dc.b	"Checksum Error!",0
 888  0033               L75:
 889  0033 4e6f2053656e  	dc.b	"No Sensor Found!",0
 909                     	end
