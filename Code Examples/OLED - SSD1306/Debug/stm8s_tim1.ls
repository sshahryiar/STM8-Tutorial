   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  47                     ; 58 void TIM1_DeInit(void)
  47                     ; 59 {
  49                     	switch	.text
  50  0000               _TIM1_DeInit:
  54                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  56  0000 725f5250      	clr	21072
  57                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  59  0004 725f5251      	clr	21073
  60                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  62  0008 725f5252      	clr	21074
  63                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  65  000c 725f5253      	clr	21075
  66                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  68  0010 725f5254      	clr	21076
  69                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  71  0014 725f5256      	clr	21078
  72                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  74  0018 725f525c      	clr	21084
  75                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  77  001c 725f525d      	clr	21085
  78                     ; 70   TIM1->CCMR1 = 0x01;
  80  0020 35015258      	mov	21080,#1
  81                     ; 71   TIM1->CCMR2 = 0x01;
  83  0024 35015259      	mov	21081,#1
  84                     ; 72   TIM1->CCMR3 = 0x01;
  86  0028 3501525a      	mov	21082,#1
  87                     ; 73   TIM1->CCMR4 = 0x01;
  89  002c 3501525b      	mov	21083,#1
  90                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  92  0030 725f525c      	clr	21084
  93                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  95  0034 725f525d      	clr	21085
  96                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  98  0038 725f5258      	clr	21080
  99                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 101  003c 725f5259      	clr	21081
 102                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 104  0040 725f525a      	clr	21082
 105                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 107  0044 725f525b      	clr	21083
 108                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 110  0048 725f525e      	clr	21086
 111                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 113  004c 725f525f      	clr	21087
 114                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 116  0050 725f5260      	clr	21088
 117                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 119  0054 725f5261      	clr	21089
 120                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 122  0058 35ff5262      	mov	21090,#255
 123                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 125  005c 35ff5263      	mov	21091,#255
 126                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 128  0060 725f5265      	clr	21093
 129                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 131  0064 725f5266      	clr	21094
 132                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 134  0068 725f5267      	clr	21095
 135                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 137  006c 725f5268      	clr	21096
 138                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 140  0070 725f5269      	clr	21097
 141                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 143  0074 725f526a      	clr	21098
 144                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 146  0078 725f526b      	clr	21099
 147                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 149  007c 725f526c      	clr	21100
 150                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 152  0080 725f526f      	clr	21103
 153                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 155  0084 35015257      	mov	21079,#1
 156                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 158  0088 725f526e      	clr	21102
 159                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 161  008c 725f526d      	clr	21101
 162                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 164  0090 725f5264      	clr	21092
 165                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 167  0094 725f5255      	clr	21077
 168                     ; 101 }
 171  0098 81            	ret	
 274                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 274                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 274                     ; 113                        uint16_t TIM1_Period,
 274                     ; 114                        uint8_t TIM1_RepetitionCounter)
 274                     ; 115 {
 275                     	switch	.text
 276  0099               _TIM1_TimeBaseInit:
 278       fffffffe      OFST: set -2
 281                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 283                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 285  0099 7b04          	ld	a,(OFST+6,sp)
 286  009b c75262        	ld	21090,a
 287                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 289  009e 7b05          	ld	a,(OFST+7,sp)
 290  00a0 c75263        	ld	21091,a
 291                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 293  00a3 9e            	ld	a,xh
 294  00a4 c75260        	ld	21088,a
 295                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 297  00a7 9f            	ld	a,xl
 298  00a8 c75261        	ld	21089,a
 299                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 299                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 301  00ab c65250        	ld	a,21072
 302  00ae a48f          	and	a,#143
 303  00b0 1a03          	or	a,(OFST+5,sp)
 304  00b2 c75250        	ld	21072,a
 305                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 307  00b5 7b06          	ld	a,(OFST+8,sp)
 308  00b7 c75264        	ld	21092,a
 309                     ; 133 }
 312  00ba 81            	ret	
 595                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 595                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 595                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 595                     ; 157                   uint16_t TIM1_Pulse,
 595                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 595                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 595                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 595                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 595                     ; 162 {
 596                     	switch	.text
 597  00bb               _TIM1_OC1Init:
 599  00bb 89            	pushw	x
 600  00bc 5203          	subw	sp,#3
 601       00000003      OFST:	set	3
 604                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 606                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 608                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 610                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 612                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 614                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 616                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 618                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 618                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 620  00be c6525c        	ld	a,21084
 621  00c1 a4f0          	and	a,#240
 622  00c3 c7525c        	ld	21084,a
 623                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 623                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 623                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 623                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 625  00c6 7b0c          	ld	a,(OFST+9,sp)
 626  00c8 a408          	and	a,#8
 627  00ca 6b03          	ld	(OFST+0,sp),a
 629  00cc 7b0b          	ld	a,(OFST+8,sp)
 630  00ce a402          	and	a,#2
 631  00d0 1a03          	or	a,(OFST+0,sp)
 632  00d2 6b02          	ld	(OFST-1,sp),a
 634  00d4 7b08          	ld	a,(OFST+5,sp)
 635  00d6 a404          	and	a,#4
 636  00d8 6b01          	ld	(OFST-2,sp),a
 638  00da 9f            	ld	a,xl
 639  00db a401          	and	a,#1
 640  00dd 1a01          	or	a,(OFST-2,sp)
 641  00df 1a02          	or	a,(OFST-1,sp)
 642  00e1 ca525c        	or	a,21084
 643  00e4 c7525c        	ld	21084,a
 644                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 644                     ; 185                           (uint8_t)TIM1_OCMode);
 646  00e7 c65258        	ld	a,21080
 647  00ea a48f          	and	a,#143
 648  00ec 1a04          	or	a,(OFST+1,sp)
 649  00ee c75258        	ld	21080,a
 650                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 652  00f1 c6526f        	ld	a,21103
 653  00f4 a4fc          	and	a,#252
 654  00f6 c7526f        	ld	21103,a
 655                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 655                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 657  00f9 7b0e          	ld	a,(OFST+11,sp)
 658  00fb a402          	and	a,#2
 659  00fd 6b03          	ld	(OFST+0,sp),a
 661  00ff 7b0d          	ld	a,(OFST+10,sp)
 662  0101 a401          	and	a,#1
 663  0103 1a03          	or	a,(OFST+0,sp)
 664  0105 ca526f        	or	a,21103
 665  0108 c7526f        	ld	21103,a
 666                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 668  010b 7b09          	ld	a,(OFST+6,sp)
 669  010d c75265        	ld	21093,a
 670                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 672  0110 7b0a          	ld	a,(OFST+7,sp)
 673  0112 c75266        	ld	21094,a
 674                     ; 196 }
 677  0115 5b05          	addw	sp,#5
 678  0117 81            	ret	
 780                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 780                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 780                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 780                     ; 220                   uint16_t TIM1_Pulse,
 780                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 780                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 780                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 780                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 780                     ; 225 {
 781                     	switch	.text
 782  0118               _TIM1_OC2Init:
 784  0118 89            	pushw	x
 785  0119 5203          	subw	sp,#3
 786       00000003      OFST:	set	3
 789                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 791                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 793                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 795                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 797                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 799                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 801                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 803                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 803                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 805  011b c6525c        	ld	a,21084
 806  011e a40f          	and	a,#15
 807  0120 c7525c        	ld	21084,a
 808                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 808                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 808                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 808                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 810  0123 7b0c          	ld	a,(OFST+9,sp)
 811  0125 a480          	and	a,#128
 812  0127 6b03          	ld	(OFST+0,sp),a
 814  0129 7b0b          	ld	a,(OFST+8,sp)
 815  012b a420          	and	a,#32
 816  012d 1a03          	or	a,(OFST+0,sp)
 817  012f 6b02          	ld	(OFST-1,sp),a
 819  0131 7b08          	ld	a,(OFST+5,sp)
 820  0133 a440          	and	a,#64
 821  0135 6b01          	ld	(OFST-2,sp),a
 823  0137 9f            	ld	a,xl
 824  0138 a410          	and	a,#16
 825  013a 1a01          	or	a,(OFST-2,sp)
 826  013c 1a02          	or	a,(OFST-1,sp)
 827  013e ca525c        	or	a,21084
 828  0141 c7525c        	ld	21084,a
 829                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 829                     ; 249                           (uint8_t)TIM1_OCMode);
 831  0144 c65259        	ld	a,21081
 832  0147 a48f          	and	a,#143
 833  0149 1a04          	or	a,(OFST+1,sp)
 834  014b c75259        	ld	21081,a
 835                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 837  014e c6526f        	ld	a,21103
 838  0151 a4f3          	and	a,#243
 839  0153 c7526f        	ld	21103,a
 840                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 840                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 842  0156 7b0e          	ld	a,(OFST+11,sp)
 843  0158 a408          	and	a,#8
 844  015a 6b03          	ld	(OFST+0,sp),a
 846  015c 7b0d          	ld	a,(OFST+10,sp)
 847  015e a404          	and	a,#4
 848  0160 1a03          	or	a,(OFST+0,sp)
 849  0162 ca526f        	or	a,21103
 850  0165 c7526f        	ld	21103,a
 851                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 853  0168 7b09          	ld	a,(OFST+6,sp)
 854  016a c75267        	ld	21095,a
 855                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 857  016d 7b0a          	ld	a,(OFST+7,sp)
 858  016f c75268        	ld	21096,a
 859                     ; 260 }
 862  0172 5b05          	addw	sp,#5
 863  0174 81            	ret	
 965                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 965                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 965                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 965                     ; 284                   uint16_t TIM1_Pulse,
 965                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 965                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 965                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 965                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 965                     ; 289 {
 966                     	switch	.text
 967  0175               _TIM1_OC3Init:
 969  0175 89            	pushw	x
 970  0176 5203          	subw	sp,#3
 971       00000003      OFST:	set	3
 974                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 976                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 978                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 980                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 982                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 984                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 986                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 988                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 988                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 990  0178 c6525d        	ld	a,21085
 991  017b a4f0          	and	a,#240
 992  017d c7525d        	ld	21085,a
 993                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 993                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 993                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 993                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 995  0180 7b0c          	ld	a,(OFST+9,sp)
 996  0182 a408          	and	a,#8
 997  0184 6b03          	ld	(OFST+0,sp),a
 999  0186 7b0b          	ld	a,(OFST+8,sp)
1000  0188 a402          	and	a,#2
1001  018a 1a03          	or	a,(OFST+0,sp)
1002  018c 6b02          	ld	(OFST-1,sp),a
1004  018e 7b08          	ld	a,(OFST+5,sp)
1005  0190 a404          	and	a,#4
1006  0192 6b01          	ld	(OFST-2,sp),a
1008  0194 9f            	ld	a,xl
1009  0195 a401          	and	a,#1
1010  0197 1a01          	or	a,(OFST-2,sp)
1011  0199 1a02          	or	a,(OFST-1,sp)
1012  019b ca525d        	or	a,21085
1013  019e c7525d        	ld	21085,a
1014                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1014                     ; 312                           (uint8_t)TIM1_OCMode);
1016  01a1 c6525a        	ld	a,21082
1017  01a4 a48f          	and	a,#143
1018  01a6 1a04          	or	a,(OFST+1,sp)
1019  01a8 c7525a        	ld	21082,a
1020                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1022  01ab c6526f        	ld	a,21103
1023  01ae a4cf          	and	a,#207
1024  01b0 c7526f        	ld	21103,a
1025                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1025                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1027  01b3 7b0e          	ld	a,(OFST+11,sp)
1028  01b5 a420          	and	a,#32
1029  01b7 6b03          	ld	(OFST+0,sp),a
1031  01b9 7b0d          	ld	a,(OFST+10,sp)
1032  01bb a410          	and	a,#16
1033  01bd 1a03          	or	a,(OFST+0,sp)
1034  01bf ca526f        	or	a,21103
1035  01c2 c7526f        	ld	21103,a
1036                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1038  01c5 7b09          	ld	a,(OFST+6,sp)
1039  01c7 c75269        	ld	21097,a
1040                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1042  01ca 7b0a          	ld	a,(OFST+7,sp)
1043  01cc c7526a        	ld	21098,a
1044                     ; 323 }
1047  01cf 5b05          	addw	sp,#5
1048  01d1 81            	ret	
1120                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1120                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1120                     ; 340                   uint16_t TIM1_Pulse,
1120                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1120                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1120                     ; 343 {
1121                     	switch	.text
1122  01d2               _TIM1_OC4Init:
1124  01d2 89            	pushw	x
1125  01d3 88            	push	a
1126       00000001      OFST:	set	1
1129                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1131                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1133                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1135                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1137                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1139  01d4 c6525d        	ld	a,21085
1140  01d7 a4cf          	and	a,#207
1141  01d9 c7525d        	ld	21085,a
1142                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1142                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1144  01dc 7b08          	ld	a,(OFST+7,sp)
1145  01de a420          	and	a,#32
1146  01e0 6b01          	ld	(OFST+0,sp),a
1148  01e2 9f            	ld	a,xl
1149  01e3 a410          	and	a,#16
1150  01e5 1a01          	or	a,(OFST+0,sp)
1151  01e7 ca525d        	or	a,21085
1152  01ea c7525d        	ld	21085,a
1153                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1153                     ; 358                           TIM1_OCMode);
1155  01ed c6525b        	ld	a,21083
1156  01f0 a48f          	and	a,#143
1157  01f2 1a02          	or	a,(OFST+1,sp)
1158  01f4 c7525b        	ld	21083,a
1159                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1161  01f7 7b09          	ld	a,(OFST+8,sp)
1162  01f9 270a          	jreq	L714
1163                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1165  01fb c6526f        	ld	a,21103
1166  01fe aadf          	or	a,#223
1167  0200 c7526f        	ld	21103,a
1169  0203 2004          	jra	L124
1170  0205               L714:
1171                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1173  0205 721d526f      	bres	21103,#6
1174  0209               L124:
1175                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1177  0209 7b06          	ld	a,(OFST+5,sp)
1178  020b c7526b        	ld	21099,a
1179                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1181  020e 7b07          	ld	a,(OFST+6,sp)
1182  0210 c7526c        	ld	21100,a
1183                     ; 373 }
1186  0213 5b03          	addw	sp,#3
1187  0215 81            	ret	
1390                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1390                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1390                     ; 390                      uint8_t TIM1_DeadTime,
1390                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1390                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1390                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1390                     ; 394 {
1391                     	switch	.text
1392  0216               _TIM1_BDTRConfig:
1394  0216 89            	pushw	x
1395  0217 88            	push	a
1396       00000001      OFST:	set	1
1399                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1401                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1403                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1405                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1407                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1409                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1411  0218 7b06          	ld	a,(OFST+5,sp)
1412  021a c7526e        	ld	21102,a
1413                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1413                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1413                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1415  021d 7b07          	ld	a,(OFST+6,sp)
1416  021f 1a08          	or	a,(OFST+7,sp)
1417  0221 1a09          	or	a,(OFST+8,sp)
1418  0223 6b01          	ld	(OFST+0,sp),a
1420  0225 9f            	ld	a,xl
1421  0226 1a02          	or	a,(OFST+1,sp)
1422  0228 1a01          	or	a,(OFST+0,sp)
1423  022a c7526d        	ld	21101,a
1424                     ; 409 }
1427  022d 5b03          	addw	sp,#3
1428  022f 81            	ret	
1628                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1628                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1628                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1628                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1628                     ; 427                  uint8_t TIM1_ICFilter)
1628                     ; 428 {
1629                     	switch	.text
1630  0230               _TIM1_ICInit:
1632  0230 89            	pushw	x
1633       00000000      OFST:	set	0
1636                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1638                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1640                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1642                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1644                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1646                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1648  0231 9e            	ld	a,xh
1649  0232 4d            	tnz	a
1650  0233 2614          	jrne	L546
1651                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1651                     ; 440                (uint8_t)TIM1_ICSelection,
1651                     ; 441                (uint8_t)TIM1_ICFilter);
1653  0235 7b07          	ld	a,(OFST+7,sp)
1654  0237 88            	push	a
1655  0238 7b06          	ld	a,(OFST+6,sp)
1656  023a 97            	ld	xl,a
1657  023b 7b03          	ld	a,(OFST+3,sp)
1658  023d 95            	ld	xh,a
1659  023e cd07a3        	call	L3_TI1_Config
1661  0241 84            	pop	a
1662                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1664  0242 7b06          	ld	a,(OFST+6,sp)
1665  0244 cd0680        	call	_TIM1_SetIC1Prescaler
1668  0247 2044          	jra	L746
1669  0249               L546:
1670                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1672  0249 7b01          	ld	a,(OFST+1,sp)
1673  024b a101          	cp	a,#1
1674  024d 2614          	jrne	L156
1675                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1675                     ; 449                (uint8_t)TIM1_ICSelection,
1675                     ; 450                (uint8_t)TIM1_ICFilter);
1677  024f 7b07          	ld	a,(OFST+7,sp)
1678  0251 88            	push	a
1679  0252 7b06          	ld	a,(OFST+6,sp)
1680  0254 97            	ld	xl,a
1681  0255 7b03          	ld	a,(OFST+3,sp)
1682  0257 95            	ld	xh,a
1683  0258 cd07d3        	call	L5_TI2_Config
1685  025b 84            	pop	a
1686                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1688  025c 7b06          	ld	a,(OFST+6,sp)
1689  025e cd068d        	call	_TIM1_SetIC2Prescaler
1692  0261 202a          	jra	L746
1693  0263               L156:
1694                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1696  0263 a102          	cp	a,#2
1697  0265 2614          	jrne	L556
1698                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1698                     ; 458                (uint8_t)TIM1_ICSelection,
1698                     ; 459                (uint8_t)TIM1_ICFilter);
1700  0267 7b07          	ld	a,(OFST+7,sp)
1701  0269 88            	push	a
1702  026a 7b06          	ld	a,(OFST+6,sp)
1703  026c 97            	ld	xl,a
1704  026d 7b03          	ld	a,(OFST+3,sp)
1705  026f 95            	ld	xh,a
1706  0270 cd0803        	call	L7_TI3_Config
1708  0273 84            	pop	a
1709                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1711  0274 7b06          	ld	a,(OFST+6,sp)
1712  0276 cd069a        	call	_TIM1_SetIC3Prescaler
1715  0279 2012          	jra	L746
1716  027b               L556:
1717                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1717                     ; 467                (uint8_t)TIM1_ICSelection,
1717                     ; 468                (uint8_t)TIM1_ICFilter);
1719  027b 7b07          	ld	a,(OFST+7,sp)
1720  027d 88            	push	a
1721  027e 7b06          	ld	a,(OFST+6,sp)
1722  0280 97            	ld	xl,a
1723  0281 7b03          	ld	a,(OFST+3,sp)
1724  0283 95            	ld	xh,a
1725  0284 cd0833        	call	L11_TI4_Config
1727  0287 84            	pop	a
1728                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1730  0288 7b06          	ld	a,(OFST+6,sp)
1731  028a cd06a7        	call	_TIM1_SetIC4Prescaler
1733  028d               L746:
1734                     ; 472 }
1737  028d 85            	popw	x
1738  028e 81            	ret	
1828                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1828                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1828                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1828                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1828                     ; 492                      uint8_t TIM1_ICFilter)
1828                     ; 493 {
1829                     	switch	.text
1830  028f               _TIM1_PWMIConfig:
1832  028f 89            	pushw	x
1833  0290 89            	pushw	x
1834       00000002      OFST:	set	2
1837                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1839                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1841                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1843                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1845                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1847                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1849                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1851  0291 9f            	ld	a,xl
1852  0292 4a            	dec	a
1853  0293 2702          	jreq	L127
1854                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1856  0295 a601          	ld	a,#1
1858  0297               L127:
1859                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1861  0297 6b01          	ld	(OFST-1,sp),a
1863                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1865  0299 7b07          	ld	a,(OFST+5,sp)
1866  029b 4a            	dec	a
1867  029c 2604          	jrne	L527
1868                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1870  029e a602          	ld	a,#2
1872  02a0 2002          	jra	L727
1873  02a2               L527:
1874                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1876  02a2 a601          	ld	a,#1
1877  02a4               L727:
1878  02a4 6b02          	ld	(OFST+0,sp),a
1880                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1882  02a6 7b03          	ld	a,(OFST+1,sp)
1883  02a8 2626          	jrne	L137
1884                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1884                     ; 527                (uint8_t)TIM1_ICFilter);
1886  02aa 7b09          	ld	a,(OFST+7,sp)
1887  02ac 88            	push	a
1888  02ad 7b08          	ld	a,(OFST+6,sp)
1889  02af 97            	ld	xl,a
1890  02b0 7b05          	ld	a,(OFST+3,sp)
1891  02b2 95            	ld	xh,a
1892  02b3 cd07a3        	call	L3_TI1_Config
1894  02b6 84            	pop	a
1895                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1897  02b7 7b08          	ld	a,(OFST+6,sp)
1898  02b9 cd0680        	call	_TIM1_SetIC1Prescaler
1900                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1902  02bc 7b09          	ld	a,(OFST+7,sp)
1903  02be 88            	push	a
1904  02bf 7b03          	ld	a,(OFST+1,sp)
1905  02c1 97            	ld	xl,a
1906  02c2 7b02          	ld	a,(OFST+0,sp)
1907  02c4 95            	ld	xh,a
1908  02c5 cd07d3        	call	L5_TI2_Config
1910  02c8 84            	pop	a
1911                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1913  02c9 7b08          	ld	a,(OFST+6,sp)
1914  02cb cd068d        	call	_TIM1_SetIC2Prescaler
1917  02ce 2024          	jra	L337
1918  02d0               L137:
1919                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1919                     ; 542                (uint8_t)TIM1_ICFilter);
1921  02d0 7b09          	ld	a,(OFST+7,sp)
1922  02d2 88            	push	a
1923  02d3 7b08          	ld	a,(OFST+6,sp)
1924  02d5 97            	ld	xl,a
1925  02d6 7b05          	ld	a,(OFST+3,sp)
1926  02d8 95            	ld	xh,a
1927  02d9 cd07d3        	call	L5_TI2_Config
1929  02dc 84            	pop	a
1930                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1932  02dd 7b08          	ld	a,(OFST+6,sp)
1933  02df cd068d        	call	_TIM1_SetIC2Prescaler
1935                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1937  02e2 7b09          	ld	a,(OFST+7,sp)
1938  02e4 88            	push	a
1939  02e5 7b03          	ld	a,(OFST+1,sp)
1940  02e7 97            	ld	xl,a
1941  02e8 7b02          	ld	a,(OFST+0,sp)
1942  02ea 95            	ld	xh,a
1943  02eb cd07a3        	call	L3_TI1_Config
1945  02ee 84            	pop	a
1946                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1948  02ef 7b08          	ld	a,(OFST+6,sp)
1949  02f1 cd0680        	call	_TIM1_SetIC1Prescaler
1951  02f4               L337:
1952                     ; 553 }
1955  02f4 5b04          	addw	sp,#4
1956  02f6 81            	ret	
2011                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2011                     ; 562 {
2012                     	switch	.text
2013  02f7               _TIM1_Cmd:
2017                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2019                     ; 567   if (NewState != DISABLE)
2021  02f7 4d            	tnz	a
2022  02f8 2705          	jreq	L367
2023                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2025  02fa 72105250      	bset	21072,#0
2028  02fe 81            	ret	
2029  02ff               L367:
2030                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2032  02ff 72115250      	bres	21072,#0
2033                     ; 575 }
2036  0303 81            	ret	
2072                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2072                     ; 584 {
2073                     	switch	.text
2074  0304               _TIM1_CtrlPWMOutputs:
2078                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2080                     ; 590   if (NewState != DISABLE)
2082  0304 4d            	tnz	a
2083  0305 2705          	jreq	L5001
2084                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2086  0307 721e526d      	bset	21101,#7
2089  030b 81            	ret	
2090  030c               L5001:
2091                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2093  030c 721f526d      	bres	21101,#7
2094                     ; 598 }
2097  0310 81            	ret	
2204                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2204                     ; 618 {
2205                     	switch	.text
2206  0311               _TIM1_ITConfig:
2208  0311 89            	pushw	x
2209       00000000      OFST:	set	0
2212                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2214                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2216                     ; 623   if (NewState != DISABLE)
2218  0312 9f            	ld	a,xl
2219  0313 4d            	tnz	a
2220  0314 2706          	jreq	L7501
2221                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2223  0316 9e            	ld	a,xh
2224  0317 ca5254        	or	a,21076
2226  031a 2006          	jra	L1601
2227  031c               L7501:
2228                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2230  031c 7b01          	ld	a,(OFST+1,sp)
2231  031e 43            	cpl	a
2232  031f c45254        	and	a,21076
2233  0322               L1601:
2234  0322 c75254        	ld	21076,a
2235                     ; 633 }
2238  0325 85            	popw	x
2239  0326 81            	ret	
2263                     ; 640 void TIM1_InternalClockConfig(void)
2263                     ; 641 {
2264                     	switch	.text
2265  0327               _TIM1_InternalClockConfig:
2269                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2271  0327 c65252        	ld	a,21074
2272  032a a4f8          	and	a,#248
2273  032c c75252        	ld	21074,a
2274                     ; 644 }
2277  032f 81            	ret	
2392                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2392                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2392                     ; 664                               uint8_t ExtTRGFilter)
2392                     ; 665 {
2393                     	switch	.text
2394  0330               _TIM1_ETRClockMode1Config:
2396  0330 89            	pushw	x
2397       00000000      OFST:	set	0
2400                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2402                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2404                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2406  0331 7b05          	ld	a,(OFST+5,sp)
2407  0333 88            	push	a
2408  0334 7b02          	ld	a,(OFST+2,sp)
2409  0336 95            	ld	xh,a
2410  0337 ad1b          	call	_TIM1_ETRConfig
2412  0339 84            	pop	a
2413                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2413                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2415  033a c65252        	ld	a,21074
2416  033d aa77          	or	a,#119
2417  033f c75252        	ld	21074,a
2418                     ; 676 }
2421  0342 85            	popw	x
2422  0343 81            	ret	
2478                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2478                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2478                     ; 696                               uint8_t ExtTRGFilter)
2478                     ; 697 {
2479                     	switch	.text
2480  0344               _TIM1_ETRClockMode2Config:
2482  0344 89            	pushw	x
2483       00000000      OFST:	set	0
2486                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2488                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2490                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2492  0345 7b05          	ld	a,(OFST+5,sp)
2493  0347 88            	push	a
2494  0348 7b02          	ld	a,(OFST+2,sp)
2495  034a 95            	ld	xh,a
2496  034b ad07          	call	_TIM1_ETRConfig
2498  034d 721c5253      	bset	21075,#6
2499                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2501                     ; 707 }
2504  0351 5b03          	addw	sp,#3
2505  0353 81            	ret	
2559                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2559                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2559                     ; 727                     uint8_t ExtTRGFilter)
2559                     ; 728 {
2560                     	switch	.text
2561  0354               _TIM1_ETRConfig:
2563  0354 89            	pushw	x
2564       00000000      OFST:	set	0
2567                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2569                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2569                     ; 733                          (uint8_t)ExtTRGFilter );
2571  0355 9f            	ld	a,xl
2572  0356 1a01          	or	a,(OFST+1,sp)
2573  0358 1a05          	or	a,(OFST+5,sp)
2574  035a ca5253        	or	a,21075
2575  035d c75253        	ld	21075,a
2576                     ; 734 }
2579  0360 85            	popw	x
2580  0361 81            	ret	
2667                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2667                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2667                     ; 753                                  uint8_t ICFilter)
2667                     ; 754 {
2668                     	switch	.text
2669  0362               _TIM1_TIxExternalClockConfig:
2671  0362 89            	pushw	x
2672       00000000      OFST:	set	0
2675                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2677                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2679                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2681                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2683  0363 9e            	ld	a,xh
2684  0364 a160          	cp	a,#96
2685  0366 260d          	jrne	L1521
2686                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2688  0368 7b05          	ld	a,(OFST+5,sp)
2689  036a 88            	push	a
2690  036b 9f            	ld	a,xl
2691  036c ae0001        	ldw	x,#1
2692  036f 95            	ld	xh,a
2693  0370 cd07d3        	call	L5_TI2_Config
2696  0373 200c          	jra	L3521
2697  0375               L1521:
2698                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2700  0375 7b05          	ld	a,(OFST+5,sp)
2701  0377 88            	push	a
2702  0378 7b03          	ld	a,(OFST+3,sp)
2703  037a ae0001        	ldw	x,#1
2704  037d 95            	ld	xh,a
2705  037e cd07a3        	call	L3_TI1_Config
2707  0381               L3521:
2708  0381 84            	pop	a
2709                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2711  0382 7b01          	ld	a,(OFST+1,sp)
2712  0384 ad0a          	call	_TIM1_SelectInputTrigger
2714                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2716  0386 c65252        	ld	a,21074
2717  0389 aa07          	or	a,#7
2718  038b c75252        	ld	21074,a
2719                     ; 775 }
2722  038e 85            	popw	x
2723  038f 81            	ret	
2808                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2808                     ; 788 {
2809                     	switch	.text
2810  0390               _TIM1_SelectInputTrigger:
2812  0390 88            	push	a
2813       00000000      OFST:	set	0
2816                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2818                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2820  0391 c65252        	ld	a,21074
2821  0394 a48f          	and	a,#143
2822  0396 1a01          	or	a,(OFST+1,sp)
2823  0398 c75252        	ld	21074,a
2824                     ; 794 }
2827  039b 84            	pop	a
2828  039c 81            	ret	
2864                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2864                     ; 804 {
2865                     	switch	.text
2866  039d               _TIM1_UpdateDisableConfig:
2870                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2872                     ; 809   if (NewState != DISABLE)
2874  039d 4d            	tnz	a
2875  039e 2705          	jreq	L1331
2876                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2878  03a0 72125250      	bset	21072,#1
2881  03a4 81            	ret	
2882  03a5               L1331:
2883                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2885  03a5 72135250      	bres	21072,#1
2886                     ; 817 }
2889  03a9 81            	ret	
2947                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2947                     ; 828 {
2948                     	switch	.text
2949  03aa               _TIM1_UpdateRequestConfig:
2953                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2955                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2957  03aa 4d            	tnz	a
2958  03ab 2705          	jreq	L3631
2959                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2961  03ad 72145250      	bset	21072,#2
2964  03b1 81            	ret	
2965  03b2               L3631:
2966                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2968  03b2 72155250      	bres	21072,#2
2969                     ; 841 }
2972  03b6 81            	ret	
3008                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3008                     ; 850 {
3009                     	switch	.text
3010  03b7               _TIM1_SelectHallSensor:
3014                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3016                     ; 855   if (NewState != DISABLE)
3018  03b7 4d            	tnz	a
3019  03b8 2705          	jreq	L5041
3020                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3022  03ba 721e5251      	bset	21073,#7
3025  03be 81            	ret	
3026  03bf               L5041:
3027                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3029  03bf 721f5251      	bres	21073,#7
3030                     ; 863 }
3033  03c3 81            	ret	
3090                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3090                     ; 874 {
3091                     	switch	.text
3092  03c4               _TIM1_SelectOnePulseMode:
3096                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3098                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3100  03c4 4d            	tnz	a
3101  03c5 2705          	jreq	L7341
3102                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3104  03c7 72165250      	bset	21072,#3
3107  03cb 81            	ret	
3108  03cc               L7341:
3109                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3111  03cc 72175250      	bres	21072,#3
3112                     ; 888 }
3115  03d0 81            	ret	
3213                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3213                     ; 904 {
3214                     	switch	.text
3215  03d1               _TIM1_SelectOutputTrigger:
3217  03d1 88            	push	a
3218       00000000      OFST:	set	0
3221                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3223                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3223                     ; 910                         (uint8_t) TIM1_TRGOSource);
3225  03d2 c65251        	ld	a,21073
3226  03d5 a48f          	and	a,#143
3227  03d7 1a01          	or	a,(OFST+1,sp)
3228  03d9 c75251        	ld	21073,a
3229                     ; 911 }
3232  03dc 84            	pop	a
3233  03dd 81            	ret	
3307                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3307                     ; 924 {
3308                     	switch	.text
3309  03de               _TIM1_SelectSlaveMode:
3311  03de 88            	push	a
3312       00000000      OFST:	set	0
3315                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3317                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3317                     ; 930                          (uint8_t)TIM1_SlaveMode);
3319  03df c65252        	ld	a,21074
3320  03e2 a4f8          	and	a,#248
3321  03e4 1a01          	or	a,(OFST+1,sp)
3322  03e6 c75252        	ld	21074,a
3323                     ; 931 }
3326  03e9 84            	pop	a
3327  03ea 81            	ret	
3363                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3363                     ; 940 {
3364                     	switch	.text
3365  03eb               _TIM1_SelectMasterSlaveMode:
3369                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3371                     ; 945   if (NewState != DISABLE)
3373  03eb 4d            	tnz	a
3374  03ec 2705          	jreq	L3551
3375                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3377  03ee 721e5252      	bset	21074,#7
3380  03f2 81            	ret	
3381  03f3               L3551:
3382                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3384  03f3 721f5252      	bres	21074,#7
3385                     ; 953 }
3388  03f7 81            	ret	
3474                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3474                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3474                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3474                     ; 978 {
3475                     	switch	.text
3476  03f8               _TIM1_EncoderInterfaceConfig:
3478  03f8 89            	pushw	x
3479       00000000      OFST:	set	0
3482                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3484                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3486                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3488                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3490  03f9 9f            	ld	a,xl
3491  03fa 4d            	tnz	a
3492  03fb 2706          	jreq	L7161
3493                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3495  03fd 7212525c      	bset	21084,#1
3497  0401 2004          	jra	L1261
3498  0403               L7161:
3499                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3501  0403 7213525c      	bres	21084,#1
3502  0407               L1261:
3503                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3505  0407 7b05          	ld	a,(OFST+5,sp)
3506  0409 2706          	jreq	L3261
3507                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3509  040b 721a525c      	bset	21084,#5
3511  040f 2004          	jra	L5261
3512  0411               L3261:
3513                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3515  0411 721b525c      	bres	21084,#5
3516  0415               L5261:
3517                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3517                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3519  0415 c65252        	ld	a,21074
3520  0418 a4f0          	and	a,#240
3521  041a 1a01          	or	a,(OFST+1,sp)
3522  041c c75252        	ld	21074,a
3523                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3523                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3525  041f c65258        	ld	a,21080
3526  0422 a4fc          	and	a,#252
3527  0424 aa01          	or	a,#1
3528  0426 c75258        	ld	21080,a
3529                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3529                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3531  0429 c65259        	ld	a,21081
3532  042c a4fc          	and	a,#252
3533  042e aa01          	or	a,#1
3534  0430 c75259        	ld	21081,a
3535                     ; 1011 }
3538  0433 85            	popw	x
3539  0434 81            	ret	
3604                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3604                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3604                     ; 1025 {
3605                     	switch	.text
3606  0435               _TIM1_PrescalerConfig:
3608       fffffffe      OFST: set -2
3611                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3613                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3615  0435 9e            	ld	a,xh
3616  0436 c75260        	ld	21088,a
3617                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3619  0439 9f            	ld	a,xl
3620  043a c75261        	ld	21089,a
3621                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3623  043d 7b03          	ld	a,(OFST+5,sp)
3624  043f c75257        	ld	21079,a
3625                     ; 1035 }
3628  0442 81            	ret	
3664                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3664                     ; 1049 {
3665                     	switch	.text
3666  0443               _TIM1_CounterModeConfig:
3668  0443 88            	push	a
3669       00000000      OFST:	set	0
3672                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3674                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3674                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3676  0444 c65250        	ld	a,21072
3677  0447 a48f          	and	a,#143
3678  0449 1a01          	or	a,(OFST+1,sp)
3679  044b c75250        	ld	21072,a
3680                     ; 1057 }
3683  044e 84            	pop	a
3684  044f 81            	ret	
3742                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3742                     ; 1068 {
3743                     	switch	.text
3744  0450               _TIM1_ForcedOC1Config:
3746  0450 88            	push	a
3747       00000000      OFST:	set	0
3750                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3752                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3752                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3754  0451 c65258        	ld	a,21080
3755  0454 a48f          	and	a,#143
3756  0456 1a01          	or	a,(OFST+1,sp)
3757  0458 c75258        	ld	21080,a
3758                     ; 1075 }
3761  045b 84            	pop	a
3762  045c 81            	ret	
3798                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3798                     ; 1086 {
3799                     	switch	.text
3800  045d               _TIM1_ForcedOC2Config:
3802  045d 88            	push	a
3803       00000000      OFST:	set	0
3806                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3808                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3808                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3810  045e c65259        	ld	a,21081
3811  0461 a48f          	and	a,#143
3812  0463 1a01          	or	a,(OFST+1,sp)
3813  0465 c75259        	ld	21081,a
3814                     ; 1093 }
3817  0468 84            	pop	a
3818  0469 81            	ret	
3854                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3854                     ; 1105 {
3855                     	switch	.text
3856  046a               _TIM1_ForcedOC3Config:
3858  046a 88            	push	a
3859       00000000      OFST:	set	0
3862                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3864                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3864                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3866  046b c6525a        	ld	a,21082
3867  046e a48f          	and	a,#143
3868  0470 1a01          	or	a,(OFST+1,sp)
3869  0472 c7525a        	ld	21082,a
3870                     ; 1112 }
3873  0475 84            	pop	a
3874  0476 81            	ret	
3910                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3910                     ; 1124 {
3911                     	switch	.text
3912  0477               _TIM1_ForcedOC4Config:
3914  0477 88            	push	a
3915       00000000      OFST:	set	0
3918                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3920                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3920                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3922  0478 c6525b        	ld	a,21083
3923  047b a48f          	and	a,#143
3924  047d 1a01          	or	a,(OFST+1,sp)
3925  047f c7525b        	ld	21083,a
3926                     ; 1131 }
3929  0482 84            	pop	a
3930  0483 81            	ret	
3966                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3966                     ; 1140 {
3967                     	switch	.text
3968  0484               _TIM1_ARRPreloadConfig:
3972                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3974                     ; 1145   if (NewState != DISABLE)
3976  0484 4d            	tnz	a
3977  0485 2705          	jreq	L3102
3978                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
3980  0487 721e5250      	bset	21072,#7
3983  048b 81            	ret	
3984  048c               L3102:
3985                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
3987  048c 721f5250      	bres	21072,#7
3988                     ; 1153 }
3991  0490 81            	ret	
4026                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4026                     ; 1162 {
4027                     	switch	.text
4028  0491               _TIM1_SelectCOM:
4032                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4034                     ; 1167   if (NewState != DISABLE)
4036  0491 4d            	tnz	a
4037  0492 2705          	jreq	L5302
4038                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4040  0494 72145251      	bset	21073,#2
4043  0498 81            	ret	
4044  0499               L5302:
4045                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4047  0499 72155251      	bres	21073,#2
4048                     ; 1175 }
4051  049d 81            	ret	
4087                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4087                     ; 1184 {
4088                     	switch	.text
4089  049e               _TIM1_CCPreloadControl:
4093                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4095                     ; 1189   if (NewState != DISABLE)
4097  049e 4d            	tnz	a
4098  049f 2705          	jreq	L7502
4099                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4101  04a1 72105251      	bset	21073,#0
4104  04a5 81            	ret	
4105  04a6               L7502:
4106                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4108  04a6 72115251      	bres	21073,#0
4109                     ; 1197 }
4112  04aa 81            	ret	
4148                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4148                     ; 1206 {
4149                     	switch	.text
4150  04ab               _TIM1_OC1PreloadConfig:
4154                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4156                     ; 1211   if (NewState != DISABLE)
4158  04ab 4d            	tnz	a
4159  04ac 2705          	jreq	L1012
4160                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4162  04ae 72165258      	bset	21080,#3
4165  04b2 81            	ret	
4166  04b3               L1012:
4167                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4169  04b3 72175258      	bres	21080,#3
4170                     ; 1219 }
4173  04b7 81            	ret	
4209                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4209                     ; 1228 {
4210                     	switch	.text
4211  04b8               _TIM1_OC2PreloadConfig:
4215                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4217                     ; 1233   if (NewState != DISABLE)
4219  04b8 4d            	tnz	a
4220  04b9 2705          	jreq	L3212
4221                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4223  04bb 72165259      	bset	21081,#3
4226  04bf 81            	ret	
4227  04c0               L3212:
4228                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4230  04c0 72175259      	bres	21081,#3
4231                     ; 1241 }
4234  04c4 81            	ret	
4270                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4270                     ; 1250 {
4271                     	switch	.text
4272  04c5               _TIM1_OC3PreloadConfig:
4276                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4278                     ; 1255   if (NewState != DISABLE)
4280  04c5 4d            	tnz	a
4281  04c6 2705          	jreq	L5412
4282                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4284  04c8 7216525a      	bset	21082,#3
4287  04cc 81            	ret	
4288  04cd               L5412:
4289                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4291  04cd 7217525a      	bres	21082,#3
4292                     ; 1263 }
4295  04d1 81            	ret	
4331                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4331                     ; 1272 {
4332                     	switch	.text
4333  04d2               _TIM1_OC4PreloadConfig:
4337                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4339                     ; 1277   if (NewState != DISABLE)
4341  04d2 4d            	tnz	a
4342  04d3 2705          	jreq	L7612
4343                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4345  04d5 7216525b      	bset	21083,#3
4348  04d9 81            	ret	
4349  04da               L7612:
4350                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4352  04da 7217525b      	bres	21083,#3
4353                     ; 1285 }
4356  04de 81            	ret	
4391                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4391                     ; 1294 {
4392                     	switch	.text
4393  04df               _TIM1_OC1FastConfig:
4397                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4399                     ; 1299   if (NewState != DISABLE)
4401  04df 4d            	tnz	a
4402  04e0 2705          	jreq	L1122
4403                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4405  04e2 72145258      	bset	21080,#2
4408  04e6 81            	ret	
4409  04e7               L1122:
4410                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4412  04e7 72155258      	bres	21080,#2
4413                     ; 1307 }
4416  04eb 81            	ret	
4451                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4451                     ; 1316 {
4452                     	switch	.text
4453  04ec               _TIM1_OC2FastConfig:
4457                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4459                     ; 1321   if (NewState != DISABLE)
4461  04ec 4d            	tnz	a
4462  04ed 2705          	jreq	L3322
4463                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4465  04ef 72145259      	bset	21081,#2
4468  04f3 81            	ret	
4469  04f4               L3322:
4470                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4472  04f4 72155259      	bres	21081,#2
4473                     ; 1329 }
4476  04f8 81            	ret	
4511                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4511                     ; 1338 {
4512                     	switch	.text
4513  04f9               _TIM1_OC3FastConfig:
4517                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4519                     ; 1343   if (NewState != DISABLE)
4521  04f9 4d            	tnz	a
4522  04fa 2705          	jreq	L5522
4523                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4525  04fc 7214525a      	bset	21082,#2
4528  0500 81            	ret	
4529  0501               L5522:
4530                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4532  0501 7215525a      	bres	21082,#2
4533                     ; 1351 }
4536  0505 81            	ret	
4571                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4571                     ; 1360 {
4572                     	switch	.text
4573  0506               _TIM1_OC4FastConfig:
4577                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4579                     ; 1365   if (NewState != DISABLE)
4581  0506 4d            	tnz	a
4582  0507 2705          	jreq	L7722
4583                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4585  0509 7214525b      	bset	21083,#2
4588  050d 81            	ret	
4589  050e               L7722:
4590                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4592  050e 7215525b      	bres	21083,#2
4593                     ; 1373 }
4596  0512 81            	ret	
4701                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4701                     ; 1390 {
4702                     	switch	.text
4703  0513               _TIM1_GenerateEvent:
4707                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4709                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4711  0513 c75257        	ld	21079,a
4712                     ; 1396 }
4715  0516 81            	ret	
4751                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4751                     ; 1407 {
4752                     	switch	.text
4753  0517               _TIM1_OC1PolarityConfig:
4757                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4759                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4761  0517 4d            	tnz	a
4762  0518 2705          	jreq	L3632
4763                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4765  051a 7212525c      	bset	21084,#1
4768  051e 81            	ret	
4769  051f               L3632:
4770                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4772  051f 7213525c      	bres	21084,#1
4773                     ; 1420 }
4776  0523 81            	ret	
4812                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4812                     ; 1431 {
4813                     	switch	.text
4814  0524               _TIM1_OC1NPolarityConfig:
4818                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4820                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4822  0524 4d            	tnz	a
4823  0525 2705          	jreq	L5042
4824                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4826  0527 7216525c      	bset	21084,#3
4829  052b 81            	ret	
4830  052c               L5042:
4831                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4833  052c 7217525c      	bres	21084,#3
4834                     ; 1444 }
4837  0530 81            	ret	
4873                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4873                     ; 1455 {
4874                     	switch	.text
4875  0531               _TIM1_OC2PolarityConfig:
4879                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4881                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4883  0531 4d            	tnz	a
4884  0532 2705          	jreq	L7242
4885                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4887  0534 721a525c      	bset	21084,#5
4890  0538 81            	ret	
4891  0539               L7242:
4892                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4894  0539 721b525c      	bres	21084,#5
4895                     ; 1468 }
4898  053d 81            	ret	
4934                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4934                     ; 1479 {
4935                     	switch	.text
4936  053e               _TIM1_OC2NPolarityConfig:
4940                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4942                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4944  053e 4d            	tnz	a
4945  053f 2705          	jreq	L1542
4946                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4948  0541 721e525c      	bset	21084,#7
4951  0545 81            	ret	
4952  0546               L1542:
4953                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4955  0546 721f525c      	bres	21084,#7
4956                     ; 1492 }
4959  054a 81            	ret	
4995                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4995                     ; 1503 {
4996                     	switch	.text
4997  054b               _TIM1_OC3PolarityConfig:
5001                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5003                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5005  054b 4d            	tnz	a
5006  054c 2705          	jreq	L3742
5007                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5009  054e 7212525d      	bset	21085,#1
5012  0552 81            	ret	
5013  0553               L3742:
5014                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5016  0553 7213525d      	bres	21085,#1
5017                     ; 1516 }
5020  0557 81            	ret	
5056                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5056                     ; 1528 {
5057                     	switch	.text
5058  0558               _TIM1_OC3NPolarityConfig:
5062                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5064                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5066  0558 4d            	tnz	a
5067  0559 2705          	jreq	L5152
5068                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5070  055b 7216525d      	bset	21085,#3
5073  055f 81            	ret	
5074  0560               L5152:
5075                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5077  0560 7217525d      	bres	21085,#3
5078                     ; 1541 }
5081  0564 81            	ret	
5117                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5117                     ; 1552 {
5118                     	switch	.text
5119  0565               _TIM1_OC4PolarityConfig:
5123                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5125                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5127  0565 4d            	tnz	a
5128  0566 2705          	jreq	L7352
5129                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5131  0568 721a525d      	bset	21085,#5
5134  056c 81            	ret	
5135  056d               L7352:
5136                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5138  056d 721b525d      	bres	21085,#5
5139                     ; 1565 }
5142  0571 81            	ret	
5187                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5187                     ; 1580 {
5188                     	switch	.text
5189  0572               _TIM1_CCxCmd:
5191  0572 89            	pushw	x
5192       00000000      OFST:	set	0
5195                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5197                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5199                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5201  0573 9e            	ld	a,xh
5202  0574 4d            	tnz	a
5203  0575 2610          	jrne	L5652
5204                     ; 1588     if (NewState != DISABLE)
5206  0577 9f            	ld	a,xl
5207  0578 4d            	tnz	a
5208  0579 2706          	jreq	L7652
5209                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5211  057b 7210525c      	bset	21084,#0
5213  057f 203e          	jra	L3752
5214  0581               L7652:
5215                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5217  0581 7211525c      	bres	21084,#0
5218  0585 2038          	jra	L3752
5219  0587               L5652:
5220                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5222  0587 7b01          	ld	a,(OFST+1,sp)
5223  0589 a101          	cp	a,#1
5224  058b 2610          	jrne	L5752
5225                     ; 1601     if (NewState != DISABLE)
5227  058d 7b02          	ld	a,(OFST+2,sp)
5228  058f 2706          	jreq	L7752
5229                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5231  0591 7218525c      	bset	21084,#4
5233  0595 2028          	jra	L3752
5234  0597               L7752:
5235                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5237  0597 7219525c      	bres	21084,#4
5238  059b 2022          	jra	L3752
5239  059d               L5752:
5240                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5242  059d a102          	cp	a,#2
5243  059f 2610          	jrne	L5062
5244                     ; 1613     if (NewState != DISABLE)
5246  05a1 7b02          	ld	a,(OFST+2,sp)
5247  05a3 2706          	jreq	L7062
5248                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5250  05a5 7210525d      	bset	21085,#0
5252  05a9 2014          	jra	L3752
5253  05ab               L7062:
5254                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5256  05ab 7211525d      	bres	21085,#0
5257  05af 200e          	jra	L3752
5258  05b1               L5062:
5259                     ; 1625     if (NewState != DISABLE)
5261  05b1 7b02          	ld	a,(OFST+2,sp)
5262  05b3 2706          	jreq	L5162
5263                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5265  05b5 7218525d      	bset	21085,#4
5267  05b9 2004          	jra	L3752
5268  05bb               L5162:
5269                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5271  05bb 7219525d      	bres	21085,#4
5272  05bf               L3752:
5273                     ; 1634 }
5276  05bf 85            	popw	x
5277  05c0 81            	ret	
5322                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5322                     ; 1648 {
5323                     	switch	.text
5324  05c1               _TIM1_CCxNCmd:
5326  05c1 89            	pushw	x
5327       00000000      OFST:	set	0
5330                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5332                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5334                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5336  05c2 9e            	ld	a,xh
5337  05c3 4d            	tnz	a
5338  05c4 2610          	jrne	L3462
5339                     ; 1656     if (NewState != DISABLE)
5341  05c6 9f            	ld	a,xl
5342  05c7 4d            	tnz	a
5343  05c8 2706          	jreq	L5462
5344                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5346  05ca 7214525c      	bset	21084,#2
5348  05ce 2029          	jra	L1562
5349  05d0               L5462:
5350                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5352  05d0 7215525c      	bres	21084,#2
5353  05d4 2023          	jra	L1562
5354  05d6               L3462:
5355                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5357  05d6 7b01          	ld	a,(OFST+1,sp)
5358  05d8 4a            	dec	a
5359  05d9 2610          	jrne	L3562
5360                     ; 1668     if (NewState != DISABLE)
5362  05db 7b02          	ld	a,(OFST+2,sp)
5363  05dd 2706          	jreq	L5562
5364                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5366  05df 721c525c      	bset	21084,#6
5368  05e3 2014          	jra	L1562
5369  05e5               L5562:
5370                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5372  05e5 721d525c      	bres	21084,#6
5373  05e9 200e          	jra	L1562
5374  05eb               L3562:
5375                     ; 1680     if (NewState != DISABLE)
5377  05eb 7b02          	ld	a,(OFST+2,sp)
5378  05ed 2706          	jreq	L3662
5379                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5381  05ef 7214525d      	bset	21085,#2
5383  05f3 2004          	jra	L1562
5384  05f5               L3662:
5385                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5387  05f5 7215525d      	bres	21085,#2
5388  05f9               L1562:
5389                     ; 1689 }
5392  05f9 85            	popw	x
5393  05fa 81            	ret	
5438                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5438                     ; 1713 {
5439                     	switch	.text
5440  05fb               _TIM1_SelectOCxM:
5442  05fb 89            	pushw	x
5443       00000000      OFST:	set	0
5446                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5448                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5450                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5452  05fc 9e            	ld	a,xh
5453  05fd 4d            	tnz	a
5454  05fe 2610          	jrne	L1172
5455                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5457  0600 7211525c      	bres	21084,#0
5458                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5458                     ; 1725                             | (uint8_t)TIM1_OCMode);
5460  0604 c65258        	ld	a,21080
5461  0607 a48f          	and	a,#143
5462  0609 1a02          	or	a,(OFST+2,sp)
5463  060b c75258        	ld	21080,a
5465  060e 2038          	jra	L3172
5466  0610               L1172:
5467                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5469  0610 7b01          	ld	a,(OFST+1,sp)
5470  0612 a101          	cp	a,#1
5471  0614 2610          	jrne	L5172
5472                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5474  0616 7219525c      	bres	21084,#4
5475                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5475                     ; 1734                             | (uint8_t)TIM1_OCMode);
5477  061a c65259        	ld	a,21081
5478  061d a48f          	and	a,#143
5479  061f 1a02          	or	a,(OFST+2,sp)
5480  0621 c75259        	ld	21081,a
5482  0624 2022          	jra	L3172
5483  0626               L5172:
5484                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5486  0626 a102          	cp	a,#2
5487  0628 2610          	jrne	L1272
5488                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5490  062a 7211525d      	bres	21085,#0
5491                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5491                     ; 1743                             | (uint8_t)TIM1_OCMode);
5493  062e c6525a        	ld	a,21082
5494  0631 a48f          	and	a,#143
5495  0633 1a02          	or	a,(OFST+2,sp)
5496  0635 c7525a        	ld	21082,a
5498  0638 200e          	jra	L3172
5499  063a               L1272:
5500                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5502  063a 7219525d      	bres	21085,#4
5503                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5503                     ; 1752                             | (uint8_t)TIM1_OCMode);
5505  063e c6525b        	ld	a,21083
5506  0641 a48f          	and	a,#143
5507  0643 1a02          	or	a,(OFST+2,sp)
5508  0645 c7525b        	ld	21083,a
5509  0648               L3172:
5510                     ; 1754 }
5513  0648 85            	popw	x
5514  0649 81            	ret	
5546                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5546                     ; 1763 {
5547                     	switch	.text
5548  064a               _TIM1_SetCounter:
5552                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5554  064a 9e            	ld	a,xh
5555  064b c7525e        	ld	21086,a
5556                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5558  064e 9f            	ld	a,xl
5559  064f c7525f        	ld	21087,a
5560                     ; 1767 }
5563  0652 81            	ret	
5595                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5595                     ; 1776 {
5596                     	switch	.text
5597  0653               _TIM1_SetAutoreload:
5601                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5603  0653 9e            	ld	a,xh
5604  0654 c75262        	ld	21090,a
5605                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5607  0657 9f            	ld	a,xl
5608  0658 c75263        	ld	21091,a
5609                     ; 1780  }
5612  065b 81            	ret	
5644                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5644                     ; 1789 {
5645                     	switch	.text
5646  065c               _TIM1_SetCompare1:
5650                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5652  065c 9e            	ld	a,xh
5653  065d c75265        	ld	21093,a
5654                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5656  0660 9f            	ld	a,xl
5657  0661 c75266        	ld	21094,a
5658                     ; 1793 }
5661  0664 81            	ret	
5693                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5693                     ; 1802 {
5694                     	switch	.text
5695  0665               _TIM1_SetCompare2:
5699                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5701  0665 9e            	ld	a,xh
5702  0666 c75267        	ld	21095,a
5703                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5705  0669 9f            	ld	a,xl
5706  066a c75268        	ld	21096,a
5707                     ; 1806 }
5710  066d 81            	ret	
5742                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5742                     ; 1815 {
5743                     	switch	.text
5744  066e               _TIM1_SetCompare3:
5748                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5750  066e 9e            	ld	a,xh
5751  066f c75269        	ld	21097,a
5752                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5754  0672 9f            	ld	a,xl
5755  0673 c7526a        	ld	21098,a
5756                     ; 1819 }
5759  0676 81            	ret	
5791                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5791                     ; 1828 {
5792                     	switch	.text
5793  0677               _TIM1_SetCompare4:
5797                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5799  0677 9e            	ld	a,xh
5800  0678 c7526b        	ld	21099,a
5801                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5803  067b 9f            	ld	a,xl
5804  067c c7526c        	ld	21100,a
5805                     ; 1832 }
5808  067f 81            	ret	
5844                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5844                     ; 1845 {
5845                     	switch	.text
5846  0680               _TIM1_SetIC1Prescaler:
5848  0680 88            	push	a
5849       00000000      OFST:	set	0
5852                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5854                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5854                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5856  0681 c65258        	ld	a,21080
5857  0684 a4f3          	and	a,#243
5858  0686 1a01          	or	a,(OFST+1,sp)
5859  0688 c75258        	ld	21080,a
5860                     ; 1852 }
5863  068b 84            	pop	a
5864  068c 81            	ret	
5900                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5900                     ; 1865 {
5901                     	switch	.text
5902  068d               _TIM1_SetIC2Prescaler:
5904  068d 88            	push	a
5905       00000000      OFST:	set	0
5908                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5910                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5910                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5912  068e c65259        	ld	a,21081
5913  0691 a4f3          	and	a,#243
5914  0693 1a01          	or	a,(OFST+1,sp)
5915  0695 c75259        	ld	21081,a
5916                     ; 1873 }
5919  0698 84            	pop	a
5920  0699 81            	ret	
5956                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5956                     ; 1886 {
5957                     	switch	.text
5958  069a               _TIM1_SetIC3Prescaler:
5960  069a 88            	push	a
5961       00000000      OFST:	set	0
5964                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
5966                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
5966                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
5968  069b c6525a        	ld	a,21082
5969  069e a4f3          	and	a,#243
5970  06a0 1a01          	or	a,(OFST+1,sp)
5971  06a2 c7525a        	ld	21082,a
5972                     ; 1894 }
5975  06a5 84            	pop	a
5976  06a6 81            	ret	
6012                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6012                     ; 1907 {
6013                     	switch	.text
6014  06a7               _TIM1_SetIC4Prescaler:
6016  06a7 88            	push	a
6017       00000000      OFST:	set	0
6020                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6022                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6022                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6024  06a8 c6525b        	ld	a,21083
6025  06ab a4f3          	and	a,#243
6026  06ad 1a01          	or	a,(OFST+1,sp)
6027  06af c7525b        	ld	21083,a
6028                     ; 1915 }
6031  06b2 84            	pop	a
6032  06b3 81            	ret	
6078                     ; 1922 uint16_t TIM1_GetCapture1(void)
6078                     ; 1923 {
6079                     	switch	.text
6080  06b4               _TIM1_GetCapture1:
6082  06b4 5204          	subw	sp,#4
6083       00000004      OFST:	set	4
6086                     ; 1926   uint16_t tmpccr1 = 0;
6088                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6092                     ; 1929   tmpccr1h = TIM1->CCR1H;
6094  06b6 c65265        	ld	a,21093
6095  06b9 6b02          	ld	(OFST-2,sp),a
6097                     ; 1930   tmpccr1l = TIM1->CCR1L;
6099  06bb c65266        	ld	a,21094
6100  06be 6b01          	ld	(OFST-3,sp),a
6102                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6104  06c0 5f            	clrw	x
6105  06c1 97            	ld	xl,a
6106  06c2 1f03          	ldw	(OFST-1,sp),x
6108                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6110  06c4 5f            	clrw	x
6111  06c5 7b02          	ld	a,(OFST-2,sp)
6112  06c7 97            	ld	xl,a
6113  06c8 7b04          	ld	a,(OFST+0,sp)
6114  06ca 01            	rrwa	x,a
6115  06cb 1a03          	or	a,(OFST-1,sp)
6116  06cd 01            	rrwa	x,a
6118                     ; 1935   return (uint16_t)tmpccr1;
6122  06ce 5b04          	addw	sp,#4
6123  06d0 81            	ret	
6169                     ; 1943 uint16_t TIM1_GetCapture2(void)
6169                     ; 1944 {
6170                     	switch	.text
6171  06d1               _TIM1_GetCapture2:
6173  06d1 5204          	subw	sp,#4
6174       00000004      OFST:	set	4
6177                     ; 1947   uint16_t tmpccr2 = 0;
6179                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6183                     ; 1950   tmpccr2h = TIM1->CCR2H;
6185  06d3 c65267        	ld	a,21095
6186  06d6 6b02          	ld	(OFST-2,sp),a
6188                     ; 1951   tmpccr2l = TIM1->CCR2L;
6190  06d8 c65268        	ld	a,21096
6191  06db 6b01          	ld	(OFST-3,sp),a
6193                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6195  06dd 5f            	clrw	x
6196  06de 97            	ld	xl,a
6197  06df 1f03          	ldw	(OFST-1,sp),x
6199                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6201  06e1 5f            	clrw	x
6202  06e2 7b02          	ld	a,(OFST-2,sp)
6203  06e4 97            	ld	xl,a
6204  06e5 7b04          	ld	a,(OFST+0,sp)
6205  06e7 01            	rrwa	x,a
6206  06e8 1a03          	or	a,(OFST-1,sp)
6207  06ea 01            	rrwa	x,a
6209                     ; 1956   return (uint16_t)tmpccr2;
6213  06eb 5b04          	addw	sp,#4
6214  06ed 81            	ret	
6260                     ; 1964 uint16_t TIM1_GetCapture3(void)
6260                     ; 1965 {
6261                     	switch	.text
6262  06ee               _TIM1_GetCapture3:
6264  06ee 5204          	subw	sp,#4
6265       00000004      OFST:	set	4
6268                     ; 1967   uint16_t tmpccr3 = 0;
6270                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6274                     ; 1970   tmpccr3h = TIM1->CCR3H;
6276  06f0 c65269        	ld	a,21097
6277  06f3 6b02          	ld	(OFST-2,sp),a
6279                     ; 1971   tmpccr3l = TIM1->CCR3L;
6281  06f5 c6526a        	ld	a,21098
6282  06f8 6b01          	ld	(OFST-3,sp),a
6284                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6286  06fa 5f            	clrw	x
6287  06fb 97            	ld	xl,a
6288  06fc 1f03          	ldw	(OFST-1,sp),x
6290                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6292  06fe 5f            	clrw	x
6293  06ff 7b02          	ld	a,(OFST-2,sp)
6294  0701 97            	ld	xl,a
6295  0702 7b04          	ld	a,(OFST+0,sp)
6296  0704 01            	rrwa	x,a
6297  0705 1a03          	or	a,(OFST-1,sp)
6298  0707 01            	rrwa	x,a
6300                     ; 1976   return (uint16_t)tmpccr3;
6304  0708 5b04          	addw	sp,#4
6305  070a 81            	ret	
6351                     ; 1984 uint16_t TIM1_GetCapture4(void)
6351                     ; 1985 {
6352                     	switch	.text
6353  070b               _TIM1_GetCapture4:
6355  070b 5204          	subw	sp,#4
6356       00000004      OFST:	set	4
6359                     ; 1987   uint16_t tmpccr4 = 0;
6361                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6365                     ; 1990   tmpccr4h = TIM1->CCR4H;
6367  070d c6526b        	ld	a,21099
6368  0710 6b02          	ld	(OFST-2,sp),a
6370                     ; 1991   tmpccr4l = TIM1->CCR4L;
6372  0712 c6526c        	ld	a,21100
6373  0715 6b01          	ld	(OFST-3,sp),a
6375                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6377  0717 5f            	clrw	x
6378  0718 97            	ld	xl,a
6379  0719 1f03          	ldw	(OFST-1,sp),x
6381                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6383  071b 5f            	clrw	x
6384  071c 7b02          	ld	a,(OFST-2,sp)
6385  071e 97            	ld	xl,a
6386  071f 7b04          	ld	a,(OFST+0,sp)
6387  0721 01            	rrwa	x,a
6388  0722 1a03          	or	a,(OFST-1,sp)
6389  0724 01            	rrwa	x,a
6391                     ; 1996   return (uint16_t)tmpccr4;
6395  0725 5b04          	addw	sp,#4
6396  0727 81            	ret	
6428                     ; 2004 uint16_t TIM1_GetCounter(void)
6428                     ; 2005 {
6429                     	switch	.text
6430  0728               _TIM1_GetCounter:
6432  0728 89            	pushw	x
6433       00000002      OFST:	set	2
6436                     ; 2006   uint16_t tmpcntr = 0;
6438                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6440  0729 c6525e        	ld	a,21086
6441  072c 97            	ld	xl,a
6442  072d 4f            	clr	a
6443  072e 02            	rlwa	x,a
6444  072f 1f01          	ldw	(OFST-1,sp),x
6446                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6448  0731 c6525f        	ld	a,21087
6449  0734 5f            	clrw	x
6450  0735 97            	ld	xl,a
6451  0736 01            	rrwa	x,a
6452  0737 1a02          	or	a,(OFST+0,sp)
6453  0739 01            	rrwa	x,a
6454  073a 1a01          	or	a,(OFST-1,sp)
6455  073c 01            	rrwa	x,a
6458  073d 5b02          	addw	sp,#2
6459  073f 81            	ret	
6491                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6491                     ; 2020 {
6492                     	switch	.text
6493  0740               _TIM1_GetPrescaler:
6495  0740 89            	pushw	x
6496       00000002      OFST:	set	2
6499                     ; 2021   uint16_t temp = 0;
6501                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6503  0741 c65260        	ld	a,21088
6504  0744 97            	ld	xl,a
6505  0745 4f            	clr	a
6506  0746 02            	rlwa	x,a
6507  0747 1f01          	ldw	(OFST-1,sp),x
6509                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6511  0749 c65261        	ld	a,21089
6512  074c 5f            	clrw	x
6513  074d 97            	ld	xl,a
6514  074e 01            	rrwa	x,a
6515  074f 1a02          	or	a,(OFST+0,sp)
6516  0751 01            	rrwa	x,a
6517  0752 1a01          	or	a,(OFST-1,sp)
6518  0754 01            	rrwa	x,a
6521  0755 5b02          	addw	sp,#2
6522  0757 81            	ret	
6692                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6692                     ; 2048 {
6693                     	switch	.text
6694  0758               _TIM1_GetFlagStatus:
6696  0758 89            	pushw	x
6697  0759 89            	pushw	x
6698       00000002      OFST:	set	2
6701                     ; 2049   FlagStatus bitstatus = RESET;
6703                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6707                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6709                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6711  075a 9f            	ld	a,xl
6712  075b c45255        	and	a,21077
6713  075e 6b01          	ld	(OFST-1,sp),a
6715                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6717  0760 7b03          	ld	a,(OFST+1,sp)
6718  0762 6b02          	ld	(OFST+0,sp),a
6720                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6722  0764 c45256        	and	a,21078
6723  0767 1a01          	or	a,(OFST-1,sp)
6724  0769 2702          	jreq	L7433
6725                     ; 2060     bitstatus = SET;
6727  076b a601          	ld	a,#1
6730  076d               L7433:
6731                     ; 2064     bitstatus = RESET;
6734                     ; 2066   return (FlagStatus)(bitstatus);
6738  076d 5b04          	addw	sp,#4
6739  076f 81            	ret	
6774                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6774                     ; 2088 {
6775                     	switch	.text
6776  0770               _TIM1_ClearFlag:
6778  0770 89            	pushw	x
6779       00000000      OFST:	set	0
6782                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6784                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6786  0771 9f            	ld	a,xl
6787  0772 43            	cpl	a
6788  0773 c75255        	ld	21077,a
6789                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6789                     ; 2095                         (uint8_t)0x1E);
6791  0776 7b01          	ld	a,(OFST+1,sp)
6792  0778 43            	cpl	a
6793  0779 a41e          	and	a,#30
6794  077b c75256        	ld	21078,a
6795                     ; 2096 }
6798  077e 85            	popw	x
6799  077f 81            	ret	
6859                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6859                     ; 2113 {
6860                     	switch	.text
6861  0780               _TIM1_GetITStatus:
6863  0780 88            	push	a
6864  0781 89            	pushw	x
6865       00000002      OFST:	set	2
6868                     ; 2114   ITStatus bitstatus = RESET;
6870                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6874                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6876                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6878  0782 c45255        	and	a,21077
6879  0785 6b01          	ld	(OFST-1,sp),a
6881                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6883  0787 c65254        	ld	a,21076
6884  078a 1403          	and	a,(OFST+1,sp)
6885  078c 6b02          	ld	(OFST+0,sp),a
6887                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6889  078e 7b01          	ld	a,(OFST-1,sp)
6890  0790 2708          	jreq	L7143
6892  0792 7b02          	ld	a,(OFST+0,sp)
6893  0794 2704          	jreq	L7143
6894                     ; 2126     bitstatus = SET;
6896  0796 a601          	ld	a,#1
6899  0798 2001          	jra	L1243
6900  079a               L7143:
6901                     ; 2130     bitstatus = RESET;
6903  079a 4f            	clr	a
6905  079b               L1243:
6906                     ; 2132   return (ITStatus)(bitstatus);
6910  079b 5b03          	addw	sp,#3
6911  079d 81            	ret	
6947                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6947                     ; 2150 {
6948                     	switch	.text
6949  079e               _TIM1_ClearITPendingBit:
6953                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
6955                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
6957  079e 43            	cpl	a
6958  079f c75255        	ld	21077,a
6959                     ; 2156 }
6962  07a2 81            	ret	
7008                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7008                     ; 2175                        uint8_t TIM1_ICSelection,
7008                     ; 2176                        uint8_t TIM1_ICFilter)
7008                     ; 2177 {
7009                     	switch	.text
7010  07a3               L3_TI1_Config:
7012  07a3 89            	pushw	x
7013  07a4 88            	push	a
7014       00000001      OFST:	set	1
7017                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7019  07a5 7211525c      	bres	21084,#0
7020                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7020                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7022  07a9 7b06          	ld	a,(OFST+5,sp)
7023  07ab 97            	ld	xl,a
7024  07ac a610          	ld	a,#16
7025  07ae 42            	mul	x,a
7026  07af 9f            	ld	a,xl
7027  07b0 1a03          	or	a,(OFST+2,sp)
7028  07b2 6b01          	ld	(OFST+0,sp),a
7030  07b4 c65258        	ld	a,21080
7031  07b7 a40c          	and	a,#12
7032  07b9 1a01          	or	a,(OFST+0,sp)
7033  07bb c75258        	ld	21080,a
7034                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7036  07be 7b02          	ld	a,(OFST+1,sp)
7037  07c0 2706          	jreq	L1643
7038                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7040  07c2 7212525c      	bset	21084,#1
7042  07c6 2004          	jra	L3643
7043  07c8               L1643:
7044                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7046  07c8 7213525c      	bres	21084,#1
7047  07cc               L3643:
7048                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7050  07cc 7210525c      	bset	21084,#0
7051                     ; 2197 }
7054  07d0 5b03          	addw	sp,#3
7055  07d2 81            	ret	
7101                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7101                     ; 2216                        uint8_t TIM1_ICSelection,
7101                     ; 2217                        uint8_t TIM1_ICFilter)
7101                     ; 2218 {
7102                     	switch	.text
7103  07d3               L5_TI2_Config:
7105  07d3 89            	pushw	x
7106  07d4 88            	push	a
7107       00000001      OFST:	set	1
7110                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7112  07d5 7219525c      	bres	21084,#4
7113                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7113                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7115  07d9 7b06          	ld	a,(OFST+5,sp)
7116  07db 97            	ld	xl,a
7117  07dc a610          	ld	a,#16
7118  07de 42            	mul	x,a
7119  07df 9f            	ld	a,xl
7120  07e0 1a03          	or	a,(OFST+2,sp)
7121  07e2 6b01          	ld	(OFST+0,sp),a
7123  07e4 c65259        	ld	a,21081
7124  07e7 a40c          	and	a,#12
7125  07e9 1a01          	or	a,(OFST+0,sp)
7126  07eb c75259        	ld	21081,a
7127                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7129  07ee 7b02          	ld	a,(OFST+1,sp)
7130  07f0 2706          	jreq	L5053
7131                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7133  07f2 721a525c      	bset	21084,#5
7135  07f6 2004          	jra	L7053
7136  07f8               L5053:
7137                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7139  07f8 721b525c      	bres	21084,#5
7140  07fc               L7053:
7141                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7143  07fc 7218525c      	bset	21084,#4
7144                     ; 2236 }
7147  0800 5b03          	addw	sp,#3
7148  0802 81            	ret	
7194                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7194                     ; 2255                        uint8_t TIM1_ICSelection,
7194                     ; 2256                        uint8_t TIM1_ICFilter)
7194                     ; 2257 {
7195                     	switch	.text
7196  0803               L7_TI3_Config:
7198  0803 89            	pushw	x
7199  0804 88            	push	a
7200       00000001      OFST:	set	1
7203                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7205  0805 7211525d      	bres	21085,#0
7206                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7206                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7208  0809 7b06          	ld	a,(OFST+5,sp)
7209  080b 97            	ld	xl,a
7210  080c a610          	ld	a,#16
7211  080e 42            	mul	x,a
7212  080f 9f            	ld	a,xl
7213  0810 1a03          	or	a,(OFST+2,sp)
7214  0812 6b01          	ld	(OFST+0,sp),a
7216  0814 c6525a        	ld	a,21082
7217  0817 a40c          	and	a,#12
7218  0819 1a01          	or	a,(OFST+0,sp)
7219  081b c7525a        	ld	21082,a
7220                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7222  081e 7b02          	ld	a,(OFST+1,sp)
7223  0820 2706          	jreq	L1353
7224                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7226  0822 7212525d      	bset	21085,#1
7228  0826 2004          	jra	L3353
7229  0828               L1353:
7230                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7232  0828 7213525d      	bres	21085,#1
7233  082c               L3353:
7234                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7236  082c 7210525d      	bset	21085,#0
7237                     ; 2276 }
7240  0830 5b03          	addw	sp,#3
7241  0832 81            	ret	
7287                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7287                     ; 2295                        uint8_t TIM1_ICSelection,
7287                     ; 2296                        uint8_t TIM1_ICFilter)
7287                     ; 2297 {
7288                     	switch	.text
7289  0833               L11_TI4_Config:
7291  0833 89            	pushw	x
7292  0834 88            	push	a
7293       00000001      OFST:	set	1
7296                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7298  0835 7219525d      	bres	21085,#4
7299                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7299                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7301  0839 7b06          	ld	a,(OFST+5,sp)
7302  083b 97            	ld	xl,a
7303  083c a610          	ld	a,#16
7304  083e 42            	mul	x,a
7305  083f 9f            	ld	a,xl
7306  0840 1a03          	or	a,(OFST+2,sp)
7307  0842 6b01          	ld	(OFST+0,sp),a
7309  0844 c6525b        	ld	a,21083
7310  0847 a40c          	and	a,#12
7311  0849 1a01          	or	a,(OFST+0,sp)
7312  084b c7525b        	ld	21083,a
7313                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7315  084e 7b02          	ld	a,(OFST+1,sp)
7316  0850 2706          	jreq	L5553
7317                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7319  0852 721a525d      	bset	21085,#5
7321  0856 2004          	jra	L7553
7322  0858               L5553:
7323                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7325  0858 721b525d      	bres	21085,#5
7326  085c               L7553:
7327                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7329  085c 7218525d      	bset	21085,#4
7330                     ; 2317 }
7333  0860 5b03          	addw	sp,#3
7334  0862 81            	ret	
7347                     	xdef	_TIM1_ClearITPendingBit
7348                     	xdef	_TIM1_GetITStatus
7349                     	xdef	_TIM1_ClearFlag
7350                     	xdef	_TIM1_GetFlagStatus
7351                     	xdef	_TIM1_GetPrescaler
7352                     	xdef	_TIM1_GetCounter
7353                     	xdef	_TIM1_GetCapture4
7354                     	xdef	_TIM1_GetCapture3
7355                     	xdef	_TIM1_GetCapture2
7356                     	xdef	_TIM1_GetCapture1
7357                     	xdef	_TIM1_SetIC4Prescaler
7358                     	xdef	_TIM1_SetIC3Prescaler
7359                     	xdef	_TIM1_SetIC2Prescaler
7360                     	xdef	_TIM1_SetIC1Prescaler
7361                     	xdef	_TIM1_SetCompare4
7362                     	xdef	_TIM1_SetCompare3
7363                     	xdef	_TIM1_SetCompare2
7364                     	xdef	_TIM1_SetCompare1
7365                     	xdef	_TIM1_SetAutoreload
7366                     	xdef	_TIM1_SetCounter
7367                     	xdef	_TIM1_SelectOCxM
7368                     	xdef	_TIM1_CCxNCmd
7369                     	xdef	_TIM1_CCxCmd
7370                     	xdef	_TIM1_OC4PolarityConfig
7371                     	xdef	_TIM1_OC3NPolarityConfig
7372                     	xdef	_TIM1_OC3PolarityConfig
7373                     	xdef	_TIM1_OC2NPolarityConfig
7374                     	xdef	_TIM1_OC2PolarityConfig
7375                     	xdef	_TIM1_OC1NPolarityConfig
7376                     	xdef	_TIM1_OC1PolarityConfig
7377                     	xdef	_TIM1_GenerateEvent
7378                     	xdef	_TIM1_OC4FastConfig
7379                     	xdef	_TIM1_OC3FastConfig
7380                     	xdef	_TIM1_OC2FastConfig
7381                     	xdef	_TIM1_OC1FastConfig
7382                     	xdef	_TIM1_OC4PreloadConfig
7383                     	xdef	_TIM1_OC3PreloadConfig
7384                     	xdef	_TIM1_OC2PreloadConfig
7385                     	xdef	_TIM1_OC1PreloadConfig
7386                     	xdef	_TIM1_CCPreloadControl
7387                     	xdef	_TIM1_SelectCOM
7388                     	xdef	_TIM1_ARRPreloadConfig
7389                     	xdef	_TIM1_ForcedOC4Config
7390                     	xdef	_TIM1_ForcedOC3Config
7391                     	xdef	_TIM1_ForcedOC2Config
7392                     	xdef	_TIM1_ForcedOC1Config
7393                     	xdef	_TIM1_CounterModeConfig
7394                     	xdef	_TIM1_PrescalerConfig
7395                     	xdef	_TIM1_EncoderInterfaceConfig
7396                     	xdef	_TIM1_SelectMasterSlaveMode
7397                     	xdef	_TIM1_SelectSlaveMode
7398                     	xdef	_TIM1_SelectOutputTrigger
7399                     	xdef	_TIM1_SelectOnePulseMode
7400                     	xdef	_TIM1_SelectHallSensor
7401                     	xdef	_TIM1_UpdateRequestConfig
7402                     	xdef	_TIM1_UpdateDisableConfig
7403                     	xdef	_TIM1_SelectInputTrigger
7404                     	xdef	_TIM1_TIxExternalClockConfig
7405                     	xdef	_TIM1_ETRConfig
7406                     	xdef	_TIM1_ETRClockMode2Config
7407                     	xdef	_TIM1_ETRClockMode1Config
7408                     	xdef	_TIM1_InternalClockConfig
7409                     	xdef	_TIM1_ITConfig
7410                     	xdef	_TIM1_CtrlPWMOutputs
7411                     	xdef	_TIM1_Cmd
7412                     	xdef	_TIM1_PWMIConfig
7413                     	xdef	_TIM1_ICInit
7414                     	xdef	_TIM1_BDTRConfig
7415                     	xdef	_TIM1_OC4Init
7416                     	xdef	_TIM1_OC3Init
7417                     	xdef	_TIM1_OC2Init
7418                     	xdef	_TIM1_OC1Init
7419                     	xdef	_TIM1_TimeBaseInit
7420                     	xdef	_TIM1_DeInit
7439                     	end
