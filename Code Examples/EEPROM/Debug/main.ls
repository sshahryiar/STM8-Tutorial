   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  68                     ; 19 void main()
  68                     ; 20 {	
  70                     	switch	.text
  71  0000               _main:
  73  0000 88            	push	a
  74       00000001      OFST:	set	1
  77                     ; 21 	unsigned char value = 0x00;
  79                     ; 23 	clock_setup();
  81  0001 cd00c8        	call	_clock_setup
  83                     ; 24 	GPIO_setup();
  85  0004 cd012c        	call	_GPIO_setup
  87                     ; 25 	Flash_setup();
  89  0007 cd013e        	call	_Flash_setup
  91                     ; 27 	LCD_init();  
  93  000a cd0000        	call	_LCD_init
  95                     ; 28 	LCD_clear_home(); 
  97  000d cd0000        	call	_LCD_clear_home
  99                     ; 30 	LCD_goto(0, 0);
 101  0010 5f            	clrw	x
 102  0011 cd0000        	call	_LCD_goto
 104                     ; 31 	LCD_putstr("STM8 EEPROM Test");
 106  0014 ae000c        	ldw	x,#L72
 107  0017 cd0000        	call	_LCD_putstr
 109                     ; 33 	value = FLASH_ReadByte(0x4000);
 111  001a ae4000        	ldw	x,#16384
 112  001d 89            	pushw	x
 113  001e ae0000        	ldw	x,#0
 114  0021 89            	pushw	x
 115  0022 cd0000        	call	_FLASH_ReadByte
 117  0025 5b04          	addw	sp,#4
 118  0027 6b01          	ld	(OFST+0,sp),a
 120                     ; 34 	delay_ms(20);
 122  0029 ae0014        	ldw	x,#20
 123  002c cd0000        	call	_delay_ms
 125                     ; 36 	LCD_goto(0, 1);
 127  002f ae0001        	ldw	x,#1
 128  0032 cd0000        	call	_LCD_goto
 130                     ; 37 	LCD_putstr("WR: ---");
 132  0035 ae0004        	ldw	x,#L13
 133  0038 cd0000        	call	_LCD_putstr
 135                     ; 38 	LCD_goto(9, 1);
 137  003b ae0901        	ldw	x,#2305
 138  003e cd0000        	call	_LCD_goto
 140                     ; 39 	LCD_putstr("RD:");
 142  0041 ae0000        	ldw	x,#L33
 143  0044 cd0000        	call	_LCD_putstr
 145                     ; 40 	lcd_print(13, 1, value);
 147  0047 7b01          	ld	a,(OFST+0,sp)
 148  0049 88            	push	a
 149  004a ae0d01        	ldw	x,#3329
 150  004d cd0142        	call	_lcd_print
 152  0050 84            	pop	a
 153                     ; 41 	delay_ms(2000);
 155  0051 ae07d0        	ldw	x,#2000
 156  0054 cd0000        	call	_delay_ms
 158  0057               L53:
 159                     ; 45 		if(GPIO_ReadInputPin(Button_Port, Button_Pin) == FALSE)
 161  0057 4b80          	push	#128
 162  0059 ae5005        	ldw	x,#20485
 163  005c cd0000        	call	_GPIO_ReadInputPin
 165  005f 5b01          	addw	sp,#1
 166  0061 4d            	tnz	a
 167  0062 264a          	jrne	L14
 169  0064               L54:
 170                     ; 47 			while(GPIO_ReadInputPin(Button_Port, Button_Pin) == FALSE);
 172  0064 4b80          	push	#128
 173  0066 ae5005        	ldw	x,#20485
 174  0069 cd0000        	call	_GPIO_ReadInputPin
 176  006c 5b01          	addw	sp,#1
 177  006e 4d            	tnz	a
 178  006f 27f3          	jreq	L54
 179                     ; 48 			FLASH_Unlock(FLASH_MEMTYPE_DATA);
 181  0071 a6f7          	ld	a,#247
 182  0073 cd0000        	call	_FLASH_Unlock
 184                     ; 49 			FLASH_EraseByte(0x4000);
 186  0076 ae4000        	ldw	x,#16384
 187  0079 89            	pushw	x
 188  007a ae0000        	ldw	x,#0
 189  007d 89            	pushw	x
 190  007e cd0000        	call	_FLASH_EraseByte
 192  0081 5b04          	addw	sp,#4
 193                     ; 50 			delay_ms(20);
 195  0083 ae0014        	ldw	x,#20
 196  0086 cd0000        	call	_delay_ms
 198                     ; 51 			FLASH_ProgramByte(0x4000, value);
 200  0089 7b01          	ld	a,(OFST+0,sp)
 201  008b 88            	push	a
 202  008c ae4000        	ldw	x,#16384
 203  008f 89            	pushw	x
 204  0090 ae0000        	ldw	x,#0
 205  0093 89            	pushw	x
 206  0094 cd0000        	call	_FLASH_ProgramByte
 208  0097 5b05          	addw	sp,#5
 209                     ; 52 			delay_ms(20);
 211  0099 ae0014        	ldw	x,#20
 212  009c cd0000        	call	_delay_ms
 214                     ; 53 			FLASH_Lock(FLASH_MEMTYPE_DATA);
 216  009f a6f7          	ld	a,#247
 217  00a1 cd0000        	call	_FLASH_Lock
 219                     ; 55 			lcd_print(13, 1, value);
 221  00a4 7b01          	ld	a,(OFST+0,sp)
 222  00a6 88            	push	a
 223  00a7 ae0d01        	ldw	x,#3329
 224  00aa cd0142        	call	_lcd_print
 226  00ad 84            	pop	a
 227  00ae               L14:
 228                     ; 58 		delay_ms(20);
 230  00ae ae0014        	ldw	x,#20
 231  00b1 cd0000        	call	_delay_ms
 233                     ; 59 		lcd_print(4, 1, value);
 235  00b4 7b01          	ld	a,(OFST+0,sp)
 236  00b6 88            	push	a
 237  00b7 ae0401        	ldw	x,#1025
 238  00ba cd0142        	call	_lcd_print
 240  00bd 84            	pop	a
 241                     ; 61 		value++;
 243  00be 0c01          	inc	(OFST+0,sp)
 245                     ; 62 		delay_ms(200);
 247  00c0 ae00c8        	ldw	x,#200
 248  00c3 cd0000        	call	_delay_ms
 251  00c6 208f          	jra	L53
 284                     ; 67 void clock_setup(void)
 284                     ; 68 {
 285                     	switch	.text
 286  00c8               _clock_setup:
 290                     ; 69 	CLK_DeInit();
 292  00c8 cd0000        	call	_CLK_DeInit
 294                     ; 71 	CLK_HSECmd(DISABLE);
 296  00cb 4f            	clr	a
 297  00cc cd0000        	call	_CLK_HSECmd
 299                     ; 72 	CLK_LSICmd(DISABLE);
 301  00cf 4f            	clr	a
 302  00d0 cd0000        	call	_CLK_LSICmd
 304                     ; 73 	CLK_HSICmd(ENABLE);
 306  00d3 a601          	ld	a,#1
 307  00d5 cd0000        	call	_CLK_HSICmd
 310  00d8               L36:
 311                     ; 74 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 313  00d8 ae0102        	ldw	x,#258
 314  00db cd0000        	call	_CLK_GetFlagStatus
 316  00de 4d            	tnz	a
 317  00df 27f7          	jreq	L36
 318                     ; 76 	CLK_ClockSwitchCmd(ENABLE);
 320  00e1 a601          	ld	a,#1
 321  00e3 cd0000        	call	_CLK_ClockSwitchCmd
 323                     ; 77 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV4);
 325  00e6 a610          	ld	a,#16
 326  00e8 cd0000        	call	_CLK_HSIPrescalerConfig
 328                     ; 78 											  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 330  00eb a680          	ld	a,#128
 331  00ed cd0000        	call	_CLK_SYSCLKConfig
 333                     ; 80 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, 
 333                     ; 81 											  CLK_SOURCE_HSI, 
 333                     ; 82 											  DISABLE, 
 333                     ; 83 											  CLK_CURRENTCLOCKSTATE_ENABLE);
 335  00f0 4b01          	push	#1
 336  00f2 4b00          	push	#0
 337  00f4 ae01e1        	ldw	x,#481
 338  00f7 cd0000        	call	_CLK_ClockSwitchConfig
 340  00fa 85            	popw	x
 341                     ; 85 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
 343  00fb ae0001        	ldw	x,#1
 344  00fe cd0000        	call	_CLK_PeripheralClockConfig
 346                     ; 86 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 348  0101 ae0100        	ldw	x,#256
 349  0104 cd0000        	call	_CLK_PeripheralClockConfig
 351                     ; 87 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 353  0107 ae1300        	ldw	x,#4864
 354  010a cd0000        	call	_CLK_PeripheralClockConfig
 356                     ; 88 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 358  010d ae1200        	ldw	x,#4608
 359  0110 cd0000        	call	_CLK_PeripheralClockConfig
 361                     ; 89 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 363  0113 ae0300        	ldw	x,#768
 364  0116 cd0000        	call	_CLK_PeripheralClockConfig
 366                     ; 90 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 368  0119 ae0700        	ldw	x,#1792
 369  011c cd0000        	call	_CLK_PeripheralClockConfig
 371                     ; 91 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 373  011f ae0500        	ldw	x,#1280
 374  0122 cd0000        	call	_CLK_PeripheralClockConfig
 376                     ; 92 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 378  0125 ae0400        	ldw	x,#1024
 379  0128 cd0000        	call	_CLK_PeripheralClockConfig
 381                     ; 93 }
 384  012b 81            	ret
 409                     ; 96 void GPIO_setup(void)
 409                     ; 97 {
 410                     	switch	.text
 411  012c               _GPIO_setup:
 415                     ; 98 	GPIO_DeInit(GPIOB);
 417  012c ae5005        	ldw	x,#20485
 418  012f cd0000        	call	_GPIO_DeInit
 420                     ; 99 	GPIO_Init(Button_Port, Button_Pin, GPIO_MODE_IN_FL_NO_IT);
 422  0132 4b00          	push	#0
 423  0134 4b80          	push	#128
 424  0136 ae5005        	ldw	x,#20485
 425  0139 cd0000        	call	_GPIO_Init
 427  013c 85            	popw	x
 428                     ; 100 }
 431  013d 81            	ret
 455                     ; 103 void Flash_setup(void)
 455                     ; 104 {
 456                     	switch	.text
 457  013e               _Flash_setup:
 461                     ; 105 	FLASH_DeInit();
 463  013e cd0000        	call	_FLASH_DeInit
 465                     ; 106 }
 468  0141 81            	ret
 531                     ; 109 void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned char value)
 531                     ; 110 {
 532                     	switch	.text
 533  0142               _lcd_print:
 535  0142 89            	pushw	x
 536  0143 88            	push	a
 537       00000001      OFST:	set	1
 540                     ; 111 	char chr = 0x00;
 542                     ; 113 	chr = ((value / 100) + 0x30);
 544  0144 7b06          	ld	a,(OFST+5,sp)
 545  0146 5f            	clrw	x
 546  0147 97            	ld	xl,a
 547  0148 a664          	ld	a,#100
 548  014a 62            	div	x,a
 549  014b 9f            	ld	a,xl
 550  014c ab30          	add	a,#48
 551  014e 6b01          	ld	(OFST+0,sp),a
 553                     ; 114 	LCD_goto(x_pos, y_pos);
 555  0150 7b03          	ld	a,(OFST+2,sp)
 556  0152 97            	ld	xl,a
 557  0153 7b02          	ld	a,(OFST+1,sp)
 558  0155 95            	ld	xh,a
 559  0156 cd0000        	call	_LCD_goto
 561                     ; 115 	LCD_putchar(chr); 
 563  0159 7b01          	ld	a,(OFST+0,sp)
 564  015b cd0000        	call	_LCD_putchar
 566                     ; 117 	chr = (((value / 10) % 10) + 0x30);
 568  015e 7b06          	ld	a,(OFST+5,sp)
 569  0160 5f            	clrw	x
 570  0161 97            	ld	xl,a
 571  0162 a60a          	ld	a,#10
 572  0164 cd0000        	call	c_sdivx
 574  0167 a60a          	ld	a,#10
 575  0169 cd0000        	call	c_smodx
 577  016c 1c0030        	addw	x,#48
 578  016f 01            	rrwa	x,a
 579  0170 6b01          	ld	(OFST+0,sp),a
 580  0172 02            	rlwa	x,a
 582                     ; 118 	LCD_goto((x_pos + 1), y_pos);
 584  0173 7b03          	ld	a,(OFST+2,sp)
 585  0175 97            	ld	xl,a
 586  0176 7b02          	ld	a,(OFST+1,sp)
 587  0178 4c            	inc	a
 588  0179 95            	ld	xh,a
 589  017a cd0000        	call	_LCD_goto
 591                     ; 119 	LCD_putchar(chr); 
 593  017d 7b01          	ld	a,(OFST+0,sp)
 594  017f cd0000        	call	_LCD_putchar
 596                     ; 121 	chr = ((value % 10) + 0x30);
 598  0182 7b06          	ld	a,(OFST+5,sp)
 599  0184 5f            	clrw	x
 600  0185 97            	ld	xl,a
 601  0186 a60a          	ld	a,#10
 602  0188 62            	div	x,a
 603  0189 5f            	clrw	x
 604  018a 97            	ld	xl,a
 605  018b 9f            	ld	a,xl
 606  018c ab30          	add	a,#48
 607  018e 6b01          	ld	(OFST+0,sp),a
 609                     ; 122 	LCD_goto((x_pos + 2), y_pos);
 611  0190 7b03          	ld	a,(OFST+2,sp)
 612  0192 97            	ld	xl,a
 613  0193 7b02          	ld	a,(OFST+1,sp)
 614  0195 ab02          	add	a,#2
 615  0197 95            	ld	xh,a
 616  0198 cd0000        	call	_LCD_goto
 618                     ; 123 	LCD_putchar(chr); 
 620  019b 7b01          	ld	a,(OFST+0,sp)
 621  019d cd0000        	call	_LCD_putchar
 623                     ; 124 }
 626  01a0 5b03          	addw	sp,#3
 627  01a2 81            	ret
 660                     	xdef	_main
 661                     	xdef	_lcd_print
 662                     	xdef	_Flash_setup
 663                     	xdef	_GPIO_setup
 664                     	xdef	_clock_setup
 665                     	xref	_LCD_goto
 666                     	xref	_LCD_clear_home
 667                     	xref	_LCD_putchar
 668                     	xref	_LCD_putstr
 669                     	xref	_LCD_init
 670                     	switch	.ubsct
 671  0000               _data_value:
 672  0000 00            	ds.b	1
 673                     	xdef	_data_value
 674  0001               _bl_state:
 675  0001 00            	ds.b	1
 676                     	xdef	_bl_state
 677                     	xref	_GPIO_ReadInputPin
 678                     	xref	_GPIO_Init
 679                     	xref	_GPIO_DeInit
 680                     	xref	_FLASH_ReadByte
 681                     	xref	_FLASH_ProgramByte
 682                     	xref	_FLASH_EraseByte
 683                     	xref	_FLASH_DeInit
 684                     	xref	_FLASH_Lock
 685                     	xref	_FLASH_Unlock
 686                     	xref	_CLK_GetFlagStatus
 687                     	xref	_CLK_SYSCLKConfig
 688                     	xref	_CLK_HSIPrescalerConfig
 689                     	xref	_CLK_ClockSwitchConfig
 690                     	xref	_CLK_PeripheralClockConfig
 691                     	xref	_CLK_ClockSwitchCmd
 692                     	xref	_CLK_LSICmd
 693                     	xref	_CLK_HSICmd
 694                     	xref	_CLK_HSECmd
 695                     	xref	_CLK_DeInit
 696                     	xref	_delay_ms
 697                     .const:	section	.text
 698  0000               L33:
 699  0000 52443a00      	dc.b	"RD:",0
 700  0004               L13:
 701  0004 57523a202d2d  	dc.b	"WR: ---",0
 702  000c               L72:
 703  000c 53544d382045  	dc.b	"STM8 EEPROM Test",0
 704                     	xref.b	c_x
 724                     	xref	c_smodx
 725                     	xref	c_sdivx
 726                     	end
