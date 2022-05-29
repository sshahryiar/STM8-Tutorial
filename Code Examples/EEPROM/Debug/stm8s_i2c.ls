   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 67 void I2C_DeInit(void)
  42                     ; 68 {
  44                     	switch	.text
  45  0000               _I2C_DeInit:
  49                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  51  0000 725f5210      	clr	21008
  52                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  54  0004 725f5211      	clr	21009
  55                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  57  0008 725f5212      	clr	21010
  58                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  60  000c 725f5213      	clr	21011
  61                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  63  0010 725f5214      	clr	21012
  64                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  66  0014 725f521a      	clr	21018
  67                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  69  0018 725f521b      	clr	21019
  70                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  72  001c 725f521c      	clr	21020
  73                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  75  0020 3502521d      	mov	21021,#2
  76                     ; 78 }
  79  0024 81            	ret
 258                     .const:	section	.text
 259  0000               L01:
 260  0000 000186a1      	dc.l	100001
 261  0004               L21:
 262  0004 000f4240      	dc.l	1000000
 263                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 263                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 263                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 263                     ; 99 {
 264                     	switch	.text
 265  0025               _I2C_Init:
 267  0025 5209          	subw	sp,#9
 268       00000009      OFST:	set	9
 271                     ; 100   uint16_t result = 0x0004;
 273                     ; 101   uint16_t tmpval = 0;
 275                     ; 102   uint8_t tmpccrh = 0;
 277  0027 0f07          	clr	(OFST-2,sp)
 279                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 281                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 283                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 285                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 287                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 289                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 291                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 293  0029 c65212        	ld	a,21010
 294  002c a4c0          	and	a,#192
 295  002e c75212        	ld	21010,a
 296                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 298  0031 c65212        	ld	a,21010
 299  0034 1a15          	or	a,(OFST+12,sp)
 300  0036 c75212        	ld	21010,a
 301                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 303  0039 72115210      	bres	21008,#0
 304                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 306  003d c6521c        	ld	a,21020
 307  0040 a430          	and	a,#48
 308  0042 c7521c        	ld	21020,a
 309                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 311  0045 725f521b      	clr	21019
 312                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 314  0049 96            	ldw	x,sp
 315  004a 1c000c        	addw	x,#OFST+3
 316  004d cd0000        	call	c_ltor
 318  0050 ae0000        	ldw	x,#L01
 319  0053 cd0000        	call	c_lcmp
 321  0056 2403          	jruge	L41
 322  0058 cc00e5        	jp	L131
 323  005b               L41:
 324                     ; 131     tmpccrh = I2C_CCRH_FS;
 326  005b a680          	ld	a,#128
 327  005d 6b07          	ld	(OFST-2,sp),a
 329                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 331  005f 0d12          	tnz	(OFST+9,sp)
 332  0061 2630          	jrne	L331
 333                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 335  0063 96            	ldw	x,sp
 336  0064 1c000c        	addw	x,#OFST+3
 337  0067 cd0000        	call	c_ltor
 339  006a a603          	ld	a,#3
 340  006c cd0000        	call	c_smul
 342  006f 96            	ldw	x,sp
 343  0070 1c0001        	addw	x,#OFST-8
 344  0073 cd0000        	call	c_rtol
 347  0076 7b15          	ld	a,(OFST+12,sp)
 348  0078 b703          	ld	c_lreg+3,a
 349  007a 3f02          	clr	c_lreg+2
 350  007c 3f01          	clr	c_lreg+1
 351  007e 3f00          	clr	c_lreg
 352  0080 ae0004        	ldw	x,#L21
 353  0083 cd0000        	call	c_lmul
 355  0086 96            	ldw	x,sp
 356  0087 1c0001        	addw	x,#OFST-8
 357  008a cd0000        	call	c_ludv
 359  008d be02          	ldw	x,c_lreg+2
 360  008f 1f08          	ldw	(OFST-1,sp),x
 363  0091 2034          	jra	L531
 364  0093               L331:
 365                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 367  0093 96            	ldw	x,sp
 368  0094 1c000c        	addw	x,#OFST+3
 369  0097 cd0000        	call	c_ltor
 371  009a a619          	ld	a,#25
 372  009c cd0000        	call	c_smul
 374  009f 96            	ldw	x,sp
 375  00a0 1c0001        	addw	x,#OFST-8
 376  00a3 cd0000        	call	c_rtol
 379  00a6 7b15          	ld	a,(OFST+12,sp)
 380  00a8 b703          	ld	c_lreg+3,a
 381  00aa 3f02          	clr	c_lreg+2
 382  00ac 3f01          	clr	c_lreg+1
 383  00ae 3f00          	clr	c_lreg
 384  00b0 ae0004        	ldw	x,#L21
 385  00b3 cd0000        	call	c_lmul
 387  00b6 96            	ldw	x,sp
 388  00b7 1c0001        	addw	x,#OFST-8
 389  00ba cd0000        	call	c_ludv
 391  00bd be02          	ldw	x,c_lreg+2
 392  00bf 1f08          	ldw	(OFST-1,sp),x
 394                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 396  00c1 7b07          	ld	a,(OFST-2,sp)
 397  00c3 aa40          	or	a,#64
 398  00c5 6b07          	ld	(OFST-2,sp),a
 400  00c7               L531:
 401                     ; 147     if (result < (uint16_t)0x01)
 403  00c7 1e08          	ldw	x,(OFST-1,sp)
 404  00c9 2605          	jrne	L731
 405                     ; 150       result = (uint16_t)0x0001;
 407  00cb ae0001        	ldw	x,#1
 408  00ce 1f08          	ldw	(OFST-1,sp),x
 410  00d0               L731:
 411                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 413  00d0 7b15          	ld	a,(OFST+12,sp)
 414  00d2 97            	ld	xl,a
 415  00d3 a603          	ld	a,#3
 416  00d5 42            	mul	x,a
 417  00d6 a60a          	ld	a,#10
 418  00d8 cd0000        	call	c_sdivx
 420  00db 5c            	incw	x
 421  00dc 1f05          	ldw	(OFST-4,sp),x
 423                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 425  00de 7b06          	ld	a,(OFST-3,sp)
 426  00e0 c7521d        	ld	21021,a
 428  00e3 2043          	jra	L141
 429  00e5               L131:
 430                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 432  00e5 96            	ldw	x,sp
 433  00e6 1c000c        	addw	x,#OFST+3
 434  00e9 cd0000        	call	c_ltor
 436  00ec 3803          	sll	c_lreg+3
 437  00ee 3902          	rlc	c_lreg+2
 438  00f0 3901          	rlc	c_lreg+1
 439  00f2 3900          	rlc	c_lreg
 440  00f4 96            	ldw	x,sp
 441  00f5 1c0001        	addw	x,#OFST-8
 442  00f8 cd0000        	call	c_rtol
 445  00fb 7b15          	ld	a,(OFST+12,sp)
 446  00fd b703          	ld	c_lreg+3,a
 447  00ff 3f02          	clr	c_lreg+2
 448  0101 3f01          	clr	c_lreg+1
 449  0103 3f00          	clr	c_lreg
 450  0105 ae0004        	ldw	x,#L21
 451  0108 cd0000        	call	c_lmul
 453  010b 96            	ldw	x,sp
 454  010c 1c0001        	addw	x,#OFST-8
 455  010f cd0000        	call	c_ludv
 457  0112 be02          	ldw	x,c_lreg+2
 458  0114 1f08          	ldw	(OFST-1,sp),x
 460                     ; 167     if (result < (uint16_t)0x0004)
 462  0116 1e08          	ldw	x,(OFST-1,sp)
 463  0118 a30004        	cpw	x,#4
 464  011b 2405          	jruge	L341
 465                     ; 170       result = (uint16_t)0x0004;
 467  011d ae0004        	ldw	x,#4
 468  0120 1f08          	ldw	(OFST-1,sp),x
 470  0122               L341:
 471                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 473  0122 7b15          	ld	a,(OFST+12,sp)
 474  0124 4c            	inc	a
 475  0125 c7521d        	ld	21021,a
 476  0128               L141:
 477                     ; 181   I2C->CCRL = (uint8_t)result;
 479  0128 7b09          	ld	a,(OFST+0,sp)
 480  012a c7521b        	ld	21019,a
 481                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 483  012d 7b08          	ld	a,(OFST-1,sp)
 484  012f a40f          	and	a,#15
 485  0131 1a07          	or	a,(OFST-2,sp)
 486  0133 c7521c        	ld	21020,a
 487                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 489  0136 72105210      	bset	21008,#0
 490                     ; 188   I2C_AcknowledgeConfig(Ack);
 492  013a 7b13          	ld	a,(OFST+10,sp)
 493  013c ad71          	call	_I2C_AcknowledgeConfig
 495                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 497  013e 7b11          	ld	a,(OFST+8,sp)
 498  0140 c75213        	ld	21011,a
 499                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 499                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 501  0143 1e10          	ldw	x,(OFST+7,sp)
 502  0145 4f            	clr	a
 503  0146 01            	rrwa	x,a
 504  0147 48            	sll	a
 505  0148 59            	rlcw	x
 506  0149 01            	rrwa	x,a
 507  014a a406          	and	a,#6
 508  014c 5f            	clrw	x
 509  014d 6b04          	ld	(OFST-5,sp),a
 511  014f 7b14          	ld	a,(OFST+11,sp)
 512  0151 aa40          	or	a,#64
 513  0153 1a04          	or	a,(OFST-5,sp)
 514  0155 c75214        	ld	21012,a
 515                     ; 194 }
 518  0158 5b09          	addw	sp,#9
 519  015a 81            	ret
 574                     ; 202 void I2C_Cmd(FunctionalState NewState)
 574                     ; 203 {
 575                     	switch	.text
 576  015b               _I2C_Cmd:
 580                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 582                     ; 207   if (NewState != DISABLE)
 584  015b 4d            	tnz	a
 585  015c 2706          	jreq	L371
 586                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 588  015e 72105210      	bset	21008,#0
 590  0162 2004          	jra	L571
 591  0164               L371:
 592                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 594  0164 72115210      	bres	21008,#0
 595  0168               L571:
 596                     ; 217 }
 599  0168 81            	ret
 634                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 634                     ; 226 {
 635                     	switch	.text
 636  0169               _I2C_GeneralCallCmd:
 640                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 642                     ; 230   if (NewState != DISABLE)
 644  0169 4d            	tnz	a
 645  016a 2706          	jreq	L512
 646                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 648  016c 721c5210      	bset	21008,#6
 650  0170 2004          	jra	L712
 651  0172               L512:
 652                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 654  0172 721d5210      	bres	21008,#6
 655  0176               L712:
 656                     ; 240 }
 659  0176 81            	ret
 694                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 694                     ; 251 {
 695                     	switch	.text
 696  0177               _I2C_GenerateSTART:
 700                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 702                     ; 255   if (NewState != DISABLE)
 704  0177 4d            	tnz	a
 705  0178 2706          	jreq	L732
 706                     ; 258     I2C->CR2 |= I2C_CR2_START;
 708  017a 72105211      	bset	21009,#0
 710  017e 2004          	jra	L142
 711  0180               L732:
 712                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 714  0180 72115211      	bres	21009,#0
 715  0184               L142:
 716                     ; 265 }
 719  0184 81            	ret
 754                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 754                     ; 274 {
 755                     	switch	.text
 756  0185               _I2C_GenerateSTOP:
 760                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 762                     ; 278   if (NewState != DISABLE)
 764  0185 4d            	tnz	a
 765  0186 2706          	jreq	L162
 766                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 768  0188 72125211      	bset	21009,#1
 770  018c 2004          	jra	L362
 771  018e               L162:
 772                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 774  018e 72135211      	bres	21009,#1
 775  0192               L362:
 776                     ; 288 }
 779  0192 81            	ret
 815                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 815                     ; 297 {
 816                     	switch	.text
 817  0193               _I2C_SoftwareResetCmd:
 821                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 823                     ; 301   if (NewState != DISABLE)
 825  0193 4d            	tnz	a
 826  0194 2706          	jreq	L303
 827                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 829  0196 721e5211      	bset	21009,#7
 831  019a 2004          	jra	L503
 832  019c               L303:
 833                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 835  019c 721f5211      	bres	21009,#7
 836  01a0               L503:
 837                     ; 311 }
 840  01a0 81            	ret
 876                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 876                     ; 321 {
 877                     	switch	.text
 878  01a1               _I2C_StretchClockCmd:
 882                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 884                     ; 325   if (NewState != DISABLE)
 886  01a1 4d            	tnz	a
 887  01a2 2706          	jreq	L523
 888                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 890  01a4 721f5210      	bres	21008,#7
 892  01a8 2004          	jra	L723
 893  01aa               L523:
 894                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 896  01aa 721e5210      	bset	21008,#7
 897  01ae               L723:
 898                     ; 336 }
 901  01ae 81            	ret
 937                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 937                     ; 346 {
 938                     	switch	.text
 939  01af               _I2C_AcknowledgeConfig:
 941  01af 88            	push	a
 942       00000000      OFST:	set	0
 945                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 947                     ; 350   if (Ack == I2C_ACK_NONE)
 949  01b0 4d            	tnz	a
 950  01b1 2606          	jrne	L743
 951                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 953  01b3 72155211      	bres	21009,#2
 955  01b7 2014          	jra	L153
 956  01b9               L743:
 957                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 959  01b9 72145211      	bset	21009,#2
 960                     ; 360     if (Ack == I2C_ACK_CURR)
 962  01bd 7b01          	ld	a,(OFST+1,sp)
 963  01bf a101          	cp	a,#1
 964  01c1 2606          	jrne	L353
 965                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 967  01c3 72175211      	bres	21009,#3
 969  01c7 2004          	jra	L153
 970  01c9               L353:
 971                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 973  01c9 72165211      	bset	21009,#3
 974  01cd               L153:
 975                     ; 371 }
 978  01cd 84            	pop	a
 979  01ce 81            	ret
