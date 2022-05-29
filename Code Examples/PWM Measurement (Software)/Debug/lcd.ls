   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 4 void SPI_setup(void)
  45                     ; 5 {
  47                     	switch	.text
  48  0000               _SPI_setup:
  52                     ; 6 	SPI_DeInit();
  54  0000 cd0000        	call	_SPI_DeInit
  56                     ; 8 	SPI_Init(SPI_FIRSTBIT_MSB, 
  56                     ; 9 				  SPI_BAUDRATEPRESCALER_128, 
  56                     ; 10 				  SPI_MODE_MASTER, 
  56                     ; 11 				  SPI_CLOCKPOLARITY_LOW, 
  56                     ; 12 				  SPI_CLOCKPHASE_1EDGE, 
  56                     ; 13 				  SPI_DATADIRECTION_1LINE_TX, 
  56                     ; 14 				  SPI_NSS_SOFT, 
  56                     ; 15 				  0x00);
  58  0003 4b00          	push	#0
  59  0005 4b02          	push	#2
  60  0007 4bc0          	push	#192
  61  0009 4b00          	push	#0
  62  000b 4b00          	push	#0
  63  000d 4b04          	push	#4
  64  000f ae0030        	ldw	x,#48
  65  0012 cd0000        	call	_SPI_Init
  67  0015 5b06          	addw	sp,#6
  68                     ; 17 	SPI_Cmd(ENABLE);
  70  0017 a601          	ld	a,#1
  71  0019 cd0000        	call	_SPI_Cmd
  73                     ; 18 }
  76  001c 81            	ret
 104                     ; 21 void LCD_write(void)
 104                     ; 22 {
 105                     	switch	.text
 106  001d               _LCD_write:
 110  001d               L33:
 111                     ; 23     while(SPI_GetFlagStatus(SPI_FLAG_BSY));
 113  001d a680          	ld	a,#128
 114  001f cd0000        	call	_SPI_GetFlagStatus
 116  0022 4d            	tnz	a
 117  0023 26f8          	jrne	L33
 118                     ; 24 	GPIO_WriteHigh(GPIOC, GPIO_PIN_4);
 120  0025 4b10          	push	#16
 121  0027 ae500a        	ldw	x,#20490
 122  002a cd0000        	call	_GPIO_WriteHigh
 124  002d 84            	pop	a
 125                     ; 25 	SPI_SendData(data_value);
 127  002e b600          	ld	a,_data_value
 128  0030 cd0000        	call	_SPI_SendData
 130                     ; 26 	GPIO_WriteLow(GPIOC, GPIO_PIN_4);
 132  0033 4b10          	push	#16
 133  0035 ae500a        	ldw	x,#20490
 134  0038 cd0000        	call	_GPIO_WriteLow
 136  003b 84            	pop	a
 138  003c               L14:
 139                     ; 27 	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
 141  003c a602          	ld	a,#2
 142  003e cd0000        	call	_SPI_GetFlagStatus
 144  0041 4d            	tnz	a
 145  0042 27f8          	jreq	L14
 146                     ; 28 }
 149  0044 81            	ret
 189                     ; 31 void LCD_init(void)
 189                     ; 32 {                                     
 190                     	switch	.text
 191  0045               _LCD_init:
 193  0045 88            	push	a
 194       00000001      OFST:	set	1
 197                     ; 33     unsigned char t = 0x00;
 199                     ; 35 	GPIO_Init(GPIOC, 
 199                     ; 36 					 ((GPIO_Pin_TypeDef)(GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6)), 
 199                     ; 37 					 GPIO_MODE_OUT_PP_LOW_FAST);
 201  0046 4be0          	push	#224
 202  0048 4b70          	push	#112
 203  004a ae500a        	ldw	x,#20490
 204  004d cd0000        	call	_GPIO_Init
 206  0050 85            	popw	x
 207                     ; 39 	delay_ms(10);
 209  0051 ae000a        	ldw	x,#10
 210  0054 cd0000        	call	_delay_ms
 212                     ; 40 	SPI_setup();
 214  0057 ada7          	call	_SPI_setup
 216                     ; 41 	delay_ms(100);
 218  0059 ae0064        	ldw	x,#100
 219  005c cd0000        	call	_delay_ms
 221                     ; 43     data_value = 0x08;
 223  005f 35080000      	mov	_data_value,#8
 224                     ; 44     LCD_write();
 226  0063 adb8          	call	_LCD_write
 228                     ; 45     delay_ms(100);   
 230  0065 ae0064        	ldw	x,#100
 231  0068 cd0000        	call	_delay_ms
 233                     ; 47 	LCD_send(0x33, CMD);
 235  006b ae3300        	ldw	x,#13056
 236  006e ad34          	call	_LCD_send
 238                     ; 48 	LCD_send(0x32, CMD);
 240  0070 ae3200        	ldw	x,#12800
 241  0073 ad2f          	call	_LCD_send
 243                     ; 50     LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);         
 245  0075 ae2800        	ldw	x,#10240
 246  0078 ad2a          	call	_LCD_send
 248                     ; 51     LCD_send((display_on | cursor_off | blink_off), CMD);     
 250  007a ae0c00        	ldw	x,#3072
 251  007d ad25          	call	_LCD_send
 253                     ; 52     LCD_send((clear_display), CMD);         
 255  007f ae0100        	ldw	x,#256
 256  0082 ad20          	call	_LCD_send
 258                     ; 53     LCD_send((cursor_direction_inc | display_no_shift), CMD);        
 260  0084 ae0600        	ldw	x,#1536
 261  0087 ad1b          	call	_LCD_send
 263                     ; 54 }   
 266  0089 84            	pop	a
 267  008a 81            	ret
 293                     ; 57 void LCD_toggle_EN(void)
 293                     ; 58 {
 294                     	switch	.text
 295  008b               _LCD_toggle_EN:
 299                     ; 59 	data_value |= 0x08;
 301  008b 72160000      	bset	_data_value,#3
 302                     ; 60     LCD_write();
 304  008f ad8c          	call	_LCD_write
 306                     ; 61     delay_ms(dly);
 308  0091 ae0001        	ldw	x,#1
 309  0094 cd0000        	call	_delay_ms
 311                     ; 62     data_value &= 0xF7;
 313  0097 72170000      	bres	_data_value,#3
 314                     ; 63     LCD_write();
 316  009b ad80          	call	_LCD_write
 318                     ; 64     delay_ms(dly);
 320  009d ae0001        	ldw	x,#1
 321  00a0 cd0000        	call	_delay_ms
 323                     ; 65 }
 326  00a3 81            	ret
 372                     ; 68 void LCD_send(unsigned char value, unsigned char mode)
 372                     ; 69 {                               
 373                     	switch	.text
 374  00a4               _LCD_send:
 376  00a4 89            	pushw	x
 377       00000000      OFST:	set	0
 380                     ; 70     switch(mode)
 382  00a5 9f            	ld	a,xl
 383  00a6 a101          	cp	a,#1
 384  00a8 2606          	jrne	L57
 387  00aa               L37:
 388                     ; 74 			data_value |= 0x04;
 390  00aa 72140000      	bset	_data_value,#2
 391                     ; 75 			break;
 393  00ae 2004          	jra	L321
 394  00b0               L57:
 395                     ; 79 			data_value &= 0xFB;
 397  00b0 72150000      	bres	_data_value,#2
 398                     ; 80 			break;
 399  00b4               L321:
 400                     ; 84     LCD_write();
 402  00b4 cd001d        	call	_LCD_write
 404                     ; 85     LCD_4bit_send(value);
 406  00b7 7b01          	ld	a,(OFST+1,sp)
 407  00b9 ad02          	call	_LCD_4bit_send
 409                     ; 86 }  
 412  00bb 85            	popw	x
 413  00bc 81            	ret
 459                     ; 89 void LCD_4bit_send(unsigned char lcd_data)       
 459                     ; 90 {
 460                     	switch	.text
 461  00bd               _LCD_4bit_send:
 463  00bd 88            	push	a
 464  00be 88            	push	a
 465       00000001      OFST:	set	1
 468                     ; 91     unsigned char temp = 0x00;
 470                     ; 93     temp = (lcd_data & 0xF0);
 472  00bf a4f0          	and	a,#240
 473  00c1 6b01          	ld	(OFST+0,sp),a
 475                     ; 94     data_value &= 0x0F;
 477  00c3 b600          	ld	a,_data_value
 478  00c5 a40f          	and	a,#15
 479  00c7 b700          	ld	_data_value,a
 480                     ; 95     data_value |= temp;
 482  00c9 b600          	ld	a,_data_value
 483  00cb 1a01          	or	a,(OFST+0,sp)
 484  00cd b700          	ld	_data_value,a
 485                     ; 96     LCD_write();
 487  00cf cd001d        	call	_LCD_write
 489                     ; 97 	LCD_toggle_EN();
 491  00d2 adb7          	call	_LCD_toggle_EN
 493                     ; 99     temp = (lcd_data & 0x0F);
 495  00d4 7b02          	ld	a,(OFST+1,sp)
 496  00d6 a40f          	and	a,#15
 497  00d8 6b01          	ld	(OFST+0,sp),a
 499                     ; 100     temp <<= 0x04;
 501  00da 7b01          	ld	a,(OFST+0,sp)
 502  00dc 4e            	swap	a
 503  00dd a4f0          	and	a,#240
 504  00df 6b01          	ld	(OFST+0,sp),a
 506                     ; 101     data_value &= 0x0F;
 508  00e1 b600          	ld	a,_data_value
 509  00e3 a40f          	and	a,#15
 510  00e5 b700          	ld	_data_value,a
 511                     ; 102     data_value |= temp;
 513  00e7 b600          	ld	a,_data_value
 514  00e9 1a01          	or	a,(OFST+0,sp)
 515  00eb b700          	ld	_data_value,a
 516                     ; 103     LCD_write();
 518  00ed cd001d        	call	_LCD_write
 520                     ; 104     LCD_toggle_EN();
 522  00f0 ad99          	call	_LCD_toggle_EN
 524                     ; 105 }  
 527  00f2 85            	popw	x
 528  00f3 81            	ret
 564                     ; 108 void LCD_putstr(char *lcd_string)
 564                     ; 109 {
 565                     	switch	.text
 566  00f4               _LCD_putstr:
 568  00f4 89            	pushw	x
 569       00000000      OFST:	set	0
 572  00f5               L761:
 573                     ; 112         LCD_putchar(*lcd_string++);
 575  00f5 1e01          	ldw	x,(OFST+1,sp)
 576  00f7 1c0001        	addw	x,#1
 577  00fa 1f01          	ldw	(OFST+1,sp),x
 578  00fc 1d0001        	subw	x,#1
 579  00ff f6            	ld	a,(x)
 580  0100 ad07          	call	_LCD_putchar
 582                     ; 113     } while(*lcd_string != '\0');
 584  0102 1e01          	ldw	x,(OFST+1,sp)
 585  0104 7d            	tnz	(x)
 586  0105 26ee          	jrne	L761
 587                     ; 114 }
 590  0107 85            	popw	x
 591  0108 81            	ret
 626                     ; 117 void LCD_putchar(char char_data)
 626                     ; 118 {
 627                     	switch	.text
 628  0109               _LCD_putchar:
 632                     ; 119     if((char_data >= 0x20) && (char_data <= 0x7F))
 634  0109 a120          	cp	a,#32
 635  010b 250a          	jrult	L312
 637  010d a180          	cp	a,#128
 638  010f 2406          	jruge	L312
 639                     ; 121 	    LCD_send(char_data, DAT);
 641  0111 ae0001        	ldw	x,#1
 642  0114 95            	ld	xh,a
 643  0115 ad8d          	call	_LCD_send
 645  0117               L312:
 646                     ; 123 }
 649  0117 81            	ret
 673                     ; 126 void LCD_clear_home(void)
 673                     ; 127 {
 674                     	switch	.text
 675  0118               _LCD_clear_home:
 679                     ; 128     LCD_send(clear_display, CMD);
 681  0118 ae0100        	ldw	x,#256
 682  011b ad87          	call	_LCD_send
 684                     ; 129     LCD_send(goto_home, CMD);
 686  011d ae0200        	ldw	x,#512
 687  0120 ad82          	call	_LCD_send
 689                     ; 130 }
 692  0122 81            	ret
 736                     ; 133 void LCD_goto(unsigned char x_pos,unsigned char y_pos)
 736                     ; 134 {                                                   
 737                     	switch	.text
 738  0123               _LCD_goto:
 740  0123 89            	pushw	x
 741       00000000      OFST:	set	0
 744                     ; 135     if(y_pos == 0)    
 746  0124 9f            	ld	a,xl
 747  0125 4d            	tnz	a
 748  0126 260a          	jrne	L742
 749                     ; 137         LCD_send((0x80 | x_pos), CMD);
 751  0128 9e            	ld	a,xh
 752  0129 aa80          	or	a,#128
 753  012b 5f            	clrw	x
 754  012c 95            	ld	xh,a
 755  012d cd00a4        	call	_LCD_send
 758  0130 2009          	jra	L152
 759  0132               L742:
 760                     ; 141         LCD_send((0x80 | 0x40 | x_pos), CMD); 
 762  0132 7b01          	ld	a,(OFST+1,sp)
 763  0134 aac0          	or	a,#192
 764  0136 5f            	clrw	x
 765  0137 95            	ld	xh,a
 766  0138 cd00a4        	call	_LCD_send
 768  013b               L152:
 769                     ; 143 }
 772  013b 85            	popw	x
 773  013c 81            	ret
 786                     	xdef	_LCD_goto
 787                     	xdef	_LCD_clear_home
 788                     	xdef	_LCD_putchar
 789                     	xdef	_LCD_putstr
 790                     	xdef	_LCD_4bit_send
 791                     	xdef	_LCD_send
 792                     	xdef	_LCD_toggle_EN
 793                     	xdef	_LCD_init
 794                     	xdef	_LCD_write
 795                     	xdef	_SPI_setup
 796                     	xref.b	_data_value
 797                     	xref	_SPI_GetFlagStatus
 798                     	xref	_SPI_SendData
 799                     	xref	_SPI_Cmd
 800                     	xref	_SPI_Init
 801                     	xref	_SPI_DeInit
 802                     	xref	_GPIO_WriteLow
 803                     	xref	_GPIO_WriteHigh
 804                     	xref	_GPIO_Init
 805                     	xref	_delay_ms
 824                     	end
