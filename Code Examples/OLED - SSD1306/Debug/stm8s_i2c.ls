   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  47                     ; 67 void I2C_DeInit(void)
  47                     ; 68 {
  49                     	switch	.text
  50  0000               _I2C_DeInit:
  54                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  56  0000 725f5210      	clr	21008
  57                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  59  0004 725f5211      	clr	21009
  60                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  62  0008 725f5212      	clr	21010
  63                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  65  000c 725f5213      	clr	21011
  66                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  68  0010 725f5214      	clr	21012
  69                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  71  0014 725f521a      	clr	21018
  72                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  74  0018 725f521b      	clr	21019
  75                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  77  001c 725f521c      	clr	21020
  78                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  80  0020 3502521d      	mov	21021,#2
  81                     ; 78 }
  84  0024 81            	ret	
 251                     .const:	section	.text
 252  0000               L01:
 253  0000 000186a1      	dc.l	100001
 254  0004               L21:
 255  0004 000f4240      	dc.l	1000000
 256                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 256                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 256                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 256                     ; 99 {
 257                     	switch	.text
 258  0025               _I2C_Init:
 260  0025 5209          	subw	sp,#9
 261       00000009      OFST:	set	9
 264                     ; 100   uint16_t result = 0x0004;
 266                     ; 101   uint16_t tmpval = 0;
 268                     ; 102   uint8_t tmpccrh = 0;
 270  0027 0f07          	clr	(OFST-2,sp)
 272                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 274                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 276                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 278                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 280                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 282                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 284                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 286  0029 c65212        	ld	a,21010
 287  002c a4c0          	and	a,#192
 288  002e c75212        	ld	21010,a
 289                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 291  0031 c65212        	ld	a,21010
 292  0034 1a15          	or	a,(OFST+12,sp)
 293  0036 c75212        	ld	21010,a
 294                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 296  0039 72115210      	bres	21008,#0
 297                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 299  003d c6521c        	ld	a,21020
 300  0040 a430          	and	a,#48
 301  0042 c7521c        	ld	21020,a
 302                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 304  0045 725f521b      	clr	21019
 305                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 307  0049 96            	ldw	x,sp
 308  004a 1c000c        	addw	x,#OFST+3
 309  004d cd0000        	call	c_ltor
 311  0050 ae0000        	ldw	x,#L01
 312  0053 cd0000        	call	c_lcmp
 314  0056 2560          	jrult	L511
 315                     ; 131     tmpccrh = I2C_CCRH_FS;
 317  0058 a680          	ld	a,#128
 318  005a 6b07          	ld	(OFST-2,sp),a
 320                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 322  005c 96            	ldw	x,sp
 323  005d 0d12          	tnz	(OFST+9,sp)
 324  005f 261d          	jrne	L711
 325                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 327  0061 1c000c        	addw	x,#OFST+3
 328  0064 cd0000        	call	c_ltor
 330  0067 a603          	ld	a,#3
 331  0069 cd0000        	call	c_smul
 333  006c 96            	ldw	x,sp
 334  006d 5c            	incw	x
 335  006e cd0000        	call	c_rtol
 338  0071 7b15          	ld	a,(OFST+12,sp)
 339  0073 cd0116        	call	LC001
 341  0076 96            	ldw	x,sp
 342  0077 cd0124        	call	LC002
 343  007a 1f08          	ldw	(OFST-1,sp),x
 346  007c 2021          	jra	L121
 347  007e               L711:
 348                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 350  007e 1c000c        	addw	x,#OFST+3
 351  0081 cd0000        	call	c_ltor
 353  0084 a619          	ld	a,#25
 354  0086 cd0000        	call	c_smul
 356  0089 96            	ldw	x,sp
 357  008a 5c            	incw	x
 358  008b cd0000        	call	c_rtol
 361  008e 7b15          	ld	a,(OFST+12,sp)
 362  0090 cd0116        	call	LC001
 364  0093 96            	ldw	x,sp
 365  0094 cd0124        	call	LC002
 366  0097 1f08          	ldw	(OFST-1,sp),x
 368                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 370  0099 7b07          	ld	a,(OFST-2,sp)
 371  009b aa40          	or	a,#64
 372  009d 6b07          	ld	(OFST-2,sp),a
 374  009f               L121:
 375                     ; 147     if (result < (uint16_t)0x01)
 377  009f 1e08          	ldw	x,(OFST-1,sp)
 378  00a1 2603          	jrne	L321
 379                     ; 150       result = (uint16_t)0x0001;
 381  00a3 5c            	incw	x
 382  00a4 1f08          	ldw	(OFST-1,sp),x
 384  00a6               L321:
 385                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 387  00a6 7b15          	ld	a,(OFST+12,sp)
 388  00a8 97            	ld	xl,a
 389  00a9 a603          	ld	a,#3
 390  00ab 42            	mul	x,a
 391  00ac a60a          	ld	a,#10
 392  00ae cd0000        	call	c_sdivx
 394  00b1 5c            	incw	x
 395  00b2 1f05          	ldw	(OFST-4,sp),x
 397                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 399  00b4 7b06          	ld	a,(OFST-3,sp)
 401  00b6 2028          	jra	L521
 402  00b8               L511:
 403                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 405  00b8 96            	ldw	x,sp
 406  00b9 1c000c        	addw	x,#OFST+3
 407  00bc cd0000        	call	c_ltor
 409  00bf 3803          	sll	c_lreg+3
 410  00c1 3902          	rlc	c_lreg+2
 411  00c3 3901          	rlc	c_lreg+1
 412  00c5 96            	ldw	x,sp
 413  00c6 3900          	rlc	c_lreg
 414  00c8 5c            	incw	x
 415  00c9 cd0000        	call	c_rtol
 418  00cc 7b15          	ld	a,(OFST+12,sp)
 419  00ce ad46          	call	LC001
 421  00d0 96            	ldw	x,sp
 422  00d1 ad51          	call	LC002
 424                     ; 167     if (result < (uint16_t)0x0004)
 426  00d3 a30004        	cpw	x,#4
 427  00d6 2403          	jruge	L721
 428                     ; 170       result = (uint16_t)0x0004;
 430  00d8 ae0004        	ldw	x,#4
 432  00db               L721:
 433  00db 1f08          	ldw	(OFST-1,sp),x
 434                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 436  00dd 7b15          	ld	a,(OFST+12,sp)
 437  00df 4c            	inc	a
 438  00e0               L521:
 439  00e0 c7521d        	ld	21021,a
 440                     ; 181   I2C->CCRL = (uint8_t)result;
 442  00e3 7b09          	ld	a,(OFST+0,sp)
 443  00e5 c7521b        	ld	21019,a
 444                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 446  00e8 7b08          	ld	a,(OFST-1,sp)
 447  00ea a40f          	and	a,#15
 448  00ec 1a07          	or	a,(OFST-2,sp)
 449  00ee c7521c        	ld	21020,a
 450                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 452  00f1 72105210      	bset	21008,#0
 453                     ; 188   I2C_AcknowledgeConfig(Ack);
 455  00f5 7b13          	ld	a,(OFST+10,sp)
 456  00f7 cd0179        	call	_I2C_AcknowledgeConfig
 458                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 460  00fa 7b11          	ld	a,(OFST+8,sp)
 461  00fc c75213        	ld	21011,a
 462                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 462                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 464  00ff 1e10          	ldw	x,(OFST+7,sp)
 465  0101 4f            	clr	a
 466  0102 01            	rrwa	x,a
 467  0103 48            	sll	a
 468  0104 01            	rrwa	x,a
 469  0105 49            	rlc	a
 470  0106 a406          	and	a,#6
 471  0108 6b04          	ld	(OFST-5,sp),a
 473  010a 7b14          	ld	a,(OFST+11,sp)
 474  010c aa40          	or	a,#64
 475  010e 1a04          	or	a,(OFST-5,sp)
 476  0110 c75214        	ld	21012,a
 477                     ; 194 }
 480  0113 5b09          	addw	sp,#9
 481  0115 81            	ret	
 482  0116               LC001:
 483  0116 b703          	ld	c_lreg+3,a
 484  0118 3f02          	clr	c_lreg+2
 485  011a 3f01          	clr	c_lreg+1
 486  011c 3f00          	clr	c_lreg
 487  011e ae0004        	ldw	x,#L21
 488  0121 cc0000        	jp	c_lmul
 489  0124               LC002:
 490  0124 5c            	incw	x
 491  0125 cd0000        	call	c_ludv
 493  0128 be02          	ldw	x,c_lreg+2
 494  012a 81            	ret	
 549                     ; 202 void I2C_Cmd(FunctionalState NewState)
 549                     ; 203 {
 550                     	switch	.text
 551  012b               _I2C_Cmd:
 555                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 557                     ; 207   if (NewState != DISABLE)
 559  012b 4d            	tnz	a
 560  012c 2705          	jreq	L751
 561                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 563  012e 72105210      	bset	21008,#0
 566  0132 81            	ret	
 567  0133               L751:
 568                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 570  0133 72115210      	bres	21008,#0
 571                     ; 217 }
 574  0137 81            	ret	
 609                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 609                     ; 226 {
 610                     	switch	.text
 611  0138               _I2C_GeneralCallCmd:
 615                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 617                     ; 230   if (NewState != DISABLE)
 619  0138 4d            	tnz	a
 620  0139 2705          	jreq	L102
 621                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 623  013b 721c5210      	bset	21008,#6
 626  013f 81            	ret	
 627  0140               L102:
 628                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 630  0140 721d5210      	bres	21008,#6
 631                     ; 240 }
 634  0144 81            	ret	
 669                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 669                     ; 251 {
 670                     	switch	.text
 671  0145               _I2C_GenerateSTART:
 675                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 677                     ; 255   if (NewState != DISABLE)
 679  0145 4d            	tnz	a
 680  0146 2705          	jreq	L322
 681                     ; 258     I2C->CR2 |= I2C_CR2_START;
 683  0148 72105211      	bset	21009,#0
 686  014c 81            	ret	
 687  014d               L322:
 688                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 690  014d 72115211      	bres	21009,#0
 691                     ; 265 }
 694  0151 81            	ret	
 729                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 729                     ; 274 {
 730                     	switch	.text
 731  0152               _I2C_GenerateSTOP:
 735                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 737                     ; 278   if (NewState != DISABLE)
 739  0152 4d            	tnz	a
 740  0153 2705          	jreq	L542
 741                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 743  0155 72125211      	bset	21009,#1
 746  0159 81            	ret	
 747  015a               L542:
 748                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 750  015a 72135211      	bres	21009,#1
 751                     ; 288 }
 754  015e 81            	ret	
 790                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 790                     ; 297 {
 791                     	switch	.text
 792  015f               _I2C_SoftwareResetCmd:
 796                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 798                     ; 301   if (NewState != DISABLE)
 800  015f 4d            	tnz	a
 801  0160 2705          	jreq	L762
 802                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 804  0162 721e5211      	bset	21009,#7
 807  0166 81            	ret	
 808  0167               L762:
 809                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 811  0167 721f5211      	bres	21009,#7
 812                     ; 311 }
 815  016b 81            	ret	
 851                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 851                     ; 321 {
 852                     	switch	.text
 853  016c               _I2C_StretchClockCmd:
 857                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 859                     ; 325   if (NewState != DISABLE)
 861  016c 4d            	tnz	a
 862  016d 2705          	jreq	L113
 863                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 865  016f 721f5210      	bres	21008,#7
 868  0173 81            	ret	
 869  0174               L113:
 870                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 872  0174 721e5210      	bset	21008,#7
 873                     ; 336 }
 876  0178 81            	ret	
 912                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 912                     ; 346 {
 913                     	switch	.text
 914  0179               _I2C_AcknowledgeConfig:
 916       00000000      OFST:	set	0
 919                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 921                     ; 350   if (Ack == I2C_ACK_NONE)
 923  0179 4d            	tnz	a
 924  017a 2605          	jrne	L333
 925                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 927  017c 72155211      	bres	21009,#2
 930  0180 81            	ret	
 931  0181               L333:
 932                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 934  0181 72145211      	bset	21009,#2
 935                     ; 360     if (Ack == I2C_ACK_CURR)
 937  0185 4a            	dec	a
 938  0186 2605          	jrne	L733
 939                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 941  0188 72175211      	bres	21009,#3
 944  018c 81            	ret	
 945  018d               L733:
 946                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 948  018d 72165211      	bset	21009,#3
 949                     ; 371 }
 952  0191 81            	ret	
