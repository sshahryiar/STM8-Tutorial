   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  48                     ; 4 void LCD_init(void)
  48                     ; 5 {                       
  50                     	switch	.text
  51  0000               _LCD_init:
  55                     ; 6 	PCF8574_init();
  57  0000 cd0000        	call	_PCF8574_init
  59                     ; 7 	delay_ms(100);
  61  0003 ae0064        	ldw	x,#100
  62  0006 cd0000        	call	_delay_ms
  64                     ; 9 	bl_state = BL_ON;
  66  0009 35010000      	mov	_bl_state,#1
  67                     ; 10     data_value = 0x04;
  69  000d 35040000      	mov	_data_value,#4
  70                     ; 11     PCF8574_write(data_value);
  72  0011 a604          	ld	a,#4
  73  0013 cd0000        	call	_PCF8574_write
  75                     ; 13     delay_ms(10);
  77  0016 ae000a        	ldw	x,#10
  78  0019 cd0000        	call	_delay_ms
  80                     ; 15 	LCD_send(0x33, CMD);
  82  001c ae3300        	ldw	x,#13056
  83  001f ad3b          	call	_LCD_send
  85                     ; 16 	LCD_send(0x32, CMD);
  87  0021 ae3200        	ldw	x,#12800
  88  0024 ad36          	call	_LCD_send
  90                     ; 18     LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);         
  92  0026 ae2800        	ldw	x,#10240
  93  0029 ad31          	call	_LCD_send
  95                     ; 19     LCD_send((display_on | cursor_off | blink_off), CMD);     
  97  002b ae0c00        	ldw	x,#3072
  98  002e ad2c          	call	_LCD_send
 100                     ; 20     LCD_send((clear_display), CMD);         
 102  0030 ae0100        	ldw	x,#256
 103  0033 ad27          	call	_LCD_send
 105                     ; 21     LCD_send((cursor_direction_inc | display_no_shift), CMD);        
 107  0035 ae0600        	ldw	x,#1536
 108  0038 ad22          	call	_LCD_send
 110                     ; 22 }   
 113  003a 81            	ret
 139                     ; 25 void LCD_toggle_EN(void)
 139                     ; 26 {
 140                     	switch	.text
 141  003b               _LCD_toggle_EN:
 145                     ; 27     data_value |= 0x04;
 147  003b 72140000      	bset	_data_value,#2
 148                     ; 28     PCF8574_write(data_value);
 150  003f b600          	ld	a,_data_value
 151  0041 cd0000        	call	_PCF8574_write
 153                     ; 29     delay_ms(dly);
 155  0044 ae0002        	ldw	x,#2
 156  0047 cd0000        	call	_delay_ms
 158                     ; 30     data_value &= 0xF9;
 160  004a b600          	ld	a,_data_value
 161  004c a4f9          	and	a,#249
 162  004e b700          	ld	_data_value,a
 163                     ; 31     PCF8574_write(data_value);
 165  0050 b600          	ld	a,_data_value
 166  0052 cd0000        	call	_PCF8574_write
 168                     ; 32     delay_ms(dly);
 170  0055 ae0002        	ldw	x,#2
 171  0058 cd0000        	call	_delay_ms
 173                     ; 33 }
 176  005b 81            	ret
 224                     ; 36 void LCD_send(unsigned char value, unsigned char mode)
 224                     ; 37 {
 225                     	switch	.text
 226  005c               _LCD_send:
 228  005c 89            	pushw	x
 229       00000000      OFST:	set	0
 232                     ; 38     switch(mode)
 234  005d 9f            	ld	a,xl
 236                     ; 48            break;
 237  005e 4d            	tnz	a
 238  005f 2705          	jreq	L13
 239  0061 4a            	dec	a
 240  0062 270a          	jreq	L33
 241  0064 200c          	jra	L56
 242  0066               L13:
 243                     ; 42             data_value &= 0xF4;
 245  0066 b600          	ld	a,_data_value
 246  0068 a4f4          	and	a,#244
 247  006a b700          	ld	_data_value,a
 248                     ; 43             break;
 250  006c 2004          	jra	L56
 251  006e               L33:
 252                     ; 47            data_value |= 0x01;
 254  006e 72100000      	bset	_data_value,#0
 255                     ; 48            break;
 257  0072               L56:
 258                     ; 52     switch(bl_state)
 260  0072 b600          	ld	a,_bl_state
 262                     ; 62           break;
 263  0074 4d            	tnz	a
 264  0075 2709          	jreq	L73
 265  0077 4a            	dec	a
 266  0078 260a          	jrne	L17
 267                     ; 56           data_value |= 0x08;
 269  007a 72160000      	bset	_data_value,#3
 270                     ; 57           break;
 272  007e 2004          	jra	L17
 273  0080               L73:
 274                     ; 61           data_value &= 0xF7;
 276  0080 72170000      	bres	_data_value,#3
 277                     ; 62           break;
 279  0084               L17:
 280                     ; 66     PCF8574_write(data_value);
 282  0084 b600          	ld	a,_data_value
 283  0086 cd0000        	call	_PCF8574_write
 285                     ; 67     LCD_4bit_send(value);
 287  0089 7b01          	ld	a,(OFST+1,sp)
 288  008b ad08          	call	_LCD_4bit_send
 290                     ; 68     delay_ms(dly);
 292  008d ae0002        	ldw	x,#2
 293  0090 cd0000        	call	_delay_ms
 295                     ; 69 }
 298  0093 85            	popw	x
 299  0094 81            	ret
 345                     ; 72 void LCD_4bit_send(unsigned char lcd_data)       
 345                     ; 73 {
 346                     	switch	.text
 347  0095               _LCD_4bit_send:
 349  0095 88            	push	a
 350  0096 88            	push	a
 351       00000001      OFST:	set	1
 354                     ; 74     unsigned char temp = 0x00;
 356                     ; 76     temp = (lcd_data & 0xF0);
 358  0097 a4f0          	and	a,#240
 359  0099 6b01          	ld	(OFST+0,sp),a
 361                     ; 77     data_value &= 0x0F;
 363  009b b600          	ld	a,_data_value
 364  009d a40f          	and	a,#15
 365  009f b700          	ld	_data_value,a
 366                     ; 78     data_value |= temp;
 368  00a1 b600          	ld	a,_data_value
 369  00a3 1a01          	or	a,(OFST+0,sp)
 370  00a5 b700          	ld	_data_value,a
 371                     ; 79     PCF8574_write(data_value);
 373  00a7 b600          	ld	a,_data_value
 374  00a9 cd0000        	call	_PCF8574_write
 376                     ; 80     LCD_toggle_EN();
 378  00ac ad8d          	call	_LCD_toggle_EN
 380                     ; 82     temp = (lcd_data & 0x0F);
 382  00ae 7b02          	ld	a,(OFST+1,sp)
 383  00b0 a40f          	and	a,#15
 384  00b2 6b01          	ld	(OFST+0,sp),a
 386                     ; 83     temp <<= 0x04;
 388  00b4 7b01          	ld	a,(OFST+0,sp)
 389  00b6 4e            	swap	a
 390  00b7 a4f0          	and	a,#240
 391  00b9 6b01          	ld	(OFST+0,sp),a
 393                     ; 84     data_value &= 0x0F;
 395  00bb b600          	ld	a,_data_value
 396  00bd a40f          	and	a,#15
 397  00bf b700          	ld	_data_value,a
 398                     ; 85     data_value |= temp;
 400  00c1 b600          	ld	a,_data_value
 401  00c3 1a01          	or	a,(OFST+0,sp)
 402  00c5 b700          	ld	_data_value,a
 403                     ; 86     PCF8574_write(data_value);
 405  00c7 b600          	ld	a,_data_value
 406  00c9 cd0000        	call	_PCF8574_write
 408                     ; 87     LCD_toggle_EN();
 410  00cc cd003b        	call	_LCD_toggle_EN
 412                     ; 88 }  
 415  00cf 85            	popw	x
 416  00d0 81            	ret
 452                     ; 91 void LCD_putstr(char *lcd_string)
 452                     ; 92 {
 453                     	switch	.text
 454  00d1               _LCD_putstr:
 456  00d1 89            	pushw	x
 457       00000000      OFST:	set	0
 460  00d2               L331:
 461                     ; 95         LCD_putchar(*lcd_string++);
 463  00d2 1e01          	ldw	x,(OFST+1,sp)
 464  00d4 1c0001        	addw	x,#1
 465  00d7 1f01          	ldw	(OFST+1,sp),x
 466  00d9 1d0001        	subw	x,#1
 467  00dc f6            	ld	a,(x)
 468  00dd ad07          	call	_LCD_putchar
 470                     ; 96     }while(*lcd_string != '\0') ;
 472  00df 1e01          	ldw	x,(OFST+1,sp)
 473  00e1 7d            	tnz	(x)
 474  00e2 26ee          	jrne	L331
 475                     ; 97 }
 478  00e4 85            	popw	x
 479  00e5 81            	ret
 514                     ; 100 void LCD_putchar(char char_data)
 514                     ; 101 {
 515                     	switch	.text
 516  00e6               _LCD_putchar:
 520                     ; 102     LCD_send(char_data, DAT);
 522  00e6 ae0001        	ldw	x,#1
 523  00e9 95            	ld	xh,a
 524  00ea cd005c        	call	_LCD_send
 526                     ; 103 }
 529  00ed 81            	ret
 553                     ; 106 void LCD_clear_home(void)
 553                     ; 107 {
 554                     	switch	.text
 555  00ee               _LCD_clear_home:
 559                     ; 108     LCD_send(clear_display, CMD);
 561  00ee ae0100        	ldw	x,#256
 562  00f1 cd005c        	call	_LCD_send
 564                     ; 109     LCD_send(goto_home, CMD);
 566  00f4 ae0200        	ldw	x,#512
 567  00f7 cd005c        	call	_LCD_send
 569                     ; 110 }
 572  00fa 81            	ret
 616                     ; 113 void LCD_goto(unsigned char x_pos,unsigned char y_pos)
 616                     ; 114 {                                                   
 617                     	switch	.text
 618  00fb               _LCD_goto:
 620  00fb 89            	pushw	x
 621       00000000      OFST:	set	0
 624                     ; 115     if(y_pos == 0)    
 626  00fc 9f            	ld	a,xl
 627  00fd 4d            	tnz	a
 628  00fe 260a          	jrne	L112
 629                     ; 117         LCD_send((0x80 | x_pos), CMD);
 631  0100 9e            	ld	a,xh
 632  0101 aa80          	or	a,#128
 633  0103 5f            	clrw	x
 634  0104 95            	ld	xh,a
 635  0105 cd005c        	call	_LCD_send
 638  0108 2009          	jra	L312
 639  010a               L112:
 640                     ; 121         LCD_send((0x80 | 0x40 | x_pos), CMD); 
 642  010a 7b01          	ld	a,(OFST+1,sp)
 643  010c aac0          	or	a,#192
 644  010e 5f            	clrw	x
 645  010f 95            	ld	xh,a
 646  0110 cd005c        	call	_LCD_send
 648  0113               L312:
 649                     ; 123 }
 652  0113 85            	popw	x
 653  0114 81            	ret
 666                     	xdef	_LCD_goto
 667                     	xdef	_LCD_clear_home
 668                     	xdef	_LCD_putchar
 669                     	xdef	_LCD_putstr
 670                     	xdef	_LCD_4bit_send
 671                     	xdef	_LCD_send
 672                     	xdef	_LCD_toggle_EN
 673                     	xdef	_LCD_init
 674                     	xref.b	_data_value
 675                     	xref.b	_bl_state
 676                     	xref	_PCF8574_write
 677                     	xref	_PCF8574_init
 678                     	xref	_delay_ms
 697                     	end
