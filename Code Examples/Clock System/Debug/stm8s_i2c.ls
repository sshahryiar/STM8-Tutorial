   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  43                     ; 67 void I2C_DeInit(void)
  43                     ; 68 {
  45                     	switch	.text
  46  0000               _I2C_DeInit:
  50                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  52  0000 725f5210      	clr	21008
  53                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  55  0004 725f5211      	clr	21009
  56                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  58  0008 725f5212      	clr	21010
  59                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  61  000c 725f5213      	clr	21011
  62                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  64  0010 725f5214      	clr	21012
  65                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  67  0014 725f521a      	clr	21018
  68                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  70  0018 725f521b      	clr	21019
  71                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  73  001c 725f521c      	clr	21020
  74                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  76  0020 3502521d      	mov	21021,#2
  77                     ; 78 }
  80  0024 81            	ret
 259                     .const:	section	.text
 260  0000               L01:
 261  0000 000186a1      	dc.l	100001
 262  0004               L21:
 263  0004 000f4240      	dc.l	1000000
 264                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 264                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 264                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 264                     ; 99 {
 265                     	switch	.text
 266  0025               _I2C_Init:
 268  0025 5209          	subw	sp,#9
 269       00000009      OFST:	set	9
 272                     ; 100   uint16_t result = 0x0004;
 274                     ; 101   uint16_t tmpval = 0;
 276                     ; 102   uint8_t tmpccrh = 0;
 278  0027 0f07          	clr	(OFST-2,sp)
 280                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 282                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 284                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 286                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 288                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 290                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 292                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 294  0029 c65212        	ld	a,21010
 295  002c a4c0          	and	a,#192
 296  002e c75212        	ld	21010,a
 297                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 299  0031 c65212        	ld	a,21010
 300  0034 1a15          	or	a,(OFST+12,sp)
 301  0036 c75212        	ld	21010,a
 302                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 304  0039 72115210      	bres	21008,#0
 305                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 307  003d c6521c        	ld	a,21020
 308  0040 a430          	and	a,#48
 309  0042 c7521c        	ld	21020,a
 310                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 312  0045 725f521b      	clr	21019
 313                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 315  0049 96            	ldw	x,sp
 316  004a 1c000c        	addw	x,#OFST+3
 317  004d cd0000        	call	c_ltor
 319  0050 ae0000        	ldw	x,#L01
 320  0053 cd0000        	call	c_lcmp
 322  0056 2403          	jruge	L41
 323  0058 cc00e5        	jp	L131
 324  005b               L41:
 325                     ; 131     tmpccrh = I2C_CCRH_FS;
 327  005b a680          	ld	a,#128
 328  005d 6b07          	ld	(OFST-2,sp),a
 330                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 332  005f 0d12          	tnz	(OFST+9,sp)
 333  0061 2630          	jrne	L331
 334                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 336  0063 96            	ldw	x,sp
 337  0064 1c000c        	addw	x,#OFST+3
 338  0067 cd0000        	call	c_ltor
 340  006a a603          	ld	a,#3
 341  006c cd0000        	call	c_smul
 343  006f 96            	ldw	x,sp
 344  0070 1c0001        	addw	x,#OFST-8
 345  0073 cd0000        	call	c_rtol
 348  0076 7b15          	ld	a,(OFST+12,sp)
 349  0078 b703          	ld	c_lreg+3,a
 350  007a 3f02          	clr	c_lreg+2
 351  007c 3f01          	clr	c_lreg+1
 352  007e 3f00          	clr	c_lreg
 353  0080 ae0004        	ldw	x,#L21
 354  0083 cd0000        	call	c_lmul
 356  0086 96            	ldw	x,sp
 357  0087 1c0001        	addw	x,#OFST-8
 358  008a cd0000        	call	c_ludv
 360  008d be02          	ldw	x,c_lreg+2
 361  008f 1f08          	ldw	(OFST-1,sp),x
 364  0091 2034          	jra	L531
 365  0093               L331:
 366                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 368  0093 96            	ldw	x,sp
 369  0094 1c000c        	addw	x,#OFST+3
 370  0097 cd0000        	call	c_ltor
 372  009a a619          	ld	a,#25
 373  009c cd0000        	call	c_smul
 375  009f 96            	ldw	x,sp
 376  00a0 1c0001        	addw	x,#OFST-8
 377  00a3 cd0000        	call	c_rtol
 380  00a6 7b15          	ld	a,(OFST+12,sp)
 381  00a8 b703          	ld	c_lreg+3,a
 382  00aa 3f02          	clr	c_lreg+2
 383  00ac 3f01          	clr	c_lreg+1
 384  00ae 3f00          	clr	c_lreg
 385  00b0 ae0004        	ldw	x,#L21
 386  00b3 cd0000        	call	c_lmul
 388  00b6 96            	ldw	x,sp
 389  00b7 1c0001        	addw	x,#OFST-8
 390  00ba cd0000        	call	c_ludv
 392  00bd be02          	ldw	x,c_lreg+2
 393  00bf 1f08          	ldw	(OFST-1,sp),x
 395                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 397  00c1 7b07          	ld	a,(OFST-2,sp)
 398  00c3 aa40          	or	a,#64
 399  00c5 6b07          	ld	(OFST-2,sp),a
 401  00c7               L531:
 402                     ; 147     if (result < (uint16_t)0x01)
 404  00c7 1e08          	ldw	x,(OFST-1,sp)
 405  00c9 2605          	jrne	L731
 406                     ; 150       result = (uint16_t)0x0001;
 408  00cb ae0001        	ldw	x,#1
 409  00ce 1f08          	ldw	(OFST-1,sp),x
 411  00d0               L731:
 412                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 414  00d0 7b15          	ld	a,(OFST+12,sp)
 415  00d2 97            	ld	xl,a
 416  00d3 a603          	ld	a,#3
 417  00d5 42            	mul	x,a
 418  00d6 a60a          	ld	a,#10
 419  00d8 cd0000        	call	c_sdivx
 421  00db 5c            	incw	x
 422  00dc 1f05          	ldw	(OFST-4,sp),x
 424                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 426  00de 7b06          	ld	a,(OFST-3,sp)
 427  00e0 c7521d        	ld	21021,a
 429  00e3 2043          	jra	L141
 430  00e5               L131:
 431                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 433  00e5 96            	ldw	x,sp
 434  00e6 1c000c        	addw	x,#OFST+3
 435  00e9 cd0000        	call	c_ltor
 437  00ec 3803          	sll	c_lreg+3
 438  00ee 3902          	rlc	c_lreg+2
 439  00f0 3901          	rlc	c_lreg+1
 440  00f2 3900          	rlc	c_lreg
 441  00f4 96            	ldw	x,sp
 442  00f5 1c0001        	addw	x,#OFST-8
 443  00f8 cd0000        	call	c_rtol
 446  00fb 7b15          	ld	a,(OFST+12,sp)
 447  00fd b703          	ld	c_lreg+3,a
 448  00ff 3f02          	clr	c_lreg+2
 449  0101 3f01          	clr	c_lreg+1
 450  0103 3f00          	clr	c_lreg
 451  0105 ae0004        	ldw	x,#L21
 452  0108 cd0000        	call	c_lmul
 454  010b 96            	ldw	x,sp
 455  010c 1c0001        	addw	x,#OFST-8
 456  010f cd0000        	call	c_ludv
 458  0112 be02          	ldw	x,c_lreg+2
 459  0114 1f08          	ldw	(OFST-1,sp),x
 461                     ; 167     if (result < (uint16_t)0x0004)
 463  0116 1e08          	ldw	x,(OFST-1,sp)
 464  0118 a30004        	cpw	x,#4
 465  011b 2405          	jruge	L341
 466                     ; 170       result = (uint16_t)0x0004;
 468  011d ae0004        	ldw	x,#4
 469  0120 1f08          	ldw	(OFST-1,sp),x
 471  0122               L341:
 472                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 474  0122 7b15          	ld	a,(OFST+12,sp)
 475  0124 4c            	inc	a
 476  0125 c7521d        	ld	21021,a
 477  0128               L141:
 478                     ; 181   I2C->CCRL = (uint8_t)result;
 480  0128 7b09          	ld	a,(OFST+0,sp)
 481  012a c7521b        	ld	21019,a
 482                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 484  012d 7b08          	ld	a,(OFST-1,sp)
 485  012f a40f          	and	a,#15
 486  0131 1a07          	or	a,(OFST-2,sp)
 487  0133 c7521c        	ld	21020,a
 488                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 490  0136 72105210      	bset	21008,#0
 491                     ; 188   I2C_AcknowledgeConfig(Ack);
 493  013a 7b13          	ld	a,(OFST+10,sp)
 494  013c ad71          	call	_I2C_AcknowledgeConfig
 496                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 498  013e 7b11          	ld	a,(OFST+8,sp)
 499  0140 c75213        	ld	21011,a
 500                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 500                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 502  0143 1e10          	ldw	x,(OFST+7,sp)
 503  0145 4f            	clr	a
 504  0146 01            	rrwa	x,a
 505  0147 48            	sll	a
 506  0148 59            	rlcw	x
 507  0149 01            	rrwa	x,a
 508  014a a406          	and	a,#6
 509  014c 5f            	clrw	x
 510  014d 6b04          	ld	(OFST-5,sp),a
 512  014f 7b14          	ld	a,(OFST+11,sp)
 513  0151 aa40          	or	a,#64
 514  0153 1a04          	or	a,(OFST-5,sp)
 515  0155 c75214        	ld	21012,a
 516                     ; 194 }
 519  0158 5b09          	addw	sp,#9
 520  015a 81            	ret
 575                     ; 202 void I2C_Cmd(FunctionalState NewState)
 575                     ; 203 {
 576                     	switch	.text
 577  015b               _I2C_Cmd:
 581                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 583                     ; 207   if (NewState != DISABLE)
 585  015b 4d            	tnz	a
 586  015c 2706          	jreq	L371
 587                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 589  015e 72105210      	bset	21008,#0
 591  0162 2004          	jra	L571
 592  0164               L371:
 593                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 595  0164 72115210      	bres	21008,#0
 596  0168               L571:
 597                     ; 217 }
 600  0168 81            	ret
 635                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 635                     ; 226 {
 636                     	switch	.text
 637  0169               _I2C_GeneralCallCmd:
 641                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 643                     ; 230   if (NewState != DISABLE)
 645  0169 4d            	tnz	a
 646  016a 2706          	jreq	L512
 647                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 649  016c 721c5210      	bset	21008,#6
 651  0170 2004          	jra	L712
 652  0172               L512:
 653                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 655  0172 721d5210      	bres	21008,#6
 656  0176               L712:
 657                     ; 240 }
 660  0176 81            	ret
 695                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 695                     ; 251 {
 696                     	switch	.text
 697  0177               _I2C_GenerateSTART:
 701                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 703                     ; 255   if (NewState != DISABLE)
 705  0177 4d            	tnz	a
 706  0178 2706          	jreq	L732
 707                     ; 258     I2C->CR2 |= I2C_CR2_START;
 709  017a 72105211      	bset	21009,#0
 711  017e 2004          	jra	L142
 712  0180               L732:
 713                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 715  0180 72115211      	bres	21009,#0
 716  0184               L142:
 717                     ; 265 }
 720  0184 81            	ret
 755                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 755                     ; 274 {
 756                     	switch	.text
 757  0185               _I2C_GenerateSTOP:
 761                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 763                     ; 278   if (NewState != DISABLE)
 765  0185 4d            	tnz	a
 766  0186 2706          	jreq	L162
 767                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 769  0188 72125211      	bset	21009,#1
 771  018c 2004          	jra	L362
 772  018e               L162:
 773                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 775  018e 72135211      	bres	21009,#1
 776  0192               L362:
 777                     ; 288 }
 780  0192 81            	ret
 816                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 816                     ; 297 {
 817                     	switch	.text
 818  0193               _I2C_SoftwareResetCmd:
 822                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 824                     ; 301   if (NewState != DISABLE)
 826  0193 4d            	tnz	a
 827  0194 2706          	jreq	L303
 828                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 830  0196 721e5211      	bset	21009,#7
 832  019a 2004          	jra	L503
 833  019c               L303:
 834                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 836  019c 721f5211      	bres	21009,#7
 837  01a0               L503:
 838                     ; 311 }
 841  01a0 81            	ret
 877                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 877                     ; 321 {
 878                     	switch	.text
 879  01a1               _I2C_StretchClockCmd:
 883                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 885                     ; 325   if (NewState != DISABLE)
 887  01a1 4d            	tnz	a
 888  01a2 2706          	jreq	L523
 889                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 891  01a4 721f5210      	bres	21008,#7
 893  01a8 2004          	jra	L723
 894  01aa               L523:
 895                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 897  01aa 721e5210      	bset	21008,#7
 898  01ae               L723:
 899                     ; 336 }
 902  01ae 81            	ret
 938                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 938                     ; 346 {
 939                     	switch	.text
 940  01af               _I2C_AcknowledgeConfig:
 942  01af 88            	push	a
 943       00000000      OFST:	set	0
 946                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 948                     ; 350   if (Ack == I2C_ACK_NONE)
 950  01b0 4d            	tnz	a
 951  01b1 2606          	jrne	L743
 952                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 954  01b3 72155211      	bres	21009,#2
 956  01b7 2014          	jra	L153
 957  01b9               L743:
 958                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 960  01b9 72145211      	bset	21009,#2
 961                     ; 360     if (Ack == I2C_ACK_CURR)
 963  01bd 7b01          	ld	a,(OFST+1,sp)
 964  01bf a101          	cp	a,#1
 965  01c1 2606          	jrne	L353
 966                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 968  01c3 72175211      	bres	21009,#3
 970  01c7 2004          	jra	L153
 971  01c9               L353:
 972                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 974  01c9 72165211      	bset	21009,#3
 975  01cd               L153:
 976                     ; 371 }
 979  01cd 84            	pop	a
 980  01ce 81            	ret
