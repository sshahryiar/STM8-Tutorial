   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 58 void TIM1_DeInit(void)
  42                     ; 59 {
  44                     	switch	.text
  45  0000               _TIM1_DeInit:
  49                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  51  0000 725f5250      	clr	21072
  52                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  54  0004 725f5251      	clr	21073
  55                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  57  0008 725f5252      	clr	21074
  58                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  60  000c 725f5253      	clr	21075
  61                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  63  0010 725f5254      	clr	21076
  64                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  66  0014 725f5256      	clr	21078
  67                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  69  0018 725f525c      	clr	21084
  70                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  72  001c 725f525d      	clr	21085
  73                     ; 70   TIM1->CCMR1 = 0x01;
  75  0020 35015258      	mov	21080,#1
  76                     ; 71   TIM1->CCMR2 = 0x01;
  78  0024 35015259      	mov	21081,#1
  79                     ; 72   TIM1->CCMR3 = 0x01;
  81  0028 3501525a      	mov	21082,#1
  82                     ; 73   TIM1->CCMR4 = 0x01;
  84  002c 3501525b      	mov	21083,#1
  85                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  87  0030 725f525c      	clr	21084
  88                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  90  0034 725f525d      	clr	21085
  91                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  93  0038 725f5258      	clr	21080
  94                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  96  003c 725f5259      	clr	21081
  97                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  99  0040 725f525a      	clr	21082
 100                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 102  0044 725f525b      	clr	21083
 103                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 105  0048 725f525e      	clr	21086
 106                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 108  004c 725f525f      	clr	21087
 109                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 111  0050 725f5260      	clr	21088
 112                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 114  0054 725f5261      	clr	21089
 115                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 117  0058 35ff5262      	mov	21090,#255
 118                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 120  005c 35ff5263      	mov	21091,#255
 121                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 123  0060 725f5265      	clr	21093
 124                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 126  0064 725f5266      	clr	21094
 127                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 129  0068 725f5267      	clr	21095
 130                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 132  006c 725f5268      	clr	21096
 133                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 135  0070 725f5269      	clr	21097
 136                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 138  0074 725f526a      	clr	21098
 139                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 141  0078 725f526b      	clr	21099
 142                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 144  007c 725f526c      	clr	21100
 145                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 147  0080 725f526f      	clr	21103
 148                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 150  0084 35015257      	mov	21079,#1
 151                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 153  0088 725f526e      	clr	21102
 154                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 156  008c 725f526d      	clr	21101
 157                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 159  0090 725f5264      	clr	21092
 160                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 162  0094 725f5255      	clr	21077
 163                     ; 101 }
 166  0098 81            	ret
 269                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 269                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 269                     ; 113                        uint16_t TIM1_Period,
 269                     ; 114                        uint8_t TIM1_RepetitionCounter)
 269                     ; 115 {
 270                     	switch	.text
 271  0099               _TIM1_TimeBaseInit:
 273  0099 89            	pushw	x
 274       00000000      OFST:	set	0
 277                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 279                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 281  009a 7b06          	ld	a,(OFST+6,sp)
 282  009c c75262        	ld	21090,a
 283                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 285  009f 7b07          	ld	a,(OFST+7,sp)
 286  00a1 c75263        	ld	21091,a
 287                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 289  00a4 9e            	ld	a,xh
 290  00a5 c75260        	ld	21088,a
 291                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 293  00a8 9f            	ld	a,xl
 294  00a9 c75261        	ld	21089,a
 295                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 295                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 297  00ac c65250        	ld	a,21072
 298  00af a48f          	and	a,#143
 299  00b1 1a05          	or	a,(OFST+5,sp)
 300  00b3 c75250        	ld	21072,a
 301                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 303  00b6 7b08          	ld	a,(OFST+8,sp)
 304  00b8 c75264        	ld	21092,a
 305                     ; 133 }
 308  00bb 85            	popw	x
 309  00bc 81            	ret
 592                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 592                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 592                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 592                     ; 157                   uint16_t TIM1_Pulse,
 592                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 592                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 592                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 592                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 592                     ; 162 {
 593                     	switch	.text
 594  00bd               _TIM1_OC1Init:
 596  00bd 89            	pushw	x
 597  00be 5203          	subw	sp,#3
 598       00000003      OFST:	set	3
 601                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 603                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 605                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 607                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 609                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 611                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 613                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 615                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 615                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 617  00c0 c6525c        	ld	a,21084
 618  00c3 a4f0          	and	a,#240
 619  00c5 c7525c        	ld	21084,a
 620                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 620                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 620                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 620                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 622  00c8 7b0c          	ld	a,(OFST+9,sp)
 623  00ca a408          	and	a,#8
 624  00cc 6b03          	ld	(OFST+0,sp),a
 626  00ce 7b0b          	ld	a,(OFST+8,sp)
 627  00d0 a402          	and	a,#2
 628  00d2 1a03          	or	a,(OFST+0,sp)
 629  00d4 6b02          	ld	(OFST-1,sp),a
 631  00d6 7b08          	ld	a,(OFST+5,sp)
 632  00d8 a404          	and	a,#4
 633  00da 6b01          	ld	(OFST-2,sp),a
 635  00dc 9f            	ld	a,xl
 636  00dd a401          	and	a,#1
 637  00df 1a01          	or	a,(OFST-2,sp)
 638  00e1 1a02          	or	a,(OFST-1,sp)
 639  00e3 ca525c        	or	a,21084
 640  00e6 c7525c        	ld	21084,a
 641                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 641                     ; 185                           (uint8_t)TIM1_OCMode);
 643  00e9 c65258        	ld	a,21080
 644  00ec a48f          	and	a,#143
 645  00ee 1a04          	or	a,(OFST+1,sp)
 646  00f0 c75258        	ld	21080,a
 647                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 649  00f3 c6526f        	ld	a,21103
 650  00f6 a4fc          	and	a,#252
 651  00f8 c7526f        	ld	21103,a
 652                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 652                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 654  00fb 7b0e          	ld	a,(OFST+11,sp)
 655  00fd a402          	and	a,#2
 656  00ff 6b03          	ld	(OFST+0,sp),a
 658  0101 7b0d          	ld	a,(OFST+10,sp)
 659  0103 a401          	and	a,#1
 660  0105 1a03          	or	a,(OFST+0,sp)
 661  0107 ca526f        	or	a,21103
 662  010a c7526f        	ld	21103,a
 663                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 665  010d 7b09          	ld	a,(OFST+6,sp)
 666  010f c75265        	ld	21093,a
 667                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 669  0112 7b0a          	ld	a,(OFST+7,sp)
 670  0114 c75266        	ld	21094,a
 671                     ; 196 }
 674  0117 5b05          	addw	sp,#5
 675  0119 81            	ret
 777                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 777                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 777                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 777                     ; 220                   uint16_t TIM1_Pulse,
 777                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 777                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 777                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 777                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 777                     ; 225 {
 778                     	switch	.text
 779  011a               _TIM1_OC2Init:
 781  011a 89            	pushw	x
 782  011b 5203          	subw	sp,#3
 783       00000003      OFST:	set	3
 786                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 788                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 790                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 792                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 794                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 796                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 798                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 800                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 800                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 802  011d c6525c        	ld	a,21084
 803  0120 a40f          	and	a,#15
 804  0122 c7525c        	ld	21084,a
 805                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 805                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 805                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 805                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 807  0125 7b0c          	ld	a,(OFST+9,sp)
 808  0127 a480          	and	a,#128
 809  0129 6b03          	ld	(OFST+0,sp),a
 811  012b 7b0b          	ld	a,(OFST+8,sp)
 812  012d a420          	and	a,#32
 813  012f 1a03          	or	a,(OFST+0,sp)
 814  0131 6b02          	ld	(OFST-1,sp),a
 816  0133 7b08          	ld	a,(OFST+5,sp)
 817  0135 a440          	and	a,#64
 818  0137 6b01          	ld	(OFST-2,sp),a
 820  0139 9f            	ld	a,xl
 821  013a a410          	and	a,#16
 822  013c 1a01          	or	a,(OFST-2,sp)
 823  013e 1a02          	or	a,(OFST-1,sp)
 824  0140 ca525c        	or	a,21084
 825  0143 c7525c        	ld	21084,a
 826                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 826                     ; 249                           (uint8_t)TIM1_OCMode);
 828  0146 c65259        	ld	a,21081
 829  0149 a48f          	and	a,#143
 830  014b 1a04          	or	a,(OFST+1,sp)
 831  014d c75259        	ld	21081,a
 832                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 834  0150 c6526f        	ld	a,21103
 835  0153 a4f3          	and	a,#243
 836  0155 c7526f        	ld	21103,a
 837                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 837                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 839  0158 7b0e          	ld	a,(OFST+11,sp)
 840  015a a408          	and	a,#8
 841  015c 6b03          	ld	(OFST+0,sp),a
 843  015e 7b0d          	ld	a,(OFST+10,sp)
 844  0160 a404          	and	a,#4
 845  0162 1a03          	or	a,(OFST+0,sp)
 846  0164 ca526f        	or	a,21103
 847  0167 c7526f        	ld	21103,a
 848                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 850  016a 7b09          	ld	a,(OFST+6,sp)
 851  016c c75267        	ld	21095,a
 852                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 854  016f 7b0a          	ld	a,(OFST+7,sp)
 855  0171 c75268        	ld	21096,a
 856                     ; 260 }
 859  0174 5b05          	addw	sp,#5
 860  0176 81            	ret
 962                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 962                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 962                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 962                     ; 284                   uint16_t TIM1_Pulse,
 962                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 962                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 962                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 962                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 962                     ; 289 {
 963                     	switch	.text
 964  0177               _TIM1_OC3Init:
 966  0177 89            	pushw	x
 967  0178 5203          	subw	sp,#3
 968       00000003      OFST:	set	3
 971                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 973                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 975                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 977                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 979                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 981                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 983                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 985                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 985                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 987  017a c6525d        	ld	a,21085
 988  017d a4f0          	and	a,#240
 989  017f c7525d        	ld	21085,a
 990                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 990                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 990                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 990                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 992  0182 7b0c          	ld	a,(OFST+9,sp)
 993  0184 a408          	and	a,#8
 994  0186 6b03          	ld	(OFST+0,sp),a
 996  0188 7b0b          	ld	a,(OFST+8,sp)
 997  018a a402          	and	a,#2
 998  018c 1a03          	or	a,(OFST+0,sp)
 999  018e 6b02          	ld	(OFST-1,sp),a
1001  0190 7b08          	ld	a,(OFST+5,sp)
1002  0192 a404          	and	a,#4
1003  0194 6b01          	ld	(OFST-2,sp),a
1005  0196 9f            	ld	a,xl
1006  0197 a401          	and	a,#1
1007  0199 1a01          	or	a,(OFST-2,sp)
1008  019b 1a02          	or	a,(OFST-1,sp)
1009  019d ca525d        	or	a,21085
1010  01a0 c7525d        	ld	21085,a
1011                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1011                     ; 312                           (uint8_t)TIM1_OCMode);
1013  01a3 c6525a        	ld	a,21082
1014  01a6 a48f          	and	a,#143
1015  01a8 1a04          	or	a,(OFST+1,sp)
1016  01aa c7525a        	ld	21082,a
1017                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1019  01ad c6526f        	ld	a,21103
1020  01b0 a4cf          	and	a,#207
1021  01b2 c7526f        	ld	21103,a
1022                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1022                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1024  01b5 7b0e          	ld	a,(OFST+11,sp)
1025  01b7 a420          	and	a,#32
1026  01b9 6b03          	ld	(OFST+0,sp),a
1028  01bb 7b0d          	ld	a,(OFST+10,sp)
1029  01bd a410          	and	a,#16
1030  01bf 1a03          	or	a,(OFST+0,sp)
1031  01c1 ca526f        	or	a,21103
1032  01c4 c7526f        	ld	21103,a
1033                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1035  01c7 7b09          	ld	a,(OFST+6,sp)
1036  01c9 c75269        	ld	21097,a
1037                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1039  01cc 7b0a          	ld	a,(OFST+7,sp)
1040  01ce c7526a        	ld	21098,a
1041                     ; 323 }
1044  01d1 5b05          	addw	sp,#5
1045  01d3 81            	ret
1117                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1117                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1117                     ; 340                   uint16_t TIM1_Pulse,
1117                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1117                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1117                     ; 343 {
1118                     	switch	.text
1119  01d4               _TIM1_OC4Init:
1121  01d4 89            	pushw	x
1122  01d5 88            	push	a
1123       00000001      OFST:	set	1
1126                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1128                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1130                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1132                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1134                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1136  01d6 c6525d        	ld	a,21085
1137  01d9 a4cf          	and	a,#207
1138  01db c7525d        	ld	21085,a
1139                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1139                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1141  01de 7b08          	ld	a,(OFST+7,sp)
1142  01e0 a420          	and	a,#32
1143  01e2 6b01          	ld	(OFST+0,sp),a
1145  01e4 9f            	ld	a,xl
1146  01e5 a410          	and	a,#16
1147  01e7 1a01          	or	a,(OFST+0,sp)
1148  01e9 ca525d        	or	a,21085
1149  01ec c7525d        	ld	21085,a
1150                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1150                     ; 358                           TIM1_OCMode);
1152  01ef c6525b        	ld	a,21083
1153  01f2 a48f          	and	a,#143
1154  01f4 1a02          	or	a,(OFST+1,sp)
1155  01f6 c7525b        	ld	21083,a
1156                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1158  01f9 0d09          	tnz	(OFST+8,sp)
1159  01fb 270a          	jreq	L714
1160                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1162  01fd c6526f        	ld	a,21103
1163  0200 aadf          	or	a,#223
1164  0202 c7526f        	ld	21103,a
1166  0205 2004          	jra	L124
1167  0207               L714:
1168                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1170  0207 721d526f      	bres	21103,#6
1171  020b               L124:
1172                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1174  020b 7b06          	ld	a,(OFST+5,sp)
1175  020d c7526b        	ld	21099,a
1176                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1178  0210 7b07          	ld	a,(OFST+6,sp)
1179  0212 c7526c        	ld	21100,a
1180                     ; 373 }
1183  0215 5b03          	addw	sp,#3
1184  0217 81            	ret
1387                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1387                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1387                     ; 390                      uint8_t TIM1_DeadTime,
1387                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1387                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1387                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1387                     ; 394 {
1388                     	switch	.text
1389  0218               _TIM1_BDTRConfig:
1391  0218 89            	pushw	x
1392  0219 88            	push	a
1393       00000001      OFST:	set	1
1396                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1398                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1400                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1402                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1404                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1406                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1408  021a 7b06          	ld	a,(OFST+5,sp)
1409  021c c7526e        	ld	21102,a
1410                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1410                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1410                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1412  021f 7b07          	ld	a,(OFST+6,sp)
1413  0221 1a08          	or	a,(OFST+7,sp)
1414  0223 1a09          	or	a,(OFST+8,sp)
1415  0225 6b01          	ld	(OFST+0,sp),a
1417  0227 9f            	ld	a,xl
1418  0228 1a02          	or	a,(OFST+1,sp)
1419  022a 1a01          	or	a,(OFST+0,sp)
1420  022c c7526d        	ld	21101,a
1421                     ; 409 }
1424  022f 5b03          	addw	sp,#3
1425  0231 81            	ret
1625                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1625                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1625                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1625                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1625                     ; 427                  uint8_t TIM1_ICFilter)
1625                     ; 428 {
1626                     	switch	.text
1627  0232               _TIM1_ICInit:
1629  0232 89            	pushw	x
1630       00000000      OFST:	set	0
1633                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1635                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1637                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1639                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1641                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1643                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1645  0233 9e            	ld	a,xh
1646  0234 4d            	tnz	a
1647  0235 2614          	jrne	L546
1648                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1648                     ; 440                (uint8_t)TIM1_ICSelection,
1648                     ; 441                (uint8_t)TIM1_ICFilter);
1650  0237 7b07          	ld	a,(OFST+7,sp)
1651  0239 88            	push	a
1652  023a 7b06          	ld	a,(OFST+6,sp)
1653  023c 97            	ld	xl,a
1654  023d 7b03          	ld	a,(OFST+3,sp)
1655  023f 95            	ld	xh,a
1656  0240 cd080e        	call	L3_TI1_Config
1658  0243 84            	pop	a
1659                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1661  0244 7b06          	ld	a,(OFST+6,sp)
1662  0246 cd06b6        	call	_TIM1_SetIC1Prescaler
1665  0249 2046          	jra	L746
1666  024b               L546:
1667                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1669  024b 7b01          	ld	a,(OFST+1,sp)
1670  024d a101          	cp	a,#1
1671  024f 2614          	jrne	L156
1672                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1672                     ; 449                (uint8_t)TIM1_ICSelection,
1672                     ; 450                (uint8_t)TIM1_ICFilter);
1674  0251 7b07          	ld	a,(OFST+7,sp)
1675  0253 88            	push	a
1676  0254 7b06          	ld	a,(OFST+6,sp)
1677  0256 97            	ld	xl,a
1678  0257 7b03          	ld	a,(OFST+3,sp)
1679  0259 95            	ld	xh,a
1680  025a cd083e        	call	L5_TI2_Config
1682  025d 84            	pop	a
1683                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1685  025e 7b06          	ld	a,(OFST+6,sp)
1686  0260 cd06c3        	call	_TIM1_SetIC2Prescaler
1689  0263 202c          	jra	L746
1690  0265               L156:
1691                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1693  0265 7b01          	ld	a,(OFST+1,sp)
1694  0267 a102          	cp	a,#2
1695  0269 2614          	jrne	L556
1696                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1696                     ; 458                (uint8_t)TIM1_ICSelection,
1696                     ; 459                (uint8_t)TIM1_ICFilter);
1698  026b 7b07          	ld	a,(OFST+7,sp)
1699  026d 88            	push	a
1700  026e 7b06          	ld	a,(OFST+6,sp)
1701  0270 97            	ld	xl,a
1702  0271 7b03          	ld	a,(OFST+3,sp)
1703  0273 95            	ld	xh,a
1704  0274 cd086e        	call	L7_TI3_Config
1706  0277 84            	pop	a
1707                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1709  0278 7b06          	ld	a,(OFST+6,sp)
1710  027a cd06d0        	call	_TIM1_SetIC3Prescaler
1713  027d 2012          	jra	L746
1714  027f               L556:
1715                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1715                     ; 467                (uint8_t)TIM1_ICSelection,
1715                     ; 468                (uint8_t)TIM1_ICFilter);
1717  027f 7b07          	ld	a,(OFST+7,sp)
1718  0281 88            	push	a
1719  0282 7b06          	ld	a,(OFST+6,sp)
1720  0284 97            	ld	xl,a
1721  0285 7b03          	ld	a,(OFST+3,sp)
1722  0287 95            	ld	xh,a
1723  0288 cd089e        	call	L11_TI4_Config
1725  028b 84            	pop	a
1726                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1728  028c 7b06          	ld	a,(OFST+6,sp)
1729  028e cd06dd        	call	_TIM1_SetIC4Prescaler
1731  0291               L746:
1732                     ; 472 }
1735  0291 85            	popw	x
1736  0292 81            	ret
1826                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1826                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1826                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1826                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1826                     ; 492                      uint8_t TIM1_ICFilter)
1826                     ; 493 {
1827                     	switch	.text
1828  0293               _TIM1_PWMIConfig:
1830  0293 89            	pushw	x
1831  0294 89            	pushw	x
1832       00000002      OFST:	set	2
1835                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1837                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1839                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1841                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1843                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1845                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1847                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1849  0295 9f            	ld	a,xl
1850  0296 a101          	cp	a,#1
1851  0298 2706          	jreq	L127
1852                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1854  029a a601          	ld	a,#1
1855  029c 6b01          	ld	(OFST-1,sp),a
1858  029e 2002          	jra	L327
1859  02a0               L127:
1860                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1862  02a0 0f01          	clr	(OFST-1,sp)
1864  02a2               L327:
1865                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1867  02a2 7b07          	ld	a,(OFST+5,sp)
1868  02a4 a101          	cp	a,#1
1869  02a6 2606          	jrne	L527
1870                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1872  02a8 a602          	ld	a,#2
1873  02aa 6b02          	ld	(OFST+0,sp),a
1876  02ac 2004          	jra	L727
1877  02ae               L527:
1878                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1880  02ae a601          	ld	a,#1
1881  02b0 6b02          	ld	(OFST+0,sp),a
1883  02b2               L727:
1884                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1886  02b2 0d03          	tnz	(OFST+1,sp)
1887  02b4 2626          	jrne	L137
1888                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1888                     ; 527                (uint8_t)TIM1_ICFilter);
1890  02b6 7b09          	ld	a,(OFST+7,sp)
1891  02b8 88            	push	a
1892  02b9 7b08          	ld	a,(OFST+6,sp)
1893  02bb 97            	ld	xl,a
1894  02bc 7b05          	ld	a,(OFST+3,sp)
1895  02be 95            	ld	xh,a
1896  02bf cd080e        	call	L3_TI1_Config
1898  02c2 84            	pop	a
1899                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1901  02c3 7b08          	ld	a,(OFST+6,sp)
1902  02c5 cd06b6        	call	_TIM1_SetIC1Prescaler
1904                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1906  02c8 7b09          	ld	a,(OFST+7,sp)
1907  02ca 88            	push	a
1908  02cb 7b03          	ld	a,(OFST+1,sp)
1909  02cd 97            	ld	xl,a
1910  02ce 7b02          	ld	a,(OFST+0,sp)
1911  02d0 95            	ld	xh,a
1912  02d1 cd083e        	call	L5_TI2_Config
1914  02d4 84            	pop	a
1915                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1917  02d5 7b08          	ld	a,(OFST+6,sp)
1918  02d7 cd06c3        	call	_TIM1_SetIC2Prescaler
1921  02da 2024          	jra	L337
1922  02dc               L137:
1923                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1923                     ; 542                (uint8_t)TIM1_ICFilter);
1925  02dc 7b09          	ld	a,(OFST+7,sp)
1926  02de 88            	push	a
1927  02df 7b08          	ld	a,(OFST+6,sp)
1928  02e1 97            	ld	xl,a
1929  02e2 7b05          	ld	a,(OFST+3,sp)
1930  02e4 95            	ld	xh,a
1931  02e5 cd083e        	call	L5_TI2_Config
1933  02e8 84            	pop	a
1934                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1936  02e9 7b08          	ld	a,(OFST+6,sp)
1937  02eb cd06c3        	call	_TIM1_SetIC2Prescaler
1939                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1941  02ee 7b09          	ld	a,(OFST+7,sp)
1942  02f0 88            	push	a
1943  02f1 7b03          	ld	a,(OFST+1,sp)
1944  02f3 97            	ld	xl,a
1945  02f4 7b02          	ld	a,(OFST+0,sp)
1946  02f6 95            	ld	xh,a
1947  02f7 cd080e        	call	L3_TI1_Config
1949  02fa 84            	pop	a
1950                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1952  02fb 7b08          	ld	a,(OFST+6,sp)
1953  02fd cd06b6        	call	_TIM1_SetIC1Prescaler
1955  0300               L337:
1956                     ; 553 }
1959  0300 5b04          	addw	sp,#4
1960  0302 81            	ret
2015                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2015                     ; 562 {
2016                     	switch	.text
2017  0303               _TIM1_Cmd:
2021                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2023                     ; 567   if (NewState != DISABLE)
2025  0303 4d            	tnz	a
2026  0304 2706          	jreq	L367
2027                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2029  0306 72105250      	bset	21072,#0
2031  030a 2004          	jra	L567
2032  030c               L367:
2033                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2035  030c 72115250      	bres	21072,#0
2036  0310               L567:
2037                     ; 575 }
2040  0310 81            	ret
2076                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2076                     ; 584 {
2077                     	switch	.text
2078  0311               _TIM1_CtrlPWMOutputs:
2082                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2084                     ; 590   if (NewState != DISABLE)
2086  0311 4d            	tnz	a
2087  0312 2706          	jreq	L5001
2088                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2090  0314 721e526d      	bset	21101,#7
2092  0318 2004          	jra	L7001
2093  031a               L5001:
2094                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2096  031a 721f526d      	bres	21101,#7
2097  031e               L7001:
2098                     ; 598 }
2101  031e 81            	ret
2208                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2208                     ; 618 {
2209                     	switch	.text
2210  031f               _TIM1_ITConfig:
2212  031f 89            	pushw	x
2213       00000000      OFST:	set	0
2216                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2218                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2220                     ; 623   if (NewState != DISABLE)
2222  0320 9f            	ld	a,xl
2223  0321 4d            	tnz	a
2224  0322 2709          	jreq	L7501
2225                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2227  0324 9e            	ld	a,xh
2228  0325 ca5254        	or	a,21076
2229  0328 c75254        	ld	21076,a
2231  032b 2009          	jra	L1601
2232  032d               L7501:
2233                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2235  032d 7b01          	ld	a,(OFST+1,sp)
2236  032f 43            	cpl	a
2237  0330 c45254        	and	a,21076
2238  0333 c75254        	ld	21076,a
2239  0336               L1601:
2240                     ; 633 }
2243  0336 85            	popw	x
2244  0337 81            	ret
2268                     ; 640 void TIM1_InternalClockConfig(void)
2268                     ; 641 {
2269                     	switch	.text
2270  0338               _TIM1_InternalClockConfig:
2274                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2276  0338 c65252        	ld	a,21074
2277  033b a4f8          	and	a,#248
2278  033d c75252        	ld	21074,a
2279                     ; 644 }
2282  0340 81            	ret
2397                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2397                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2397                     ; 664                               uint8_t ExtTRGFilter)
2397                     ; 665 {
2398                     	switch	.text
2399  0341               _TIM1_ETRClockMode1Config:
2401  0341 89            	pushw	x
2402       00000000      OFST:	set	0
2405                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2407                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2409                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2411  0342 7b05          	ld	a,(OFST+5,sp)
2412  0344 88            	push	a
2413  0345 9f            	ld	a,xl
2414  0346 97            	ld	xl,a
2415  0347 7b02          	ld	a,(OFST+2,sp)
2416  0349 95            	ld	xh,a
2417  034a ad1f          	call	_TIM1_ETRConfig
2419  034c 84            	pop	a
2420                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2420                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2422  034d c65252        	ld	a,21074
2423  0350 a488          	and	a,#136
2424  0352 aa77          	or	a,#119
2425  0354 c75252        	ld	21074,a
2426                     ; 676 }
2429  0357 85            	popw	x
2430  0358 81            	ret
2486                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2486                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2486                     ; 696                               uint8_t ExtTRGFilter)
2486                     ; 697 {
2487                     	switch	.text
2488  0359               _TIM1_ETRClockMode2Config:
2490  0359 89            	pushw	x
2491       00000000      OFST:	set	0
2494                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2496                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2498                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2500  035a 7b05          	ld	a,(OFST+5,sp)
2501  035c 88            	push	a
2502  035d 9f            	ld	a,xl
2503  035e 97            	ld	xl,a
2504  035f 7b02          	ld	a,(OFST+2,sp)
2505  0361 95            	ld	xh,a
2506  0362 ad07          	call	_TIM1_ETRConfig
2508  0364 84            	pop	a
2509                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2511  0365 721c5253      	bset	21075,#6
2512                     ; 707 }
2515  0369 85            	popw	x
2516  036a 81            	ret
2570                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2570                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2570                     ; 727                     uint8_t ExtTRGFilter)
2570                     ; 728 {
2571                     	switch	.text
2572  036b               _TIM1_ETRConfig:
2574  036b 89            	pushw	x
2575       00000000      OFST:	set	0
2578                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2580                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2580                     ; 733                          (uint8_t)ExtTRGFilter );
2582  036c 9f            	ld	a,xl
2583  036d 1a01          	or	a,(OFST+1,sp)
2584  036f 1a05          	or	a,(OFST+5,sp)
2585  0371 ca5253        	or	a,21075
2586  0374 c75253        	ld	21075,a
2587                     ; 734 }
2590  0377 85            	popw	x
2591  0378 81            	ret
2678                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2678                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2678                     ; 753                                  uint8_t ICFilter)
2678                     ; 754 {
2679                     	switch	.text
2680  0379               _TIM1_TIxExternalClockConfig:
2682  0379 89            	pushw	x
2683       00000000      OFST:	set	0
2686                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2688                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2690                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2692                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2694  037a 9e            	ld	a,xh
2695  037b a160          	cp	a,#96
2696  037d 260e          	jrne	L1521
2697                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2699  037f 7b05          	ld	a,(OFST+5,sp)
2700  0381 88            	push	a
2701  0382 9f            	ld	a,xl
2702  0383 ae0001        	ldw	x,#1
2703  0386 95            	ld	xh,a
2704  0387 cd083e        	call	L5_TI2_Config
2706  038a 84            	pop	a
2708  038b 200d          	jra	L3521
2709  038d               L1521:
2710                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2712  038d 7b05          	ld	a,(OFST+5,sp)
2713  038f 88            	push	a
2714  0390 7b03          	ld	a,(OFST+3,sp)
2715  0392 ae0001        	ldw	x,#1
2716  0395 95            	ld	xh,a
2717  0396 cd080e        	call	L3_TI1_Config
2719  0399 84            	pop	a
2720  039a               L3521:
2721                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2723  039a 7b01          	ld	a,(OFST+1,sp)
2724  039c ad0a          	call	_TIM1_SelectInputTrigger
2726                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2728  039e c65252        	ld	a,21074
2729  03a1 aa07          	or	a,#7
2730  03a3 c75252        	ld	21074,a
2731                     ; 775 }
2734  03a6 85            	popw	x
2735  03a7 81            	ret
2820                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2820                     ; 788 {
2821                     	switch	.text
2822  03a8               _TIM1_SelectInputTrigger:
2824  03a8 88            	push	a
2825       00000000      OFST:	set	0
2828                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2830                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2832  03a9 c65252        	ld	a,21074
2833  03ac a48f          	and	a,#143
2834  03ae 1a01          	or	a,(OFST+1,sp)
2835  03b0 c75252        	ld	21074,a
2836                     ; 794 }
2839  03b3 84            	pop	a
2840  03b4 81            	ret
2876                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2876                     ; 804 {
2877                     	switch	.text
2878  03b5               _TIM1_UpdateDisableConfig:
2882                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2884                     ; 809   if (NewState != DISABLE)
2886  03b5 4d            	tnz	a
2887  03b6 2706          	jreq	L1331
2888                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2890  03b8 72125250      	bset	21072,#1
2892  03bc 2004          	jra	L3331
2893  03be               L1331:
2894                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2896  03be 72135250      	bres	21072,#1
2897  03c2               L3331:
2898                     ; 817 }
2901  03c2 81            	ret
2959                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2959                     ; 828 {
2960                     	switch	.text
2961  03c3               _TIM1_UpdateRequestConfig:
2965                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2967                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2969  03c3 4d            	tnz	a
2970  03c4 2706          	jreq	L3631
2971                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2973  03c6 72145250      	bset	21072,#2
2975  03ca 2004          	jra	L5631
2976  03cc               L3631:
2977                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2979  03cc 72155250      	bres	21072,#2
2980  03d0               L5631:
2981                     ; 841 }
2984  03d0 81            	ret
3020                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3020                     ; 850 {
3021                     	switch	.text
3022  03d1               _TIM1_SelectHallSensor:
3026                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3028                     ; 855   if (NewState != DISABLE)
3030  03d1 4d            	tnz	a
3031  03d2 2706          	jreq	L5041
3032                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3034  03d4 721e5251      	bset	21073,#7
3036  03d8 2004          	jra	L7041
3037  03da               L5041:
3038                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3040  03da 721f5251      	bres	21073,#7
3041  03de               L7041:
3042                     ; 863 }
3045  03de 81            	ret
3102                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3102                     ; 874 {
3103                     	switch	.text
3104  03df               _TIM1_SelectOnePulseMode:
3108                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3110                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3112  03df 4d            	tnz	a
3113  03e0 2706          	jreq	L7341
3114                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3116  03e2 72165250      	bset	21072,#3
3118  03e6 2004          	jra	L1441
3119  03e8               L7341:
3120                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3122  03e8 72175250      	bres	21072,#3
3123  03ec               L1441:
3124                     ; 888 }
3127  03ec 81            	ret
3225                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3225                     ; 904 {
3226                     	switch	.text
3227  03ed               _TIM1_SelectOutputTrigger:
3229  03ed 88            	push	a
3230       00000000      OFST:	set	0
3233                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3235                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3235                     ; 910                         (uint8_t) TIM1_TRGOSource);
3237  03ee c65251        	ld	a,21073
3238  03f1 a48f          	and	a,#143
3239  03f3 1a01          	or	a,(OFST+1,sp)
3240  03f5 c75251        	ld	21073,a
3241                     ; 911 }
3244  03f8 84            	pop	a
3245  03f9 81            	ret
3319                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3319                     ; 924 {
3320                     	switch	.text
3321  03fa               _TIM1_SelectSlaveMode:
3323  03fa 88            	push	a
3324       00000000      OFST:	set	0
3327                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3329                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3329                     ; 930                          (uint8_t)TIM1_SlaveMode);
3331  03fb c65252        	ld	a,21074
3332  03fe a4f8          	and	a,#248
3333  0400 1a01          	or	a,(OFST+1,sp)
3334  0402 c75252        	ld	21074,a
3335                     ; 931 }
3338  0405 84            	pop	a
3339  0406 81            	ret
3375                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3375                     ; 940 {
3376                     	switch	.text
3377  0407               _TIM1_SelectMasterSlaveMode:
3381                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3383                     ; 945   if (NewState != DISABLE)
3385  0407 4d            	tnz	a
3386  0408 2706          	jreq	L3551
3387                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3389  040a 721e5252      	bset	21074,#7
3391  040e 2004          	jra	L5551
3392  0410               L3551:
3393                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3395  0410 721f5252      	bres	21074,#7
3396  0414               L5551:
3397                     ; 953 }
3400  0414 81            	ret
3486                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3486                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3486                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3486                     ; 978 {
3487                     	switch	.text
3488  0415               _TIM1_EncoderInterfaceConfig:
3490  0415 89            	pushw	x
3491       00000000      OFST:	set	0
3494                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3496                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3498                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3500                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3502  0416 9f            	ld	a,xl
3503  0417 4d            	tnz	a
3504  0418 2706          	jreq	L7161
3505                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3507  041a 7212525c      	bset	21084,#1
3509  041e 2004          	jra	L1261
3510  0420               L7161:
3511                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3513  0420 7213525c      	bres	21084,#1
3514  0424               L1261:
3515                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3517  0424 0d05          	tnz	(OFST+5,sp)
3518  0426 2706          	jreq	L3261
3519                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3521  0428 721a525c      	bset	21084,#5
3523  042c 2004          	jra	L5261
3524  042e               L3261:
3525                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3527  042e 721b525c      	bres	21084,#5
3528  0432               L5261:
3529                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3529                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3531  0432 c65252        	ld	a,21074
3532  0435 a4f0          	and	a,#240
3533  0437 1a01          	or	a,(OFST+1,sp)
3534  0439 c75252        	ld	21074,a
3535                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3535                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3537  043c c65258        	ld	a,21080
3538  043f a4fc          	and	a,#252
3539  0441 aa01          	or	a,#1
3540  0443 c75258        	ld	21080,a
3541                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3541                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3543  0446 c65259        	ld	a,21081
3544  0449 a4fc          	and	a,#252
3545  044b aa01          	or	a,#1
3546  044d c75259        	ld	21081,a
3547                     ; 1011 }
3550  0450 85            	popw	x
3551  0451 81            	ret
3616                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3616                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3616                     ; 1025 {
3617                     	switch	.text
3618  0452               _TIM1_PrescalerConfig:
3620  0452 89            	pushw	x
3621       00000000      OFST:	set	0
3624                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3626                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3628  0453 9e            	ld	a,xh
3629  0454 c75260        	ld	21088,a
3630                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3632  0457 9f            	ld	a,xl
3633  0458 c75261        	ld	21089,a
3634                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3636  045b 7b05          	ld	a,(OFST+5,sp)
3637  045d c75257        	ld	21079,a
3638                     ; 1035 }
3641  0460 85            	popw	x
3642  0461 81            	ret
3678                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3678                     ; 1049 {
3679                     	switch	.text
3680  0462               _TIM1_CounterModeConfig:
3682  0462 88            	push	a
3683       00000000      OFST:	set	0
3686                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3688                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3688                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3690  0463 c65250        	ld	a,21072
3691  0466 a48f          	and	a,#143
3692  0468 1a01          	or	a,(OFST+1,sp)
3693  046a c75250        	ld	21072,a
3694                     ; 1057 }
3697  046d 84            	pop	a
3698  046e 81            	ret
3756                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3756                     ; 1068 {
3757                     	switch	.text
3758  046f               _TIM1_ForcedOC1Config:
3760  046f 88            	push	a
3761       00000000      OFST:	set	0
3764                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3766                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3766                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3768  0470 c65258        	ld	a,21080
3769  0473 a48f          	and	a,#143
3770  0475 1a01          	or	a,(OFST+1,sp)
3771  0477 c75258        	ld	21080,a
3772                     ; 1075 }
3775  047a 84            	pop	a
3776  047b 81            	ret
3812                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3812                     ; 1086 {
3813                     	switch	.text
3814  047c               _TIM1_ForcedOC2Config:
3816  047c 88            	push	a
3817       00000000      OFST:	set	0
3820                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3822                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3822                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3824  047d c65259        	ld	a,21081
3825  0480 a48f          	and	a,#143
3826  0482 1a01          	or	a,(OFST+1,sp)
3827  0484 c75259        	ld	21081,a
3828                     ; 1093 }
3831  0487 84            	pop	a
3832  0488 81            	ret
3868                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3868                     ; 1105 {
3869                     	switch	.text
3870  0489               _TIM1_ForcedOC3Config:
3872  0489 88            	push	a
3873       00000000      OFST:	set	0
3876                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3878                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3878                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3880  048a c6525a        	ld	a,21082
3881  048d a48f          	and	a,#143
3882  048f 1a01          	or	a,(OFST+1,sp)
3883  0491 c7525a        	ld	21082,a
3884                     ; 1112 }
3887  0494 84            	pop	a
3888  0495 81            	ret
3924                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3924                     ; 1124 {
3925                     	switch	.text
3926  0496               _TIM1_ForcedOC4Config:
3928  0496 88            	push	a
3929       00000000      OFST:	set	0
3932                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3934                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3934                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3936  0497 c6525b        	ld	a,21083
3937  049a a48f          	and	a,#143
3938  049c 1a01          	or	a,(OFST+1,sp)
3939  049e c7525b        	ld	21083,a
3940                     ; 1131 }
3943  04a1 84            	pop	a
3944  04a2 81            	ret
3980                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3980                     ; 1140 {
3981                     	switch	.text
3982  04a3               _TIM1_ARRPreloadConfig:
3986                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3988                     ; 1145   if (NewState != DISABLE)
3990  04a3 4d            	tnz	a
3991  04a4 2706          	jreq	L3102
3992                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
3994  04a6 721e5250      	bset	21072,#7
3996  04aa 2004          	jra	L5102
3997  04ac               L3102:
3998                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4000  04ac 721f5250      	bres	21072,#7
4001  04b0               L5102:
4002                     ; 1153 }
4005  04b0 81            	ret
4040                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4040                     ; 1162 {
4041                     	switch	.text
4042  04b1               _TIM1_SelectCOM:
4046                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4048                     ; 1167   if (NewState != DISABLE)
4050  04b1 4d            	tnz	a
4051  04b2 2706          	jreq	L5302
4052                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4054  04b4 72145251      	bset	21073,#2
4056  04b8 2004          	jra	L7302
4057  04ba               L5302:
4058                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4060  04ba 72155251      	bres	21073,#2
4061  04be               L7302:
4062                     ; 1175 }
4065  04be 81            	ret
4101                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4101                     ; 1184 {
4102                     	switch	.text
4103  04bf               _TIM1_CCPreloadControl:
4107                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4109                     ; 1189   if (NewState != DISABLE)
4111  04bf 4d            	tnz	a
4112  04c0 2706          	jreq	L7502
4113                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4115  04c2 72105251      	bset	21073,#0
4117  04c6 2004          	jra	L1602
4118  04c8               L7502:
4119                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4121  04c8 72115251      	bres	21073,#0
4122  04cc               L1602:
4123                     ; 1197 }
4126  04cc 81            	ret
4162                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4162                     ; 1206 {
4163                     	switch	.text
4164  04cd               _TIM1_OC1PreloadConfig:
4168                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4170                     ; 1211   if (NewState != DISABLE)
4172  04cd 4d            	tnz	a
4173  04ce 2706          	jreq	L1012
4174                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4176  04d0 72165258      	bset	21080,#3
4178  04d4 2004          	jra	L3012
4179  04d6               L1012:
4180                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4182  04d6 72175258      	bres	21080,#3
4183  04da               L3012:
4184                     ; 1219 }
4187  04da 81            	ret
4223                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4223                     ; 1228 {
4224                     	switch	.text
4225  04db               _TIM1_OC2PreloadConfig:
4229                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4231                     ; 1233   if (NewState != DISABLE)
4233  04db 4d            	tnz	a
4234  04dc 2706          	jreq	L3212
4235                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4237  04de 72165259      	bset	21081,#3
4239  04e2 2004          	jra	L5212
4240  04e4               L3212:
4241                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4243  04e4 72175259      	bres	21081,#3
4244  04e8               L5212:
4245                     ; 1241 }
4248  04e8 81            	ret
4284                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4284                     ; 1250 {
4285                     	switch	.text
4286  04e9               _TIM1_OC3PreloadConfig:
4290                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4292                     ; 1255   if (NewState != DISABLE)
4294  04e9 4d            	tnz	a
4295  04ea 2706          	jreq	L5412
4296                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4298  04ec 7216525a      	bset	21082,#3
4300  04f0 2004          	jra	L7412
4301  04f2               L5412:
4302                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4304  04f2 7217525a      	bres	21082,#3
4305  04f6               L7412:
4306                     ; 1263 }
4309  04f6 81            	ret
4345                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4345                     ; 1272 {
4346                     	switch	.text
4347  04f7               _TIM1_OC4PreloadConfig:
4351                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4353                     ; 1277   if (NewState != DISABLE)
4355  04f7 4d            	tnz	a
4356  04f8 2706          	jreq	L7612
4357                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4359  04fa 7216525b      	bset	21083,#3
4361  04fe 2004          	jra	L1712
4362  0500               L7612:
4363                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4365  0500 7217525b      	bres	21083,#3
4366  0504               L1712:
4367                     ; 1285 }
4370  0504 81            	ret
4405                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4405                     ; 1294 {
4406                     	switch	.text
4407  0505               _TIM1_OC1FastConfig:
4411                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4413                     ; 1299   if (NewState != DISABLE)
4415  0505 4d            	tnz	a
4416  0506 2706          	jreq	L1122
4417                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4419  0508 72145258      	bset	21080,#2
4421  050c 2004          	jra	L3122
4422  050e               L1122:
4423                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4425  050e 72155258      	bres	21080,#2
4426  0512               L3122:
4427                     ; 1307 }
4430  0512 81            	ret
4465                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4465                     ; 1316 {
4466                     	switch	.text
4467  0513               _TIM1_OC2FastConfig:
4471                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4473                     ; 1321   if (NewState != DISABLE)
4475  0513 4d            	tnz	a
4476  0514 2706          	jreq	L3322
4477                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4479  0516 72145259      	bset	21081,#2
4481  051a 2004          	jra	L5322
4482  051c               L3322:
4483                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4485  051c 72155259      	bres	21081,#2
4486  0520               L5322:
4487                     ; 1329 }
4490  0520 81            	ret
4525                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4525                     ; 1338 {
4526                     	switch	.text
4527  0521               _TIM1_OC3FastConfig:
4531                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4533                     ; 1343   if (NewState != DISABLE)
4535  0521 4d            	tnz	a
4536  0522 2706          	jreq	L5522
4537                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4539  0524 7214525a      	bset	21082,#2
4541  0528 2004          	jra	L7522
4542  052a               L5522:
4543                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4545  052a 7215525a      	bres	21082,#2
4546  052e               L7522:
4547                     ; 1351 }
4550  052e 81            	ret
4585                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4585                     ; 1360 {
4586                     	switch	.text
4587  052f               _TIM1_OC4FastConfig:
4591                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4593                     ; 1365   if (NewState != DISABLE)
4595  052f 4d            	tnz	a
4596  0530 2706          	jreq	L7722
4597                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4599  0532 7214525b      	bset	21083,#2
4601  0536 2004          	jra	L1032
4602  0538               L7722:
4603                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4605  0538 7215525b      	bres	21083,#2
4606  053c               L1032:
4607                     ; 1373 }
4610  053c 81            	ret
4715                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4715                     ; 1390 {
4716                     	switch	.text
4717  053d               _TIM1_GenerateEvent:
4721                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4723                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4725  053d c75257        	ld	21079,a
4726                     ; 1396 }
4729  0540 81            	ret
4765                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4765                     ; 1407 {
4766                     	switch	.text
4767  0541               _TIM1_OC1PolarityConfig:
4771                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4773                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4775  0541 4d            	tnz	a
4776  0542 2706          	jreq	L3632
4777                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4779  0544 7212525c      	bset	21084,#1
4781  0548 2004          	jra	L5632
4782  054a               L3632:
4783                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4785  054a 7213525c      	bres	21084,#1
4786  054e               L5632:
4787                     ; 1420 }
4790  054e 81            	ret
4826                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4826                     ; 1431 {
4827                     	switch	.text
4828  054f               _TIM1_OC1NPolarityConfig:
4832                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4834                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4836  054f 4d            	tnz	a
4837  0550 2706          	jreq	L5042
4838                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4840  0552 7216525c      	bset	21084,#3
4842  0556 2004          	jra	L7042
4843  0558               L5042:
4844                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4846  0558 7217525c      	bres	21084,#3
4847  055c               L7042:
4848                     ; 1444 }
4851  055c 81            	ret
4887                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4887                     ; 1455 {
4888                     	switch	.text
4889  055d               _TIM1_OC2PolarityConfig:
4893                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4895                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4897  055d 4d            	tnz	a
4898  055e 2706          	jreq	L7242
4899                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4901  0560 721a525c      	bset	21084,#5
4903  0564 2004          	jra	L1342
4904  0566               L7242:
4905                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4907  0566 721b525c      	bres	21084,#5
4908  056a               L1342:
4909                     ; 1468 }
4912  056a 81            	ret
4948                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4948                     ; 1479 {
4949                     	switch	.text
4950  056b               _TIM1_OC2NPolarityConfig:
4954                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4956                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4958  056b 4d            	tnz	a
4959  056c 2706          	jreq	L1542
4960                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4962  056e 721e525c      	bset	21084,#7
4964  0572 2004          	jra	L3542
4965  0574               L1542:
4966                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4968  0574 721f525c      	bres	21084,#7
4969  0578               L3542:
4970                     ; 1492 }
4973  0578 81            	ret
5009                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5009                     ; 1503 {
5010                     	switch	.text
5011  0579               _TIM1_OC3PolarityConfig:
5015                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5017                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5019  0579 4d            	tnz	a
5020  057a 2706          	jreq	L3742
5021                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5023  057c 7212525d      	bset	21085,#1
5025  0580 2004          	jra	L5742
5026  0582               L3742:
5027                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5029  0582 7213525d      	bres	21085,#1
5030  0586               L5742:
5031                     ; 1516 }
5034  0586 81            	ret
5070                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5070                     ; 1528 {
5071                     	switch	.text
5072  0587               _TIM1_OC3NPolarityConfig:
5076                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5078                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5080  0587 4d            	tnz	a
5081  0588 2706          	jreq	L5152
5082                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5084  058a 7216525d      	bset	21085,#3
5086  058e 2004          	jra	L7152
5087  0590               L5152:
5088                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5090  0590 7217525d      	bres	21085,#3
5091  0594               L7152:
5092                     ; 1541 }
5095  0594 81            	ret
5131                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5131                     ; 1552 {
5132                     	switch	.text
5133  0595               _TIM1_OC4PolarityConfig:
5137                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5139                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5141  0595 4d            	tnz	a
5142  0596 2706          	jreq	L7352
5143                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5145  0598 721a525d      	bset	21085,#5
5147  059c 2004          	jra	L1452
5148  059e               L7352:
5149                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5151  059e 721b525d      	bres	21085,#5
5152  05a2               L1452:
5153                     ; 1565 }
5156  05a2 81            	ret
5201                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5201                     ; 1580 {
5202                     	switch	.text
5203  05a3               _TIM1_CCxCmd:
5205  05a3 89            	pushw	x
5206       00000000      OFST:	set	0
5209                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5211                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5213                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5215  05a4 9e            	ld	a,xh
5216  05a5 4d            	tnz	a
5217  05a6 2610          	jrne	L5652
5218                     ; 1588     if (NewState != DISABLE)
5220  05a8 9f            	ld	a,xl
5221  05a9 4d            	tnz	a
5222  05aa 2706          	jreq	L7652
5223                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5225  05ac 7210525c      	bset	21084,#0
5227  05b0 2040          	jra	L3752
5228  05b2               L7652:
5229                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5231  05b2 7211525c      	bres	21084,#0
5232  05b6 203a          	jra	L3752
5233  05b8               L5652:
5234                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5236  05b8 7b01          	ld	a,(OFST+1,sp)
5237  05ba a101          	cp	a,#1
5238  05bc 2610          	jrne	L5752
5239                     ; 1601     if (NewState != DISABLE)
5241  05be 0d02          	tnz	(OFST+2,sp)
5242  05c0 2706          	jreq	L7752
5243                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5245  05c2 7218525c      	bset	21084,#4
5247  05c6 202a          	jra	L3752
5248  05c8               L7752:
5249                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5251  05c8 7219525c      	bres	21084,#4
5252  05cc 2024          	jra	L3752
5253  05ce               L5752:
5254                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5256  05ce 7b01          	ld	a,(OFST+1,sp)
5257  05d0 a102          	cp	a,#2
5258  05d2 2610          	jrne	L5062
5259                     ; 1613     if (NewState != DISABLE)
5261  05d4 0d02          	tnz	(OFST+2,sp)
5262  05d6 2706          	jreq	L7062
5263                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5265  05d8 7210525d      	bset	21085,#0
5267  05dc 2014          	jra	L3752
5268  05de               L7062:
5269                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5271  05de 7211525d      	bres	21085,#0
5272  05e2 200e          	jra	L3752
5273  05e4               L5062:
5274                     ; 1625     if (NewState != DISABLE)
5276  05e4 0d02          	tnz	(OFST+2,sp)
5277  05e6 2706          	jreq	L5162
5278                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5280  05e8 7218525d      	bset	21085,#4
5282  05ec 2004          	jra	L3752
5283  05ee               L5162:
5284                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5286  05ee 7219525d      	bres	21085,#4
5287  05f2               L3752:
5288                     ; 1634 }
5291  05f2 85            	popw	x
5292  05f3 81            	ret
5337                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5337                     ; 1648 {
5338                     	switch	.text
5339  05f4               _TIM1_CCxNCmd:
5341  05f4 89            	pushw	x
5342       00000000      OFST:	set	0
5345                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5347                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5349                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5351  05f5 9e            	ld	a,xh
5352  05f6 4d            	tnz	a
5353  05f7 2610          	jrne	L3462
5354                     ; 1656     if (NewState != DISABLE)
5356  05f9 9f            	ld	a,xl
5357  05fa 4d            	tnz	a
5358  05fb 2706          	jreq	L5462
5359                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5361  05fd 7214525c      	bset	21084,#2
5363  0601 202a          	jra	L1562
5364  0603               L5462:
5365                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5367  0603 7215525c      	bres	21084,#2
5368  0607 2024          	jra	L1562
5369  0609               L3462:
5370                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5372  0609 7b01          	ld	a,(OFST+1,sp)
5373  060b a101          	cp	a,#1
5374  060d 2610          	jrne	L3562
5375                     ; 1668     if (NewState != DISABLE)
5377  060f 0d02          	tnz	(OFST+2,sp)
5378  0611 2706          	jreq	L5562
5379                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5381  0613 721c525c      	bset	21084,#6
5383  0617 2014          	jra	L1562
5384  0619               L5562:
5385                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5387  0619 721d525c      	bres	21084,#6
5388  061d 200e          	jra	L1562
5389  061f               L3562:
5390                     ; 1680     if (NewState != DISABLE)
5392  061f 0d02          	tnz	(OFST+2,sp)
5393  0621 2706          	jreq	L3662
5394                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5396  0623 7214525d      	bset	21085,#2
5398  0627 2004          	jra	L1562
5399  0629               L3662:
5400                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5402  0629 7215525d      	bres	21085,#2
5403  062d               L1562:
5404                     ; 1689 }
5407  062d 85            	popw	x
5408  062e 81            	ret
5453                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5453                     ; 1713 {
5454                     	switch	.text
5455  062f               _TIM1_SelectOCxM:
5457  062f 89            	pushw	x
5458       00000000      OFST:	set	0
5461                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5463                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5465                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5467  0630 9e            	ld	a,xh
5468  0631 4d            	tnz	a
5469  0632 2610          	jrne	L1172
5470                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5472  0634 7211525c      	bres	21084,#0
5473                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5473                     ; 1725                             | (uint8_t)TIM1_OCMode);
5475  0638 c65258        	ld	a,21080
5476  063b a48f          	and	a,#143
5477  063d 1a02          	or	a,(OFST+2,sp)
5478  063f c75258        	ld	21080,a
5480  0642 203a          	jra	L3172
5481  0644               L1172:
5482                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5484  0644 7b01          	ld	a,(OFST+1,sp)
5485  0646 a101          	cp	a,#1
5486  0648 2610          	jrne	L5172
5487                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5489  064a 7219525c      	bres	21084,#4
5490                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5490                     ; 1734                             | (uint8_t)TIM1_OCMode);
5492  064e c65259        	ld	a,21081
5493  0651 a48f          	and	a,#143
5494  0653 1a02          	or	a,(OFST+2,sp)
5495  0655 c75259        	ld	21081,a
5497  0658 2024          	jra	L3172
5498  065a               L5172:
5499                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5501  065a 7b01          	ld	a,(OFST+1,sp)
5502  065c a102          	cp	a,#2
5503  065e 2610          	jrne	L1272
5504                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5506  0660 7211525d      	bres	21085,#0
5507                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5507                     ; 1743                             | (uint8_t)TIM1_OCMode);
5509  0664 c6525a        	ld	a,21082
5510  0667 a48f          	and	a,#143
5511  0669 1a02          	or	a,(OFST+2,sp)
5512  066b c7525a        	ld	21082,a
5514  066e 200e          	jra	L3172
5515  0670               L1272:
5516                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5518  0670 7219525d      	bres	21085,#4
5519                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5519                     ; 1752                             | (uint8_t)TIM1_OCMode);
5521  0674 c6525b        	ld	a,21083
5522  0677 a48f          	and	a,#143
5523  0679 1a02          	or	a,(OFST+2,sp)
5524  067b c7525b        	ld	21083,a
5525  067e               L3172:
5526                     ; 1754 }
5529  067e 85            	popw	x
5530  067f 81            	ret
5562                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5562                     ; 1763 {
5563                     	switch	.text
5564  0680               _TIM1_SetCounter:
5568                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5570  0680 9e            	ld	a,xh
5571  0681 c7525e        	ld	21086,a
5572                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5574  0684 9f            	ld	a,xl
5575  0685 c7525f        	ld	21087,a
5576                     ; 1767 }
5579  0688 81            	ret
5611                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5611                     ; 1776 {
5612                     	switch	.text
5613  0689               _TIM1_SetAutoreload:
5617                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5619  0689 9e            	ld	a,xh
5620  068a c75262        	ld	21090,a
5621                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5623  068d 9f            	ld	a,xl
5624  068e c75263        	ld	21091,a
5625                     ; 1780  }
5628  0691 81            	ret
5660                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5660                     ; 1789 {
5661                     	switch	.text
5662  0692               _TIM1_SetCompare1:
5666                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5668  0692 9e            	ld	a,xh
5669  0693 c75265        	ld	21093,a
5670                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5672  0696 9f            	ld	a,xl
5673  0697 c75266        	ld	21094,a
5674                     ; 1793 }
5677  069a 81            	ret
5709                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5709                     ; 1802 {
5710                     	switch	.text
5711  069b               _TIM1_SetCompare2:
5715                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5717  069b 9e            	ld	a,xh
5718  069c c75267        	ld	21095,a
5719                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5721  069f 9f            	ld	a,xl
5722  06a0 c75268        	ld	21096,a
5723                     ; 1806 }
5726  06a3 81            	ret
5758                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5758                     ; 1815 {
5759                     	switch	.text
5760  06a4               _TIM1_SetCompare3:
5764                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5766  06a4 9e            	ld	a,xh
5767  06a5 c75269        	ld	21097,a
5768                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5770  06a8 9f            	ld	a,xl
5771  06a9 c7526a        	ld	21098,a
5772                     ; 1819 }
5775  06ac 81            	ret
5807                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5807                     ; 1828 {
5808                     	switch	.text
5809  06ad               _TIM1_SetCompare4:
5813                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5815  06ad 9e            	ld	a,xh
5816  06ae c7526b        	ld	21099,a
5817                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5819  06b1 9f            	ld	a,xl
5820  06b2 c7526c        	ld	21100,a
5821                     ; 1832 }
5824  06b5 81            	ret
5860                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5860                     ; 1845 {
5861                     	switch	.text
5862  06b6               _TIM1_SetIC1Prescaler:
5864  06b6 88            	push	a
5865       00000000      OFST:	set	0
5868                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5870                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5870                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5872  06b7 c65258        	ld	a,21080
5873  06ba a4f3          	and	a,#243
5874  06bc 1a01          	or	a,(OFST+1,sp)
5875  06be c75258        	ld	21080,a
5876                     ; 1852 }
5879  06c1 84            	pop	a
5880  06c2 81            	ret
5916                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5916                     ; 1865 {
5917                     	switch	.text
5918  06c3               _TIM1_SetIC2Prescaler:
5920  06c3 88            	push	a
5921       00000000      OFST:	set	0
5924                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5926                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5926                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5928  06c4 c65259        	ld	a,21081
5929  06c7 a4f3          	and	a,#243
5930  06c9 1a01          	or	a,(OFST+1,sp)
5931  06cb c75259        	ld	21081,a
5932                     ; 1873 }
5935  06ce 84            	pop	a
5936  06cf 81            	ret
5972                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5972                     ; 1886 {
5973                     	switch	.text
5974  06d0               _TIM1_SetIC3Prescaler:
5976  06d0 88            	push	a
5977       00000000      OFST:	set	0
5980                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
5982                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
5982                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
5984  06d1 c6525a        	ld	a,21082
5985  06d4 a4f3          	and	a,#243
5986  06d6 1a01          	or	a,(OFST+1,sp)
5987  06d8 c7525a        	ld	21082,a
5988                     ; 1894 }
5991  06db 84            	pop	a
5992  06dc 81            	ret
6028                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6028                     ; 1907 {
6029                     	switch	.text
6030  06dd               _TIM1_SetIC4Prescaler:
6032  06dd 88            	push	a
6033       00000000      OFST:	set	0
6036                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6038                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6038                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6040  06de c6525b        	ld	a,21083
6041  06e1 a4f3          	and	a,#243
6042  06e3 1a01          	or	a,(OFST+1,sp)
6043  06e5 c7525b        	ld	21083,a
6044                     ; 1915 }
6047  06e8 84            	pop	a
6048  06e9 81            	ret
6094                     ; 1922 uint16_t TIM1_GetCapture1(void)
6094                     ; 1923 {
6095                     	switch	.text
6096  06ea               _TIM1_GetCapture1:
6098  06ea 5204          	subw	sp,#4
6099       00000004      OFST:	set	4
6102                     ; 1926   uint16_t tmpccr1 = 0;
6104                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6108                     ; 1929   tmpccr1h = TIM1->CCR1H;
6110  06ec c65265        	ld	a,21093
6111  06ef 6b02          	ld	(OFST-2,sp),a
6113                     ; 1930   tmpccr1l = TIM1->CCR1L;
6115  06f1 c65266        	ld	a,21094
6116  06f4 6b01          	ld	(OFST-3,sp),a
6118                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6120  06f6 7b01          	ld	a,(OFST-3,sp)
6121  06f8 5f            	clrw	x
6122  06f9 97            	ld	xl,a
6123  06fa 1f03          	ldw	(OFST-1,sp),x
6125                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6127  06fc 7b02          	ld	a,(OFST-2,sp)
6128  06fe 5f            	clrw	x
6129  06ff 97            	ld	xl,a
6130  0700 4f            	clr	a
6131  0701 02            	rlwa	x,a
6132  0702 01            	rrwa	x,a
6133  0703 1a04          	or	a,(OFST+0,sp)
6134  0705 01            	rrwa	x,a
6135  0706 1a03          	or	a,(OFST-1,sp)
6136  0708 01            	rrwa	x,a
6137  0709 1f03          	ldw	(OFST-1,sp),x
6139                     ; 1935   return (uint16_t)tmpccr1;
6141  070b 1e03          	ldw	x,(OFST-1,sp)
6144  070d 5b04          	addw	sp,#4
6145  070f 81            	ret
6191                     ; 1943 uint16_t TIM1_GetCapture2(void)
6191                     ; 1944 {
6192                     	switch	.text
6193  0710               _TIM1_GetCapture2:
6195  0710 5204          	subw	sp,#4
6196       00000004      OFST:	set	4
6199                     ; 1947   uint16_t tmpccr2 = 0;
6201                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6205                     ; 1950   tmpccr2h = TIM1->CCR2H;
6207  0712 c65267        	ld	a,21095
6208  0715 6b02          	ld	(OFST-2,sp),a
6210                     ; 1951   tmpccr2l = TIM1->CCR2L;
6212  0717 c65268        	ld	a,21096
6213  071a 6b01          	ld	(OFST-3,sp),a
6215                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6217  071c 7b01          	ld	a,(OFST-3,sp)
6218  071e 5f            	clrw	x
6219  071f 97            	ld	xl,a
6220  0720 1f03          	ldw	(OFST-1,sp),x
6222                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6224  0722 7b02          	ld	a,(OFST-2,sp)
6225  0724 5f            	clrw	x
6226  0725 97            	ld	xl,a
6227  0726 4f            	clr	a
6228  0727 02            	rlwa	x,a
6229  0728 01            	rrwa	x,a
6230  0729 1a04          	or	a,(OFST+0,sp)
6231  072b 01            	rrwa	x,a
6232  072c 1a03          	or	a,(OFST-1,sp)
6233  072e 01            	rrwa	x,a
6234  072f 1f03          	ldw	(OFST-1,sp),x
6236                     ; 1956   return (uint16_t)tmpccr2;
6238  0731 1e03          	ldw	x,(OFST-1,sp)
6241  0733 5b04          	addw	sp,#4
6242  0735 81            	ret
6288                     ; 1964 uint16_t TIM1_GetCapture3(void)
6288                     ; 1965 {
6289                     	switch	.text
6290  0736               _TIM1_GetCapture3:
6292  0736 5204          	subw	sp,#4
6293       00000004      OFST:	set	4
6296                     ; 1967   uint16_t tmpccr3 = 0;
6298                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6302                     ; 1970   tmpccr3h = TIM1->CCR3H;
6304  0738 c65269        	ld	a,21097
6305  073b 6b02          	ld	(OFST-2,sp),a
6307                     ; 1971   tmpccr3l = TIM1->CCR3L;
6309  073d c6526a        	ld	a,21098
6310  0740 6b01          	ld	(OFST-3,sp),a
6312                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6314  0742 7b01          	ld	a,(OFST-3,sp)
6315  0744 5f            	clrw	x
6316  0745 97            	ld	xl,a
6317  0746 1f03          	ldw	(OFST-1,sp),x
6319                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6321  0748 7b02          	ld	a,(OFST-2,sp)
6322  074a 5f            	clrw	x
6323  074b 97            	ld	xl,a
6324  074c 4f            	clr	a
6325  074d 02            	rlwa	x,a
6326  074e 01            	rrwa	x,a
6327  074f 1a04          	or	a,(OFST+0,sp)
6328  0751 01            	rrwa	x,a
6329  0752 1a03          	or	a,(OFST-1,sp)
6330  0754 01            	rrwa	x,a
6331  0755 1f03          	ldw	(OFST-1,sp),x
6333                     ; 1976   return (uint16_t)tmpccr3;
6335  0757 1e03          	ldw	x,(OFST-1,sp)
6338  0759 5b04          	addw	sp,#4
6339  075b 81            	ret
6385                     ; 1984 uint16_t TIM1_GetCapture4(void)
6385                     ; 1985 {
6386                     	switch	.text
6387  075c               _TIM1_GetCapture4:
6389  075c 5204          	subw	sp,#4
6390       00000004      OFST:	set	4
6393                     ; 1987   uint16_t tmpccr4 = 0;
6395                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6399                     ; 1990   tmpccr4h = TIM1->CCR4H;
6401  075e c6526b        	ld	a,21099
6402  0761 6b02          	ld	(OFST-2,sp),a
6404                     ; 1991   tmpccr4l = TIM1->CCR4L;
6406  0763 c6526c        	ld	a,21100
6407  0766 6b01          	ld	(OFST-3,sp),a
6409                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6411  0768 7b01          	ld	a,(OFST-3,sp)
6412  076a 5f            	clrw	x
6413  076b 97            	ld	xl,a
6414  076c 1f03          	ldw	(OFST-1,sp),x
6416                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6418  076e 7b02          	ld	a,(OFST-2,sp)
6419  0770 5f            	clrw	x
6420  0771 97            	ld	xl,a
6421  0772 4f            	clr	a
6422  0773 02            	rlwa	x,a
6423  0774 01            	rrwa	x,a
6424  0775 1a04          	or	a,(OFST+0,sp)
6425  0777 01            	rrwa	x,a
6426  0778 1a03          	or	a,(OFST-1,sp)
6427  077a 01            	rrwa	x,a
6428  077b 1f03          	ldw	(OFST-1,sp),x
6430                     ; 1996   return (uint16_t)tmpccr4;
6432  077d 1e03          	ldw	x,(OFST-1,sp)
6435  077f 5b04          	addw	sp,#4
6436  0781 81            	ret
6468                     ; 2004 uint16_t TIM1_GetCounter(void)
6468                     ; 2005 {
6469                     	switch	.text
6470  0782               _TIM1_GetCounter:
6472  0782 89            	pushw	x
6473       00000002      OFST:	set	2
6476                     ; 2006   uint16_t tmpcntr = 0;
6478                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6480  0783 c6525e        	ld	a,21086
6481  0786 5f            	clrw	x
6482  0787 97            	ld	xl,a
6483  0788 4f            	clr	a
6484  0789 02            	rlwa	x,a
6485  078a 1f01          	ldw	(OFST-1,sp),x
6487                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6489  078c c6525f        	ld	a,21087
6490  078f 5f            	clrw	x
6491  0790 97            	ld	xl,a
6492  0791 01            	rrwa	x,a
6493  0792 1a02          	or	a,(OFST+0,sp)
6494  0794 01            	rrwa	x,a
6495  0795 1a01          	or	a,(OFST-1,sp)
6496  0797 01            	rrwa	x,a
6499  0798 5b02          	addw	sp,#2
6500  079a 81            	ret
6532                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6532                     ; 2020 {
6533                     	switch	.text
6534  079b               _TIM1_GetPrescaler:
6536  079b 89            	pushw	x
6537       00000002      OFST:	set	2
6540                     ; 2021   uint16_t temp = 0;
6542                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6544  079c c65260        	ld	a,21088
6545  079f 5f            	clrw	x
6546  07a0 97            	ld	xl,a
6547  07a1 4f            	clr	a
6548  07a2 02            	rlwa	x,a
6549  07a3 1f01          	ldw	(OFST-1,sp),x
6551                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6553  07a5 c65261        	ld	a,21089
6554  07a8 5f            	clrw	x
6555  07a9 97            	ld	xl,a
6556  07aa 01            	rrwa	x,a
6557  07ab 1a02          	or	a,(OFST+0,sp)
6558  07ad 01            	rrwa	x,a
6559  07ae 1a01          	or	a,(OFST-1,sp)
6560  07b0 01            	rrwa	x,a
6563  07b1 5b02          	addw	sp,#2
6564  07b3 81            	ret
6734                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6734                     ; 2048 {
6735                     	switch	.text
6736  07b4               _TIM1_GetFlagStatus:
6738  07b4 89            	pushw	x
6739  07b5 89            	pushw	x
6740       00000002      OFST:	set	2
6743                     ; 2049   FlagStatus bitstatus = RESET;
6745                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6749                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6751                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6753  07b6 9f            	ld	a,xl
6754  07b7 c45255        	and	a,21077
6755  07ba 6b01          	ld	(OFST-1,sp),a
6757                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6759  07bc 7b03          	ld	a,(OFST+1,sp)
6760  07be 6b02          	ld	(OFST+0,sp),a
6762                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6764  07c0 c65256        	ld	a,21078
6765  07c3 1402          	and	a,(OFST+0,sp)
6766  07c5 1a01          	or	a,(OFST-1,sp)
6767  07c7 2706          	jreq	L7433
6768                     ; 2060     bitstatus = SET;
6770  07c9 a601          	ld	a,#1
6771  07cb 6b02          	ld	(OFST+0,sp),a
6774  07cd 2002          	jra	L1533
6775  07cf               L7433:
6776                     ; 2064     bitstatus = RESET;
6778  07cf 0f02          	clr	(OFST+0,sp)
6780  07d1               L1533:
6781                     ; 2066   return (FlagStatus)(bitstatus);
6783  07d1 7b02          	ld	a,(OFST+0,sp)
6786  07d3 5b04          	addw	sp,#4
6787  07d5 81            	ret
6822                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6822                     ; 2088 {
6823                     	switch	.text
6824  07d6               _TIM1_ClearFlag:
6826  07d6 89            	pushw	x
6827       00000000      OFST:	set	0
6830                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6832                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6834  07d7 9f            	ld	a,xl
6835  07d8 43            	cpl	a
6836  07d9 c75255        	ld	21077,a
6837                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6837                     ; 2095                         (uint8_t)0x1E);
6839  07dc 7b01          	ld	a,(OFST+1,sp)
6840  07de 43            	cpl	a
6841  07df a41e          	and	a,#30
6842  07e1 c75256        	ld	21078,a
6843                     ; 2096 }
6846  07e4 85            	popw	x
6847  07e5 81            	ret
6907                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6907                     ; 2113 {
6908                     	switch	.text
6909  07e6               _TIM1_GetITStatus:
6911  07e6 88            	push	a
6912  07e7 89            	pushw	x
6913       00000002      OFST:	set	2
6916                     ; 2114   ITStatus bitstatus = RESET;
6918                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6922                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6924                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6926  07e8 c45255        	and	a,21077
6927  07eb 6b01          	ld	(OFST-1,sp),a
6929                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6931  07ed c65254        	ld	a,21076
6932  07f0 1403          	and	a,(OFST+1,sp)
6933  07f2 6b02          	ld	(OFST+0,sp),a
6935                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6937  07f4 0d01          	tnz	(OFST-1,sp)
6938  07f6 270a          	jreq	L7143
6940  07f8 0d02          	tnz	(OFST+0,sp)
6941  07fa 2706          	jreq	L7143
6942                     ; 2126     bitstatus = SET;
6944  07fc a601          	ld	a,#1
6945  07fe 6b02          	ld	(OFST+0,sp),a
6948  0800 2002          	jra	L1243
6949  0802               L7143:
6950                     ; 2130     bitstatus = RESET;
6952  0802 0f02          	clr	(OFST+0,sp)
6954  0804               L1243:
6955                     ; 2132   return (ITStatus)(bitstatus);
6957  0804 7b02          	ld	a,(OFST+0,sp)
6960  0806 5b03          	addw	sp,#3
6961  0808 81            	ret
6997                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6997                     ; 2150 {
6998                     	switch	.text
6999  0809               _TIM1_ClearITPendingBit:
7003                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7005                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7007  0809 43            	cpl	a
7008  080a c75255        	ld	21077,a
7009                     ; 2156 }
7012  080d 81            	ret
7058                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7058                     ; 2175                        uint8_t TIM1_ICSelection,
7058                     ; 2176                        uint8_t TIM1_ICFilter)
7058                     ; 2177 {
7059                     	switch	.text
7060  080e               L3_TI1_Config:
7062  080e 89            	pushw	x
7063  080f 88            	push	a
7064       00000001      OFST:	set	1
7067                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7069  0810 7211525c      	bres	21084,#0
7070                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7070                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7072  0814 7b06          	ld	a,(OFST+5,sp)
7073  0816 97            	ld	xl,a
7074  0817 a610          	ld	a,#16
7075  0819 42            	mul	x,a
7076  081a 9f            	ld	a,xl
7077  081b 1a03          	or	a,(OFST+2,sp)
7078  081d 6b01          	ld	(OFST+0,sp),a
7080  081f c65258        	ld	a,21080
7081  0822 a40c          	and	a,#12
7082  0824 1a01          	or	a,(OFST+0,sp)
7083  0826 c75258        	ld	21080,a
7084                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7086  0829 0d02          	tnz	(OFST+1,sp)
7087  082b 2706          	jreq	L1643
7088                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7090  082d 7212525c      	bset	21084,#1
7092  0831 2004          	jra	L3643
7093  0833               L1643:
7094                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7096  0833 7213525c      	bres	21084,#1
7097  0837               L3643:
7098                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7100  0837 7210525c      	bset	21084,#0
7101                     ; 2197 }
7104  083b 5b03          	addw	sp,#3
7105  083d 81            	ret
7151                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7151                     ; 2216                        uint8_t TIM1_ICSelection,
7151                     ; 2217                        uint8_t TIM1_ICFilter)
7151                     ; 2218 {
7152                     	switch	.text
7153  083e               L5_TI2_Config:
7155  083e 89            	pushw	x
7156  083f 88            	push	a
7157       00000001      OFST:	set	1
7160                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7162  0840 7219525c      	bres	21084,#4
7163                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7163                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7165  0844 7b06          	ld	a,(OFST+5,sp)
7166  0846 97            	ld	xl,a
7167  0847 a610          	ld	a,#16
7168  0849 42            	mul	x,a
7169  084a 9f            	ld	a,xl
7170  084b 1a03          	or	a,(OFST+2,sp)
7171  084d 6b01          	ld	(OFST+0,sp),a
7173  084f c65259        	ld	a,21081
7174  0852 a40c          	and	a,#12
7175  0854 1a01          	or	a,(OFST+0,sp)
7176  0856 c75259        	ld	21081,a
7177                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7179  0859 0d02          	tnz	(OFST+1,sp)
7180  085b 2706          	jreq	L5053
7181                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7183  085d 721a525c      	bset	21084,#5
7185  0861 2004          	jra	L7053
7186  0863               L5053:
7187                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7189  0863 721b525c      	bres	21084,#5
7190  0867               L7053:
7191                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7193  0867 7218525c      	bset	21084,#4
7194                     ; 2236 }
7197  086b 5b03          	addw	sp,#3
7198  086d 81            	ret
7244                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7244                     ; 2255                        uint8_t TIM1_ICSelection,
7244                     ; 2256                        uint8_t TIM1_ICFilter)
7244                     ; 2257 {
7245                     	switch	.text
7246  086e               L7_TI3_Config:
7248  086e 89            	pushw	x
7249  086f 88            	push	a
7250       00000001      OFST:	set	1
7253                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7255  0870 7211525d      	bres	21085,#0
7256                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7256                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7258  0874 7b06          	ld	a,(OFST+5,sp)
7259  0876 97            	ld	xl,a
7260  0877 a610          	ld	a,#16
7261  0879 42            	mul	x,a
7262  087a 9f            	ld	a,xl
7263  087b 1a03          	or	a,(OFST+2,sp)
7264  087d 6b01          	ld	(OFST+0,sp),a
7266  087f c6525a        	ld	a,21082
7267  0882 a40c          	and	a,#12
7268  0884 1a01          	or	a,(OFST+0,sp)
7269  0886 c7525a        	ld	21082,a
7270                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7272  0889 0d02          	tnz	(OFST+1,sp)
7273  088b 2706          	jreq	L1353
7274                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7276  088d 7212525d      	bset	21085,#1
7278  0891 2004          	jra	L3353
7279  0893               L1353:
7280                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7282  0893 7213525d      	bres	21085,#1
7283  0897               L3353:
7284                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7286  0897 7210525d      	bset	21085,#0
7287                     ; 2276 }
7290  089b 5b03          	addw	sp,#3
7291  089d 81            	ret
7337                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7337                     ; 2295                        uint8_t TIM1_ICSelection,
7337                     ; 2296                        uint8_t TIM1_ICFilter)
7337                     ; 2297 {
7338                     	switch	.text
7339  089e               L11_TI4_Config:
7341  089e 89            	pushw	x
7342  089f 88            	push	a
7343       00000001      OFST:	set	1
7346                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7348  08a0 7219525d      	bres	21085,#4
7349                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7349                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7351  08a4 7b06          	ld	a,(OFST+5,sp)
7352  08a6 97            	ld	xl,a
7353  08a7 a610          	ld	a,#16
7354  08a9 42            	mul	x,a
7355  08aa 9f            	ld	a,xl
7356  08ab 1a03          	or	a,(OFST+2,sp)
7357  08ad 6b01          	ld	(OFST+0,sp),a
7359  08af c6525b        	ld	a,21083
7360  08b2 a40c          	and	a,#12
7361  08b4 1a01          	or	a,(OFST+0,sp)
7362  08b6 c7525b        	ld	21083,a
7363                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7365  08b9 0d02          	tnz	(OFST+1,sp)
7366  08bb 2706          	jreq	L5553
7367                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7369  08bd 721a525d      	bset	21085,#5
7371  08c1 2004          	jra	L7553
7372  08c3               L5553:
7373                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7375  08c3 721b525d      	bres	21085,#5
7376  08c7               L7553:
7377                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7379  08c7 7218525d      	bset	21085,#4
7380                     ; 2317 }
7383  08cb 5b03          	addw	sp,#3
7384  08cd 81            	ret
7397                     	xdef	_TIM1_ClearITPendingBit
7398                     	xdef	_TIM1_GetITStatus
7399                     	xdef	_TIM1_ClearFlag
7400                     	xdef	_TIM1_GetFlagStatus
7401                     	xdef	_TIM1_GetPrescaler
7402                     	xdef	_TIM1_GetCounter
7403                     	xdef	_TIM1_GetCapture4
7404                     	xdef	_TIM1_GetCapture3
7405                     	xdef	_TIM1_GetCapture2
7406                     	xdef	_TIM1_GetCapture1
7407                     	xdef	_TIM1_SetIC4Prescaler
7408                     	xdef	_TIM1_SetIC3Prescaler
7409                     	xdef	_TIM1_SetIC2Prescaler
7410                     	xdef	_TIM1_SetIC1Prescaler
7411                     	xdef	_TIM1_SetCompare4
7412                     	xdef	_TIM1_SetCompare3
7413                     	xdef	_TIM1_SetCompare2
7414                     	xdef	_TIM1_SetCompare1
7415                     	xdef	_TIM1_SetAutoreload
7416                     	xdef	_TIM1_SetCounter
7417                     	xdef	_TIM1_SelectOCxM
7418                     	xdef	_TIM1_CCxNCmd
7419                     	xdef	_TIM1_CCxCmd
7420                     	xdef	_TIM1_OC4PolarityConfig
7421                     	xdef	_TIM1_OC3NPolarityConfig
7422                     	xdef	_TIM1_OC3PolarityConfig
7423                     	xdef	_TIM1_OC2NPolarityConfig
7424                     	xdef	_TIM1_OC2PolarityConfig
7425                     	xdef	_TIM1_OC1NPolarityConfig
7426                     	xdef	_TIM1_OC1PolarityConfig
7427                     	xdef	_TIM1_GenerateEvent
7428                     	xdef	_TIM1_OC4FastConfig
7429                     	xdef	_TIM1_OC3FastConfig
7430                     	xdef	_TIM1_OC2FastConfig
7431                     	xdef	_TIM1_OC1FastConfig
7432                     	xdef	_TIM1_OC4PreloadConfig
7433                     	xdef	_TIM1_OC3PreloadConfig
7434                     	xdef	_TIM1_OC2PreloadConfig
7435                     	xdef	_TIM1_OC1PreloadConfig
7436                     	xdef	_TIM1_CCPreloadControl
7437                     	xdef	_TIM1_SelectCOM
7438                     	xdef	_TIM1_ARRPreloadConfig
7439                     	xdef	_TIM1_ForcedOC4Config
7440                     	xdef	_TIM1_ForcedOC3Config
7441                     	xdef	_TIM1_ForcedOC2Config
7442                     	xdef	_TIM1_ForcedOC1Config
7443                     	xdef	_TIM1_CounterModeConfig
7444                     	xdef	_TIM1_PrescalerConfig
7445                     	xdef	_TIM1_EncoderInterfaceConfig
7446                     	xdef	_TIM1_SelectMasterSlaveMode
7447                     	xdef	_TIM1_SelectSlaveMode
7448                     	xdef	_TIM1_SelectOutputTrigger
7449                     	xdef	_TIM1_SelectOnePulseMode
7450                     	xdef	_TIM1_SelectHallSensor
7451                     	xdef	_TIM1_UpdateRequestConfig
7452                     	xdef	_TIM1_UpdateDisableConfig
7453                     	xdef	_TIM1_SelectInputTrigger
7454                     	xdef	_TIM1_TIxExternalClockConfig
7455                     	xdef	_TIM1_ETRConfig
7456                     	xdef	_TIM1_ETRClockMode2Config
7457                     	xdef	_TIM1_ETRClockMode1Config
7458                     	xdef	_TIM1_InternalClockConfig
7459                     	xdef	_TIM1_ITConfig
7460                     	xdef	_TIM1_CtrlPWMOutputs
7461                     	xdef	_TIM1_Cmd
7462                     	xdef	_TIM1_PWMIConfig
7463                     	xdef	_TIM1_ICInit
7464                     	xdef	_TIM1_BDTRConfig
7465                     	xdef	_TIM1_OC4Init
7466                     	xdef	_TIM1_OC3Init
7467                     	xdef	_TIM1_OC2Init
7468                     	xdef	_TIM1_OC1Init
7469                     	xdef	_TIM1_TimeBaseInit
7470                     	xdef	_TIM1_DeInit
7489                     	end
