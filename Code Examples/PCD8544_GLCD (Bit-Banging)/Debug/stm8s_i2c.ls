   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 67 void I2C_DeInit(void)
  42                     ; 68 {
  43                     	switch	.text
  44  0000               f_I2C_DeInit:
  48                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  50  0000 725f5210      	clr	21008
  51                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  53  0004 725f5211      	clr	21009
  54                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  56  0008 725f5212      	clr	21010
  57                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  59  000c 725f5213      	clr	21011
  60                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  62  0010 725f5214      	clr	21012
  63                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  65  0014 725f521a      	clr	21018
  66                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  68  0018 725f521b      	clr	21019
  69                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  71  001c 725f521c      	clr	21020
  72                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  74  0020 3502521d      	mov	21021,#2
  75                     ; 78 }
  78  0024 87            	retf
 244                     .const:	section	.text
 245  0000               L01:
 246  0000 000186a1      	dc.l	100001
 247  0004               L21:
 248  0004 000f4240      	dc.l	1000000
 249                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 249                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 249                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 249                     ; 99 {
 250                     	switch	.text
 251  0025               f_I2C_Init:
 253  0025 5209          	subw	sp,#9
 254       00000009      OFST:	set	9
 257                     ; 100   uint16_t result = 0x0004;
 259                     ; 101   uint16_t tmpval = 0;
 261                     ; 102   uint8_t tmpccrh = 0;
 263  0027 0f07          	clr	(OFST-2,sp)
 265                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 267                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 269                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 271                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 273                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 275                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 277                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 279  0029 c65212        	ld	a,21010
 280  002c a4c0          	and	a,#192
 281  002e c75212        	ld	21010,a
 282                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 284  0031 c65212        	ld	a,21010
 285  0034 1a16          	or	a,(OFST+13,sp)
 286  0036 c75212        	ld	21010,a
 287                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 289  0039 72115210      	bres	21008,#0
 290                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 292  003d c6521c        	ld	a,21020
 293  0040 a430          	and	a,#48
 294  0042 c7521c        	ld	21020,a
 295                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 297  0045 725f521b      	clr	21019
 298                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 300  0049 96            	ldw	x,sp
 301  004a 1c000d        	addw	x,#OFST+4
 302  004d 8d000000      	callf	d_ltor
 304  0051 ae0000        	ldw	x,#L01
 305  0054 8d000000      	callf	d_lcmp
 307  0058 2404          	jruge	L41
 308  005a acf300f3      	jpf	L511
 309  005e               L41:
 310                     ; 131     tmpccrh = I2C_CCRH_FS;
 312  005e a680          	ld	a,#128
 313  0060 6b07          	ld	(OFST-2,sp),a
 315                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 317  0062 0d13          	tnz	(OFST+10,sp)
 318  0064 2635          	jrne	L711
 319                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 321  0066 96            	ldw	x,sp
 322  0067 1c000d        	addw	x,#OFST+4
 323  006a 8d000000      	callf	d_ltor
 325  006e a603          	ld	a,#3
 326  0070 8d000000      	callf	d_smul
 328  0074 96            	ldw	x,sp
 329  0075 1c0001        	addw	x,#OFST-8
 330  0078 8d000000      	callf	d_rtol
 333  007c 7b16          	ld	a,(OFST+13,sp)
 334  007e b703          	ld	c_lreg+3,a
 335  0080 3f02          	clr	c_lreg+2
 336  0082 3f01          	clr	c_lreg+1
 337  0084 3f00          	clr	c_lreg
 338  0086 ae0004        	ldw	x,#L21
 339  0089 8d000000      	callf	d_lmul
 341  008d 96            	ldw	x,sp
 342  008e 1c0001        	addw	x,#OFST-8
 343  0091 8d000000      	callf	d_ludv
 345  0095 be02          	ldw	x,c_lreg+2
 346  0097 1f08          	ldw	(OFST-1,sp),x
 349  0099 2039          	jra	L121
 350  009b               L711:
 351                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 353  009b 96            	ldw	x,sp
 354  009c 1c000d        	addw	x,#OFST+4
 355  009f 8d000000      	callf	d_ltor
 357  00a3 a619          	ld	a,#25
 358  00a5 8d000000      	callf	d_smul
 360  00a9 96            	ldw	x,sp
 361  00aa 1c0001        	addw	x,#OFST-8
 362  00ad 8d000000      	callf	d_rtol
 365  00b1 7b16          	ld	a,(OFST+13,sp)
 366  00b3 b703          	ld	c_lreg+3,a
 367  00b5 3f02          	clr	c_lreg+2
 368  00b7 3f01          	clr	c_lreg+1
 369  00b9 3f00          	clr	c_lreg
 370  00bb ae0004        	ldw	x,#L21
 371  00be 8d000000      	callf	d_lmul
 373  00c2 96            	ldw	x,sp
 374  00c3 1c0001        	addw	x,#OFST-8
 375  00c6 8d000000      	callf	d_ludv
 377  00ca be02          	ldw	x,c_lreg+2
 378  00cc 1f08          	ldw	(OFST-1,sp),x
 380                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 382  00ce 7b07          	ld	a,(OFST-2,sp)
 383  00d0 aa40          	or	a,#64
 384  00d2 6b07          	ld	(OFST-2,sp),a
 386  00d4               L121:
 387                     ; 147     if (result < (uint16_t)0x01)
 389  00d4 1e08          	ldw	x,(OFST-1,sp)
 390  00d6 2605          	jrne	L321
 391                     ; 150       result = (uint16_t)0x0001;
 393  00d8 ae0001        	ldw	x,#1
 394  00db 1f08          	ldw	(OFST-1,sp),x
 396  00dd               L321:
 397                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 399  00dd 7b16          	ld	a,(OFST+13,sp)
 400  00df 97            	ld	xl,a
 401  00e0 a603          	ld	a,#3
 402  00e2 42            	mul	x,a
 403  00e3 a60a          	ld	a,#10
 404  00e5 8d000000      	callf	d_sdivx
 406  00e9 5c            	incw	x
 407  00ea 1f05          	ldw	(OFST-4,sp),x
 409                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 411  00ec 7b06          	ld	a,(OFST-3,sp)
 412  00ee c7521d        	ld	21021,a
 414  00f1 2047          	jra	L521
 415  00f3               L511:
 416                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 418  00f3 96            	ldw	x,sp
 419  00f4 1c000d        	addw	x,#OFST+4
 420  00f7 8d000000      	callf	d_ltor
 422  00fb 3803          	sll	c_lreg+3
 423  00fd 3902          	rlc	c_lreg+2
 424  00ff 3901          	rlc	c_lreg+1
 425  0101 3900          	rlc	c_lreg
 426  0103 96            	ldw	x,sp
 427  0104 1c0001        	addw	x,#OFST-8
 428  0107 8d000000      	callf	d_rtol
 431  010b 7b16          	ld	a,(OFST+13,sp)
 432  010d b703          	ld	c_lreg+3,a
 433  010f 3f02          	clr	c_lreg+2
 434  0111 3f01          	clr	c_lreg+1
 435  0113 3f00          	clr	c_lreg
 436  0115 ae0004        	ldw	x,#L21
 437  0118 8d000000      	callf	d_lmul
 439  011c 96            	ldw	x,sp
 440  011d 1c0001        	addw	x,#OFST-8
 441  0120 8d000000      	callf	d_ludv
 443  0124 be02          	ldw	x,c_lreg+2
 444  0126 1f08          	ldw	(OFST-1,sp),x
 446                     ; 167     if (result < (uint16_t)0x0004)
 448  0128 1e08          	ldw	x,(OFST-1,sp)
 449  012a a30004        	cpw	x,#4
 450  012d 2405          	jruge	L721
 451                     ; 170       result = (uint16_t)0x0004;
 453  012f ae0004        	ldw	x,#4
 454  0132 1f08          	ldw	(OFST-1,sp),x
 456  0134               L721:
 457                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 459  0134 7b16          	ld	a,(OFST+13,sp)
 460  0136 4c            	inc	a
 461  0137 c7521d        	ld	21021,a
 462  013a               L521:
 463                     ; 181   I2C->CCRL = (uint8_t)result;
 465  013a 7b09          	ld	a,(OFST+0,sp)
 466  013c c7521b        	ld	21019,a
 467                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 469  013f 7b08          	ld	a,(OFST-1,sp)
 470  0141 a40f          	and	a,#15
 471  0143 1a07          	or	a,(OFST-2,sp)
 472  0145 c7521c        	ld	21020,a
 473                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 475  0148 72105210      	bset	21008,#0
 476                     ; 188   I2C_AcknowledgeConfig(Ack);
 478  014c 7b14          	ld	a,(OFST+11,sp)
 479  014e 8dc301c3      	callf	f_I2C_AcknowledgeConfig
 481                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 483  0152 7b12          	ld	a,(OFST+9,sp)
 484  0154 c75213        	ld	21011,a
 485                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 485                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 487  0157 1e11          	ldw	x,(OFST+8,sp)
 488  0159 4f            	clr	a
 489  015a 01            	rrwa	x,a
 490  015b 48            	sll	a
 491  015c 59            	rlcw	x
 492  015d 01            	rrwa	x,a
 493  015e a406          	and	a,#6
 494  0160 5f            	clrw	x
 495  0161 6b04          	ld	(OFST-5,sp),a
 497  0163 7b15          	ld	a,(OFST+12,sp)
 498  0165 aa40          	or	a,#64
 499  0167 1a04          	or	a,(OFST-5,sp)
 500  0169 c75214        	ld	21012,a
 501                     ; 194 }
 504  016c 5b09          	addw	sp,#9
 505  016e 87            	retf
 559                     ; 202 void I2C_Cmd(FunctionalState NewState)
 559                     ; 203 {
 560                     	switch	.text
 561  016f               f_I2C_Cmd:
 565                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 567                     ; 207   if (NewState != DISABLE)
 569  016f 4d            	tnz	a
 570  0170 2706          	jreq	L751
 571                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 573  0172 72105210      	bset	21008,#0
 575  0176 2004          	jra	L161
 576  0178               L751:
 577                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 579  0178 72115210      	bres	21008,#0
 580  017c               L161:
 581                     ; 217 }
 584  017c 87            	retf
 618                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 618                     ; 226 {
 619                     	switch	.text
 620  017d               f_I2C_GeneralCallCmd:
 624                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 626                     ; 230   if (NewState != DISABLE)
 628  017d 4d            	tnz	a
 629  017e 2706          	jreq	L102
 630                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 632  0180 721c5210      	bset	21008,#6
 634  0184 2004          	jra	L302
 635  0186               L102:
 636                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 638  0186 721d5210      	bres	21008,#6
 639  018a               L302:
 640                     ; 240 }
 643  018a 87            	retf
 677                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 677                     ; 251 {
 678                     	switch	.text
 679  018b               f_I2C_GenerateSTART:
 683                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 685                     ; 255   if (NewState != DISABLE)
 687  018b 4d            	tnz	a
 688  018c 2706          	jreq	L322
 689                     ; 258     I2C->CR2 |= I2C_CR2_START;
 691  018e 72105211      	bset	21009,#0
 693  0192 2004          	jra	L522
 694  0194               L322:
 695                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 697  0194 72115211      	bres	21009,#0
 698  0198               L522:
 699                     ; 265 }
 702  0198 87            	retf
 736                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 736                     ; 274 {
 737                     	switch	.text
 738  0199               f_I2C_GenerateSTOP:
 742                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 744                     ; 278   if (NewState != DISABLE)
 746  0199 4d            	tnz	a
 747  019a 2706          	jreq	L542
 748                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 750  019c 72125211      	bset	21009,#1
 752  01a0 2004          	jra	L742
 753  01a2               L542:
 754                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 756  01a2 72135211      	bres	21009,#1
 757  01a6               L742:
 758                     ; 288 }
 761  01a6 87            	retf
 796                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 796                     ; 297 {
 797                     	switch	.text
 798  01a7               f_I2C_SoftwareResetCmd:
 802                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 804                     ; 301   if (NewState != DISABLE)
 806  01a7 4d            	tnz	a
 807  01a8 2706          	jreq	L762
 808                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 810  01aa 721e5211      	bset	21009,#7
 812  01ae 2004          	jra	L172
 813  01b0               L762:
 814                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 816  01b0 721f5211      	bres	21009,#7
 817  01b4               L172:
 818                     ; 311 }
 821  01b4 87            	retf
 856                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 856                     ; 321 {
 857                     	switch	.text
 858  01b5               f_I2C_StretchClockCmd:
 862                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 864                     ; 325   if (NewState != DISABLE)
 866  01b5 4d            	tnz	a
 867  01b6 2706          	jreq	L113
 868                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 870  01b8 721f5210      	bres	21008,#7
 872  01bc 2004          	jra	L313
 873  01be               L113:
 874                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 876  01be 721e5210      	bset	21008,#7
 877  01c2               L313:
 878                     ; 336 }
 881  01c2 87            	retf
 916                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 916                     ; 346 {
 917                     	switch	.text
 918  01c3               f_I2C_AcknowledgeConfig:
 920  01c3 88            	push	a
 921       00000000      OFST:	set	0
 924                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 926                     ; 350   if (Ack == I2C_ACK_NONE)
 928  01c4 4d            	tnz	a
 929  01c5 2606          	jrne	L333
 930                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 932  01c7 72155211      	bres	21009,#2
 934  01cb 2014          	jra	L533
 935  01cd               L333:
 936                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 938  01cd 72145211      	bset	21009,#2
 939                     ; 360     if (Ack == I2C_ACK_CURR)
 941  01d1 7b01          	ld	a,(OFST+1,sp)
 942  01d3 a101          	cp	a,#1
 943  01d5 2606          	jrne	L733
 944                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 946  01d7 72175211      	bres	21009,#3
 948  01db 2004          	jra	L533
 949  01dd               L733:
 950                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 952  01dd 72165211      	bset	21009,#3
 953  01e1               L533:
 954                     ; 371 }
 957  01e1 84            	pop	a
 958  01e2 87            	retf
