   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 4 void MAX6675_init()
  45                     ; 5 {
  47                     	switch	.text
  48  0000               _MAX6675_init:
  52                     ; 6    GPIO_DeInit(SW_SPI_Port);
  54  0000 ae500a        	ldw	x,#20490
  55  0003 cd0000        	call	_GPIO_DeInit
  57                     ; 8    GPIO_Init(SW_SPI_Port, 
  57                     ; 9               ((GPIO_Pin_TypeDef)(SCK_pin | CS_pin)), 
  57                     ; 10               GPIO_MODE_OUT_PP_HIGH_FAST);
  59  0006 4bf0          	push	#240
  60  0008 4b06          	push	#6
  61  000a ae500a        	ldw	x,#20490
  62  000d cd0000        	call	_GPIO_Init
  64  0010 85            	popw	x
  65                     ; 12    GPIO_Init(SW_SPI_Port, SO_pin, GPIO_MODE_IN_FL_NO_IT);
  67  0011 4b00          	push	#0
  68  0013 4b08          	push	#8
  69  0015 ae500a        	ldw	x,#20490
  70  0018 cd0000        	call	_GPIO_Init
  72  001b 85            	popw	x
  73                     ; 14    CS_OUT_HIGH();
  75  001c 4b02          	push	#2
  76  001e ae500a        	ldw	x,#20490
  77  0021 cd0000        	call	_GPIO_WriteHigh
  79  0024 84            	pop	a
  80                     ; 15    SCK_OUT_HIGH();
  82  0025 4b04          	push	#4
  83  0027 ae500a        	ldw	x,#20490
  84  002a cd0000        	call	_GPIO_WriteHigh
  86  002d 84            	pop	a
  87                     ; 16 }
  90  002e 81            	ret
 165                     ; 19 unsigned char MAX6657_get_ADC(unsigned int *ADC_data)
 165                     ; 20 {
 166                     	switch	.text
 167  002f               _MAX6657_get_ADC:
 169  002f 89            	pushw	x
 170  0030 5208          	subw	sp,#8
 171       00000008      OFST:	set	8
 174                     ; 21    unsigned char samples = no_of_samples;
 176  0032 a610          	ld	a,#16
 177  0034 6b05          	ld	(OFST-3,sp),a
 179                     ; 22    unsigned char clk_pulses = 0;
 181                     ; 23    unsigned int temp_data = 0;
 183                     ; 24    unsigned long avg_value = 0;
 185  0036 ae0000        	ldw	x,#0
 186  0039 1f03          	ldw	(OFST-5,sp),x
 187  003b ae0000        	ldw	x,#0
 188  003e 1f01          	ldw	(OFST-7,sp),x
 191  0040 2064          	jra	L36
 192  0042               L75:
 193                     ; 29          clk_pulses = no_of_pulses;
 195  0042 a610          	ld	a,#16
 196  0044 6b06          	ld	(OFST-2,sp),a
 198                     ; 30          temp_data = 0;
 200  0046 5f            	clrw	x
 201  0047 1f07          	ldw	(OFST-1,sp),x
 203                     ; 32          CS_OUT_LOW();
 205  0049 4b02          	push	#2
 206  004b ae500a        	ldw	x,#20490
 207  004e cd0000        	call	_GPIO_WriteLow
 209  0051 84            	pop	a
 211  0052 202b          	jra	L17
 212  0054               L76:
 213                     ; 36             temp_data <<= 1;
 215  0054 0808          	sll	(OFST+0,sp)
 216  0056 0907          	rlc	(OFST-1,sp)
 218                     ; 38             if(SO_IN())
 220  0058 4b08          	push	#8
 221  005a ae500a        	ldw	x,#20490
 222  005d cd0000        	call	_GPIO_ReadInputPin
 224  0060 5b01          	addw	sp,#1
 225  0062 4d            	tnz	a
 226  0063 2706          	jreq	L57
 227                     ; 40                 temp_data |= 1;
 229  0065 7b08          	ld	a,(OFST+0,sp)
 230  0067 aa01          	or	a,#1
 231  0069 6b08          	ld	(OFST+0,sp),a
 233  006b               L57:
 234                     ; 43             SCK_OUT_HIGH();
 236  006b 4b04          	push	#4
 237  006d ae500a        	ldw	x,#20490
 238  0070 cd0000        	call	_GPIO_WriteHigh
 240  0073 84            	pop	a
 241                     ; 44             SCK_OUT_LOW();
 243  0074 4b04          	push	#4
 244  0076 ae500a        	ldw	x,#20490
 245  0079 cd0000        	call	_GPIO_WriteLow
 247  007c 84            	pop	a
 248                     ; 46             clk_pulses--;
 250  007d 0a06          	dec	(OFST-2,sp)
 252  007f               L17:
 253                     ; 34          while(clk_pulses > 0)
 255  007f 0d06          	tnz	(OFST-2,sp)
 256  0081 26d1          	jrne	L76
 257                     ; 49          CS_OUT_HIGH();
 260  0083 4b02          	push	#2
 261  0085 ae500a        	ldw	x,#20490
 262  0088 cd0000        	call	_GPIO_WriteHigh
 264  008b 84            	pop	a
 265                     ; 50          temp_data &= 0x7FFF;
 267  008c 7b07          	ld	a,(OFST-1,sp)
 268  008e a47f          	and	a,#127
 269  0090 6b07          	ld	(OFST-1,sp),a
 271                     ; 52          avg_value += temp_data;
 273  0092 1e07          	ldw	x,(OFST-1,sp)
 274  0094 cd0000        	call	c_uitolx
 276  0097 96            	ldw	x,sp
 277  0098 1c0001        	addw	x,#OFST-7
 278  009b cd0000        	call	c_lgadd
 281                     ; 54          samples--;
 283  009e 0a05          	dec	(OFST-3,sp)
 285                     ; 55          delay_ms(10);
 287  00a0 ae000a        	ldw	x,#10
 288  00a3 cd0000        	call	_delay_ms
 290  00a6               L36:
 291                     ; 27    while(samples > 0)
 293  00a6 0d05          	tnz	(OFST-3,sp)
 294  00a8 2698          	jrne	L75
 295                     ; 58    temp_data = (avg_value >> 4);
 298  00aa 96            	ldw	x,sp
 299  00ab 1c0001        	addw	x,#OFST-7
 300  00ae cd0000        	call	c_ltor
 302  00b1 a604          	ld	a,#4
 303  00b3 cd0000        	call	c_lursh
 305  00b6 be02          	ldw	x,c_lreg+2
 306  00b8 1f07          	ldw	(OFST-1,sp),x
 308                     ; 60    if((temp_data & 0x04) == close_contact)
 310  00ba 7b08          	ld	a,(OFST+0,sp)
 311  00bc a504          	bcp	a,#4
 312  00be 260c          	jrne	L77
 313                     ; 62       *ADC_data = (temp_data >> 3);
 315  00c0 1e07          	ldw	x,(OFST-1,sp)
 316  00c2 54            	srlw	x
 317  00c3 54            	srlw	x
 318  00c4 54            	srlw	x
 319  00c5 1609          	ldw	y,(OFST+1,sp)
 320  00c7 90ff          	ldw	(y),x
 321                     ; 63       return close_contact;
 323  00c9 4f            	clr	a
 325  00ca 2009          	jra	L01
 326  00cc               L77:
 327                     ; 67       *ADC_data = (count_max + 1);
 329  00cc 1e09          	ldw	x,(OFST+1,sp)
 330  00ce 90ae1001      	ldw	y,#4097
 331  00d2 ff            	ldw	(x),y
 332                     ; 68       return open_contact;
 334  00d3 a604          	ld	a,#4
 336  00d5               L01:
 338  00d5 5b0a          	addw	sp,#10
 339  00d7 81            	ret
 391                     ; 73 float MAX6675_get_T(unsigned int ADC_value, unsigned char T_unit)
 391                     ; 74 {
 392                     	switch	.text
 393  00d8               _MAX6675_get_T:
 395  00d8 89            	pushw	x
 396  00d9 5204          	subw	sp,#4
 397       00000004      OFST:	set	4
 400                     ; 75    float tmp = 0.0;
 402                     ; 77    tmp = (((float)ADC_value) * scalar_deg_C);
 404  00db cd0000        	call	c_uitof
 406  00de ae000c        	ldw	x,#L351
 407  00e1 cd0000        	call	c_fmul
 409  00e4 96            	ldw	x,sp
 410  00e5 1c0001        	addw	x,#OFST-3
 411  00e8 cd0000        	call	c_rtol
 414                     ; 79    switch(T_unit)
 416  00eb 7b09          	ld	a,(OFST+5,sp)
 418                     ; 94         break;
 419  00ed 4a            	dec	a
 420  00ee 2705          	jreq	L301
 421  00f0 4a            	dec	a
 422  00f1 271e          	jreq	L501
 423  00f3 2029          	jra	L161
 424  00f5               L301:
 425                     ; 83          tmp *= scalar_deg_F_1;
 427  00f5 ae0008        	ldw	x,#L761
 428  00f8 cd0000        	call	c_ltor
 430  00fb 96            	ldw	x,sp
 431  00fc 1c0001        	addw	x,#OFST-3
 432  00ff cd0000        	call	c_fgmul
 435                     ; 84          tmp += scalar_deg_F_2;
 437  0102 ae0004        	ldw	x,#L771
 438  0105 cd0000        	call	c_ltor
 440  0108 96            	ldw	x,sp
 441  0109 1c0001        	addw	x,#OFST-3
 442  010c cd0000        	call	c_fgadd
 445                     ; 85          break;
 447  010f 200d          	jra	L161
 448  0111               L501:
 449                     ; 89         tmp += scalar_tmp_K;
 451  0111 ae0000        	ldw	x,#L702
 452  0114 cd0000        	call	c_ltor
 454  0117 96            	ldw	x,sp
 455  0118 1c0001        	addw	x,#OFST-3
 456  011b cd0000        	call	c_fgadd
 459                     ; 90         break;
 461  011e               L161:
 462                     ; 98    return tmp;
 464  011e 96            	ldw	x,sp
 465  011f 1c0001        	addw	x,#OFST-3
 466  0122 cd0000        	call	c_ltor
 470  0125 5b06          	addw	sp,#6
 471  0127 81            	ret
 484                     	xdef	_MAX6675_get_T
 485                     	xdef	_MAX6657_get_ADC
 486                     	xdef	_MAX6675_init
 487                     	xref	_GPIO_ReadInputPin
 488                     	xref	_GPIO_WriteLow
 489                     	xref	_GPIO_WriteHigh
 490                     	xref	_GPIO_Init
 491                     	xref	_GPIO_DeInit
 492                     	xref	_delay_ms
 493                     .const:	section	.text
 494  0000               L702:
 495  0000 43888000      	dc.w	17288,-32768
 496  0004               L771:
 497  0004 42000000      	dc.w	16896,0
 498  0008               L761:
 499  0008 3fe66666      	dc.w	16358,26214
 500  000c               L351:
 501  000c 3e800000      	dc.w	16000,0
 502  0010               L341:
 503  0010 00000000      	dc.w	0,0
 504                     	xref.b	c_lreg
 505                     	xref.b	c_x
 525                     	xref	c_fgadd
 526                     	xref	c_fgmul
 527                     	xref	c_rtol
 528                     	xref	c_fmul
 529                     	xref	c_uitof
 530                     	xref	c_lursh
 531                     	xref	c_ltor
 532                     	xref	c_lgadd
 533                     	xref	c_uitolx
 534                     	end
