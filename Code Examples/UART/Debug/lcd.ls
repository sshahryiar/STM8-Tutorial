   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  46                     ; 4 void LCD_GPIO_init(void)
  46                     ; 5 {
  48                     	switch	.text
  49  0000               _LCD_GPIO_init:
  53                     ; 6 	GPIO_DeInit(LCD_PORT);
  55  0000 ae500a        	ldw	x,#20490
  56  0003 cd0000        	call	_GPIO_DeInit
  58                     ; 7 	GPIO_Init(LCD_PORT, LCD_RS, GPIO_MODE_OUT_PP_HIGH_FAST);
  60  0006 4bf0          	push	#240
  61  0008 4b04          	push	#4
  62  000a ae500a        	ldw	x,#20490
  63  000d cd0000        	call	_GPIO_Init
  65  0010 85            	popw	x
  66                     ; 8 	GPIO_Init(LCD_PORT, LCD_EN, GPIO_MODE_OUT_PP_HIGH_FAST);
  68  0011 4bf0          	push	#240
  69  0013 4b08          	push	#8
  70  0015 ae500a        	ldw	x,#20490
  71  0018 cd0000        	call	_GPIO_Init
  73  001b 85            	popw	x
  74                     ; 9 	GPIO_Init(LCD_PORT, LCD_DB4, GPIO_MODE_OUT_PP_HIGH_FAST);
  76  001c 4bf0          	push	#240
  77  001e 4b10          	push	#16
  78  0020 ae500a        	ldw	x,#20490
  79  0023 cd0000        	call	_GPIO_Init
  81  0026 85            	popw	x
  82                     ; 10 	GPIO_Init(LCD_PORT, LCD_DB5, GPIO_MODE_OUT_PP_HIGH_FAST);
  84  0027 4bf0          	push	#240
  85  0029 4b20          	push	#32
  86  002b ae500a        	ldw	x,#20490
  87  002e cd0000        	call	_GPIO_Init
  89  0031 85            	popw	x
  90                     ; 11 	GPIO_Init(LCD_PORT, LCD_DB6, GPIO_MODE_OUT_PP_HIGH_FAST);
  92  0032 4bf0          	push	#240
  93  0034 4b40          	push	#64
  94  0036 ae500a        	ldw	x,#20490
  95  0039 cd0000        	call	_GPIO_Init
  97  003c 85            	popw	x
  98                     ; 12 	GPIO_Init(LCD_PORT, LCD_DB7, GPIO_MODE_OUT_PP_HIGH_FAST);
 100  003d 4bf0          	push	#240
 101  003f 4b80          	push	#128
 102  0041 ae500a        	ldw	x,#20490
 103  0044 cd0000        	call	_GPIO_Init
 105  0047 85            	popw	x
 106                     ; 13 	delay_ms(10);    
 108  0048 ae000a        	ldw	x,#10
 109  004b cd0000        	call	_delay_ms
 111                     ; 14 }
 114  004e 81            	ret
 142                     ; 17 void LCD_init(void)
 142                     ; 18 {                                     
 143                     	switch	.text
 144  004f               _LCD_init:
 148                     ; 19 	LCD_GPIO_init();    
 150  004f adaf          	call	_LCD_GPIO_init
 152                     ; 20     toggle_EN_pin();
 154  0051 cd01d9        	call	_toggle_EN_pin
 156                     ; 22     GPIO_WriteLow(LCD_PORT, LCD_RS);            
 158  0054 4b04          	push	#4
 159  0056 ae500a        	ldw	x,#20490
 160  0059 cd0000        	call	_GPIO_WriteLow
 162  005c 84            	pop	a
 163                     ; 23     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 165  005d 4b80          	push	#128
 166  005f ae500a        	ldw	x,#20490
 167  0062 cd0000        	call	_GPIO_WriteLow
 169  0065 84            	pop	a
 170                     ; 24     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 172  0066 4b40          	push	#64
 173  0068 ae500a        	ldw	x,#20490
 174  006b cd0000        	call	_GPIO_WriteLow
 176  006e 84            	pop	a
 177                     ; 25     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 179  006f 4b20          	push	#32
 180  0071 ae500a        	ldw	x,#20490
 181  0074 cd0000        	call	_GPIO_WriteHigh
 183  0077 84            	pop	a
 184                     ; 26     GPIO_WriteHigh(LCD_PORT, LCD_DB4);                      
 186  0078 4b10          	push	#16
 187  007a ae500a        	ldw	x,#20490
 188  007d cd0000        	call	_GPIO_WriteHigh
 190  0080 84            	pop	a
 191                     ; 27 	toggle_EN_pin();
 193  0081 cd01d9        	call	_toggle_EN_pin
 195                     ; 29     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 197  0084 4b80          	push	#128
 198  0086 ae500a        	ldw	x,#20490
 199  0089 cd0000        	call	_GPIO_WriteLow
 201  008c 84            	pop	a
 202                     ; 30     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 204  008d 4b40          	push	#64
 205  008f ae500a        	ldw	x,#20490
 206  0092 cd0000        	call	_GPIO_WriteLow
 208  0095 84            	pop	a
 209                     ; 31     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 211  0096 4b20          	push	#32
 212  0098 ae500a        	ldw	x,#20490
 213  009b cd0000        	call	_GPIO_WriteHigh
 215  009e 84            	pop	a
 216                     ; 32     GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
 218  009f 4b10          	push	#16
 219  00a1 ae500a        	ldw	x,#20490
 220  00a4 cd0000        	call	_GPIO_WriteHigh
 222  00a7 84            	pop	a
 223                     ; 33     toggle_EN_pin();
 225  00a8 cd01d9        	call	_toggle_EN_pin
 227                     ; 35     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 229  00ab 4b80          	push	#128
 230  00ad ae500a        	ldw	x,#20490
 231  00b0 cd0000        	call	_GPIO_WriteLow
 233  00b3 84            	pop	a
 234                     ; 36     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 236  00b4 4b40          	push	#64
 237  00b6 ae500a        	ldw	x,#20490
 238  00b9 cd0000        	call	_GPIO_WriteLow
 240  00bc 84            	pop	a
 241                     ; 37     GPIO_WriteHigh(LCD_PORT, LCD_DB5);   
 243  00bd 4b20          	push	#32
 244  00bf ae500a        	ldw	x,#20490
 245  00c2 cd0000        	call	_GPIO_WriteHigh
 247  00c5 84            	pop	a
 248                     ; 38     GPIO_WriteHigh(LCD_PORT, LCD_DB4);  
 250  00c6 4b10          	push	#16
 251  00c8 ae500a        	ldw	x,#20490
 252  00cb cd0000        	call	_GPIO_WriteHigh
 254  00ce 84            	pop	a
 255                     ; 39     toggle_EN_pin();                  
 257  00cf cd01d9        	call	_toggle_EN_pin
 259                     ; 41     GPIO_WriteLow(LCD_PORT, LCD_DB7);   
 261  00d2 4b80          	push	#128
 262  00d4 ae500a        	ldw	x,#20490
 263  00d7 cd0000        	call	_GPIO_WriteLow
 265  00da 84            	pop	a
 266                     ; 42     GPIO_WriteLow(LCD_PORT, LCD_DB6);   
 268  00db 4b40          	push	#64
 269  00dd ae500a        	ldw	x,#20490
 270  00e0 cd0000        	call	_GPIO_WriteLow
 272  00e3 84            	pop	a
 273                     ; 43     GPIO_WriteHigh(LCD_PORT, LCD_DB5);        
 275  00e4 4b20          	push	#32
 276  00e6 ae500a        	ldw	x,#20490
 277  00e9 cd0000        	call	_GPIO_WriteHigh
 279  00ec 84            	pop	a
 280                     ; 44     GPIO_WriteLow(LCD_PORT, LCD_DB4);  
 282  00ed 4b10          	push	#16
 283  00ef ae500a        	ldw	x,#20490
 284  00f2 cd0000        	call	_GPIO_WriteLow
 286  00f5 84            	pop	a
 287                     ; 45     toggle_EN_pin();
 289  00f6 cd01d9        	call	_toggle_EN_pin
 291                     ; 47     LCD_send((_4_pin_interface | _2_row_display | _5x7_dots), CMD);
 293  00f9 ae2800        	ldw	x,#10240
 294  00fc ad10          	call	_LCD_send
 296                     ; 48     LCD_send((display_on | cursor_off | blink_off), CMD); 
 298  00fe ae0c00        	ldw	x,#3072
 299  0101 ad0b          	call	_LCD_send
 301                     ; 49     LCD_send(clear_display, CMD);         
 303  0103 ae0100        	ldw	x,#256
 304  0106 ad06          	call	_LCD_send
 306                     ; 50     LCD_send((cursor_direction_inc | display_no_shift), CMD);
 308  0108 ae0600        	ldw	x,#1536
 309  010b ad01          	call	_LCD_send
 311                     ; 51 }   
 314  010d 81            	ret
 360                     ; 54 void LCD_send(unsigned char value, unsigned char mode)
 360                     ; 55 {                               
 361                     	switch	.text
 362  010e               _LCD_send:
 364  010e 89            	pushw	x
 365       00000000      OFST:	set	0
 368                     ; 56     switch(mode)
 370  010f 9f            	ld	a,xl
 372                     ; 66 			break;
 373  0110 4d            	tnz	a
 374  0111 270e          	jreq	L33
 375  0113 4a            	dec	a
 376  0114 2614          	jrne	L16
 377                     ; 60 			GPIO_WriteHigh(LCD_PORT, LCD_RS);   
 379  0116 4b04          	push	#4
 380  0118 ae500a        	ldw	x,#20490
 381  011b cd0000        	call	_GPIO_WriteHigh
 383  011e 84            	pop	a
 384                     ; 61 			break;
 386  011f 2009          	jra	L16
 387  0121               L33:
 388                     ; 65 			GPIO_WriteLow(LCD_PORT, LCD_RS);   
 390  0121 4b04          	push	#4
 391  0123 ae500a        	ldw	x,#20490
 392  0126 cd0000        	call	_GPIO_WriteLow
 394  0129 84            	pop	a
 395                     ; 66 			break;
 397  012a               L16:
 398                     ; 70     LCD_4bit_send(value);
 400  012a 7b01          	ld	a,(OFST+1,sp)
 401  012c ad02          	call	_LCD_4bit_send
 403                     ; 71 }  
 406  012e 85            	popw	x
 407  012f 81            	ret
 443                     ; 74 void LCD_4bit_send(unsigned char lcd_data)       
 443                     ; 75 {
 444                     	switch	.text
 445  0130               _LCD_4bit_send:
 447  0130 88            	push	a
 448       00000000      OFST:	set	0
 451                     ; 76 	toggle_io(lcd_data, 7, LCD_DB7);
 453  0131 4b80          	push	#128
 454  0133 ae0007        	ldw	x,#7
 455  0136 95            	ld	xh,a
 456  0137 cd01f2        	call	_toggle_io
 458  013a 84            	pop	a
 459                     ; 77 	toggle_io(lcd_data, 6, LCD_DB6);
 461  013b 4b40          	push	#64
 462  013d 7b02          	ld	a,(OFST+2,sp)
 463  013f ae0006        	ldw	x,#6
 464  0142 95            	ld	xh,a
 465  0143 cd01f2        	call	_toggle_io
 467  0146 84            	pop	a
 468                     ; 78 	toggle_io(lcd_data, 5, LCD_DB5);
 470  0147 4b20          	push	#32
 471  0149 7b02          	ld	a,(OFST+2,sp)
 472  014b ae0005        	ldw	x,#5
 473  014e 95            	ld	xh,a
 474  014f cd01f2        	call	_toggle_io
 476  0152 84            	pop	a
 477                     ; 79 	toggle_io(lcd_data, 4, LCD_DB4);
 479  0153 4b10          	push	#16
 480  0155 7b02          	ld	a,(OFST+2,sp)
 481  0157 ae0004        	ldw	x,#4
 482  015a 95            	ld	xh,a
 483  015b cd01f2        	call	_toggle_io
 485  015e 84            	pop	a
 486                     ; 80     toggle_EN_pin();
 488  015f ad78          	call	_toggle_EN_pin
 490                     ; 81 	toggle_io(lcd_data, 3, LCD_DB7);
 492  0161 4b80          	push	#128
 493  0163 7b02          	ld	a,(OFST+2,sp)
 494  0165 ae0003        	ldw	x,#3
 495  0168 95            	ld	xh,a
 496  0169 cd01f2        	call	_toggle_io
 498  016c 84            	pop	a
 499                     ; 82 	toggle_io(lcd_data, 2, LCD_DB6);
 501  016d 4b40          	push	#64
 502  016f 7b02          	ld	a,(OFST+2,sp)
 503  0171 ae0002        	ldw	x,#2
 504  0174 95            	ld	xh,a
 505  0175 ad7b          	call	_toggle_io
 507  0177 84            	pop	a
 508                     ; 83 	toggle_io(lcd_data, 1, LCD_DB5);
 510  0178 4b20          	push	#32
 511  017a 7b02          	ld	a,(OFST+2,sp)
 512  017c ae0001        	ldw	x,#1
 513  017f 95            	ld	xh,a
 514  0180 ad70          	call	_toggle_io
 516  0182 84            	pop	a
 517                     ; 84 	toggle_io(lcd_data, 0, LCD_DB4);
 519  0183 4b10          	push	#16
 520  0185 7b02          	ld	a,(OFST+2,sp)
 521  0187 5f            	clrw	x
 522  0188 95            	ld	xh,a
 523  0189 ad67          	call	_toggle_io
 525  018b 84            	pop	a
 526                     ; 85 	toggle_EN_pin();
 528  018c ad4b          	call	_toggle_EN_pin
 530                     ; 86 }  
 533  018e 84            	pop	a
 534  018f 81            	ret
 570                     ; 89 void LCD_putstr(char *lcd_string)
 570                     ; 90 {
 571                     	switch	.text
 572  0190               _LCD_putstr:
 574  0190 89            	pushw	x
 575       00000000      OFST:	set	0
 578  0191               L711:
 579                     ; 93         LCD_send(*lcd_string++, DAT);
 581  0191 1e01          	ldw	x,(OFST+1,sp)
 582  0193 1c0001        	addw	x,#1
 583  0196 1f01          	ldw	(OFST+1,sp),x
 584  0198 1d0001        	subw	x,#1
 585  019b f6            	ld	a,(x)
 586  019c ae0001        	ldw	x,#1
 587  019f 95            	ld	xh,a
 588  01a0 cd010e        	call	_LCD_send
 590                     ; 94     }while(*lcd_string != '\0');
 592  01a3 1e01          	ldw	x,(OFST+1,sp)
 593  01a5 7d            	tnz	(x)
 594  01a6 26e9          	jrne	L711
 595                     ; 95 }
 598  01a8 85            	popw	x
 599  01a9 81            	ret
 634                     ; 98 void LCD_putchar(char char_data)
 634                     ; 99 {
 635                     	switch	.text
 636  01aa               _LCD_putchar:
 640                     ; 100     LCD_send(char_data, DAT);
 642  01aa ae0001        	ldw	x,#1
 643  01ad 95            	ld	xh,a
 644  01ae cd010e        	call	_LCD_send
 646                     ; 101 }
 649  01b1 81            	ret
 673                     ; 104 void LCD_clear_home(void)
 673                     ; 105 {
 674                     	switch	.text
 675  01b2               _LCD_clear_home:
 679                     ; 106     LCD_send(clear_display, CMD);
 681  01b2 ae0100        	ldw	x,#256
 682  01b5 cd010e        	call	_LCD_send
 684                     ; 107     LCD_send(goto_home, CMD);
 686  01b8 ae0200        	ldw	x,#512
 687  01bb cd010e        	call	_LCD_send
 689                     ; 108 }
 692  01be 81            	ret
 736                     ; 111 void LCD_goto(unsigned char  x_pos, unsigned char  y_pos)
 736                     ; 112 {                                                   
 737                     	switch	.text
 738  01bf               _LCD_goto:
 740  01bf 89            	pushw	x
 741       00000000      OFST:	set	0
 744                     ; 113 	if(y_pos == 0)    
 746  01c0 9f            	ld	a,xl
 747  01c1 4d            	tnz	a
 748  01c2 260a          	jrne	L571
 749                     ; 115         LCD_send((0x80 | x_pos), CMD);
 751  01c4 9e            	ld	a,xh
 752  01c5 aa80          	or	a,#128
 753  01c7 5f            	clrw	x
 754  01c8 95            	ld	xh,a
 755  01c9 cd010e        	call	_LCD_send
 758  01cc 2009          	jra	L771
 759  01ce               L571:
 760                     ; 119         LCD_send((0x80 | 0x40 | x_pos), CMD); 
 762  01ce 7b01          	ld	a,(OFST+1,sp)
 763  01d0 aac0          	or	a,#192
 764  01d2 5f            	clrw	x
 765  01d3 95            	ld	xh,a
 766  01d4 cd010e        	call	_LCD_send
 768  01d7               L771:
 769                     ; 121 }
 772  01d7 85            	popw	x
 773  01d8 81            	ret
 799                     ; 124 void toggle_EN_pin(void)
 799                     ; 125 {
 800                     	switch	.text
 801  01d9               _toggle_EN_pin:
 805                     ; 126 	GPIO_WriteHigh(LCD_PORT, LCD_EN);    
 807  01d9 4b08          	push	#8
 808  01db ae500a        	ldw	x,#20490
 809  01de cd0000        	call	_GPIO_WriteHigh
 811  01e1 84            	pop	a
 812                     ; 127     delay_ms(1);
 814  01e2 ae0001        	ldw	x,#1
 815  01e5 cd0000        	call	_delay_ms
 817                     ; 128     GPIO_WriteLow(LCD_PORT,LCD_EN);   
 819  01e8 4b08          	push	#8
 820  01ea ae500a        	ldw	x,#20490
 821  01ed cd0000        	call	_GPIO_WriteLow
 823  01f0 84            	pop	a
 824                     ; 129 }
 827  01f1 81            	ret
 911                     ; 132 void toggle_io(unsigned char lcd_data, unsigned char bit_pos, unsigned char pin_num)
 911                     ; 133 {
 912                     	switch	.text
 913  01f2               _toggle_io:
 915  01f2 89            	pushw	x
 916  01f3 88            	push	a
 917       00000001      OFST:	set	1
 920                     ; 134 	bool temp = FALSE;
 922                     ; 136     temp = (0x01 & (lcd_data >> bit_pos));
 924  01f4 9f            	ld	a,xl
 925  01f5 5f            	clrw	x
 926  01f6 97            	ld	xl,a
 927  01f7 7b02          	ld	a,(OFST+1,sp)
 928  01f9 5d            	tnzw	x
 929  01fa 2704          	jreq	L03
 930  01fc               L23:
 931  01fc 44            	srl	a
 932  01fd 5a            	decw	x
 933  01fe 26fc          	jrne	L23
 934  0200               L03:
 935  0200 a401          	and	a,#1
 936  0202 6b01          	ld	(OFST+0,sp),a
 938                     ; 138 	switch(temp)
 940  0204 7b01          	ld	a,(OFST+0,sp)
 941  0206 a101          	cp	a,#1
 942  0208 260c          	jrne	L312
 945  020a               L112:
 946                     ; 142 			GPIO_WriteHigh(LCD_PORT, pin_num);   
 948  020a 7b06          	ld	a,(OFST+5,sp)
 949  020c 88            	push	a
 950  020d ae500a        	ldw	x,#20490
 951  0210 cd0000        	call	_GPIO_WriteHigh
 953  0213 84            	pop	a
 954                     ; 143 			break;
 956  0214 200a          	jra	L162
 957  0216               L312:
 958                     ; 147 			GPIO_WriteLow(LCD_PORT, pin_num);   
 960  0216 7b06          	ld	a,(OFST+5,sp)
 961  0218 88            	push	a
 962  0219 ae500a        	ldw	x,#20490
 963  021c cd0000        	call	_GPIO_WriteLow
 965  021f 84            	pop	a
 966                     ; 148 			break;
 967  0220               L162:
 968                     ; 151 }
 971  0220 5b03          	addw	sp,#3
 972  0222 81            	ret
 985                     	xdef	_toggle_io
 986                     	xdef	_toggle_EN_pin
 987                     	xdef	_LCD_goto
 988                     	xdef	_LCD_clear_home
 989                     	xdef	_LCD_putchar
 990                     	xdef	_LCD_putstr
 991                     	xdef	_LCD_4bit_send
 992                     	xdef	_LCD_send
 993                     	xdef	_LCD_init
 994                     	xdef	_LCD_GPIO_init
 995                     	xref	_GPIO_WriteLow
 996                     	xref	_GPIO_WriteHigh
 997                     	xref	_GPIO_Init
 998                     	xref	_GPIO_DeInit
 999                     	xref	_delay_ms
1018                     	end
