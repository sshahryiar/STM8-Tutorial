   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
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
 246                     .const:	section	.text
 247  0000               L01:
 248  0000 000186a1      	dc.l	100001
 249                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 249                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 249                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 249                     ; 99 {
 250                     	switch	.text
 251  0025               _I2C_Init:
 253  0025 520d          	subw	sp,#13
 254       0000000d      OFST:	set	13
 257                     ; 100   uint16_t result = 0x0004;
 259                     ; 101   uint16_t tmpval = 0;
 261                     ; 102   uint8_t tmpccrh = 0;
 263  0027 0f0b          	clr	(OFST-2,sp)
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
 285  0034 1a19          	or	a,(OFST+12,sp)
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
 301  004a 1c0010        	addw	x,#OFST+3
 302  004d cd0000        	call	c_ltor
 304  0050 ae0000        	ldw	x,#L01
 305  0053 cd0000        	call	c_lcmp
 307  0056 2403          	jruge	L21
 308  0058 cc010b        	jp	L511
 309  005b               L21:
 310                     ; 131     tmpccrh = I2C_CCRH_FS;
 312  005b a680          	ld	a,#128
 313  005d 6b0b          	ld	(OFST-2,sp),a
 315                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 317  005f 0d16          	tnz	(OFST+9,sp)
 318  0061 2642          	jrne	L711
 319                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 321  0063 96            	ldw	x,sp
 322  0064 1c0010        	addw	x,#OFST+3
 323  0067 cd0000        	call	c_ltor
 325  006a a603          	ld	a,#3
 326  006c cd0000        	call	c_smul
 328  006f 96            	ldw	x,sp
 329  0070 1c0005        	addw	x,#OFST-8
 330  0073 cd0000        	call	c_rtol
 333  0076 7b19          	ld	a,(OFST+12,sp)
 334  0078 b703          	ld	c_lreg+3,a
 335  007a 3f02          	clr	c_lreg+2
 336  007c 3f01          	clr	c_lreg+1
 337  007e 3f00          	clr	c_lreg
 338  0080 96            	ldw	x,sp
 339  0081 1c0001        	addw	x,#OFST-12
 340  0084 cd0000        	call	c_rtol
 343  0087 ae4240        	ldw	x,#16960
 344  008a bf02          	ldw	c_lreg+2,x
 345  008c ae000f        	ldw	x,#15
 346  008f bf00          	ldw	c_lreg,x
 347  0091 96            	ldw	x,sp
 348  0092 1c0001        	addw	x,#OFST-12
 349  0095 cd0000        	call	c_lmul
 351  0098 96            	ldw	x,sp
 352  0099 1c0005        	addw	x,#OFST-8
 353  009c cd0000        	call	c_ludv
 355  009f be02          	ldw	x,c_lreg+2
 356  00a1 1f0c          	ldw	(OFST-1,sp),x
 359  00a3 2046          	jra	L121
 360  00a5               L711:
 361                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 363  00a5 96            	ldw	x,sp
 364  00a6 1c0010        	addw	x,#OFST+3
 365  00a9 cd0000        	call	c_ltor
 367  00ac a619          	ld	a,#25
 368  00ae cd0000        	call	c_smul
 370  00b1 96            	ldw	x,sp
 371  00b2 1c0005        	addw	x,#OFST-8
 372  00b5 cd0000        	call	c_rtol
 375  00b8 7b19          	ld	a,(OFST+12,sp)
 376  00ba b703          	ld	c_lreg+3,a
 377  00bc 3f02          	clr	c_lreg+2
 378  00be 3f01          	clr	c_lreg+1
 379  00c0 3f00          	clr	c_lreg
 380  00c2 96            	ldw	x,sp
 381  00c3 1c0001        	addw	x,#OFST-12
 382  00c6 cd0000        	call	c_rtol
 385  00c9 ae4240        	ldw	x,#16960
 386  00cc bf02          	ldw	c_lreg+2,x
 387  00ce ae000f        	ldw	x,#15
 388  00d1 bf00          	ldw	c_lreg,x
 389  00d3 96            	ldw	x,sp
 390  00d4 1c0001        	addw	x,#OFST-12
 391  00d7 cd0000        	call	c_lmul
 393  00da 96            	ldw	x,sp
 394  00db 1c0005        	addw	x,#OFST-8
 395  00de cd0000        	call	c_ludv
 397  00e1 be02          	ldw	x,c_lreg+2
 398  00e3 1f0c          	ldw	(OFST-1,sp),x
 400                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 402  00e5 7b0b          	ld	a,(OFST-2,sp)
 403  00e7 aa40          	or	a,#64
 404  00e9 6b0b          	ld	(OFST-2,sp),a
 406  00eb               L121:
 407                     ; 147     if (result < (uint16_t)0x01)
 409  00eb 1e0c          	ldw	x,(OFST-1,sp)
 410  00ed 2605          	jrne	L321
 411                     ; 150       result = (uint16_t)0x0001;
 413  00ef ae0001        	ldw	x,#1
 414  00f2 1f0c          	ldw	(OFST-1,sp),x
 416  00f4               L321:
 417                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 419  00f4 ae0003        	ldw	x,#3
 420  00f7 7b19          	ld	a,(OFST+12,sp)
 421  00f9 cd0000        	call	c_bmulx
 423  00fc a60a          	ld	a,#10
 424  00fe cd0000        	call	c_sdivx
 426  0101 5c            	incw	x
 427  0102 1f09          	ldw	(OFST-4,sp),x
 429                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 431  0104 7b0a          	ld	a,(OFST-3,sp)
 432  0106 c7521d        	ld	21021,a
 434  0109 2055          	jra	L521
 435  010b               L511:
 436                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 438  010b 96            	ldw	x,sp
 439  010c 1c0010        	addw	x,#OFST+3
 440  010f cd0000        	call	c_ltor
 442  0112 3803          	sll	c_lreg+3
 443  0114 3902          	rlc	c_lreg+2
 444  0116 3901          	rlc	c_lreg+1
 445  0118 3900          	rlc	c_lreg
 446  011a 96            	ldw	x,sp
 447  011b 1c0005        	addw	x,#OFST-8
 448  011e cd0000        	call	c_rtol
 451  0121 7b19          	ld	a,(OFST+12,sp)
 452  0123 b703          	ld	c_lreg+3,a
 453  0125 3f02          	clr	c_lreg+2
 454  0127 3f01          	clr	c_lreg+1
 455  0129 3f00          	clr	c_lreg
 456  012b 96            	ldw	x,sp
 457  012c 1c0001        	addw	x,#OFST-12
 458  012f cd0000        	call	c_rtol
 461  0132 ae4240        	ldw	x,#16960
 462  0135 bf02          	ldw	c_lreg+2,x
 463  0137 ae000f        	ldw	x,#15
 464  013a bf00          	ldw	c_lreg,x
 465  013c 96            	ldw	x,sp
 466  013d 1c0001        	addw	x,#OFST-12
 467  0140 cd0000        	call	c_lmul
 469  0143 96            	ldw	x,sp
 470  0144 1c0005        	addw	x,#OFST-8
 471  0147 cd0000        	call	c_ludv
 473  014a be02          	ldw	x,c_lreg+2
 474  014c 1f0c          	ldw	(OFST-1,sp),x
 476                     ; 167     if (result < (uint16_t)0x0004)
 478  014e 1e0c          	ldw	x,(OFST-1,sp)
 479  0150 a30004        	cpw	x,#4
 480  0153 2405          	jruge	L721
 481                     ; 170       result = (uint16_t)0x0004;
 483  0155 ae0004        	ldw	x,#4
 484  0158 1f0c          	ldw	(OFST-1,sp),x
 486  015a               L721:
 487                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 489  015a 7b19          	ld	a,(OFST+12,sp)
 490  015c 4c            	inc	a
 491  015d c7521d        	ld	21021,a
 492  0160               L521:
 493                     ; 181   I2C->CCRL = (uint8_t)result;
 495  0160 7b0d          	ld	a,(OFST+0,sp)
 496  0162 c7521b        	ld	21019,a
 497                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 499  0165 7b0c          	ld	a,(OFST-1,sp)
 500  0167 a40f          	and	a,#15
 501  0169 1a0b          	or	a,(OFST-2,sp)
 502  016b c7521c        	ld	21020,a
 503                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 505  016e 72105210      	bset	21008,#0
 506                     ; 188   I2C_AcknowledgeConfig(Ack);
 508  0172 7b17          	ld	a,(OFST+10,sp)
 509  0174 ad71          	call	_I2C_AcknowledgeConfig
 511                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 513  0176 7b15          	ld	a,(OFST+8,sp)
 514  0178 c75213        	ld	21011,a
 515                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 515                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 517  017b 1e14          	ldw	x,(OFST+7,sp)
 518  017d 4f            	clr	a
 519  017e 01            	rrwa	x,a
 520  017f 48            	sll	a
 521  0180 59            	rlcw	x
 522  0181 01            	rrwa	x,a
 523  0182 a406          	and	a,#6
 524  0184 5f            	clrw	x
 525  0185 6b08          	ld	(OFST-5,sp),a
 527  0187 7b18          	ld	a,(OFST+11,sp)
 528  0189 aa40          	or	a,#64
 529  018b 1a08          	or	a,(OFST-5,sp)
 530  018d c75214        	ld	21012,a
 531                     ; 194 }
 534  0190 5b0d          	addw	sp,#13
 535  0192 81            	ret
 590                     ; 202 void I2C_Cmd(FunctionalState NewState)
 590                     ; 203 {
 591                     	switch	.text
 592  0193               _I2C_Cmd:
 596                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 598                     ; 207   if (NewState != DISABLE)
 600  0193 4d            	tnz	a
 601  0194 2706          	jreq	L751
 602                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 604  0196 72105210      	bset	21008,#0
 606  019a 2004          	jra	L161
 607  019c               L751:
 608                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 610  019c 72115210      	bres	21008,#0
 611  01a0               L161:
 612                     ; 217 }
 615  01a0 81            	ret
 650                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 650                     ; 226 {
 651                     	switch	.text
 652  01a1               _I2C_GeneralCallCmd:
 656                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 658                     ; 230   if (NewState != DISABLE)
 660  01a1 4d            	tnz	a
 661  01a2 2706          	jreq	L102
 662                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 664  01a4 721c5210      	bset	21008,#6
 666  01a8 2004          	jra	L302
 667  01aa               L102:
 668                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 670  01aa 721d5210      	bres	21008,#6
 671  01ae               L302:
 672                     ; 240 }
 675  01ae 81            	ret
 710                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 710                     ; 251 {
 711                     	switch	.text
 712  01af               _I2C_GenerateSTART:
 716                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 718                     ; 255   if (NewState != DISABLE)
 720  01af 4d            	tnz	a
 721  01b0 2706          	jreq	L322
 722                     ; 258     I2C->CR2 |= I2C_CR2_START;
 724  01b2 72105211      	bset	21009,#0
 726  01b6 2004          	jra	L522
 727  01b8               L322:
 728                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 730  01b8 72115211      	bres	21009,#0
 731  01bc               L522:
 732                     ; 265 }
 735  01bc 81            	ret
 770                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 770                     ; 274 {
 771                     	switch	.text
 772  01bd               _I2C_GenerateSTOP:
 776                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 778                     ; 278   if (NewState != DISABLE)
 780  01bd 4d            	tnz	a
 781  01be 2706          	jreq	L542
 782                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 784  01c0 72125211      	bset	21009,#1
 786  01c4 2004          	jra	L742
 787  01c6               L542:
 788                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 790  01c6 72135211      	bres	21009,#1
 791  01ca               L742:
 792                     ; 288 }
 795  01ca 81            	ret
 831                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 831                     ; 297 {
 832                     	switch	.text
 833  01cb               _I2C_SoftwareResetCmd:
 837                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 839                     ; 301   if (NewState != DISABLE)
 841  01cb 4d            	tnz	a
 842  01cc 2706          	jreq	L762
 843                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 845  01ce 721e5211      	bset	21009,#7
 847  01d2 2004          	jra	L172
 848  01d4               L762:
 849                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 851  01d4 721f5211      	bres	21009,#7
 852  01d8               L172:
 853                     ; 311 }
 856  01d8 81            	ret
 892                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 892                     ; 321 {
 893                     	switch	.text
 894  01d9               _I2C_StretchClockCmd:
 898                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 900                     ; 325   if (NewState != DISABLE)
 902  01d9 4d            	tnz	a
 903  01da 2706          	jreq	L113
 904                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 906  01dc 721f5210      	bres	21008,#7
 908  01e0 2004          	jra	L313
 909  01e2               L113:
 910                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 912  01e2 721e5210      	bset	21008,#7
 913  01e6               L313:
 914                     ; 336 }
 917  01e6 81            	ret
 953                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 953                     ; 346 {
 954                     	switch	.text
 955  01e7               _I2C_AcknowledgeConfig:
 957  01e7 88            	push	a
 958       00000000      OFST:	set	0
 961                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 963                     ; 350   if (Ack == I2C_ACK_NONE)
 965  01e8 4d            	tnz	a
 966  01e9 2606          	jrne	L333
 967                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 969  01eb 72155211      	bres	21009,#2
 971  01ef 2014          	jra	L533
 972  01f1               L333:
 973                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 975  01f1 72145211      	bset	21009,#2
 976                     ; 360     if (Ack == I2C_ACK_CURR)
 978  01f5 7b01          	ld	a,(OFST+1,sp)
 979  01f7 a101          	cp	a,#1
 980  01f9 2606          	jrne	L733
 981                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 983  01fb 72175211      	bres	21009,#3
 985  01ff 2004          	jra	L533
 986  0201               L733:
 987                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 989  0201 72165211      	bset	21009,#3
 990  0205               L533:
 991                     ; 371 }
 994  0205 84            	pop	a
 995  0206 81            	ret