1052                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1052                     ; 382 {
1053                     	switch	.text
1054  01cf               _I2C_ITConfig:
1056  01cf 89            	pushw	x
1057       00000000      OFST:	set	0
1060                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1062                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1064                     ; 387   if (NewState != DISABLE)
1066  01d0 9f            	ld	a,xl
1067  01d1 4d            	tnz	a
1068  01d2 2709          	jreq	L314
1069                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1071  01d4 9e            	ld	a,xh
1072  01d5 ca521a        	or	a,21018
1073  01d8 c7521a        	ld	21018,a
1075  01db 2009          	jra	L514
1076  01dd               L314:
1077                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1079  01dd 7b01          	ld	a,(OFST+1,sp)
1080  01df 43            	cpl	a
1081  01e0 c4521a        	and	a,21018
1082  01e3 c7521a        	ld	21018,a
1083  01e6               L514:
1084                     ; 397 }
1087  01e6 85            	popw	x
1088  01e7 81            	ret
1124                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1124                     ; 406 {
1125                     	switch	.text
1126  01e8               _I2C_FastModeDutyCycleConfig:
1130                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1132                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1134  01e8 a140          	cp	a,#64
1135  01ea 2606          	jrne	L534
1136                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1138  01ec 721c521c      	bset	21020,#6
1140  01f0 2004          	jra	L734
1141  01f2               L534:
1142                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1144  01f2 721d521c      	bres	21020,#6
1145  01f6               L734:
1146                     ; 420 }
1149  01f6 81            	ret
1172                     ; 427 uint8_t I2C_ReceiveData(void)
1172                     ; 428 {
1173                     	switch	.text
1174  01f7               _I2C_ReceiveData:
1178                     ; 430   return ((uint8_t)I2C->DR);
1180  01f7 c65216        	ld	a,21014
1183  01fa 81            	ret
1248                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1248                     ; 441 {
1249                     	switch	.text
1250  01fb               _I2C_Send7bitAddress:
1252  01fb 89            	pushw	x
1253       00000000      OFST:	set	0
1256                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1258                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1260                     ; 447   Address &= (uint8_t)0xFE;
1262  01fc 7b01          	ld	a,(OFST+1,sp)
1263  01fe a4fe          	and	a,#254
1264  0200 6b01          	ld	(OFST+1,sp),a
1265                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1267  0202 7b01          	ld	a,(OFST+1,sp)
1268  0204 1a02          	or	a,(OFST+2,sp)
1269  0206 c75216        	ld	21014,a
1270                     ; 451 }
1273  0209 85            	popw	x
1274  020a 81            	ret
1308                     ; 458 void I2C_SendData(uint8_t Data)
1308                     ; 459 {
1309                     	switch	.text
1310  020b               _I2C_SendData:
1314                     ; 461   I2C->DR = Data;
1316  020b c75216        	ld	21014,a
1317                     ; 462 }
1320  020e 81            	ret
1544                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1544                     ; 579 {
1545                     	switch	.text
1546  020f               _I2C_CheckEvent:
1548  020f 89            	pushw	x
1549  0210 5206          	subw	sp,#6
1550       00000006      OFST:	set	6
1553                     ; 580   __IO uint16_t lastevent = 0x00;
1555  0212 5f            	clrw	x
1556  0213 1f04          	ldw	(OFST-2,sp),x
1558                     ; 581   uint8_t flag1 = 0x00 ;
1560                     ; 582   uint8_t flag2 = 0x00;
1562                     ; 583   ErrorStatus status = ERROR;
1564                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1566                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1568  0215 1e07          	ldw	x,(OFST+1,sp)
1569  0217 a30004        	cpw	x,#4
1570  021a 260b          	jrne	L136
1571                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1573  021c c65218        	ld	a,21016
1574  021f a404          	and	a,#4
1575  0221 5f            	clrw	x
1576  0222 97            	ld	xl,a
1577  0223 1f04          	ldw	(OFST-2,sp),x
1580  0225 201f          	jra	L336
1581  0227               L136:
1582                     ; 594     flag1 = I2C->SR1;
1584  0227 c65217        	ld	a,21015
1585  022a 6b03          	ld	(OFST-3,sp),a
1587                     ; 595     flag2 = I2C->SR3;
1589  022c c65219        	ld	a,21017
1590  022f 6b06          	ld	(OFST+0,sp),a
1592                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1594  0231 7b03          	ld	a,(OFST-3,sp)
1595  0233 5f            	clrw	x
1596  0234 97            	ld	xl,a
1597  0235 1f01          	ldw	(OFST-5,sp),x
1599  0237 7b06          	ld	a,(OFST+0,sp)
1600  0239 5f            	clrw	x
1601  023a 97            	ld	xl,a
1602  023b 4f            	clr	a
1603  023c 02            	rlwa	x,a
1604  023d 01            	rrwa	x,a
1605  023e 1a02          	or	a,(OFST-4,sp)
1606  0240 01            	rrwa	x,a
1607  0241 1a01          	or	a,(OFST-5,sp)
1608  0243 01            	rrwa	x,a
1609  0244 1f04          	ldw	(OFST-2,sp),x
1611  0246               L336:
1612                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1614  0246 1e04          	ldw	x,(OFST-2,sp)
1615  0248 01            	rrwa	x,a
1616  0249 1408          	and	a,(OFST+2,sp)
1617  024b 01            	rrwa	x,a
1618  024c 1407          	and	a,(OFST+1,sp)
1619  024e 01            	rrwa	x,a
1620  024f 1307          	cpw	x,(OFST+1,sp)
1621  0251 2606          	jrne	L536
1622                     ; 602     status = SUCCESS;
1624  0253 a601          	ld	a,#1
1625  0255 6b06          	ld	(OFST+0,sp),a
1628  0257 2002          	jra	L736
1629  0259               L536:
1630                     ; 607     status = ERROR;
1632  0259 0f06          	clr	(OFST+0,sp)
1634  025b               L736:
1635                     ; 611   return status;
1637  025b 7b06          	ld	a,(OFST+0,sp)
1640  025d 5b08          	addw	sp,#8
1641  025f 81            	ret
1694                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1694                     ; 629 {
1695                     	switch	.text
1696  0260               _I2C_GetLastEvent:
1698  0260 5206          	subw	sp,#6
1699       00000006      OFST:	set	6
1702                     ; 630   __IO uint16_t lastevent = 0;
1704  0262 5f            	clrw	x
1705  0263 1f05          	ldw	(OFST-1,sp),x
1707                     ; 631   uint16_t flag1 = 0;
1709                     ; 632   uint16_t flag2 = 0;
1711                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1713  0265 c65218        	ld	a,21016
1714  0268 a504          	bcp	a,#4
1715  026a 2707          	jreq	L766
1716                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1718  026c ae0004        	ldw	x,#4
1719  026f 1f05          	ldw	(OFST-1,sp),x
1722  0271 201b          	jra	L176
1723  0273               L766:
1724                     ; 641     flag1 = I2C->SR1;
1726  0273 c65217        	ld	a,21015
1727  0276 5f            	clrw	x
1728  0277 97            	ld	xl,a
1729  0278 1f01          	ldw	(OFST-5,sp),x
1731                     ; 642     flag2 = I2C->SR3;
1733  027a c65219        	ld	a,21017
1734  027d 5f            	clrw	x
1735  027e 97            	ld	xl,a
1736  027f 1f03          	ldw	(OFST-3,sp),x
1738                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1740  0281 1e03          	ldw	x,(OFST-3,sp)
1741  0283 4f            	clr	a
1742  0284 02            	rlwa	x,a
1743  0285 01            	rrwa	x,a
1744  0286 1a02          	or	a,(OFST-4,sp)
1745  0288 01            	rrwa	x,a
1746  0289 1a01          	or	a,(OFST-5,sp)
1747  028b 01            	rrwa	x,a
1748  028c 1f05          	ldw	(OFST-1,sp),x
1750  028e               L176:
1751                     ; 648   return (I2C_Event_TypeDef)lastevent;
1753  028e 1e05          	ldw	x,(OFST-1,sp)
1756  0290 5b06          	addw	sp,#6
1757  0292 81            	ret
1972                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1972                     ; 680 {
1973                     	switch	.text
1974  0293               _I2C_GetFlagStatus:
1976  0293 89            	pushw	x
1977  0294 89            	pushw	x
1978       00000002      OFST:	set	2
1981                     ; 681   uint8_t tempreg = 0;
1983  0295 0f02          	clr	(OFST+0,sp)
1985                     ; 682   uint8_t regindex = 0;
1987                     ; 683   FlagStatus bitstatus = RESET;
1989                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1991                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1993  0297 9e            	ld	a,xh
1994  0298 6b01          	ld	(OFST-1,sp),a
1996                     ; 691   switch (regindex)
1998  029a 7b01          	ld	a,(OFST-1,sp)
2000                     ; 708     default:
2000                     ; 709       break;
2001  029c 4a            	dec	a
2002  029d 2708          	jreq	L376
2003  029f 4a            	dec	a
2004  02a0 270c          	jreq	L576
2005  02a2 4a            	dec	a
2006  02a3 2710          	jreq	L776
2007  02a5 2013          	jra	L3101
2008  02a7               L376:
2009                     ; 694     case 0x01:
2009                     ; 695       tempreg = (uint8_t)I2C->SR1;
2011  02a7 c65217        	ld	a,21015
2012  02aa 6b02          	ld	(OFST+0,sp),a
2014                     ; 696       break;
2016  02ac 200c          	jra	L3101
2017  02ae               L576:
2018                     ; 699     case 0x02:
2018                     ; 700       tempreg = (uint8_t)I2C->SR2;
2020  02ae c65218        	ld	a,21016
2021  02b1 6b02          	ld	(OFST+0,sp),a
2023                     ; 701       break;
2025  02b3 2005          	jra	L3101
2026  02b5               L776:
2027                     ; 704     case 0x03:
2027                     ; 705       tempreg = (uint8_t)I2C->SR3;
2029  02b5 c65219        	ld	a,21017
2030  02b8 6b02          	ld	(OFST+0,sp),a
2032                     ; 706       break;
2034  02ba               L107:
2035                     ; 708     default:
2035                     ; 709       break;
2037  02ba               L3101:
2038                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2040  02ba 7b04          	ld	a,(OFST+2,sp)
2041  02bc 1502          	bcp	a,(OFST+0,sp)
2042  02be 2706          	jreq	L5101
2043                     ; 716     bitstatus = SET;
2045  02c0 a601          	ld	a,#1
2046  02c2 6b02          	ld	(OFST+0,sp),a
2049  02c4 2002          	jra	L7101
2050  02c6               L5101:
2051                     ; 721     bitstatus = RESET;
2053  02c6 0f02          	clr	(OFST+0,sp)
2055  02c8               L7101:
2056                     ; 724   return bitstatus;
2058  02c8 7b02          	ld	a,(OFST+0,sp)
2061  02ca 5b04          	addw	sp,#4
2062  02cc 81            	ret
2106                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2106                     ; 760 {
2107                     	switch	.text
2108  02cd               _I2C_ClearFlag:
2110  02cd 89            	pushw	x
2111       00000002      OFST:	set	2
2114                     ; 761   uint16_t flagpos = 0;
2116                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2118                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2120  02ce 01            	rrwa	x,a
2121  02cf a4ff          	and	a,#255
2122  02d1 5f            	clrw	x
2123  02d2 02            	rlwa	x,a
2124  02d3 1f01          	ldw	(OFST-1,sp),x
2125  02d5 01            	rrwa	x,a
2127                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2129  02d6 7b02          	ld	a,(OFST+0,sp)
2130  02d8 43            	cpl	a
2131  02d9 c75218        	ld	21016,a
2132                     ; 769 }
2135  02dc 85            	popw	x
2136  02dd 81            	ret
2302                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2302                     ; 792 {
2303                     	switch	.text
2304  02de               _I2C_GetITStatus:
2306  02de 89            	pushw	x
2307  02df 5204          	subw	sp,#4
2308       00000004      OFST:	set	4
2311                     ; 793   ITStatus bitstatus = RESET;
2313                     ; 794   __IO uint8_t enablestatus = 0;
2315  02e1 0f03          	clr	(OFST-1,sp)
2317                     ; 795   uint16_t tempregister = 0;
2319                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2321                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2323  02e3 9e            	ld	a,xh
2324  02e4 a407          	and	a,#7
2325  02e6 5f            	clrw	x
2326  02e7 97            	ld	xl,a
2327  02e8 1f01          	ldw	(OFST-3,sp),x
2329                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2331  02ea c6521a        	ld	a,21018
2332  02ed 1402          	and	a,(OFST-2,sp)
2333  02ef 6b03          	ld	(OFST-1,sp),a
2335                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2337  02f1 7b05          	ld	a,(OFST+1,sp)
2338  02f3 97            	ld	xl,a
2339  02f4 7b06          	ld	a,(OFST+2,sp)
2340  02f6 9f            	ld	a,xl
2341  02f7 a430          	and	a,#48
2342  02f9 97            	ld	xl,a
2343  02fa 4f            	clr	a
2344  02fb 02            	rlwa	x,a
2345  02fc a30100        	cpw	x,#256
2346  02ff 2615          	jrne	L1311
2347                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2349  0301 c65217        	ld	a,21015
2350  0304 1506          	bcp	a,(OFST+2,sp)
2351  0306 270a          	jreq	L3311
2353  0308 0d03          	tnz	(OFST-1,sp)
2354  030a 2706          	jreq	L3311
2355                     ; 811       bitstatus = SET;
2357  030c a601          	ld	a,#1
2358  030e 6b04          	ld	(OFST+0,sp),a
2361  0310 2017          	jra	L7311
2362  0312               L3311:
2363                     ; 816       bitstatus = RESET;
2365  0312 0f04          	clr	(OFST+0,sp)
2367  0314 2013          	jra	L7311
2368  0316               L1311:
2369                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2371  0316 c65218        	ld	a,21016
2372  0319 1506          	bcp	a,(OFST+2,sp)
2373  031b 270a          	jreq	L1411
2375  031d 0d03          	tnz	(OFST-1,sp)
2376  031f 2706          	jreq	L1411
2377                     ; 825       bitstatus = SET;
2379  0321 a601          	ld	a,#1
2380  0323 6b04          	ld	(OFST+0,sp),a
2383  0325 2002          	jra	L7311
2384  0327               L1411:
2385                     ; 830       bitstatus = RESET;
2387  0327 0f04          	clr	(OFST+0,sp)
2389  0329               L7311:
2390                     ; 834   return  bitstatus;
2392  0329 7b04          	ld	a,(OFST+0,sp)
2395  032b 5b06          	addw	sp,#6
2396  032d 81            	ret
2441                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2441                     ; 872 {
2442                     	switch	.text
2443  032e               _I2C_ClearITPendingBit:
2445  032e 89            	pushw	x
2446       00000002      OFST:	set	2
2449                     ; 873   uint16_t flagpos = 0;
2451                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2453                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2455  032f 01            	rrwa	x,a
2456  0330 a4ff          	and	a,#255
2457  0332 5f            	clrw	x
2458  0333 02            	rlwa	x,a
2459  0334 1f01          	ldw	(OFST-1,sp),x
2460  0336 01            	rrwa	x,a
2462                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2464  0337 7b02          	ld	a,(OFST+0,sp)
2465  0339 43            	cpl	a
2466  033a c75218        	ld	21016,a
2467                     ; 883 }
2470  033d 85            	popw	x
2471  033e 81            	ret
2484                     	xdef	_I2C_ClearITPendingBit
2485                     	xdef	_I2C_GetITStatus
2486                     	xdef	_I2C_ClearFlag
2487                     	xdef	_I2C_GetFlagStatus
2488                     	xdef	_I2C_GetLastEvent
2489                     	xdef	_I2C_CheckEvent
2490                     	xdef	_I2C_SendData
2491                     	xdef	_I2C_Send7bitAddress
2492                     	xdef	_I2C_ReceiveData
2493                     	xdef	_I2C_ITConfig
2494                     	xdef	_I2C_FastModeDutyCycleConfig
2495                     	xdef	_I2C_AcknowledgeConfig
2496                     	xdef	_I2C_StretchClockCmd
2497                     	xdef	_I2C_SoftwareResetCmd
2498                     	xdef	_I2C_GenerateSTOP
2499                     	xdef	_I2C_GenerateSTART
2500                     	xdef	_I2C_GeneralCallCmd
2501                     	xdef	_I2C_Cmd
2502                     	xdef	_I2C_Init
2503                     	xdef	_I2C_DeInit
2504                     	xref.b	c_lreg
2505                     	xref.b	c_x
2524                     	xref	c_sdivx
2525                     	xref	c_ludv
2526                     	xref	c_rtol
2527                     	xref	c_smul
2528                     	xref	c_lmul
2529                     	xref	c_lcmp
2530                     	xref	c_ltor
2531                     	end
