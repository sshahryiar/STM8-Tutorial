   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 54 void UART3_DeInit(void)
  42                     ; 55 {
  44                     	switch	.text
  45  0000               _UART3_DeInit:
  49                     ; 58   (void) UART3->SR;
  51  0000 c65240        	ld	a,21056
  52                     ; 59   (void) UART3->DR;
  54  0003 c65241        	ld	a,21057
  55                     ; 61   UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  57  0006 725f5243      	clr	21059
  58                     ; 62   UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  60  000a 725f5242      	clr	21058
  61                     ; 64   UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  63  000e 725f5244      	clr	21060
  64                     ; 65   UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  66  0012 725f5245      	clr	21061
  67                     ; 66   UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  69  0016 725f5246      	clr	21062
  70                     ; 67   UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  72  001a 725f5247      	clr	21063
  73                     ; 68   UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  75  001e 725f5249      	clr	21065
  76                     ; 69 }
  79  0022 81            	ret
 296                     .const:	section	.text
 297  0000               L01:
 298  0000 00000064      	dc.l	100
 299                     ; 83 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 299                     ; 84                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 299                     ; 85                 UART3_Mode_TypeDef Mode)
 299                     ; 86 {
 300                     	switch	.text
 301  0023               _UART3_Init:
 303  0023 520e          	subw	sp,#14
 304       0000000e      OFST:	set	14
 307                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 311                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 315                     ; 91   assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 317                     ; 92   assert_param(IS_UART3_STOPBITS_OK(StopBits));
 319                     ; 93   assert_param(IS_UART3_PARITY_OK(Parity));
 321                     ; 94   assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 323                     ; 95   assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 325                     ; 98   UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 327  0025 72195244      	bres	21060,#4
 328                     ; 100   UART3->CR1 |= (uint8_t)WordLength; 
 330  0029 c65244        	ld	a,21060
 331  002c 1a15          	or	a,(OFST+7,sp)
 332  002e c75244        	ld	21060,a
 333                     ; 103   UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 335  0031 c65246        	ld	a,21062
 336  0034 a4cf          	and	a,#207
 337  0036 c75246        	ld	21062,a
 338                     ; 105   UART3->CR3 |= (uint8_t)StopBits;  
 340  0039 c65246        	ld	a,21062
 341  003c 1a16          	or	a,(OFST+8,sp)
 342  003e c75246        	ld	21062,a
 343                     ; 108   UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 345  0041 c65244        	ld	a,21060
 346  0044 a4f9          	and	a,#249
 347  0046 c75244        	ld	21060,a
 348                     ; 110   UART3->CR1 |= (uint8_t)Parity;     
 350  0049 c65244        	ld	a,21060
 351  004c 1a17          	or	a,(OFST+9,sp)
 352  004e c75244        	ld	21060,a
 353                     ; 113   UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 355  0051 725f5242      	clr	21058
 356                     ; 115   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 358  0055 c65243        	ld	a,21059
 359  0058 a40f          	and	a,#15
 360  005a c75243        	ld	21059,a
 361                     ; 117   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 363  005d c65243        	ld	a,21059
 364  0060 a4f0          	and	a,#240
 365  0062 c75243        	ld	21059,a
 366                     ; 120   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 368  0065 96            	ldw	x,sp
 369  0066 1c0011        	addw	x,#OFST+3
 370  0069 cd0000        	call	c_ltor
 372  006c a604          	ld	a,#4
 373  006e cd0000        	call	c_llsh
 375  0071 96            	ldw	x,sp
 376  0072 1c0001        	addw	x,#OFST-13
 377  0075 cd0000        	call	c_rtol
 380  0078 cd0000        	call	_CLK_GetClockFreq
 382  007b 96            	ldw	x,sp
 383  007c 1c0001        	addw	x,#OFST-13
 384  007f cd0000        	call	c_ludv
 386  0082 96            	ldw	x,sp
 387  0083 1c000b        	addw	x,#OFST-3
 388  0086 cd0000        	call	c_rtol
 391                     ; 121   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 393  0089 96            	ldw	x,sp
 394  008a 1c0011        	addw	x,#OFST+3
 395  008d cd0000        	call	c_ltor
 397  0090 a604          	ld	a,#4
 398  0092 cd0000        	call	c_llsh
 400  0095 96            	ldw	x,sp
 401  0096 1c0001        	addw	x,#OFST-13
 402  0099 cd0000        	call	c_rtol
 405  009c cd0000        	call	_CLK_GetClockFreq
 407  009f a664          	ld	a,#100
 408  00a1 cd0000        	call	c_smul
 410  00a4 96            	ldw	x,sp
 411  00a5 1c0001        	addw	x,#OFST-13
 412  00a8 cd0000        	call	c_ludv
 414  00ab 96            	ldw	x,sp
 415  00ac 1c0007        	addw	x,#OFST-7
 416  00af cd0000        	call	c_rtol
 419                     ; 124   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 419                     ; 125                                 << 4) / 100) & (uint8_t)0x0F); 
 421  00b2 96            	ldw	x,sp
 422  00b3 1c000b        	addw	x,#OFST-3
 423  00b6 cd0000        	call	c_ltor
 425  00b9 a664          	ld	a,#100
 426  00bb cd0000        	call	c_smul
 428  00be 96            	ldw	x,sp
 429  00bf 1c0001        	addw	x,#OFST-13
 430  00c2 cd0000        	call	c_rtol
 433  00c5 96            	ldw	x,sp
 434  00c6 1c0007        	addw	x,#OFST-7
 435  00c9 cd0000        	call	c_ltor
 437  00cc 96            	ldw	x,sp
 438  00cd 1c0001        	addw	x,#OFST-13
 439  00d0 cd0000        	call	c_lsub
 441  00d3 a604          	ld	a,#4
 442  00d5 cd0000        	call	c_llsh
 444  00d8 ae0000        	ldw	x,#L01
 445  00db cd0000        	call	c_ludv
 447  00de b603          	ld	a,c_lreg+3
 448  00e0 a40f          	and	a,#15
 449  00e2 6b05          	ld	(OFST-9,sp),a
 451                     ; 126   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 453  00e4 96            	ldw	x,sp
 454  00e5 1c000b        	addw	x,#OFST-3
 455  00e8 cd0000        	call	c_ltor
 457  00eb a604          	ld	a,#4
 458  00ed cd0000        	call	c_lursh
 460  00f0 b603          	ld	a,c_lreg+3
 461  00f2 a4f0          	and	a,#240
 462  00f4 b703          	ld	c_lreg+3,a
 463  00f6 3f02          	clr	c_lreg+2
 464  00f8 3f01          	clr	c_lreg+1
 465  00fa 3f00          	clr	c_lreg
 466  00fc b603          	ld	a,c_lreg+3
 467  00fe 6b06          	ld	(OFST-8,sp),a
 469                     ; 128   UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 471  0100 7b05          	ld	a,(OFST-9,sp)
 472  0102 1a06          	or	a,(OFST-8,sp)
 473  0104 c75243        	ld	21059,a
 474                     ; 130   UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 476  0107 7b0e          	ld	a,(OFST+0,sp)
 477  0109 c75242        	ld	21058,a
 478                     ; 132   if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 480  010c 7b18          	ld	a,(OFST+10,sp)
 481  010e a504          	bcp	a,#4
 482  0110 2706          	jreq	L531
 483                     ; 135     UART3->CR2 |= UART3_CR2_TEN;  
 485  0112 72165245      	bset	21061,#3
 487  0116 2004          	jra	L731
 488  0118               L531:
 489                     ; 140     UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 491  0118 72175245      	bres	21061,#3
 492  011c               L731:
 493                     ; 142   if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 495  011c 7b18          	ld	a,(OFST+10,sp)
 496  011e a508          	bcp	a,#8
 497  0120 2706          	jreq	L141
 498                     ; 145     UART3->CR2 |= UART3_CR2_REN;  
 500  0122 72145245      	bset	21061,#2
 502  0126 2004          	jra	L341
 503  0128               L141:
 504                     ; 150     UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 506  0128 72155245      	bres	21061,#2
 507  012c               L341:
 508                     ; 152 }
 511  012c 5b0e          	addw	sp,#14
 512  012e 81            	ret
 567                     ; 160 void UART3_Cmd(FunctionalState NewState)
 567                     ; 161 {
 568                     	switch	.text
 569  012f               _UART3_Cmd:
 573                     ; 162   if (NewState != DISABLE)
 575  012f 4d            	tnz	a
 576  0130 2706          	jreq	L371
 577                     ; 165     UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 579  0132 721b5244      	bres	21060,#5
 581  0136 2004          	jra	L571
 582  0138               L371:
 583                     ; 170     UART3->CR1 |= UART3_CR1_UARTD;  
 585  0138 721a5244      	bset	21060,#5
 586  013c               L571:
 587                     ; 172 }
 590  013c 81            	ret
 718                     ; 189 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 718                     ; 190 {
 719                     	switch	.text
 720  013d               _UART3_ITConfig:
 722  013d 89            	pushw	x
 723  013e 89            	pushw	x
 724       00000002      OFST:	set	2
 727                     ; 191   uint8_t uartreg = 0, itpos = 0x00;
 731                     ; 194   assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 733                     ; 195   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 735                     ; 198   uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 737  013f 9e            	ld	a,xh
 738  0140 6b01          	ld	(OFST-1,sp),a
 740                     ; 201   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 742  0142 9f            	ld	a,xl
 743  0143 a40f          	and	a,#15
 744  0145 5f            	clrw	x
 745  0146 97            	ld	xl,a
 746  0147 a601          	ld	a,#1
 747  0149 5d            	tnzw	x
 748  014a 2704          	jreq	L61
 749  014c               L02:
 750  014c 48            	sll	a
 751  014d 5a            	decw	x
 752  014e 26fc          	jrne	L02
 753  0150               L61:
 754  0150 6b02          	ld	(OFST+0,sp),a
 756                     ; 203   if (NewState != DISABLE)
 758  0152 0d07          	tnz	(OFST+5,sp)
 759  0154 273a          	jreq	L352
 760                     ; 206     if (uartreg == 0x01)
 762  0156 7b01          	ld	a,(OFST-1,sp)
 763  0158 a101          	cp	a,#1
 764  015a 260a          	jrne	L552
 765                     ; 208       UART3->CR1 |= itpos;
 767  015c c65244        	ld	a,21060
 768  015f 1a02          	or	a,(OFST+0,sp)
 769  0161 c75244        	ld	21060,a
 771  0164 2066          	jra	L172
 772  0166               L552:
 773                     ; 210     else if (uartreg == 0x02)
 775  0166 7b01          	ld	a,(OFST-1,sp)
 776  0168 a102          	cp	a,#2
 777  016a 260a          	jrne	L162
 778                     ; 212       UART3->CR2 |= itpos;
 780  016c c65245        	ld	a,21061
 781  016f 1a02          	or	a,(OFST+0,sp)
 782  0171 c75245        	ld	21061,a
 784  0174 2056          	jra	L172
 785  0176               L162:
 786                     ; 214     else if (uartreg == 0x03)
 788  0176 7b01          	ld	a,(OFST-1,sp)
 789  0178 a103          	cp	a,#3
 790  017a 260a          	jrne	L562
 791                     ; 216       UART3->CR4 |= itpos;
 793  017c c65247        	ld	a,21063
 794  017f 1a02          	or	a,(OFST+0,sp)
 795  0181 c75247        	ld	21063,a
 797  0184 2046          	jra	L172
 798  0186               L562:
 799                     ; 220       UART3->CR6 |= itpos;
 801  0186 c65249        	ld	a,21065
 802  0189 1a02          	or	a,(OFST+0,sp)
 803  018b c75249        	ld	21065,a
 804  018e 203c          	jra	L172
 805  0190               L352:
 806                     ; 226     if (uartreg == 0x01)
 808  0190 7b01          	ld	a,(OFST-1,sp)
 809  0192 a101          	cp	a,#1
 810  0194 260b          	jrne	L372
 811                     ; 228       UART3->CR1 &= (uint8_t)(~itpos);
 813  0196 7b02          	ld	a,(OFST+0,sp)
 814  0198 43            	cpl	a
 815  0199 c45244        	and	a,21060
 816  019c c75244        	ld	21060,a
 818  019f 202b          	jra	L172
 819  01a1               L372:
 820                     ; 230     else if (uartreg == 0x02)
 822  01a1 7b01          	ld	a,(OFST-1,sp)
 823  01a3 a102          	cp	a,#2
 824  01a5 260b          	jrne	L772
 825                     ; 232       UART3->CR2 &= (uint8_t)(~itpos);
 827  01a7 7b02          	ld	a,(OFST+0,sp)
 828  01a9 43            	cpl	a
 829  01aa c45245        	and	a,21061
 830  01ad c75245        	ld	21061,a
 832  01b0 201a          	jra	L172
 833  01b2               L772:
 834                     ; 234     else if (uartreg == 0x03)
 836  01b2 7b01          	ld	a,(OFST-1,sp)
 837  01b4 a103          	cp	a,#3
 838  01b6 260b          	jrne	L303
 839                     ; 236       UART3->CR4 &= (uint8_t)(~itpos);
 841  01b8 7b02          	ld	a,(OFST+0,sp)
 842  01ba 43            	cpl	a
 843  01bb c45247        	and	a,21063
 844  01be c75247        	ld	21063,a
 846  01c1 2009          	jra	L172
 847  01c3               L303:
 848                     ; 240       UART3->CR6 &= (uint8_t)(~itpos);
 850  01c3 7b02          	ld	a,(OFST+0,sp)
 851  01c5 43            	cpl	a
 852  01c6 c45249        	and	a,21065
 853  01c9 c75249        	ld	21065,a
 854  01cc               L172:
 855                     ; 243 }
 858  01cc 5b04          	addw	sp,#4
 859  01ce 81            	ret
 918                     ; 252 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
 918                     ; 253 {
 919                     	switch	.text
 920  01cf               _UART3_LINBreakDetectionConfig:
 924                     ; 255   assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
 926                     ; 257   if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
 928  01cf 4d            	tnz	a
 929  01d0 2706          	jreq	L533
 930                     ; 259     UART3->CR4 |= UART3_CR4_LBDL;
 932  01d2 721a5247      	bset	21063,#5
 934  01d6 2004          	jra	L733
 935  01d8               L533:
 936                     ; 263     UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
 938  01d8 721b5247      	bres	21063,#5
 939  01dc               L733:
 940                     ; 265 }
 943  01dc 81            	ret