1051                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1051                     ; 382 {
1052                     	switch	.text
1053  01cf               _I2C_ITConfig:
1055  01cf 89            	pushw	x
1056       00000000      OFST:	set	0
1059                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1061                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1063                     ; 387   if (NewState != DISABLE)
1065  01d0 9f            	ld	a,xl
1066  01d1 4d            	tnz	a
1067  01d2 2709          	jreq	L314
1068                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1070  01d4 9e            	ld	a,xh
1071  01d5 ca521a        	or	a,21018
1072  01d8 c7521a        	ld	21018,a
1074  01db 2009          	jra	L514
1075  01dd               L314:
1076                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1078  01dd 7b01          	ld	a,(OFST+1,sp)
1079  01df 43            	cpl	a
1080  01e0 c4521a        	and	a,21018
1081  01e3 c7521a        	ld	21018,a
1082  01e6               L514:
1083                     ; 397 }
1086  01e6 85            	popw	x
1087  01e7 81            	ret
1123                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1123                     ; 406 {
1124                     	switch	.text
1125  01e8               _I2C_FastModeDutyCycleConfig:
1129                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1131                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1133  01e8 a140          	cp	a,#64
1134  01ea 2606          	jrne	L534
1135                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1137  01ec 721c521c      	bset	21020,#6
1139  01f0 2004          	jra	L734
1140  01f2               L534:
1141                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1143  01f2 721d521c      	bres	21020,#6
1144  01f6               L734:
1145                     ; 420 }
1148  01f6 81            	ret
1171                     ; 427 uint8_t I2C_ReceiveData(void)
1171                     ; 428 {
1172                     	switch	.text
1173  01f7               _I2C_ReceiveData:
1177                     ; 430   return ((uint8_t)I2C->DR);
1179  01f7 c65216        	ld	a,21014
1182  01fa 81            	ret
1247                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1247                     ; 441 {
1248                     	switch	.text
1249  01fb               _I2C_Send7bitAddress:
1251  01fb 89            	pushw	x
1252       00000000      OFST:	set	0
1255                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1257                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1259                     ; 447   Address &= (uint8_t)0xFE;
1261  01fc 7b01          	ld	a,(OFST+1,sp)
1262  01fe a4fe          	and	a,#254
1263  0200 6b01          	ld	(OFST+1,sp),a
1264                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1266  0202 7b01          	ld	a,(OFST+1,sp)
1267  0204 1a02          	or	a,(OFST+2,sp)
1268  0206 c75216        	ld	21014,a
1269                     ; 451 }
1272  0209 85            	popw	x
1273  020a 81            	ret
1307                     ; 458 void I2C_SendData(uint8_t Data)
1307                     ; 459 {
1308                     	switch	.text
1309  020b               _I2C_SendData:
1313                     ; 461   I2C->DR = Data;
1315  020b c75216        	ld	21014,a
1316                     ; 462 }
1319  020e 81            	ret
1543                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1543                     ; 579 {
1544                     	switch	.text
1545  020f               _I2C_CheckEvent:
1547  020f 89            	pushw	x
1548  0210 5206          	subw	sp,#6
1549       00000006      OFST:	set	6
1552                     ; 580   __IO uint16_t lastevent = 0x00;
1554  0212 5f            	clrw	x
1555  0213 1f04          	ldw	(OFST-2,sp),x
1557                     ; 581   uint8_t flag1 = 0x00 ;
1559                     ; 582   uint8_t flag2 = 0x00;
1561                     ; 583   ErrorStatus status = ERROR;
1563                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1565                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1567  0215 1e07          	ldw	x,(OFST+1,sp)
1568  0217 a30004        	cpw	x,#4
1569  021a 260b          	jrne	L136
1570                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1572  021c c65218        	ld	a,21016
1573  021f a404          	and	a,#4
1574  0221 5f            	clrw	x
1575  0222 97            	ld	xl,a
1576  0223 1f04          	ldw	(OFST-2,sp),x
1579  0225 201f          	jra	L336
1580  0227               L136:
1581                     ; 594     flag1 = I2C->SR1;
1583  0227 c65217        	ld	a,21015
1584  022a 6b03          	ld	(OFST-3,sp),a
1586                     ; 595     flag2 = I2C->SR3;
1588  022c c65219        	ld	a,21017
1589  022f 6b06          	ld	(OFST+0,sp),a
1591                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1593  0231 7b03          	ld	a,(OFST-3,sp)
1594  0233 5f            	clrw	x
1595  0234 97            	ld	xl,a
1596  0235 1f01          	ldw	(OFST-5,sp),x
1598  0237 7b06          	ld	a,(OFST+0,sp)
1599  0239 5f            	clrw	x
1600  023a 97            	ld	xl,a
1601  023b 4f            	clr	a
1602  023c 02            	rlwa	x,a
1603  023d 01            	rrwa	x,a
1604  023e 1a02          	or	a,(OFST-4,sp)
1605  0240 01            	rrwa	x,a
1606  0241 1a01          	or	a,(OFST-5,sp)
1607  0243 01            	rrwa	x,a
1608  0244 1f04          	ldw	(OFST-2,sp),x
1610  0246               L336:
1611                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1613  0246 1e04          	ldw	x,(OFST-2,sp)
1614  0248 01            	rrwa	x,a
1615  0249 1408          	and	a,(OFST+2,sp)
1616  024b 01            	rrwa	x,a
1617  024c 1407          	and	a,(OFST+1,sp)
1618  024e 01            	rrwa	x,a
1619  024f 1307          	cpw	x,(OFST+1,sp)
1620  0251 2606          	jrne	L536
1621                     ; 602     status = SUCCESS;
1623  0253 a601          	ld	a,#1
1624  0255 6b06          	ld	(OFST+0,sp),a
1627  0257 2002          	jra	L736
1628  0259               L536:
1629                     ; 607     status = ERROR;
1631  0259 0f06          	clr	(OFST+0,sp)
1633  025b               L736:
1634                     ; 611   return status;
1636  025b 7b06          	ld	a,(OFST+0,sp)
1639  025d 5b08          	addw	sp,#8
1640  025f 81            	ret
1693                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1693                     ; 629 {
1694                     	switch	.text
1695  0260               _I2C_GetLastEvent:
1697  0260 5206          	subw	sp,#6
1698       00000006      OFST:	set	6
1701                     ; 630   __IO uint16_t lastevent = 0;
1703  0262 5f            	clrw	x
1704  0263 1f05          	ldw	(OFST-1,sp),x
1706                     ; 631   uint16_t flag1 = 0;
1708                     ; 632   uint16_t flag2 = 0;
1710                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1712  0265 c65218        	ld	a,21016
1713  0268 a504          	bcp	a,#4
1714  026a 2707          	jreq	L766
1715                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1717  026c ae0004        	ldw	x,#4
1718  026f 1f05          	ldw	(OFST-1,sp),x
1721  0271 201b          	jra	L176
1722  0273               L766:
1723                     ; 641     flag1 = I2C->SR1;
1725  0273 c65217        	ld	a,21015
1726  0276 5f            	clrw	x
1727  0277 97            	ld	xl,a
1728  0278 1f01          	ldw	(OFST-5,sp),x
1730                     ; 642     flag2 = I2C->SR3;
1732  027a c65219        	ld	a,21017
1733  027d 5f            	clrw	x
1734  027e 97            	ld	xl,a
1735  027f 1f03          	ldw	(OFST-3,sp),x
1737                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1739  0281 1e03          	ldw	x,(OFST-3,sp)
1740  0283 4f            	clr	a
1741  0284 02            	rlwa	x,a
1742  0285 01            	rrwa	x,a
1743  0286 1a02          	or	a,(OFST-4,sp)
1744  0288 01            	rrwa	x,a
1745  0289 1a01          	or	a,(OFST-5,sp)
1746  028b 01            	rrwa	x,a
1747  028c 1f05          	ldw	(OFST-1,sp),x
1749  028e               L176:
1750                     ; 648   return (I2C_Event_TypeDef)lastevent;
1752  028e 1e05          	ldw	x,(OFST-1,sp)
1755  0290 5b06          	addw	sp,#6
1756  0292 81            	ret
1971                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1971                     ; 680 {
1972                     	switch	.text
1973  0293               _I2C_GetFlagStatus:
1975  0293 89            	pushw	x
1976  0294 89            	pushw	x
1977       00000002      OFST:	set	2
1980                     ; 681   uint8_t tempreg = 0;
1982  0295 0f02          	clr	(OFST+0,sp)
1984                     ; 682   uint8_t regindex = 0;
1986                     ; 683   FlagStatus bitstatus = RESET;
1988                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1990                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1992  0297 9e            	ld	a,xh
1993  0298 6b01          	ld	(OFST-1,sp),a
1995                     ; 691   switch (regindex)
1997  029a 7b01          	ld	a,(OFST-1,sp)
1999                     ; 708     default:
1999                     ; 709       break;
2000  029c 4a            	dec	a
2001  029d 2708          	jreq	L376
2002  029f 4a            	dec	a
2003  02a0 270c          	jreq	L576
2004  02a2 4a            	dec	a
2005  02a3 2710          	jreq	L776
2006  02a5 2013          	jra	L3101
2007  02a7               L376:
2008                     ; 694     case 0x01:
2008                     ; 695       tempreg = (uint8_t)I2C->SR1;
2010  02a7 c65217        	ld	a,21015
2011  02aa 6b02          	ld	(OFST+0,sp),a
2013                     ; 696       break;
2015  02ac 200c          	jra	L3101
2016  02ae               L576:
2017                     ; 699     case 0x02:
2017                     ; 700       tempreg = (uint8_t)I2C->SR2;
2019  02ae c65218        	ld	a,21016
2020  02b1 6b02          	ld	(OFST+0,sp),a
2022                     ; 701       break;
2024  02b3 2005          	jra	L3101
2025  02b5               L776:
2026                     ; 704     case 0x03:
2026                     ; 705       tempreg = (uint8_t)I2C->SR3;
2028  02b5 c65219        	ld	a,21017
2029  02b8 6b02          	ld	(OFST+0,sp),a
2031                     ; 706       break;
2033  02ba               L107:
2034                     ; 708     default:
2034                     ; 709       break;
2036  02ba               L3101:
2037                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2039  02ba 7b04          	ld	a,(OFST+2,sp)
2040  02bc 1502          	bcp	a,(OFST+0,sp)
2041  02be 2706          	jreq	L5101
2042                     ; 716     bitstatus = SET;
2044  02c0 a601          	ld	a,#1
2045  02c2 6b02          	ld	(OFST+0,sp),a
2048  02c4 2002          	jra	L7101
2049  02c6               L5101:
2050                     ; 721     bitstatus = RESET;
2052  02c6 0f02          	clr	(OFST+0,sp)
2054  02c8               L7101:
2055                     ; 724   return bitstatus;
2057  02c8 7b02          	ld	a,(OFST+0,sp)
2060  02ca 5b04          	addw	sp,#4
2061  02cc 81            	ret
2105                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2105                     ; 760 {
2106                     	switch	.text
2107  02cd               _I2C_ClearFlag:
2109  02cd 89            	pushw	x
2110       00000002      OFST:	set	2
2113                     ; 761   uint16_t flagpos = 0;
2115                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2117                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2119  02ce 01            	rrwa	x,a
2120  02cf a4ff          	and	a,#255
2121  02d1 5f            	clrw	x
2122  02d2 02            	rlwa	x,a
2123  02d3 1f01          	ldw	(OFST-1,sp),x
2124  02d5 01            	rrwa	x,a
2126                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2128  02d6 7b02          	ld	a,(OFST+0,sp)
2129  02d8 43            	cpl	a
2130  02d9 c75218        	ld	21016,a
2131                     ; 769 }
2134  02dc 85            	popw	x
2135  02dd 81            	ret
2301                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2301                     ; 792 {
2302                     	switch	.text
2303  02de               _I2C_GetITStatus:
2305  02de 89            	pushw	x
2306  02df 5204          	subw	sp,#4
2307       00000004      OFST:	set	4
2310                     ; 793   ITStatus bitstatus = RESET;
2312                     ; 794   __IO uint8_t enablestatus = 0;
2314  02e1 0f03          	clr	(OFST-1,sp)
2316                     ; 795   uint16_t tempregister = 0;
2318                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2320                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2322  02e3 9e            	ld	a,xh
2323  02e4 a407          	and	a,#7
2324  02e6 5f            	clrw	x
2325  02e7 97            	ld	xl,a
2326  02e8 1f01          	ldw	(OFST-3,sp),x
2328                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2330  02ea c6521a        	ld	a,21018
2331  02ed 1402          	and	a,(OFST-2,sp)
2332  02ef 6b03          	ld	(OFST-1,sp),a
2334                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2336  02f1 7b05          	ld	a,(OFST+1,sp)
2337  02f3 97            	ld	xl,a
2338  02f4 7b06          	ld	a,(OFST+2,sp)
2339  02f6 9f            	ld	a,xl
2340  02f7 a430          	and	a,#48
2341  02f9 97            	ld	xl,a
2342  02fa 4f            	clr	a
2343  02fb 02            	rlwa	x,a
2344  02fc a30100        	cpw	x,#256
2345  02ff 2615          	jrne	L1311
2346                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2348  0301 c65217        	ld	a,21015
2349  0304 1506          	bcp	a,(OFST+2,sp)
2350  0306 270a          	jreq	L3311
2352  0308 0d03          	tnz	(OFST-1,sp)
2353  030a 2706          	jreq	L3311
2354                     ; 811       bitstatus = SET;
2356  030c a601          	ld	a,#1
2357  030e 6b04          	ld	(OFST+0,sp),a
2360  0310 2017          	jra	L7311
2361  0312               L3311:
2362                     ; 816       bitstatus = RESET;
2364  0312 0f04          	clr	(OFST+0,sp)
2366  0314 2013          	jra	L7311
2367  0316               L1311:
2368                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2370  0316 c65218        	ld	a,21016
2371  0319 1506          	bcp	a,(OFST+2,sp)
2372  031b 270a          	jreq	L1411
2374  031d 0d03          	tnz	(OFST-1,sp)
2375  031f 2706          	jreq	L1411
2376                     ; 825       bitstatus = SET;
2378  0321 a601          	ld	a,#1
2379  0323 6b04          	ld	(OFST+0,sp),a
2382  0325 2002          	jra	L7311
2383  0327               L1411:
2384                     ; 830       bitstatus = RESET;
2386  0327 0f04          	clr	(OFST+0,sp)
2388  0329               L7311:
2389                     ; 834   return  bitstatus;
2391  0329 7b04          	ld	a,(OFST+0,sp)
2394  032b 5b06          	addw	sp,#6
2395  032d 81            	ret
2440                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2440                     ; 872 {
2441                     	switch	.text
2442  032e               _I2C_ClearITPendingBit:
2444  032e 89            	pushw	x
2445       00000002      OFST:	set	2
2448                     ; 873   uint16_t flagpos = 0;
2450                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2452                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2454  032f 01            	rrwa	x,a
2455  0330 a4ff          	and	a,#255
2456  0332 5f            	clrw	x
2457  0333 02            	rlwa	x,a
2458  0334 1f01          	ldw	(OFST-1,sp),x
2459  0336 01            	rrwa	x,a
2461                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2463  0337 7b02          	ld	a,(OFST+0,sp)
2464  0339 43            	cpl	a
2465  033a c75218        	ld	21016,a
2466                     ; 883 }
2469  033d 85            	popw	x
2470  033e 81            	ret
2483                     	xdef	_I2C_ClearITPendingBit
2484                     	xdef	_I2C_GetITStatus
2485                     	xdef	_I2C_ClearFlag
2486                     	xdef	_I2C_GetFlagStatus
2487                     	xdef	_I2C_GetLastEvent
2488                     	xdef	_I2C_CheckEvent
2489                     	xdef	_I2C_SendData
2490                     	xdef	_I2C_Send7bitAddress
2491                     	xdef	_I2C_ReceiveData
2492                     	xdef	_I2C_ITConfig
2493                     	xdef	_I2C_FastModeDutyCycleConfig
2494                     	xdef	_I2C_AcknowledgeConfig
2495                     	xdef	_I2C_StretchClockCmd
2496                     	xdef	_I2C_SoftwareResetCmd
2497                     	xdef	_I2C_GenerateSTOP
2498                     	xdef	_I2C_GenerateSTART
2499                     	xdef	_I2C_GeneralCallCmd
2500                     	xdef	_I2C_Cmd
2501                     	xdef	_I2C_Init
2502                     	xdef	_I2C_DeInit
2503                     	xref.b	c_lreg
2504                     	xref.b	c_x
2523                     	xref	c_sdivx
2524                     	xref	c_ludv
2525                     	xref	c_rtol
2526                     	xref	c_smul
2527                     	xref	c_lmul
2528                     	xref	c_lcmp
2529                     	xref	c_ltor
2530                     	end
