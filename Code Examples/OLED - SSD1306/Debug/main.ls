   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  83                     ; 12 void main(void)
  83                     ; 13 {
  85                     	switch	.text
  86  0000               _main:
  88  0000 5207          	subw	sp,#7
  89       00000007      OFST:	set	7
  92                     ; 14      unsigned char p = 0;
  94                     ; 16      signed int i = -9;
  96                     ; 18      float f = -10.0;
  98                     ; 20      setup_clock();
 100  0002 cd018c        	call	_setup_clock
 102                     ; 21 	 setup_GPIOs();
 104  0005 cd01ff        	call	_setup_GPIOs
 106                     ; 22 	 OLED_init();
 108  0008 cd0000        	call	_OLED_init
 110  000b               L14:
 111                     ; 26 		 i = -9;
 113  000b aefff7        	ldw	x,#65527
 114  000e 1f01          	ldw	(OFST-6,sp),x
 116                     ; 27          f = -10.0;
 118  0010 ce002e        	ldw	x,L53+2
 119  0013 1f05          	ldw	(OFST-2,sp),x
 120  0015 ce002c        	ldw	x,L53
 121  0018 1f03          	ldw	(OFST-4,sp),x
 123                     ; 29          OLED_fill(0x00);
 125  001a 4f            	clr	a
 126  001b cd0000        	call	_OLED_fill
 128                     ; 30          OLED_fill(0xFF);
 130  001e a6ff          	ld	a,#255
 131  0020 cd0176        	call	LC001
 133                     ; 32          OLED_fill(0xAA);
 135  0023 a6aa          	ld	a,#170
 136  0025 cd0176        	call	LC001
 138                     ; 34          OLED_fill(0x55);
 140  0028 a655          	ld	a,#85
 141  002a cd0176        	call	LC001
 143                     ; 37          OLED_clear_buffer();
 145  002d cd0000        	call	_OLED_clear_buffer
 147                     ; 38 		 OLED_fill(0x00);
 149  0030 4f            	clr	a
 150  0031 cd0000        	call	_OLED_fill
 152                     ; 39          OLED_print_string(36, 0, "MicroArena");
 154  0034 ae0021        	ldw	x,#L54
 155  0037 89            	pushw	x
 156  0038 ae2400        	ldw	x,#9216
 157  003b cd0000        	call	_OLED_print_string
 159  003e 85            	popw	x
 160                     ; 40          OLED_print_string(16, 1, "fb.com/MicroArena");
 162  003f ae000f        	ldw	x,#L74
 163  0042 89            	pushw	x
 164  0043 ae1001        	ldw	x,#4097
 165  0046 cd0000        	call	_OLED_print_string
 167  0049 85            	popw	x
 168                     ; 41          Draw_Line(0, 19, 127, 19, ON);
 170  004a 4b01          	push	#1
 171  004c ae0013        	ldw	x,#19
 172  004f 89            	pushw	x
 173  0050 ae007f        	ldw	x,#127
 174  0053 89            	pushw	x
 175  0054 ae0013        	ldw	x,#19
 176  0057 89            	pushw	x
 177  0058 5f            	clrw	x
 178  0059 cd0000        	call	_Draw_Line
 180  005c 5b07          	addw	sp,#7
 181                     ; 42          Draw_Line(0, 60, 127, 60, ON);
 183  005e 4b01          	push	#1
 184  0060 ae003c        	ldw	x,#60
 185  0063 89            	pushw	x
 186  0064 ae007f        	ldw	x,#127
 187  0067 89            	pushw	x
 188  0068 ae003c        	ldw	x,#60
 189  006b 89            	pushw	x
 190  006c 5f            	clrw	x
 191  006d cd0000        	call	_Draw_Line
 193  0070 5b07          	addw	sp,#7
 194                     ; 43          delay_ms(900);
 196  0072 ae0384        	ldw	x,#900
 197  0075 cd0000        	call	_delay_ms
 199                     ; 44          Draw_Line(3, 16, 3, 63, ON);
 201  0078 4b01          	push	#1
 202  007a ae003f        	ldw	x,#63
 203  007d 89            	pushw	x
 204  007e ae0003        	ldw	x,#3
 205  0081 89            	pushw	x
 206  0082 ae0010        	ldw	x,#16
 207  0085 89            	pushw	x
 208  0086 ae0003        	ldw	x,#3
 209  0089 cd0000        	call	_Draw_Line
 211  008c 5b07          	addw	sp,#7
 212                     ; 45          Draw_Line(124, 16, 124, 63, ON);
 214  008e 4b01          	push	#1
 215  0090 ae003f        	ldw	x,#63
 216  0093 89            	pushw	x
 217  0094 ae007c        	ldw	x,#124
 218  0097 89            	pushw	x
 219  0098 ae0010        	ldw	x,#16
 220  009b 89            	pushw	x
 221  009c ae007c        	ldw	x,#124
 222  009f cd0000        	call	_Draw_Line
 224  00a2 5b07          	addw	sp,#7
 225                     ; 46          delay_ms(900);
 227  00a4 ae0384        	ldw	x,#900
 228  00a7 cd0000        	call	_delay_ms
 230                     ; 47          Draw_Rectangle(122, 58, 5, 21, OFF, ON, SQUARE);
 232  00aa 4b00          	push	#0
 233  00ac 4b01          	push	#1
 234  00ae 4b00          	push	#0
 235  00b0 ae0015        	ldw	x,#21
 236  00b3 89            	pushw	x
 237  00b4 ae0005        	ldw	x,#5
 238  00b7 89            	pushw	x
 239  00b8 ae003a        	ldw	x,#58
 240  00bb 89            	pushw	x
 241  00bc ae007a        	ldw	x,#122
 242  00bf cd0000        	call	_Draw_Rectangle
 244  00c2 5b09          	addw	sp,#9
 245                     ; 48          delay_ms(900);
 247  00c4 ae0384        	ldw	x,#900
 248  00c7 cd0000        	call	_delay_ms
 250                     ; 49          Draw_Circle(63, 40, 7, ON, ON);
 252  00ca 4b01          	push	#1
 253  00cc 4b01          	push	#1
 254  00ce ae0007        	ldw	x,#7
 255  00d1 89            	pushw	x
 256  00d2 ae0028        	ldw	x,#40
 257  00d5 89            	pushw	x
 258  00d6 ae003f        	ldw	x,#63
 259  00d9 cd0000        	call	_Draw_Circle
 261  00dc 5b06          	addw	sp,#6
 262                     ; 50          delay_ms(2000);
 264  00de cd017f        	call	LC002
 266                     ; 54          OLED_print_string(36, 0, "SShahyriar");
 268  00e1 ae0004        	ldw	x,#L15
 269  00e4 89            	pushw	x
 270  00e5 ae2400        	ldw	x,#9216
 271  00e8 cd0000        	call	_OLED_print_string
 273  00eb 85            	popw	x
 274                     ; 55          Draw_Rectangle(27, 21, 100, 58, ON, ON, ROUND);
 276  00ec 4b01          	push	#1
 277  00ee 4b01          	push	#1
 278  00f0 4b01          	push	#1
 279  00f2 ae003a        	ldw	x,#58
 280  00f5 89            	pushw	x
 281  00f6 ae0064        	ldw	x,#100
 282  00f9 89            	pushw	x
 283  00fa ae0015        	ldw	x,#21
 284  00fd 89            	pushw	x
 285  00fe ae001b        	ldw	x,#27
 286  0101 cd0000        	call	_Draw_Rectangle
 288  0104 5b09          	addw	sp,#9
 289                     ; 56          delay_ms(900);
 291  0106 ae0384        	ldw	x,#900
 292  0109 cd0000        	call	_delay_ms
 294                     ; 57          Draw_Circle(63, 40, 9, ON, OFF);
 296  010c 4b00          	push	#0
 297  010e 4b01          	push	#1
 298  0110 ae0009        	ldw	x,#9
 299  0113 89            	pushw	x
 300  0114 ae0028        	ldw	x,#40
 301  0117 89            	pushw	x
 302  0118 ae003f        	ldw	x,#63
 303  011b cd0000        	call	_Draw_Circle
 305  011e 5b06          	addw	sp,#6
 306                     ; 58          delay_ms(2000);
 308  0120 ad5d          	call	LC002
 310                     ; 62          for(p = 0; p < 254; p++)
 312  0122 0f07          	clr	(OFST+0,sp)
 314  0124               L35:
 315                     ; 64              f += 0.1;
 317  0124 ae0000        	ldw	x,#L56
 318  0127 cd0000        	call	c_ltor
 320  012a 96            	ldw	x,sp
 321  012b 1c0003        	addw	x,#OFST-4
 322  012e cd0000        	call	c_fgadd
 325                     ; 65              i += 1;
 327  0131 1e01          	ldw	x,(OFST-6,sp)
 328  0133 5c            	incw	x
 329  0134 1f01          	ldw	(OFST-6,sp),x
 331                     ; 67              OLED_print_float(42, 2, f, 1);
 333  0136 4b01          	push	#1
 334  0138 1e06          	ldw	x,(OFST-1,sp)
 335  013a 89            	pushw	x
 336  013b 1e06          	ldw	x,(OFST-1,sp)
 337  013d 89            	pushw	x
 338  013e ae2a02        	ldw	x,#10754
 339  0141 cd0000        	call	_OLED_print_float
 341  0144 5b05          	addw	sp,#5
 342                     ; 68              OLED_print_int(42, 3, i);
 344  0146 1e01          	ldw	x,(OFST-6,sp)
 345  0148 cd0000        	call	c_itolx
 347  014b be02          	ldw	x,c_lreg+2
 348  014d 89            	pushw	x
 349  014e be00          	ldw	x,c_lreg
 350  0150 89            	pushw	x
 351  0151 ae2a03        	ldw	x,#10755
 352  0154 cd0000        	call	_OLED_print_int
 354  0157 5b04          	addw	sp,#4
 355                     ; 69              OLED_print_chr(42, 4, p);
 357  0159 7b07          	ld	a,(OFST+0,sp)
 358  015b 5f            	clrw	x
 359  015c 97            	ld	xl,a
 360  015d 89            	pushw	x
 361  015e ae2a04        	ldw	x,#10756
 362  0161 cd0000        	call	_OLED_print_chr
 364  0164 85            	popw	x
 365                     ; 71              delay_ms(99);
 367  0165 ae0063        	ldw	x,#99
 368  0168 cd0000        	call	_delay_ms
 370                     ; 62          for(p = 0; p < 254; p++)
 372  016b 0c07          	inc	(OFST+0,sp)
 376  016d 7b07          	ld	a,(OFST+0,sp)
 377  016f a1fe          	cp	a,#254
 378  0171 25b1          	jrult	L35
 380  0173 cc000b        	jra	L14
 381  0176               LC001:
 382  0176 cd0000        	call	_OLED_fill
 384                     ; 35          delay_ms(600);
 386  0179 ae0258        	ldw	x,#600
 387  017c cc0000        	jp	_delay_ms
 388  017f               LC002:
 389  017f ae07d0        	ldw	x,#2000
 390  0182 cd0000        	call	_delay_ms
 392                     ; 60          OLED_fill(0x00);
 394  0185 4f            	clr	a
 395  0186 cd0000        	call	_OLED_fill
 397                     ; 61          OLED_clear_buffer();
 399  0189 cc0000        	jp	_OLED_clear_buffer
 432                     ; 77 void setup_clock(void)
 432                     ; 78 {
 433                     	switch	.text
 434  018c               _setup_clock:
 438                     ; 79 	CLK_DeInit();
 440  018c cd0000        	call	_CLK_DeInit
 442                     ; 81 	CLK_HSECmd(ENABLE);
 444  018f a601          	ld	a,#1
 445  0191 cd0000        	call	_CLK_HSECmd
 448  0194               L301:
 449                     ; 82 	while(CLK_GetFlagStatus(CLK_FLAG_HSERDY) == FALSE);
 451  0194 ae0202        	ldw	x,#514
 452  0197 cd0000        	call	_CLK_GetFlagStatus
 454  019a 4d            	tnz	a
 455  019b 27f7          	jreq	L301
 456                     ; 84 	CLK_LSICmd(DISABLE);
 458  019d 4f            	clr	a
 459  019e cd0000        	call	_CLK_LSICmd
 461                     ; 86 	CLK_HSICmd(ENABLE);
 463  01a1 a601          	ld	a,#1
 464  01a3 cd0000        	call	_CLK_HSICmd
 467  01a6               L111:
 468                     ; 87 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 470  01a6 ae0102        	ldw	x,#258
 471  01a9 cd0000        	call	_CLK_GetFlagStatus
 473  01ac 4d            	tnz	a
 474  01ad 27f7          	jreq	L111
 475                     ; 89 	CLK_ClockSwitchCmd(ENABLE);
 477  01af a601          	ld	a,#1
 478  01b1 cd0000        	call	_CLK_ClockSwitchCmd
 480                     ; 90 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 482  01b4 a618          	ld	a,#24
 483  01b6 cd0000        	call	_CLK_HSIPrescalerConfig
 485                     ; 91 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 487  01b9 a680          	ld	a,#128
 488  01bb cd0000        	call	_CLK_SYSCLKConfig
 490                     ; 93 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 
 490                     ; 94 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 492  01be 4b01          	push	#1
 493  01c0 4b00          	push	#0
 494  01c2 ae01b4        	ldw	x,#436
 495  01c5 cd0000        	call	_CLK_ClockSwitchConfig
 497  01c8 85            	popw	x
 498                     ; 96 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 500  01c9 ae0100        	ldw	x,#256
 501  01cc cd0000        	call	_CLK_PeripheralClockConfig
 503                     ; 97 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 505  01cf ae0001        	ldw	x,#1
 506  01d2 cd0000        	call	_CLK_PeripheralClockConfig
 508                     ; 98 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 510  01d5 ae1300        	ldw	x,#4864
 511  01d8 cd0000        	call	_CLK_PeripheralClockConfig
 513                     ; 99 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 515  01db ae1200        	ldw	x,#4608
 516  01de cd0000        	call	_CLK_PeripheralClockConfig
 518                     ; 100 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
 520  01e1 ae0300        	ldw	x,#768
 521  01e4 cd0000        	call	_CLK_PeripheralClockConfig
 523                     ; 101 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 525  01e7 ae0700        	ldw	x,#1792
 526  01ea cd0000        	call	_CLK_PeripheralClockConfig
 528                     ; 102 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 530  01ed ae0500        	ldw	x,#1280
 531  01f0 cd0000        	call	_CLK_PeripheralClockConfig
 533                     ; 103 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
 535  01f3 ae0600        	ldw	x,#1536
 536  01f6 cd0000        	call	_CLK_PeripheralClockConfig
 538                     ; 104 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 540  01f9 ae0400        	ldw	x,#1024
 542                     ; 105 }
 545  01fc cc0000        	jp	_CLK_PeripheralClockConfig
 569                     ; 108 void setup_GPIOs(void)
 569                     ; 109 {
 570                     	switch	.text
 571  01ff               _setup_GPIOs:
 575                     ; 110 	GPIO_DeInit(I2C_PORT);
 577  01ff ae5014        	ldw	x,#20500
 579                     ; 111 }
 582  0202 cc0000        	jp	_GPIO_DeInit
 607                     	xdef	_main
 608                     	xdef	_setup_GPIOs
 609                     	xdef	_setup_clock
 610                     	xref	_Draw_Circle
 611                     	xref	_Draw_Rectangle
 612                     	xref	_Draw_Line
 613                     	xref	_OLED_print_float
 614                     	xref	_OLED_print_int
 615                     	xref	_OLED_print_chr
 616                     	xref	_OLED_print_string
 617                     	xref	_OLED_clear_buffer
 618                     	xref	_OLED_fill
 619                     	xref	_OLED_init
 620                     	switch	.bss
 621  0000               _buffer:
 622  0000 000000000000  	ds.b	1024
 623                     	xdef	_buffer
 624                     	xref	_delay_ms
 625                     	xref	_GPIO_DeInit
 626                     	xref	_CLK_GetFlagStatus
 627                     	xref	_CLK_SYSCLKConfig
 628                     	xref	_CLK_HSIPrescalerConfig
 629                     	xref	_CLK_ClockSwitchConfig
 630                     	xref	_CLK_PeripheralClockConfig
 631                     	xref	_CLK_ClockSwitchCmd
 632                     	xref	_CLK_LSICmd
 633                     	xref	_CLK_HSICmd
 634                     	xref	_CLK_HSECmd
 635                     	xref	_CLK_DeInit
 636                     .const:	section	.text
 637  0000               L56:
 638  0000 3dcccccc      	dc.w	15820,-13108
 639  0004               L15:
 640  0004 535368616879  	dc.b	"SShahyriar",0
 641  000f               L74:
 642  000f 66622e636f6d  	dc.b	"fb.com/MicroArena",0
 643  0021               L54:
 644  0021 4d6963726f41  	dc.b	"MicroArena",0
 645  002c               L53:
 646  002c c1200000      	dc.w	-16096,0
 647                     	xref.b	c_lreg
 648                     	xref.b	c_x
 668                     	xref	c_itolx
 669                     	xref	c_fgadd
 670                     	xref	c_ltor
 671                     	end
