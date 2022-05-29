   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  74                     ; 4 void SIPO(void)
  74                     ; 5 {
  76                     	switch	.text
  77  0000               _SIPO:
  79  0000 5203          	subw	sp,#3
  80       00000003      OFST:	set	3
  83                     ; 6     unsigned char bit = 0x00;
  85                     ; 7     unsigned char clk = 0x08;
  87  0002 a608          	ld	a,#8
  88  0004 6b01          	ld	(OFST-2,sp),a
  90                     ; 8     unsigned char temp = 0x00;
  92                     ; 10     temp = data_value;
  94  0006 b600          	ld	a,_data_value
  95  0008 6b02          	ld	(OFST-1,sp),a
  97                     ; 11     LCD_STB_LOW();
  99  000a 4b04          	push	#4
 100  000c ae500f        	ldw	x,#20495
 101  000f cd0000        	call	_GPIO_WriteLow
 103  0012 84            	pop	a
 105  0013 203d          	jra	L54
 106  0015               L34:
 107                     ; 15         bit = ((temp & 0x80) >> 0x07);
 109  0015 7b02          	ld	a,(OFST-1,sp)
 110  0017 49            	rlc	a
 111  0018 4f            	clr	a
 112  0019 49            	rlc	a
 113  001a 6b03          	ld	(OFST+0,sp),a
 115                     ; 16         bit &= 0x01;
 117  001c 7b03          	ld	a,(OFST+0,sp)
 118  001e a401          	and	a,#1
 119  0020 6b03          	ld	(OFST+0,sp),a
 121                     ; 18         switch(bit)
 123  0022 0d03          	tnz	(OFST+0,sp)
 124  0024 2621          	jrne	L5
 127  0026               L3:
 128                     ; 22                 LCD_SDI_LOW();
 130  0026 4b10          	push	#16
 131  0028 ae500f        	ldw	x,#20495
 132  002b cd0000        	call	_GPIO_WriteLow
 134  002e 84            	pop	a
 135                     ; 23                 break;
 136  002f               L35:
 137                     ; 32         LCD_SCK_HIGH();
 139  002f 4b08          	push	#8
 140  0031 ae500f        	ldw	x,#20495
 141  0034 cd0000        	call	_GPIO_WriteHigh
 143  0037 84            	pop	a
 144                     ; 34         temp <<= 0x01;
 146  0038 0802          	sll	(OFST-1,sp)
 148                     ; 35         clk--;
 150  003a 0a01          	dec	(OFST-2,sp)
 152                     ; 37         LCD_SCK_LOW();
 154  003c 4b08          	push	#8
 155  003e ae500f        	ldw	x,#20495
 156  0041 cd0000        	call	_GPIO_WriteLow
 158  0044 84            	pop	a
 159  0045 200b          	jra	L54
 160  0047               L5:
 161                     ; 27                 LCD_SDI_HIGH();
 163  0047 4b10          	push	#16
 164  0049 ae500f        	ldw	x,#20495
 165  004c cd0000        	call	_GPIO_WriteHigh
 167  004f 84            	pop	a
 168                     ; 28                 break;
 170  0050 20dd          	jra	L35
 171  0052               L54:
 172                     ; 13     while(clk > 0)
 174  0052 0d01          	tnz	(OFST-2,sp)
 175  0054 26bf          	jrne	L34
 176                     ; 40     LCD_STB_HIGH();
 179  0056 4b04          	push	#4
 180  0058 ae500f        	ldw	x,#20495
 181  005b cd0000        	call	_GPIO_WriteHigh
 183  005e 84            	pop	a
 184                     ; 41 }
 187  005f 5b03          	addw	sp,#3
 188  0061 81            	ret
 227                     ; 44 void LCD_init(void)
 227                     ; 45 {                                     
 228                     	switch	.text
 229  0062               _LCD_init:
 231  0062 88            	push	a
 232       00000001      OFST:	set	1
 235                     ; 46     unsigned char t = 0x00;
 237                     ; 48 	GPIO_Init(LCD_PORT, 
 237                     ; 49 					 ((GPIO_Pin_TypeDef)(LCD_STB_pin | LCD_SCK_pin | LCD_SDI_pin)), 
 237                     ; 50 					 GPIO_MODE_OUT_PP_HIGH_FAST);
 239  0063 4bf0          	push	#240
 240  0065 4b1c          	push	#28
 241  0067 ae500f        	ldw	x,#20495
 242  006a cd0000        	call	_GPIO_Init
 244  006d 85            	popw	x
 245                     ; 52     data_value = 0x08;
 247  006e 35080000      	mov	_data_value,#8
 248                     ; 53     SIPO();
 250  0072 ad8c          	call	_SIPO
 252                     ; 54     delay_ms(10);   
 254  0074 ae000a        	ldw	x,#10
 255  0077 cd0000        	call	_delay_ms
 257                     ; 56 	LCD_send(0x33, CMD);
 259  007a ae3300        	ldw	x,#13056
 260  007d ad36          	call	_LCD_send
 262                     ; 57 	LCD_send(0x32, CMD);
 264  007f ae3200        	ldw	x,#12800
 265  0082 ad31          	call	_LCD_send
 267                     ; 59     LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);         
 269  0084 ae2800        	ldw	x,#10240
 270  0087 ad2c          	call	_LCD_send
 272                     ; 60     LCD_send((display_on | cursor_off | blink_off), CMD);     
 274  0089 ae0c00        	ldw	x,#3072
 275  008c ad27          	call	_LCD_send
 277                     ; 61     LCD_send((clear_display), CMD);         
 279  008e ae0100        	ldw	x,#256
 280  0091 ad22          	call	_LCD_send
 282                     ; 62     LCD_send((cursor_direction_inc | display_no_shift), CMD);        
 284  0093 ae0600        	ldw	x,#1536
 285  0096 ad1d          	call	_LCD_send
 287                     ; 63 }   
 290  0098 84            	pop	a
 291  0099 81            	ret
 317                     ; 66 void LCD_toggle_EN(void)
 317                     ; 67 {
 318                     	switch	.text
 319  009a               _LCD_toggle_EN:
 323                     ; 68 	data_value |= 0x08;
 325  009a 72160000      	bset	_data_value,#3
 326                     ; 69     SIPO();
 328  009e cd0000        	call	_SIPO
 330                     ; 70     delay_ms(dly);
 332  00a1 ae0002        	ldw	x,#2
 333  00a4 cd0000        	call	_delay_ms
 335                     ; 71     data_value &= 0xF7;
 337  00a7 72170000      	bres	_data_value,#3
 338                     ; 72     SIPO();
 340  00ab cd0000        	call	_SIPO
 342                     ; 73     delay_ms(dly);
 344  00ae ae0002        	ldw	x,#2
 345  00b1 cd0000        	call	_delay_ms
 347                     ; 74 }
 350  00b4 81            	ret
 396                     ; 77 void LCD_send(unsigned char value, unsigned char mode)
 396                     ; 78 {                               
 397                     	switch	.text
 398  00b5               _LCD_send:
 400  00b5 89            	pushw	x
 401       00000000      OFST:	set	0
 404                     ; 79     switch(mode)
 406  00b6 9f            	ld	a,xl
 407  00b7 a101          	cp	a,#1
 408  00b9 2606          	jrne	L701
 411  00bb               L501:
 412                     ; 83 			data_value |= 0x04;
 414  00bb 72140000      	bset	_data_value,#2
 415                     ; 84 			break;
 417  00bf 2004          	jra	L531
 418  00c1               L701:
 419                     ; 88 			data_value &= 0xFB;
 421  00c1 72150000      	bres	_data_value,#2
 422                     ; 89 			break;
 423  00c5               L531:
 424                     ; 93     SIPO();
 426  00c5 cd0000        	call	_SIPO
 428                     ; 94     LCD_4bit_send(value);
 430  00c8 7b01          	ld	a,(OFST+1,sp)
 431  00ca ad02          	call	_LCD_4bit_send
 433                     ; 95 }  
 436  00cc 85            	popw	x
 437  00cd 81            	ret
 483                     ; 98 void LCD_4bit_send(unsigned char lcd_data)       
 483                     ; 99 {
 484                     	switch	.text
 485  00ce               _LCD_4bit_send:
 487  00ce 88            	push	a
 488  00cf 88            	push	a
 489       00000001      OFST:	set	1
 492                     ; 100     unsigned char temp = 0x00;
 494                     ; 102     temp = (lcd_data & 0xF0);
 496  00d0 a4f0          	and	a,#240
 497  00d2 6b01          	ld	(OFST+0,sp),a
 499                     ; 103     data_value &= 0x0F;
 501  00d4 b600          	ld	a,_data_value
 502  00d6 a40f          	and	a,#15
 503  00d8 b700          	ld	_data_value,a
 504                     ; 104     data_value |= temp;
 506  00da b600          	ld	a,_data_value
 507  00dc 1a01          	or	a,(OFST+0,sp)
 508  00de b700          	ld	_data_value,a
 509                     ; 105     SIPO();
 511  00e0 cd0000        	call	_SIPO
 513                     ; 106 	LCD_toggle_EN();
 515  00e3 adb5          	call	_LCD_toggle_EN
 517                     ; 108     temp = (lcd_data & 0x0F);
 519  00e5 7b02          	ld	a,(OFST+1,sp)
 520  00e7 a40f          	and	a,#15
 521  00e9 6b01          	ld	(OFST+0,sp),a
 523                     ; 109     temp <<= 0x04;
 525  00eb 7b01          	ld	a,(OFST+0,sp)
 526  00ed 4e            	swap	a
 527  00ee a4f0          	and	a,#240
 528  00f0 6b01          	ld	(OFST+0,sp),a
 530                     ; 110     data_value &= 0x0F;
 532  00f2 b600          	ld	a,_data_value
 533  00f4 a40f          	and	a,#15
 534  00f6 b700          	ld	_data_value,a
 535                     ; 111     data_value |= temp;
 537  00f8 b600          	ld	a,_data_value
 538  00fa 1a01          	or	a,(OFST+0,sp)
 539  00fc b700          	ld	_data_value,a
 540                     ; 112     SIPO();
 542  00fe cd0000        	call	_SIPO
 544                     ; 113     LCD_toggle_EN();
 546  0101 ad97          	call	_LCD_toggle_EN
 548                     ; 114 }  
 551  0103 85            	popw	x
 552  0104 81            	ret
 588                     ; 117 void LCD_putstr(char *lcd_string)
 588                     ; 118 {
 589                     	switch	.text
 590  0105               _LCD_putstr:
 592  0105 89            	pushw	x
 593       00000000      OFST:	set	0
 596  0106 200d          	jra	L302
 597  0108               L102:
 598                     ; 121         LCD_putchar(*lcd_string++);
 600  0108 1e01          	ldw	x,(OFST+1,sp)
 601  010a 1c0001        	addw	x,#1
 602  010d 1f01          	ldw	(OFST+1,sp),x
 603  010f 1d0001        	subw	x,#1
 604  0112 f6            	ld	a,(x)
 605  0113 ad07          	call	_LCD_putchar
 607  0115               L302:
 608                     ; 119     while(*lcd_string != '\0') 
 610  0115 1e01          	ldw	x,(OFST+1,sp)
 611  0117 7d            	tnz	(x)
 612  0118 26ee          	jrne	L102
 613                     ; 123 }
 616  011a 85            	popw	x
 617  011b 81            	ret
 652                     ; 126 void LCD_putchar(char char_data)
 652                     ; 127 {
 653                     	switch	.text
 654  011c               _LCD_putchar:
 658                     ; 128     if((char_data >= 0x20) && (char_data <= 0x7F))
 660  011c a120          	cp	a,#32
 661  011e 250a          	jrult	L522
 663  0120 a180          	cp	a,#128
 664  0122 2406          	jruge	L522
 665                     ; 130 	    LCD_send(char_data, DAT);
 667  0124 ae0001        	ldw	x,#1
 668  0127 95            	ld	xh,a
 669  0128 ad8b          	call	_LCD_send
 671  012a               L522:
 672                     ; 132 }
 675  012a 81            	ret
 699                     ; 135 void LCD_clear_home(void)
 699                     ; 136 {
 700                     	switch	.text
 701  012b               _LCD_clear_home:
 705                     ; 137     LCD_send(clear_display, CMD);
 707  012b ae0100        	ldw	x,#256
 708  012e ad85          	call	_LCD_send
 710                     ; 138     LCD_send(goto_home, CMD);
 712  0130 ae0200        	ldw	x,#512
 713  0133 ad80          	call	_LCD_send
 715                     ; 139 }
 718  0135 81            	ret
 762                     ; 142 void LCD_goto(unsigned char x_pos,unsigned char y_pos)
 762                     ; 143 {                                                   
 763                     	switch	.text
 764  0136               _LCD_goto:
 766  0136 89            	pushw	x
 767       00000000      OFST:	set	0
 770                     ; 144     if(y_pos == 0)    
 772  0137 9f            	ld	a,xl
 773  0138 4d            	tnz	a
 774  0139 260a          	jrne	L162
 775                     ; 146         LCD_send((0x80 | x_pos), CMD);
 777  013b 9e            	ld	a,xh
 778  013c aa80          	or	a,#128
 779  013e 5f            	clrw	x
 780  013f 95            	ld	xh,a
 781  0140 cd00b5        	call	_LCD_send
 784  0143 2009          	jra	L362
 785  0145               L162:
 786                     ; 150         LCD_send((0x80 | 0x40 | x_pos), CMD); 
 788  0145 7b01          	ld	a,(OFST+1,sp)
 789  0147 aac0          	or	a,#192
 790  0149 5f            	clrw	x
 791  014a 95            	ld	xh,a
 792  014b cd00b5        	call	_LCD_send
 794  014e               L362:
 795                     ; 152 }
 798  014e 85            	popw	x
 799  014f 81            	ret
 812                     	xdef	_LCD_goto
 813                     	xdef	_LCD_clear_home
 814                     	xdef	_LCD_putchar
 815                     	xdef	_LCD_putstr
 816                     	xdef	_LCD_4bit_send
 817                     	xdef	_LCD_send
 818                     	xdef	_LCD_toggle_EN
 819                     	xdef	_LCD_init
 820                     	xdef	_SIPO
 821                     	xref.b	_data_value
 822                     	xref	_GPIO_WriteLow
 823                     	xref	_GPIO_WriteHigh
 824                     	xref	_GPIO_Init
 825                     	xref	_delay_ms
 844                     	end