1064                     ; 277 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1064                     ; 278                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1064                     ; 279                      UART3_LinDivUp_TypeDef UART3_DivUp)
1064                     ; 280 {
1065                     	switch	.text
1066  01dd               _UART3_LINConfig:
1068  01dd 89            	pushw	x
1069       00000000      OFST:	set	0
1072                     ; 282   assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1074                     ; 283   assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1076                     ; 284   assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1078                     ; 286   if (UART3_Mode != UART3_LIN_MODE_MASTER)
1080  01de 9e            	ld	a,xh
1081  01df 4d            	tnz	a
1082  01e0 2706          	jreq	L714
1083                     ; 288     UART3->CR6 |=  UART3_CR6_LSLV;
1085  01e2 721a5249      	bset	21065,#5
1087  01e6 2004          	jra	L124
1088  01e8               L714:
1089                     ; 292     UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1091  01e8 721b5249      	bres	21065,#5
1092  01ec               L124:
1093                     ; 295   if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1095  01ec 0d02          	tnz	(OFST+2,sp)
1096  01ee 2706          	jreq	L324
1097                     ; 297     UART3->CR6 |=  UART3_CR6_LASE ;
1099  01f0 72185249      	bset	21065,#4
1101  01f4 2004          	jra	L524
1102  01f6               L324:
1103                     ; 301     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1105  01f6 72195249      	bres	21065,#4
1106  01fa               L524:
1107                     ; 304   if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1109  01fa 0d05          	tnz	(OFST+5,sp)
1110  01fc 2706          	jreq	L724
1111                     ; 306     UART3->CR6 |=  UART3_CR6_LDUM;
1113  01fe 721e5249      	bset	21065,#7
1115  0202 2004          	jra	L134
1116  0204               L724:
1117                     ; 310     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1119  0204 721f5249      	bres	21065,#7
1120  0208               L134:
1121                     ; 312 }
1124  0208 85            	popw	x
1125  0209 81            	ret
1160                     ; 320 void UART3_LINCmd(FunctionalState NewState)
1160                     ; 321 {
1161                     	switch	.text
1162  020a               _UART3_LINCmd:
1166                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1168                     ; 325   if (NewState != DISABLE)
1170  020a 4d            	tnz	a
1171  020b 2706          	jreq	L154
1172                     ; 328     UART3->CR3 |= UART3_CR3_LINEN;
1174  020d 721c5246      	bset	21062,#6
1176  0211 2004          	jra	L354
1177  0213               L154:
1178                     ; 333     UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1180  0213 721d5246      	bres	21062,#6
1181  0217               L354:
1182                     ; 335 }
1185  0217 81            	ret
1242                     ; 343 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1242                     ; 344 {
1243                     	switch	.text
1244  0218               _UART3_WakeUpConfig:
1248                     ; 346   assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1250                     ; 348   UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1252  0218 72175244      	bres	21060,#3
1253                     ; 349   UART3->CR1 |= (uint8_t)UART3_WakeUp;
1255  021c ca5244        	or	a,21060
1256  021f c75244        	ld	21060,a
1257                     ; 350 }
1260  0222 81            	ret
1296                     ; 358 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1296                     ; 359 {
1297                     	switch	.text
1298  0223               _UART3_ReceiverWakeUpCmd:
1302                     ; 361   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1304                     ; 363   if (NewState != DISABLE)
1306  0223 4d            	tnz	a
1307  0224 2706          	jreq	L125
1308                     ; 366     UART3->CR2 |= UART3_CR2_RWU;
1310  0226 72125245      	bset	21061,#1
1312  022a 2004          	jra	L325
1313  022c               L125:
1314                     ; 371     UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1316  022c 72135245      	bres	21061,#1
1317  0230               L325:
1318                     ; 373 }
1321  0230 81            	ret
1344                     ; 380 uint8_t UART3_ReceiveData8(void)
1344                     ; 381 {
1345                     	switch	.text
1346  0231               _UART3_ReceiveData8:
1350                     ; 382   return ((uint8_t)UART3->DR);
1352  0231 c65241        	ld	a,21057
1355  0234 81            	ret
1387                     ; 390 uint16_t UART3_ReceiveData9(void)
1387                     ; 391 {
1388                     	switch	.text
1389  0235               _UART3_ReceiveData9:
1391  0235 89            	pushw	x
1392       00000002      OFST:	set	2
1395                     ; 392   uint16_t temp = 0;
1397                     ; 394   temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1399  0236 c65244        	ld	a,21060
1400  0239 5f            	clrw	x
1401  023a a480          	and	a,#128
1402  023c 5f            	clrw	x
1403  023d 02            	rlwa	x,a
1404  023e 58            	sllw	x
1405  023f 1f01          	ldw	(OFST-1,sp),x
1407                     ; 395   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1409  0241 c65241        	ld	a,21057
1410  0244 5f            	clrw	x
1411  0245 97            	ld	xl,a
1412  0246 01            	rrwa	x,a
1413  0247 1a02          	or	a,(OFST+0,sp)
1414  0249 01            	rrwa	x,a
1415  024a 1a01          	or	a,(OFST-1,sp)
1416  024c 01            	rrwa	x,a
1417  024d 01            	rrwa	x,a
1418  024e a4ff          	and	a,#255
1419  0250 01            	rrwa	x,a
1420  0251 a401          	and	a,#1
1421  0253 01            	rrwa	x,a
1424  0254 5b02          	addw	sp,#2
1425  0256 81            	ret
1457                     ; 403 void UART3_SendData8(uint8_t Data)
1457                     ; 404 {
1458                     	switch	.text
1459  0257               _UART3_SendData8:
1463                     ; 406   UART3->DR = Data;
1465  0257 c75241        	ld	21057,a
1466                     ; 407 }
1469  025a 81            	ret
1501                     ; 414 void UART3_SendData9(uint16_t Data)
1501                     ; 415 {
1502                     	switch	.text
1503  025b               _UART3_SendData9:
1505  025b 89            	pushw	x
1506       00000000      OFST:	set	0
1509                     ; 417   UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1511  025c 721d5244      	bres	21060,#6
1512                     ; 420   UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1514  0260 54            	srlw	x
1515  0261 54            	srlw	x
1516  0262 9f            	ld	a,xl
1517  0263 a440          	and	a,#64
1518  0265 ca5244        	or	a,21060
1519  0268 c75244        	ld	21060,a
1520                     ; 423   UART3->DR   = (uint8_t)(Data);                    
1522  026b 7b02          	ld	a,(OFST+2,sp)
1523  026d c75241        	ld	21057,a
1524                     ; 424 }
1527  0270 85            	popw	x
1528  0271 81            	ret
1551                     ; 431 void UART3_SendBreak(void)
1551                     ; 432 {
1552                     	switch	.text
1553  0272               _UART3_SendBreak:
1557                     ; 433   UART3->CR2 |= UART3_CR2_SBK;
1559  0272 72105245      	bset	21061,#0
1560                     ; 434 }
1563  0276 81            	ret
1595                     ; 441 void UART3_SetAddress(uint8_t UART3_Address)
1595                     ; 442 {
1596                     	switch	.text
1597  0277               _UART3_SetAddress:
1599  0277 88            	push	a
1600       00000000      OFST:	set	0
1603                     ; 444   assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1605                     ; 447   UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1607  0278 c65247        	ld	a,21063
1608  027b a4f0          	and	a,#240
1609  027d c75247        	ld	21063,a
1610                     ; 449   UART3->CR4 |= UART3_Address;
1612  0280 c65247        	ld	a,21063
1613  0283 1a01          	or	a,(OFST+1,sp)
1614  0285 c75247        	ld	21063,a
1615                     ; 450 }
1618  0288 84            	pop	a
1619  0289 81            	ret
1776                     ; 458 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
1776                     ; 459 {
1777                     	switch	.text
1778  028a               _UART3_GetFlagStatus:
1780  028a 89            	pushw	x
1781  028b 88            	push	a
1782       00000001      OFST:	set	1
1785                     ; 460   FlagStatus status = RESET;
1787                     ; 463   assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
1789                     ; 466   if (UART3_FLAG == UART3_FLAG_LBDF)
1791  028c a30210        	cpw	x,#528
1792  028f 2610          	jrne	L317
1793                     ; 468     if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1795  0291 9f            	ld	a,xl
1796  0292 c45247        	and	a,21063
1797  0295 2706          	jreq	L517
1798                     ; 471       status = SET;
1800  0297 a601          	ld	a,#1
1801  0299 6b01          	ld	(OFST+0,sp),a
1804  029b 2039          	jra	L127
1805  029d               L517:
1806                     ; 476       status = RESET;
1808  029d 0f01          	clr	(OFST+0,sp)
1810  029f 2035          	jra	L127
1811  02a1               L317:
1812                     ; 479   else if (UART3_FLAG == UART3_FLAG_SBK)
1814  02a1 1e02          	ldw	x,(OFST+1,sp)
1815  02a3 a30101        	cpw	x,#257
1816  02a6 2611          	jrne	L327
1817                     ; 481     if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1819  02a8 c65245        	ld	a,21061
1820  02ab 1503          	bcp	a,(OFST+2,sp)
1821  02ad 2706          	jreq	L527
1822                     ; 484       status = SET;
1824  02af a601          	ld	a,#1
1825  02b1 6b01          	ld	(OFST+0,sp),a
1828  02b3 2021          	jra	L127
1829  02b5               L527:
1830                     ; 489       status = RESET;
1832  02b5 0f01          	clr	(OFST+0,sp)
1834  02b7 201d          	jra	L127
1835  02b9               L327:
1836                     ; 492   else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
1838  02b9 1e02          	ldw	x,(OFST+1,sp)
1839  02bb a30302        	cpw	x,#770
1840  02be 2707          	jreq	L537
1842  02c0 1e02          	ldw	x,(OFST+1,sp)
1843  02c2 a30301        	cpw	x,#769
1844  02c5 2614          	jrne	L337
1845  02c7               L537:
1846                     ; 494     if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1848  02c7 c65249        	ld	a,21065
1849  02ca 1503          	bcp	a,(OFST+2,sp)
1850  02cc 2706          	jreq	L737
1851                     ; 497       status = SET;
1853  02ce a601          	ld	a,#1
1854  02d0 6b01          	ld	(OFST+0,sp),a
1857  02d2 2002          	jra	L127
1858  02d4               L737:
1859                     ; 502       status = RESET;
1861  02d4 0f01          	clr	(OFST+0,sp)
1863  02d6               L127:
1864                     ; 520   return  status;
1866  02d6 7b01          	ld	a,(OFST+0,sp)
1869  02d8 5b03          	addw	sp,#3
1870  02da 81            	ret
1871  02db               L337:
1872                     ; 507     if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1874  02db c65240        	ld	a,21056
1875  02de 1503          	bcp	a,(OFST+2,sp)
1876  02e0 2706          	jreq	L547
1877                     ; 510       status = SET;
1879  02e2 a601          	ld	a,#1
1880  02e4 6b01          	ld	(OFST+0,sp),a
1883  02e6 20ee          	jra	L127
1884  02e8               L547:
1885                     ; 515       status = RESET;
1887  02e8 0f01          	clr	(OFST+0,sp)
1889  02ea 20ea          	jra	L127
1924                     ; 551 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
1924                     ; 552 {
1925                     	switch	.text
1926  02ec               _UART3_ClearFlag:
1928  02ec 89            	pushw	x
1929       00000000      OFST:	set	0
1932                     ; 554   assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
1934                     ; 557   if (UART3_FLAG == UART3_FLAG_RXNE)
1936  02ed a30020        	cpw	x,#32
1937  02f0 2606          	jrne	L767
1938                     ; 559     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
1940  02f2 35df5240      	mov	21056,#223
1942  02f6 201e          	jra	L177
1943  02f8               L767:
1944                     ; 562   else if (UART3_FLAG == UART3_FLAG_LBDF)
1946  02f8 1e01          	ldw	x,(OFST+1,sp)
1947  02fa a30210        	cpw	x,#528
1948  02fd 2606          	jrne	L377
1949                     ; 564     UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
1951  02ff 72195247      	bres	21063,#4
1953  0303 2011          	jra	L177
1954  0305               L377:
1955                     ; 567   else if (UART3_FLAG == UART3_FLAG_LHDF)
1957  0305 1e01          	ldw	x,(OFST+1,sp)
1958  0307 a30302        	cpw	x,#770
1959  030a 2606          	jrne	L777
1960                     ; 569     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
1962  030c 72135249      	bres	21065,#1
1964  0310 2004          	jra	L177
1965  0312               L777:
1966                     ; 574     UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
1968  0312 72115249      	bres	21065,#0
1969  0316               L177:
1970                     ; 576 }
1973  0316 85            	popw	x
1974  0317 81            	ret
2048                     ; 591 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2048                     ; 592 {
2049                     	switch	.text
2050  0318               _UART3_GetITStatus:
2052  0318 89            	pushw	x
2053  0319 89            	pushw	x
2054       00000002      OFST:	set	2
2057                     ; 593   ITStatus pendingbitstatus = RESET;
2059                     ; 594   uint8_t itpos = 0;
2061                     ; 595   uint8_t itmask1 = 0;
2063                     ; 596   uint8_t itmask2 = 0;
2065                     ; 597   uint8_t enablestatus = 0;
2067                     ; 600   assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2069                     ; 603   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2071  031a 9f            	ld	a,xl
2072  031b a40f          	and	a,#15
2073  031d 5f            	clrw	x
2074  031e 97            	ld	xl,a
2075  031f a601          	ld	a,#1
2076  0321 5d            	tnzw	x
2077  0322 2704          	jreq	L65
2078  0324               L06:
2079  0324 48            	sll	a
2080  0325 5a            	decw	x
2081  0326 26fc          	jrne	L06
2082  0328               L65:
2083  0328 6b01          	ld	(OFST-1,sp),a
2085                     ; 605   itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2087  032a 7b04          	ld	a,(OFST+2,sp)
2088  032c 4e            	swap	a
2089  032d a40f          	and	a,#15
2090  032f 6b02          	ld	(OFST+0,sp),a
2092                     ; 607   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2094  0331 7b02          	ld	a,(OFST+0,sp)
2095  0333 5f            	clrw	x
2096  0334 97            	ld	xl,a
2097  0335 a601          	ld	a,#1
2098  0337 5d            	tnzw	x
2099  0338 2704          	jreq	L26
2100  033a               L46:
2101  033a 48            	sll	a
2102  033b 5a            	decw	x
2103  033c 26fc          	jrne	L46
2104  033e               L26:
2105  033e 6b02          	ld	(OFST+0,sp),a
2107                     ; 610   if (UART3_IT == UART3_IT_PE)
2109  0340 1e03          	ldw	x,(OFST+1,sp)
2110  0342 a30100        	cpw	x,#256
2111  0345 261c          	jrne	L5301
2112                     ; 613     enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2114  0347 c65244        	ld	a,21060
2115  034a 1402          	and	a,(OFST+0,sp)
2116  034c 6b02          	ld	(OFST+0,sp),a
2118                     ; 616     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2120  034e c65240        	ld	a,21056
2121  0351 1501          	bcp	a,(OFST-1,sp)
2122  0353 270a          	jreq	L7301
2124  0355 0d02          	tnz	(OFST+0,sp)
2125  0357 2706          	jreq	L7301
2126                     ; 619       pendingbitstatus = SET;
2128  0359 a601          	ld	a,#1
2129  035b 6b02          	ld	(OFST+0,sp),a
2132  035d 2064          	jra	L3401
2133  035f               L7301:
2134                     ; 624       pendingbitstatus = RESET;
2136  035f 0f02          	clr	(OFST+0,sp)
2138  0361 2060          	jra	L3401
2139  0363               L5301:
2140                     ; 627   else if (UART3_IT == UART3_IT_LBDF)
2142  0363 1e03          	ldw	x,(OFST+1,sp)
2143  0365 a30346        	cpw	x,#838
2144  0368 261c          	jrne	L5401
2145                     ; 630     enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2147  036a c65247        	ld	a,21063
2148  036d 1402          	and	a,(OFST+0,sp)
2149  036f 6b02          	ld	(OFST+0,sp),a
2151                     ; 632     if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2153  0371 c65247        	ld	a,21063
2154  0374 1501          	bcp	a,(OFST-1,sp)
2155  0376 270a          	jreq	L7401
2157  0378 0d02          	tnz	(OFST+0,sp)
2158  037a 2706          	jreq	L7401
2159                     ; 635       pendingbitstatus = SET;
2161  037c a601          	ld	a,#1
2162  037e 6b02          	ld	(OFST+0,sp),a
2165  0380 2041          	jra	L3401
2166  0382               L7401:
2167                     ; 640       pendingbitstatus = RESET;
2169  0382 0f02          	clr	(OFST+0,sp)
2171  0384 203d          	jra	L3401
2172  0386               L5401:
2173                     ; 643   else if (UART3_IT == UART3_IT_LHDF)
2175  0386 1e03          	ldw	x,(OFST+1,sp)
2176  0388 a30412        	cpw	x,#1042
2177  038b 261c          	jrne	L5501
2178                     ; 646     enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2180  038d c65249        	ld	a,21065
2181  0390 1402          	and	a,(OFST+0,sp)
2182  0392 6b02          	ld	(OFST+0,sp),a
2184                     ; 648     if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2186  0394 c65249        	ld	a,21065
2187  0397 1501          	bcp	a,(OFST-1,sp)
2188  0399 270a          	jreq	L7501
2190  039b 0d02          	tnz	(OFST+0,sp)
2191  039d 2706          	jreq	L7501
2192                     ; 651       pendingbitstatus = SET;
2194  039f a601          	ld	a,#1
2195  03a1 6b02          	ld	(OFST+0,sp),a
2198  03a3 201e          	jra	L3401
2199  03a5               L7501:
2200                     ; 656       pendingbitstatus = RESET;
2202  03a5 0f02          	clr	(OFST+0,sp)
2204  03a7 201a          	jra	L3401
2205  03a9               L5501:
2206                     ; 662     enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2208  03a9 c65245        	ld	a,21061
2209  03ac 1402          	and	a,(OFST+0,sp)
2210  03ae 6b02          	ld	(OFST+0,sp),a
2212                     ; 664     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2214  03b0 c65240        	ld	a,21056
2215  03b3 1501          	bcp	a,(OFST-1,sp)
2216  03b5 270a          	jreq	L5601
2218  03b7 0d02          	tnz	(OFST+0,sp)
2219  03b9 2706          	jreq	L5601
2220                     ; 667       pendingbitstatus = SET;
2222  03bb a601          	ld	a,#1
2223  03bd 6b02          	ld	(OFST+0,sp),a
2226  03bf 2002          	jra	L3401
2227  03c1               L5601:
2228                     ; 672       pendingbitstatus = RESET;
2230  03c1 0f02          	clr	(OFST+0,sp)
2232  03c3               L3401:
2233                     ; 676   return  pendingbitstatus;
2235  03c3 7b02          	ld	a,(OFST+0,sp)
2238  03c5 5b04          	addw	sp,#4
2239  03c7 81            	ret
2275                     ; 706 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2275                     ; 707 {
2276                     	switch	.text
2277  03c8               _UART3_ClearITPendingBit:
2279  03c8 89            	pushw	x
2280       00000000      OFST:	set	0
2283                     ; 709   assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2285                     ; 712   if (UART3_IT == UART3_IT_RXNE)
2287  03c9 a30255        	cpw	x,#597
2288  03cc 2606          	jrne	L7011
2289                     ; 714     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2291  03ce 35df5240      	mov	21056,#223
2293  03d2 2011          	jra	L1111
2294  03d4               L7011:
2295                     ; 717   else if (UART3_IT == UART3_IT_LBDF)
2297  03d4 1e01          	ldw	x,(OFST+1,sp)
2298  03d6 a30346        	cpw	x,#838
2299  03d9 2606          	jrne	L3111
2300                     ; 719     UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2302  03db 72195247      	bres	21063,#4
2304  03df 2004          	jra	L1111
2305  03e1               L3111:
2306                     ; 724     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2308  03e1 72135249      	bres	21065,#1
2309  03e5               L1111:
2310                     ; 726 }
2313  03e5 85            	popw	x
2314  03e6 81            	ret
2327                     	xdef	_UART3_ClearITPendingBit
2328                     	xdef	_UART3_GetITStatus
2329                     	xdef	_UART3_ClearFlag
2330                     	xdef	_UART3_GetFlagStatus
2331                     	xdef	_UART3_SetAddress
2332                     	xdef	_UART3_SendBreak
2333                     	xdef	_UART3_SendData9
2334                     	xdef	_UART3_SendData8
2335                     	xdef	_UART3_ReceiveData9
2336                     	xdef	_UART3_ReceiveData8
2337                     	xdef	_UART3_WakeUpConfig
2338                     	xdef	_UART3_ReceiverWakeUpCmd
2339                     	xdef	_UART3_LINCmd
2340                     	xdef	_UART3_LINConfig
2341                     	xdef	_UART3_LINBreakDetectionConfig
2342                     	xdef	_UART3_ITConfig
2343                     	xdef	_UART3_Cmd
2344                     	xdef	_UART3_Init
2345                     	xdef	_UART3_DeInit
2346                     	xref	_CLK_GetClockFreq
2347                     	xref.b	c_lreg
2348                     	xref.b	c_x
2367                     	xref	c_lursh
2368                     	xref	c_lsub
2369                     	xref	c_smul
2370                     	xref	c_ludv
2371                     	xref	c_rtol
2372                     	xref	c_llsh
2373                     	xref	c_ltor
2374                     	end
