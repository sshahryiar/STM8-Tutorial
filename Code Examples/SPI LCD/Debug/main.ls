   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     .const:	section	.text
  15  0000               L3_txt1:
  16  0000 4d4943524f41  	dc.b	"MICROARENA ",0
  17  000c               L5_txt2:
  18  000c 535368616872  	dc.b	"SShahryiar ",0
  19  0018               L7_txt3:
  20  0018 53544d385330  	dc.b	"STM8S003K3 ",0
  21  0024               L11_txt4:
  22  0024 446973636f76  	dc.b	"Discovery! ",0
 111                     ; 13 void main()
 111                     ; 14 {
 113                     	switch	.text
 114  0000               _main:
 116  0000 5231          	subw	sp,#49
 117       00000031      OFST:	set	49
 120                     ; 15 	const char txt1[] = {"MICROARENA "}; 
 122  0002 96            	ldw	x,sp
 123  0003 1c000d        	addw	x,#OFST-36
 124  0006 90ae0000      	ldw	y,#L3_txt1
 125  000a a60c          	ld	a,#12
 126  000c cd0000        	call	c_xymvx
 128                     ; 16 	const char txt2[] = {"SShahryiar "}; 
 130  000f 96            	ldw	x,sp
 131  0010 1c0001        	addw	x,#OFST-48
 132  0013 90ae000c      	ldw	y,#L5_txt2
 133  0017 a60c          	ld	a,#12
 134  0019 cd0000        	call	c_xymvx
 136                     ; 17 	const char txt3[] = {"STM8S003K3 "};
 138  001c 96            	ldw	x,sp
 139  001d 1c0019        	addw	x,#OFST-24
 140  0020 90ae0018      	ldw	y,#L7_txt3
 141  0024 a60c          	ld	a,#12
 142  0026 cd0000        	call	c_xymvx
 144                     ; 18 	const char txt4[] = {"Discovery! "};
 146  0029 96            	ldw	x,sp
 147  002a 1c0025        	addw	x,#OFST-12
 148  002d 90ae0024      	ldw	y,#L11_txt4
 149  0031 a60c          	ld	a,#12
 150  0033 cd0000        	call	c_xymvx
 152                     ; 20 	unsigned char s = 0x00;
 154                     ; 22 	clock_setup();
 156  0036 cd00df        	call	_clock_setup
 158                     ; 23 	GPIO_setup();
 160  0039 cd0140        	call	_GPIO_setup
 162                     ; 24 	LCD_init();
 164  003c cd0000        	call	_LCD_init
 166                     ; 26     LCD_clear_home();
 168  003f cd0000        	call	_LCD_clear_home
 170                     ; 28     LCD_goto(3, 0);
 172  0042 ae0300        	ldw	x,#768
 173  0045 cd0000        	call	_LCD_goto
 175                     ; 29     LCD_putstr(txt1);
 177  0048 96            	ldw	x,sp
 178  0049 1c000d        	addw	x,#OFST-36
 179  004c cd0000        	call	_LCD_putstr
 181                     ; 30     LCD_goto(3, 1);
 183  004f ae0301        	ldw	x,#769
 184  0052 cd0000        	call	_LCD_goto
 186                     ; 31     LCD_putstr(txt2);
 188  0055 96            	ldw	x,sp
 189  0056 1c0001        	addw	x,#OFST-48
 190  0059 cd0000        	call	_LCD_putstr
 192                     ; 32     delay_ms(2600);
 194  005c ae0a28        	ldw	x,#2600
 195  005f cd0000        	call	_delay_ms
 197                     ; 34     LCD_clear_home();
 199  0062 cd0000        	call	_LCD_clear_home
 201                     ; 36     for(s = 0; s < 10; s++)
 203  0065 0f31          	clr	(OFST+0,sp)
 205  0067               L75:
 206                     ; 38         LCD_goto((3 + s), 0);
 208  0067 7b31          	ld	a,(OFST+0,sp)
 209  0069 ab03          	add	a,#3
 210  006b 5f            	clrw	x
 211  006c 95            	ld	xh,a
 212  006d cd0000        	call	_LCD_goto
 214                     ; 39         LCD_putchar(txt3[s]);
 216  0070 96            	ldw	x,sp
 217  0071 1c0019        	addw	x,#OFST-24
 218  0074 9f            	ld	a,xl
 219  0075 5e            	swapw	x
 220  0076 1b31          	add	a,(OFST+0,sp)
 221  0078 2401          	jrnc	L6
 222  007a 5c            	incw	x
 223  007b               L6:
 224  007b 02            	rlwa	x,a
 225  007c f6            	ld	a,(x)
 226  007d cd0000        	call	_LCD_putchar
 228                     ; 40         delay_ms(60);
 230  0080 ae003c        	ldw	x,#60
 231  0083 cd0000        	call	_delay_ms
 233                     ; 36     for(s = 0; s < 10; s++)
 235  0086 0c31          	inc	(OFST+0,sp)
 239  0088 7b31          	ld	a,(OFST+0,sp)
 240  008a a10a          	cp	a,#10
 241  008c 25d9          	jrult	L75
 242                     ; 42     for(s = 0; s < 11; s++)
 244  008e 0f31          	clr	(OFST+0,sp)
 246  0090               L56:
 247                     ; 44         LCD_goto((3 + s), 1);
 249  0090 7b31          	ld	a,(OFST+0,sp)
 250  0092 ab03          	add	a,#3
 251  0094 ae0001        	ldw	x,#1
 252  0097 95            	ld	xh,a
 253  0098 cd0000        	call	_LCD_goto
 255                     ; 45         LCD_putchar(txt4[s]);
 257  009b 96            	ldw	x,sp
 258  009c 1c0025        	addw	x,#OFST-12
 259  009f 9f            	ld	a,xl
 260  00a0 5e            	swapw	x
 261  00a1 1b31          	add	a,(OFST+0,sp)
 262  00a3 2401          	jrnc	L01
 263  00a5 5c            	incw	x
 264  00a6               L01:
 265  00a6 02            	rlwa	x,a
 266  00a7 f6            	ld	a,(x)
 267  00a8 cd0000        	call	_LCD_putchar
 269                     ; 46         delay_ms(60);
 271  00ab ae003c        	ldw	x,#60
 272  00ae cd0000        	call	_delay_ms
 274                     ; 42     for(s = 0; s < 11; s++)
 276  00b1 0c31          	inc	(OFST+0,sp)
 280  00b3 7b31          	ld	a,(OFST+0,sp)
 281  00b5 a10b          	cp	a,#11
 282  00b7 25d7          	jrult	L56
 283                     ; 48 	delay_ms(2600);
 285  00b9 ae0a28        	ldw	x,#2600
 286  00bc cd0000        	call	_delay_ms
 288                     ; 50     s = 0;
 290  00bf 0f31          	clr	(OFST+0,sp)
 292                     ; 51     LCD_clear_home();
 294  00c1 cd0000        	call	_LCD_clear_home
 296                     ; 53     LCD_goto(3, 0);
 298  00c4 ae0300        	ldw	x,#768
 299  00c7 cd0000        	call	_LCD_goto
 301                     ; 54     LCD_putstr(txt1);
 303  00ca 96            	ldw	x,sp
 304  00cb 1c000d        	addw	x,#OFST-36
 305  00ce cd0000        	call	_LCD_putstr
 307  00d1               L37:
 308                     ; 58         show_value(s);
 310  00d1 7b31          	ld	a,(OFST+0,sp)
 311  00d3 ad72          	call	_show_value
 313                     ; 59         s++;
 315  00d5 0c31          	inc	(OFST+0,sp)
 317                     ; 60         delay_ms(200);
 319  00d7 ae00c8        	ldw	x,#200
 320  00da cd0000        	call	_delay_ms
 323  00dd 20f2          	jra	L37
 356                     ; 65 void clock_setup(void)
 356                     ; 66 {
 357                     	switch	.text
 358  00df               _clock_setup:
 362                     ; 67 	CLK_DeInit();
 364  00df cd0000        	call	_CLK_DeInit
 366                     ; 69 	CLK_HSECmd(DISABLE);
 368  00e2 4f            	clr	a
 369  00e3 cd0000        	call	_CLK_HSECmd
 371                     ; 70 	CLK_LSICmd(DISABLE);
 373  00e6 4f            	clr	a
 374  00e7 cd0000        	call	_CLK_LSICmd
 376                     ; 71 	CLK_HSICmd(ENABLE);
 378  00ea a601          	ld	a,#1
 379  00ec cd0000        	call	_CLK_HSICmd
 382  00ef               L111:
 383                     ; 72 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 385  00ef ae0102        	ldw	x,#258
 386  00f2 cd0000        	call	_CLK_GetFlagStatus
 388  00f5 4d            	tnz	a
 389  00f6 27f7          	jreq	L111
 390                     ; 74 	CLK_ClockSwitchCmd(ENABLE);
 392  00f8 a601          	ld	a,#1
 393  00fa cd0000        	call	_CLK_ClockSwitchCmd
 395                     ; 75 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 397  00fd 4f            	clr	a
 398  00fe cd0000        	call	_CLK_HSIPrescalerConfig
 400                     ; 76 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 402  0101 a680          	ld	a,#128
 403  0103 cd0000        	call	_CLK_SYSCLKConfig
 405                     ; 78 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 405                     ; 79 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 407  0106 4b01          	push	#1
 408  0108 4b00          	push	#0
 409  010a ae01e1        	ldw	x,#481
 410  010d cd0000        	call	_CLK_ClockSwitchConfig
 412  0110 85            	popw	x
 413                     ; 81 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
 415  0111 ae0101        	ldw	x,#257
 416  0114 cd0000        	call	_CLK_PeripheralClockConfig
 418                     ; 82 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 420  0117 5f            	clrw	x
 421  0118 cd0000        	call	_CLK_PeripheralClockConfig
 423                     ; 83 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 425  011b ae1300        	ldw	x,#4864
 426  011e cd0000        	call	_CLK_PeripheralClockConfig
 428                     ; 84 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 430  0121 ae1200        	ldw	x,#4608
 431  0124 cd0000        	call	_CLK_PeripheralClockConfig
 433                     ; 85 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 435  0127 ae0300        	ldw	x,#768
 436  012a cd0000        	call	_CLK_PeripheralClockConfig
 438                     ; 86 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 440  012d ae0700        	ldw	x,#1792
 441  0130 cd0000        	call	_CLK_PeripheralClockConfig
 443                     ; 87 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 445  0133 ae0500        	ldw	x,#1280
 446  0136 cd0000        	call	_CLK_PeripheralClockConfig
 448                     ; 88 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 450  0139 ae0400        	ldw	x,#1024
 451  013c cd0000        	call	_CLK_PeripheralClockConfig
 453                     ; 89 }
 456  013f 81            	ret
 480                     ; 92 void GPIO_setup(void)
 480                     ; 93 {
 481                     	switch	.text
 482  0140               _GPIO_setup:
 486                     ; 94 	GPIO_DeInit(GPIOC);
 488  0140 ae500a        	ldw	x,#20490
 489  0143 cd0000        	call	_GPIO_DeInit
 491                     ; 95 }
 494  0146 81            	ret
 539                     ; 98 void show_value(unsigned char value)
 539                     ; 99 {
 540                     	switch	.text
 541  0147               _show_value:
 543  0147 88            	push	a
 544  0148 88            	push	a
 545       00000001      OFST:	set	1
 548                     ; 100    char ch = 0x00;
 550                     ; 102    ch = ((value / 100) + 0x30);
 552  0149 5f            	clrw	x
 553  014a 97            	ld	xl,a
 554  014b a664          	ld	a,#100
 555  014d 62            	div	x,a
 556  014e 9f            	ld	a,xl
 557  014f ab30          	add	a,#48
 558  0151 6b01          	ld	(OFST+0,sp),a
 560                     ; 103    LCD_goto(6, 1);
 562  0153 ae0601        	ldw	x,#1537
 563  0156 cd0000        	call	_LCD_goto
 565                     ; 104    LCD_putchar(ch);
 567  0159 7b01          	ld	a,(OFST+0,sp)
 568  015b cd0000        	call	_LCD_putchar
 570                     ; 106    ch = (((value / 10) % 10) + 0x30);
 572  015e 7b02          	ld	a,(OFST+1,sp)
 573  0160 5f            	clrw	x
 574  0161 97            	ld	xl,a
 575  0162 a60a          	ld	a,#10
 576  0164 cd0000        	call	c_sdivx
 578  0167 a60a          	ld	a,#10
 579  0169 cd0000        	call	c_smodx
 581  016c 1c0030        	addw	x,#48
 582  016f 01            	rrwa	x,a
 583  0170 6b01          	ld	(OFST+0,sp),a
 584  0172 02            	rlwa	x,a
 586                     ; 107    LCD_goto(7, 1);
 588  0173 ae0701        	ldw	x,#1793
 589  0176 cd0000        	call	_LCD_goto
 591                     ; 108    LCD_putchar(ch);
 593  0179 7b01          	ld	a,(OFST+0,sp)
 594  017b cd0000        	call	_LCD_putchar
 596                     ; 110    ch = ((value % 10) + 0x30);
 598  017e 7b02          	ld	a,(OFST+1,sp)
 599  0180 5f            	clrw	x
 600  0181 97            	ld	xl,a
 601  0182 a60a          	ld	a,#10
 602  0184 62            	div	x,a
 603  0185 5f            	clrw	x
 604  0186 97            	ld	xl,a
 605  0187 9f            	ld	a,xl
 606  0188 ab30          	add	a,#48
 607  018a 6b01          	ld	(OFST+0,sp),a
 609                     ; 111    LCD_goto(8, 1);
 611  018c ae0801        	ldw	x,#2049
 612  018f cd0000        	call	_LCD_goto
 614                     ; 112    LCD_putchar(ch);
 616  0192 7b01          	ld	a,(OFST+0,sp)
 617  0194 cd0000        	call	_LCD_putchar
 619                     ; 113 }
 622  0197 85            	popw	x
 623  0198 81            	ret
 647                     	xdef	_main
 648                     	xdef	_show_value
 649                     	xdef	_GPIO_setup
 650                     	xdef	_clock_setup
 651                     	xref	_LCD_goto
 652                     	xref	_LCD_clear_home
 653                     	xref	_LCD_putchar
 654                     	xref	_LCD_putstr
 655                     	xref	_LCD_init
 656                     	switch	.ubsct
 657  0000               _data_value:
 658  0000 00            	ds.b	1
 659                     	xdef	_data_value
 660                     	xref	_GPIO_DeInit
 661                     	xref	_CLK_GetFlagStatus
 662                     	xref	_CLK_SYSCLKConfig
 663                     	xref	_CLK_HSIPrescalerConfig
 664                     	xref	_CLK_ClockSwitchConfig
 665                     	xref	_CLK_PeripheralClockConfig
 666                     	xref	_CLK_ClockSwitchCmd
 667                     	xref	_CLK_LSICmd
 668                     	xref	_CLK_HSICmd
 669                     	xref	_CLK_HSECmd
 670                     	xref	_CLK_DeInit
 671                     	xref	_delay_ms
 672                     	xref.b	c_x
 692                     	xref	c_smodx
 693                     	xref	c_sdivx
 694                     	xref	c_xymvx
 695                     	end
