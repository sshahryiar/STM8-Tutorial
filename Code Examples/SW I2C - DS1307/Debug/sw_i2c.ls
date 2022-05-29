   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  46                     ; 4 void SW_I2C_init(void)
  46                     ; 5 {
  48                     	switch	.text
  49  0000               _SW_I2C_init:
  53                     ; 6     SW_I2C_OUT();
  55  0000 ae500f        	ldw	x,#20495
  56  0003 cd0000        	call	_GPIO_DeInit
  60  0006 4be0          	push	#224
  61  0008 4b40          	push	#64
  62  000a ae500f        	ldw	x,#20495
  63  000d cd0000        	call	_GPIO_Init
  65  0010 85            	popw	x
  68  0011 4be0          	push	#224
  69  0013 4b80          	push	#128
  70  0015 ae500f        	ldw	x,#20495
  71  0018 cd0000        	call	_GPIO_Init
  73  001b 85            	popw	x
  74                     ; 7     delay_ms(10);
  76  001c ae000a        	ldw	x,#10
  77  001f cd0000        	call	_delay_ms
  79                     ; 8     SDA_HIGH();
  81  0022 4b40          	push	#64
  82  0024 ae500f        	ldw	x,#20495
  83  0027 cd0000        	call	_GPIO_WriteHigh
  85  002a 84            	pop	a
  86                     ; 9     SCL_HIGH();
  88  002b 4b80          	push	#128
  89  002d ae500f        	ldw	x,#20495
  90  0030 cd0000        	call	_GPIO_WriteHigh
  92  0033 84            	pop	a
  93                     ; 10 }
  96  0034 81            	ret
 124                     ; 13 void SW_I2C_start(void)
 124                     ; 14 {
 125                     	switch	.text
 126  0035               _SW_I2C_start:
 130                     ; 15     SW_I2C_OUT();
 132  0035 ae500f        	ldw	x,#20495
 133  0038 cd0000        	call	_GPIO_DeInit
 137  003b 4be0          	push	#224
 138  003d 4b40          	push	#64
 139  003f ae500f        	ldw	x,#20495
 140  0042 cd0000        	call	_GPIO_Init
 142  0045 85            	popw	x
 145  0046 4be0          	push	#224
 146  0048 4b80          	push	#128
 147  004a ae500f        	ldw	x,#20495
 148  004d cd0000        	call	_GPIO_Init
 150  0050 85            	popw	x
 151                     ; 16     SDA_HIGH();
 153  0051 4b40          	push	#64
 154  0053 ae500f        	ldw	x,#20495
 155  0056 cd0000        	call	_GPIO_WriteHigh
 157  0059 84            	pop	a
 158                     ; 17     SCL_HIGH();
 160  005a 4b80          	push	#128
 161  005c ae500f        	ldw	x,#20495
 162  005f cd0000        	call	_GPIO_WriteHigh
 164  0062 84            	pop	a
 165                     ; 18     delay_us(40);
 167  0063 ae0028        	ldw	x,#40
 168  0066 cd0000        	call	_delay_us
 170                     ; 19     SDA_LOW();
 172  0069 4b40          	push	#64
 173  006b ae500f        	ldw	x,#20495
 174  006e cd0000        	call	_GPIO_WriteLow
 176  0071 84            	pop	a
 177                     ; 20     delay_us(40);
 179  0072 ae0028        	ldw	x,#40
 180  0075 cd0000        	call	_delay_us
 182                     ; 21     SCL_LOW();
 184  0078 4b80          	push	#128
 185  007a ae500f        	ldw	x,#20495
 186  007d cd0000        	call	_GPIO_WriteLow
 188  0080 84            	pop	a
 189                     ; 22 }
 192  0081 81            	ret
 220                     ; 25 void SW_I2C_stop(void)
 220                     ; 26 {
 221                     	switch	.text
 222  0082               _SW_I2C_stop:
 226                     ; 27     SW_I2C_OUT();
 228  0082 ae500f        	ldw	x,#20495
 229  0085 cd0000        	call	_GPIO_DeInit
 233  0088 4be0          	push	#224
 234  008a 4b40          	push	#64
 235  008c ae500f        	ldw	x,#20495
 236  008f cd0000        	call	_GPIO_Init
 238  0092 85            	popw	x
 241  0093 4be0          	push	#224
 242  0095 4b80          	push	#128
 243  0097 ae500f        	ldw	x,#20495
 244  009a cd0000        	call	_GPIO_Init
 246  009d 85            	popw	x
 247                     ; 28     SDA_LOW();
 249  009e 4b40          	push	#64
 250  00a0 ae500f        	ldw	x,#20495
 251  00a3 cd0000        	call	_GPIO_WriteLow
 253  00a6 84            	pop	a
 254                     ; 29     SCL_LOW();
 256  00a7 4b80          	push	#128
 257  00a9 ae500f        	ldw	x,#20495
 258  00ac cd0000        	call	_GPIO_WriteLow
 260  00af 84            	pop	a
 261                     ; 30     delay_us(40);
 263  00b0 ae0028        	ldw	x,#40
 264  00b3 cd0000        	call	_delay_us
 266                     ; 31     SDA_HIGH();
 268  00b6 4b40          	push	#64
 269  00b8 ae500f        	ldw	x,#20495
 270  00bb cd0000        	call	_GPIO_WriteHigh
 272  00be 84            	pop	a
 273                     ; 32     SCL_HIGH();
 275  00bf 4b80          	push	#128
 276  00c1 ae500f        	ldw	x,#20495
 277  00c4 cd0000        	call	_GPIO_WriteHigh
 279  00c7 84            	pop	a
 280                     ; 33     delay_us(40);
 282  00c8 ae0028        	ldw	x,#40
 283  00cb cd0000        	call	_delay_us
 285                     ; 34 }
 288  00ce 81            	ret
 347                     ; 37 unsigned char SW_I2C_read(unsigned char ack)
 347                     ; 38 {
 348                     	switch	.text
 349  00cf               _SW_I2C_read:
 351  00cf 88            	push	a
 352  00d0 89            	pushw	x
 353       00000002      OFST:	set	2
 356                     ; 39     unsigned char i = 0x08;
 358  00d1 a608          	ld	a,#8
 359  00d3 6b01          	ld	(OFST-1,sp),a
 361                     ; 40     unsigned char j = 0x00;
 363  00d5 0f02          	clr	(OFST+0,sp)
 365                     ; 42     SW_I2C_IN();
 367  00d7 ae500f        	ldw	x,#20495
 368  00da cd0000        	call	_GPIO_DeInit
 372  00dd 4b00          	push	#0
 373  00df 4b40          	push	#64
 374  00e1 ae500f        	ldw	x,#20495
 375  00e4 cd0000        	call	_GPIO_Init
 377  00e7 85            	popw	x
 380  00e8 4be0          	push	#224
 381  00ea 4b80          	push	#128
 382  00ec ae500f        	ldw	x,#20495
 383  00ef cd0000        	call	_GPIO_Init
 385  00f2 85            	popw	x
 387  00f3 2037          	jra	L511
 388  00f5               L311:
 389                     ; 46         SCL_LOW();
 391  00f5 4b80          	push	#128
 392  00f7 ae500f        	ldw	x,#20495
 393  00fa cd0000        	call	_GPIO_WriteLow
 395  00fd 84            	pop	a
 396                     ; 47         delay_us(20);
 398  00fe ae0014        	ldw	x,#20
 399  0101 cd0000        	call	_delay_us
 401                     ; 48         SCL_HIGH();
 403  0104 4b80          	push	#128
 404  0106 ae500f        	ldw	x,#20495
 405  0109 cd0000        	call	_GPIO_WriteHigh
 407  010c 84            	pop	a
 408                     ; 49         delay_us(20);
 410  010d ae0014        	ldw	x,#20
 411  0110 cd0000        	call	_delay_us
 413                     ; 50         j <<= 1;
 415  0113 0802          	sll	(OFST+0,sp)
 417                     ; 52         if(SDA_IN() != 0x00)
 419  0115 4b40          	push	#64
 420  0117 ae500f        	ldw	x,#20495
 421  011a cd0000        	call	_GPIO_ReadInputPin
 423  011d 5b01          	addw	sp,#1
 424  011f 4d            	tnz	a
 425  0120 2702          	jreq	L121
 426                     ; 54             j++;
 428  0122 0c02          	inc	(OFST+0,sp)
 430  0124               L121:
 431                     ; 57         delay_us(10);
 433  0124 ae000a        	ldw	x,#10
 434  0127 cd0000        	call	_delay_us
 436                     ; 58         i--;
 438  012a 0a01          	dec	(OFST-1,sp)
 440  012c               L511:
 441                     ; 44     while(i > 0x00)
 443  012c 0d01          	tnz	(OFST-1,sp)
 444  012e 26c5          	jrne	L311
 445                     ; 61     switch(ack)
 448  0130 7b03          	ld	a,(OFST+1,sp)
 449  0132 a1ff          	cp	a,#255
 450  0134 2607          	jrne	L75
 453  0136               L55:
 454                     ; 65             SW_I2C_ACK_NACK(I2C_ACK);;
 456  0136 a6ff          	ld	a,#255
 457  0138 cd01c1        	call	_SW_I2C_ACK_NACK
 459                     ; 66             break;
 462  013b 2004          	jra	L521
 463  013d               L75:
 464                     ; 70             SW_I2C_ACK_NACK(I2C_NACK);;
 466  013d 4f            	clr	a
 467  013e cd01c1        	call	_SW_I2C_ACK_NACK
 469                     ; 71             break;
 470  0141               L521:
 471                     ; 75     return j;
 473  0141 7b02          	ld	a,(OFST+0,sp)
 476  0143 5b03          	addw	sp,#3
 477  0145 81            	ret
 525                     ; 79 void SW_I2C_write(unsigned char value)
 525                     ; 80 {
 526                     	switch	.text
 527  0146               _SW_I2C_write:
 529  0146 88            	push	a
 530  0147 88            	push	a
 531       00000001      OFST:	set	1
 534                     ; 81     unsigned char i = 0x08;
 536  0148 a608          	ld	a,#8
 537  014a 6b01          	ld	(OFST+0,sp),a
 539                     ; 83     SW_I2C_OUT();
 541  014c ae500f        	ldw	x,#20495
 542  014f cd0000        	call	_GPIO_DeInit
 546  0152 4be0          	push	#224
 547  0154 4b40          	push	#64
 548  0156 ae500f        	ldw	x,#20495
 549  0159 cd0000        	call	_GPIO_Init
 551  015c 85            	popw	x
 554  015d 4be0          	push	#224
 555  015f 4b80          	push	#128
 556  0161 ae500f        	ldw	x,#20495
 557  0164 cd0000        	call	_GPIO_Init
 559  0167 85            	popw	x
 560                     ; 84     SCL_LOW();
 562  0168 4b80          	push	#128
 563  016a ae500f        	ldw	x,#20495
 564  016d cd0000        	call	_GPIO_WriteLow
 566  0170 84            	pop	a
 568  0171 2048          	jra	L161
 569  0173               L751:
 570                     ; 89         if(((value & 0x80) >> 0x07) != 0x00)
 572  0173 7b02          	ld	a,(OFST+1,sp)
 573  0175 49            	rlc	a
 574  0176 4f            	clr	a
 575  0177 49            	rlc	a
 576  0178 5f            	clrw	x
 577  0179 97            	ld	xl,a
 578  017a a30000        	cpw	x,#0
 579  017d 270b          	jreq	L561
 580                     ; 91             SDA_HIGH();
 582  017f 4b40          	push	#64
 583  0181 ae500f        	ldw	x,#20495
 584  0184 cd0000        	call	_GPIO_WriteHigh
 586  0187 84            	pop	a
 588  0188 2009          	jra	L761
 589  018a               L561:
 590                     ; 95             SDA_LOW();
 592  018a 4b40          	push	#64
 593  018c ae500f        	ldw	x,#20495
 594  018f cd0000        	call	_GPIO_WriteLow
 596  0192 84            	pop	a
 597  0193               L761:
 598                     ; 99         value <<= 1;
 600  0193 0802          	sll	(OFST+1,sp)
 601                     ; 100         delay_us(20);
 603  0195 ae0014        	ldw	x,#20
 604  0198 cd0000        	call	_delay_us
 606                     ; 101         SCL_HIGH();
 608  019b 4b80          	push	#128
 609  019d ae500f        	ldw	x,#20495
 610  01a0 cd0000        	call	_GPIO_WriteHigh
 612  01a3 84            	pop	a
 613                     ; 102         delay_us(20);
 615  01a4 ae0014        	ldw	x,#20
 616  01a7 cd0000        	call	_delay_us
 618                     ; 103         SCL_LOW();
 620  01aa 4b80          	push	#128
 621  01ac ae500f        	ldw	x,#20495
 622  01af cd0000        	call	_GPIO_WriteLow
 624  01b2 84            	pop	a
 625                     ; 104         delay_us(20);
 627  01b3 ae0014        	ldw	x,#20
 628  01b6 cd0000        	call	_delay_us
 630                     ; 105         i--;
 632  01b9 0a01          	dec	(OFST+0,sp)
 634  01bb               L161:
 635                     ; 86     while(i > 0x00)
 637  01bb 0d01          	tnz	(OFST+0,sp)
 638  01bd 26b4          	jrne	L751
 639                     ; 107 }
 643  01bf 85            	popw	x
 644  01c0 81            	ret
 683                     ; 110 void SW_I2C_ACK_NACK(unsigned char mode)
 683                     ; 111 {
 684                     	switch	.text
 685  01c1               _SW_I2C_ACK_NACK:
 687  01c1 88            	push	a
 688       00000000      OFST:	set	0
 691                     ; 112     SCL_LOW();
 693  01c2 4b80          	push	#128
 694  01c4 ae500f        	ldw	x,#20495
 695  01c7 cd0000        	call	_GPIO_WriteLow
 697  01ca 84            	pop	a
 698                     ; 113     SW_I2C_OUT();
 700  01cb ae500f        	ldw	x,#20495
 701  01ce cd0000        	call	_GPIO_DeInit
 705  01d1 4be0          	push	#224
 706  01d3 4b40          	push	#64
 707  01d5 ae500f        	ldw	x,#20495
 708  01d8 cd0000        	call	_GPIO_Init
 710  01db 85            	popw	x
 713  01dc 4be0          	push	#224
 714  01de 4b80          	push	#128
 715  01e0 ae500f        	ldw	x,#20495
 716  01e3 cd0000        	call	_GPIO_Init
 718  01e6 85            	popw	x
 719                     ; 115     switch(mode)
 721  01e7 7b01          	ld	a,(OFST+1,sp)
 722  01e9 a1ff          	cp	a,#255
 723  01eb 260b          	jrne	L371
 726  01ed               L171:
 727                     ; 119             SDA_LOW();
 729  01ed 4b40          	push	#64
 730  01ef ae500f        	ldw	x,#20495
 731  01f2 cd0000        	call	_GPIO_WriteLow
 733  01f5 84            	pop	a
 734                     ; 120             break;
 736  01f6 2009          	jra	L122
 737  01f8               L371:
 738                     ; 124             SDA_HIGH();
 740  01f8 4b40          	push	#64
 741  01fa ae500f        	ldw	x,#20495
 742  01fd cd0000        	call	_GPIO_WriteHigh
 744  0200 84            	pop	a
 745                     ; 125             break;
 746  0201               L122:
 747                     ; 129     delay_us(20);
 749  0201 ae0014        	ldw	x,#20
 750  0204 cd0000        	call	_delay_us
 752                     ; 130     SCL_HIGH();
 754  0207 4b80          	push	#128
 755  0209 ae500f        	ldw	x,#20495
 756  020c cd0000        	call	_GPIO_WriteHigh
 758  020f 84            	pop	a
 759                     ; 131     delay_us(20);
 761  0210 ae0014        	ldw	x,#20
 762  0213 cd0000        	call	_delay_us
 764                     ; 132     SCL_LOW();
 766  0216 4b80          	push	#128
 767  0218 ae500f        	ldw	x,#20495
 768  021b cd0000        	call	_GPIO_WriteLow
 770  021e 84            	pop	a
 771                     ; 133 }
 774  021f 84            	pop	a
 775  0220 81            	ret
 816                     ; 136 unsigned char SW_I2C_wait_ACK(void)
 816                     ; 137 {
 817                     	switch	.text
 818  0221               _SW_I2C_wait_ACK:
 820  0221 89            	pushw	x
 821       00000002      OFST:	set	2
 824                     ; 138     signed int timeout = 0x0000;
 826  0222 5f            	clrw	x
 827  0223 1f01          	ldw	(OFST-1,sp),x
 829                     ; 140     SW_I2C_IN();
 831  0225 ae500f        	ldw	x,#20495
 832  0228 cd0000        	call	_GPIO_DeInit
 836  022b 4b00          	push	#0
 837  022d 4b40          	push	#64
 838  022f ae500f        	ldw	x,#20495
 839  0232 cd0000        	call	_GPIO_Init
 841  0235 85            	popw	x
 844  0236 4be0          	push	#224
 845  0238 4b80          	push	#128
 846  023a ae500f        	ldw	x,#20495
 847  023d cd0000        	call	_GPIO_Init
 849  0240 85            	popw	x
 850                     ; 142     SDA_HIGH();
 852  0241 4b40          	push	#64
 853  0243 ae500f        	ldw	x,#20495
 854  0246 cd0000        	call	_GPIO_WriteHigh
 856  0249 84            	pop	a
 857                     ; 143     delay_us(10);
 859  024a ae000a        	ldw	x,#10
 860  024d cd0000        	call	_delay_us
 862                     ; 144     SCL_HIGH();
 864  0250 4b80          	push	#128
 865  0252 ae500f        	ldw	x,#20495
 866  0255 cd0000        	call	_GPIO_WriteHigh
 868  0258 84            	pop	a
 869                     ; 145     delay_us(10);
 871  0259 ae000a        	ldw	x,#10
 872  025c cd0000        	call	_delay_us
 875  025f 2016          	jra	L152
 876  0261               L742:
 877                     ; 149         timeout++;
 879  0261 1e01          	ldw	x,(OFST-1,sp)
 880  0263 1c0001        	addw	x,#1
 881  0266 1f01          	ldw	(OFST-1,sp),x
 883                     ; 151         if(timeout > I2C_timeout)
 885  0268 9c            	rvf
 886  0269 1e01          	ldw	x,(OFST-1,sp)
 887  026b a303e9        	cpw	x,#1001
 888  026e 2f07          	jrslt	L152
 889                     ; 153             SW_I2C_stop();
 891  0270 cd0082        	call	_SW_I2C_stop
 893                     ; 154             return 1;
 895  0273 a601          	ld	a,#1
 897  0275 2017          	jra	L22
 898  0277               L152:
 899                     ; 147     while(SDA_IN() != 0x00)
 901  0277 4b40          	push	#64
 902  0279 ae500f        	ldw	x,#20495
 903  027c cd0000        	call	_GPIO_ReadInputPin
 905  027f 5b01          	addw	sp,#1
 906  0281 4d            	tnz	a
 907  0282 26dd          	jrne	L742
 908                     ; 158     SCL_LOW();
 911  0284 4b80          	push	#128
 912  0286 ae500f        	ldw	x,#20495
 913  0289 cd0000        	call	_GPIO_WriteLow
 915  028c 84            	pop	a
 916                     ; 160     return 0x00;
 918  028d 4f            	clr	a
 920  028e               L22:
 922  028e 85            	popw	x
 923  028f 81            	ret
 936                     	xdef	_SW_I2C_wait_ACK
 937                     	xdef	_SW_I2C_ACK_NACK
 938                     	xdef	_SW_I2C_write
 939                     	xdef	_SW_I2C_read
 940                     	xdef	_SW_I2C_stop
 941                     	xdef	_SW_I2C_start
 942                     	xdef	_SW_I2C_init
 943                     	xref	_GPIO_ReadInputPin
 944                     	xref	_GPIO_WriteLow
 945                     	xref	_GPIO_WriteHigh
 946                     	xref	_GPIO_Init
 947                     	xref	_GPIO_DeInit
 948                     	xref	_delay_ms
 949                     	xref	_delay_us
 968                     	end
