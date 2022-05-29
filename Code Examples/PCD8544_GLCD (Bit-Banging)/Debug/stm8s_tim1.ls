   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 58 void TIM1_DeInit(void)
  42                     ; 59 {
  43                     	switch	.text
  44  0000               f_TIM1_DeInit:
  48                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  50  0000 725f5250      	clr	21072
  51                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  53  0004 725f5251      	clr	21073
  54                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  56  0008 725f5252      	clr	21074
  57                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  59  000c 725f5253      	clr	21075
  60                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  62  0010 725f5254      	clr	21076
  63                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  65  0014 725f5256      	clr	21078
  66                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  68  0018 725f525c      	clr	21084
  69                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  71  001c 725f525d      	clr	21085
  72                     ; 70   TIM1->CCMR1 = 0x01;
  74  0020 35015258      	mov	21080,#1
  75                     ; 71   TIM1->CCMR2 = 0x01;
  77  0024 35015259      	mov	21081,#1
  78                     ; 72   TIM1->CCMR3 = 0x01;
  80  0028 3501525a      	mov	21082,#1
  81                     ; 73   TIM1->CCMR4 = 0x01;
  83  002c 3501525b      	mov	21083,#1
  84                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  86  0030 725f525c      	clr	21084
  87                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  89  0034 725f525d      	clr	21085
  90                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  92  0038 725f5258      	clr	21080
  93                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  95  003c 725f5259      	clr	21081
  96                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  98  0040 725f525a      	clr	21082
  99                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 101  0044 725f525b      	clr	21083
 102                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 104  0048 725f525e      	clr	21086
 105                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 107  004c 725f525f      	clr	21087
 108                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 110  0050 725f5260      	clr	21088
 111                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 113  0054 725f5261      	clr	21089
 114                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 116  0058 35ff5262      	mov	21090,#255
 117                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 119  005c 35ff5263      	mov	21091,#255
 120                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 122  0060 725f5265      	clr	21093
 123                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 125  0064 725f5266      	clr	21094
 126                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 128  0068 725f5267      	clr	21095
 129                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 131  006c 725f5268      	clr	21096
 132                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 134  0070 725f5269      	clr	21097
 135                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 137  0074 725f526a      	clr	21098
 138                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 140  0078 725f526b      	clr	21099
 141                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 143  007c 725f526c      	clr	21100
 144                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 146  0080 725f526f      	clr	21103
 147                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 149  0084 35015257      	mov	21079,#1
 150                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 152  0088 725f526e      	clr	21102
 153                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 155  008c 725f526d      	clr	21101
 156                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 158  0090 725f5264      	clr	21092
 159                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 161  0094 725f5255      	clr	21077
 162                     ; 101 }
 165  0098 87            	retf
 267                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 267                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 267                     ; 113                        uint16_t TIM1_Period,
 267                     ; 114                        uint8_t TIM1_RepetitionCounter)
 267                     ; 115 {
 268                     	switch	.text
 269  0099               f_TIM1_TimeBaseInit:
 271  0099 89            	pushw	x
 272       00000000      OFST:	set	0
 275                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 277                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 279  009a 7b07          	ld	a,(OFST+7,sp)
 280  009c c75262        	ld	21090,a
 281                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 283  009f 7b08          	ld	a,(OFST+8,sp)
 284  00a1 c75263        	ld	21091,a
 285                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 287  00a4 9e            	ld	a,xh
 288  00a5 c75260        	ld	21088,a
 289                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 291  00a8 9f            	ld	a,xl
 292  00a9 c75261        	ld	21089,a
 293                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 293                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 295  00ac c65250        	ld	a,21072
 296  00af a48f          	and	a,#143
 297  00b1 1a06          	or	a,(OFST+6,sp)
 298  00b3 c75250        	ld	21072,a
 299                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 301  00b6 7b09          	ld	a,(OFST+9,sp)
 302  00b8 c75264        	ld	21092,a
 303                     ; 133 }
 306  00bb 85            	popw	x
 307  00bc 87            	retf
 589                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 589                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 589                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 589                     ; 157                   uint16_t TIM1_Pulse,
 589                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 589                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 589                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 589                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 589                     ; 162 {
 590                     	switch	.text
 591  00bd               f_TIM1_OC1Init:
 593  00bd 89            	pushw	x
 594  00be 5203          	subw	sp,#3
 595       00000003      OFST:	set	3
 598                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 600                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 602                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 604                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 606                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 608                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 610                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 612                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 612                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 614  00c0 c6525c        	ld	a,21084
 615  00c3 a4f0          	and	a,#240
 616  00c5 c7525c        	ld	21084,a
 617                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 617                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 617                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 617                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 619  00c8 7b0d          	ld	a,(OFST+10,sp)
 620  00ca a408          	and	a,#8
 621  00cc 6b03          	ld	(OFST+0,sp),a
 623  00ce 7b0c          	ld	a,(OFST+9,sp)
 624  00d0 a402          	and	a,#2
 625  00d2 1a03          	or	a,(OFST+0,sp)
 626  00d4 6b02          	ld	(OFST-1,sp),a
 628  00d6 7b09          	ld	a,(OFST+6,sp)
 629  00d8 a404          	and	a,#4
 630  00da 6b01          	ld	(OFST-2,sp),a
 632  00dc 9f            	ld	a,xl
 633  00dd a401          	and	a,#1
 634  00df 1a01          	or	a,(OFST-2,sp)
 635  00e1 1a02          	or	a,(OFST-1,sp)
 636  00e3 ca525c        	or	a,21084
 637  00e6 c7525c        	ld	21084,a
 638                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 638                     ; 185                           (uint8_t)TIM1_OCMode);
 640  00e9 c65258        	ld	a,21080
 641  00ec a48f          	and	a,#143
 642  00ee 1a04          	or	a,(OFST+1,sp)
 643  00f0 c75258        	ld	21080,a
 644                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 646  00f3 c6526f        	ld	a,21103
 647  00f6 a4fc          	and	a,#252
 648  00f8 c7526f        	ld	21103,a
 649                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 649                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 651  00fb 7b0f          	ld	a,(OFST+12,sp)
 652  00fd a402          	and	a,#2
 653  00ff 6b03          	ld	(OFST+0,sp),a
 655  0101 7b0e          	ld	a,(OFST+11,sp)
 656  0103 a401          	and	a,#1
 657  0105 1a03          	or	a,(OFST+0,sp)
 658  0107 ca526f        	or	a,21103
 659  010a c7526f        	ld	21103,a
 660                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 662  010d 7b0a          	ld	a,(OFST+7,sp)
 663  010f c75265        	ld	21093,a
 664                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 666  0112 7b0b          	ld	a,(OFST+8,sp)
 667  0114 c75266        	ld	21094,a
 668                     ; 196 }
 671  0117 5b05          	addw	sp,#5
 672  0119 87            	retf
 773                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 773                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 773                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 773                     ; 220                   uint16_t TIM1_Pulse,
 773                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 773                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 773                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 773                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 773                     ; 225 {
 774                     	switch	.text
 775  011a               f_TIM1_OC2Init:
 777  011a 89            	pushw	x
 778  011b 5203          	subw	sp,#3
 779       00000003      OFST:	set	3
 782                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 784                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 786                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 788                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 790                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 792                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 794                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 796                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 796                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 798  011d c6525c        	ld	a,21084
 799  0120 a40f          	and	a,#15
 800  0122 c7525c        	ld	21084,a
 801                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 801                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 801                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 801                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 803  0125 7b0d          	ld	a,(OFST+10,sp)
 804  0127 a480          	and	a,#128
 805  0129 6b03          	ld	(OFST+0,sp),a
 807  012b 7b0c          	ld	a,(OFST+9,sp)
 808  012d a420          	and	a,#32
 809  012f 1a03          	or	a,(OFST+0,sp)
 810  0131 6b02          	ld	(OFST-1,sp),a
 812  0133 7b09          	ld	a,(OFST+6,sp)
 813  0135 a440          	and	a,#64
 814  0137 6b01          	ld	(OFST-2,sp),a
 816  0139 9f            	ld	a,xl
 817  013a a410          	and	a,#16
 818  013c 1a01          	or	a,(OFST-2,sp)
 819  013e 1a02          	or	a,(OFST-1,sp)
 820  0140 ca525c        	or	a,21084
 821  0143 c7525c        	ld	21084,a
 822                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 822                     ; 249                           (uint8_t)TIM1_OCMode);
 824  0146 c65259        	ld	a,21081
 825  0149 a48f          	and	a,#143
 826  014b 1a04          	or	a,(OFST+1,sp)
 827  014d c75259        	ld	21081,a
 828                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 830  0150 c6526f        	ld	a,21103
 831  0153 a4f3          	and	a,#243
 832  0155 c7526f        	ld	21103,a
 833                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 833                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 835  0158 7b0f          	ld	a,(OFST+12,sp)
 836  015a a408          	and	a,#8
 837  015c 6b03          	ld	(OFST+0,sp),a
 839  015e 7b0e          	ld	a,(OFST+11,sp)
 840  0160 a404          	and	a,#4
 841  0162 1a03          	or	a,(OFST+0,sp)
 842  0164 ca526f        	or	a,21103
 843  0167 c7526f        	ld	21103,a
 844                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 846  016a 7b0a          	ld	a,(OFST+7,sp)
 847  016c c75267        	ld	21095,a
 848                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 850  016f 7b0b          	ld	a,(OFST+8,sp)
 851  0171 c75268        	ld	21096,a
 852                     ; 260 }
 855  0174 5b05          	addw	sp,#5
 856  0176 87            	retf
 957                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 957                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 957                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 957                     ; 284                   uint16_t TIM1_Pulse,
 957                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 957                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 957                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 957                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 957                     ; 289 {
 958                     	switch	.text
 959  0177               f_TIM1_OC3Init:
 961  0177 89            	pushw	x
 962  0178 5203          	subw	sp,#3
 963       00000003      OFST:	set	3
 966                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 968                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 970                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 972                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 974                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 976                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 978                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 980                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 980                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 982  017a c6525d        	ld	a,21085
 983  017d a4f0          	and	a,#240
 984  017f c7525d        	ld	21085,a
 985                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 985                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 985                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 985                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 987  0182 7b0d          	ld	a,(OFST+10,sp)
 988  0184 a408          	and	a,#8
 989  0186 6b03          	ld	(OFST+0,sp),a
 991  0188 7b0c          	ld	a,(OFST+9,sp)
 992  018a a402          	and	a,#2
 993  018c 1a03          	or	a,(OFST+0,sp)
 994  018e 6b02          	ld	(OFST-1,sp),a
 996  0190 7b09          	ld	a,(OFST+6,sp)
 997  0192 a404          	and	a,#4
 998  0194 6b01          	ld	(OFST-2,sp),a
1000  0196 9f            	ld	a,xl
1001  0197 a401          	and	a,#1
1002  0199 1a01          	or	a,(OFST-2,sp)
1003  019b 1a02          	or	a,(OFST-1,sp)
1004  019d ca525d        	or	a,21085
1005  01a0 c7525d        	ld	21085,a
1006                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1006                     ; 312                           (uint8_t)TIM1_OCMode);
1008  01a3 c6525a        	ld	a,21082
1009  01a6 a48f          	and	a,#143
1010  01a8 1a04          	or	a,(OFST+1,sp)
1011  01aa c7525a        	ld	21082,a
1012                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1014  01ad c6526f        	ld	a,21103
1015  01b0 a4cf          	and	a,#207
1016  01b2 c7526f        	ld	21103,a
1017                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1017                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1019  01b5 7b0f          	ld	a,(OFST+12,sp)
1020  01b7 a420          	and	a,#32
1021  01b9 6b03          	ld	(OFST+0,sp),a
1023  01bb 7b0e          	ld	a,(OFST+11,sp)
1024  01bd a410          	and	a,#16
1025  01bf 1a03          	or	a,(OFST+0,sp)
1026  01c1 ca526f        	or	a,21103
1027  01c4 c7526f        	ld	21103,a
1028                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1030  01c7 7b0a          	ld	a,(OFST+7,sp)
1031  01c9 c75269        	ld	21097,a
1032                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1034  01cc 7b0b          	ld	a,(OFST+8,sp)
1035  01ce c7526a        	ld	21098,a
1036                     ; 323 }
1039  01d1 5b05          	addw	sp,#5
1040  01d3 87            	retf
1111                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1111                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1111                     ; 340                   uint16_t TIM1_Pulse,
1111                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1111                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1111                     ; 343 {
1112                     	switch	.text
1113  01d4               f_TIM1_OC4Init:
1115  01d4 89            	pushw	x
1116  01d5 88            	push	a
1117       00000001      OFST:	set	1
1120                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1122                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1124                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1126                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1128                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1130  01d6 c6525d        	ld	a,21085
1131  01d9 a4cf          	and	a,#207
1132  01db c7525d        	ld	21085,a
1133                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1133                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1135  01de 7b09          	ld	a,(OFST+8,sp)
1136  01e0 a420          	and	a,#32
1137  01e2 6b01          	ld	(OFST+0,sp),a
1139  01e4 9f            	ld	a,xl
1140  01e5 a410          	and	a,#16
1141  01e7 1a01          	or	a,(OFST+0,sp)
1142  01e9 ca525d        	or	a,21085
1143  01ec c7525d        	ld	21085,a
1144                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1144                     ; 358                           TIM1_OCMode);
1146  01ef c6525b        	ld	a,21083
1147  01f2 a48f          	and	a,#143
1148  01f4 1a02          	or	a,(OFST+1,sp)
1149  01f6 c7525b        	ld	21083,a
1150                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1152  01f9 0d0a          	tnz	(OFST+9,sp)
1153  01fb 270a          	jreq	L714
1154                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1156  01fd c6526f        	ld	a,21103
1157  0200 aadf          	or	a,#223
1158  0202 c7526f        	ld	21103,a
1160  0205 2004          	jra	L124
1161  0207               L714:
1162                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1164  0207 721d526f      	bres	21103,#6
1165  020b               L124:
1166                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1168  020b 7b07          	ld	a,(OFST+6,sp)
1169  020d c7526b        	ld	21099,a
1170                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1172  0210 7b08          	ld	a,(OFST+7,sp)
1173  0212 c7526c        	ld	21100,a
1174                     ; 373 }
1177  0215 5b03          	addw	sp,#3
1178  0217 87            	retf
1380                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1380                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1380                     ; 390                      uint8_t TIM1_DeadTime,
1380                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1380                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1380                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1380                     ; 394 {
1381                     	switch	.text
1382  0218               f_TIM1_BDTRConfig:
1384  0218 89            	pushw	x
1385  0219 88            	push	a
1386       00000001      OFST:	set	1
1389                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1391                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1393                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1395                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1397                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1399                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1401  021a 7b07          	ld	a,(OFST+6,sp)
1402  021c c7526e        	ld	21102,a
1403                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1403                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1403                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1405  021f 7b08          	ld	a,(OFST+7,sp)
1406  0221 1a09          	or	a,(OFST+8,sp)
1407  0223 1a0a          	or	a,(OFST+9,sp)
1408  0225 6b01          	ld	(OFST+0,sp),a
1410  0227 9f            	ld	a,xl
1411  0228 1a02          	or	a,(OFST+1,sp)
1412  022a 1a01          	or	a,(OFST+0,sp)
1413  022c c7526d        	ld	21101,a
1414                     ; 409 }
1417  022f 5b03          	addw	sp,#3
1418  0231 87            	retf
1617                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1617                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1617                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1617                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1617                     ; 427                  uint8_t TIM1_ICFilter)
1617                     ; 428 {
1618                     	switch	.text
1619  0232               f_TIM1_ICInit:
1621  0232 89            	pushw	x
1622       00000000      OFST:	set	0
1625                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1627                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1629                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1631                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1633                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1635                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1637  0233 9e            	ld	a,xh
1638  0234 4d            	tnz	a
1639  0235 2616          	jrne	L546
1640                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1640                     ; 440                (uint8_t)TIM1_ICSelection,
1640                     ; 441                (uint8_t)TIM1_ICFilter);
1642  0237 7b08          	ld	a,(OFST+8,sp)
1643  0239 88            	push	a
1644  023a 7b07          	ld	a,(OFST+7,sp)
1645  023c 97            	ld	xl,a
1646  023d 7b03          	ld	a,(OFST+3,sp)
1647  023f 95            	ld	xh,a
1648  0240 8d260826      	callf	L3f_TI1_Config
1650  0244 84            	pop	a
1651                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1653  0245 7b07          	ld	a,(OFST+7,sp)
1654  0247 8dce06ce      	callf	f_TIM1_SetIC1Prescaler
1657  024b 204c          	jra	L746
1658  024d               L546:
1659                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1661  024d 7b01          	ld	a,(OFST+1,sp)
1662  024f a101          	cp	a,#1
1663  0251 2616          	jrne	L156
1664                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1664                     ; 449                (uint8_t)TIM1_ICSelection,
1664                     ; 450                (uint8_t)TIM1_ICFilter);
1666  0253 7b08          	ld	a,(OFST+8,sp)
1667  0255 88            	push	a
1668  0256 7b07          	ld	a,(OFST+7,sp)
1669  0258 97            	ld	xl,a
1670  0259 7b03          	ld	a,(OFST+3,sp)
1671  025b 95            	ld	xh,a
1672  025c 8d560856      	callf	L5f_TI2_Config
1674  0260 84            	pop	a
1675                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1677  0261 7b07          	ld	a,(OFST+7,sp)
1678  0263 8ddb06db      	callf	f_TIM1_SetIC2Prescaler
1681  0267 2030          	jra	L746
1682  0269               L156:
1683                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1685  0269 7b01          	ld	a,(OFST+1,sp)
1686  026b a102          	cp	a,#2
1687  026d 2616          	jrne	L556
1688                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1688                     ; 458                (uint8_t)TIM1_ICSelection,
1688                     ; 459                (uint8_t)TIM1_ICFilter);
1690  026f 7b08          	ld	a,(OFST+8,sp)
1691  0271 88            	push	a
1692  0272 7b07          	ld	a,(OFST+7,sp)
1693  0274 97            	ld	xl,a
1694  0275 7b03          	ld	a,(OFST+3,sp)
1695  0277 95            	ld	xh,a
1696  0278 8d860886      	callf	L7f_TI3_Config
1698  027c 84            	pop	a
1699                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1701  027d 7b07          	ld	a,(OFST+7,sp)
1702  027f 8de806e8      	callf	f_TIM1_SetIC3Prescaler
1705  0283 2014          	jra	L746
1706  0285               L556:
1707                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1707                     ; 467                (uint8_t)TIM1_ICSelection,
1707                     ; 468                (uint8_t)TIM1_ICFilter);
1709  0285 7b08          	ld	a,(OFST+8,sp)
1710  0287 88            	push	a
1711  0288 7b07          	ld	a,(OFST+7,sp)
1712  028a 97            	ld	xl,a
1713  028b 7b03          	ld	a,(OFST+3,sp)
1714  028d 95            	ld	xh,a
1715  028e 8db608b6      	callf	L11f_TI4_Config
1717  0292 84            	pop	a
1718                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1720  0293 7b07          	ld	a,(OFST+7,sp)
1721  0295 8df506f5      	callf	f_TIM1_SetIC4Prescaler
1723  0299               L746:
1724                     ; 472 }
1727  0299 85            	popw	x
1728  029a 87            	retf
1817                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1817                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1817                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1817                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1817                     ; 492                      uint8_t TIM1_ICFilter)
1817                     ; 493 {
1818                     	switch	.text
1819  029b               f_TIM1_PWMIConfig:
1821  029b 89            	pushw	x
1822  029c 89            	pushw	x
1823       00000002      OFST:	set	2
1826                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1828                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1830                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1832                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1834                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1836                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1838                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1840  029d 9f            	ld	a,xl
1841  029e a101          	cp	a,#1
1842  02a0 2706          	jreq	L127
1843                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1845  02a2 a601          	ld	a,#1
1846  02a4 6b01          	ld	(OFST-1,sp),a
1849  02a6 2002          	jra	L327
1850  02a8               L127:
1851                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1853  02a8 0f01          	clr	(OFST-1,sp)
1855  02aa               L327:
1856                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1858  02aa 7b08          	ld	a,(OFST+6,sp)
1859  02ac a101          	cp	a,#1
1860  02ae 2606          	jrne	L527
1861                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1863  02b0 a602          	ld	a,#2
1864  02b2 6b02          	ld	(OFST+0,sp),a
1867  02b4 2004          	jra	L727
1868  02b6               L527:
1869                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1871  02b6 a601          	ld	a,#1
1872  02b8 6b02          	ld	(OFST+0,sp),a
1874  02ba               L727:
1875                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1877  02ba 0d03          	tnz	(OFST+1,sp)
1878  02bc 262a          	jrne	L137
1879                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1879                     ; 527                (uint8_t)TIM1_ICFilter);
1881  02be 7b0a          	ld	a,(OFST+8,sp)
1882  02c0 88            	push	a
1883  02c1 7b09          	ld	a,(OFST+7,sp)
1884  02c3 97            	ld	xl,a
1885  02c4 7b05          	ld	a,(OFST+3,sp)
1886  02c6 95            	ld	xh,a
1887  02c7 8d260826      	callf	L3f_TI1_Config
1889  02cb 84            	pop	a
1890                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1892  02cc 7b09          	ld	a,(OFST+7,sp)
1893  02ce 8dce06ce      	callf	f_TIM1_SetIC1Prescaler
1895                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1897  02d2 7b0a          	ld	a,(OFST+8,sp)
1898  02d4 88            	push	a
1899  02d5 7b03          	ld	a,(OFST+1,sp)
1900  02d7 97            	ld	xl,a
1901  02d8 7b02          	ld	a,(OFST+0,sp)
1902  02da 95            	ld	xh,a
1903  02db 8d560856      	callf	L5f_TI2_Config
1905  02df 84            	pop	a
1906                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1908  02e0 7b09          	ld	a,(OFST+7,sp)
1909  02e2 8ddb06db      	callf	f_TIM1_SetIC2Prescaler
1912  02e6 2028          	jra	L337
1913  02e8               L137:
1914                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1914                     ; 542                (uint8_t)TIM1_ICFilter);
1916  02e8 7b0a          	ld	a,(OFST+8,sp)
1917  02ea 88            	push	a
1918  02eb 7b09          	ld	a,(OFST+7,sp)
1919  02ed 97            	ld	xl,a
1920  02ee 7b05          	ld	a,(OFST+3,sp)
1921  02f0 95            	ld	xh,a
1922  02f1 8d560856      	callf	L5f_TI2_Config
1924  02f5 84            	pop	a
1925                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1927  02f6 7b09          	ld	a,(OFST+7,sp)
1928  02f8 8ddb06db      	callf	f_TIM1_SetIC2Prescaler
1930                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1932  02fc 7b0a          	ld	a,(OFST+8,sp)
1933  02fe 88            	push	a
1934  02ff 7b03          	ld	a,(OFST+1,sp)
1935  0301 97            	ld	xl,a
1936  0302 7b02          	ld	a,(OFST+0,sp)
1937  0304 95            	ld	xh,a
1938  0305 8d260826      	callf	L3f_TI1_Config
1940  0309 84            	pop	a
1941                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1943  030a 7b09          	ld	a,(OFST+7,sp)
1944  030c 8dce06ce      	callf	f_TIM1_SetIC1Prescaler
1946  0310               L337:
1947                     ; 553 }
1950  0310 5b04          	addw	sp,#4
1951  0312 87            	retf
2005                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2005                     ; 562 {
2006                     	switch	.text
2007  0313               f_TIM1_Cmd:
2011                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2013                     ; 567   if (NewState != DISABLE)
2015  0313 4d            	tnz	a
2016  0314 2706          	jreq	L367
2017                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2019  0316 72105250      	bset	21072,#0
2021  031a 2004          	jra	L567
2022  031c               L367:
2023                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2025  031c 72115250      	bres	21072,#0
2026  0320               L567:
2027                     ; 575 }
2030  0320 87            	retf
2065                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2065                     ; 584 {
2066                     	switch	.text
2067  0321               f_TIM1_CtrlPWMOutputs:
2071                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2073                     ; 590   if (NewState != DISABLE)
2075  0321 4d            	tnz	a
2076  0322 2706          	jreq	L5001
2077                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2079  0324 721e526d      	bset	21101,#7
2081  0328 2004          	jra	L7001
2082  032a               L5001:
2083                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2085  032a 721f526d      	bres	21101,#7
2086  032e               L7001:
2087                     ; 598 }
2090  032e 87            	retf
2196                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2196                     ; 618 {
2197                     	switch	.text
2198  032f               f_TIM1_ITConfig:
2200  032f 89            	pushw	x
2201       00000000      OFST:	set	0
2204                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2206                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2208                     ; 623   if (NewState != DISABLE)
2210  0330 9f            	ld	a,xl
2211  0331 4d            	tnz	a
2212  0332 2709          	jreq	L7501
2213                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2215  0334 9e            	ld	a,xh
2216  0335 ca5254        	or	a,21076
2217  0338 c75254        	ld	21076,a
2219  033b 2009          	jra	L1601
2220  033d               L7501:
2221                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2223  033d 7b01          	ld	a,(OFST+1,sp)
2224  033f 43            	cpl	a
2225  0340 c45254        	and	a,21076
2226  0343 c75254        	ld	21076,a
2227  0346               L1601:
2228                     ; 633 }
2231  0346 85            	popw	x
2232  0347 87            	retf
2255                     ; 640 void TIM1_InternalClockConfig(void)
2255                     ; 641 {
2256                     	switch	.text
2257  0348               f_TIM1_InternalClockConfig:
2261                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2263  0348 c65252        	ld	a,21074
2264  034b a4f8          	and	a,#248
2265  034d c75252        	ld	21074,a
2266                     ; 644 }
2269  0350 87            	retf
2383                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2383                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2383                     ; 664                               uint8_t ExtTRGFilter)
2383                     ; 665 {
2384                     	switch	.text
2385  0351               f_TIM1_ETRClockMode1Config:
2387  0351 89            	pushw	x
2388       00000000      OFST:	set	0
2391                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2393                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2395                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2397  0352 7b06          	ld	a,(OFST+6,sp)
2398  0354 88            	push	a
2399  0355 9f            	ld	a,xl
2400  0356 97            	ld	xl,a
2401  0357 7b02          	ld	a,(OFST+2,sp)
2402  0359 95            	ld	xh,a
2403  035a 8d7f037f      	callf	f_TIM1_ETRConfig
2405  035e 84            	pop	a
2406                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2406                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2408  035f c65252        	ld	a,21074
2409  0362 a488          	and	a,#136
2410  0364 aa77          	or	a,#119
2411  0366 c75252        	ld	21074,a
2412                     ; 676 }
2415  0369 85            	popw	x
2416  036a 87            	retf
2471                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2471                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2471                     ; 696                               uint8_t ExtTRGFilter)
2471                     ; 697 {
2472                     	switch	.text
2473  036b               f_TIM1_ETRClockMode2Config:
2475  036b 89            	pushw	x
2476       00000000      OFST:	set	0
2479                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2481                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2483                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2485  036c 7b06          	ld	a,(OFST+6,sp)
2486  036e 88            	push	a
2487  036f 9f            	ld	a,xl
2488  0370 97            	ld	xl,a
2489  0371 7b02          	ld	a,(OFST+2,sp)
2490  0373 95            	ld	xh,a
2491  0374 8d7f037f      	callf	f_TIM1_ETRConfig
2493  0378 84            	pop	a
2494                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2496  0379 721c5253      	bset	21075,#6
2497                     ; 707 }
2500  037d 85            	popw	x
2501  037e 87            	retf
2554                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2554                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2554                     ; 727                     uint8_t ExtTRGFilter)
2554                     ; 728 {
2555                     	switch	.text
2556  037f               f_TIM1_ETRConfig:
2558  037f 89            	pushw	x
2559       00000000      OFST:	set	0
2562                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2564                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2564                     ; 733                          (uint8_t)ExtTRGFilter );
2566  0380 9f            	ld	a,xl
2567  0381 1a01          	or	a,(OFST+1,sp)
2568  0383 1a06          	or	a,(OFST+6,sp)
2569  0385 ca5253        	or	a,21075
2570  0388 c75253        	ld	21075,a
2571                     ; 734 }
2574  038b 85            	popw	x
2575  038c 87            	retf
2661                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2661                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2661                     ; 753                                  uint8_t ICFilter)
2661                     ; 754 {
2662                     	switch	.text
2663  038d               f_TIM1_TIxExternalClockConfig:
2665  038d 89            	pushw	x
2666       00000000      OFST:	set	0
2669                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2671                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2673                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2675                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2677  038e 9e            	ld	a,xh
2678  038f a160          	cp	a,#96
2679  0391 260f          	jrne	L1521
2680                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2682  0393 7b06          	ld	a,(OFST+6,sp)
2683  0395 88            	push	a
2684  0396 9f            	ld	a,xl
2685  0397 ae0001        	ldw	x,#1
2686  039a 95            	ld	xh,a
2687  039b 8d560856      	callf	L5f_TI2_Config
2689  039f 84            	pop	a
2691  03a0 200e          	jra	L3521
2692  03a2               L1521:
2693                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2695  03a2 7b06          	ld	a,(OFST+6,sp)
2696  03a4 88            	push	a
2697  03a5 7b03          	ld	a,(OFST+3,sp)
2698  03a7 ae0001        	ldw	x,#1
2699  03aa 95            	ld	xh,a
2700  03ab 8d260826      	callf	L3f_TI1_Config
2702  03af 84            	pop	a
2703  03b0               L3521:
2704                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2706  03b0 7b01          	ld	a,(OFST+1,sp)
2707  03b2 8dc003c0      	callf	f_TIM1_SelectInputTrigger
2709                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2711  03b6 c65252        	ld	a,21074
2712  03b9 aa07          	or	a,#7
2713  03bb c75252        	ld	21074,a
2714                     ; 775 }
2717  03be 85            	popw	x
2718  03bf 87            	retf
2802                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2802                     ; 788 {
2803                     	switch	.text
2804  03c0               f_TIM1_SelectInputTrigger:
2806  03c0 88            	push	a
2807       00000000      OFST:	set	0
2810                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2812                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2814  03c1 c65252        	ld	a,21074
2815  03c4 a48f          	and	a,#143
2816  03c6 1a01          	or	a,(OFST+1,sp)
2817  03c8 c75252        	ld	21074,a
2818                     ; 794 }
2821  03cb 84            	pop	a
2822  03cc 87            	retf
2857                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2857                     ; 804 {
2858                     	switch	.text
2859  03cd               f_TIM1_UpdateDisableConfig:
2863                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2865                     ; 809   if (NewState != DISABLE)
2867  03cd 4d            	tnz	a
2868  03ce 2706          	jreq	L1331
2869                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2871  03d0 72125250      	bset	21072,#1
2873  03d4 2004          	jra	L3331
2874  03d6               L1331:
2875                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2877  03d6 72135250      	bres	21072,#1
2878  03da               L3331:
2879                     ; 817 }
2882  03da 87            	retf
2939                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2939                     ; 828 {
2940                     	switch	.text
2941  03db               f_TIM1_UpdateRequestConfig:
2945                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2947                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2949  03db 4d            	tnz	a
2950  03dc 2706          	jreq	L3631
2951                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2953  03de 72145250      	bset	21072,#2
2955  03e2 2004          	jra	L5631
2956  03e4               L3631:
2957                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2959  03e4 72155250      	bres	21072,#2
2960  03e8               L5631:
2961                     ; 841 }
2964  03e8 87            	retf
2999                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
2999                     ; 850 {
3000                     	switch	.text
3001  03e9               f_TIM1_SelectHallSensor:
3005                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3007                     ; 855   if (NewState != DISABLE)
3009  03e9 4d            	tnz	a
3010  03ea 2706          	jreq	L5041
3011                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3013  03ec 721e5251      	bset	21073,#7
3015  03f0 2004          	jra	L7041
3016  03f2               L5041:
3017                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3019  03f2 721f5251      	bres	21073,#7
3020  03f6               L7041:
3021                     ; 863 }
3024  03f6 87            	retf
3080                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3080                     ; 874 {
3081                     	switch	.text
3082  03f7               f_TIM1_SelectOnePulseMode:
3086                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3088                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3090  03f7 4d            	tnz	a
3091  03f8 2706          	jreq	L7341
3092                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3094  03fa 72165250      	bset	21072,#3
3096  03fe 2004          	jra	L1441
3097  0400               L7341:
3098                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3100  0400 72175250      	bres	21072,#3
3101  0404               L1441:
3102                     ; 888 }
3105  0404 87            	retf
3202                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3202                     ; 904 {
3203                     	switch	.text
3204  0405               f_TIM1_SelectOutputTrigger:
3206  0405 88            	push	a
3207       00000000      OFST:	set	0
3210                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3212                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3212                     ; 910                         (uint8_t) TIM1_TRGOSource);
3214  0406 c65251        	ld	a,21073
3215  0409 a48f          	and	a,#143
3216  040b 1a01          	or	a,(OFST+1,sp)
3217  040d c75251        	ld	21073,a
3218                     ; 911 }
3221  0410 84            	pop	a
3222  0411 87            	retf
3295                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3295                     ; 924 {
3296                     	switch	.text
3297  0412               f_TIM1_SelectSlaveMode:
3299  0412 88            	push	a
3300       00000000      OFST:	set	0
3303                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3305                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3305                     ; 930                          (uint8_t)TIM1_SlaveMode);
3307  0413 c65252        	ld	a,21074
3308  0416 a4f8          	and	a,#248
3309  0418 1a01          	or	a,(OFST+1,sp)
3310  041a c75252        	ld	21074,a
3311                     ; 931 }
3314  041d 84            	pop	a
3315  041e 87            	retf
3350                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3350                     ; 940 {
3351                     	switch	.text
3352  041f               f_TIM1_SelectMasterSlaveMode:
3356                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3358                     ; 945   if (NewState != DISABLE)
3360  041f 4d            	tnz	a
3361  0420 2706          	jreq	L3551
3362                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3364  0422 721e5252      	bset	21074,#7
3366  0426 2004          	jra	L5551
3367  0428               L3551:
3368                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3370  0428 721f5252      	bres	21074,#7
3371  042c               L5551:
3372                     ; 953 }
3375  042c 87            	retf
3460                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3460                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3460                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3460                     ; 978 {
3461                     	switch	.text
3462  042d               f_TIM1_EncoderInterfaceConfig:
3464  042d 89            	pushw	x
3465       00000000      OFST:	set	0
3468                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3470                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3472                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3474                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3476  042e 9f            	ld	a,xl
3477  042f 4d            	tnz	a
3478  0430 2706          	jreq	L7161
3479                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3481  0432 7212525c      	bset	21084,#1
3483  0436 2004          	jra	L1261
3484  0438               L7161:
3485                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3487  0438 7213525c      	bres	21084,#1
3488  043c               L1261:
3489                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3491  043c 0d06          	tnz	(OFST+6,sp)
3492  043e 2706          	jreq	L3261
3493                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3495  0440 721a525c      	bset	21084,#5
3497  0444 2004          	jra	L5261
3498  0446               L3261:
3499                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3501  0446 721b525c      	bres	21084,#5
3502  044a               L5261:
3503                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3503                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3505  044a c65252        	ld	a,21074
3506  044d a4f0          	and	a,#240
3507  044f 1a01          	or	a,(OFST+1,sp)
3508  0451 c75252        	ld	21074,a
3509                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3509                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3511  0454 c65258        	ld	a,21080
3512  0457 a4fc          	and	a,#252
3513  0459 aa01          	or	a,#1
3514  045b c75258        	ld	21080,a
3515                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3515                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3517  045e c65259        	ld	a,21081
3518  0461 a4fc          	and	a,#252
3519  0463 aa01          	or	a,#1
3520  0465 c75259        	ld	21081,a
3521                     ; 1011 }
3524  0468 85            	popw	x
3525  0469 87            	retf
3589                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3589                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3589                     ; 1025 {
3590                     	switch	.text
3591  046a               f_TIM1_PrescalerConfig:
3593  046a 89            	pushw	x
3594       00000000      OFST:	set	0
3597                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3599                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3601  046b 9e            	ld	a,xh
3602  046c c75260        	ld	21088,a
3603                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3605  046f 9f            	ld	a,xl
3606  0470 c75261        	ld	21089,a
3607                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3609  0473 7b06          	ld	a,(OFST+6,sp)
3610  0475 c75257        	ld	21079,a
3611                     ; 1035 }
3614  0478 85            	popw	x
3615  0479 87            	retf
3650                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3650                     ; 1049 {
3651                     	switch	.text
3652  047a               f_TIM1_CounterModeConfig:
3654  047a 88            	push	a
3655       00000000      OFST:	set	0
3658                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3660                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3660                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3662  047b c65250        	ld	a,21072
3663  047e a48f          	and	a,#143
3664  0480 1a01          	or	a,(OFST+1,sp)
3665  0482 c75250        	ld	21072,a
3666                     ; 1057 }
3669  0485 84            	pop	a
3670  0486 87            	retf
3727                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3727                     ; 1068 {
3728                     	switch	.text
3729  0487               f_TIM1_ForcedOC1Config:
3731  0487 88            	push	a
3732       00000000      OFST:	set	0
3735                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3737                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3737                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3739  0488 c65258        	ld	a,21080
3740  048b a48f          	and	a,#143
3741  048d 1a01          	or	a,(OFST+1,sp)
3742  048f c75258        	ld	21080,a
3743                     ; 1075 }
3746  0492 84            	pop	a
3747  0493 87            	retf
3782                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3782                     ; 1086 {
3783                     	switch	.text
3784  0494               f_TIM1_ForcedOC2Config:
3786  0494 88            	push	a
3787       00000000      OFST:	set	0
3790                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3792                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3792                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3794  0495 c65259        	ld	a,21081
3795  0498 a48f          	and	a,#143
3796  049a 1a01          	or	a,(OFST+1,sp)
3797  049c c75259        	ld	21081,a
3798                     ; 1093 }
3801  049f 84            	pop	a
3802  04a0 87            	retf
3837                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3837                     ; 1105 {
3838                     	switch	.text
3839  04a1               f_TIM1_ForcedOC3Config:
3841  04a1 88            	push	a
3842       00000000      OFST:	set	0
3845                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3847                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3847                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3849  04a2 c6525a        	ld	a,21082
3850  04a5 a48f          	and	a,#143
3851  04a7 1a01          	or	a,(OFST+1,sp)
3852  04a9 c7525a        	ld	21082,a
3853                     ; 1112 }
3856  04ac 84            	pop	a
3857  04ad 87            	retf
3892                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3892                     ; 1124 {
3893                     	switch	.text
3894  04ae               f_TIM1_ForcedOC4Config:
3896  04ae 88            	push	a
3897       00000000      OFST:	set	0
3900                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3902                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3902                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3904  04af c6525b        	ld	a,21083
3905  04b2 a48f          	and	a,#143
3906  04b4 1a01          	or	a,(OFST+1,sp)
3907  04b6 c7525b        	ld	21083,a
3908                     ; 1131 }
3911  04b9 84            	pop	a
3912  04ba 87            	retf
3947                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3947                     ; 1140 {
3948                     	switch	.text
3949  04bb               f_TIM1_ARRPreloadConfig:
3953                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3955                     ; 1145   if (NewState != DISABLE)
3957  04bb 4d            	tnz	a
3958  04bc 2706          	jreq	L3102
3959                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
3961  04be 721e5250      	bset	21072,#7
3963  04c2 2004          	jra	L5102
3964  04c4               L3102:
3965                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
3967  04c4 721f5250      	bres	21072,#7
3968  04c8               L5102:
3969                     ; 1153 }
3972  04c8 87            	retf
4006                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4006                     ; 1162 {
4007                     	switch	.text
4008  04c9               f_TIM1_SelectCOM:
4012                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4014                     ; 1167   if (NewState != DISABLE)
4016  04c9 4d            	tnz	a
4017  04ca 2706          	jreq	L5302
4018                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4020  04cc 72145251      	bset	21073,#2
4022  04d0 2004          	jra	L7302
4023  04d2               L5302:
4024                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4026  04d2 72155251      	bres	21073,#2
4027  04d6               L7302:
4028                     ; 1175 }
4031  04d6 87            	retf
4066                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4066                     ; 1184 {
4067                     	switch	.text
4068  04d7               f_TIM1_CCPreloadControl:
4072                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4074                     ; 1189   if (NewState != DISABLE)
4076  04d7 4d            	tnz	a
4077  04d8 2706          	jreq	L7502
4078                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4080  04da 72105251      	bset	21073,#0
4082  04de 2004          	jra	L1602
4083  04e0               L7502:
4084                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4086  04e0 72115251      	bres	21073,#0
4087  04e4               L1602:
4088                     ; 1197 }
4091  04e4 87            	retf
4126                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4126                     ; 1206 {
4127                     	switch	.text
4128  04e5               f_TIM1_OC1PreloadConfig:
4132                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4134                     ; 1211   if (NewState != DISABLE)
4136  04e5 4d            	tnz	a
4137  04e6 2706          	jreq	L1012
4138                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4140  04e8 72165258      	bset	21080,#3
4142  04ec 2004          	jra	L3012
4143  04ee               L1012:
4144                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4146  04ee 72175258      	bres	21080,#3
4147  04f2               L3012:
4148                     ; 1219 }
4151  04f2 87            	retf
4186                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4186                     ; 1228 {
4187                     	switch	.text
4188  04f3               f_TIM1_OC2PreloadConfig:
4192                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4194                     ; 1233   if (NewState != DISABLE)
4196  04f3 4d            	tnz	a
4197  04f4 2706          	jreq	L3212
4198                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4200  04f6 72165259      	bset	21081,#3
4202  04fa 2004          	jra	L5212
4203  04fc               L3212:
4204                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4206  04fc 72175259      	bres	21081,#3
4207  0500               L5212:
4208                     ; 1241 }
4211  0500 87            	retf
4246                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4246                     ; 1250 {
4247                     	switch	.text
4248  0501               f_TIM1_OC3PreloadConfig:
4252                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4254                     ; 1255   if (NewState != DISABLE)
4256  0501 4d            	tnz	a
4257  0502 2706          	jreq	L5412
4258                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4260  0504 7216525a      	bset	21082,#3
4262  0508 2004          	jra	L7412
4263  050a               L5412:
4264                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4266  050a 7217525a      	bres	21082,#3
4267  050e               L7412:
4268                     ; 1263 }
4271  050e 87            	retf
4306                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4306                     ; 1272 {
4307                     	switch	.text
4308  050f               f_TIM1_OC4PreloadConfig:
4312                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4314                     ; 1277   if (NewState != DISABLE)
4316  050f 4d            	tnz	a
4317  0510 2706          	jreq	L7612
4318                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4320  0512 7216525b      	bset	21083,#3
4322  0516 2004          	jra	L1712
4323  0518               L7612:
4324                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4326  0518 7217525b      	bres	21083,#3
4327  051c               L1712:
4328                     ; 1285 }
4331  051c 87            	retf
4365                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4365                     ; 1294 {
4366                     	switch	.text
4367  051d               f_TIM1_OC1FastConfig:
4371                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4373                     ; 1299   if (NewState != DISABLE)
4375  051d 4d            	tnz	a
4376  051e 2706          	jreq	L1122
4377                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4379  0520 72145258      	bset	21080,#2
4381  0524 2004          	jra	L3122
4382  0526               L1122:
4383                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4385  0526 72155258      	bres	21080,#2
4386  052a               L3122:
4387                     ; 1307 }
4390  052a 87            	retf
4424                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4424                     ; 1316 {
4425                     	switch	.text
4426  052b               f_TIM1_OC2FastConfig:
4430                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4432                     ; 1321   if (NewState != DISABLE)
4434  052b 4d            	tnz	a
4435  052c 2706          	jreq	L3322
4436                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4438  052e 72145259      	bset	21081,#2
4440  0532 2004          	jra	L5322
4441  0534               L3322:
4442                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4444  0534 72155259      	bres	21081,#2
4445  0538               L5322:
4446                     ; 1329 }
4449  0538 87            	retf
4483                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4483                     ; 1338 {
4484                     	switch	.text
4485  0539               f_TIM1_OC3FastConfig:
4489                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4491                     ; 1343   if (NewState != DISABLE)
4493  0539 4d            	tnz	a
4494  053a 2706          	jreq	L5522
4495                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4497  053c 7214525a      	bset	21082,#2
4499  0540 2004          	jra	L7522
4500  0542               L5522:
4501                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4503  0542 7215525a      	bres	21082,#2
4504  0546               L7522:
4505                     ; 1351 }
4508  0546 87            	retf
4542                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4542                     ; 1360 {
4543                     	switch	.text
4544  0547               f_TIM1_OC4FastConfig:
4548                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4550                     ; 1365   if (NewState != DISABLE)
4552  0547 4d            	tnz	a
4553  0548 2706          	jreq	L7722
4554                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4556  054a 7214525b      	bset	21083,#2
4558  054e 2004          	jra	L1032
4559  0550               L7722:
4560                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4562  0550 7215525b      	bres	21083,#2
4563  0554               L1032:
4564                     ; 1373 }
4567  0554 87            	retf
4671                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4671                     ; 1390 {
4672                     	switch	.text
4673  0555               f_TIM1_GenerateEvent:
4677                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4679                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4681  0555 c75257        	ld	21079,a
4682                     ; 1396 }
4685  0558 87            	retf
4720                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4720                     ; 1407 {
4721                     	switch	.text
4722  0559               f_TIM1_OC1PolarityConfig:
4726                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4728                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4730  0559 4d            	tnz	a
4731  055a 2706          	jreq	L3632
4732                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4734  055c 7212525c      	bset	21084,#1
4736  0560 2004          	jra	L5632
4737  0562               L3632:
4738                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4740  0562 7213525c      	bres	21084,#1
4741  0566               L5632:
4742                     ; 1420 }
4745  0566 87            	retf
4780                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4780                     ; 1431 {
4781                     	switch	.text
4782  0567               f_TIM1_OC1NPolarityConfig:
4786                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4788                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4790  0567 4d            	tnz	a
4791  0568 2706          	jreq	L5042
4792                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4794  056a 7216525c      	bset	21084,#3
4796  056e 2004          	jra	L7042
4797  0570               L5042:
4798                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4800  0570 7217525c      	bres	21084,#3
4801  0574               L7042:
4802                     ; 1444 }
4805  0574 87            	retf
4840                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4840                     ; 1455 {
4841                     	switch	.text
4842  0575               f_TIM1_OC2PolarityConfig:
4846                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4848                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4850  0575 4d            	tnz	a
4851  0576 2706          	jreq	L7242
4852                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4854  0578 721a525c      	bset	21084,#5
4856  057c 2004          	jra	L1342
4857  057e               L7242:
4858                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4860  057e 721b525c      	bres	21084,#5
4861  0582               L1342:
4862                     ; 1468 }
4865  0582 87            	retf
4900                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4900                     ; 1479 {
4901                     	switch	.text
4902  0583               f_TIM1_OC2NPolarityConfig:
4906                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4908                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4910  0583 4d            	tnz	a
4911  0584 2706          	jreq	L1542
4912                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4914  0586 721e525c      	bset	21084,#7
4916  058a 2004          	jra	L3542
4917  058c               L1542:
4918                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4920  058c 721f525c      	bres	21084,#7
4921  0590               L3542:
4922                     ; 1492 }
4925  0590 87            	retf
4960                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4960                     ; 1503 {
4961                     	switch	.text
4962  0591               f_TIM1_OC3PolarityConfig:
4966                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4968                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4970  0591 4d            	tnz	a
4971  0592 2706          	jreq	L3742
4972                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
4974  0594 7212525d      	bset	21085,#1
4976  0598 2004          	jra	L5742
4977  059a               L3742:
4978                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
4980  059a 7213525d      	bres	21085,#1
4981  059e               L5742:
4982                     ; 1516 }
4985  059e 87            	retf
5020                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5020                     ; 1528 {
5021                     	switch	.text
5022  059f               f_TIM1_OC3NPolarityConfig:
5026                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5028                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5030  059f 4d            	tnz	a
5031  05a0 2706          	jreq	L5152
5032                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5034  05a2 7216525d      	bset	21085,#3
5036  05a6 2004          	jra	L7152
5037  05a8               L5152:
5038                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5040  05a8 7217525d      	bres	21085,#3
5041  05ac               L7152:
5042                     ; 1541 }
5045  05ac 87            	retf
5080                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5080                     ; 1552 {
5081                     	switch	.text
5082  05ad               f_TIM1_OC4PolarityConfig:
5086                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5088                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5090  05ad 4d            	tnz	a
5091  05ae 2706          	jreq	L7352
5092                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5094  05b0 721a525d      	bset	21085,#5
5096  05b4 2004          	jra	L1452
5097  05b6               L7352:
5098                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5100  05b6 721b525d      	bres	21085,#5
5101  05ba               L1452:
5102                     ; 1565 }
5105  05ba 87            	retf
5149                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5149                     ; 1580 {
5150                     	switch	.text
5151  05bb               f_TIM1_CCxCmd:
5153  05bb 89            	pushw	x
5154       00000000      OFST:	set	0
5157                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5159                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5161                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5163  05bc 9e            	ld	a,xh
5164  05bd 4d            	tnz	a
5165  05be 2610          	jrne	L5652
5166                     ; 1588     if (NewState != DISABLE)
5168  05c0 9f            	ld	a,xl
5169  05c1 4d            	tnz	a
5170  05c2 2706          	jreq	L7652
5171                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5173  05c4 7210525c      	bset	21084,#0
5175  05c8 2040          	jra	L3752
5176  05ca               L7652:
5177                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5179  05ca 7211525c      	bres	21084,#0
5180  05ce 203a          	jra	L3752
5181  05d0               L5652:
5182                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5184  05d0 7b01          	ld	a,(OFST+1,sp)
5185  05d2 a101          	cp	a,#1
5186  05d4 2610          	jrne	L5752
5187                     ; 1601     if (NewState != DISABLE)
5189  05d6 0d02          	tnz	(OFST+2,sp)
5190  05d8 2706          	jreq	L7752
5191                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5193  05da 7218525c      	bset	21084,#4
5195  05de 202a          	jra	L3752
5196  05e0               L7752:
5197                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5199  05e0 7219525c      	bres	21084,#4
5200  05e4 2024          	jra	L3752
5201  05e6               L5752:
5202                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5204  05e6 7b01          	ld	a,(OFST+1,sp)
5205  05e8 a102          	cp	a,#2
5206  05ea 2610          	jrne	L5062
5207                     ; 1613     if (NewState != DISABLE)
5209  05ec 0d02          	tnz	(OFST+2,sp)
5210  05ee 2706          	jreq	L7062
5211                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5213  05f0 7210525d      	bset	21085,#0
5215  05f4 2014          	jra	L3752
5216  05f6               L7062:
5217                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5219  05f6 7211525d      	bres	21085,#0
5220  05fa 200e          	jra	L3752
5221  05fc               L5062:
5222                     ; 1625     if (NewState != DISABLE)
5224  05fc 0d02          	tnz	(OFST+2,sp)
5225  05fe 2706          	jreq	L5162
5226                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5228  0600 7218525d      	bset	21085,#4
5230  0604 2004          	jra	L3752
5231  0606               L5162:
5232                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5234  0606 7219525d      	bres	21085,#4
5235  060a               L3752:
5236                     ; 1634 }
5239  060a 85            	popw	x
5240  060b 87            	retf
5284                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5284                     ; 1648 {
5285                     	switch	.text
5286  060c               f_TIM1_CCxNCmd:
5288  060c 89            	pushw	x
5289       00000000      OFST:	set	0
5292                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5294                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5296                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5298  060d 9e            	ld	a,xh
5299  060e 4d            	tnz	a
5300  060f 2610          	jrne	L3462
5301                     ; 1656     if (NewState != DISABLE)
5303  0611 9f            	ld	a,xl
5304  0612 4d            	tnz	a
5305  0613 2706          	jreq	L5462
5306                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5308  0615 7214525c      	bset	21084,#2
5310  0619 202a          	jra	L1562
5311  061b               L5462:
5312                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5314  061b 7215525c      	bres	21084,#2
5315  061f 2024          	jra	L1562
5316  0621               L3462:
5317                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5319  0621 7b01          	ld	a,(OFST+1,sp)
5320  0623 a101          	cp	a,#1
5321  0625 2610          	jrne	L3562
5322                     ; 1668     if (NewState != DISABLE)
5324  0627 0d02          	tnz	(OFST+2,sp)
5325  0629 2706          	jreq	L5562
5326                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5328  062b 721c525c      	bset	21084,#6
5330  062f 2014          	jra	L1562
5331  0631               L5562:
5332                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5334  0631 721d525c      	bres	21084,#6
5335  0635 200e          	jra	L1562
5336  0637               L3562:
5337                     ; 1680     if (NewState != DISABLE)
5339  0637 0d02          	tnz	(OFST+2,sp)
5340  0639 2706          	jreq	L3662
5341                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5343  063b 7214525d      	bset	21085,#2
5345  063f 2004          	jra	L1562
5346  0641               L3662:
5347                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5349  0641 7215525d      	bres	21085,#2
5350  0645               L1562:
5351                     ; 1689 }
5354  0645 85            	popw	x
5355  0646 87            	retf
5399                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5399                     ; 1713 {
5400                     	switch	.text
5401  0647               f_TIM1_SelectOCxM:
5403  0647 89            	pushw	x
5404       00000000      OFST:	set	0
5407                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5409                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5411                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5413  0648 9e            	ld	a,xh
5414  0649 4d            	tnz	a
5415  064a 2610          	jrne	L1172
5416                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5418  064c 7211525c      	bres	21084,#0
5419                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5419                     ; 1725                             | (uint8_t)TIM1_OCMode);
5421  0650 c65258        	ld	a,21080
5422  0653 a48f          	and	a,#143
5423  0655 1a02          	or	a,(OFST+2,sp)
5424  0657 c75258        	ld	21080,a
5426  065a 203a          	jra	L3172
5427  065c               L1172:
5428                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5430  065c 7b01          	ld	a,(OFST+1,sp)
5431  065e a101          	cp	a,#1
5432  0660 2610          	jrne	L5172
5433                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5435  0662 7219525c      	bres	21084,#4
5436                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5436                     ; 1734                             | (uint8_t)TIM1_OCMode);
5438  0666 c65259        	ld	a,21081
5439  0669 a48f          	and	a,#143
5440  066b 1a02          	or	a,(OFST+2,sp)
5441  066d c75259        	ld	21081,a
5443  0670 2024          	jra	L3172
5444  0672               L5172:
5445                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5447  0672 7b01          	ld	a,(OFST+1,sp)
5448  0674 a102          	cp	a,#2
5449  0676 2610          	jrne	L1272
5450                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5452  0678 7211525d      	bres	21085,#0
5453                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5453                     ; 1743                             | (uint8_t)TIM1_OCMode);
5455  067c c6525a        	ld	a,21082
5456  067f a48f          	and	a,#143
5457  0681 1a02          	or	a,(OFST+2,sp)
5458  0683 c7525a        	ld	21082,a
5460  0686 200e          	jra	L3172
5461  0688               L1272:
5462                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5464  0688 7219525d      	bres	21085,#4
5465                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5465                     ; 1752                             | (uint8_t)TIM1_OCMode);
5467  068c c6525b        	ld	a,21083
5468  068f a48f          	and	a,#143
5469  0691 1a02          	or	a,(OFST+2,sp)
5470  0693 c7525b        	ld	21083,a
5471  0696               L3172:
5472                     ; 1754 }
5475  0696 85            	popw	x
5476  0697 87            	retf
5507                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5507                     ; 1763 {
5508                     	switch	.text
5509  0698               f_TIM1_SetCounter:
5513                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5515  0698 9e            	ld	a,xh
5516  0699 c7525e        	ld	21086,a
5517                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5519  069c 9f            	ld	a,xl
5520  069d c7525f        	ld	21087,a
5521                     ; 1767 }
5524  06a0 87            	retf
5555                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5555                     ; 1776 {
5556                     	switch	.text
5557  06a1               f_TIM1_SetAutoreload:
5561                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5563  06a1 9e            	ld	a,xh
5564  06a2 c75262        	ld	21090,a
5565                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5567  06a5 9f            	ld	a,xl
5568  06a6 c75263        	ld	21091,a
5569                     ; 1780  }
5572  06a9 87            	retf
5603                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5603                     ; 1789 {
5604                     	switch	.text
5605  06aa               f_TIM1_SetCompare1:
5609                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5611  06aa 9e            	ld	a,xh
5612  06ab c75265        	ld	21093,a
5613                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5615  06ae 9f            	ld	a,xl
5616  06af c75266        	ld	21094,a
5617                     ; 1793 }
5620  06b2 87            	retf
5651                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5651                     ; 1802 {
5652                     	switch	.text
5653  06b3               f_TIM1_SetCompare2:
5657                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5659  06b3 9e            	ld	a,xh
5660  06b4 c75267        	ld	21095,a
5661                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5663  06b7 9f            	ld	a,xl
5664  06b8 c75268        	ld	21096,a
5665                     ; 1806 }
5668  06bb 87            	retf
5699                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5699                     ; 1815 {
5700                     	switch	.text
5701  06bc               f_TIM1_SetCompare3:
5705                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5707  06bc 9e            	ld	a,xh
5708  06bd c75269        	ld	21097,a
5709                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5711  06c0 9f            	ld	a,xl
5712  06c1 c7526a        	ld	21098,a
5713                     ; 1819 }
5716  06c4 87            	retf
5747                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5747                     ; 1828 {
5748                     	switch	.text
5749  06c5               f_TIM1_SetCompare4:
5753                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5755  06c5 9e            	ld	a,xh
5756  06c6 c7526b        	ld	21099,a
5757                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5759  06c9 9f            	ld	a,xl
5760  06ca c7526c        	ld	21100,a
5761                     ; 1832 }
5764  06cd 87            	retf
5799                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5799                     ; 1845 {
5800                     	switch	.text
5801  06ce               f_TIM1_SetIC1Prescaler:
5803  06ce 88            	push	a
5804       00000000      OFST:	set	0
5807                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5809                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5809                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5811  06cf c65258        	ld	a,21080
5812  06d2 a4f3          	and	a,#243
5813  06d4 1a01          	or	a,(OFST+1,sp)
5814  06d6 c75258        	ld	21080,a
5815                     ; 1852 }
5818  06d9 84            	pop	a
5819  06da 87            	retf
5854                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5854                     ; 1865 {
5855                     	switch	.text
5856  06db               f_TIM1_SetIC2Prescaler:
5858  06db 88            	push	a
5859       00000000      OFST:	set	0
5862                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5864                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5864                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5866  06dc c65259        	ld	a,21081
5867  06df a4f3          	and	a,#243
5868  06e1 1a01          	or	a,(OFST+1,sp)
5869  06e3 c75259        	ld	21081,a
5870                     ; 1873 }
5873  06e6 84            	pop	a
5874  06e7 87            	retf
5909                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5909                     ; 1886 {
5910                     	switch	.text
5911  06e8               f_TIM1_SetIC3Prescaler:
5913  06e8 88            	push	a
5914       00000000      OFST:	set	0
5917                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
5919                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
5919                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
5921  06e9 c6525a        	ld	a,21082
5922  06ec a4f3          	and	a,#243
5923  06ee 1a01          	or	a,(OFST+1,sp)
5924  06f0 c7525a        	ld	21082,a
5925                     ; 1894 }
5928  06f3 84            	pop	a
5929  06f4 87            	retf
5964                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5964                     ; 1907 {
5965                     	switch	.text
5966  06f5               f_TIM1_SetIC4Prescaler:
5968  06f5 88            	push	a
5969       00000000      OFST:	set	0
5972                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
5974                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
5974                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
5976  06f6 c6525b        	ld	a,21083
5977  06f9 a4f3          	and	a,#243
5978  06fb 1a01          	or	a,(OFST+1,sp)
5979  06fd c7525b        	ld	21083,a
5980                     ; 1915 }
5983  0700 84            	pop	a
5984  0701 87            	retf
6029                     ; 1922 uint16_t TIM1_GetCapture1(void)
6029                     ; 1923 {
6030                     	switch	.text
6031  0702               f_TIM1_GetCapture1:
6033  0702 5204          	subw	sp,#4
6034       00000004      OFST:	set	4
6037                     ; 1926   uint16_t tmpccr1 = 0;
6039                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6043                     ; 1929   tmpccr1h = TIM1->CCR1H;
6045  0704 c65265        	ld	a,21093
6046  0707 6b02          	ld	(OFST-2,sp),a
6048                     ; 1930   tmpccr1l = TIM1->CCR1L;
6050  0709 c65266        	ld	a,21094
6051  070c 6b01          	ld	(OFST-3,sp),a
6053                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6055  070e 7b01          	ld	a,(OFST-3,sp)
6056  0710 5f            	clrw	x
6057  0711 97            	ld	xl,a
6058  0712 1f03          	ldw	(OFST-1,sp),x
6060                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6062  0714 7b02          	ld	a,(OFST-2,sp)
6063  0716 5f            	clrw	x
6064  0717 97            	ld	xl,a
6065  0718 4f            	clr	a
6066  0719 02            	rlwa	x,a
6067  071a 01            	rrwa	x,a
6068  071b 1a04          	or	a,(OFST+0,sp)
6069  071d 01            	rrwa	x,a
6070  071e 1a03          	or	a,(OFST-1,sp)
6071  0720 01            	rrwa	x,a
6072  0721 1f03          	ldw	(OFST-1,sp),x
6074                     ; 1935   return (uint16_t)tmpccr1;
6076  0723 1e03          	ldw	x,(OFST-1,sp)
6079  0725 5b04          	addw	sp,#4
6080  0727 87            	retf
6125                     ; 1943 uint16_t TIM1_GetCapture2(void)
6125                     ; 1944 {
6126                     	switch	.text
6127  0728               f_TIM1_GetCapture2:
6129  0728 5204          	subw	sp,#4
6130       00000004      OFST:	set	4
6133                     ; 1947   uint16_t tmpccr2 = 0;
6135                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6139                     ; 1950   tmpccr2h = TIM1->CCR2H;
6141  072a c65267        	ld	a,21095
6142  072d 6b02          	ld	(OFST-2,sp),a
6144                     ; 1951   tmpccr2l = TIM1->CCR2L;
6146  072f c65268        	ld	a,21096
6147  0732 6b01          	ld	(OFST-3,sp),a
6149                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6151  0734 7b01          	ld	a,(OFST-3,sp)
6152  0736 5f            	clrw	x
6153  0737 97            	ld	xl,a
6154  0738 1f03          	ldw	(OFST-1,sp),x
6156                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6158  073a 7b02          	ld	a,(OFST-2,sp)
6159  073c 5f            	clrw	x
6160  073d 97            	ld	xl,a
6161  073e 4f            	clr	a
6162  073f 02            	rlwa	x,a
6163  0740 01            	rrwa	x,a
6164  0741 1a04          	or	a,(OFST+0,sp)
6165  0743 01            	rrwa	x,a
6166  0744 1a03          	or	a,(OFST-1,sp)
6167  0746 01            	rrwa	x,a
6168  0747 1f03          	ldw	(OFST-1,sp),x
6170                     ; 1956   return (uint16_t)tmpccr2;
6172  0749 1e03          	ldw	x,(OFST-1,sp)
6175  074b 5b04          	addw	sp,#4
6176  074d 87            	retf
6221                     ; 1964 uint16_t TIM1_GetCapture3(void)
6221                     ; 1965 {
6222                     	switch	.text
6223  074e               f_TIM1_GetCapture3:
6225  074e 5204          	subw	sp,#4
6226       00000004      OFST:	set	4
6229                     ; 1967   uint16_t tmpccr3 = 0;
6231                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6235                     ; 1970   tmpccr3h = TIM1->CCR3H;
6237  0750 c65269        	ld	a,21097
6238  0753 6b02          	ld	(OFST-2,sp),a
6240                     ; 1971   tmpccr3l = TIM1->CCR3L;
6242  0755 c6526a        	ld	a,21098
6243  0758 6b01          	ld	(OFST-3,sp),a
6245                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6247  075a 7b01          	ld	a,(OFST-3,sp)
6248  075c 5f            	clrw	x
6249  075d 97            	ld	xl,a
6250  075e 1f03          	ldw	(OFST-1,sp),x
6252                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6254  0760 7b02          	ld	a,(OFST-2,sp)
6255  0762 5f            	clrw	x
6256  0763 97            	ld	xl,a
6257  0764 4f            	clr	a
6258  0765 02            	rlwa	x,a
6259  0766 01            	rrwa	x,a
6260  0767 1a04          	or	a,(OFST+0,sp)
6261  0769 01            	rrwa	x,a
6262  076a 1a03          	or	a,(OFST-1,sp)
6263  076c 01            	rrwa	x,a
6264  076d 1f03          	ldw	(OFST-1,sp),x
6266                     ; 1976   return (uint16_t)tmpccr3;
6268  076f 1e03          	ldw	x,(OFST-1,sp)
6271  0771 5b04          	addw	sp,#4
6272  0773 87            	retf
6317                     ; 1984 uint16_t TIM1_GetCapture4(void)
6317                     ; 1985 {
6318                     	switch	.text
6319  0774               f_TIM1_GetCapture4:
6321  0774 5204          	subw	sp,#4
6322       00000004      OFST:	set	4
6325                     ; 1987   uint16_t tmpccr4 = 0;
6327                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6331                     ; 1990   tmpccr4h = TIM1->CCR4H;
6333  0776 c6526b        	ld	a,21099
6334  0779 6b02          	ld	(OFST-2,sp),a
6336                     ; 1991   tmpccr4l = TIM1->CCR4L;
6338  077b c6526c        	ld	a,21100
6339  077e 6b01          	ld	(OFST-3,sp),a
6341                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6343  0780 7b01          	ld	a,(OFST-3,sp)
6344  0782 5f            	clrw	x
6345  0783 97            	ld	xl,a
6346  0784 1f03          	ldw	(OFST-1,sp),x
6348                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6350  0786 7b02          	ld	a,(OFST-2,sp)
6351  0788 5f            	clrw	x
6352  0789 97            	ld	xl,a
6353  078a 4f            	clr	a
6354  078b 02            	rlwa	x,a
6355  078c 01            	rrwa	x,a
6356  078d 1a04          	or	a,(OFST+0,sp)
6357  078f 01            	rrwa	x,a
6358  0790 1a03          	or	a,(OFST-1,sp)
6359  0792 01            	rrwa	x,a
6360  0793 1f03          	ldw	(OFST-1,sp),x
6362                     ; 1996   return (uint16_t)tmpccr4;
6364  0795 1e03          	ldw	x,(OFST-1,sp)
6367  0797 5b04          	addw	sp,#4
6368  0799 87            	retf
6399                     ; 2004 uint16_t TIM1_GetCounter(void)
6399                     ; 2005 {
6400                     	switch	.text
6401  079a               f_TIM1_GetCounter:
6403  079a 89            	pushw	x
6404       00000002      OFST:	set	2
6407                     ; 2006   uint16_t tmpcntr = 0;
6409                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6411  079b c6525e        	ld	a,21086
6412  079e 5f            	clrw	x
6413  079f 97            	ld	xl,a
6414  07a0 4f            	clr	a
6415  07a1 02            	rlwa	x,a
6416  07a2 1f01          	ldw	(OFST-1,sp),x
6418                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6420  07a4 c6525f        	ld	a,21087
6421  07a7 5f            	clrw	x
6422  07a8 97            	ld	xl,a
6423  07a9 01            	rrwa	x,a
6424  07aa 1a02          	or	a,(OFST+0,sp)
6425  07ac 01            	rrwa	x,a
6426  07ad 1a01          	or	a,(OFST-1,sp)
6427  07af 01            	rrwa	x,a
6430  07b0 5b02          	addw	sp,#2
6431  07b2 87            	retf
6462                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6462                     ; 2020 {
6463                     	switch	.text
6464  07b3               f_TIM1_GetPrescaler:
6466  07b3 89            	pushw	x
6467       00000002      OFST:	set	2
6470                     ; 2021   uint16_t temp = 0;
6472                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6474  07b4 c65260        	ld	a,21088
6475  07b7 5f            	clrw	x
6476  07b8 97            	ld	xl,a
6477  07b9 4f            	clr	a
6478  07ba 02            	rlwa	x,a
6479  07bb 1f01          	ldw	(OFST-1,sp),x
6481                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6483  07bd c65261        	ld	a,21089
6484  07c0 5f            	clrw	x
6485  07c1 97            	ld	xl,a
6486  07c2 01            	rrwa	x,a
6487  07c3 1a02          	or	a,(OFST+0,sp)
6488  07c5 01            	rrwa	x,a
6489  07c6 1a01          	or	a,(OFST-1,sp)
6490  07c8 01            	rrwa	x,a
6493  07c9 5b02          	addw	sp,#2
6494  07cb 87            	retf
6663                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6663                     ; 2048 {
6664                     	switch	.text
6665  07cc               f_TIM1_GetFlagStatus:
6667  07cc 89            	pushw	x
6668  07cd 89            	pushw	x
6669       00000002      OFST:	set	2
6672                     ; 2049   FlagStatus bitstatus = RESET;
6674                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6678                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6680                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6682  07ce 9f            	ld	a,xl
6683  07cf c45255        	and	a,21077
6684  07d2 6b01          	ld	(OFST-1,sp),a
6686                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6688  07d4 7b03          	ld	a,(OFST+1,sp)
6689  07d6 6b02          	ld	(OFST+0,sp),a
6691                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6693  07d8 c65256        	ld	a,21078
6694  07db 1402          	and	a,(OFST+0,sp)
6695  07dd 1a01          	or	a,(OFST-1,sp)
6696  07df 2706          	jreq	L7433
6697                     ; 2060     bitstatus = SET;
6699  07e1 a601          	ld	a,#1
6700  07e3 6b02          	ld	(OFST+0,sp),a
6703  07e5 2002          	jra	L1533
6704  07e7               L7433:
6705                     ; 2064     bitstatus = RESET;
6707  07e7 0f02          	clr	(OFST+0,sp)
6709  07e9               L1533:
6710                     ; 2066   return (FlagStatus)(bitstatus);
6712  07e9 7b02          	ld	a,(OFST+0,sp)
6715  07eb 5b04          	addw	sp,#4
6716  07ed 87            	retf
6750                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6750                     ; 2088 {
6751                     	switch	.text
6752  07ee               f_TIM1_ClearFlag:
6754  07ee 89            	pushw	x
6755       00000000      OFST:	set	0
6758                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6760                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6762  07ef 9f            	ld	a,xl
6763  07f0 43            	cpl	a
6764  07f1 c75255        	ld	21077,a
6765                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6765                     ; 2095                         (uint8_t)0x1E);
6767  07f4 7b01          	ld	a,(OFST+1,sp)
6768  07f6 43            	cpl	a
6769  07f7 a41e          	and	a,#30
6770  07f9 c75256        	ld	21078,a
6771                     ; 2096 }
6774  07fc 85            	popw	x
6775  07fd 87            	retf
6834                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6834                     ; 2113 {
6835                     	switch	.text
6836  07fe               f_TIM1_GetITStatus:
6838  07fe 88            	push	a
6839  07ff 89            	pushw	x
6840       00000002      OFST:	set	2
6843                     ; 2114   ITStatus bitstatus = RESET;
6845                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6849                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6851                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6853  0800 c45255        	and	a,21077
6854  0803 6b01          	ld	(OFST-1,sp),a
6856                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6858  0805 c65254        	ld	a,21076
6859  0808 1403          	and	a,(OFST+1,sp)
6860  080a 6b02          	ld	(OFST+0,sp),a
6862                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6864  080c 0d01          	tnz	(OFST-1,sp)
6865  080e 270a          	jreq	L7143
6867  0810 0d02          	tnz	(OFST+0,sp)
6868  0812 2706          	jreq	L7143
6869                     ; 2126     bitstatus = SET;
6871  0814 a601          	ld	a,#1
6872  0816 6b02          	ld	(OFST+0,sp),a
6875  0818 2002          	jra	L1243
6876  081a               L7143:
6877                     ; 2130     bitstatus = RESET;
6879  081a 0f02          	clr	(OFST+0,sp)
6881  081c               L1243:
6882                     ; 2132   return (ITStatus)(bitstatus);
6884  081c 7b02          	ld	a,(OFST+0,sp)
6887  081e 5b03          	addw	sp,#3
6888  0820 87            	retf
6923                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6923                     ; 2150 {
6924                     	switch	.text
6925  0821               f_TIM1_ClearITPendingBit:
6929                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
6931                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
6933  0821 43            	cpl	a
6934  0822 c75255        	ld	21077,a
6935                     ; 2156 }
6938  0825 87            	retf
6983                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
6983                     ; 2175                        uint8_t TIM1_ICSelection,
6983                     ; 2176                        uint8_t TIM1_ICFilter)
6983                     ; 2177 {
6984                     	switch	.text
6985  0826               L3f_TI1_Config:
6987  0826 89            	pushw	x
6988  0827 88            	push	a
6989       00000001      OFST:	set	1
6992                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
6994  0828 7211525c      	bres	21084,#0
6995                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
6995                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
6997  082c 7b07          	ld	a,(OFST+6,sp)
6998  082e 97            	ld	xl,a
6999  082f a610          	ld	a,#16
7000  0831 42            	mul	x,a
7001  0832 9f            	ld	a,xl
7002  0833 1a03          	or	a,(OFST+2,sp)
7003  0835 6b01          	ld	(OFST+0,sp),a
7005  0837 c65258        	ld	a,21080
7006  083a a40c          	and	a,#12
7007  083c 1a01          	or	a,(OFST+0,sp)
7008  083e c75258        	ld	21080,a
7009                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7011  0841 0d02          	tnz	(OFST+1,sp)
7012  0843 2706          	jreq	L1643
7013                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7015  0845 7212525c      	bset	21084,#1
7017  0849 2004          	jra	L3643
7018  084b               L1643:
7019                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7021  084b 7213525c      	bres	21084,#1
7022  084f               L3643:
7023                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7025  084f 7210525c      	bset	21084,#0
7026                     ; 2197 }
7029  0853 5b03          	addw	sp,#3
7030  0855 87            	retf
7075                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7075                     ; 2216                        uint8_t TIM1_ICSelection,
7075                     ; 2217                        uint8_t TIM1_ICFilter)
7075                     ; 2218 {
7076                     	switch	.text
7077  0856               L5f_TI2_Config:
7079  0856 89            	pushw	x
7080  0857 88            	push	a
7081       00000001      OFST:	set	1
7084                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7086  0858 7219525c      	bres	21084,#4
7087                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7087                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7089  085c 7b07          	ld	a,(OFST+6,sp)
7090  085e 97            	ld	xl,a
7091  085f a610          	ld	a,#16
7092  0861 42            	mul	x,a
7093  0862 9f            	ld	a,xl
7094  0863 1a03          	or	a,(OFST+2,sp)
7095  0865 6b01          	ld	(OFST+0,sp),a
7097  0867 c65259        	ld	a,21081
7098  086a a40c          	and	a,#12
7099  086c 1a01          	or	a,(OFST+0,sp)
7100  086e c75259        	ld	21081,a
7101                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7103  0871 0d02          	tnz	(OFST+1,sp)
7104  0873 2706          	jreq	L5053
7105                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7107  0875 721a525c      	bset	21084,#5
7109  0879 2004          	jra	L7053
7110  087b               L5053:
7111                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7113  087b 721b525c      	bres	21084,#5
7114  087f               L7053:
7115                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7117  087f 7218525c      	bset	21084,#4
7118                     ; 2236 }
7121  0883 5b03          	addw	sp,#3
7122  0885 87            	retf
7167                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7167                     ; 2255                        uint8_t TIM1_ICSelection,
7167                     ; 2256                        uint8_t TIM1_ICFilter)
7167                     ; 2257 {
7168                     	switch	.text
7169  0886               L7f_TI3_Config:
7171  0886 89            	pushw	x
7172  0887 88            	push	a
7173       00000001      OFST:	set	1
7176                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7178  0888 7211525d      	bres	21085,#0
7179                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7179                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7181  088c 7b07          	ld	a,(OFST+6,sp)
7182  088e 97            	ld	xl,a
7183  088f a610          	ld	a,#16
7184  0891 42            	mul	x,a
7185  0892 9f            	ld	a,xl
7186  0893 1a03          	or	a,(OFST+2,sp)
7187  0895 6b01          	ld	(OFST+0,sp),a
7189  0897 c6525a        	ld	a,21082
7190  089a a40c          	and	a,#12
7191  089c 1a01          	or	a,(OFST+0,sp)
7192  089e c7525a        	ld	21082,a
7193                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7195  08a1 0d02          	tnz	(OFST+1,sp)
7196  08a3 2706          	jreq	L1353
7197                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7199  08a5 7212525d      	bset	21085,#1
7201  08a9 2004          	jra	L3353
7202  08ab               L1353:
7203                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7205  08ab 7213525d      	bres	21085,#1
7206  08af               L3353:
7207                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7209  08af 7210525d      	bset	21085,#0
7210                     ; 2276 }
7213  08b3 5b03          	addw	sp,#3
7214  08b5 87            	retf
7259                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7259                     ; 2295                        uint8_t TIM1_ICSelection,
7259                     ; 2296                        uint8_t TIM1_ICFilter)
7259                     ; 2297 {
7260                     	switch	.text
7261  08b6               L11f_TI4_Config:
7263  08b6 89            	pushw	x
7264  08b7 88            	push	a
7265       00000001      OFST:	set	1
7268                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7270  08b8 7219525d      	bres	21085,#4
7271                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7271                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7273  08bc 7b07          	ld	a,(OFST+6,sp)
7274  08be 97            	ld	xl,a
7275  08bf a610          	ld	a,#16
7276  08c1 42            	mul	x,a
7277  08c2 9f            	ld	a,xl
7278  08c3 1a03          	or	a,(OFST+2,sp)
7279  08c5 6b01          	ld	(OFST+0,sp),a
7281  08c7 c6525b        	ld	a,21083
7282  08ca a40c          	and	a,#12
7283  08cc 1a01          	or	a,(OFST+0,sp)
7284  08ce c7525b        	ld	21083,a
7285                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7287  08d1 0d02          	tnz	(OFST+1,sp)
7288  08d3 2706          	jreq	L5553
7289                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7291  08d5 721a525d      	bset	21085,#5
7293  08d9 2004          	jra	L7553
7294  08db               L5553:
7295                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7297  08db 721b525d      	bres	21085,#5
7298  08df               L7553:
7299                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7301  08df 7218525d      	bset	21085,#4
7302                     ; 2317 }
7305  08e3 5b03          	addw	sp,#3
7306  08e5 87            	retf
7318                     	xdef	f_TIM1_ClearITPendingBit
7319                     	xdef	f_TIM1_GetITStatus
7320                     	xdef	f_TIM1_ClearFlag
7321                     	xdef	f_TIM1_GetFlagStatus
7322                     	xdef	f_TIM1_GetPrescaler
7323                     	xdef	f_TIM1_GetCounter
7324                     	xdef	f_TIM1_GetCapture4
7325                     	xdef	f_TIM1_GetCapture3
7326                     	xdef	f_TIM1_GetCapture2
7327                     	xdef	f_TIM1_GetCapture1
7328                     	xdef	f_TIM1_SetIC4Prescaler
7329                     	xdef	f_TIM1_SetIC3Prescaler
7330                     	xdef	f_TIM1_SetIC2Prescaler
7331                     	xdef	f_TIM1_SetIC1Prescaler
7332                     	xdef	f_TIM1_SetCompare4
7333                     	xdef	f_TIM1_SetCompare3
7334                     	xdef	f_TIM1_SetCompare2
7335                     	xdef	f_TIM1_SetCompare1
7336                     	xdef	f_TIM1_SetAutoreload
7337                     	xdef	f_TIM1_SetCounter
7338                     	xdef	f_TIM1_SelectOCxM
7339                     	xdef	f_TIM1_CCxNCmd
7340                     	xdef	f_TIM1_CCxCmd
7341                     	xdef	f_TIM1_OC4PolarityConfig
7342                     	xdef	f_TIM1_OC3NPolarityConfig
7343                     	xdef	f_TIM1_OC3PolarityConfig
7344                     	xdef	f_TIM1_OC2NPolarityConfig
7345                     	xdef	f_TIM1_OC2PolarityConfig
7346                     	xdef	f_TIM1_OC1NPolarityConfig
7347                     	xdef	f_TIM1_OC1PolarityConfig
7348                     	xdef	f_TIM1_GenerateEvent
7349                     	xdef	f_TIM1_OC4FastConfig
7350                     	xdef	f_TIM1_OC3FastConfig
7351                     	xdef	f_TIM1_OC2FastConfig
7352                     	xdef	f_TIM1_OC1FastConfig
7353                     	xdef	f_TIM1_OC4PreloadConfig
7354                     	xdef	f_TIM1_OC3PreloadConfig
7355                     	xdef	f_TIM1_OC2PreloadConfig
7356                     	xdef	f_TIM1_OC1PreloadConfig
7357                     	xdef	f_TIM1_CCPreloadControl
7358                     	xdef	f_TIM1_SelectCOM
7359                     	xdef	f_TIM1_ARRPreloadConfig
7360                     	xdef	f_TIM1_ForcedOC4Config
7361                     	xdef	f_TIM1_ForcedOC3Config
7362                     	xdef	f_TIM1_ForcedOC2Config
7363                     	xdef	f_TIM1_ForcedOC1Config
7364                     	xdef	f_TIM1_CounterModeConfig
7365                     	xdef	f_TIM1_PrescalerConfig
7366                     	xdef	f_TIM1_EncoderInterfaceConfig
7367                     	xdef	f_TIM1_SelectMasterSlaveMode
7368                     	xdef	f_TIM1_SelectSlaveMode
7369                     	xdef	f_TIM1_SelectOutputTrigger
7370                     	xdef	f_TIM1_SelectOnePulseMode
7371                     	xdef	f_TIM1_SelectHallSensor
7372                     	xdef	f_TIM1_UpdateRequestConfig
7373                     	xdef	f_TIM1_UpdateDisableConfig
7374                     	xdef	f_TIM1_SelectInputTrigger
7375                     	xdef	f_TIM1_TIxExternalClockConfig
7376                     	xdef	f_TIM1_ETRConfig
7377                     	xdef	f_TIM1_ETRClockMode2Config
7378                     	xdef	f_TIM1_ETRClockMode1Config
7379                     	xdef	f_TIM1_InternalClockConfig
7380                     	xdef	f_TIM1_ITConfig
7381                     	xdef	f_TIM1_CtrlPWMOutputs
7382                     	xdef	f_TIM1_Cmd
7383                     	xdef	f_TIM1_PWMIConfig
7384                     	xdef	f_TIM1_ICInit
7385                     	xdef	f_TIM1_BDTRConfig
7386                     	xdef	f_TIM1_OC4Init
7387                     	xdef	f_TIM1_OC3Init
7388                     	xdef	f_TIM1_OC2Init
7389                     	xdef	f_TIM1_OC1Init
7390                     	xdef	f_TIM1_TimeBaseInit
7391                     	xdef	f_TIM1_DeInit
7410                     	end