1024                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1024                     ; 382 {
1025                     	switch	.text
1026  0192               _I2C_ITConfig:
1028  0192 89            	pushw	x
1029       00000000      OFST:	set	0
1032                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1034                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1036                     ; 387   if (NewState != DISABLE)
1038  0193 9f            	ld	a,xl
1039  0194 4d            	tnz	a
1040  0195 2706          	jreq	L773
1041                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1043  0197 9e            	ld	a,xh
1044  0198 ca521a        	or	a,21018
1046  019b 2006          	jra	L104
1047  019d               L773:
1048                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1050  019d 7b01          	ld	a,(OFST+1,sp)
1051  019f 43            	cpl	a
1052  01a0 c4521a        	and	a,21018
1053  01a3               L104:
1054  01a3 c7521a        	ld	21018,a
1055                     ; 397 }
1058  01a6 85            	popw	x
1059  01a7 81            	ret	
1095                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1095                     ; 406 {
1096                     	switch	.text
1097  01a8               _I2C_FastModeDutyCycleConfig:
1101                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1103                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1105  01a8 a140          	cp	a,#64
1106  01aa 2605          	jrne	L124
1107                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1109  01ac 721c521c      	bset	21020,#6
1112  01b0 81            	ret	
1113  01b1               L124:
1114                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1116  01b1 721d521c      	bres	21020,#6
1117                     ; 420 }
1120  01b5 81            	ret	
1143                     ; 427 uint8_t I2C_ReceiveData(void)
1143                     ; 428 {
1144                     	switch	.text
1145  01b6               _I2C_ReceiveData:
1149                     ; 430   return ((uint8_t)I2C->DR);
1151  01b6 c65216        	ld	a,21014
1154  01b9 81            	ret	
1217                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1217                     ; 441 {
1218                     	switch	.text
1219  01ba               _I2C_Send7bitAddress:
1221  01ba 89            	pushw	x
1222       00000000      OFST:	set	0
1225                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1227                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1229                     ; 447   Address &= (uint8_t)0xFE;
1231  01bb 7b01          	ld	a,(OFST+1,sp)
1232  01bd a4fe          	and	a,#254
1233  01bf 6b01          	ld	(OFST+1,sp),a
1234                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1236  01c1 1a02          	or	a,(OFST+2,sp)
1237  01c3 c75216        	ld	21014,a
1238                     ; 451 }
1241  01c6 85            	popw	x
1242  01c7 81            	ret	
1274                     ; 458 void I2C_SendData(uint8_t Data)
1274                     ; 459 {
1275                     	switch	.text
1276  01c8               _I2C_SendData:
1280                     ; 461   I2C->DR = Data;
1282  01c8 c75216        	ld	21014,a
1283                     ; 462 }
1286  01cb 81            	ret	
1506                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1506                     ; 579 {
1507                     	switch	.text
1508  01cc               _I2C_CheckEvent:
1510  01cc 89            	pushw	x
1511  01cd 5206          	subw	sp,#6
1512       00000006      OFST:	set	6
1515                     ; 580   __IO uint16_t lastevent = 0x00;
1517  01cf 5f            	clrw	x
1518  01d0 1f04          	ldw	(OFST-2,sp),x
1520                     ; 581   uint8_t flag1 = 0x00 ;
1522                     ; 582   uint8_t flag2 = 0x00;
1524                     ; 583   ErrorStatus status = ERROR;
1526                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1528                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1530  01d2 1e07          	ldw	x,(OFST+1,sp)
1531  01d4 a30004        	cpw	x,#4
1532  01d7 2609          	jrne	L506
1533                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1535  01d9 c65218        	ld	a,21016
1536  01dc a404          	and	a,#4
1537  01de 5f            	clrw	x
1538  01df 97            	ld	xl,a
1540  01e0 201a          	jra	L706
1541  01e2               L506:
1542                     ; 594     flag1 = I2C->SR1;
1544  01e2 c65217        	ld	a,21015
1545  01e5 6b03          	ld	(OFST-3,sp),a
1547                     ; 595     flag2 = I2C->SR3;
1549  01e7 c65219        	ld	a,21017
1550  01ea 6b06          	ld	(OFST+0,sp),a
1552                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1554  01ec 5f            	clrw	x
1555  01ed 7b03          	ld	a,(OFST-3,sp)
1556  01ef 97            	ld	xl,a
1557  01f0 1f01          	ldw	(OFST-5,sp),x
1559  01f2 5f            	clrw	x
1560  01f3 7b06          	ld	a,(OFST+0,sp)
1561  01f5 97            	ld	xl,a
1562  01f6 7b02          	ld	a,(OFST-4,sp)
1563  01f8 01            	rrwa	x,a
1564  01f9 1a01          	or	a,(OFST-5,sp)
1565  01fb 01            	rrwa	x,a
1566  01fc               L706:
1567  01fc 1f04          	ldw	(OFST-2,sp),x
1569                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1571  01fe 1e04          	ldw	x,(OFST-2,sp)
1572  0200 01            	rrwa	x,a
1573  0201 1408          	and	a,(OFST+2,sp)
1574  0203 01            	rrwa	x,a
1575  0204 1407          	and	a,(OFST+1,sp)
1576  0206 01            	rrwa	x,a
1577  0207 1307          	cpw	x,(OFST+1,sp)
1578  0209 2604          	jrne	L116
1579                     ; 602     status = SUCCESS;
1581  020b a601          	ld	a,#1
1584  020d 2001          	jra	L316
1585  020f               L116:
1586                     ; 607     status = ERROR;
1588  020f 4f            	clr	a
1590  0210               L316:
1591                     ; 611   return status;
1595  0210 5b08          	addw	sp,#8
1596  0212 81            	ret	
1645                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1645                     ; 629 {
1646                     	switch	.text
1647  0213               _I2C_GetLastEvent:
1649  0213 5206          	subw	sp,#6
1650       00000006      OFST:	set	6
1653                     ; 630   __IO uint16_t lastevent = 0;
1655  0215 5f            	clrw	x
1656  0216 1f05          	ldw	(OFST-1,sp),x
1658                     ; 631   uint16_t flag1 = 0;
1660                     ; 632   uint16_t flag2 = 0;
1662                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1664  0218 7205521805    	btjf	21016,#2,L736
1665                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1667  021d ae0004        	ldw	x,#4
1669  0220 2013          	jra	L146
1670  0222               L736:
1671                     ; 641     flag1 = I2C->SR1;
1673  0222 c65217        	ld	a,21015
1674  0225 97            	ld	xl,a
1675  0226 1f01          	ldw	(OFST-5,sp),x
1677                     ; 642     flag2 = I2C->SR3;
1679  0228 c65219        	ld	a,21017
1680  022b 5f            	clrw	x
1681  022c 97            	ld	xl,a
1682  022d 1f03          	ldw	(OFST-3,sp),x
1684                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1686  022f 7b02          	ld	a,(OFST-4,sp)
1687  0231 01            	rrwa	x,a
1688  0232 1a01          	or	a,(OFST-5,sp)
1689  0234 01            	rrwa	x,a
1690  0235               L146:
1691  0235 1f05          	ldw	(OFST-1,sp),x
1693                     ; 648   return (I2C_Event_TypeDef)lastevent;
1695  0237 1e05          	ldw	x,(OFST-1,sp)
1698  0239 5b06          	addw	sp,#6
1699  023b 81            	ret	
1910                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1910                     ; 680 {
1911                     	switch	.text
1912  023c               _I2C_GetFlagStatus:
1914  023c 89            	pushw	x
1915  023d 89            	pushw	x
1916       00000002      OFST:	set	2
1919                     ; 681   uint8_t tempreg = 0;
1921  023e 0f02          	clr	(OFST+0,sp)
1923                     ; 682   uint8_t regindex = 0;
1925                     ; 683   FlagStatus bitstatus = RESET;
1927                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1929                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1931  0240 9e            	ld	a,xh
1932  0241 6b01          	ld	(OFST-1,sp),a
1934                     ; 691   switch (regindex)
1937                     ; 708     default:
1937                     ; 709       break;
1938  0243 4a            	dec	a
1939  0244 2708          	jreq	L346
1940  0246 4a            	dec	a
1941  0247 270a          	jreq	L546
1942  0249 4a            	dec	a
1943  024a 270c          	jreq	L746
1944  024c 200f          	jra	L757
1945  024e               L346:
1946                     ; 694     case 0x01:
1946                     ; 695       tempreg = (uint8_t)I2C->SR1;
1948  024e c65217        	ld	a,21015
1949                     ; 696       break;
1951  0251 2008          	jp	LC003
1952  0253               L546:
1953                     ; 699     case 0x02:
1953                     ; 700       tempreg = (uint8_t)I2C->SR2;
1955  0253 c65218        	ld	a,21016
1956                     ; 701       break;
1958  0256 2003          	jp	LC003
1959  0258               L746:
1960                     ; 704     case 0x03:
1960                     ; 705       tempreg = (uint8_t)I2C->SR3;
1962  0258 c65219        	ld	a,21017
1963  025b               LC003:
1964  025b 6b02          	ld	(OFST+0,sp),a
1966                     ; 706       break;
1968                     ; 708     default:
1968                     ; 709       break;
1970  025d               L757:
1971                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
1973  025d 7b04          	ld	a,(OFST+2,sp)
1974  025f 1502          	bcp	a,(OFST+0,sp)
1975  0261 2704          	jreq	L167
1976                     ; 716     bitstatus = SET;
1978  0263 a601          	ld	a,#1
1981  0265 2001          	jra	L367
1982  0267               L167:
1983                     ; 721     bitstatus = RESET;
1985  0267 4f            	clr	a
1987  0268               L367:
1988                     ; 724   return bitstatus;
1992  0268 5b04          	addw	sp,#4
1993  026a 81            	ret	
2035                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2035                     ; 760 {
2036                     	switch	.text
2037  026b               _I2C_ClearFlag:
2039  026b 89            	pushw	x
2040       00000002      OFST:	set	2
2043                     ; 761   uint16_t flagpos = 0;
2045                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2047                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2049  026c 01            	rrwa	x,a
2050  026d 5f            	clrw	x
2051  026e 02            	rlwa	x,a
2052  026f 1f01          	ldw	(OFST-1,sp),x
2054                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2056  0271 7b02          	ld	a,(OFST+0,sp)
2057  0273 43            	cpl	a
2058  0274 c75218        	ld	21016,a
2059                     ; 769 }
2062  0277 85            	popw	x
2063  0278 81            	ret	
2227                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2227                     ; 792 {
2228                     	switch	.text
2229  0279               _I2C_GetITStatus:
2231  0279 89            	pushw	x
2232  027a 5204          	subw	sp,#4
2233       00000004      OFST:	set	4
2236                     ; 793   ITStatus bitstatus = RESET;
2238                     ; 794   __IO uint8_t enablestatus = 0;
2240  027c 0f03          	clr	(OFST-1,sp)
2242                     ; 795   uint16_t tempregister = 0;
2244                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2246                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2248  027e 9e            	ld	a,xh
2249  027f a407          	and	a,#7
2250  0281 5f            	clrw	x
2251  0282 97            	ld	xl,a
2252  0283 1f01          	ldw	(OFST-3,sp),x
2254                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2256  0285 c6521a        	ld	a,21018
2257  0288 1402          	and	a,(OFST-2,sp)
2258  028a 6b03          	ld	(OFST-1,sp),a
2260                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2262  028c 7b05          	ld	a,(OFST+1,sp)
2263  028e a430          	and	a,#48
2264  0290 97            	ld	xl,a
2265  0291 4f            	clr	a
2266  0292 02            	rlwa	x,a
2267  0293 a30100        	cpw	x,#256
2268  0296 260d          	jrne	L1701
2269                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2271  0298 c65217        	ld	a,21015
2272  029b 1506          	bcp	a,(OFST+2,sp)
2273  029d 2715          	jreq	L1011
2275  029f 0d03          	tnz	(OFST-1,sp)
2276  02a1 2711          	jreq	L1011
2277                     ; 811       bitstatus = SET;
2279  02a3 200b          	jp	LC005
2280                     ; 816       bitstatus = RESET;
2281  02a5               L1701:
2282                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2284  02a5 c65218        	ld	a,21016
2285  02a8 1506          	bcp	a,(OFST+2,sp)
2286  02aa 2708          	jreq	L1011
2288  02ac 0d03          	tnz	(OFST-1,sp)
2289  02ae 2704          	jreq	L1011
2290                     ; 825       bitstatus = SET;
2292  02b0               LC005:
2294  02b0 a601          	ld	a,#1
2297  02b2 2001          	jra	L7701
2298  02b4               L1011:
2299                     ; 830       bitstatus = RESET;
2302  02b4 4f            	clr	a
2304  02b5               L7701:
2305                     ; 834   return  bitstatus;
2309  02b5 5b06          	addw	sp,#6
2310  02b7 81            	ret	
2353                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2353                     ; 872 {
2354                     	switch	.text
2355  02b8               _I2C_ClearITPendingBit:
2357  02b8 89            	pushw	x
2358       00000002      OFST:	set	2
2361                     ; 873   uint16_t flagpos = 0;
2363                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2365                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2367  02b9 01            	rrwa	x,a
2368  02ba 5f            	clrw	x
2369  02bb 02            	rlwa	x,a
2370  02bc 1f01          	ldw	(OFST-1,sp),x
2372                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2374  02be 7b02          	ld	a,(OFST+0,sp)
2375  02c0 43            	cpl	a
2376  02c1 c75218        	ld	21016,a
2377                     ; 883 }
2380  02c4 85            	popw	x
2381  02c5 81            	ret	
2394                     	xdef	_I2C_ClearITPendingBit
2395                     	xdef	_I2C_GetITStatus
2396                     	xdef	_I2C_ClearFlag
2397                     	xdef	_I2C_GetFlagStatus
2398                     	xdef	_I2C_GetLastEvent
2399                     	xdef	_I2C_CheckEvent
2400                     	xdef	_I2C_SendData
2401                     	xdef	_I2C_Send7bitAddress
2402                     	xdef	_I2C_ReceiveData
2403                     	xdef	_I2C_ITConfig
2404                     	xdef	_I2C_FastModeDutyCycleConfig
2405                     	xdef	_I2C_AcknowledgeConfig
2406                     	xdef	_I2C_StretchClockCmd
2407                     	xdef	_I2C_SoftwareResetCmd
2408                     	xdef	_I2C_GenerateSTOP
2409                     	xdef	_I2C_GenerateSTART
2410                     	xdef	_I2C_GeneralCallCmd
2411                     	xdef	_I2C_Cmd
2412                     	xdef	_I2C_Init
2413                     	xdef	_I2C_DeInit
2414                     	xref.b	c_lreg
2415                     	xref.b	c_x
2434                     	xref	c_sdivx
2435                     	xref	c_ludv
2436                     	xref	c_rtol
2437                     	xref	c_smul
2438                     	xref	c_lmul
2439                     	xref	c_lcmp
2440                     	xref	c_ltor
2441                     	end