1067                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1067                     ; 382 {
1068                     	switch	.text
1069  0207               _I2C_ITConfig:
1071  0207 89            	pushw	x
1072       00000000      OFST:	set	0
1075                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1077                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1079                     ; 387   if (NewState != DISABLE)
1081  0208 9f            	ld	a,xl
1082  0209 4d            	tnz	a
1083  020a 2709          	jreq	L773
1084                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1086  020c 9e            	ld	a,xh
1087  020d ca521a        	or	a,21018
1088  0210 c7521a        	ld	21018,a
1090  0213 2009          	jra	L104
1091  0215               L773:
1092                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1094  0215 7b01          	ld	a,(OFST+1,sp)
1095  0217 43            	cpl	a
1096  0218 c4521a        	and	a,21018
1097  021b c7521a        	ld	21018,a
1098  021e               L104:
1099                     ; 397 }
1102  021e 85            	popw	x
1103  021f 81            	ret
1139                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1139                     ; 406 {
1140                     	switch	.text
1141  0220               _I2C_FastModeDutyCycleConfig:
1145                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1147                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1149  0220 a140          	cp	a,#64
1150  0222 2606          	jrne	L124
1151                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1153  0224 721c521c      	bset	21020,#6
1155  0228 2004          	jra	L324
1156  022a               L124:
1157                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1159  022a 721d521c      	bres	21020,#6
1160  022e               L324:
1161                     ; 420 }
1164  022e 81            	ret
1187                     ; 427 uint8_t I2C_ReceiveData(void)
1187                     ; 428 {
1188                     	switch	.text
1189  022f               _I2C_ReceiveData:
1193                     ; 430   return ((uint8_t)I2C->DR);
1195  022f c65216        	ld	a,21014
1198  0232 81            	ret
1261                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1261                     ; 441 {
1262                     	switch	.text
1263  0233               _I2C_Send7bitAddress:
1265  0233 89            	pushw	x
1266       00000000      OFST:	set	0
1269                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1271                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1273                     ; 447   Address &= (uint8_t)0xFE;
1275  0234 7b01          	ld	a,(OFST+1,sp)
1276  0236 a4fe          	and	a,#254
1277  0238 6b01          	ld	(OFST+1,sp),a
1278                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1280  023a 7b01          	ld	a,(OFST+1,sp)
1281  023c 1a02          	or	a,(OFST+2,sp)
1282  023e c75216        	ld	21014,a
1283                     ; 451 }
1286  0241 85            	popw	x
1287  0242 81            	ret
1319                     ; 458 void I2C_SendData(uint8_t Data)
1319                     ; 459 {
1320                     	switch	.text
1321  0243               _I2C_SendData:
1325                     ; 461   I2C->DR = Data;
1327  0243 c75216        	ld	21014,a
1328                     ; 462 }
1331  0246 81            	ret
1551                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1551                     ; 579 {
1552                     	switch	.text
1553  0247               _I2C_CheckEvent:
1555  0247 89            	pushw	x
1556  0248 5206          	subw	sp,#6
1557       00000006      OFST:	set	6
1560                     ; 580   __IO uint16_t lastevent = 0x00;
1562  024a 5f            	clrw	x
1563  024b 1f04          	ldw	(OFST-2,sp),x
1565                     ; 581   uint8_t flag1 = 0x00 ;
1567                     ; 582   uint8_t flag2 = 0x00;
1569                     ; 583   ErrorStatus status = ERROR;
1571                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1573                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1575  024d 1e07          	ldw	x,(OFST+1,sp)
1576  024f a30004        	cpw	x,#4
1577  0252 260b          	jrne	L506
1578                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1580  0254 c65218        	ld	a,21016
1581  0257 a404          	and	a,#4
1582  0259 5f            	clrw	x
1583  025a 97            	ld	xl,a
1584  025b 1f04          	ldw	(OFST-2,sp),x
1587  025d 201f          	jra	L706
1588  025f               L506:
1589                     ; 594     flag1 = I2C->SR1;
1591  025f c65217        	ld	a,21015
1592  0262 6b03          	ld	(OFST-3,sp),a
1594                     ; 595     flag2 = I2C->SR3;
1596  0264 c65219        	ld	a,21017
1597  0267 6b06          	ld	(OFST+0,sp),a
1599                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1601  0269 7b03          	ld	a,(OFST-3,sp)
1602  026b 5f            	clrw	x
1603  026c 97            	ld	xl,a
1604  026d 1f01          	ldw	(OFST-5,sp),x
1606  026f 7b06          	ld	a,(OFST+0,sp)
1607  0271 5f            	clrw	x
1608  0272 97            	ld	xl,a
1609  0273 4f            	clr	a
1610  0274 02            	rlwa	x,a
1611  0275 01            	rrwa	x,a
1612  0276 1a02          	or	a,(OFST-4,sp)
1613  0278 01            	rrwa	x,a
1614  0279 1a01          	or	a,(OFST-5,sp)
1615  027b 01            	rrwa	x,a
1616  027c 1f04          	ldw	(OFST-2,sp),x
1618  027e               L706:
1619                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1621  027e 1e04          	ldw	x,(OFST-2,sp)
1622  0280 01            	rrwa	x,a
1623  0281 1408          	and	a,(OFST+2,sp)
1624  0283 01            	rrwa	x,a
1625  0284 1407          	and	a,(OFST+1,sp)
1626  0286 01            	rrwa	x,a
1627  0287 1307          	cpw	x,(OFST+1,sp)
1628  0289 2606          	jrne	L116
1629                     ; 602     status = SUCCESS;
1631  028b a601          	ld	a,#1
1632  028d 6b06          	ld	(OFST+0,sp),a
1635  028f 2002          	jra	L316
1636  0291               L116:
1637                     ; 607     status = ERROR;
1639  0291 0f06          	clr	(OFST+0,sp)
1641  0293               L316:
1642                     ; 611   return status;
1644  0293 7b06          	ld	a,(OFST+0,sp)
1647  0295 5b08          	addw	sp,#8
1648  0297 81            	ret
1697                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1697                     ; 629 {
1698                     	switch	.text
1699  0298               _I2C_GetLastEvent:
1701  0298 5206          	subw	sp,#6
1702       00000006      OFST:	set	6
1705                     ; 630   __IO uint16_t lastevent = 0;
1707  029a 5f            	clrw	x
1708  029b 1f05          	ldw	(OFST-1,sp),x
1710                     ; 631   uint16_t flag1 = 0;
1712                     ; 632   uint16_t flag2 = 0;
1714                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1716  029d c65218        	ld	a,21016
1717  02a0 a504          	bcp	a,#4
1718  02a2 2707          	jreq	L736
1719                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1721  02a4 ae0004        	ldw	x,#4
1722  02a7 1f05          	ldw	(OFST-1,sp),x
1725  02a9 201b          	jra	L146
1726  02ab               L736:
1727                     ; 641     flag1 = I2C->SR1;
1729  02ab c65217        	ld	a,21015
1730  02ae 5f            	clrw	x
1731  02af 97            	ld	xl,a
1732  02b0 1f01          	ldw	(OFST-5,sp),x
1734                     ; 642     flag2 = I2C->SR3;
1736  02b2 c65219        	ld	a,21017
1737  02b5 5f            	clrw	x
1738  02b6 97            	ld	xl,a
1739  02b7 1f03          	ldw	(OFST-3,sp),x
1741                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1743  02b9 1e03          	ldw	x,(OFST-3,sp)
1744  02bb 4f            	clr	a
1745  02bc 02            	rlwa	x,a
1746  02bd 01            	rrwa	x,a
1747  02be 1a02          	or	a,(OFST-4,sp)
1748  02c0 01            	rrwa	x,a
1749  02c1 1a01          	or	a,(OFST-5,sp)
1750  02c3 01            	rrwa	x,a
1751  02c4 1f05          	ldw	(OFST-1,sp),x
1753  02c6               L146:
1754                     ; 648   return (I2C_Event_TypeDef)lastevent;
1756  02c6 1e05          	ldw	x,(OFST-1,sp)
1759  02c8 5b06          	addw	sp,#6
1760  02ca 81            	ret
1971                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1971                     ; 680 {
1972                     	switch	.text
1973  02cb               _I2C_GetFlagStatus:
1975  02cb 89            	pushw	x
1976  02cc 89            	pushw	x
1977       00000002      OFST:	set	2
1980                     ; 681   uint8_t tempreg = 0;
1982  02cd 0f02          	clr	(OFST+0,sp)
1984                     ; 682   uint8_t regindex = 0;
1986                     ; 683   FlagStatus bitstatus = RESET;
1988                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1990                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1992  02cf 9e            	ld	a,xh
1993  02d0 6b01          	ld	(OFST-1,sp),a
1995                     ; 691   switch (regindex)
1997  02d2 7b01          	ld	a,(OFST-1,sp)
1999                     ; 708     default:
1999                     ; 709       break;
2000  02d4 4a            	dec	a
2001  02d5 2708          	jreq	L346
2002  02d7 4a            	dec	a
2003  02d8 270c          	jreq	L546
2004  02da 4a            	dec	a
2005  02db 2710          	jreq	L746
2006  02dd 2013          	jra	L757
2007  02df               L346:
2008                     ; 694     case 0x01:
2008                     ; 695       tempreg = (uint8_t)I2C->SR1;
2010  02df c65217        	ld	a,21015
2011  02e2 6b02          	ld	(OFST+0,sp),a
2013                     ; 696       break;
2015  02e4 200c          	jra	L757
2016  02e6               L546:
2017                     ; 699     case 0x02:
2017                     ; 700       tempreg = (uint8_t)I2C->SR2;
2019  02e6 c65218        	ld	a,21016
2020  02e9 6b02          	ld	(OFST+0,sp),a
2022                     ; 701       break;
2024  02eb 2005          	jra	L757
2025  02ed               L746:
2026                     ; 704     case 0x03:
2026                     ; 705       tempreg = (uint8_t)I2C->SR3;
2028  02ed c65219        	ld	a,21017
2029  02f0 6b02          	ld	(OFST+0,sp),a
2031                     ; 706       break;
2033  02f2               L156:
2034                     ; 708     default:
2034                     ; 709       break;
2036  02f2               L757:
2037                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2039  02f2 7b04          	ld	a,(OFST+2,sp)
2040  02f4 1502          	bcp	a,(OFST+0,sp)
2041  02f6 2706          	jreq	L167
2042                     ; 716     bitstatus = SET;
2044  02f8 a601          	ld	a,#1
2045  02fa 6b02          	ld	(OFST+0,sp),a
2048  02fc 2002          	jra	L367
2049  02fe               L167:
2050                     ; 721     bitstatus = RESET;
2052  02fe 0f02          	clr	(OFST+0,sp)
2054  0300               L367:
2055                     ; 724   return bitstatus;
2057  0300 7b02          	ld	a,(OFST+0,sp)
2060  0302 5b04          	addw	sp,#4
2061  0304 81            	ret
2103                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2103                     ; 760 {
2104                     	switch	.text
2105  0305               _I2C_ClearFlag:
2107  0305 89            	pushw	x
2108       00000002      OFST:	set	2
2111                     ; 761   uint16_t flagpos = 0;
2113                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2115                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2117  0306 01            	rrwa	x,a
2118  0307 a4ff          	and	a,#255
2119  0309 5f            	clrw	x
2120  030a 02            	rlwa	x,a
2121  030b 1f01          	ldw	(OFST-1,sp),x
2122  030d 01            	rrwa	x,a
2124                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2126  030e 7b02          	ld	a,(OFST+0,sp)
2127  0310 43            	cpl	a
2128  0311 c75218        	ld	21016,a
2129                     ; 769 }
2132  0314 85            	popw	x
2133  0315 81            	ret
2297                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2297                     ; 792 {
2298                     	switch	.text
2299  0316               _I2C_GetITStatus:
2301  0316 89            	pushw	x
2302  0317 5204          	subw	sp,#4
2303       00000004      OFST:	set	4
2306                     ; 793   ITStatus bitstatus = RESET;
2308                     ; 794   __IO uint8_t enablestatus = 0;
2310  0319 0f03          	clr	(OFST-1,sp)
2312                     ; 795   uint16_t tempregister = 0;
2314                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2316                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2318  031b 9e            	ld	a,xh
2319  031c a407          	and	a,#7
2320  031e 5f            	clrw	x
2321  031f 97            	ld	xl,a
2322  0320 1f01          	ldw	(OFST-3,sp),x
2324                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2326  0322 c6521a        	ld	a,21018
2327  0325 1402          	and	a,(OFST-2,sp)
2328  0327 6b03          	ld	(OFST-1,sp),a
2330                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2332  0329 7b05          	ld	a,(OFST+1,sp)
2333  032b 97            	ld	xl,a
2334  032c 7b06          	ld	a,(OFST+2,sp)
2335  032e 9f            	ld	a,xl
2336  032f a430          	and	a,#48
2337  0331 97            	ld	xl,a
2338  0332 4f            	clr	a
2339  0333 02            	rlwa	x,a
2340  0334 a30100        	cpw	x,#256
2341  0337 2615          	jrne	L1701
2342                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2344  0339 c65217        	ld	a,21015
2345  033c 1506          	bcp	a,(OFST+2,sp)
2346  033e 270a          	jreq	L3701
2348  0340 0d03          	tnz	(OFST-1,sp)
2349  0342 2706          	jreq	L3701
2350                     ; 811       bitstatus = SET;
2352  0344 a601          	ld	a,#1
2353  0346 6b04          	ld	(OFST+0,sp),a
2356  0348 2017          	jra	L7701
2357  034a               L3701:
2358                     ; 816       bitstatus = RESET;
2360  034a 0f04          	clr	(OFST+0,sp)
2362  034c 2013          	jra	L7701
2363  034e               L1701:
2364                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2366  034e c65218        	ld	a,21016
2367  0351 1506          	bcp	a,(OFST+2,sp)
2368  0353 270a          	jreq	L1011
2370  0355 0d03          	tnz	(OFST-1,sp)
2371  0357 2706          	jreq	L1011
2372                     ; 825       bitstatus = SET;
2374  0359 a601          	ld	a,#1
2375  035b 6b04          	ld	(OFST+0,sp),a
2378  035d 2002          	jra	L7701
2379  035f               L1011:
2380                     ; 830       bitstatus = RESET;
2382  035f 0f04          	clr	(OFST+0,sp)
2384  0361               L7701:
2385                     ; 834   return  bitstatus;
2387  0361 7b04          	ld	a,(OFST+0,sp)
2390  0363 5b06          	addw	sp,#6
2391  0365 81            	ret
2434                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2434                     ; 872 {
2435                     	switch	.text
2436  0366               _I2C_ClearITPendingBit:
2438  0366 89            	pushw	x
2439       00000002      OFST:	set	2
2442                     ; 873   uint16_t flagpos = 0;
2444                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2446                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2448  0367 01            	rrwa	x,a
2449  0368 a4ff          	and	a,#255
2450  036a 5f            	clrw	x
2451  036b 02            	rlwa	x,a
2452  036c 1f01          	ldw	(OFST-1,sp),x
2453  036e 01            	rrwa	x,a
2455                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2457  036f 7b02          	ld	a,(OFST+0,sp)
2458  0371 43            	cpl	a
2459  0372 c75218        	ld	21016,a
2460                     ; 883 }
2463  0375 85            	popw	x
2464  0376 81            	ret
2477                     	xdef	_I2C_ClearITPendingBit
2478                     	xdef	_I2C_GetITStatus
2479                     	xdef	_I2C_ClearFlag
2480                     	xdef	_I2C_GetFlagStatus
2481                     	xdef	_I2C_GetLastEvent
2482                     	xdef	_I2C_CheckEvent
2483                     	xdef	_I2C_SendData
2484                     	xdef	_I2C_Send7bitAddress
2485                     	xdef	_I2C_ReceiveData
2486                     	xdef	_I2C_ITConfig
2487                     	xdef	_I2C_FastModeDutyCycleConfig
2488                     	xdef	_I2C_AcknowledgeConfig
2489                     	xdef	_I2C_StretchClockCmd
2490                     	xdef	_I2C_SoftwareResetCmd
2491                     	xdef	_I2C_GenerateSTOP
2492                     	xdef	_I2C_GenerateSTART
2493                     	xdef	_I2C_GeneralCallCmd
2494                     	xdef	_I2C_Cmd
2495                     	xdef	_I2C_Init
2496                     	xdef	_I2C_DeInit
2497                     	xref.b	c_lreg
2498                     	xref.b	c_x
2517                     	xref	c_sdivx
2518                     	xref	c_bmulx
2519                     	xref	c_ludv
2520                     	xref	c_smul
2521                     	xref	c_lmul
2522                     	xref	c_rtol
2523                     	xref	c_lcmp
2524                     	xref	c_ltor
2525                     	end
