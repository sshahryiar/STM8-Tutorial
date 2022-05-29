   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 4 void LCD_GPIO_init(void)
  45                     ; 5 {
  47                     	switch	.text
  48  0000               _LCD_GPIO_init:
  52                     ; 6 	GPIO_Init(LCD_PORT, LCD_RS, GPIO_MODE_OUT_PP_HIGH_FAST);
  54  0000 4bf0          	push	#240
  55  0002 4b04          	push	#4
  56  0004 ae500a        	ldw	x,#20490
  57  0007 cd0000        	call	_GPIO_Init
  59  000a 85            	popw	x
  60                     ; 7 	GPIO_Init(LCD_PORT, LCD_EN, GPIO_MODE_OUT_PP_HIGH_FAST);
  62  000b 4bf0          	push	#240
  63  000d 4b08          	push	#8
  64  000f ae500a        	ldw	x,#20490
  65  0012 cd0000        	call	_GPIO_Init
  67  0015 85            	popw	x
  68                     ; 8 	GPIO_Init(LCD_PORT, LCD_DB4, GPIO_MODE_OUT_PP_HIGH_FAST);
  70  0016 4bf0          	push	#240
  71  0018 4b10          	push	#16
  72  001a ae500a        	ldw	x,#20490
  73  001d cd0000        	call	_GPIO_Init
  75  0020 85            	popw	x
  76                     ; 9 	GPIO_Init(LCD_PORT, LCD_DB5, GPIO_MODE_OUT_PP_HIGH_FAST);
  78  0021 4bf0          	push	#240
  79  0023 4b20          	push	#32
  80  0025 ae500a        	ldw	x,#20490
  81  0028 cd0000        	call	_GPIO_Init
  83  002b 85            	popw	x
  84                     ; 10 	GPIO_Init(LCD_PORT, LCD_DB6, GPIO_MODE_OUT_PP_HIGH_FAST);
  86  002c 4bf0          	push	#240
  87  002e 4b40          	push	#64
  88  0030 ae500a        	ldw	x,#20490
  89  0033 cd0000        	call	_GPIO_Init
  91  0036 85            	popw	x
  92                     ; 11 	GPIO_Init(LCD_PORT, LCD_DB7, GPIO_MODE_OUT_PP_HIGH_FAST);
  94  0037 4bf0          	push	#240
  95  0039 4b80          	push	#128
  96  003b ae500a        	ldw	x,#20490
  97  003e cd0000        	call	_GPIO_Init
  99  0041 85            	popw	x
 100                     ; 12 	delay_ms(10);    
 102  0042 ae000a        	ldw	x,#10
 103  0045 cd0000        	call	_delay_ms
 105                     ; 13 }
 108  0048 81            	ret
 136                     ; 16 void LCD_init(void)
 136                     ; 17 {                                     
 137                     	switch	.text
 138  0049               _LCD_init:
 142                     ; 18 	LCD_GPIO_init();    
 144  0049 adb5          	call	_LCD_GPIO_init
 146                     ; 19     toggle_EN_pin();
 148  004b cd01d3        	call	_toggle_EN_pin
 150                     ; 21     GPIO_WriteLow(LCD_PORT, LCD_RS);            
 152  004e 4b04          	push	#4
 153  0050 ae500a        	ldw	x,#20490
 154  0053 cd0000        	call	_GPIO_WriteLow
 156  0056 84            	pop	a
 157                     ; 22     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 159  0057 4b80          	push	#128
 160  0059 ae500a        	ldw	x,#20490
 161  005c cd0000        	call	_GPIO_WriteLow
 163  005f 84            	pop	a
 164                     ; 23     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 166  0060 4b40          	push	#64
 167  0062 ae500a        	ldw	x,#20490
 168  0065 cd0000        	call	_GPIO_WriteLow
 170  0068 84            	pop	a
 171                     ; 24     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 173  0069 4b20          	push	#32
 174  006b ae500a        	ldw	x,#20490
 175  006e cd0000        	call	_GPIO_WriteHigh
 177  0071 84            	pop	a
 178                     ; 25     GPIO_WriteHigh(LCD_PORT, LCD_DB4);                      
 180  0072 4b10          	push	#16
 181  0074 ae500a        	ldw	x,#20490
 182  0077 cd0000        	call	_GPIO_WriteHigh
 184  007a 84            	pop	a
 185                     ; 26 	toggle_EN_pin();
 187  007b cd01d3        	call	_toggle_EN_pin
 189                     ; 28     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 191  007e 4b80          	push	#128
 192  0080 ae500a        	ldw	x,#20490
 193  0083 cd0000        	call	_GPIO_WriteLow
 195  0086 84            	pop	a
 196                     ; 29     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 198  0087 4b40          	push	#64
 199  0089 ae500a        	ldw	x,#20490
 200  008c cd0000        	call	_GPIO_WriteLow
 202  008f 84            	pop	a
 203                     ; 30     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 205  0090 4b20          	push	#32
 206  0092 ae500a        	ldw	x,#20490
 207  0095 cd0000        	call	_GPIO_WriteHigh
 209  0098 84            	pop	a
 210                     ; 31     GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
 212  0099 4b10          	push	#16
 213  009b ae500a        	ldw	x,#20490
 214  009e cd0000        	call	_GPIO_WriteHigh
 216  00a1 84            	pop	a
 217                     ; 32     toggle_EN_pin();
 219  00a2 cd01d3        	call	_toggle_EN_pin
 221                     ; 34     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 223  00a5 4b80          	push	#128
 224  00a7 ae500a        	ldw	x,#20490
 225  00aa cd0000        	call	_GPIO_WriteLow
 227  00ad 84            	pop	a
 228                     ; 35     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 230  00ae 4b40          	push	#64
 231  00b0 ae500a        	ldw	x,#20490
 232  00b3 cd0000        	call	_GPIO_WriteLow
 234  00b6 84            	pop	a
 235                     ; 36     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 237  00b7 4b20          	push	#32
 238  00b9 ae500a        	ldw	x,#20490
 239  00bc cd0000        	call	_GPIO_WriteHigh
 241  00bf 84            	pop	a
 242                     ; 37     GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
 244  00c0 4b10          	push	#16
 245  00c2 ae500a        	ldw	x,#20490
 246  00c5 cd0000        	call	_GPIO_WriteHigh
 248  00c8 84            	pop	a
 249                     ; 38     toggle_EN_pin();                  
 251  00c9 cd01d3        	call	_toggle_EN_pin
 253                     ; 40     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 255  00cc 4b80          	push	#128
 256  00ce ae500a        	ldw	x,#20490
 257  00d1 cd0000        	call	_GPIO_WriteLow
 259  00d4 84            	pop	a
 260                     ; 41     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 262  00d5 4b40          	push	#64
 263  00d7 ae500a        	ldw	x,#20490
 264  00da cd0000        	call	_GPIO_WriteLow
 266  00dd 84            	pop	a
 267                     ; 42     GPIO_WriteHigh(LCD_PORT, LCD_DB5);        
 269  00de 4b20          	push	#32
 270  00e0 ae500a        	ldw	x,#20490
 271  00e3 cd0000        	call	_GPIO_WriteHigh
 273  00e6 84            	pop	a
 274                     ; 43     GPIO_WriteLow(LCD_PORT, LCD_DB4);  
 276  00e7 4b10          	push	#16
 277  00e9 ae500a        	ldw	x,#20490
 278  00ec cd0000        	call	_GPIO_WriteLow
 280  00ef 84            	pop	a
 281                     ; 44     toggle_EN_pin();
 283  00f0 cd01d3        	call	_toggle_EN_pin
 285                     ; 46     LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);
 287  00f3 ae2800        	ldw	x,#10240
 288  00f6 ad10          	call	_LCD_send
 290                     ; 47     LCD_send((display_on | cursor_off | blink_off), CMD); 
 292  00f8 ae0c00        	ldw	x,#3072
 293  00fb ad0b          	call	_LCD_send
 295                     ; 48     LCD_send(clear_display, CMD);         
 297  00fd ae0100        	ldw	x,#256
 298  0100 ad06          	call	_LCD_send
 300                     ; 49     LCD_send((cursor_direction_inc | display_no_shift), CMD);
 302  0102 ae0600        	ldw	x,#1536
 303  0105 ad01          	call	_LCD_send
 305                     ; 50 }   
 308  0107 81            	ret
 354                     ; 53 void LCD_send(unsigned char value, unsigned char mode)
 354                     ; 54 {                               
 355                     	switch	.text
 356  0108               _LCD_send:
 358  0108 89            	pushw	x
 359       00000000      OFST:	set	0
 362                     ; 55     switch(mode)
 364  0109 9f            	ld	a,xl
 366                     ; 65 			break;
 367  010a 4d            	tnz	a
 368  010b 270e          	jreq	L33
 369  010d 4a            	dec	a
 370  010e 2614          	jrne	L16
 371                     ; 59 			GPIO_WriteHigh(LCD_PORT, LCD_RS);   
 373  0110 4b04          	push	#4
 374  0112 ae500a        	ldw	x,#20490
 375  0115 cd0000        	call	_GPIO_WriteHigh
 377  0118 84            	pop	a
 378                     ; 60 			break;
 380  0119 2009          	jra	L16
 381  011b               L33:
 382                     ; 64 			GPIO_WriteLow(LCD_PORT, LCD_RS);   
 384  011b 4b04          	push	#4
 385  011d ae500a        	ldw	x,#20490
 386  0120 cd0000        	call	_GPIO_WriteLow
 388  0123 84            	pop	a
 389                     ; 65 			break;
 391  0124               L16:
 392                     ; 69     LCD_4bit_send(value);
 394  0124 7b01          	ld	a,(OFST+1,sp)
 395  0126 ad02          	call	_LCD_4bit_send
 397                     ; 70 }  
 400  0128 85            	popw	x
 401  0129 81            	ret
 437                     ; 73 void LCD_4bit_send(unsigned char lcd_data)       
 437                     ; 74 {
 438                     	switch	.text
 439  012a               _LCD_4bit_send:
 441  012a 88            	push	a
 442       00000000      OFST:	set	0
 445                     ; 75 	toggle_io(lcd_data, 7, LCD_DB7);
 447  012b 4b80          	push	#128
 448  012d ae0007        	ldw	x,#7
 449  0130 95            	ld	xh,a
 450  0131 cd01ec        	call	_toggle_io
 452  0134 84            	pop	a
 453                     ; 76 	toggle_io(lcd_data, 6, LCD_DB6);
 455  0135 4b40          	push	#64
 456  0137 7b02          	ld	a,(OFST+2,sp)
 457  0139 ae0006        	ldw	x,#6
 458  013c 95            	ld	xh,a
 459  013d cd01ec        	call	_toggle_io
 461  0140 84            	pop	a
 462                     ; 77 	toggle_io(lcd_data, 5, LCD_DB5);
 464  0141 4b20          	push	#32
 465  0143 7b02          	ld	a,(OFST+2,sp)
 466  0145 ae0005        	ldw	x,#5
 467  0148 95            	ld	xh,a
 468  0149 cd01ec        	call	_toggle_io
 470  014c 84            	pop	a
 471                     ; 78 	toggle_io(lcd_data, 4, LCD_DB4);
 473  014d 4b10          	push	#16
 474  014f 7b02          	ld	a,(OFST+2,sp)
 475  0151 ae0004        	ldw	x,#4
 476  0154 95            	ld	xh,a
 477  0155 cd01ec        	call	_toggle_io
 479  0158 84            	pop	a
 480                     ; 79     toggle_EN_pin();
 482  0159 ad78          	call	_toggle_EN_pin
 484                     ; 80 	toggle_io(lcd_data, 3, LCD_DB7);
 486  015b 4b80          	push	#128
 487  015d 7b02          	ld	a,(OFST+2,sp)
 488  015f ae0003        	ldw	x,#3
 489  0162 95            	ld	xh,a
 490  0163 cd01ec        	call	_toggle_io
 492  0166 84            	pop	a
 493                     ; 81 	toggle_io(lcd_data, 2, LCD_DB6);
 495  0167 4b40          	push	#64
 496  0169 7b02          	ld	a,(OFST+2,sp)
 497  016b ae0002        	ldw	x,#2
 498  016e 95            	ld	xh,a
 499  016f ad7b          	call	_toggle_io
 501  0171 84            	pop	a
 502                     ; 82 	toggle_io(lcd_data, 1, LCD_DB5);
 504  0172 4b20          	push	#32
 505  0174 7b02          	ld	a,(OFST+2,sp)
 506  0176 ae0001        	ldw	x,#1
 507  0179 95            	ld	xh,a
 508  017a ad70          	call	_toggle_io
 510  017c 84            	pop	a
 511                     ; 83 	toggle_io(lcd_data, 0, LCD_DB4);
 513  017d 4b10          	push	#16
 514  017f 7b02          	ld	a,(OFST+2,sp)
 515  0181 5f            	clrw	x
 516  0182 95            	ld	xh,a
 517  0183 ad67          	call	_toggle_io
 519  0185 84            	pop	a
 520                     ; 84 	toggle_EN_pin();
 522  0186 ad4b          	call	_toggle_EN_pin
 524                     ; 85 }  
 527  0188 84            	pop	a
 528  0189 81            	ret
 564                     ; 88 void LCD_putstr(char *lcd_string)
 564                     ; 89 {
 565                     	switch	.text
 566  018a               _LCD_putstr:
 568  018a 89            	pushw	x
 569       00000000      OFST:	set	0
 572  018b               L711:
 573                     ; 92         LCD_send(*lcd_string++, DAT);
 575  018b 1e01          	ldw	x,(OFST+1,sp)
 576  018d 1c0001        	addw	x,#1
 577  0190 1f01          	ldw	(OFST+1,sp),x
 578  0192 1d0001        	subw	x,#1
 579  0195 f6            	ld	a,(x)
 580  0196 ae0001        	ldw	x,#1
 581  0199 95            	ld	xh,a
 582  019a cd0108        	call	_LCD_send
 584                     ; 93     }while(*lcd_string != '\0');
 586  019d 1e01          	ldw	x,(OFST+1,sp)
 587  019f 7d            	tnz	(x)
 588  01a0 26e9          	jrne	L711
 589                     ; 94 }
 592  01a2 85            	popw	x
 593  01a3 81            	ret
 628                     ; 97 void LCD_putchar(char char_data)
 628                     ; 98 {
 629                     	switch	.text
 630  01a4               _LCD_putchar:
 634                     ; 99     LCD_send(char_data, DAT);
 636  01a4 ae0001        	ldw	x,#1
 637  01a7 95            	ld	xh,a
 638  01a8 cd0108        	call	_LCD_send
 640                     ; 100 }
 643  01ab 81            	ret
 667                     ; 103 void LCD_clear_home(void)
 667                     ; 104 {
 668                     	switch	.text
 669  01ac               _LCD_clear_home:
 673                     ; 105     LCD_send(clear_display, CMD);
 675  01ac ae0100        	ldw	x,#256
 676  01af cd0108        	call	_LCD_send
 678                     ; 106     LCD_send(goto_home, CMD);
 680  01b2 ae0200        	ldw	x,#512
 681  01b5 cd0108        	call	_LCD_send
 683                     ; 107 }
 686  01b8 81            	ret
 730                     ; 110 void LCD_goto(unsigned char  x_pos, unsigned char  y_pos)
 730                     ; 111 {                                                   
 731                     	switch	.text
 732  01b9               _LCD_goto:
 734  01b9 89            	pushw	x
 735       00000000      OFST:	set	0
 738                     ; 112 	if(y_pos == 0)    
 740  01ba 9f            	ld	a,xl
 741  01bb 4d            	tnz	a
 742  01bc 260a          	jrne	L571
 743                     ; 114         LCD_send((0x80 | x_pos), CMD);
 745  01be 9e            	ld	a,xh
 746  01bf aa80          	or	a,#128
 747  01c1 5f            	clrw	x
 748  01c2 95            	ld	xh,a
 749  01c3 cd0108        	call	_LCD_send
 752  01c6 2009          	jra	L771
 753  01c8               L571:
 754                     ; 118         LCD_send((0x80 | 0x40 | x_pos), CMD); 
 756  01c8 7b01          	ld	a,(OFST+1,sp)
 757  01ca aac0          	or	a,#192
 758  01cc 5f            	clrw	x
 759  01cd 95            	ld	xh,a
 760  01ce cd0108        	call	_LCD_send
 762  01d1               L771:
 763                     ; 120 }
 766  01d1 85            	popw	x
 767  01d2 81            	ret
 793                     ; 123 void toggle_EN_pin(void)
 793                     ; 124 {
 794                     	switch	.text
 795  01d3               _toggle_EN_pin:
 799                     ; 125 	GPIO_WriteHigh(LCD_PORT, LCD_EN);    
 801  01d3 4b08          	push	#8
 802  01d5 ae500a        	ldw	x,#20490
 803  01d8 cd0000        	call	_GPIO_WriteHigh
 805  01db 84            	pop	a
 806                     ; 126     delay_ms(1);
 808  01dc ae0001        	ldw	x,#1
 809  01df cd0000        	call	_delay_ms
 811                     ; 127     GPIO_WriteLow(LCD_PORT,LCD_EN);   
 813  01e2 4b08          	push	#8
 814  01e4 ae500a        	ldw	x,#20490
 815  01e7 cd0000        	call	_GPIO_WriteLow
 817  01ea 84            	pop	a
 818                     ; 128 }
 821  01eb 81            	ret
 905                     ; 131 void toggle_io(unsigned char lcd_data, unsigned char bit_pos, unsigned char pin_num)
 905                     ; 132 {
 906                     	switch	.text
 907  01ec               _toggle_io:
 909  01ec 89            	pushw	x
 910  01ed 88            	push	a
 911       00000001      OFST:	set	1
 914                     ; 133 	bool temp = FALSE;
 916                     ; 135     temp = (0x01 & (lcd_data >> bit_pos));
 918  01ee 9f            	ld	a,xl
 919  01ef 5f            	clrw	x
 920  01f0 97            	ld	xl,a
 921  01f1 7b02          	ld	a,(OFST+1,sp)
 922  01f3 5d            	tnzw	x
 923  01f4 2704          	jreq	L03
 924  01f6               L23:
 925  01f6 44            	srl	a
 926  01f7 5a            	decw	x
 927  01f8 26fc          	jrne	L23
 928  01fa               L03:
 929  01fa a401          	and	a,#1
 930  01fc 6b01          	ld	(OFST+0,sp),a
 932                     ; 137 	switch(temp)
 934  01fe 7b01          	ld	a,(OFST+0,sp)
 935  0200 a101          	cp	a,#1
 936  0202 260c          	jrne	L312
 939  0204               L112:
 940                     ; 141 			GPIO_WriteHigh(LCD_PORT, pin_num);   
 942  0204 7b06          	ld	a,(OFST+5,sp)
 943  0206 88            	push	a
 944  0207 ae500a        	ldw	x,#20490
 945  020a cd0000        	call	_GPIO_WriteHigh
 947  020d 84            	pop	a
 948                     ; 142 			break;
 950  020e 200a          	jra	L162
 951  0210               L312:
 952                     ; 146 			GPIO_WriteLow(LCD_PORT, pin_num);   
 954  0210 7b06          	ld	a,(OFST+5,sp)
 955  0212 88            	push	a
 956  0213 ae500a        	ldw	x,#20490
 957  0216 cd0000        	call	_GPIO_WriteLow
 959  0219 84            	pop	a
 960                     ; 147 			break;
 961  021a               L162:
 962                     ; 150 }
 965  021a 5b03          	addw	sp,#3
 966  021c 81            	ret
 979                     	xdef	_toggle_io
 980                     	xdef	_toggle_EN_pin
 981                     	xdef	_LCD_goto
 982                     	xdef	_LCD_clear_home
 983                     	xdef	_LCD_putchar
 984                     	xdef	_LCD_putstr
 985                     	xdef	_LCD_4bit_send
 986                     	xdef	_LCD_send
 987                     	xdef	_LCD_init
 988                     	xdef	_LCD_GPIO_init
 989                     	xref	_GPIO_WriteLow
 990                     	xref	_GPIO_WriteHigh
 991                     	xref	_GPIO_Init
 992                     	xref	_delay_ms
1011                     	end
