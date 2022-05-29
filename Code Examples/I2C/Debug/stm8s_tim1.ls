   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  43                     ; 58 void TIM1_DeInit(void)
  43                     ; 59 {
  45                     	switch	.text
  46  0000               _TIM1_DeInit:
  50                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  52  0000 725f5250      	clr	21072
  53                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  55  0004 725f5251      	clr	21073
  56                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  58  0008 725f5252      	clr	21074
  59                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  61  000c 725f5253      	clr	21075
  62                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  64  0010 725f5254      	clr	21076
  65                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  67  0014 725f5256      	clr	21078
  68                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  70  0018 725f525c      	clr	21084
  71                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  73  001c 725f525d      	clr	21085
  74                     ; 70   TIM1->CCMR1 = 0x01;
  76  0020 35015258      	mov	21080,#1
  77                     ; 71   TIM1->CCMR2 = 0x01;
  79  0024 35015259      	mov	21081,#1
  80                     ; 72   TIM1->CCMR3 = 0x01;
  82  0028 3501525a      	mov	21082,#1
  83                     ; 73   TIM1->CCMR4 = 0x01;
  85  002c 3501525b      	mov	21083,#1
  86                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  88  0030 725f525c      	clr	21084
  89                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  91  0034 725f525d      	clr	21085
  92                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  94  0038 725f5258      	clr	21080
  95                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  97  003c 725f5259      	clr	21081
  98                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 100  0040 725f525a      	clr	21082
 101                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 103  0044 725f525b      	clr	21083
 104                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 106  0048 725f525e      	clr	21086
 107                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 109  004c 725f525f      	clr	21087
 110                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 112  0050 725f5260      	clr	21088
 113                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 115  0054 725f5261      	clr	21089
 116                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 118  0058 35ff5262      	mov	21090,#255
 119                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 121  005c 35ff5263      	mov	21091,#255
 122                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 124  0060 725f5265      	clr	21093
 125                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 127  0064 725f5266      	clr	21094
 128                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 130  0068 725f5267      	clr	21095
 131                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 133  006c 725f5268      	clr	21096
 134                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 136  0070 725f5269      	clr	21097
 137                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 139  0074 725f526a      	clr	21098
 140                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 142  0078 725f526b      	clr	21099
 143                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 145  007c 725f526c      	clr	21100
 146                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 148  0080 725f526f      	clr	21103
 149                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 151  0084 35015257      	mov	21079,#1
 152                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 154  0088 725f526e      	clr	21102
 155                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 157  008c 725f526d      	clr	21101
 158                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 160  0090 725f5264      	clr	21092
 161                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 163  0094 725f5255      	clr	21077
 164                     ; 101 }
 167  0098 81            	ret
 276                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 276                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 276                     ; 113                        uint16_t TIM1_Period,
 276                     ; 114                        uint8_t TIM1_RepetitionCounter)
 276                     ; 115 {
 277                     	switch	.text
 278  0099               _TIM1_TimeBaseInit:
 280  0099 89            	pushw	x
 281       00000000      OFST:	set	0
 284                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 286                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 288  009a 7b06          	ld	a,(OFST+6,sp)
 289  009c c75262        	ld	21090,a
 290                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 292  009f 7b07          	ld	a,(OFST+7,sp)
 293  00a1 c75263        	ld	21091,a
 294                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 296  00a4 9e            	ld	a,xh
 297  00a5 c75260        	ld	21088,a
 298                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 300  00a8 9f            	ld	a,xl
 301  00a9 c75261        	ld	21089,a
 302                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 302                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 304  00ac c65250        	ld	a,21072
 305  00af a48f          	and	a,#143
 306  00b1 1a05          	or	a,(OFST+5,sp)
 307  00b3 c75250        	ld	21072,a
 308                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 310  00b6 7b08          	ld	a,(OFST+8,sp)
 311  00b8 c75264        	ld	21092,a
 312                     ; 133 }
 315  00bb 85            	popw	x
 316  00bc 81            	ret
 601                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 601                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 601                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 601                     ; 157                   uint16_t TIM1_Pulse,
 601                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 601                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 601                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 601                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 601                     ; 162 {
 602                     	switch	.text
 603  00bd               _TIM1_OC1Init:
 605  00bd 89            	pushw	x
 606  00be 5203          	subw	sp,#3
 607       00000003      OFST:	set	3
 610                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 612                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 614                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 616                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 618                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 620                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 622                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 624                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 624                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 626  00c0 c6525c        	ld	a,21084
 627  00c3 a4f0          	and	a,#240
 628  00c5 c7525c        	ld	21084,a
 629                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 629                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 629                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 629                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 631  00c8 7b0c          	ld	a,(OFST+9,sp)
 632  00ca a408          	and	a,#8
 633  00cc 6b03          	ld	(OFST+0,sp),a
 635  00ce 7b0b          	ld	a,(OFST+8,sp)
 636  00d0 a402          	and	a,#2
 637  00d2 1a03          	or	a,(OFST+0,sp)
 638  00d4 6b02          	ld	(OFST-1,sp),a
 640  00d6 7b08          	ld	a,(OFST+5,sp)
 641  00d8 a404          	and	a,#4
 642  00da 6b01          	ld	(OFST-2,sp),a
 644  00dc 9f            	ld	a,xl
 645  00dd a401          	and	a,#1
 646  00df 1a01          	or	a,(OFST-2,sp)
 647  00e1 1a02          	or	a,(OFST-1,sp)
 648  00e3 ca525c        	or	a,21084
 649  00e6 c7525c        	ld	21084,a
 650                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 650                     ; 185                           (uint8_t)TIM1_OCMode);
 652  00e9 c65258        	ld	a,21080
 653  00ec a48f          	and	a,#143
 654  00ee 1a04          	or	a,(OFST+1,sp)
 655  00f0 c75258        	ld	21080,a
 656                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 658  00f3 c6526f        	ld	a,21103
 659  00f6 a4fc          	and	a,#252
 660  00f8 c7526f        	ld	21103,a
 661                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 661                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 663  00fb 7b0e          	ld	a,(OFST+11,sp)
 664  00fd a402          	and	a,#2
 665  00ff 6b03          	ld	(OFST+0,sp),a
 667  0101 7b0d          	ld	a,(OFST+10,sp)
 668  0103 a401          	and	a,#1
 669  0105 1a03          	or	a,(OFST+0,sp)
 670  0107 ca526f        	or	a,21103
 671  010a c7526f        	ld	21103,a
 672                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 674  010d 7b09          	ld	a,(OFST+6,sp)
 675  010f c75265        	ld	21093,a
 676                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 678  0112 7b0a          	ld	a,(OFST+7,sp)
 679  0114 c75266        	ld	21094,a
 680                     ; 196 }
 683  0117 5b05          	addw	sp,#5
 684  0119 81            	ret
 788                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 788                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 788                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 788                     ; 220                   uint16_t TIM1_Pulse,
 788                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 788                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 788                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 788                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 788                     ; 225 {
 789                     	switch	.text
 790  011a               _TIM1_OC2Init:
 792  011a 89            	pushw	x
 793  011b 5203          	subw	sp,#3
 794       00000003      OFST:	set	3
 797                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 799                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 801                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 803                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 805                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 807                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 809                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 811                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 811                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 813  011d c6525c        	ld	a,21084
 814  0120 a40f          	and	a,#15
 815  0122 c7525c        	ld	21084,a
 816                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 816                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 816                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 816                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 818  0125 7b0c          	ld	a,(OFST+9,sp)
 819  0127 a480          	and	a,#128
 820  0129 6b03          	ld	(OFST+0,sp),a
 822  012b 7b0b          	ld	a,(OFST+8,sp)
 823  012d a420          	and	a,#32
 824  012f 1a03          	or	a,(OFST+0,sp)
 825  0131 6b02          	ld	(OFST-1,sp),a
 827  0133 7b08          	ld	a,(OFST+5,sp)
 828  0135 a440          	and	a,#64
 829  0137 6b01          	ld	(OFST-2,sp),a
 831  0139 9f            	ld	a,xl
 832  013a a410          	and	a,#16
 833  013c 1a01          	or	a,(OFST-2,sp)
 834  013e 1a02          	or	a,(OFST-1,sp)
 835  0140 ca525c        	or	a,21084
 836  0143 c7525c        	ld	21084,a
 837                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 837                     ; 249                           (uint8_t)TIM1_OCMode);
 839  0146 c65259        	ld	a,21081
 840  0149 a48f          	and	a,#143
 841  014b 1a04          	or	a,(OFST+1,sp)
 842  014d c75259        	ld	21081,a
 843                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 845  0150 c6526f        	ld	a,21103
 846  0153 a4f3          	and	a,#243
 847  0155 c7526f        	ld	21103,a
 848                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 848                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 850  0158 7b0e          	ld	a,(OFST+11,sp)
 851  015a a408          	and	a,#8
 852  015c 6b03          	ld	(OFST+0,sp),a
 854  015e 7b0d          	ld	a,(OFST+10,sp)
 855  0160 a404          	and	a,#4
 856  0162 1a03          	or	a,(OFST+0,sp)
 857  0164 ca526f        	or	a,21103
 858  0167 c7526f        	ld	21103,a
 859                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 861  016a 7b09          	ld	a,(OFST+6,sp)
 862  016c c75267        	ld	21095,a
 863                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 865  016f 7b0a          	ld	a,(OFST+7,sp)
 866  0171 c75268        	ld	21096,a
 867                     ; 260 }
 870  0174 5b05          	addw	sp,#5
 871  0176 81            	ret
 975                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 975                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 975                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 975                     ; 284                   uint16_t TIM1_Pulse,
 975                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 975                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 975                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 975                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 975                     ; 289 {
 976                     	switch	.text
 977  0177               _TIM1_OC3Init:
 979  0177 89            	pushw	x
 980  0178 5203          	subw	sp,#3
 981       00000003      OFST:	set	3
 984                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 986                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 988                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 990                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 992                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 994                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 996                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 998                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 998                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1000  017a c6525d        	ld	a,21085
1001  017d a4f0          	and	a,#240
1002  017f c7525d        	ld	21085,a
1003                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1003                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1003                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1003                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1005  0182 7b0c          	ld	a,(OFST+9,sp)
1006  0184 a408          	and	a,#8
1007  0186 6b03          	ld	(OFST+0,sp),a
1009  0188 7b0b          	ld	a,(OFST+8,sp)
1010  018a a402          	and	a,#2
1011  018c 1a03          	or	a,(OFST+0,sp)
1012  018e 6b02          	ld	(OFST-1,sp),a
1014  0190 7b08          	ld	a,(OFST+5,sp)
1015  0192 a404          	and	a,#4
1016  0194 6b01          	ld	(OFST-2,sp),a
1018  0196 9f            	ld	a,xl
1019  0197 a401          	and	a,#1
1020  0199 1a01          	or	a,(OFST-2,sp)
1021  019b 1a02          	or	a,(OFST-1,sp)
1022  019d ca525d        	or	a,21085
1023  01a0 c7525d        	ld	21085,a
1024                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1024                     ; 312                           (uint8_t)TIM1_OCMode);
1026  01a3 c6525a        	ld	a,21082
1027  01a6 a48f          	and	a,#143
1028  01a8 1a04          	or	a,(OFST+1,sp)
1029  01aa c7525a        	ld	21082,a
1030                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1032  01ad c6526f        	ld	a,21103
1033  01b0 a4cf          	and	a,#207
1034  01b2 c7526f        	ld	21103,a
1035                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1035                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1037  01b5 7b0e          	ld	a,(OFST+11,sp)
1038  01b7 a420          	and	a,#32
1039  01b9 6b03          	ld	(OFST+0,sp),a
1041  01bb 7b0d          	ld	a,(OFST+10,sp)
1042  01bd a410          	and	a,#16
1043  01bf 1a03          	or	a,(OFST+0,sp)
1044  01c1 ca526f        	or	a,21103
1045  01c4 c7526f        	ld	21103,a
1046                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1048  01c7 7b09          	ld	a,(OFST+6,sp)
1049  01c9 c75269        	ld	21097,a
1050                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1052  01cc 7b0a          	ld	a,(OFST+7,sp)
1053  01ce c7526a        	ld	21098,a
1054                     ; 323 }
1057  01d1 5b05          	addw	sp,#5
1058  01d3 81            	ret
1132                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1132                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1132                     ; 340                   uint16_t TIM1_Pulse,
1132                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1132                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1132                     ; 343 {
1133                     	switch	.text
1134  01d4               _TIM1_OC4Init:
1136  01d4 89            	pushw	x
1137  01d5 88            	push	a
1138       00000001      OFST:	set	1
1141                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1143                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1145                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1147                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1149                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1151  01d6 c6525d        	ld	a,21085
1152  01d9 a4cf          	and	a,#207
1153  01db c7525d        	ld	21085,a
1154                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1154                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1156  01de 7b08          	ld	a,(OFST+7,sp)
1157  01e0 a420          	and	a,#32
1158  01e2 6b01          	ld	(OFST+0,sp),a
1160  01e4 9f            	ld	a,xl
1161  01e5 a410          	and	a,#16
1162  01e7 1a01          	or	a,(OFST+0,sp)
1163  01e9 ca525d        	or	a,21085
1164  01ec c7525d        	ld	21085,a
1165                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1165                     ; 358                           TIM1_OCMode);
1167  01ef c6525b        	ld	a,21083
1168  01f2 a48f          	and	a,#143
1169  01f4 1a02          	or	a,(OFST+1,sp)
1170  01f6 c7525b        	ld	21083,a
1171                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1173  01f9 0d09          	tnz	(OFST+8,sp)
1174  01fb 270a          	jreq	L534
1175                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1177  01fd c6526f        	ld	a,21103
1178  0200 aadf          	or	a,#223
1179  0202 c7526f        	ld	21103,a
1181  0205 2004          	jra	L734
1182  0207               L534:
1183                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1185  0207 721d526f      	bres	21103,#6
1186  020b               L734:
1187                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1189  020b 7b06          	ld	a,(OFST+5,sp)
1190  020d c7526b        	ld	21099,a
1191                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1193  0210 7b07          	ld	a,(OFST+6,sp)
1194  0212 c7526c        	ld	21100,a
1195                     ; 373 }
1198  0215 5b03          	addw	sp,#3
1199  0217 81            	ret
1404                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1404                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1404                     ; 390                      uint8_t TIM1_DeadTime,
1404                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1404                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1404                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1404                     ; 394 {
1405                     	switch	.text
1406  0218               _TIM1_BDTRConfig:
1408  0218 89            	pushw	x
1409  0219 88            	push	a
1410       00000001      OFST:	set	1
1413                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1415                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1417                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1419                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1421                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1423                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1425  021a 7b06          	ld	a,(OFST+5,sp)
1426  021c c7526e        	ld	21102,a
1427                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1427                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1427                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1429  021f 7b07          	ld	a,(OFST+6,sp)
1430  0221 1a08          	or	a,(OFST+7,sp)
1431  0223 1a09          	or	a,(OFST+8,sp)
1432  0225 6b01          	ld	(OFST+0,sp),a
1434  0227 9f            	ld	a,xl
1435  0228 1a02          	or	a,(OFST+1,sp)
1436  022a 1a01          	or	a,(OFST+0,sp)
1437  022c c7526d        	ld	21101,a
1438                     ; 409 }
1441  022f 5b03          	addw	sp,#3
1442  0231 81            	ret
1644                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1644                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1644                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1644                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1644                     ; 427                  uint8_t TIM1_ICFilter)
1644                     ; 428 {
1645                     	switch	.text
1646  0232               _TIM1_ICInit:
1648  0232 89            	pushw	x
1649       00000000      OFST:	set	0
1652                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1654                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1656                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1658                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1660                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1662                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1664  0233 9e            	ld	a,xh
1665  0234 4d            	tnz	a
1666  0235 2614          	jrne	L766
1667                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1667                     ; 440                (uint8_t)TIM1_ICSelection,
1667                     ; 441                (uint8_t)TIM1_ICFilter);
1669  0237 7b07          	ld	a,(OFST+7,sp)
1670  0239 88            	push	a
1671  023a 7b06          	ld	a,(OFST+6,sp)
1672  023c 97            	ld	xl,a
1673  023d 7b03          	ld	a,(OFST+3,sp)
1674  023f 95            	ld	xh,a
1675  0240 cd080e        	call	L3_TI1_Config
1677  0243 84            	pop	a
1678                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1680  0244 7b06          	ld	a,(OFST+6,sp)
1681  0246 cd06b6        	call	_TIM1_SetIC1Prescaler
1684  0249 2046          	jra	L176
1685  024b               L766:
1686                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1688  024b 7b01          	ld	a,(OFST+1,sp)
1689  024d a101          	cp	a,#1
1690  024f 2614          	jrne	L376
1691                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1691                     ; 449                (uint8_t)TIM1_ICSelection,
1691                     ; 450                (uint8_t)TIM1_ICFilter);
1693  0251 7b07          	ld	a,(OFST+7,sp)
1694  0253 88            	push	a
1695  0254 7b06          	ld	a,(OFST+6,sp)
1696  0256 97            	ld	xl,a
1697  0257 7b03          	ld	a,(OFST+3,sp)
1698  0259 95            	ld	xh,a
1699  025a cd083e        	call	L5_TI2_Config
1701  025d 84            	pop	a
1702                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1704  025e 7b06          	ld	a,(OFST+6,sp)
1705  0260 cd06c3        	call	_TIM1_SetIC2Prescaler
1708  0263 202c          	jra	L176
1709  0265               L376:
1710                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1712  0265 7b01          	ld	a,(OFST+1,sp)
1713  0267 a102          	cp	a,#2
1714  0269 2614          	jrne	L776
1715                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1715                     ; 458                (uint8_t)TIM1_ICSelection,
1715                     ; 459                (uint8_t)TIM1_ICFilter);
1717  026b 7b07          	ld	a,(OFST+7,sp)
1718  026d 88            	push	a
1719  026e 7b06          	ld	a,(OFST+6,sp)
1720  0270 97            	ld	xl,a
1721  0271 7b03          	ld	a,(OFST+3,sp)
1722  0273 95            	ld	xh,a
1723  0274 cd086e        	call	L7_TI3_Config
1725  0277 84            	pop	a
1726                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1728  0278 7b06          	ld	a,(OFST+6,sp)
1729  027a cd06d0        	call	_TIM1_SetIC3Prescaler
1732  027d 2012          	jra	L176
1733  027f               L776:
1734                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1734                     ; 467                (uint8_t)TIM1_ICSelection,
1734                     ; 468                (uint8_t)TIM1_ICFilter);
1736  027f 7b07          	ld	a,(OFST+7,sp)
1737  0281 88            	push	a
1738  0282 7b06          	ld	a,(OFST+6,sp)
1739  0284 97            	ld	xl,a
1740  0285 7b03          	ld	a,(OFST+3,sp)
1741  0287 95            	ld	xh,a
1742  0288 cd089e        	call	L11_TI4_Config
1744  028b 84            	pop	a
1745                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1747  028c 7b06          	ld	a,(OFST+6,sp)
1748  028e cd06dd        	call	_TIM1_SetIC4Prescaler
1750  0291               L176:
1751                     ; 472 }
1754  0291 85            	popw	x
1755  0292 81            	ret
1851                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1851                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1851                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1851                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1851                     ; 492                      uint8_t TIM1_ICFilter)
1851                     ; 493 {
1852                     	switch	.text
1853  0293               _TIM1_PWMIConfig:
1855  0293 89            	pushw	x
1856  0294 89            	pushw	x
1857       00000002      OFST:	set	2
1860                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1862                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1864                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1866                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1868                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1870                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1872                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1874  0295 9f            	ld	a,xl
1875  0296 a101          	cp	a,#1
1876  0298 2706          	jreq	L157
1877                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1879  029a a601          	ld	a,#1
1880  029c 6b01          	ld	(OFST-1,sp),a
1883  029e 2002          	jra	L357
1884  02a0               L157:
1885                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1887  02a0 0f01          	clr	(OFST-1,sp)
1889  02a2               L357:
1890                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1892  02a2 7b07          	ld	a,(OFST+5,sp)
1893  02a4 a101          	cp	a,#1
1894  02a6 2606          	jrne	L557
1895                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1897  02a8 a602          	ld	a,#2
1898  02aa 6b02          	ld	(OFST+0,sp),a
1901  02ac 2004          	jra	L757
1902  02ae               L557:
1903                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1905  02ae a601          	ld	a,#1
1906  02b0 6b02          	ld	(OFST+0,sp),a
1908  02b2               L757:
1909                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1911  02b2 0d03          	tnz	(OFST+1,sp)
1912  02b4 2626          	jrne	L167
1913                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1913                     ; 527                (uint8_t)TIM1_ICFilter);
1915  02b6 7b09          	ld	a,(OFST+7,sp)
1916  02b8 88            	push	a
1917  02b9 7b08          	ld	a,(OFST+6,sp)
1918  02bb 97            	ld	xl,a
1919  02bc 7b05          	ld	a,(OFST+3,sp)
1920  02be 95            	ld	xh,a
1921  02bf cd080e        	call	L3_TI1_Config
1923  02c2 84            	pop	a
1924                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1926  02c3 7b08          	ld	a,(OFST+6,sp)
1927  02c5 cd06b6        	call	_TIM1_SetIC1Prescaler
1929                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1931  02c8 7b09          	ld	a,(OFST+7,sp)
1932  02ca 88            	push	a
1933  02cb 7b03          	ld	a,(OFST+1,sp)
1934  02cd 97            	ld	xl,a
1935  02ce 7b02          	ld	a,(OFST+0,sp)
1936  02d0 95            	ld	xh,a
1937  02d1 cd083e        	call	L5_TI2_Config
1939  02d4 84            	pop	a
1940                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1942  02d5 7b08          	ld	a,(OFST+6,sp)
1943  02d7 cd06c3        	call	_TIM1_SetIC2Prescaler
1946  02da 2024          	jra	L367
1947  02dc               L167:
1948                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1948                     ; 542                (uint8_t)TIM1_ICFilter);
1950  02dc 7b09          	ld	a,(OFST+7,sp)
1951  02de 88            	push	a
1952  02df 7b08          	ld	a,(OFST+6,sp)
1953  02e1 97            	ld	xl,a
1954  02e2 7b05          	ld	a,(OFST+3,sp)
1955  02e4 95            	ld	xh,a
1956  02e5 cd083e        	call	L5_TI2_Config
1958  02e8 84            	pop	a
1959                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1961  02e9 7b08          	ld	a,(OFST+6,sp)
1962  02eb cd06c3        	call	_TIM1_SetIC2Prescaler
1964                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1966  02ee 7b09          	ld	a,(OFST+7,sp)
1967  02f0 88            	push	a
1968  02f1 7b03          	ld	a,(OFST+1,sp)
1969  02f3 97            	ld	xl,a
1970  02f4 7b02          	ld	a,(OFST+0,sp)
1971  02f6 95            	ld	xh,a
1972  02f7 cd080e        	call	L3_TI1_Config
1974  02fa 84            	pop	a
1975                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1977  02fb 7b08          	ld	a,(OFST+6,sp)
1978  02fd cd06b6        	call	_TIM1_SetIC1Prescaler
1980  0300               L367:
1981                     ; 553 }
1984  0300 5b04          	addw	sp,#4
1985  0302 81            	ret
2040                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2040                     ; 562 {
2041                     	switch	.text
2042  0303               _TIM1_Cmd:
2046                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2048                     ; 567   if (NewState != DISABLE)
2050  0303 4d            	tnz	a
2051  0304 2706          	jreq	L3101
2052                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2054  0306 72105250      	bset	21072,#0
2056  030a 2004          	jra	L5101
2057  030c               L3101:
2058                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2060  030c 72115250      	bres	21072,#0
2061  0310               L5101:
2062                     ; 575 }
2065  0310 81            	ret
2101                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2101                     ; 584 {
2102                     	switch	.text
2103  0311               _TIM1_CtrlPWMOutputs:
2107                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2109                     ; 590   if (NewState != DISABLE)
2111  0311 4d            	tnz	a
2112  0312 2706          	jreq	L5301
2113                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2115  0314 721e526d      	bset	21101,#7
2117  0318 2004          	jra	L7301
2118  031a               L5301:
2119                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2121  031a 721f526d      	bres	21101,#7
2122  031e               L7301:
2123                     ; 598 }
2126  031e 81            	ret
2233                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2233                     ; 618 {
2234                     	switch	.text
2235  031f               _TIM1_ITConfig:
2237  031f 89            	pushw	x
2238       00000000      OFST:	set	0
2241                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2243                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2245                     ; 623   if (NewState != DISABLE)
2247  0320 9f            	ld	a,xl
2248  0321 4d            	tnz	a
2249  0322 2709          	jreq	L7011
2250                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2252  0324 9e            	ld	a,xh
2253  0325 ca5254        	or	a,21076
2254  0328 c75254        	ld	21076,a
2256  032b 2009          	jra	L1111
2257  032d               L7011:
2258                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2260  032d 7b01          	ld	a,(OFST+1,sp)
2261  032f 43            	cpl	a
2262  0330 c45254        	and	a,21076
2263  0333 c75254        	ld	21076,a
2264  0336               L1111:
2265                     ; 633 }
2268  0336 85            	popw	x
2269  0337 81            	ret
2293                     ; 640 void TIM1_InternalClockConfig(void)
2293                     ; 641 {
2294                     	switch	.text
2295  0338               _TIM1_InternalClockConfig:
2299                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2301  0338 c65252        	ld	a,21074
2302  033b a4f8          	and	a,#248
2303  033d c75252        	ld	21074,a
2304                     ; 644 }
2307  0340 81            	ret
2424                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2424                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2424                     ; 664                               uint8_t ExtTRGFilter)
2424                     ; 665 {
2425                     	switch	.text
2426  0341               _TIM1_ETRClockMode1Config:
2428  0341 89            	pushw	x
2429       00000000      OFST:	set	0
2432                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2434                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2436                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2438  0342 7b05          	ld	a,(OFST+5,sp)
2439  0344 88            	push	a
2440  0345 9f            	ld	a,xl
2441  0346 97            	ld	xl,a
2442  0347 7b02          	ld	a,(OFST+2,sp)
2443  0349 95            	ld	xh,a
2444  034a ad1f          	call	_TIM1_ETRConfig
2446  034c 84            	pop	a
2447                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2447                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2449  034d c65252        	ld	a,21074
2450  0350 a488          	and	a,#136
2451  0352 aa77          	or	a,#119
2452  0354 c75252        	ld	21074,a
2453                     ; 676 }
2456  0357 85            	popw	x
2457  0358 81            	ret
2515                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2515                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2515                     ; 696                               uint8_t ExtTRGFilter)
2515                     ; 697 {
2516                     	switch	.text
2517  0359               _TIM1_ETRClockMode2Config:
2519  0359 89            	pushw	x
2520       00000000      OFST:	set	0
2523                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2525                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2527                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2529  035a 7b05          	ld	a,(OFST+5,sp)
2530  035c 88            	push	a
2531  035d 9f            	ld	a,xl
2532  035e 97            	ld	xl,a
2533  035f 7b02          	ld	a,(OFST+2,sp)
2534  0361 95            	ld	xh,a
2535  0362 ad07          	call	_TIM1_ETRConfig
2537  0364 84            	pop	a
2538                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2540  0365 721c5253      	bset	21075,#6
2541                     ; 707 }
2544  0369 85            	popw	x
2545  036a 81            	ret
2601                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2601                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2601                     ; 727                     uint8_t ExtTRGFilter)
2601                     ; 728 {
2602                     	switch	.text
2603  036b               _TIM1_ETRConfig:
2605  036b 89            	pushw	x
2606       00000000      OFST:	set	0
2609                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2611                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2611                     ; 733                          (uint8_t)ExtTRGFilter );
2613  036c 9f            	ld	a,xl
2614  036d 1a01          	or	a,(OFST+1,sp)
2615  036f 1a05          	or	a,(OFST+5,sp)
2616  0371 ca5253        	or	a,21075
2617  0374 c75253        	ld	21075,a
2618                     ; 734 }
2621  0377 85            	popw	x
2622  0378 81            	ret
2711                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2711                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2711                     ; 753                                  uint8_t ICFilter)
2711                     ; 754 {
2712                     	switch	.text
2713  0379               _TIM1_TIxExternalClockConfig:
2715  0379 89            	pushw	x
2716       00000000      OFST:	set	0
2719                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2721                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2723                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2725                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2727  037a 9e            	ld	a,xh
2728  037b a160          	cp	a,#96
2729  037d 260e          	jrne	L1131
2730                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2732  037f 7b05          	ld	a,(OFST+5,sp)
2733  0381 88            	push	a
2734  0382 9f            	ld	a,xl
2735  0383 ae0001        	ldw	x,#1
2736  0386 95            	ld	xh,a
2737  0387 cd083e        	call	L5_TI2_Config
2739  038a 84            	pop	a
2741  038b 200d          	jra	L3131
2742  038d               L1131:
2743                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2745  038d 7b05          	ld	a,(OFST+5,sp)
2746  038f 88            	push	a
2747  0390 7b03          	ld	a,(OFST+3,sp)
2748  0392 ae0001        	ldw	x,#1
2749  0395 95            	ld	xh,a
2750  0396 cd080e        	call	L3_TI1_Config
2752  0399 84            	pop	a
2753  039a               L3131:
2754                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2756  039a 7b01          	ld	a,(OFST+1,sp)
2757  039c ad0a          	call	_TIM1_SelectInputTrigger
2759                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2761  039e c65252        	ld	a,21074
2762  03a1 aa07          	or	a,#7
2763  03a3 c75252        	ld	21074,a
2764                     ; 775 }
2767  03a6 85            	popw	x
2768  03a7 81            	ret
2853                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2853                     ; 788 {
2854                     	switch	.text
2855  03a8               _TIM1_SelectInputTrigger:
2857  03a8 88            	push	a
2858       00000000      OFST:	set	0
2861                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2863                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2865  03a9 c65252        	ld	a,21074
2866  03ac a48f          	and	a,#143
2867  03ae 1a01          	or	a,(OFST+1,sp)
2868  03b0 c75252        	ld	21074,a
2869                     ; 794 }
2872  03b3 84            	pop	a
2873  03b4 81            	ret
2909                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2909                     ; 804 {
2910                     	switch	.text
2911  03b5               _TIM1_UpdateDisableConfig:
2915                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2917                     ; 809   if (NewState != DISABLE)
2919  03b5 4d            	tnz	a
2920  03b6 2706          	jreq	L1731
2921                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2923  03b8 72125250      	bset	21072,#1
2925  03bc 2004          	jra	L3731
2926  03be               L1731:
2927                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2929  03be 72135250      	bres	21072,#1
2930  03c2               L3731:
2931                     ; 817 }
2934  03c2 81            	ret
2992                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2992                     ; 828 {
2993                     	switch	.text
2994  03c3               _TIM1_UpdateRequestConfig:
2998                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
3000                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3002  03c3 4d            	tnz	a
3003  03c4 2706          	jreq	L3241
3004                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
3006  03c6 72145250      	bset	21072,#2
3008  03ca 2004          	jra	L5241
3009  03cc               L3241:
3010                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3012  03cc 72155250      	bres	21072,#2
3013  03d0               L5241:
3014                     ; 841 }
3017  03d0 81            	ret
3053                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3053                     ; 850 {
3054                     	switch	.text
3055  03d1               _TIM1_SelectHallSensor:
3059                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3061                     ; 855   if (NewState != DISABLE)
3063  03d1 4d            	tnz	a
3064  03d2 2706          	jreq	L5441
3065                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3067  03d4 721e5251      	bset	21073,#7
3069  03d8 2004          	jra	L7441
3070  03da               L5441:
3071                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3073  03da 721f5251      	bres	21073,#7
3074  03de               L7441:
3075                     ; 863 }
3078  03de 81            	ret
3135                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3135                     ; 874 {
3136                     	switch	.text
3137  03df               _TIM1_SelectOnePulseMode:
3141                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3143                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3145  03df 4d            	tnz	a
3146  03e0 2706          	jreq	L7741
3147                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3149  03e2 72165250      	bset	21072,#3
3151  03e6 2004          	jra	L1051
3152  03e8               L7741:
3153                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3155  03e8 72175250      	bres	21072,#3
3156  03ec               L1051:
3157                     ; 888 }
3160  03ec 81            	ret
3258                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3258                     ; 904 {
3259                     	switch	.text
3260  03ed               _TIM1_SelectOutputTrigger:
3262  03ed 88            	push	a
3263       00000000      OFST:	set	0
3266                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3268                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3268                     ; 910                         (uint8_t) TIM1_TRGOSource);
3270  03ee c65251        	ld	a,21073
3271  03f1 a48f          	and	a,#143
3272  03f3 1a01          	or	a,(OFST+1,sp)
3273  03f5 c75251        	ld	21073,a
3274                     ; 911 }
3277  03f8 84            	pop	a
3278  03f9 81            	ret
3352                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3352                     ; 924 {
3353                     	switch	.text
3354  03fa               _TIM1_SelectSlaveMode:
3356  03fa 88            	push	a
3357       00000000      OFST:	set	0
3360                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3362                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3362                     ; 930                          (uint8_t)TIM1_SlaveMode);
3364  03fb c65252        	ld	a,21074
3365  03fe a4f8          	and	a,#248
3366  0400 1a01          	or	a,(OFST+1,sp)
3367  0402 c75252        	ld	21074,a
3368                     ; 931 }
3371  0405 84            	pop	a
3372  0406 81            	ret
3408                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3408                     ; 940 {
3409                     	switch	.text
3410  0407               _TIM1_SelectMasterSlaveMode:
3414                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3416                     ; 945   if (NewState != DISABLE)
3418  0407 4d            	tnz	a
3419  0408 2706          	jreq	L3161
3420                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3422  040a 721e5252      	bset	21074,#7
3424  040e 2004          	jra	L5161
3425  0410               L3161:
3426                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3428  0410 721f5252      	bres	21074,#7
3429  0414               L5161:
3430                     ; 953 }
3433  0414 81            	ret
3519                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3519                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3519                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3519                     ; 978 {
3520                     	switch	.text
3521  0415               _TIM1_EncoderInterfaceConfig:
3523  0415 89            	pushw	x
3524       00000000      OFST:	set	0
3527                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3529                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3531                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3533                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3535  0416 9f            	ld	a,xl
3536  0417 4d            	tnz	a
3537  0418 2706          	jreq	L7561
3538                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3540  041a 7212525c      	bset	21084,#1
3542  041e 2004          	jra	L1661
3543  0420               L7561:
3544                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3546  0420 7213525c      	bres	21084,#1
3547  0424               L1661:
3548                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3550  0424 0d05          	tnz	(OFST+5,sp)
3551  0426 2706          	jreq	L3661
3552                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3554  0428 721a525c      	bset	21084,#5
3556  042c 2004          	jra	L5661
3557  042e               L3661:
3558                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3560  042e 721b525c      	bres	21084,#5
3561  0432               L5661:
3562                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3562                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3564  0432 c65252        	ld	a,21074
3565  0435 a4f0          	and	a,#240
3566  0437 1a01          	or	a,(OFST+1,sp)
3567  0439 c75252        	ld	21074,a
3568                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3568                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3570  043c c65258        	ld	a,21080
3571  043f a4fc          	and	a,#252
3572  0441 aa01          	or	a,#1
3573  0443 c75258        	ld	21080,a
3574                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3574                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3576  0446 c65259        	ld	a,21081
3577  0449 a4fc          	and	a,#252
3578  044b aa01          	or	a,#1
3579  044d c75259        	ld	21081,a
3580                     ; 1011 }
3583  0450 85            	popw	x
3584  0451 81            	ret
3651                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3651                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3651                     ; 1025 {
3652                     	switch	.text
3653  0452               _TIM1_PrescalerConfig:
3655  0452 89            	pushw	x
3656       00000000      OFST:	set	0
3659                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3661                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3663  0453 9e            	ld	a,xh
3664  0454 c75260        	ld	21088,a
3665                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3667  0457 9f            	ld	a,xl
3668  0458 c75261        	ld	21089,a
3669                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3671  045b 7b05          	ld	a,(OFST+5,sp)
3672  045d c75257        	ld	21079,a
3673                     ; 1035 }
3676  0460 85            	popw	x
3677  0461 81            	ret
3713                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3713                     ; 1049 {
3714                     	switch	.text
3715  0462               _TIM1_CounterModeConfig:
3717  0462 88            	push	a
3718       00000000      OFST:	set	0
3721                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3723                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3723                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3725  0463 c65250        	ld	a,21072
3726  0466 a48f          	and	a,#143
3727  0468 1a01          	or	a,(OFST+1,sp)
3728  046a c75250        	ld	21072,a
3729                     ; 1057 }
3732  046d 84            	pop	a
3733  046e 81            	ret
3791                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3791                     ; 1068 {
3792                     	switch	.text
3793  046f               _TIM1_ForcedOC1Config:
3795  046f 88            	push	a
3796       00000000      OFST:	set	0
3799                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3801                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3801                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3803  0470 c65258        	ld	a,21080
3804  0473 a48f          	and	a,#143
3805  0475 1a01          	or	a,(OFST+1,sp)
3806  0477 c75258        	ld	21080,a
3807                     ; 1075 }
3810  047a 84            	pop	a
3811  047b 81            	ret
3847                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3847                     ; 1086 {
3848                     	switch	.text
3849  047c               _TIM1_ForcedOC2Config:
3851  047c 88            	push	a
3852       00000000      OFST:	set	0
3855                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3857                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3857                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3859  047d c65259        	ld	a,21081
3860  0480 a48f          	and	a,#143
3861  0482 1a01          	or	a,(OFST+1,sp)
3862  0484 c75259        	ld	21081,a
3863                     ; 1093 }
3866  0487 84            	pop	a
3867  0488 81            	ret
3903                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3903                     ; 1105 {
3904                     	switch	.text
3905  0489               _TIM1_ForcedOC3Config:
3907  0489 88            	push	a
3908       00000000      OFST:	set	0
3911                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3913                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3913                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3915  048a c6525a        	ld	a,21082
3916  048d a48f          	and	a,#143
3917  048f 1a01          	or	a,(OFST+1,sp)
3918  0491 c7525a        	ld	21082,a
3919                     ; 1112 }
3922  0494 84            	pop	a
3923  0495 81            	ret
3959                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3959                     ; 1124 {
3960                     	switch	.text
3961  0496               _TIM1_ForcedOC4Config:
3963  0496 88            	push	a
3964       00000000      OFST:	set	0
3967                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3969                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3969                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3971  0497 c6525b        	ld	a,21083
3972  049a a48f          	and	a,#143
3973  049c 1a01          	or	a,(OFST+1,sp)
3974  049e c7525b        	ld	21083,a
3975                     ; 1131 }
3978  04a1 84            	pop	a
3979  04a2 81            	ret
4015                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4015                     ; 1140 {
4016                     	switch	.text
4017  04a3               _TIM1_ARRPreloadConfig:
4021                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4023                     ; 1145   if (NewState != DISABLE)
4025  04a3 4d            	tnz	a
4026  04a4 2706          	jreq	L5502
4027                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4029  04a6 721e5250      	bset	21072,#7
4031  04aa 2004          	jra	L7502
4032  04ac               L5502:
4033                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4035  04ac 721f5250      	bres	21072,#7
4036  04b0               L7502:
4037                     ; 1153 }
4040  04b0 81            	ret
4075                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4075                     ; 1162 {
4076                     	switch	.text
4077  04b1               _TIM1_SelectCOM:
4081                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4083                     ; 1167   if (NewState != DISABLE)
4085  04b1 4d            	tnz	a
4086  04b2 2706          	jreq	L7702
4087                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4089  04b4 72145251      	bset	21073,#2
4091  04b8 2004          	jra	L1012
4092  04ba               L7702:
4093                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4095  04ba 72155251      	bres	21073,#2
4096  04be               L1012:
4097                     ; 1175 }
4100  04be 81            	ret
4136                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4136                     ; 1184 {
4137                     	switch	.text
4138  04bf               _TIM1_CCPreloadControl:
4142                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4144                     ; 1189   if (NewState != DISABLE)
4146  04bf 4d            	tnz	a
4147  04c0 2706          	jreq	L1212
4148                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4150  04c2 72105251      	bset	21073,#0
4152  04c6 2004          	jra	L3212
4153  04c8               L1212:
4154                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4156  04c8 72115251      	bres	21073,#0
4157  04cc               L3212:
4158                     ; 1197 }
4161  04cc 81            	ret
4197                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4197                     ; 1206 {
4198                     	switch	.text
4199  04cd               _TIM1_OC1PreloadConfig:
4203                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4205                     ; 1211   if (NewState != DISABLE)
4207  04cd 4d            	tnz	a
4208  04ce 2706          	jreq	L3412
4209                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4211  04d0 72165258      	bset	21080,#3
4213  04d4 2004          	jra	L5412
4214  04d6               L3412:
4215                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4217  04d6 72175258      	bres	21080,#3
4218  04da               L5412:
4219                     ; 1219 }
4222  04da 81            	ret
4258                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4258                     ; 1228 {
4259                     	switch	.text
4260  04db               _TIM1_OC2PreloadConfig:
4264                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4266                     ; 1233   if (NewState != DISABLE)
4268  04db 4d            	tnz	a
4269  04dc 2706          	jreq	L5612
4270                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4272  04de 72165259      	bset	21081,#3
4274  04e2 2004          	jra	L7612
4275  04e4               L5612:
4276                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4278  04e4 72175259      	bres	21081,#3
4279  04e8               L7612:
4280                     ; 1241 }
4283  04e8 81            	ret
4319                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4319                     ; 1250 {
4320                     	switch	.text
4321  04e9               _TIM1_OC3PreloadConfig:
4325                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4327                     ; 1255   if (NewState != DISABLE)
4329  04e9 4d            	tnz	a
4330  04ea 2706          	jreq	L7022
4331                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4333  04ec 7216525a      	bset	21082,#3
4335  04f0 2004          	jra	L1122
4336  04f2               L7022:
4337                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4339  04f2 7217525a      	bres	21082,#3
4340  04f6               L1122:
4341                     ; 1263 }
4344  04f6 81            	ret
4380                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4380                     ; 1272 {
4381                     	switch	.text
4382  04f7               _TIM1_OC4PreloadConfig:
4386                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4388                     ; 1277   if (NewState != DISABLE)
4390  04f7 4d            	tnz	a
4391  04f8 2706          	jreq	L1322
4392                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4394  04fa 7216525b      	bset	21083,#3
4396  04fe 2004          	jra	L3322
4397  0500               L1322:
4398                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4400  0500 7217525b      	bres	21083,#3
4401  0504               L3322:
4402                     ; 1285 }
4405  0504 81            	ret
4440                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4440                     ; 1294 {
4441                     	switch	.text
4442  0505               _TIM1_OC1FastConfig:
4446                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4448                     ; 1299   if (NewState != DISABLE)
4450  0505 4d            	tnz	a
4451  0506 2706          	jreq	L3522
4452                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4454  0508 72145258      	bset	21080,#2
4456  050c 2004          	jra	L5522
4457  050e               L3522:
4458                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4460  050e 72155258      	bres	21080,#2
4461  0512               L5522:
4462                     ; 1307 }
4465  0512 81            	ret
4500                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4500                     ; 1316 {
4501                     	switch	.text
4502  0513               _TIM1_OC2FastConfig:
4506                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4508                     ; 1321   if (NewState != DISABLE)
4510  0513 4d            	tnz	a
4511  0514 2706          	jreq	L5722
4512                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4514  0516 72145259      	bset	21081,#2
4516  051a 2004          	jra	L7722
4517  051c               L5722:
4518                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4520  051c 72155259      	bres	21081,#2
4521  0520               L7722:
4522                     ; 1329 }
4525  0520 81            	ret
4560                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4560                     ; 1338 {
4561                     	switch	.text
4562  0521               _TIM1_OC3FastConfig:
4566                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4568                     ; 1343   if (NewState != DISABLE)
4570  0521 4d            	tnz	a
4571  0522 2706          	jreq	L7132
4572                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4574  0524 7214525a      	bset	21082,#2
4576  0528 2004          	jra	L1232
4577  052a               L7132:
4578                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4580  052a 7215525a      	bres	21082,#2
4581  052e               L1232:
4582                     ; 1351 }
4585  052e 81            	ret
4620                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4620                     ; 1360 {
4621                     	switch	.text
4622  052f               _TIM1_OC4FastConfig:
4626                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4628                     ; 1365   if (NewState != DISABLE)
4630  052f 4d            	tnz	a
4631  0530 2706          	jreq	L1432
4632                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4634  0532 7214525b      	bset	21083,#2
4636  0536 2004          	jra	L3432
4637  0538               L1432:
4638                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4640  0538 7215525b      	bres	21083,#2
4641  053c               L3432:
4642                     ; 1373 }
4645  053c 81            	ret
4750                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4750                     ; 1390 {
4751                     	switch	.text
4752  053d               _TIM1_GenerateEvent:
4756                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4758                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4760  053d c75257        	ld	21079,a
4761                     ; 1396 }
4764  0540 81            	ret
4800                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4800                     ; 1407 {
4801                     	switch	.text
4802  0541               _TIM1_OC1PolarityConfig:
4806                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4808                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4810  0541 4d            	tnz	a
4811  0542 2706          	jreq	L5242
4812                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4814  0544 7212525c      	bset	21084,#1
4816  0548 2004          	jra	L7242
4817  054a               L5242:
4818                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4820  054a 7213525c      	bres	21084,#1
4821  054e               L7242:
4822                     ; 1420 }
4825  054e 81            	ret
4861                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4861                     ; 1431 {
4862                     	switch	.text
4863  054f               _TIM1_OC1NPolarityConfig:
4867                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4869                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4871  054f 4d            	tnz	a
4872  0550 2706          	jreq	L7442
4873                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4875  0552 7216525c      	bset	21084,#3
4877  0556 2004          	jra	L1542
4878  0558               L7442:
4879                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4881  0558 7217525c      	bres	21084,#3
4882  055c               L1542:
4883                     ; 1444 }
4886  055c 81            	ret
4922                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4922                     ; 1455 {
4923                     	switch	.text
4924  055d               _TIM1_OC2PolarityConfig:
4928                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4930                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4932  055d 4d            	tnz	a
4933  055e 2706          	jreq	L1742
4934                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4936  0560 721a525c      	bset	21084,#5
4938  0564 2004          	jra	L3742
4939  0566               L1742:
4940                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4942  0566 721b525c      	bres	21084,#5
4943  056a               L3742:
4944                     ; 1468 }
4947  056a 81            	ret
4983                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4983                     ; 1479 {
4984                     	switch	.text
4985  056b               _TIM1_OC2NPolarityConfig:
4989                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4991                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4993  056b 4d            	tnz	a
4994  056c 2706          	jreq	L3152
4995                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4997  056e 721e525c      	bset	21084,#7
4999  0572 2004          	jra	L5152
5000  0574               L3152:
5001                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
5003  0574 721f525c      	bres	21084,#7
5004  0578               L5152:
5005                     ; 1492 }
5008  0578 81            	ret
5044                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5044                     ; 1503 {
5045                     	switch	.text
5046  0579               _TIM1_OC3PolarityConfig:
5050                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5052                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5054  0579 4d            	tnz	a
5055  057a 2706          	jreq	L5352
5056                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5058  057c 7212525d      	bset	21085,#1
5060  0580 2004          	jra	L7352
5061  0582               L5352:
5062                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5064  0582 7213525d      	bres	21085,#1
5065  0586               L7352:
5066                     ; 1516 }
5069  0586 81            	ret
5105                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5105                     ; 1528 {
5106                     	switch	.text
5107  0587               _TIM1_OC3NPolarityConfig:
5111                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5113                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5115  0587 4d            	tnz	a
5116  0588 2706          	jreq	L7552
5117                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5119  058a 7216525d      	bset	21085,#3
5121  058e 2004          	jra	L1652
5122  0590               L7552:
5123                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5125  0590 7217525d      	bres	21085,#3
5126  0594               L1652:
5127                     ; 1541 }
5130  0594 81            	ret
5166                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5166                     ; 1552 {
5167                     	switch	.text
5168  0595               _TIM1_OC4PolarityConfig:
5172                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5174                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5176  0595 4d            	tnz	a
5177  0596 2706          	jreq	L1062
5178                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5180  0598 721a525d      	bset	21085,#5
5182  059c 2004          	jra	L3062
5183  059e               L1062:
5184                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5186  059e 721b525d      	bres	21085,#5
5187  05a2               L3062:
5188                     ; 1565 }
5191  05a2 81            	ret
5236                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5236                     ; 1580 {
5237                     	switch	.text
5238  05a3               _TIM1_CCxCmd:
5240  05a3 89            	pushw	x
5241       00000000      OFST:	set	0
5244                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5246                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5248                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5250  05a4 9e            	ld	a,xh
5251  05a5 4d            	tnz	a
5252  05a6 2610          	jrne	L7262
5253                     ; 1588     if (NewState != DISABLE)
5255  05a8 9f            	ld	a,xl
5256  05a9 4d            	tnz	a
5257  05aa 2706          	jreq	L1362
5258                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5260  05ac 7210525c      	bset	21084,#0
5262  05b0 2040          	jra	L5362
5263  05b2               L1362:
5264                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5266  05b2 7211525c      	bres	21084,#0
5267  05b6 203a          	jra	L5362
5268  05b8               L7262:
5269                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5271  05b8 7b01          	ld	a,(OFST+1,sp)
5272  05ba a101          	cp	a,#1
5273  05bc 2610          	jrne	L7362
5274                     ; 1601     if (NewState != DISABLE)
5276  05be 0d02          	tnz	(OFST+2,sp)
5277  05c0 2706          	jreq	L1462
5278                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5280  05c2 7218525c      	bset	21084,#4
5282  05c6 202a          	jra	L5362
5283  05c8               L1462:
5284                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5286  05c8 7219525c      	bres	21084,#4
5287  05cc 2024          	jra	L5362
5288  05ce               L7362:
5289                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5291  05ce 7b01          	ld	a,(OFST+1,sp)
5292  05d0 a102          	cp	a,#2
5293  05d2 2610          	jrne	L7462
5294                     ; 1613     if (NewState != DISABLE)
5296  05d4 0d02          	tnz	(OFST+2,sp)
5297  05d6 2706          	jreq	L1562
5298                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5300  05d8 7210525d      	bset	21085,#0
5302  05dc 2014          	jra	L5362
5303  05de               L1562:
5304                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5306  05de 7211525d      	bres	21085,#0
5307  05e2 200e          	jra	L5362
5308  05e4               L7462:
5309                     ; 1625     if (NewState != DISABLE)
5311  05e4 0d02          	tnz	(OFST+2,sp)
5312  05e6 2706          	jreq	L7562
5313                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5315  05e8 7218525d      	bset	21085,#4
5317  05ec 2004          	jra	L5362
5318  05ee               L7562:
5319                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5321  05ee 7219525d      	bres	21085,#4
5322  05f2               L5362:
5323                     ; 1634 }
5326  05f2 85            	popw	x
5327  05f3 81            	ret
5372                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5372                     ; 1648 {
5373                     	switch	.text
5374  05f4               _TIM1_CCxNCmd:
5376  05f4 89            	pushw	x
5377       00000000      OFST:	set	0
5380                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5382                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5384                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5386  05f5 9e            	ld	a,xh
5387  05f6 4d            	tnz	a
5388  05f7 2610          	jrne	L5072
5389                     ; 1656     if (NewState != DISABLE)
5391  05f9 9f            	ld	a,xl
5392  05fa 4d            	tnz	a
5393  05fb 2706          	jreq	L7072
5394                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5396  05fd 7214525c      	bset	21084,#2
5398  0601 202a          	jra	L3172
5399  0603               L7072:
5400                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5402  0603 7215525c      	bres	21084,#2
5403  0607 2024          	jra	L3172
5404  0609               L5072:
5405                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5407  0609 7b01          	ld	a,(OFST+1,sp)
5408  060b a101          	cp	a,#1
5409  060d 2610          	jrne	L5172
5410                     ; 1668     if (NewState != DISABLE)
5412  060f 0d02          	tnz	(OFST+2,sp)
5413  0611 2706          	jreq	L7172
5414                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5416  0613 721c525c      	bset	21084,#6
5418  0617 2014          	jra	L3172
5419  0619               L7172:
5420                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5422  0619 721d525c      	bres	21084,#6
5423  061d 200e          	jra	L3172
5424  061f               L5172:
5425                     ; 1680     if (NewState != DISABLE)
5427  061f 0d02          	tnz	(OFST+2,sp)
5428  0621 2706          	jreq	L5272
5429                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5431  0623 7214525d      	bset	21085,#2
5433  0627 2004          	jra	L3172
5434  0629               L5272:
5435                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5437  0629 7215525d      	bres	21085,#2
5438  062d               L3172:
5439                     ; 1689 }
5442  062d 85            	popw	x
5443  062e 81            	ret
5488                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5488                     ; 1713 {
5489                     	switch	.text
5490  062f               _TIM1_SelectOCxM:
5492  062f 89            	pushw	x
5493       00000000      OFST:	set	0
5496                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5498                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5500                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5502  0630 9e            	ld	a,xh
5503  0631 4d            	tnz	a
5504  0632 2610          	jrne	L3572
5505                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5507  0634 7211525c      	bres	21084,#0
5508                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5508                     ; 1725                             | (uint8_t)TIM1_OCMode);
5510  0638 c65258        	ld	a,21080
5511  063b a48f          	and	a,#143
5512  063d 1a02          	or	a,(OFST+2,sp)
5513  063f c75258        	ld	21080,a
5515  0642 203a          	jra	L5572
5516  0644               L3572:
5517                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5519  0644 7b01          	ld	a,(OFST+1,sp)
5520  0646 a101          	cp	a,#1
5521  0648 2610          	jrne	L7572
5522                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5524  064a 7219525c      	bres	21084,#4
5525                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5525                     ; 1734                             | (uint8_t)TIM1_OCMode);
5527  064e c65259        	ld	a,21081
5528  0651 a48f          	and	a,#143
5529  0653 1a02          	or	a,(OFST+2,sp)
5530  0655 c75259        	ld	21081,a
5532  0658 2024          	jra	L5572
5533  065a               L7572:
5534                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5536  065a 7b01          	ld	a,(OFST+1,sp)
5537  065c a102          	cp	a,#2
5538  065e 2610          	jrne	L3672
5539                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5541  0660 7211525d      	bres	21085,#0
5542                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5542                     ; 1743                             | (uint8_t)TIM1_OCMode);
5544  0664 c6525a        	ld	a,21082
5545  0667 a48f          	and	a,#143
5546  0669 1a02          	or	a,(OFST+2,sp)
5547  066b c7525a        	ld	21082,a
5549  066e 200e          	jra	L5572
5550  0670               L3672:
5551                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5553  0670 7219525d      	bres	21085,#4
5554                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5554                     ; 1752                             | (uint8_t)TIM1_OCMode);
5556  0674 c6525b        	ld	a,21083
5557  0677 a48f          	and	a,#143
5558  0679 1a02          	or	a,(OFST+2,sp)
5559  067b c7525b        	ld	21083,a
5560  067e               L5572:
5561                     ; 1754 }
5564  067e 85            	popw	x
5565  067f 81            	ret
5599                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5599                     ; 1763 {
5600                     	switch	.text
5601  0680               _TIM1_SetCounter:
5605                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5607  0680 9e            	ld	a,xh
5608  0681 c7525e        	ld	21086,a
5609                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5611  0684 9f            	ld	a,xl
5612  0685 c7525f        	ld	21087,a
5613                     ; 1767 }
5616  0688 81            	ret
5650                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5650                     ; 1776 {
5651                     	switch	.text
5652  0689               _TIM1_SetAutoreload:
5656                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5658  0689 9e            	ld	a,xh
5659  068a c75262        	ld	21090,a
5660                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5662  068d 9f            	ld	a,xl
5663  068e c75263        	ld	21091,a
5664                     ; 1780  }
5667  0691 81            	ret
5701                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5701                     ; 1789 {
5702                     	switch	.text
5703  0692               _TIM1_SetCompare1:
5707                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5709  0692 9e            	ld	a,xh
5710  0693 c75265        	ld	21093,a
5711                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5713  0696 9f            	ld	a,xl
5714  0697 c75266        	ld	21094,a
5715                     ; 1793 }
5718  069a 81            	ret
5752                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5752                     ; 1802 {
5753                     	switch	.text
5754  069b               _TIM1_SetCompare2:
5758                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5760  069b 9e            	ld	a,xh
5761  069c c75267        	ld	21095,a
5762                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5764  069f 9f            	ld	a,xl
5765  06a0 c75268        	ld	21096,a
5766                     ; 1806 }
5769  06a3 81            	ret
5803                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5803                     ; 1815 {
5804                     	switch	.text
5805  06a4               _TIM1_SetCompare3:
5809                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5811  06a4 9e            	ld	a,xh
5812  06a5 c75269        	ld	21097,a
5813                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5815  06a8 9f            	ld	a,xl
5816  06a9 c7526a        	ld	21098,a
5817                     ; 1819 }
5820  06ac 81            	ret
5854                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5854                     ; 1828 {
5855                     	switch	.text
5856  06ad               _TIM1_SetCompare4:
5860                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5862  06ad 9e            	ld	a,xh
5863  06ae c7526b        	ld	21099,a
5864                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5866  06b1 9f            	ld	a,xl
5867  06b2 c7526c        	ld	21100,a
5868                     ; 1832 }
5871  06b5 81            	ret
5907                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5907                     ; 1845 {
5908                     	switch	.text
5909  06b6               _TIM1_SetIC1Prescaler:
5911  06b6 88            	push	a
5912       00000000      OFST:	set	0
5915                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5917                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5917                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5919  06b7 c65258        	ld	a,21080
5920  06ba a4f3          	and	a,#243
5921  06bc 1a01          	or	a,(OFST+1,sp)
5922  06be c75258        	ld	21080,a
5923                     ; 1852 }
5926  06c1 84            	pop	a
5927  06c2 81            	ret
5963                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5963                     ; 1865 {
5964                     	switch	.text
5965  06c3               _TIM1_SetIC2Prescaler:
5967  06c3 88            	push	a
5968       00000000      OFST:	set	0
5971                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5973                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5973                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5975  06c4 c65259        	ld	a,21081
5976  06c7 a4f3          	and	a,#243
5977  06c9 1a01          	or	a,(OFST+1,sp)
5978  06cb c75259        	ld	21081,a
5979                     ; 1873 }
5982  06ce 84            	pop	a
5983  06cf 81            	ret
6019                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6019                     ; 1886 {
6020                     	switch	.text
6021  06d0               _TIM1_SetIC3Prescaler:
6023  06d0 88            	push	a
6024       00000000      OFST:	set	0
6027                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6029                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6029                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6031  06d1 c6525a        	ld	a,21082
6032  06d4 a4f3          	and	a,#243
6033  06d6 1a01          	or	a,(OFST+1,sp)
6034  06d8 c7525a        	ld	21082,a
6035                     ; 1894 }
6038  06db 84            	pop	a
6039  06dc 81            	ret
6075                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6075                     ; 1907 {
6076                     	switch	.text
6077  06dd               _TIM1_SetIC4Prescaler:
6079  06dd 88            	push	a
6080       00000000      OFST:	set	0
6083                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6085                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6085                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6087  06de c6525b        	ld	a,21083
6088  06e1 a4f3          	and	a,#243
6089  06e3 1a01          	or	a,(OFST+1,sp)
6090  06e5 c7525b        	ld	21083,a
6091                     ; 1915 }
6094  06e8 84            	pop	a
6095  06e9 81            	ret
6147                     ; 1922 uint16_t TIM1_GetCapture1(void)
6147                     ; 1923 {
6148                     	switch	.text
6149  06ea               _TIM1_GetCapture1:
6151  06ea 5204          	subw	sp,#4
6152       00000004      OFST:	set	4
6155                     ; 1926   uint16_t tmpccr1 = 0;
6157                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6161                     ; 1929   tmpccr1h = TIM1->CCR1H;
6163  06ec c65265        	ld	a,21093
6164  06ef 6b02          	ld	(OFST-2,sp),a
6166                     ; 1930   tmpccr1l = TIM1->CCR1L;
6168  06f1 c65266        	ld	a,21094
6169  06f4 6b01          	ld	(OFST-3,sp),a
6171                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6173  06f6 7b01          	ld	a,(OFST-3,sp)
6174  06f8 5f            	clrw	x
6175  06f9 97            	ld	xl,a
6176  06fa 1f03          	ldw	(OFST-1,sp),x
6178                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6180  06fc 7b02          	ld	a,(OFST-2,sp)
6181  06fe 5f            	clrw	x
6182  06ff 97            	ld	xl,a
6183  0700 4f            	clr	a
6184  0701 02            	rlwa	x,a
6185  0702 01            	rrwa	x,a
6186  0703 1a04          	or	a,(OFST+0,sp)
6187  0705 01            	rrwa	x,a
6188  0706 1a03          	or	a,(OFST-1,sp)
6189  0708 01            	rrwa	x,a
6190  0709 1f03          	ldw	(OFST-1,sp),x
6192                     ; 1935   return (uint16_t)tmpccr1;
6194  070b 1e03          	ldw	x,(OFST-1,sp)
6197  070d 5b04          	addw	sp,#4
6198  070f 81            	ret
6250                     ; 1943 uint16_t TIM1_GetCapture2(void)
6250                     ; 1944 {
6251                     	switch	.text
6252  0710               _TIM1_GetCapture2:
6254  0710 5204          	subw	sp,#4
6255       00000004      OFST:	set	4
6258                     ; 1947   uint16_t tmpccr2 = 0;
6260                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6264                     ; 1950   tmpccr2h = TIM1->CCR2H;
6266  0712 c65267        	ld	a,21095
6267  0715 6b02          	ld	(OFST-2,sp),a
6269                     ; 1951   tmpccr2l = TIM1->CCR2L;
6271  0717 c65268        	ld	a,21096
6272  071a 6b01          	ld	(OFST-3,sp),a
6274                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6276  071c 7b01          	ld	a,(OFST-3,sp)
6277  071e 5f            	clrw	x
6278  071f 97            	ld	xl,a
6279  0720 1f03          	ldw	(OFST-1,sp),x
6281                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6283  0722 7b02          	ld	a,(OFST-2,sp)
6284  0724 5f            	clrw	x
6285  0725 97            	ld	xl,a
6286  0726 4f            	clr	a
6287  0727 02            	rlwa	x,a
6288  0728 01            	rrwa	x,a
6289  0729 1a04          	or	a,(OFST+0,sp)
6290  072b 01            	rrwa	x,a
6291  072c 1a03          	or	a,(OFST-1,sp)
6292  072e 01            	rrwa	x,a
6293  072f 1f03          	ldw	(OFST-1,sp),x
6295                     ; 1956   return (uint16_t)tmpccr2;
6297  0731 1e03          	ldw	x,(OFST-1,sp)
6300  0733 5b04          	addw	sp,#4
6301  0735 81            	ret
6353                     ; 1964 uint16_t TIM1_GetCapture3(void)
6353                     ; 1965 {
6354                     	switch	.text
6355  0736               _TIM1_GetCapture3:
6357  0736 5204          	subw	sp,#4
6358       00000004      OFST:	set	4
6361                     ; 1967   uint16_t tmpccr3 = 0;
6363                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6367                     ; 1970   tmpccr3h = TIM1->CCR3H;
6369  0738 c65269        	ld	a,21097
6370  073b 6b02          	ld	(OFST-2,sp),a
6372                     ; 1971   tmpccr3l = TIM1->CCR3L;
6374  073d c6526a        	ld	a,21098
6375  0740 6b01          	ld	(OFST-3,sp),a
6377                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6379  0742 7b01          	ld	a,(OFST-3,sp)
6380  0744 5f            	clrw	x
6381  0745 97            	ld	xl,a
6382  0746 1f03          	ldw	(OFST-1,sp),x
6384                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6386  0748 7b02          	ld	a,(OFST-2,sp)
6387  074a 5f            	clrw	x
6388  074b 97            	ld	xl,a
6389  074c 4f            	clr	a
6390  074d 02            	rlwa	x,a
6391  074e 01            	rrwa	x,a
6392  074f 1a04          	or	a,(OFST+0,sp)
6393  0751 01            	rrwa	x,a
6394  0752 1a03          	or	a,(OFST-1,sp)
6395  0754 01            	rrwa	x,a
6396  0755 1f03          	ldw	(OFST-1,sp),x
6398                     ; 1976   return (uint16_t)tmpccr3;
6400  0757 1e03          	ldw	x,(OFST-1,sp)
6403  0759 5b04          	addw	sp,#4
6404  075b 81            	ret
6456                     ; 1984 uint16_t TIM1_GetCapture4(void)
6456                     ; 1985 {
6457                     	switch	.text
6458  075c               _TIM1_GetCapture4:
6460  075c 5204          	subw	sp,#4
6461       00000004      OFST:	set	4
6464                     ; 1987   uint16_t tmpccr4 = 0;
6466                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6470                     ; 1990   tmpccr4h = TIM1->CCR4H;
6472  075e c6526b        	ld	a,21099
6473  0761 6b02          	ld	(OFST-2,sp),a
6475                     ; 1991   tmpccr4l = TIM1->CCR4L;
6477  0763 c6526c        	ld	a,21100
6478  0766 6b01          	ld	(OFST-3,sp),a
6480                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6482  0768 7b01          	ld	a,(OFST-3,sp)
6483  076a 5f            	clrw	x
6484  076b 97            	ld	xl,a
6485  076c 1f03          	ldw	(OFST-1,sp),x
6487                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6489  076e 7b02          	ld	a,(OFST-2,sp)
6490  0770 5f            	clrw	x
6491  0771 97            	ld	xl,a
6492  0772 4f            	clr	a
6493  0773 02            	rlwa	x,a
6494  0774 01            	rrwa	x,a
6495  0775 1a04          	or	a,(OFST+0,sp)
6496  0777 01            	rrwa	x,a
6497  0778 1a03          	or	a,(OFST-1,sp)
6498  077a 01            	rrwa	x,a
6499  077b 1f03          	ldw	(OFST-1,sp),x
6501                     ; 1996   return (uint16_t)tmpccr4;
6503  077d 1e03          	ldw	x,(OFST-1,sp)
6506  077f 5b04          	addw	sp,#4
6507  0781 81            	ret
6541                     ; 2004 uint16_t TIM1_GetCounter(void)
6541                     ; 2005 {
6542                     	switch	.text
6543  0782               _TIM1_GetCounter:
6545  0782 89            	pushw	x
6546       00000002      OFST:	set	2
6549                     ; 2006   uint16_t tmpcntr = 0;
6551                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6553  0783 c6525e        	ld	a,21086
6554  0786 5f            	clrw	x
6555  0787 97            	ld	xl,a
6556  0788 4f            	clr	a
6557  0789 02            	rlwa	x,a
6558  078a 1f01          	ldw	(OFST-1,sp),x
6560                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6562  078c c6525f        	ld	a,21087
6563  078f 5f            	clrw	x
6564  0790 97            	ld	xl,a
6565  0791 01            	rrwa	x,a
6566  0792 1a02          	or	a,(OFST+0,sp)
6567  0794 01            	rrwa	x,a
6568  0795 1a01          	or	a,(OFST-1,sp)
6569  0797 01            	rrwa	x,a
6572  0798 5b02          	addw	sp,#2
6573  079a 81            	ret
6607                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6607                     ; 2020 {
6608                     	switch	.text
6609  079b               _TIM1_GetPrescaler:
6611  079b 89            	pushw	x
6612       00000002      OFST:	set	2
6615                     ; 2021   uint16_t temp = 0;
6617                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6619  079c c65260        	ld	a,21088
6620  079f 5f            	clrw	x
6621  07a0 97            	ld	xl,a
6622  07a1 4f            	clr	a
6623  07a2 02            	rlwa	x,a
6624  07a3 1f01          	ldw	(OFST-1,sp),x
6626                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6628  07a5 c65261        	ld	a,21089
6629  07a8 5f            	clrw	x
6630  07a9 97            	ld	xl,a
6631  07aa 01            	rrwa	x,a
6632  07ab 1a02          	or	a,(OFST+0,sp)
6633  07ad 01            	rrwa	x,a
6634  07ae 1a01          	or	a,(OFST-1,sp)
6635  07b0 01            	rrwa	x,a
6638  07b1 5b02          	addw	sp,#2
6639  07b3 81            	ret
6813                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6813                     ; 2048 {
6814                     	switch	.text
6815  07b4               _TIM1_GetFlagStatus:
6817  07b4 89            	pushw	x
6818  07b5 89            	pushw	x
6819       00000002      OFST:	set	2
6822                     ; 2049   FlagStatus bitstatus = RESET;
6824                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6828                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6830                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6832  07b6 9f            	ld	a,xl
6833  07b7 c45255        	and	a,21077
6834  07ba 6b01          	ld	(OFST-1,sp),a
6836                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6838  07bc 7b03          	ld	a,(OFST+1,sp)
6839  07be 6b02          	ld	(OFST+0,sp),a
6841                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6843  07c0 c65256        	ld	a,21078
6844  07c3 1402          	and	a,(OFST+0,sp)
6845  07c5 1a01          	or	a,(OFST-1,sp)
6846  07c7 2706          	jreq	L5643
6847                     ; 2060     bitstatus = SET;
6849  07c9 a601          	ld	a,#1
6850  07cb 6b02          	ld	(OFST+0,sp),a
6853  07cd 2002          	jra	L7643
6854  07cf               L5643:
6855                     ; 2064     bitstatus = RESET;
6857  07cf 0f02          	clr	(OFST+0,sp)
6859  07d1               L7643:
6860                     ; 2066   return (FlagStatus)(bitstatus);
6862  07d1 7b02          	ld	a,(OFST+0,sp)
6865  07d3 5b04          	addw	sp,#4
6866  07d5 81            	ret
6901                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6901                     ; 2088 {
6902                     	switch	.text
6903  07d6               _TIM1_ClearFlag:
6905  07d6 89            	pushw	x
6906       00000000      OFST:	set	0
6909                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6911                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6913  07d7 9f            	ld	a,xl
6914  07d8 43            	cpl	a
6915  07d9 c75255        	ld	21077,a
6916                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6916                     ; 2095                         (uint8_t)0x1E);
6918  07dc 7b01          	ld	a,(OFST+1,sp)
6919  07de 43            	cpl	a
6920  07df a41e          	and	a,#30
6921  07e1 c75256        	ld	21078,a
6922                     ; 2096 }
6925  07e4 85            	popw	x
6926  07e5 81            	ret
6990                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6990                     ; 2113 {
6991                     	switch	.text
6992  07e6               _TIM1_GetITStatus:
6994  07e6 88            	push	a
6995  07e7 89            	pushw	x
6996       00000002      OFST:	set	2
6999                     ; 2114   ITStatus bitstatus = RESET;
7001                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
7005                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
7007                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
7009  07e8 c45255        	and	a,21077
7010  07eb 6b01          	ld	(OFST-1,sp),a
7012                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
7014  07ed c65254        	ld	a,21076
7015  07f0 1403          	and	a,(OFST+1,sp)
7016  07f2 6b02          	ld	(OFST+0,sp),a
7018                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
7020  07f4 0d01          	tnz	(OFST-1,sp)
7021  07f6 270a          	jreq	L1453
7023  07f8 0d02          	tnz	(OFST+0,sp)
7024  07fa 2706          	jreq	L1453
7025                     ; 2126     bitstatus = SET;
7027  07fc a601          	ld	a,#1
7028  07fe 6b02          	ld	(OFST+0,sp),a
7031  0800 2002          	jra	L3453
7032  0802               L1453:
7033                     ; 2130     bitstatus = RESET;
7035  0802 0f02          	clr	(OFST+0,sp)
7037  0804               L3453:
7038                     ; 2132   return (ITStatus)(bitstatus);
7040  0804 7b02          	ld	a,(OFST+0,sp)
7043  0806 5b03          	addw	sp,#3
7044  0808 81            	ret
7080                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7080                     ; 2150 {
7081                     	switch	.text
7082  0809               _TIM1_ClearITPendingBit:
7086                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7088                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7090  0809 43            	cpl	a
7091  080a c75255        	ld	21077,a
7092                     ; 2156 }
7095  080d 81            	ret
7147                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7147                     ; 2175                        uint8_t TIM1_ICSelection,
7147                     ; 2176                        uint8_t TIM1_ICFilter)
7147                     ; 2177 {
7148                     	switch	.text
7149  080e               L3_TI1_Config:
7151  080e 89            	pushw	x
7152  080f 88            	push	a
7153       00000001      OFST:	set	1
7156                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7158  0810 7211525c      	bres	21084,#0
7159                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7159                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7161  0814 7b06          	ld	a,(OFST+5,sp)
7162  0816 97            	ld	xl,a
7163  0817 a610          	ld	a,#16
7164  0819 42            	mul	x,a
7165  081a 9f            	ld	a,xl
7166  081b 1a03          	or	a,(OFST+2,sp)
7167  081d 6b01          	ld	(OFST+0,sp),a
7169  081f c65258        	ld	a,21080
7170  0822 a40c          	and	a,#12
7171  0824 1a01          	or	a,(OFST+0,sp)
7172  0826 c75258        	ld	21080,a
7173                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7175  0829 0d02          	tnz	(OFST+1,sp)
7176  082b 2706          	jreq	L1163
7177                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7179  082d 7212525c      	bset	21084,#1
7181  0831 2004          	jra	L3163
7182  0833               L1163:
7183                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7185  0833 7213525c      	bres	21084,#1
7186  0837               L3163:
7187                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7189  0837 7210525c      	bset	21084,#0
7190                     ; 2197 }
7193  083b 5b03          	addw	sp,#3
7194  083d 81            	ret
7246                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7246                     ; 2216                        uint8_t TIM1_ICSelection,
7246                     ; 2217                        uint8_t TIM1_ICFilter)
7246                     ; 2218 {
7247                     	switch	.text
7248  083e               L5_TI2_Config:
7250  083e 89            	pushw	x
7251  083f 88            	push	a
7252       00000001      OFST:	set	1
7255                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7257  0840 7219525c      	bres	21084,#4
7258                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7258                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7260  0844 7b06          	ld	a,(OFST+5,sp)
7261  0846 97            	ld	xl,a
7262  0847 a610          	ld	a,#16
7263  0849 42            	mul	x,a
7264  084a 9f            	ld	a,xl
7265  084b 1a03          	or	a,(OFST+2,sp)
7266  084d 6b01          	ld	(OFST+0,sp),a
7268  084f c65259        	ld	a,21081
7269  0852 a40c          	and	a,#12
7270  0854 1a01          	or	a,(OFST+0,sp)
7271  0856 c75259        	ld	21081,a
7272                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7274  0859 0d02          	tnz	(OFST+1,sp)
7275  085b 2706          	jreq	L3463
7276                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7278  085d 721a525c      	bset	21084,#5
7280  0861 2004          	jra	L5463
7281  0863               L3463:
7282                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7284  0863 721b525c      	bres	21084,#5
7285  0867               L5463:
7286                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7288  0867 7218525c      	bset	21084,#4
7289                     ; 2236 }
7292  086b 5b03          	addw	sp,#3
7293  086d 81            	ret
7345                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7345                     ; 2255                        uint8_t TIM1_ICSelection,
7345                     ; 2256                        uint8_t TIM1_ICFilter)
7345                     ; 2257 {
7346                     	switch	.text
7347  086e               L7_TI3_Config:
7349  086e 89            	pushw	x
7350  086f 88            	push	a
7351       00000001      OFST:	set	1
7354                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7356  0870 7211525d      	bres	21085,#0
7357                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7357                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7359  0874 7b06          	ld	a,(OFST+5,sp)
7360  0876 97            	ld	xl,a
7361  0877 a610          	ld	a,#16
7362  0879 42            	mul	x,a
7363  087a 9f            	ld	a,xl
7364  087b 1a03          	or	a,(OFST+2,sp)
7365  087d 6b01          	ld	(OFST+0,sp),a
7367  087f c6525a        	ld	a,21082
7368  0882 a40c          	and	a,#12
7369  0884 1a01          	or	a,(OFST+0,sp)
7370  0886 c7525a        	ld	21082,a
7371                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7373  0889 0d02          	tnz	(OFST+1,sp)
7374  088b 2706          	jreq	L5763
7375                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7377  088d 7212525d      	bset	21085,#1
7379  0891 2004          	jra	L7763
7380  0893               L5763:
7381                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7383  0893 7213525d      	bres	21085,#1
7384  0897               L7763:
7385                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7387  0897 7210525d      	bset	21085,#0
7388                     ; 2276 }
7391  089b 5b03          	addw	sp,#3
7392  089d 81            	ret
7444                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7444                     ; 2295                        uint8_t TIM1_ICSelection,
7444                     ; 2296                        uint8_t TIM1_ICFilter)
7444                     ; 2297 {
7445                     	switch	.text
7446  089e               L11_TI4_Config:
7448  089e 89            	pushw	x
7449  089f 88            	push	a
7450       00000001      OFST:	set	1
7453                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7455  08a0 7219525d      	bres	21085,#4
7456                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7456                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7458  08a4 7b06          	ld	a,(OFST+5,sp)
7459  08a6 97            	ld	xl,a
7460  08a7 a610          	ld	a,#16
7461  08a9 42            	mul	x,a
7462  08aa 9f            	ld	a,xl
7463  08ab 1a03          	or	a,(OFST+2,sp)
7464  08ad 6b01          	ld	(OFST+0,sp),a
7466  08af c6525b        	ld	a,21083
7467  08b2 a40c          	and	a,#12
7468  08b4 1a01          	or	a,(OFST+0,sp)
7469  08b6 c7525b        	ld	21083,a
7470                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7472  08b9 0d02          	tnz	(OFST+1,sp)
7473  08bb 2706          	jreq	L7273
7474                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7476  08bd 721a525d      	bset	21085,#5
7478  08c1 2004          	jra	L1373
7479  08c3               L7273:
7480                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7482  08c3 721b525d      	bres	21085,#5
7483  08c7               L1373:
7484                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7486  08c7 7218525d      	bset	21085,#4
7487                     ; 2317 }
7490  08cb 5b03          	addw	sp,#3
7491  08cd 81            	ret
7504                     	xdef	_TIM1_ClearITPendingBit
7505                     	xdef	_TIM1_GetITStatus
7506                     	xdef	_TIM1_ClearFlag
7507                     	xdef	_TIM1_GetFlagStatus
7508                     	xdef	_TIM1_GetPrescaler
7509                     	xdef	_TIM1_GetCounter
7510                     	xdef	_TIM1_GetCapture4
7511                     	xdef	_TIM1_GetCapture3
7512                     	xdef	_TIM1_GetCapture2
7513                     	xdef	_TIM1_GetCapture1
7514                     	xdef	_TIM1_SetIC4Prescaler
7515                     	xdef	_TIM1_SetIC3Prescaler
7516                     	xdef	_TIM1_SetIC2Prescaler
7517                     	xdef	_TIM1_SetIC1Prescaler
7518                     	xdef	_TIM1_SetCompare4
7519                     	xdef	_TIM1_SetCompare3
7520                     	xdef	_TIM1_SetCompare2
7521                     	xdef	_TIM1_SetCompare1
7522                     	xdef	_TIM1_SetAutoreload
7523                     	xdef	_TIM1_SetCounter
7524                     	xdef	_TIM1_SelectOCxM
7525                     	xdef	_TIM1_CCxNCmd
7526                     	xdef	_TIM1_CCxCmd
7527                     	xdef	_TIM1_OC4PolarityConfig
7528                     	xdef	_TIM1_OC3NPolarityConfig
7529                     	xdef	_TIM1_OC3PolarityConfig
7530                     	xdef	_TIM1_OC2NPolarityConfig
7531                     	xdef	_TIM1_OC2PolarityConfig
7532                     	xdef	_TIM1_OC1NPolarityConfig
7533                     	xdef	_TIM1_OC1PolarityConfig
7534                     	xdef	_TIM1_GenerateEvent
7535                     	xdef	_TIM1_OC4FastConfig
7536                     	xdef	_TIM1_OC3FastConfig
7537                     	xdef	_TIM1_OC2FastConfig
7538                     	xdef	_TIM1_OC1FastConfig
7539                     	xdef	_TIM1_OC4PreloadConfig
7540                     	xdef	_TIM1_OC3PreloadConfig
7541                     	xdef	_TIM1_OC2PreloadConfig
7542                     	xdef	_TIM1_OC1PreloadConfig
7543                     	xdef	_TIM1_CCPreloadControl
7544                     	xdef	_TIM1_SelectCOM
7545                     	xdef	_TIM1_ARRPreloadConfig
7546                     	xdef	_TIM1_ForcedOC4Config
7547                     	xdef	_TIM1_ForcedOC3Config
7548                     	xdef	_TIM1_ForcedOC2Config
7549                     	xdef	_TIM1_ForcedOC1Config
7550                     	xdef	_TIM1_CounterModeConfig
7551                     	xdef	_TIM1_PrescalerConfig
7552                     	xdef	_TIM1_EncoderInterfaceConfig
7553                     	xdef	_TIM1_SelectMasterSlaveMode
7554                     	xdef	_TIM1_SelectSlaveMode
7555                     	xdef	_TIM1_SelectOutputTrigger
7556                     	xdef	_TIM1_SelectOnePulseMode
7557                     	xdef	_TIM1_SelectHallSensor
7558                     	xdef	_TIM1_UpdateRequestConfig
7559                     	xdef	_TIM1_UpdateDisableConfig
7560                     	xdef	_TIM1_SelectInputTrigger
7561                     	xdef	_TIM1_TIxExternalClockConfig
7562                     	xdef	_TIM1_ETRConfig
7563                     	xdef	_TIM1_ETRClockMode2Config
7564                     	xdef	_TIM1_ETRClockMode1Config
7565                     	xdef	_TIM1_InternalClockConfig
7566                     	xdef	_TIM1_ITConfig
7567                     	xdef	_TIM1_CtrlPWMOutputs
7568                     	xdef	_TIM1_Cmd
7569                     	xdef	_TIM1_PWMIConfig
7570                     	xdef	_TIM1_ICInit
7571                     	xdef	_TIM1_BDTRConfig
7572                     	xdef	_TIM1_OC4Init
7573                     	xdef	_TIM1_OC3Init
7574                     	xdef	_TIM1_OC2Init
7575                     	xdef	_TIM1_OC1Init
7576                     	xdef	_TIM1_TimeBaseInit
7577                     	xdef	_TIM1_DeInit
7596                     	end
