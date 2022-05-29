   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  15                     .const:	section	.text
  16  0000               L3_temp:
  17  0000 00            	dc.b	0
  18  0001 00            	dc.b	0
  19  0002 00            	dc.b	0
  20  0003 00            	dc.b	0
  21  0004 00            	dc.b	0
  22  0005 00            	dc.b	0
  23  0006 00            	dc.b	0
  24  0007 00            	dc.b	0
  25  0008               L5_text:
  26  0008 00            	dc.b	0
  27  0009 00            	dc.b	0
  28  000a 00            	dc.b	0
  29  000b 00            	dc.b	0
  30  000c 00            	dc.b	0
  31  000d 00            	dc.b	0
  32  000e 00            	dc.b	0
  33  000f 00            	dc.b	0
  34  0010 00            	dc.b	0
  35  0011 7e            	dc.b	126
  36  0012 04            	dc.b	4
  37  0013 08            	dc.b	8
  38  0014 08            	dc.b	8
  39  0015 04            	dc.b	4
  40  0016 7e            	dc.b	126
  41  0017 00            	dc.b	0
  42  0018 00            	dc.b	0
  43  0019 42            	dc.b	66
  44  001a 42            	dc.b	66
  45  001b 7e            	dc.b	126
  46  001c 7e            	dc.b	126
  47  001d 42            	dc.b	66
  48  001e 42            	dc.b	66
  49  001f 00            	dc.b	0
  50  0020 00            	dc.b	0
  51  0021 3c            	dc.b	60
  52  0022 42            	dc.b	66
  53  0023 42            	dc.b	66
  54  0024 42            	dc.b	66
  55  0025 42            	dc.b	66
  56  0026 24            	dc.b	36
  57  0027 00            	dc.b	0
  58  0028 00            	dc.b	0
  59  0029 7e            	dc.b	126
  60  002a 1a            	dc.b	26
  61  002b 1a            	dc.b	26
  62  002c 1a            	dc.b	26
  63  002d 2a            	dc.b	42
  64  002e 44            	dc.b	68
  65  002f 00            	dc.b	0
  66  0030 00            	dc.b	0
  67  0031 3c            	dc.b	60
  68  0032 42            	dc.b	66
  69  0033 42            	dc.b	66
  70  0034 42            	dc.b	66
  71  0035 42            	dc.b	66
  72  0036 3c            	dc.b	60
  73  0037 00            	dc.b	0
  74  0038 00            	dc.b	0
  75  0039 7c            	dc.b	124
  76  003a 12            	dc.b	18
  77  003b 12            	dc.b	18
  78  003c 12            	dc.b	18
  79  003d 12            	dc.b	18
  80  003e 7c            	dc.b	124
  81  003f 00            	dc.b	0
  82  0040 00            	dc.b	0
  83  0041 7e            	dc.b	126
  84  0042 1a            	dc.b	26
  85  0043 1a            	dc.b	26
  86  0044 1a            	dc.b	26
  87  0045 2a            	dc.b	42
  88  0046 44            	dc.b	68
  89  0047 00            	dc.b	0
  90  0048 00            	dc.b	0
  91  0049 7e            	dc.b	126
  92  004a 7e            	dc.b	126
  93  004b 4a            	dc.b	74
  94  004c 4a            	dc.b	74
  95  004d 4a            	dc.b	74
  96  004e 42            	dc.b	66
  97  004f 00            	dc.b	0
  98  0050 00            	dc.b	0
  99  0051 7e            	dc.b	126
 100  0052 04            	dc.b	4
 101  0053 08            	dc.b	8
 102  0054 10            	dc.b	16
 103  0055 20            	dc.b	32
 104  0056 7e            	dc.b	126
 105  0057 00            	dc.b	0
 106  0058 00            	dc.b	0
 107  0059 7c            	dc.b	124
 108  005a 12            	dc.b	18
 109  005b 12            	dc.b	18
 110  005c 12            	dc.b	18
 111  005d 12            	dc.b	18
 112  005e 7c            	dc.b	124
 113  005f 00            	dc.b	0
 114  0060 00            	dc.b	0
 115  0061 00            	dc.b	0
 116  0062 00            	dc.b	0
 117  0063 00            	dc.b	0
 118  0064 00            	dc.b	0
 119  0065 00            	dc.b	0
 120  0066 00            	dc.b	0
 121  0067 00            	dc.b	0
 196                     ; 10 void main()
 196                     ; 11 {
 198                     	switch	.text
 199  0000               _main:
 201  0000 526c          	subw	sp,#108
 202       0000006c      OFST:	set	108
 205                     ; 12 	unsigned char i = 0x00;
 207                     ; 13     unsigned char j = 0x00;
 209                     ; 15     volatile unsigned char temp[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
 211  0002 96            	ldw	x,sp
 212  0003 1c0063        	addw	x,#OFST-9
 213  0006 90ae0000      	ldw	y,#L3_temp
 214  000a a608          	ld	a,#8
 215  000c cd0000        	call	c_xymvx
 217                     ; 17     const unsigned char text[96] =
 217                     ; 18     {
 217                     ; 19         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   
 217                     ; 20 		0x00, 0x7E, 0x04, 0x08, 0x08, 0x04, 0x7E, 0x00,        //M
 217                     ; 21         0x00, 0x42, 0x42, 0x7E, 0x7E, 0x42, 0x42, 0x00,       //I
 217                     ; 22         0x00, 0x3C, 0x42, 0x42, 0x42, 0x42, 0x24, 0x00,      //C
 217                     ; 23         0x00, 0x7E, 0x1A, 0x1A, 0x1A, 0x2A, 0x44, 0x00,      //R
 217                     ; 24         0x00, 0x3C, 0x42, 0x42, 0x42, 0x42, 0x3C, 0x00,      //O
 217                     ; 25         0x00, 0x7C, 0x12, 0x12, 0x12, 0x12, 0x7C, 0x00,         //A
 217                     ; 26         0x00, 0x7E, 0x1A, 0x1A, 0x1A, 0x2A, 0x44, 0x00,      //R
 217                     ; 27         0x00, 0x7E, 0x7E, 0x4A, 0x4A, 0x4A, 0x42, 0x00,     //E
 217                     ; 28         0x00, 0x7E, 0x04, 0x08, 0x10, 0x20, 0x7E, 0x00,        //N
 217                     ; 29         0x00, 0x7C, 0x12, 0x12, 0x12, 0x12, 0x7C, 0x00,         //A
 217                     ; 30 	    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   
 217                     ; 31     };
 219  000f 96            	ldw	x,sp
 220  0010 1c0003        	addw	x,#OFST-105
 221  0013 90ae0008      	ldw	y,#L5_text
 222  0017 a660          	ld	a,#96
 223  0019 cd0000        	call	c_xymvx
 225                     ; 34 	clock_setup();
 227  001c ad73          	call	_clock_setup
 229                     ; 35 	GPIO_setup();
 231  001e cd00f2        	call	_GPIO_setup
 233                     ; 36 	SPI_setup();
 235  0021 cd0104        	call	_SPI_setup
 237                     ; 37 	MAX72xx_init();
 239  0024 cd0000        	call	_MAX72xx_init
 241  0027               L74:
 242                     ; 41 		for(i = 0; i < sizeof(temp); i++)
 244  0027 0f6b          	clr	(OFST-1,sp)
 246  0029               L35:
 247                     ; 43 			temp[i] = 0x00;
 249  0029 96            	ldw	x,sp
 250  002a 1c0063        	addw	x,#OFST-9
 251  002d 9f            	ld	a,xl
 252  002e 5e            	swapw	x
 253  002f 1b6b          	add	a,(OFST-1,sp)
 254  0031 2401          	jrnc	L6
 255  0033 5c            	incw	x
 256  0034               L6:
 257  0034 02            	rlwa	x,a
 258  0035 7f            	clr	(x)
 259                     ; 41 		for(i = 0; i < sizeof(temp); i++)
 261  0036 0c6b          	inc	(OFST-1,sp)
 265  0038 7b6b          	ld	a,(OFST-1,sp)
 266  003a a108          	cp	a,#8
 267  003c 25eb          	jrult	L35
 268                     ; 46 		for(i = 0; i < sizeof(text); i++)
 270  003e 0f6b          	clr	(OFST-1,sp)
 272  0040               L16:
 273                     ; 48             for(j = 0; j < sizeof(temp); j++)
 275  0040 0f6c          	clr	(OFST+0,sp)
 277  0042               L76:
 278                     ; 50                  temp[j] = text[(i + j)];
 280  0042 96            	ldw	x,sp
 281  0043 1c0063        	addw	x,#OFST-9
 282  0046 9f            	ld	a,xl
 283  0047 5e            	swapw	x
 284  0048 1b6c          	add	a,(OFST+0,sp)
 285  004a 2401          	jrnc	L01
 286  004c 5c            	incw	x
 287  004d               L01:
 288  004d 02            	rlwa	x,a
 289  004e 89            	pushw	x
 290  004f 96            	ldw	x,sp
 291  0050 1c0005        	addw	x,#OFST-103
 292  0053 1f03          	ldw	(OFST-105,sp),x
 294  0055 7b6d          	ld	a,(OFST+1,sp)
 295  0057 5f            	clrw	x
 296  0058 1b6e          	add	a,(OFST+2,sp)
 297  005a 2401          	jrnc	L21
 298  005c 5c            	incw	x
 299  005d               L21:
 300  005d 02            	rlwa	x,a
 301  005e 72fb03        	addw	x,(OFST-105,sp)
 302  0061 f6            	ld	a,(x)
 303  0062 85            	popw	x
 304  0063 f7            	ld	(x),a
 305                     ; 51                  MAX72xx_write((1 + j), temp[j]);
 307  0064 96            	ldw	x,sp
 308  0065 1c0063        	addw	x,#OFST-9
 309  0068 9f            	ld	a,xl
 310  0069 5e            	swapw	x
 311  006a 1b6c          	add	a,(OFST+0,sp)
 312  006c 2401          	jrnc	L41
 313  006e 5c            	incw	x
 314  006f               L41:
 315  006f 02            	rlwa	x,a
 316  0070 f6            	ld	a,(x)
 317  0071 97            	ld	xl,a
 318  0072 7b6c          	ld	a,(OFST+0,sp)
 319  0074 4c            	inc	a
 320  0075 95            	ld	xh,a
 321  0076 cd0000        	call	_MAX72xx_write
 323                     ; 52                  delay_ms(9);
 325  0079 ae0009        	ldw	x,#9
 326  007c cd0000        	call	_delay_ms
 328                     ; 48             for(j = 0; j < sizeof(temp); j++)
 330  007f 0c6c          	inc	(OFST+0,sp)
 334  0081 7b6c          	ld	a,(OFST+0,sp)
 335  0083 a108          	cp	a,#8
 336  0085 25bb          	jrult	L76
 337                     ; 46 		for(i = 0; i < sizeof(text); i++)
 339  0087 0c6b          	inc	(OFST-1,sp)
 343  0089 7b6b          	ld	a,(OFST-1,sp)
 344  008b a160          	cp	a,#96
 345  008d 25b1          	jrult	L16
 347  008f 2096          	jra	L74
 380                     ; 59 void clock_setup(void)
 380                     ; 60 {
 381                     	switch	.text
 382  0091               _clock_setup:
 386                     ; 61 	CLK_DeInit();
 388  0091 cd0000        	call	_CLK_DeInit
 390                     ; 63 	CLK_HSECmd(DISABLE);
 392  0094 4f            	clr	a
 393  0095 cd0000        	call	_CLK_HSECmd
 395                     ; 64 	CLK_LSICmd(DISABLE);
 397  0098 4f            	clr	a
 398  0099 cd0000        	call	_CLK_LSICmd
 400                     ; 65 	CLK_HSICmd(ENABLE);
 402  009c a601          	ld	a,#1
 403  009e cd0000        	call	_CLK_HSICmd
 406  00a1               L701:
 407                     ; 66 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 409  00a1 ae0102        	ldw	x,#258
 410  00a4 cd0000        	call	_CLK_GetFlagStatus
 412  00a7 4d            	tnz	a
 413  00a8 27f7          	jreq	L701
 414                     ; 68 	CLK_ClockSwitchCmd(ENABLE);
 416  00aa a601          	ld	a,#1
 417  00ac cd0000        	call	_CLK_ClockSwitchCmd
 419                     ; 69 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 421  00af 4f            	clr	a
 422  00b0 cd0000        	call	_CLK_HSIPrescalerConfig
 424                     ; 70 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 426  00b3 a680          	ld	a,#128
 427  00b5 cd0000        	call	_CLK_SYSCLKConfig
 429                     ; 72 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 429                     ; 73 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 431  00b8 4b01          	push	#1
 432  00ba 4b00          	push	#0
 433  00bc ae01e1        	ldw	x,#481
 434  00bf cd0000        	call	_CLK_ClockSwitchConfig
 436  00c2 85            	popw	x
 437                     ; 75 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
 439  00c3 ae0101        	ldw	x,#257
 440  00c6 cd0000        	call	_CLK_PeripheralClockConfig
 442                     ; 76 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 444  00c9 5f            	clrw	x
 445  00ca cd0000        	call	_CLK_PeripheralClockConfig
 447                     ; 77 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 449  00cd ae1300        	ldw	x,#4864
 450  00d0 cd0000        	call	_CLK_PeripheralClockConfig
 452                     ; 78 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 454  00d3 ae1200        	ldw	x,#4608
 455  00d6 cd0000        	call	_CLK_PeripheralClockConfig
 457                     ; 79 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 459  00d9 ae0300        	ldw	x,#768
 460  00dc cd0000        	call	_CLK_PeripheralClockConfig
 462                     ; 80 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 464  00df ae0700        	ldw	x,#1792
 465  00e2 cd0000        	call	_CLK_PeripheralClockConfig
 467                     ; 81 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 469  00e5 ae0500        	ldw	x,#1280
 470  00e8 cd0000        	call	_CLK_PeripheralClockConfig
 472                     ; 82 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 474  00eb ae0400        	ldw	x,#1024
 475  00ee cd0000        	call	_CLK_PeripheralClockConfig
 477                     ; 83 }
 480  00f1 81            	ret
 505                     ; 86 void GPIO_setup(void)
 505                     ; 87 {
 506                     	switch	.text
 507  00f2               _GPIO_setup:
 511                     ; 88 	GPIO_DeInit(GPIOC);
 513  00f2 ae500a        	ldw	x,#20490
 514  00f5 cd0000        	call	_GPIO_DeInit
 516                     ; 89 	GPIO_Init(GPIOC, ((GPIO_Pin_TypeDef)GPIO_PIN_5 | GPIO_PIN_6), GPIO_MODE_OUT_PP_HIGH_FAST);
 518  00f8 4bf0          	push	#240
 519  00fa 4b60          	push	#96
 520  00fc ae500a        	ldw	x,#20490
 521  00ff cd0000        	call	_GPIO_Init
 523  0102 85            	popw	x
 524                     ; 90 }
 527  0103 81            	ret
 553                     ; 93 void SPI_setup(void)
 553                     ; 94 {
 554                     	switch	.text
 555  0104               _SPI_setup:
 559                     ; 95 	SPI_DeInit();
 561  0104 cd0000        	call	_SPI_DeInit
 563                     ; 96 	SPI_Init(SPI_FIRSTBIT_MSB, 
 563                     ; 97 				  SPI_BAUDRATEPRESCALER_2, 
 563                     ; 98 				  SPI_MODE_MASTER, 
 563                     ; 99 				  SPI_CLOCKPOLARITY_HIGH, 
 563                     ; 100 				  SPI_CLOCKPHASE_1EDGE, 
 563                     ; 101 				  SPI_DATADIRECTION_1LINE_TX, 
 563                     ; 102 				  SPI_NSS_SOFT, 
 563                     ; 103 				  0x00);
 565  0107 4b00          	push	#0
 566  0109 4b02          	push	#2
 567  010b 4bc0          	push	#192
 568  010d 4b00          	push	#0
 569  010f 4b02          	push	#2
 570  0111 4b04          	push	#4
 571  0113 5f            	clrw	x
 572  0114 cd0000        	call	_SPI_Init
 574  0117 5b06          	addw	sp,#6
 575                     ; 104 	SPI_Cmd(ENABLE);
 577  0119 a601          	ld	a,#1
 578  011b cd0000        	call	_SPI_Cmd
 580                     ; 105 }
 583  011e 81            	ret
 596                     	xdef	_main
 597                     	xdef	_SPI_setup
 598                     	xdef	_GPIO_setup
 599                     	xdef	_clock_setup
 600                     	xref	_MAX72xx_write
 601                     	xref	_MAX72xx_init
 602                     	xref	_SPI_Cmd
 603                     	xref	_SPI_Init
 604                     	xref	_SPI_DeInit
 605                     	xref	_GPIO_Init
 606                     	xref	_GPIO_DeInit
 607                     	xref	_CLK_GetFlagStatus
 608                     	xref	_CLK_SYSCLKConfig
 609                     	xref	_CLK_HSIPrescalerConfig
 610                     	xref	_CLK_ClockSwitchConfig
 611                     	xref	_CLK_PeripheralClockConfig
 612                     	xref	_CLK_ClockSwitchCmd
 613                     	xref	_CLK_LSICmd
 614                     	xref	_CLK_HSICmd
 615                     	xref	_CLK_HSECmd
 616                     	xref	_CLK_DeInit
 617                     	xref	_delay_ms
 618                     	xref.b	c_x
 637                     	xref	c_xymvx
 638                     	end
