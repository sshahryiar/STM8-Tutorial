   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     .const:	section	.text
  15  0000               L3_txt1:
  16  0000 4d4943524f41  	dc.b	"MICROARENA",0
  17  000b               L5_txt2:
  18  000b 535368616872  	dc.b	"SShahryiar",0
  19  0016               L7_txt3:
  20  0016 53544d385330  	dc.b	"STM8S003K3",0
  21  0021               L11_txt4:
  22  0021 446973636f76  	dc.b	"Discovery!",0
 111                     ; 14 void main(void)
 111                     ; 15 {
 113                     	switch	.text
 114  0000               _main:
 116  0000 522d          	subw	sp,#45
 117       0000002d      OFST:	set	45
 120                     ; 16 	const char txt1[] = {"MICROARENA"}; 
 122  0002 96            	ldw	x,sp
 123  0003 1c000c        	addw	x,#OFST-33
 124  0006 90ae0000      	ldw	y,#L3_txt1
 125  000a a60b          	ld	a,#11
 126  000c cd0000        	call	c_xymvx
 128                     ; 17 	const char txt2[] = {"SShahryiar"}; 
 130  000f 96            	ldw	x,sp
 131  0010 1c0001        	addw	x,#OFST-44
 132  0013 90ae000b      	ldw	y,#L5_txt2
 133  0017 a60b          	ld	a,#11
 134  0019 cd0000        	call	c_xymvx
 136                     ; 18 	const char txt3[] = {"STM8S003K3"};
 138  001c 96            	ldw	x,sp
 139  001d 1c0017        	addw	x,#OFST-22
 140  0020 90ae0016      	ldw	y,#L7_txt3
 141  0024 a60b          	ld	a,#11
 142  0026 cd0000        	call	c_xymvx
 144                     ; 19 	const char txt4[] = {"Discovery!"};
 146  0029 96            	ldw	x,sp
 147  002a 1c0022        	addw	x,#OFST-11
 148  002d 90ae0021      	ldw	y,#L11_txt4
 149  0031 a60b          	ld	a,#11
 150  0033 cd0000        	call	c_xymvx
 152                     ; 21 	unsigned char s = 0x00;
 154                     ; 23 	clock_setup();
 156  0036 cd00df        	call	_clock_setup
 158                     ; 24 	GPIO_setup();
 160  0039 cd0142        	call	_GPIO_setup
 162                     ; 25 	LCD_init();
 164  003c cd0000        	call	_LCD_init
 166                     ; 27     LCD_clear_home();
 168  003f cd0000        	call	_LCD_clear_home
 170                     ; 29     LCD_goto(3, 0);
 172  0042 ae0300        	ldw	x,#768
 173  0045 cd0000        	call	_LCD_goto
 175                     ; 30     LCD_putstr(txt1);
 177  0048 96            	ldw	x,sp
 178  0049 1c000c        	addw	x,#OFST-33
 179  004c cd0000        	call	_LCD_putstr
 181                     ; 31     LCD_goto(3, 1);
 183  004f ae0301        	ldw	x,#769
 184  0052 cd0000        	call	_LCD_goto
 186                     ; 32     LCD_putstr(txt2);
 188  0055 96            	ldw	x,sp
 189  0056 1c0001        	addw	x,#OFST-44
 190  0059 cd0000        	call	_LCD_putstr
 192                     ; 33     delay_ms(2600);
 194  005c ae0a28        	ldw	x,#2600
 195  005f cd0000        	call	_delay_ms
 197                     ; 35     LCD_clear_home();
 199  0062 cd0000        	call	_LCD_clear_home
 201                     ; 37     for(s = 0; s < 10; s++)
 203  0065 0f2d          	clr	(OFST+0,sp)
 205  0067               L75:
 206                     ; 39         LCD_goto((3 + s), 0);
 208  0067 7b2d          	ld	a,(OFST+0,sp)
 209  0069 ab03          	add	a,#3
 210  006b 5f            	clrw	x
 211  006c 95            	ld	xh,a
 212  006d cd0000        	call	_LCD_goto
 214                     ; 40         LCD_putchar(txt3[s]);
 216  0070 96            	ldw	x,sp
 217  0071 1c0017        	addw	x,#OFST-22
 218  0074 9f            	ld	a,xl
 219  0075 5e            	swapw	x
 220  0076 1b2d          	add	a,(OFST+0,sp)
 221  0078 2401          	jrnc	L6
 222  007a 5c            	incw	x
 223  007b               L6:
 224  007b 02            	rlwa	x,a
 225  007c f6            	ld	a,(x)
 226  007d cd0000        	call	_LCD_putchar
 228                     ; 41         delay_ms(60);
 230  0080 ae003c        	ldw	x,#60
 231  0083 cd0000        	call	_delay_ms
 233                     ; 37     for(s = 0; s < 10; s++)
 235  0086 0c2d          	inc	(OFST+0,sp)
 239  0088 7b2d          	ld	a,(OFST+0,sp)
 240  008a a10a          	cp	a,#10
 241  008c 25d9          	jrult	L75
 242                     ; 43     for(s = 0; s < 10; s++)
 244  008e 0f2d          	clr	(OFST+0,sp)
 246  0090               L56:
 247                     ; 45         LCD_goto((3 + s), 1);
 249  0090 7b2d          	ld	a,(OFST+0,sp)
 250  0092 ab03          	add	a,#3
 251  0094 ae0001        	ldw	x,#1
 252  0097 95            	ld	xh,a
 253  0098 cd0000        	call	_LCD_goto
 255                     ; 46         LCD_putchar(txt4[s]);
 257  009b 96            	ldw	x,sp
 258  009c 1c0022        	addw	x,#OFST-11
 259  009f 9f            	ld	a,xl
 260  00a0 5e            	swapw	x
 261  00a1 1b2d          	add	a,(OFST+0,sp)
 262  00a3 2401          	jrnc	L01
 263  00a5 5c            	incw	x
 264  00a6               L01:
 265  00a6 02            	rlwa	x,a
 266  00a7 f6            	ld	a,(x)
 267  00a8 cd0000        	call	_LCD_putchar
 269                     ; 47         delay_ms(60);
 271  00ab ae003c        	ldw	x,#60
 272  00ae cd0000        	call	_delay_ms
 274                     ; 43     for(s = 0; s < 10; s++)
 276  00b1 0c2d          	inc	(OFST+0,sp)
 280  00b3 7b2d          	ld	a,(OFST+0,sp)
 281  00b5 a10a          	cp	a,#10
 282  00b7 25d7          	jrult	L56
 283                     ; 49 	delay_ms(2600);
 285  00b9 ae0a28        	ldw	x,#2600
 286  00bc cd0000        	call	_delay_ms
 288                     ; 51     s = 0;
 290  00bf 0f2d          	clr	(OFST+0,sp)
 292                     ; 52     LCD_clear_home();
 294  00c1 cd0000        	call	_LCD_clear_home
 296                     ; 54     LCD_goto(3, 0);
 298  00c4 ae0300        	ldw	x,#768
 299  00c7 cd0000        	call	_LCD_goto
 301                     ; 55     LCD_putstr(txt1);
 303  00ca 96            	ldw	x,sp
 304  00cb 1c000c        	addw	x,#OFST-33
 305  00ce cd0000        	call	_LCD_putstr
 307  00d1               L37:
 308                     ; 59         show_value(s);
 310  00d1 7b2d          	ld	a,(OFST+0,sp)
 311  00d3 ad74          	call	_show_value
 313                     ; 60         s++;
 315  00d5 0c2d          	inc	(OFST+0,sp)
 317                     ; 61         delay_ms(200);
 319  00d7 ae00c8        	ldw	x,#200
 320  00da cd0000        	call	_delay_ms
 323  00dd 20f2          	jra	L37
 356                     ; 66 void clock_setup(void)
 356                     ; 67 {
 357                     	switch	.text
 358  00df               _clock_setup:
 362                     ; 68 	CLK_DeInit();
 364  00df cd0000        	call	_CLK_DeInit
 366                     ; 70 	CLK_HSECmd(DISABLE);
 368  00e2 4f            	clr	a
 369  00e3 cd0000        	call	_CLK_HSECmd
 371                     ; 71 	CLK_LSICmd(DISABLE);
 373  00e6 4f            	clr	a
 374  00e7 cd0000        	call	_CLK_LSICmd
 376                     ; 73 	CLK_HSICmd(ENABLE);
 378  00ea a601          	ld	a,#1
 379  00ec cd0000        	call	_CLK_HSICmd
 382  00ef               L111:
 383                     ; 74 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 385  00ef ae0102        	ldw	x,#258
 386  00f2 cd0000        	call	_CLK_GetFlagStatus
 388  00f5 4d            	tnz	a
 389  00f6 27f7          	jreq	L111
 390                     ; 76 	CLK_ClockSwitchCmd(ENABLE);
 392  00f8 a601          	ld	a,#1
 393  00fa cd0000        	call	_CLK_ClockSwitchCmd
 395                     ; 77 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 397  00fd 4f            	clr	a
 398  00fe cd0000        	call	_CLK_HSIPrescalerConfig
 400                     ; 78 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 402  0101 a680          	ld	a,#128
 403  0103 cd0000        	call	_CLK_SYSCLKConfig
 405                     ; 80 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 405                     ; 81 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 407  0106 4b01          	push	#1
 408  0108 4b00          	push	#0
 409  010a ae01e1        	ldw	x,#481
 410  010d cd0000        	call	_CLK_ClockSwitchConfig
 412  0110 85            	popw	x
 413                     ; 83 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 415  0111 ae0001        	ldw	x,#1
 416  0114 cd0000        	call	_CLK_PeripheralClockConfig
 418                     ; 84 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 420  0117 ae0100        	ldw	x,#256
 421  011a cd0000        	call	_CLK_PeripheralClockConfig
 423                     ; 85 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 425  011d ae1300        	ldw	x,#4864
 426  0120 cd0000        	call	_CLK_PeripheralClockConfig
 428                     ; 86 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 430  0123 ae1200        	ldw	x,#4608
 431  0126 cd0000        	call	_CLK_PeripheralClockConfig
 433                     ; 87 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 435  0129 ae0300        	ldw	x,#768
 436  012c cd0000        	call	_CLK_PeripheralClockConfig
 438                     ; 88 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 440  012f ae0700        	ldw	x,#1792
 441  0132 cd0000        	call	_CLK_PeripheralClockConfig
 443                     ; 89 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 445  0135 ae0500        	ldw	x,#1280
 446  0138 cd0000        	call	_CLK_PeripheralClockConfig
 448                     ; 90 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 450  013b ae0400        	ldw	x,#1024
 451  013e cd0000        	call	_CLK_PeripheralClockConfig
 453                     ; 91 }
 456  0141 81            	ret
 480                     ; 94 void GPIO_setup(void)
 480                     ; 95 {
 481                     	switch	.text
 482  0142               _GPIO_setup:
 486                     ; 96 	GPIO_DeInit(I2C_PORT);
 488  0142 ae5005        	ldw	x,#20485
 489  0145 cd0000        	call	_GPIO_DeInit
 491                     ; 97 }
 494  0148 81            	ret
 539                     ; 100 void show_value(unsigned char value)
 539                     ; 101 {
 540                     	switch	.text
 541  0149               _show_value:
 543  0149 88            	push	a
 544  014a 88            	push	a
 545       00000001      OFST:	set	1
 548                     ; 102    char ch = 0x00;
 550                     ; 104    ch = ((value / 100) + 0x30);
 552  014b 5f            	clrw	x
 553  014c 97            	ld	xl,a
 554  014d a664          	ld	a,#100
 555  014f 62            	div	x,a
 556  0150 9f            	ld	a,xl
 557  0151 ab30          	add	a,#48
 558  0153 6b01          	ld	(OFST+0,sp),a
 560                     ; 105    LCD_goto(6, 1);
 562  0155 ae0601        	ldw	x,#1537
 563  0158 cd0000        	call	_LCD_goto
 565                     ; 106    LCD_putchar(ch);
 567  015b 7b01          	ld	a,(OFST+0,sp)
 568  015d cd0000        	call	_LCD_putchar
 570                     ; 108    ch = (((value / 10) % 10) + 0x30);
 572  0160 7b02          	ld	a,(OFST+1,sp)
 573  0162 5f            	clrw	x
 574  0163 97            	ld	xl,a
 575  0164 a60a          	ld	a,#10
 576  0166 cd0000        	call	c_sdivx
 578  0169 a60a          	ld	a,#10
 579  016b cd0000        	call	c_smodx
 581  016e 1c0030        	addw	x,#48
 582  0171 01            	rrwa	x,a
 583  0172 6b01          	ld	(OFST+0,sp),a
 584  0174 02            	rlwa	x,a
 586                     ; 109    LCD_goto(7, 1);
 588  0175 ae0701        	ldw	x,#1793
 589  0178 cd0000        	call	_LCD_goto
 591                     ; 110    LCD_putchar(ch);
 593  017b 7b01          	ld	a,(OFST+0,sp)
 594  017d cd0000        	call	_LCD_putchar
 596                     ; 112    ch = ((value % 10) + 0x30);
 598  0180 7b02          	ld	a,(OFST+1,sp)
 599  0182 5f            	clrw	x
 600  0183 97            	ld	xl,a
 601  0184 a60a          	ld	a,#10
 602  0186 62            	div	x,a
 603  0187 5f            	clrw	x
 604  0188 97            	ld	xl,a
 605  0189 9f            	ld	a,xl
 606  018a ab30          	add	a,#48
 607  018c 6b01          	ld	(OFST+0,sp),a
 609                     ; 113    LCD_goto(8, 1);
 611  018e ae0801        	ldw	x,#2049
 612  0191 cd0000        	call	_LCD_goto
 614                     ; 114    LCD_putchar(ch);
 616  0194 7b01          	ld	a,(OFST+0,sp)
 617  0196 cd0000        	call	_LCD_putchar
 619                     ; 115 }
 622  0199 85            	popw	x
 623  019a 81            	ret
 656                     	xdef	_main
 657                     	xdef	_show_value
 658                     	xdef	_GPIO_setup
 659                     	xdef	_clock_setup
 660                     	xref	_LCD_goto
 661                     	xref	_LCD_clear_home
 662                     	xref	_LCD_putchar
 663                     	xref	_LCD_putstr
 664                     	xref	_LCD_init
 665                     	switch	.ubsct
 666  0000               _data_value:
 667  0000 00            	ds.b	1
 668                     	xdef	_data_value
 669  0001               _bl_state:
 670  0001 00            	ds.b	1
 671                     	xdef	_bl_state
 672                     	xref	_GPIO_DeInit
 673                     	xref	_CLK_GetFlagStatus
 674                     	xref	_CLK_SYSCLKConfig
 675                     	xref	_CLK_HSIPrescalerConfig
 676                     	xref	_CLK_ClockSwitchConfig
 677                     	xref	_CLK_PeripheralClockConfig
 678                     	xref	_CLK_ClockSwitchCmd
 679                     	xref	_CLK_LSICmd
 680                     	xref	_CLK_HSICmd
 681                     	xref	_CLK_HSECmd
 682                     	xref	_CLK_DeInit
 683                     	xref	_delay_ms
 684                     	xref.b	c_x
 704                     	xref	c_smodx
 705                     	xref	c_sdivx
 706                     	xref	c_xymvx
 707                     	end
