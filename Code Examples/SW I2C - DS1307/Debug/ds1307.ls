   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  44                     ; 16 void DS1307_init(void)
  44                     ; 17 {
  46                     	switch	.text
  47  0000               _DS1307_init:
  51                     ; 18 	SW_I2C_init();
  53  0000 cd0000        	call	_SW_I2C_init
  55                     ; 19     DS1307_write(control_reg, 0x00);
  57  0003 ae0700        	ldw	x,#1792
  58  0006 ad25          	call	_DS1307_write
  60                     ; 20 }
  63  0008 81            	ret
 110                     ; 23 unsigned char DS1307_read(unsigned char address)
 110                     ; 24 {
 111                     	switch	.text
 112  0009               _DS1307_read:
 114  0009 88            	push	a
 115  000a 88            	push	a
 116       00000001      OFST:	set	1
 119                     ; 25     unsigned char value = 0x00;
 121                     ; 27     SW_I2C_start();
 123  000b cd0000        	call	_SW_I2C_start
 125                     ; 28     SW_I2C_write(DS1307_WR);
 127  000e a6d0          	ld	a,#208
 128  0010 cd0000        	call	_SW_I2C_write
 130                     ; 29     SW_I2C_write(address);
 132  0013 7b02          	ld	a,(OFST+1,sp)
 133  0015 cd0000        	call	_SW_I2C_write
 135                     ; 31     SW_I2C_start();
 137  0018 cd0000        	call	_SW_I2C_start
 139                     ; 32     SW_I2C_write(DS1307_RD);
 141  001b a6d1          	ld	a,#209
 142  001d cd0000        	call	_SW_I2C_write
 144                     ; 33     value = SW_I2C_read(I2C_NACK);
 146  0020 4f            	clr	a
 147  0021 cd0000        	call	_SW_I2C_read
 149  0024 6b01          	ld	(OFST+0,sp),a
 151                     ; 34     SW_I2C_stop();
 153  0026 cd0000        	call	_SW_I2C_stop
 155                     ; 36     return value;
 157  0029 7b01          	ld	a,(OFST+0,sp)
 160  002b 85            	popw	x
 161  002c 81            	ret
 207                     ; 40 void DS1307_write(unsigned char address, unsigned char value)
 207                     ; 41 {
 208                     	switch	.text
 209  002d               _DS1307_write:
 211  002d 89            	pushw	x
 212       00000000      OFST:	set	0
 215                     ; 42     SW_I2C_start();
 217  002e cd0000        	call	_SW_I2C_start
 219                     ; 43     SW_I2C_write(DS1307_WR);
 221  0031 a6d0          	ld	a,#208
 222  0033 cd0000        	call	_SW_I2C_write
 224                     ; 44     SW_I2C_write(address);
 226  0036 7b01          	ld	a,(OFST+1,sp)
 227  0038 cd0000        	call	_SW_I2C_write
 229                     ; 45     SW_I2C_write(value);
 231  003b 7b02          	ld	a,(OFST+2,sp)
 232  003d cd0000        	call	_SW_I2C_write
 234                     ; 46     SW_I2C_stop();
 236  0040 cd0000        	call	_SW_I2C_stop
 238                     ; 47 }
 241  0043 85            	popw	x
 242  0044 81            	ret
 276                     ; 50 unsigned char bcd_to_decimal(unsigned char value)
 276                     ; 51 {
 277                     	switch	.text
 278  0045               _bcd_to_decimal:
 280  0045 88            	push	a
 281  0046 88            	push	a
 282       00000001      OFST:	set	1
 285                     ; 52     return ((value & 0x0F) + (((value & 0xF0) >> 0x04) * 0x0A));
 287  0047 4e            	swap	a
 288  0048 a40f          	and	a,#15
 289  004a 97            	ld	xl,a
 290  004b a60a          	ld	a,#10
 291  004d 42            	mul	x,a
 292  004e 9f            	ld	a,xl
 293  004f 6b01          	ld	(OFST+0,sp),a
 295  0051 7b02          	ld	a,(OFST+1,sp)
 296  0053 a40f          	and	a,#15
 297  0055 1b01          	add	a,(OFST+0,sp)
 300  0057 85            	popw	x
 301  0058 81            	ret
 335                     ; 56 unsigned char decimal_to_bcd(unsigned char value)
 335                     ; 57 {
 336                     	switch	.text
 337  0059               _decimal_to_bcd:
 339  0059 88            	push	a
 340  005a 88            	push	a
 341       00000001      OFST:	set	1
 344                     ; 58     return (((value / 0x0A) << 0x04) & 0xF0) | ((value % 0x0A) & 0x0F);
 346  005b 5f            	clrw	x
 347  005c 97            	ld	xl,a
 348  005d a60a          	ld	a,#10
 349  005f 62            	div	x,a
 350  0060 5f            	clrw	x
 351  0061 97            	ld	xl,a
 352  0062 9f            	ld	a,xl
 353  0063 a40f          	and	a,#15
 354  0065 6b01          	ld	(OFST+0,sp),a
 356  0067 7b02          	ld	a,(OFST+1,sp)
 357  0069 5f            	clrw	x
 358  006a 97            	ld	xl,a
 359  006b a60a          	ld	a,#10
 360  006d 62            	div	x,a
 361  006e 9f            	ld	a,xl
 362  006f 97            	ld	xl,a
 363  0070 a610          	ld	a,#16
 364  0072 42            	mul	x,a
 365  0073 9f            	ld	a,xl
 366  0074 a4f0          	and	a,#240
 367  0076 1a01          	or	a,(OFST+0,sp)
 370  0078 85            	popw	x
 371  0079 81            	ret
 397                     ; 62 void get_time(void)
 397                     ; 63 {
 398                     	switch	.text
 399  007a               _get_time:
 403                     ; 64 	time.s = DS1307_read(sec_reg);
 405  007a 4f            	clr	a
 406  007b ad8c          	call	_DS1307_read
 408  007d b700          	ld	_time,a
 409                     ; 65 	time.s = bcd_to_decimal(time.s);
 411  007f b600          	ld	a,_time
 412  0081 adc2          	call	_bcd_to_decimal
 414  0083 b700          	ld	_time,a
 415                     ; 67 	time.m = DS1307_read(min_reg);
 417  0085 a601          	ld	a,#1
 418  0087 ad80          	call	_DS1307_read
 420  0089 b701          	ld	_time+1,a
 421                     ; 68 	time.m = bcd_to_decimal(time.m);
 423  008b b601          	ld	a,_time+1
 424  008d adb6          	call	_bcd_to_decimal
 426  008f b701          	ld	_time+1,a
 427                     ; 70 	time.h = DS1307_read(hr_reg);
 429  0091 a602          	ld	a,#2
 430  0093 cd0009        	call	_DS1307_read
 432  0096 b702          	ld	_time+2,a
 433                     ; 71 	time.h = bcd_to_decimal(time.h);
 435  0098 b602          	ld	a,_time+2
 436  009a ada9          	call	_bcd_to_decimal
 438  009c b702          	ld	_time+2,a
 439                     ; 73 	time.dy = DS1307_read(day_reg);
 441  009e a603          	ld	a,#3
 442  00a0 cd0009        	call	_DS1307_read
 444  00a3 b703          	ld	_time+3,a
 445                     ; 74 	time.dy = bcd_to_decimal(time.dy);
 447  00a5 b603          	ld	a,_time+3
 448  00a7 ad9c          	call	_bcd_to_decimal
 450  00a9 b703          	ld	_time+3,a
 451                     ; 76 	time.dt = DS1307_read(date_reg);
 453  00ab a604          	ld	a,#4
 454  00ad cd0009        	call	_DS1307_read
 456  00b0 b704          	ld	_time+4,a
 457                     ; 77 	time.dt = bcd_to_decimal(time.dt);
 459  00b2 b604          	ld	a,_time+4
 460  00b4 ad8f          	call	_bcd_to_decimal
 462  00b6 b704          	ld	_time+4,a
 463                     ; 79 	time.mt = DS1307_read(month_reg);
 465  00b8 a605          	ld	a,#5
 466  00ba cd0009        	call	_DS1307_read
 468  00bd b705          	ld	_time+5,a
 469                     ; 80 	time.mt = bcd_to_decimal(time.mt);
 471  00bf b605          	ld	a,_time+5
 472  00c1 ad82          	call	_bcd_to_decimal
 474  00c3 b705          	ld	_time+5,a
 475                     ; 82 	time.yr = DS1307_read(year_reg);
 477  00c5 a606          	ld	a,#6
 478  00c7 cd0009        	call	_DS1307_read
 480  00ca b706          	ld	_time+6,a
 481                     ; 83 	time.yr = bcd_to_decimal(time.yr);
 483  00cc b606          	ld	a,_time+6
 484  00ce cd0045        	call	_bcd_to_decimal
 486  00d1 b706          	ld	_time+6,a
 487                     ; 84 }
 490  00d3 81            	ret
 516                     ; 87 void set_time(void)
 516                     ; 88 {
 517                     	switch	.text
 518  00d4               _set_time:
 522                     ; 89 	time.s = decimal_to_bcd(time.s);
 524  00d4 b600          	ld	a,_time
 525  00d6 ad81          	call	_decimal_to_bcd
 527  00d8 b700          	ld	_time,a
 528                     ; 90 	DS1307_write(sec_reg, time.s);
 530  00da b600          	ld	a,_time
 531  00dc 5f            	clrw	x
 532  00dd 97            	ld	xl,a
 533  00de cd002d        	call	_DS1307_write
 535                     ; 92 	time.m = decimal_to_bcd(time.m);
 537  00e1 b601          	ld	a,_time+1
 538  00e3 cd0059        	call	_decimal_to_bcd
 540  00e6 b701          	ld	_time+1,a
 541                     ; 93 	DS1307_write(min_reg, time.m);
 543  00e8 b601          	ld	a,_time+1
 544  00ea ae0100        	ldw	x,#256
 545  00ed 97            	ld	xl,a
 546  00ee cd002d        	call	_DS1307_write
 548                     ; 95 	time.h = decimal_to_bcd(time.h);
 550  00f1 b602          	ld	a,_time+2
 551  00f3 cd0059        	call	_decimal_to_bcd
 553  00f6 b702          	ld	_time+2,a
 554                     ; 96 	DS1307_write(hr_reg, time.h);
 556  00f8 b602          	ld	a,_time+2
 557  00fa ae0200        	ldw	x,#512
 558  00fd 97            	ld	xl,a
 559  00fe cd002d        	call	_DS1307_write
 561                     ; 98 	time.dy = decimal_to_bcd(time.dy);
 563  0101 b603          	ld	a,_time+3
 564  0103 cd0059        	call	_decimal_to_bcd
 566  0106 b703          	ld	_time+3,a
 567                     ; 99 	DS1307_write(day_reg, time.dy);
 569  0108 b603          	ld	a,_time+3
 570  010a ae0300        	ldw	x,#768
 571  010d 97            	ld	xl,a
 572  010e cd002d        	call	_DS1307_write
 574                     ; 101 	time.dt = decimal_to_bcd(time.dt);
 576  0111 b604          	ld	a,_time+4
 577  0113 cd0059        	call	_decimal_to_bcd
 579  0116 b704          	ld	_time+4,a
 580                     ; 102 	DS1307_write(date_reg, time.dt);
 582  0118 b604          	ld	a,_time+4
 583  011a ae0400        	ldw	x,#1024
 584  011d 97            	ld	xl,a
 585  011e cd002d        	call	_DS1307_write
 587                     ; 104 	time.mt = decimal_to_bcd(time.mt);
 589  0121 b605          	ld	a,_time+5
 590  0123 cd0059        	call	_decimal_to_bcd
 592  0126 b705          	ld	_time+5,a
 593                     ; 105 	DS1307_write(month_reg, time.mt);
 595  0128 b605          	ld	a,_time+5
 596  012a ae0500        	ldw	x,#1280
 597  012d 97            	ld	xl,a
 598  012e cd002d        	call	_DS1307_write
 600                     ; 107 	time.yr = decimal_to_bcd(time.yr);
 602  0131 b606          	ld	a,_time+6
 603  0133 cd0059        	call	_decimal_to_bcd
 605  0136 b706          	ld	_time+6,a
 606                     ; 108 	DS1307_write(year_reg, time.yr);
 608  0138 b606          	ld	a,_time+6
 609  013a ae0600        	ldw	x,#1536
 610  013d 97            	ld	xl,a
 611  013e cd002d        	call	_DS1307_write
 613                     ; 109 }
 616  0141 81            	ret
 629                     	xref.b	_time
 630                     	xdef	_set_time
 631                     	xdef	_get_time
 632                     	xdef	_decimal_to_bcd
 633                     	xdef	_bcd_to_decimal
 634                     	xdef	_DS1307_write
 635                     	xdef	_DS1307_read
 636                     	xdef	_DS1307_init
 637                     	xref	_SW_I2C_write
 638                     	xref	_SW_I2C_read
 639                     	xref	_SW_I2C_stop
 640                     	xref	_SW_I2C_start
 641                     	xref	_SW_I2C_init
 660                     	end