1029                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1029                     ; 382 {
1030                     	switch	.text
1031  01e3               f_I2C_ITConfig:
1033  01e3 89            	pushw	x
1034       00000000      OFST:	set	0
1037                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1039                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1041                     ; 387   if (NewState != DISABLE)
1043  01e4 9f            	ld	a,xl
1044  01e5 4d            	tnz	a
1045  01e6 2709          	jreq	L773
1046                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1048  01e8 9e            	ld	a,xh
1049  01e9 ca521a        	or	a,21018
1050  01ec c7521a        	ld	21018,a
1052  01ef 2009          	jra	L104
1053  01f1               L773:
1054                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1056  01f1 7b01          	ld	a,(OFST+1,sp)
1057  01f3 43            	cpl	a
1058  01f4 c4521a        	and	a,21018
1059  01f7 c7521a        	ld	21018,a
1060  01fa               L104:
1061                     ; 397 }
1064  01fa 85            	popw	x
1065  01fb 87            	retf
1100                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1100                     ; 406 {
1101                     	switch	.text
1102  01fc               f_I2C_FastModeDutyCycleConfig:
1106                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1108                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1110  01fc a140          	cp	a,#64
1111  01fe 2606          	jrne	L124
1112                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1114  0200 721c521c      	bset	21020,#6
1116  0204 2004          	jra	L324
1117  0206               L124:
1118                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1120  0206 721d521c      	bres	21020,#6
1121  020a               L324:
1122                     ; 420 }
1125  020a 87            	retf
1147                     ; 427 uint8_t I2C_ReceiveData(void)
1147                     ; 428 {
1148                     	switch	.text
1149  020b               f_I2C_ReceiveData:
1153                     ; 430   return ((uint8_t)I2C->DR);
1155  020b c65216        	ld	a,21014
1158  020e 87            	retf
1220                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1220                     ; 441 {
1221                     	switch	.text
1222  020f               f_I2C_Send7bitAddress:
1224  020f 89            	pushw	x
1225       00000000      OFST:	set	0
1228                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1230                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1232                     ; 447   Address &= (uint8_t)0xFE;
1234  0210 7b01          	ld	a,(OFST+1,sp)
1235  0212 a4fe          	and	a,#254
1236  0214 6b01          	ld	(OFST+1,sp),a
1237                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1239  0216 7b01          	ld	a,(OFST+1,sp)
1240  0218 1a02          	or	a,(OFST+2,sp)
1241  021a c75216        	ld	21014,a
1242                     ; 451 }
1245  021d 85            	popw	x
1246  021e 87            	retf
1277                     ; 458 void I2C_SendData(uint8_t Data)
1277                     ; 459 {
1278                     	switch	.text
1279  021f               f_I2C_SendData:
1283                     ; 461   I2C->DR = Data;
1285  021f c75216        	ld	21014,a
1286                     ; 462 }
1289  0222 87            	retf
1508                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1508                     ; 579 {
1509                     	switch	.text
1510  0223               f_I2C_CheckEvent:
1512  0223 89            	pushw	x
1513  0224 5206          	subw	sp,#6
1514       00000006      OFST:	set	6
1517                     ; 580   __IO uint16_t lastevent = 0x00;
1519  0226 5f            	clrw	x
1520  0227 1f04          	ldw	(OFST-2,sp),x
1522                     ; 581   uint8_t flag1 = 0x00 ;
1524                     ; 582   uint8_t flag2 = 0x00;
1526                     ; 583   ErrorStatus status = ERROR;
1528                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1530                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1532  0229 1e07          	ldw	x,(OFST+1,sp)
1533  022b a30004        	cpw	x,#4
1534  022e 260b          	jrne	L506
1535                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1537  0230 c65218        	ld	a,21016
1538  0233 a404          	and	a,#4
1539  0235 5f            	clrw	x
1540  0236 97            	ld	xl,a
1541  0237 1f04          	ldw	(OFST-2,sp),x
1544  0239 201f          	jra	L706
1545  023b               L506:
1546                     ; 594     flag1 = I2C->SR1;
1548  023b c65217        	ld	a,21015
1549  023e 6b03          	ld	(OFST-3,sp),a
1551                     ; 595     flag2 = I2C->SR3;
1553  0240 c65219        	ld	a,21017
1554  0243 6b06          	ld	(OFST+0,sp),a
1556                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1558  0245 7b03          	ld	a,(OFST-3,sp)
1559  0247 5f            	clrw	x
1560  0248 97            	ld	xl,a
1561  0249 1f01          	ldw	(OFST-5,sp),x
1563  024b 7b06          	ld	a,(OFST+0,sp)
1564  024d 5f            	clrw	x
1565  024e 97            	ld	xl,a
1566  024f 4f            	clr	a
1567  0250 02            	rlwa	x,a
1568  0251 01            	rrwa	x,a
1569  0252 1a02          	or	a,(OFST-4,sp)
1570  0254 01            	rrwa	x,a
1571  0255 1a01          	or	a,(OFST-5,sp)
1572  0257 01            	rrwa	x,a
1573  0258 1f04          	ldw	(OFST-2,sp),x
1575  025a               L706:
1576                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1578  025a 1e04          	ldw	x,(OFST-2,sp)
1579  025c 01            	rrwa	x,a
1580  025d 1408          	and	a,(OFST+2,sp)
1581  025f 01            	rrwa	x,a
1582  0260 1407          	and	a,(OFST+1,sp)
1583  0262 01            	rrwa	x,a
1584  0263 1307          	cpw	x,(OFST+1,sp)
1585  0265 2606          	jrne	L116
1586                     ; 602     status = SUCCESS;
1588  0267 a601          	ld	a,#1
1589  0269 6b06          	ld	(OFST+0,sp),a
1592  026b 2002          	jra	L316
1593  026d               L116:
1594                     ; 607     status = ERROR;
1596  026d 0f06          	clr	(OFST+0,sp)
1598  026f               L316:
1599                     ; 611   return status;
1601  026f 7b06          	ld	a,(OFST+0,sp)
1604  0271 5b08          	addw	sp,#8
1605  0273 87            	retf
1653                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1653                     ; 629 {
1654                     	switch	.text
1655  0274               f_I2C_GetLastEvent:
1657  0274 5206          	subw	sp,#6
1658       00000006      OFST:	set	6
1661                     ; 630   __IO uint16_t lastevent = 0;
1663  0276 5f            	clrw	x
1664  0277 1f05          	ldw	(OFST-1,sp),x
1666                     ; 631   uint16_t flag1 = 0;
1668                     ; 632   uint16_t flag2 = 0;
1670                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1672  0279 c65218        	ld	a,21016
1673  027c a504          	bcp	a,#4
1674  027e 2707          	jreq	L736
1675                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1677  0280 ae0004        	ldw	x,#4
1678  0283 1f05          	ldw	(OFST-1,sp),x
1681  0285 201b          	jra	L146
1682  0287               L736:
1683                     ; 641     flag1 = I2C->SR1;
1685  0287 c65217        	ld	a,21015
1686  028a 5f            	clrw	x
1687  028b 97            	ld	xl,a
1688  028c 1f01          	ldw	(OFST-5,sp),x
1690                     ; 642     flag2 = I2C->SR3;
1692  028e c65219        	ld	a,21017
1693  0291 5f            	clrw	x
1694  0292 97            	ld	xl,a
1695  0293 1f03          	ldw	(OFST-3,sp),x
1697                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1699  0295 1e03          	ldw	x,(OFST-3,sp)
1700  0297 4f            	clr	a
1701  0298 02            	rlwa	x,a
1702  0299 01            	rrwa	x,a
1703  029a 1a02          	or	a,(OFST-4,sp)
1704  029c 01            	rrwa	x,a
1705  029d 1a01          	or	a,(OFST-5,sp)
1706  029f 01            	rrwa	x,a
1707  02a0 1f05          	ldw	(OFST-1,sp),x
1709  02a2               L146:
1710                     ; 648   return (I2C_Event_TypeDef)lastevent;
1712  02a2 1e05          	ldw	x,(OFST-1,sp)
1715  02a4 5b06          	addw	sp,#6
1716  02a6 87            	retf
1926                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1926                     ; 680 {
1927                     	switch	.text
1928  02a7               f_I2C_GetFlagStatus:
1930  02a7 89            	pushw	x
1931  02a8 89            	pushw	x
1932       00000002      OFST:	set	2
1935                     ; 681   uint8_t tempreg = 0;
1937  02a9 0f02          	clr	(OFST+0,sp)
1939                     ; 682   uint8_t regindex = 0;
1941                     ; 683   FlagStatus bitstatus = RESET;
1943                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1945                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1947  02ab 9e            	ld	a,xh
1948  02ac 6b01          	ld	(OFST-1,sp),a
1950                     ; 691   switch (regindex)
1952  02ae 7b01          	ld	a,(OFST-1,sp)
1954                     ; 708     default:
1954                     ; 709       break;
1955  02b0 4a            	dec	a
1956  02b1 2708          	jreq	L346
1957  02b3 4a            	dec	a
1958  02b4 270c          	jreq	L546
1959  02b6 4a            	dec	a
1960  02b7 2710          	jreq	L746
1961  02b9 2013          	jra	L757
1962  02bb               L346:
1963                     ; 694     case 0x01:
1963                     ; 695       tempreg = (uint8_t)I2C->SR1;
1965  02bb c65217        	ld	a,21015
1966  02be 6b02          	ld	(OFST+0,sp),a
1968                     ; 696       break;
1970  02c0 200c          	jra	L757
1971  02c2               L546:
1972                     ; 699     case 0x02:
1972                     ; 700       tempreg = (uint8_t)I2C->SR2;
1974  02c2 c65218        	ld	a,21016
1975  02c5 6b02          	ld	(OFST+0,sp),a
1977                     ; 701       break;
1979  02c7 2005          	jra	L757
1980  02c9               L746:
1981                     ; 704     case 0x03:
1981                     ; 705       tempreg = (uint8_t)I2C->SR3;
1983  02c9 c65219        	ld	a,21017
1984  02cc 6b02          	ld	(OFST+0,sp),a
1986                     ; 706       break;
1988  02ce               L156:
1989                     ; 708     default:
1989                     ; 709       break;
1991  02ce               L757:
1992                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
1994  02ce 7b04          	ld	a,(OFST+2,sp)
1995  02d0 1502          	bcp	a,(OFST+0,sp)
1996  02d2 2706          	jreq	L167
1997                     ; 716     bitstatus = SET;
1999  02d4 a601          	ld	a,#1
2000  02d6 6b02          	ld	(OFST+0,sp),a
2003  02d8 2002          	jra	L367
2004  02da               L167:
2005                     ; 721     bitstatus = RESET;
2007  02da 0f02          	clr	(OFST+0,sp)
2009  02dc               L367:
2010                     ; 724   return bitstatus;
2012  02dc 7b02          	ld	a,(OFST+0,sp)
2015  02de 5b04          	addw	sp,#4
2016  02e0 87            	retf
2057                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2057                     ; 760 {
2058                     	switch	.text
2059  02e1               f_I2C_ClearFlag:
2061  02e1 89            	pushw	x
2062       00000002      OFST:	set	2
2065                     ; 761   uint16_t flagpos = 0;
2067                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2069                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2071  02e2 01            	rrwa	x,a
2072  02e3 a4ff          	and	a,#255
2073  02e5 5f            	clrw	x
2074  02e6 02            	rlwa	x,a
2075  02e7 1f01          	ldw	(OFST-1,sp),x
2076  02e9 01            	rrwa	x,a
2078                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2080  02ea 7b02          	ld	a,(OFST+0,sp)
2081  02ec 43            	cpl	a
2082  02ed c75218        	ld	21016,a
2083                     ; 769 }
2086  02f0 85            	popw	x
2087  02f1 87            	retf
2250                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2250                     ; 792 {
2251                     	switch	.text
2252  02f2               f_I2C_GetITStatus:
2254  02f2 89            	pushw	x
2255  02f3 5204          	subw	sp,#4
2256       00000004      OFST:	set	4
2259                     ; 793   ITStatus bitstatus = RESET;
2261                     ; 794   __IO uint8_t enablestatus = 0;
2263  02f5 0f03          	clr	(OFST-1,sp)
2265                     ; 795   uint16_t tempregister = 0;
2267                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2269                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2271  02f7 9e            	ld	a,xh
2272  02f8 a407          	and	a,#7
2273  02fa 5f            	clrw	x
2274  02fb 97            	ld	xl,a
2275  02fc 1f01          	ldw	(OFST-3,sp),x
2277                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2279  02fe c6521a        	ld	a,21018
2280  0301 1402          	and	a,(OFST-2,sp)
2281  0303 6b03          	ld	(OFST-1,sp),a
2283                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2285  0305 7b05          	ld	a,(OFST+1,sp)
2286  0307 97            	ld	xl,a
2287  0308 7b06          	ld	a,(OFST+2,sp)
2288  030a 9f            	ld	a,xl
2289  030b a430          	and	a,#48
2290  030d 97            	ld	xl,a
2291  030e 4f            	clr	a
2292  030f 02            	rlwa	x,a
2293  0310 a30100        	cpw	x,#256
2294  0313 2615          	jrne	L1701
2295                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2297  0315 c65217        	ld	a,21015
2298  0318 1506          	bcp	a,(OFST+2,sp)
2299  031a 270a          	jreq	L3701
2301  031c 0d03          	tnz	(OFST-1,sp)
2302  031e 2706          	jreq	L3701
2303                     ; 811       bitstatus = SET;
2305  0320 a601          	ld	a,#1
2306  0322 6b04          	ld	(OFST+0,sp),a
2309  0324 2017          	jra	L7701
2310  0326               L3701:
2311                     ; 816       bitstatus = RESET;
2313  0326 0f04          	clr	(OFST+0,sp)
2315  0328 2013          	jra	L7701
2316  032a               L1701:
2317                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2319  032a c65218        	ld	a,21016
2320  032d 1506          	bcp	a,(OFST+2,sp)
2321  032f 270a          	jreq	L1011
2323  0331 0d03          	tnz	(OFST-1,sp)
2324  0333 2706          	jreq	L1011
2325                     ; 825       bitstatus = SET;
2327  0335 a601          	ld	a,#1
2328  0337 6b04          	ld	(OFST+0,sp),a
2331  0339 2002          	jra	L7701
2332  033b               L1011:
2333                     ; 830       bitstatus = RESET;
2335  033b 0f04          	clr	(OFST+0,sp)
2337  033d               L7701:
2338                     ; 834   return  bitstatus;
2340  033d 7b04          	ld	a,(OFST+0,sp)
2343  033f 5b06          	addw	sp,#6
2344  0341 87            	retf
2386                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2386                     ; 872 {
2387                     	switch	.text
2388  0342               f_I2C_ClearITPendingBit:
2390  0342 89            	pushw	x
2391       00000002      OFST:	set	2
2394                     ; 873   uint16_t flagpos = 0;
2396                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2398                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2400  0343 01            	rrwa	x,a
2401  0344 a4ff          	and	a,#255
2402  0346 5f            	clrw	x
2403  0347 02            	rlwa	x,a
2404  0348 1f01          	ldw	(OFST-1,sp),x
2405  034a 01            	rrwa	x,a
2407                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2409  034b 7b02          	ld	a,(OFST+0,sp)
2410  034d 43            	cpl	a
2411  034e c75218        	ld	21016,a
2412                     ; 883 }
2415  0351 85            	popw	x
2416  0352 87            	retf
2428                     	xdef	f_I2C_ClearITPendingBit
2429                     	xdef	f_I2C_GetITStatus
2430                     	xdef	f_I2C_ClearFlag
2431                     	xdef	f_I2C_GetFlagStatus
2432                     	xdef	f_I2C_GetLastEvent
2433                     	xdef	f_I2C_CheckEvent
2434                     	xdef	f_I2C_SendData
2435                     	xdef	f_I2C_Send7bitAddress
2436                     	xdef	f_I2C_ReceiveData
2437                     	xdef	f_I2C_ITConfig
2438                     	xdef	f_I2C_FastModeDutyCycleConfig
2439                     	xdef	f_I2C_AcknowledgeConfig
2440                     	xdef	f_I2C_StretchClockCmd
2441                     	xdef	f_I2C_SoftwareResetCmd
2442                     	xdef	f_I2C_GenerateSTOP
2443                     	xdef	f_I2C_GenerateSTART
2444                     	xdef	f_I2C_GeneralCallCmd
2445                     	xdef	f_I2C_Cmd
2446                     	xdef	f_I2C_Init
2447                     	xdef	f_I2C_DeInit
2448                     	xref.b	c_lreg
2449                     	xref.b	c_x
2468                     	xref	d_sdivx
2469                     	xref	d_ludv
2470                     	xref	d_rtol
2471                     	xref	d_smul
2472                     	xref	d_lmul
2473                     	xref	d_lcmp
2474                     	xref	d_ltor
2475                     	end
