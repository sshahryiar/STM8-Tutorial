   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  15                     .const:	section	.text
  16  0000               L3_txt1:
  17  0000 4d4943524f41  	dc.b	"MICROARENA",0
  18  000b               L5_txt2:
  19  000b 535368616872  	dc.b	"SShahryiar",0
  20  0016               L7_txt3:
  21  0016 53544d385330  	dc.b	"STM8S003K",0
  22  0020               L11_txt4:
  23  0020 446973636f76  	dc.b	"Discovery",0
 111                     ; 9 void main(void)
 111                     ; 10 {
 113                     	switch	.text
 114  0000               _main:
 116  0000 522b          	subw	sp,#43
 117       0000002b      OFST:	set	43
 120                     ; 11 	const char txt1[] = {"MICROARENA"}; 
 122  0002 96            	ldw	x,sp
 123  0003 1c0001        	addw	x,#OFST-42
 124  0006 90ae0000      	ldw	y,#L3_txt1
 125  000a a60b          	ld	a,#11
 126  000c cd0000        	call	c_xymvx
 128                     ; 12 	const char txt2[] = {"SShahryiar"}; 
 130  000f 96            	ldw	x,sp
 131  0010 1c000c        	addw	x,#OFST-31
 132  0013 90ae000b      	ldw	y,#L5_txt2
 133  0017 a60b          	ld	a,#11
 134  0019 cd0000        	call	c_xymvx
 136                     ; 13 	const char txt3[] = {"STM8S003K"};
 138  001c 96            	ldw	x,sp
 139  001d 1c0017        	addw	x,#OFST-20
 140  0020 90ae0016      	ldw	y,#L7_txt3
 141  0024 a60a          	ld	a,#10
 142  0026 cd0000        	call	c_xymvx
 144                     ; 14 	const char txt4[] = {"Discovery"};
 146  0029 96            	ldw	x,sp
 147  002a 1c0021        	addw	x,#OFST-10
 148  002d 90ae0020      	ldw	y,#L11_txt4
 149  0031 a60a          	ld	a,#10
 150  0033 cd0000        	call	c_xymvx
 152                     ; 16 	unsigned char s = 0x00;
 154                     ; 18 	clock_setup();
 156  0036 cd00bb        	call	_clock_setup
 158                     ; 19 	GPIO_setup();
 160  0039 cd011d        	call	_GPIO_setup
 162                     ; 21 	LCD_init();  
 164  003c cd0000        	call	_LCD_init
 166                     ; 22 	LCD_clear_home(); 
 168  003f cd0000        	call	_LCD_clear_home
 170                     ; 24 	LCD_goto(3, 0);                              
 172  0042 ae0300        	ldw	x,#768
 173  0045 cd0000        	call	_LCD_goto
 175                     ; 25 	LCD_putstr(txt1); 
 177  0048 96            	ldw	x,sp
 178  0049 1c0001        	addw	x,#OFST-42
 179  004c cd0000        	call	_LCD_putstr
 181                     ; 26 	LCD_goto(3, 1);
 183  004f ae0301        	ldw	x,#769
 184  0052 cd0000        	call	_LCD_goto
 186                     ; 27 	LCD_putstr(txt2);
 188  0055 96            	ldw	x,sp
 189  0056 1c000c        	addw	x,#OFST-31
 190  0059 cd0000        	call	_LCD_putstr
 192                     ; 28 	delay_ms(4000);
 194  005c ae0fa0        	ldw	x,#4000
 195  005f cd0000        	call	_delay_ms
 197                     ; 30 	LCD_clear_home(); 
 199  0062 cd0000        	call	_LCD_clear_home
 201                     ; 32 	for(s = 0; s < 9; s++)
 203  0065 0f2b          	clr	(OFST+0,sp)
 205  0067               L75:
 206                     ; 34 		LCD_goto((3 + s), 0);   
 208  0067 7b2b          	ld	a,(OFST+0,sp)
 209  0069 ab03          	add	a,#3
 210  006b 5f            	clrw	x
 211  006c 95            	ld	xh,a
 212  006d cd0000        	call	_LCD_goto
 214                     ; 35 		LCD_putchar(txt3[s]);
 216  0070 96            	ldw	x,sp
 217  0071 1c0017        	addw	x,#OFST-20
 218  0074 9f            	ld	a,xl
 219  0075 5e            	swapw	x
 220  0076 1b2b          	add	a,(OFST+0,sp)
 221  0078 2401          	jrnc	L6
 222  007a 5c            	incw	x
 223  007b               L6:
 224  007b 02            	rlwa	x,a
 225  007c f6            	ld	a,(x)
 226  007d cd0000        	call	_LCD_putchar
 228                     ; 36 		delay_ms(90);
 230  0080 ae005a        	ldw	x,#90
 231  0083 cd0000        	call	_delay_ms
 233                     ; 32 	for(s = 0; s < 9; s++)
 235  0086 0c2b          	inc	(OFST+0,sp)
 239  0088 7b2b          	ld	a,(OFST+0,sp)
 240  008a a109          	cp	a,#9
 241  008c 25d9          	jrult	L75
 242                     ; 38 	for(s = 0; s < 9; s++)
 244  008e 0f2b          	clr	(OFST+0,sp)
 246  0090               L56:
 247                     ; 40 		LCD_goto((3 + s), 1);   
 249  0090 7b2b          	ld	a,(OFST+0,sp)
 250  0092 ab03          	add	a,#3
 251  0094 ae0001        	ldw	x,#1
 252  0097 95            	ld	xh,a
 253  0098 cd0000        	call	_LCD_goto
 255                     ; 41 		LCD_putchar(txt4[s]);
 257  009b 96            	ldw	x,sp
 258  009c 1c0021        	addw	x,#OFST-10
 259  009f 9f            	ld	a,xl
 260  00a0 5e            	swapw	x
 261  00a1 1b2b          	add	a,(OFST+0,sp)
 262  00a3 2401          	jrnc	L01
 263  00a5 5c            	incw	x
 264  00a6               L01:
 265  00a6 02            	rlwa	x,a
 266  00a7 f6            	ld	a,(x)
 267  00a8 cd0000        	call	_LCD_putchar
 269                     ; 42 		delay_ms(90);
 271  00ab ae005a        	ldw	x,#90
 272  00ae cd0000        	call	_delay_ms
 274                     ; 38 	for(s = 0; s < 9; s++)
 276  00b1 0c2b          	inc	(OFST+0,sp)
 280  00b3 7b2b          	ld	a,(OFST+0,sp)
 281  00b5 a109          	cp	a,#9
 282  00b7 25d7          	jrult	L56
 283  00b9               L37:
 284                     ; 45 	while (TRUE);
 286  00b9 20fe          	jra	L37
 319                     ; 49 void clock_setup(void)
 319                     ; 50 {
 320                     	switch	.text
 321  00bb               _clock_setup:
 325                     ; 51 	CLK_DeInit();
 327  00bb cd0000        	call	_CLK_DeInit
 329                     ; 53 	CLK_HSECmd(DISABLE);
 331  00be 4f            	clr	a
 332  00bf cd0000        	call	_CLK_HSECmd
 334                     ; 54 	CLK_LSICmd(DISABLE);
 336  00c2 4f            	clr	a
 337  00c3 cd0000        	call	_CLK_LSICmd
 339                     ; 55 	CLK_HSICmd(ENABLE);
 341  00c6 a601          	ld	a,#1
 342  00c8 cd0000        	call	_CLK_HSICmd
 345  00cb               L111:
 346                     ; 56 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 348  00cb ae0102        	ldw	x,#258
 349  00ce cd0000        	call	_CLK_GetFlagStatus
 351  00d1 4d            	tnz	a
 352  00d2 27f7          	jreq	L111
 353                     ; 58 	CLK_ClockSwitchCmd(ENABLE);
 355  00d4 a601          	ld	a,#1
 356  00d6 cd0000        	call	_CLK_ClockSwitchCmd
 358                     ; 59 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 360  00d9 a618          	ld	a,#24
 361  00db cd0000        	call	_CLK_HSIPrescalerConfig
 363                     ; 60 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 365  00de a680          	ld	a,#128
 366  00e0 cd0000        	call	_CLK_SYSCLKConfig
 368                     ; 62 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 368                     ; 63 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 370  00e3 4b01          	push	#1
 371  00e5 4b00          	push	#0
 372  00e7 ae01e1        	ldw	x,#481
 373  00ea cd0000        	call	_CLK_ClockSwitchConfig
 375  00ed 85            	popw	x
 376                     ; 65 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 378  00ee ae0100        	ldw	x,#256
 379  00f1 cd0000        	call	_CLK_PeripheralClockConfig
 381                     ; 66 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 383  00f4 5f            	clrw	x
 384  00f5 cd0000        	call	_CLK_PeripheralClockConfig
 386                     ; 67 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 388  00f8 ae1300        	ldw	x,#4864
 389  00fb cd0000        	call	_CLK_PeripheralClockConfig
 391                     ; 68 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 393  00fe ae1200        	ldw	x,#4608
 394  0101 cd0000        	call	_CLK_PeripheralClockConfig
 396                     ; 69 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 398  0104 ae0300        	ldw	x,#768
 399  0107 cd0000        	call	_CLK_PeripheralClockConfig
 401                     ; 70 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 403  010a ae0700        	ldw	x,#1792
 404  010d cd0000        	call	_CLK_PeripheralClockConfig
 406                     ; 71 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 408  0110 ae0500        	ldw	x,#1280
 409  0113 cd0000        	call	_CLK_PeripheralClockConfig
 411                     ; 72 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 413  0116 ae0400        	ldw	x,#1024
 414  0119 cd0000        	call	_CLK_PeripheralClockConfig
 416                     ; 73 }
 419  011c 81            	ret
 443                     ; 76 void GPIO_setup(void)
 443                     ; 77 {
 444                     	switch	.text
 445  011d               _GPIO_setup:
 449                     ; 78 	GPIO_DeInit(LCD_PORT);
 451  011d ae500f        	ldw	x,#20495
 452  0120 cd0000        	call	_GPIO_DeInit
 454                     ; 79 }
 457  0123 81            	ret
 470                     	xdef	_main
 471                     	xdef	_GPIO_setup
 472                     	xdef	_clock_setup
 473                     	xref	_LCD_goto
 474                     	xref	_LCD_clear_home
 475                     	xref	_LCD_putchar
 476                     	xref	_LCD_putstr
 477                     	xref	_LCD_init
 478                     	xref	_GPIO_DeInit
 479                     	xref	_CLK_GetFlagStatus
 480                     	xref	_CLK_SYSCLKConfig
 481                     	xref	_CLK_HSIPrescalerConfig
 482                     	xref	_CLK_ClockSwitchConfig
 483                     	xref	_CLK_PeripheralClockConfig
 484                     	xref	_CLK_ClockSwitchCmd
 485                     	xref	_CLK_LSICmd
 486                     	xref	_CLK_HSICmd
 487                     	xref	_CLK_HSECmd
 488                     	xref	_CLK_DeInit
 489                     	xref	_delay_ms
 490                     	xref.b	c_x
 509                     	xref	c_xymvx
 510                     	end
