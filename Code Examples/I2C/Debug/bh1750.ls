   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 4 void BH1750_init(void)
  45                     ; 5 { 
  47                     	switch	.text
  48  0000               _BH1750_init:
  52                     ; 6    delay_ms(10);  
  54  0000 ae000a        	ldw	x,#10
  55  0003 cd0000        	call	_delay_ms
  57                     ; 7    BH1750_write(power_down);
  59  0006 4f            	clr	a
  60  0007 ad01          	call	_BH1750_write
  62                     ; 8 }                
  65  0009 81            	ret
 104                     ; 11 void BH1750_write(unsigned char cmd)
 104                     ; 12 {  
 105                     	switch	.text
 106  000a               _BH1750_write:
 108  000a 88            	push	a
 109       00000000      OFST:	set	0
 112                     ; 13    I2C_GenerateSTART(ENABLE);
 114  000b a601          	ld	a,#1
 115  000d cd0000        	call	_I2C_GenerateSTART
 118  0010               L14:
 119                     ; 14    while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
 121  0010 ae0301        	ldw	x,#769
 122  0013 cd0000        	call	_I2C_CheckEvent
 124  0016 4d            	tnz	a
 125  0017 27f7          	jreq	L14
 126                     ; 16    I2C_Send7bitAddress(BH1750_addr, I2C_DIRECTION_TX); 
 128  0019 ae4600        	ldw	x,#17920
 129  001c cd0000        	call	_I2C_Send7bitAddress
 132  001f               L74:
 133                     ; 17    while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 135  001f ae0782        	ldw	x,#1922
 136  0022 cd0000        	call	_I2C_CheckEvent
 138  0025 4d            	tnz	a
 139  0026 27f7          	jreq	L74
 140                     ; 19    I2C_SendData(cmd);
 142  0028 7b01          	ld	a,(OFST+1,sp)
 143  002a cd0000        	call	_I2C_SendData
 146  002d               L55:
 147                     ; 20    while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 149  002d ae0784        	ldw	x,#1924
 150  0030 cd0000        	call	_I2C_CheckEvent
 152  0033 4d            	tnz	a
 153  0034 27f7          	jreq	L55
 154                     ; 22    I2C_GenerateSTOP(ENABLE);   
 156  0036 a601          	ld	a,#1
 157  0038 cd0000        	call	_I2C_GenerateSTOP
 159                     ; 23 }
 162  003b 84            	pop	a
 163  003c 81            	ret
 166                     .const:	section	.text
 167  0000               L16_bytes:
 168  0000 00            	dc.b	0
 169  0001 00            	dc.b	0
 227                     ; 26 unsigned int BH1750_read_word(void)
 227                     ; 27 {                      
 228                     	switch	.text
 229  003d               _BH1750_read_word:
 231  003d 5209          	subw	sp,#9
 232       00000009      OFST:	set	9
 235                     ; 28    unsigned long value = 0x0000;
 237                     ; 29    unsigned char num_of_bytes = 0x02;   
 239  003f a602          	ld	a,#2
 240  0041 6b09          	ld	(OFST+0,sp),a
 242                     ; 30    unsigned char bytes[2] = {0x00, 0x00};
 244  0043 c60000        	ld	a,L16_bytes
 245  0046 6b07          	ld	(OFST-2,sp),a
 246  0048 c60001        	ld	a,L16_bytes+1
 247  004b 6b08          	ld	(OFST-1,sp),a
 249  004d               L511:
 250                     ; 32    while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));
 252  004d ae0302        	ldw	x,#770
 253  0050 cd0000        	call	_I2C_GetFlagStatus
 255  0053 4d            	tnz	a
 256  0054 26f7          	jrne	L511
 257                     ; 34    I2C_GenerateSTART(ENABLE);
 259  0056 a601          	ld	a,#1
 260  0058 cd0000        	call	_I2C_GenerateSTART
 263  005b               L321:
 264                     ; 35    while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
 266  005b ae0301        	ldw	x,#769
 267  005e cd0000        	call	_I2C_CheckEvent
 269  0061 4d            	tnz	a
 270  0062 27f7          	jreq	L321
 271                     ; 37    I2C_Send7bitAddress(BH1750_addr, I2C_DIRECTION_RX);
 273  0064 ae4601        	ldw	x,#17921
 274  0067 cd0000        	call	_I2C_Send7bitAddress
 277  006a               L131:
 278                     ; 38    while(!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
 280  006a ae0302        	ldw	x,#770
 281  006d cd0000        	call	_I2C_CheckEvent
 283  0070 4d            	tnz	a
 284  0071 27f7          	jreq	L131
 286  0073 202c          	jra	L731
 287  0075               L531:
 288                     ; 42 		if(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))
 290  0075 ae0340        	ldw	x,#832
 291  0078 cd0000        	call	_I2C_CheckEvent
 293  007b 4d            	tnz	a
 294  007c 2723          	jreq	L731
 295                     ; 44 			if(num_of_bytes == 0)
 297  007e 0d09          	tnz	(OFST+0,sp)
 298  0080 2609          	jrne	L541
 299                     ; 46 				I2C_AcknowledgeConfig(I2C_ACK_NONE);
 301  0082 4f            	clr	a
 302  0083 cd0000        	call	_I2C_AcknowledgeConfig
 304                     ; 47 				I2C_GenerateSTOP(ENABLE);   
 306  0086 a601          	ld	a,#1
 307  0088 cd0000        	call	_I2C_GenerateSTOP
 309  008b               L541:
 310                     ; 50 			bytes[(num_of_bytes - 1)] = I2C_ReceiveData();
 312  008b 96            	ldw	x,sp
 313  008c 1c0007        	addw	x,#OFST-2
 314  008f 1f01          	ldw	(OFST-8,sp),x
 316  0091 7b09          	ld	a,(OFST+0,sp)
 317  0093 5f            	clrw	x
 318  0094 97            	ld	xl,a
 319  0095 5a            	decw	x
 320  0096 72fb01        	addw	x,(OFST-8,sp)
 321  0099 89            	pushw	x
 322  009a cd0000        	call	_I2C_ReceiveData
 324  009d 85            	popw	x
 325  009e f7            	ld	(x),a
 326                     ; 52 			num_of_bytes--;
 328  009f 0a09          	dec	(OFST+0,sp)
 330  00a1               L731:
 331                     ; 40    while(num_of_bytes)
 333  00a1 0d09          	tnz	(OFST+0,sp)
 334  00a3 26d0          	jrne	L531
 335                     ; 56    value = ((bytes[1] << 8) | bytes[0]);  
 338  00a5 7b08          	ld	a,(OFST-1,sp)
 339  00a7 5f            	clrw	x
 340  00a8 97            	ld	xl,a
 341  00a9 7b07          	ld	a,(OFST-2,sp)
 342  00ab 02            	rlwa	x,a
 343  00ac cd0000        	call	c_uitolx
 345  00af 96            	ldw	x,sp
 346  00b0 1c0003        	addw	x,#OFST-6
 347  00b3 cd0000        	call	c_rtol
 350                     ; 58    return value;
 352  00b6 1e05          	ldw	x,(OFST-4,sp)
 355  00b8 5b09          	addw	sp,#9
 356  00ba 81            	ret
 429                     ; 62 unsigned int get_lux_value(unsigned char mode, unsigned int delay_time)
 429                     ; 63 {
 430                     	switch	.text
 431  00bb               _get_lux_value:
 433  00bb 88            	push	a
 434  00bc 5206          	subw	sp,#6
 435       00000006      OFST:	set	6
 438                     ; 64    unsigned long lux_value = 0x00;  
 440  00be ae0000        	ldw	x,#0
 441  00c1 1f03          	ldw	(OFST-3,sp),x
 442  00c3 ae0000        	ldw	x,#0
 443  00c6 1f01          	ldw	(OFST-5,sp),x
 445                     ; 65    unsigned char dly = 0x00;
 447                     ; 66    unsigned char s = 0x08;
 449  00c8 a608          	ld	a,#8
 450  00ca 6b05          	ld	(OFST-1,sp),a
 452  00cc               L502:
 453                     ; 70        BH1750_write(power_up);
 455  00cc a601          	ld	a,#1
 456  00ce cd000a        	call	_BH1750_write
 458                     ; 71        BH1750_write(mode);
 460  00d1 7b07          	ld	a,(OFST+1,sp)
 461  00d3 cd000a        	call	_BH1750_write
 463                     ; 72        lux_value += BH1750_read_word();
 465  00d6 cd003d        	call	_BH1750_read_word
 467  00d9 cd0000        	call	c_uitolx
 469  00dc 96            	ldw	x,sp
 470  00dd 1c0001        	addw	x,#OFST-5
 471  00e0 cd0000        	call	c_lgadd
 474                     ; 73        for(dly = 0; dly < delay_time; dly += 1)
 476  00e3 0f06          	clr	(OFST+0,sp)
 479  00e5 2008          	jra	L712
 480  00e7               L312:
 481                     ; 75            delay_ms(1);
 483  00e7 ae0001        	ldw	x,#1
 484  00ea cd0000        	call	_delay_ms
 486                     ; 73        for(dly = 0; dly < delay_time; dly += 1)
 488  00ed 0c06          	inc	(OFST+0,sp)
 490  00ef               L712:
 493  00ef 7b06          	ld	a,(OFST+0,sp)
 494  00f1 5f            	clrw	x
 495  00f2 97            	ld	xl,a
 496  00f3 130a          	cpw	x,(OFST+4,sp)
 497  00f5 25f0          	jrult	L312
 498                     ; 77        BH1750_write(power_down);
 500  00f7 4f            	clr	a
 501  00f8 cd000a        	call	_BH1750_write
 503                     ; 78 	   s--;
 505  00fb 0a05          	dec	(OFST-1,sp)
 507                     ; 68    while(s)
 509  00fd 0d05          	tnz	(OFST-1,sp)
 510  00ff 26cb          	jrne	L502
 511                     ; 80    lux_value >>= 3;
 513  0101 96            	ldw	x,sp
 514  0102 1c0001        	addw	x,#OFST-5
 515  0105 a603          	ld	a,#3
 516  0107 cd0000        	call	c_lgursh
 519                     ; 82    return ((unsigned int)lux_value);
 521  010a 1e03          	ldw	x,(OFST-3,sp)
 524  010c 5b07          	addw	sp,#7
 525  010e 81            	ret
 538                     	xdef	_get_lux_value
 539                     	xdef	_BH1750_read_word
 540                     	xdef	_BH1750_write
 541                     	xdef	_BH1750_init
 542                     	xref	_I2C_GetFlagStatus
 543                     	xref	_I2C_CheckEvent
 544                     	xref	_I2C_SendData
 545                     	xref	_I2C_Send7bitAddress
 546                     	xref	_I2C_ReceiveData
 547                     	xref	_I2C_AcknowledgeConfig
 548                     	xref	_I2C_GenerateSTOP
 549                     	xref	_I2C_GenerateSTART
 550                     	xref	_delay_ms
 569                     	xref	c_lgursh
 570                     	xref	c_lgadd
 571                     	xref	c_rtol
 572                     	xref	c_uitolx
 573                     	end
