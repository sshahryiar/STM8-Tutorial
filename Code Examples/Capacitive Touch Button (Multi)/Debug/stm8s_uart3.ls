   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
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
 306                     .const:	section	.text
 307  0000               L01:
 308  0000 00000064      	dc.l	100
 309                     ; 83 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 309                     ; 84                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 309                     ; 85                 UART3_Mode_TypeDef Mode)
 309                     ; 86 {
 310                     	switch	.text
 311  0023               _UART3_Init:
 313  0023 520e          	subw	sp,#14
 314       0000000e      OFST:	set	14
 317                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 321                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 325                     ; 91   assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 327                     ; 92   assert_param(IS_UART3_STOPBITS_OK(StopBits));
 329                     ; 93   assert_param(IS_UART3_PARITY_OK(Parity));
 331                     ; 94   assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 333                     ; 95   assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 335                     ; 98   UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 337  0025 72195244      	bres	21060,#4
 338                     ; 100   UART3->CR1 |= (uint8_t)WordLength; 
 340  0029 c65244        	ld	a,21060
 341  002c 1a15          	or	a,(OFST+7,sp)
 342  002e c75244        	ld	21060,a
 343                     ; 103   UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 345  0031 c65246        	ld	a,21062
 346  0034 a4cf          	and	a,#207
 347  0036 c75246        	ld	21062,a
 348                     ; 105   UART3->CR3 |= (uint8_t)StopBits;  
 350  0039 c65246        	ld	a,21062
 351  003c 1a16          	or	a,(OFST+8,sp)
 352  003e c75246        	ld	21062,a
 353                     ; 108   UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 355  0041 c65244        	ld	a,21060
 356  0044 a4f9          	and	a,#249
 357  0046 c75244        	ld	21060,a
 358                     ; 110   UART3->CR1 |= (uint8_t)Parity;     
 360  0049 c65244        	ld	a,21060
 361  004c 1a17          	or	a,(OFST+9,sp)
 362  004e c75244        	ld	21060,a
 363                     ; 113   UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 365  0051 725f5242      	clr	21058
 366                     ; 115   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 368  0055 c65243        	ld	a,21059
 369  0058 a40f          	and	a,#15
 370  005a c75243        	ld	21059,a
 371                     ; 117   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 373  005d c65243        	ld	a,21059
 374  0060 a4f0          	and	a,#240
 375  0062 c75243        	ld	21059,a
 376                     ; 120   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 378  0065 96            	ldw	x,sp
 379  0066 1c0011        	addw	x,#OFST+3
 380  0069 cd0000        	call	c_ltor
 382  006c a604          	ld	a,#4
 383  006e cd0000        	call	c_llsh
 385  0071 96            	ldw	x,sp
 386  0072 1c0001        	addw	x,#OFST-13
 387  0075 cd0000        	call	c_rtol
 390  0078 cd0000        	call	_CLK_GetClockFreq
 392  007b 96            	ldw	x,sp
 393  007c 1c0001        	addw	x,#OFST-13
 394  007f cd0000        	call	c_ludv
 396  0082 96            	ldw	x,sp
 397  0083 1c000b        	addw	x,#OFST-3
 398  0086 cd0000        	call	c_rtol
 401                     ; 121   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 403  0089 96            	ldw	x,sp
 404  008a 1c0011        	addw	x,#OFST+3
 405  008d cd0000        	call	c_ltor
 407  0090 a604          	ld	a,#4
 408  0092 cd0000        	call	c_llsh
 410  0095 96            	ldw	x,sp
 411  0096 1c0001        	addw	x,#OFST-13
 412  0099 cd0000        	call	c_rtol
 415  009c cd0000        	call	_CLK_GetClockFreq
 417  009f a664          	ld	a,#100
 418  00a1 cd0000        	call	c_smul
 420  00a4 96            	ldw	x,sp
 421  00a5 1c0001        	addw	x,#OFST-13
 422  00a8 cd0000        	call	c_ludv
 424  00ab 96            	ldw	x,sp
 425  00ac 1c0007        	addw	x,#OFST-7
 426  00af cd0000        	call	c_rtol
 429                     ; 124   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 429                     ; 125                                 << 4) / 100) & (uint8_t)0x0F); 
 431  00b2 96            	ldw	x,sp
 432  00b3 1c000b        	addw	x,#OFST-3
 433  00b6 cd0000        	call	c_ltor
 435  00b9 a664          	ld	a,#100
 436  00bb cd0000        	call	c_smul
 438  00be 96            	ldw	x,sp
 439  00bf 1c0001        	addw	x,#OFST-13
 440  00c2 cd0000        	call	c_rtol
 443  00c5 96            	ldw	x,sp
 444  00c6 1c0007        	addw	x,#OFST-7
 445  00c9 cd0000        	call	c_ltor
 447  00cc 96            	ldw	x,sp
 448  00cd 1c0001        	addw	x,#OFST-13
 449  00d0 cd0000        	call	c_lsub
 451  00d3 a604          	ld	a,#4
 452  00d5 cd0000        	call	c_llsh
 454  00d8 ae0000        	ldw	x,#L01
 455  00db cd0000        	call	c_ludv
 457  00de b603          	ld	a,c_lreg+3
 458  00e0 a40f          	and	a,#15
 459  00e2 6b05          	ld	(OFST-9,sp),a
 461                     ; 126   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 463  00e4 96            	ldw	x,sp
 464  00e5 1c000b        	addw	x,#OFST-3
 465  00e8 cd0000        	call	c_ltor
 467  00eb a604          	ld	a,#4
 468  00ed cd0000        	call	c_lursh
 470  00f0 b603          	ld	a,c_lreg+3
 471  00f2 a4f0          	and	a,#240
 472  00f4 b703          	ld	c_lreg+3,a
 473  00f6 3f02          	clr	c_lreg+2
 474  00f8 3f01          	clr	c_lreg+1
 475  00fa 3f00          	clr	c_lreg
 476  00fc b603          	ld	a,c_lreg+3
 477  00fe 6b06          	ld	(OFST-8,sp),a
 479                     ; 128   UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 481  0100 7b05          	ld	a,(OFST-9,sp)
 482  0102 1a06          	or	a,(OFST-8,sp)
 483  0104 c75243        	ld	21059,a
 484                     ; 130   UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 486  0107 7b0e          	ld	a,(OFST+0,sp)
 487  0109 c75242        	ld	21058,a
 488                     ; 132   if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 490  010c 7b18          	ld	a,(OFST+10,sp)
 491  010e a504          	bcp	a,#4
 492  0110 2706          	jreq	L741
 493                     ; 135     UART3->CR2 |= UART3_CR2_TEN;  
 495  0112 72165245      	bset	21061,#3
 497  0116 2004          	jra	L151
 498  0118               L741:
 499                     ; 140     UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 501  0118 72175245      	bres	21061,#3
 502  011c               L151:
 503                     ; 142   if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 505  011c 7b18          	ld	a,(OFST+10,sp)
 506  011e a508          	bcp	a,#8
 507  0120 2706          	jreq	L351
 508                     ; 145     UART3->CR2 |= UART3_CR2_REN;  
 510  0122 72145245      	bset	21061,#2
 512  0126 2004          	jra	L551
 513  0128               L351:
 514                     ; 150     UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 516  0128 72155245      	bres	21061,#2
 517  012c               L551:
 518                     ; 152 }
 521  012c 5b0e          	addw	sp,#14
 522  012e 81            	ret
 577                     ; 160 void UART3_Cmd(FunctionalState NewState)
 577                     ; 161 {
 578                     	switch	.text
 579  012f               _UART3_Cmd:
 583                     ; 162   if (NewState != DISABLE)
 585  012f 4d            	tnz	a
 586  0130 2706          	jreq	L502
 587                     ; 165     UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 589  0132 721b5244      	bres	21060,#5
 591  0136 2004          	jra	L702
 592  0138               L502:
 593                     ; 170     UART3->CR1 |= UART3_CR1_UARTD;  
 595  0138 721a5244      	bset	21060,#5
 596  013c               L702:
 597                     ; 172 }
 600  013c 81            	ret
 732                     ; 189 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 732                     ; 190 {
 733                     	switch	.text
 734  013d               _UART3_ITConfig:
 736  013d 89            	pushw	x
 737  013e 89            	pushw	x
 738       00000002      OFST:	set	2
 741                     ; 191   uint8_t uartreg = 0, itpos = 0x00;
 745                     ; 194   assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 747                     ; 195   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 749                     ; 198   uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 751  013f 9e            	ld	a,xh
 752  0140 6b01          	ld	(OFST-1,sp),a
 754                     ; 201   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 756  0142 9f            	ld	a,xl
 757  0143 a40f          	and	a,#15
 758  0145 5f            	clrw	x
 759  0146 97            	ld	xl,a
 760  0147 a601          	ld	a,#1
 761  0149 5d            	tnzw	x
 762  014a 2704          	jreq	L61
 763  014c               L02:
 764  014c 48            	sll	a
 765  014d 5a            	decw	x
 766  014e 26fc          	jrne	L02
 767  0150               L61:
 768  0150 6b02          	ld	(OFST+0,sp),a
 770                     ; 203   if (NewState != DISABLE)
 772  0152 0d07          	tnz	(OFST+5,sp)
 773  0154 273a          	jreq	L172
 774                     ; 206     if (uartreg == 0x01)
 776  0156 7b01          	ld	a,(OFST-1,sp)
 777  0158 a101          	cp	a,#1
 778  015a 260a          	jrne	L372
 779                     ; 208       UART3->CR1 |= itpos;
 781  015c c65244        	ld	a,21060
 782  015f 1a02          	or	a,(OFST+0,sp)
 783  0161 c75244        	ld	21060,a
 785  0164 2066          	jra	L703
 786  0166               L372:
 787                     ; 210     else if (uartreg == 0x02)
 789  0166 7b01          	ld	a,(OFST-1,sp)
 790  0168 a102          	cp	a,#2
 791  016a 260a          	jrne	L772
 792                     ; 212       UART3->CR2 |= itpos;
 794  016c c65245        	ld	a,21061
 795  016f 1a02          	or	a,(OFST+0,sp)
 796  0171 c75245        	ld	21061,a
 798  0174 2056          	jra	L703
 799  0176               L772:
 800                     ; 214     else if (uartreg == 0x03)
 802  0176 7b01          	ld	a,(OFST-1,sp)
 803  0178 a103          	cp	a,#3
 804  017a 260a          	jrne	L303
 805                     ; 216       UART3->CR4 |= itpos;
 807  017c c65247        	ld	a,21063
 808  017f 1a02          	or	a,(OFST+0,sp)
 809  0181 c75247        	ld	21063,a
 811  0184 2046          	jra	L703
 812  0186               L303:
 813                     ; 220       UART3->CR6 |= itpos;
 815  0186 c65249        	ld	a,21065
 816  0189 1a02          	or	a,(OFST+0,sp)
 817  018b c75249        	ld	21065,a
 818  018e 203c          	jra	L703
 819  0190               L172:
 820                     ; 226     if (uartreg == 0x01)
 822  0190 7b01          	ld	a,(OFST-1,sp)
 823  0192 a101          	cp	a,#1
 824  0194 260b          	jrne	L113
 825                     ; 228       UART3->CR1 &= (uint8_t)(~itpos);
 827  0196 7b02          	ld	a,(OFST+0,sp)
 828  0198 43            	cpl	a
 829  0199 c45244        	and	a,21060
 830  019c c75244        	ld	21060,a
 832  019f 202b          	jra	L703
 833  01a1               L113:
 834                     ; 230     else if (uartreg == 0x02)
 836  01a1 7b01          	ld	a,(OFST-1,sp)
 837  01a3 a102          	cp	a,#2
 838  01a5 260b          	jrne	L513
 839                     ; 232       UART3->CR2 &= (uint8_t)(~itpos);
 841  01a7 7b02          	ld	a,(OFST+0,sp)
 842  01a9 43            	cpl	a
 843  01aa c45245        	and	a,21061
 844  01ad c75245        	ld	21061,a
 846  01b0 201a          	jra	L703
 847  01b2               L513:
 848                     ; 234     else if (uartreg == 0x03)
 850  01b2 7b01          	ld	a,(OFST-1,sp)
 851  01b4 a103          	cp	a,#3
 852  01b6 260b          	jrne	L123
 853                     ; 236       UART3->CR4 &= (uint8_t)(~itpos);
 855  01b8 7b02          	ld	a,(OFST+0,sp)
 856  01ba 43            	cpl	a
 857  01bb c45247        	and	a,21063
 858  01be c75247        	ld	21063,a
 860  01c1 2009          	jra	L703
 861  01c3               L123:
 862                     ; 240       UART3->CR6 &= (uint8_t)(~itpos);
 864  01c3 7b02          	ld	a,(OFST+0,sp)
 865  01c5 43            	cpl	a
 866  01c6 c45249        	and	a,21065
 867  01c9 c75249        	ld	21065,a
 868  01cc               L703:
 869                     ; 243 }
 872  01cc 5b04          	addw	sp,#4
 873  01ce 81            	ret
 932                     ; 252 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
 932                     ; 253 {
 933                     	switch	.text
 934  01cf               _UART3_LINBreakDetectionConfig:
 938                     ; 255   assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
 940                     ; 257   if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
 942  01cf 4d            	tnz	a
 943  01d0 2706          	jreq	L353
 944                     ; 259     UART3->CR4 |= UART3_CR4_LBDL;
 946  01d2 721a5247      	bset	21063,#5
 948  01d6 2004          	jra	L553
 949  01d8               L353:
 950                     ; 263     UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
 952  01d8 721b5247      	bres	21063,#5
 953  01dc               L553:
 954                     ; 265 }
 957  01dc 81            	ret
1078                     ; 277 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1078                     ; 278                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1078                     ; 279                      UART3_LinDivUp_TypeDef UART3_DivUp)
1078                     ; 280 {
1079                     	switch	.text
1080  01dd               _UART3_LINConfig:
1082  01dd 89            	pushw	x
1083       00000000      OFST:	set	0
1086                     ; 282   assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1088                     ; 283   assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1090                     ; 284   assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1092                     ; 286   if (UART3_Mode != UART3_LIN_MODE_MASTER)
1094  01de 9e            	ld	a,xh
1095  01df 4d            	tnz	a
1096  01e0 2706          	jreq	L534
1097                     ; 288     UART3->CR6 |=  UART3_CR6_LSLV;
1099  01e2 721a5249      	bset	21065,#5
1101  01e6 2004          	jra	L734
1102  01e8               L534:
1103                     ; 292     UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1105  01e8 721b5249      	bres	21065,#5
1106  01ec               L734:
1107                     ; 295   if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1109  01ec 0d02          	tnz	(OFST+2,sp)
1110  01ee 2706          	jreq	L144
1111                     ; 297     UART3->CR6 |=  UART3_CR6_LASE ;
1113  01f0 72185249      	bset	21065,#4
1115  01f4 2004          	jra	L344
1116  01f6               L144:
1117                     ; 301     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1119  01f6 72195249      	bres	21065,#4
1120  01fa               L344:
1121                     ; 304   if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1123  01fa 0d05          	tnz	(OFST+5,sp)
1124  01fc 2706          	jreq	L544
1125                     ; 306     UART3->CR6 |=  UART3_CR6_LDUM;
1127  01fe 721e5249      	bset	21065,#7
1129  0202 2004          	jra	L744
1130  0204               L544:
1131                     ; 310     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1133  0204 721f5249      	bres	21065,#7
1134  0208               L744:
1135                     ; 312 }
1138  0208 85            	popw	x
1139  0209 81            	ret
1174                     ; 320 void UART3_LINCmd(FunctionalState NewState)
1174                     ; 321 {
1175                     	switch	.text
1176  020a               _UART3_LINCmd:
1180                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1182                     ; 325   if (NewState != DISABLE)
1184  020a 4d            	tnz	a
1185  020b 2706          	jreq	L764
1186                     ; 328     UART3->CR3 |= UART3_CR3_LINEN;
1188  020d 721c5246      	bset	21062,#6
1190  0211 2004          	jra	L174
1191  0213               L764:
1192                     ; 333     UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1194  0213 721d5246      	bres	21062,#6
1195  0217               L174:
1196                     ; 335 }
1199  0217 81            	ret
1256                     ; 343 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1256                     ; 344 {
1257                     	switch	.text
1258  0218               _UART3_WakeUpConfig:
1262                     ; 346   assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1264                     ; 348   UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1266  0218 72175244      	bres	21060,#3
1267                     ; 349   UART3->CR1 |= (uint8_t)UART3_WakeUp;
1269  021c ca5244        	or	a,21060
1270  021f c75244        	ld	21060,a
1271                     ; 350 }
1274  0222 81            	ret
1310                     ; 358 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1310                     ; 359 {
1311                     	switch	.text
1312  0223               _UART3_ReceiverWakeUpCmd:
1316                     ; 361   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1318                     ; 363   if (NewState != DISABLE)
1320  0223 4d            	tnz	a
1321  0224 2706          	jreq	L735
1322                     ; 366     UART3->CR2 |= UART3_CR2_RWU;
1324  0226 72125245      	bset	21061,#1
1326  022a 2004          	jra	L145
1327  022c               L735:
1328                     ; 371     UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1330  022c 72135245      	bres	21061,#1
1331  0230               L145:
1332                     ; 373 }
1335  0230 81            	ret
1358                     ; 380 uint8_t UART3_ReceiveData8(void)
1358                     ; 381 {
1359                     	switch	.text
1360  0231               _UART3_ReceiveData8:
1364                     ; 382   return ((uint8_t)UART3->DR);
1366  0231 c65241        	ld	a,21057
1369  0234 81            	ret
1403                     ; 390 uint16_t UART3_ReceiveData9(void)
1403                     ; 391 {
1404                     	switch	.text
1405  0235               _UART3_ReceiveData9:
1407  0235 89            	pushw	x
1408       00000002      OFST:	set	2
1411                     ; 392   uint16_t temp = 0;
1413                     ; 394   temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1415  0236 c65244        	ld	a,21060
1416  0239 5f            	clrw	x
1417  023a a480          	and	a,#128
1418  023c 5f            	clrw	x
1419  023d 02            	rlwa	x,a
1420  023e 58            	sllw	x
1421  023f 1f01          	ldw	(OFST-1,sp),x
1423                     ; 395   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1425  0241 c65241        	ld	a,21057
1426  0244 5f            	clrw	x
1427  0245 97            	ld	xl,a
1428  0246 01            	rrwa	x,a
1429  0247 1a02          	or	a,(OFST+0,sp)
1430  0249 01            	rrwa	x,a
1431  024a 1a01          	or	a,(OFST-1,sp)
1432  024c 01            	rrwa	x,a
1433  024d 01            	rrwa	x,a
1434  024e a4ff          	and	a,#255
1435  0250 01            	rrwa	x,a
1436  0251 a401          	and	a,#1
1437  0253 01            	rrwa	x,a
1440  0254 5b02          	addw	sp,#2
1441  0256 81            	ret
1475                     ; 403 void UART3_SendData8(uint8_t Data)
1475                     ; 404 {
1476                     	switch	.text
1477  0257               _UART3_SendData8:
1481                     ; 406   UART3->DR = Data;
1483  0257 c75241        	ld	21057,a
1484                     ; 407 }
1487  025a 81            	ret
1521                     ; 414 void UART3_SendData9(uint16_t Data)
1521                     ; 415 {
1522                     	switch	.text
1523  025b               _UART3_SendData9:
1525  025b 89            	pushw	x
1526       00000000      OFST:	set	0
1529                     ; 417   UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1531  025c 721d5244      	bres	21060,#6
1532                     ; 420   UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1534  0260 54            	srlw	x
1535  0261 54            	srlw	x
1536  0262 9f            	ld	a,xl
1537  0263 a440          	and	a,#64
1538  0265 ca5244        	or	a,21060
1539  0268 c75244        	ld	21060,a
1540                     ; 423   UART3->DR   = (uint8_t)(Data);                    
1542  026b 7b02          	ld	a,(OFST+2,sp)
1543  026d c75241        	ld	21057,a
1544                     ; 424 }
1547  0270 85            	popw	x
1548  0271 81            	ret
1571                     ; 431 void UART3_SendBreak(void)
1571                     ; 432 {
1572                     	switch	.text
1573  0272               _UART3_SendBreak:
1577                     ; 433   UART3->CR2 |= UART3_CR2_SBK;
1579  0272 72105245      	bset	21061,#0
1580                     ; 434 }
1583  0276 81            	ret
1617                     ; 441 void UART3_SetAddress(uint8_t UART3_Address)
1617                     ; 442 {
1618                     	switch	.text
1619  0277               _UART3_SetAddress:
1621  0277 88            	push	a
1622       00000000      OFST:	set	0
1625                     ; 444   assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1627                     ; 447   UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1629  0278 c65247        	ld	a,21063
1630  027b a4f0          	and	a,#240
1631  027d c75247        	ld	21063,a
1632                     ; 449   UART3->CR4 |= UART3_Address;
1634  0280 c65247        	ld	a,21063
1635  0283 1a01          	or	a,(OFST+1,sp)
1636  0285 c75247        	ld	21063,a
1637                     ; 450 }
1640  0288 84            	pop	a
1641  0289 81            	ret
1798                     ; 458 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
1798                     ; 459 {
1799                     	switch	.text
1800  028a               _UART3_GetFlagStatus:
1802  028a 89            	pushw	x
1803  028b 88            	push	a
1804       00000001      OFST:	set	1
1807                     ; 460   FlagStatus status = RESET;
1809                     ; 463   assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
1811                     ; 466   if (UART3_FLAG == UART3_FLAG_LBDF)
1813  028c a30210        	cpw	x,#528
1814  028f 2610          	jrne	L147
1815                     ; 468     if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1817  0291 9f            	ld	a,xl
1818  0292 c45247        	and	a,21063
1819  0295 2706          	jreq	L347
1820                     ; 471       status = SET;
1822  0297 a601          	ld	a,#1
1823  0299 6b01          	ld	(OFST+0,sp),a
1826  029b 2039          	jra	L747
1827  029d               L347:
1828                     ; 476       status = RESET;
1830  029d 0f01          	clr	(OFST+0,sp)
1832  029f 2035          	jra	L747
1833  02a1               L147:
1834                     ; 479   else if (UART3_FLAG == UART3_FLAG_SBK)
1836  02a1 1e02          	ldw	x,(OFST+1,sp)
1837  02a3 a30101        	cpw	x,#257
1838  02a6 2611          	jrne	L157
1839                     ; 481     if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1841  02a8 c65245        	ld	a,21061
1842  02ab 1503          	bcp	a,(OFST+2,sp)
1843  02ad 2706          	jreq	L357
1844                     ; 484       status = SET;
1846  02af a601          	ld	a,#1
1847  02b1 6b01          	ld	(OFST+0,sp),a
1850  02b3 2021          	jra	L747
1851  02b5               L357:
1852                     ; 489       status = RESET;
1854  02b5 0f01          	clr	(OFST+0,sp)
1856  02b7 201d          	jra	L747
1857  02b9               L157:
1858                     ; 492   else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
1860  02b9 1e02          	ldw	x,(OFST+1,sp)
1861  02bb a30302        	cpw	x,#770
1862  02be 2707          	jreq	L367
1864  02c0 1e02          	ldw	x,(OFST+1,sp)
1865  02c2 a30301        	cpw	x,#769
1866  02c5 2614          	jrne	L167
1867  02c7               L367:
1868                     ; 494     if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1870  02c7 c65249        	ld	a,21065
1871  02ca 1503          	bcp	a,(OFST+2,sp)
1872  02cc 2706          	jreq	L567
1873                     ; 497       status = SET;
1875  02ce a601          	ld	a,#1
1876  02d0 6b01          	ld	(OFST+0,sp),a
1879  02d2 2002          	jra	L747
1880  02d4               L567:
1881                     ; 502       status = RESET;
1883  02d4 0f01          	clr	(OFST+0,sp)
1885  02d6               L747:
1886                     ; 520   return  status;
1888  02d6 7b01          	ld	a,(OFST+0,sp)
1891  02d8 5b03          	addw	sp,#3
1892  02da 81            	ret
1893  02db               L167:
1894                     ; 507     if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1896  02db c65240        	ld	a,21056
1897  02de 1503          	bcp	a,(OFST+2,sp)
1898  02e0 2706          	jreq	L377
1899                     ; 510       status = SET;
1901  02e2 a601          	ld	a,#1
1902  02e4 6b01          	ld	(OFST+0,sp),a
1905  02e6 20ee          	jra	L747
1906  02e8               L377:
1907                     ; 515       status = RESET;
1909  02e8 0f01          	clr	(OFST+0,sp)
1911  02ea 20ea          	jra	L747
1946                     ; 551 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
1946                     ; 552 {
1947                     	switch	.text
1948  02ec               _UART3_ClearFlag:
1950  02ec 89            	pushw	x
1951       00000000      OFST:	set	0
1954                     ; 554   assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
1956                     ; 557   if (UART3_FLAG == UART3_FLAG_RXNE)
1958  02ed a30020        	cpw	x,#32
1959  02f0 2606          	jrne	L5101
1960                     ; 559     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
1962  02f2 35df5240      	mov	21056,#223
1964  02f6 201e          	jra	L7101
1965  02f8               L5101:
1966                     ; 562   else if (UART3_FLAG == UART3_FLAG_LBDF)
1968  02f8 1e01          	ldw	x,(OFST+1,sp)
1969  02fa a30210        	cpw	x,#528
1970  02fd 2606          	jrne	L1201
1971                     ; 564     UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
1973  02ff 72195247      	bres	21063,#4
1975  0303 2011          	jra	L7101
1976  0305               L1201:
1977                     ; 567   else if (UART3_FLAG == UART3_FLAG_LHDF)
1979  0305 1e01          	ldw	x,(OFST+1,sp)
1980  0307 a30302        	cpw	x,#770
1981  030a 2606          	jrne	L5201
1982                     ; 569     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
1984  030c 72135249      	bres	21065,#1
1986  0310 2004          	jra	L7101
1987  0312               L5201:
1988                     ; 574     UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
1990  0312 72115249      	bres	21065,#0
1991  0316               L7101:
1992                     ; 576 }
1995  0316 85            	popw	x
1996  0317 81            	ret
2078                     ; 591 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2078                     ; 592 {
2079                     	switch	.text
2080  0318               _UART3_GetITStatus:
2082  0318 89            	pushw	x
2083  0319 89            	pushw	x
2084       00000002      OFST:	set	2
2087                     ; 593   ITStatus pendingbitstatus = RESET;
2089                     ; 594   uint8_t itpos = 0;
2091                     ; 595   uint8_t itmask1 = 0;
2093                     ; 596   uint8_t itmask2 = 0;
2095                     ; 597   uint8_t enablestatus = 0;
2097                     ; 600   assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2099                     ; 603   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2101  031a 9f            	ld	a,xl
2102  031b a40f          	and	a,#15
2103  031d 5f            	clrw	x
2104  031e 97            	ld	xl,a
2105  031f a601          	ld	a,#1
2106  0321 5d            	tnzw	x
2107  0322 2704          	jreq	L65
2108  0324               L06:
2109  0324 48            	sll	a
2110  0325 5a            	decw	x
2111  0326 26fc          	jrne	L06
2112  0328               L65:
2113  0328 6b01          	ld	(OFST-1,sp),a
2115                     ; 605   itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2117  032a 7b04          	ld	a,(OFST+2,sp)
2118  032c 4e            	swap	a
2119  032d a40f          	and	a,#15
2120  032f 6b02          	ld	(OFST+0,sp),a
2122                     ; 607   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2124  0331 7b02          	ld	a,(OFST+0,sp)
2125  0333 5f            	clrw	x
2126  0334 97            	ld	xl,a
2127  0335 a601          	ld	a,#1
2128  0337 5d            	tnzw	x
2129  0338 2704          	jreq	L26
2130  033a               L46:
2131  033a 48            	sll	a
2132  033b 5a            	decw	x
2133  033c 26fc          	jrne	L46
2134  033e               L26:
2135  033e 6b02          	ld	(OFST+0,sp),a
2137                     ; 610   if (UART3_IT == UART3_IT_PE)
2139  0340 1e03          	ldw	x,(OFST+1,sp)
2140  0342 a30100        	cpw	x,#256
2141  0345 261c          	jrne	L3701
2142                     ; 613     enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2144  0347 c65244        	ld	a,21060
2145  034a 1402          	and	a,(OFST+0,sp)
2146  034c 6b02          	ld	(OFST+0,sp),a
2148                     ; 616     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2150  034e c65240        	ld	a,21056
2151  0351 1501          	bcp	a,(OFST-1,sp)
2152  0353 270a          	jreq	L5701
2154  0355 0d02          	tnz	(OFST+0,sp)
2155  0357 2706          	jreq	L5701
2156                     ; 619       pendingbitstatus = SET;
2158  0359 a601          	ld	a,#1
2159  035b 6b02          	ld	(OFST+0,sp),a
2162  035d 2064          	jra	L1011
2163  035f               L5701:
2164                     ; 624       pendingbitstatus = RESET;
2166  035f 0f02          	clr	(OFST+0,sp)
2168  0361 2060          	jra	L1011
2169  0363               L3701:
2170                     ; 627   else if (UART3_IT == UART3_IT_LBDF)
2172  0363 1e03          	ldw	x,(OFST+1,sp)
2173  0365 a30346        	cpw	x,#838
2174  0368 261c          	jrne	L3011
2175                     ; 630     enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2177  036a c65247        	ld	a,21063
2178  036d 1402          	and	a,(OFST+0,sp)
2179  036f 6b02          	ld	(OFST+0,sp),a
2181                     ; 632     if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2183  0371 c65247        	ld	a,21063
2184  0374 1501          	bcp	a,(OFST-1,sp)
2185  0376 270a          	jreq	L5011
2187  0378 0d02          	tnz	(OFST+0,sp)
2188  037a 2706          	jreq	L5011
2189                     ; 635       pendingbitstatus = SET;
2191  037c a601          	ld	a,#1
2192  037e 6b02          	ld	(OFST+0,sp),a
2195  0380 2041          	jra	L1011
2196  0382               L5011:
2197                     ; 640       pendingbitstatus = RESET;
2199  0382 0f02          	clr	(OFST+0,sp)
2201  0384 203d          	jra	L1011
2202  0386               L3011:
2203                     ; 643   else if (UART3_IT == UART3_IT_LHDF)
2205  0386 1e03          	ldw	x,(OFST+1,sp)
2206  0388 a30412        	cpw	x,#1042
2207  038b 261c          	jrne	L3111
2208                     ; 646     enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2210  038d c65249        	ld	a,21065
2211  0390 1402          	and	a,(OFST+0,sp)
2212  0392 6b02          	ld	(OFST+0,sp),a
2214                     ; 648     if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2216  0394 c65249        	ld	a,21065
2217  0397 1501          	bcp	a,(OFST-1,sp)
2218  0399 270a          	jreq	L5111
2220  039b 0d02          	tnz	(OFST+0,sp)
2221  039d 2706          	jreq	L5111
2222                     ; 651       pendingbitstatus = SET;
2224  039f a601          	ld	a,#1
2225  03a1 6b02          	ld	(OFST+0,sp),a
2228  03a3 201e          	jra	L1011
2229  03a5               L5111:
2230                     ; 656       pendingbitstatus = RESET;
2232  03a5 0f02          	clr	(OFST+0,sp)
2234  03a7 201a          	jra	L1011
2235  03a9               L3111:
2236                     ; 662     enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2238  03a9 c65245        	ld	a,21061
2239  03ac 1402          	and	a,(OFST+0,sp)
2240  03ae 6b02          	ld	(OFST+0,sp),a
2242                     ; 664     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2244  03b0 c65240        	ld	a,21056
2245  03b3 1501          	bcp	a,(OFST-1,sp)
2246  03b5 270a          	jreq	L3211
2248  03b7 0d02          	tnz	(OFST+0,sp)
2249  03b9 2706          	jreq	L3211
2250                     ; 667       pendingbitstatus = SET;
2252  03bb a601          	ld	a,#1
2253  03bd 6b02          	ld	(OFST+0,sp),a
2256  03bf 2002          	jra	L1011
2257  03c1               L3211:
2258                     ; 672       pendingbitstatus = RESET;
2260  03c1 0f02          	clr	(OFST+0,sp)
2262  03c3               L1011:
2263                     ; 676   return  pendingbitstatus;
2265  03c3 7b02          	ld	a,(OFST+0,sp)
2268  03c5 5b04          	addw	sp,#4
2269  03c7 81            	ret
2305                     ; 706 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2305                     ; 707 {
2306                     	switch	.text
2307  03c8               _UART3_ClearITPendingBit:
2309  03c8 89            	pushw	x
2310       00000000      OFST:	set	0
2313                     ; 709   assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2315                     ; 712   if (UART3_IT == UART3_IT_RXNE)
2317  03c9 a30255        	cpw	x,#597
2318  03cc 2606          	jrne	L5411
2319                     ; 714     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2321  03ce 35df5240      	mov	21056,#223
2323  03d2 2011          	jra	L7411
2324  03d4               L5411:
2325                     ; 717   else if (UART3_IT == UART3_IT_LBDF)
2327  03d4 1e01          	ldw	x,(OFST+1,sp)
2328  03d6 a30346        	cpw	x,#838
2329  03d9 2606          	jrne	L1511
2330                     ; 719     UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2332  03db 72195247      	bres	21063,#4
2334  03df 2004          	jra	L7411
2335  03e1               L1511:
2336                     ; 724     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2338  03e1 72135249      	bres	21065,#1
2339  03e5               L7411:
2340                     ; 726 }
2343  03e5 85            	popw	x
2344  03e6 81            	ret
2357                     	xdef	_UART3_ClearITPendingBit
2358                     	xdef	_UART3_GetITStatus
2359                     	xdef	_UART3_ClearFlag
2360                     	xdef	_UART3_GetFlagStatus
2361                     	xdef	_UART3_SetAddress
2362                     	xdef	_UART3_SendBreak
2363                     	xdef	_UART3_SendData9
2364                     	xdef	_UART3_SendData8
2365                     	xdef	_UART3_ReceiveData9
2366                     	xdef	_UART3_ReceiveData8
2367                     	xdef	_UART3_WakeUpConfig
2368                     	xdef	_UART3_ReceiverWakeUpCmd
2369                     	xdef	_UART3_LINCmd
2370                     	xdef	_UART3_LINConfig
2371                     	xdef	_UART3_LINBreakDetectionConfig
2372                     	xdef	_UART3_ITConfig
2373                     	xdef	_UART3_Cmd
2374                     	xdef	_UART3_Init
2375                     	xdef	_UART3_DeInit
2376                     	xref	_CLK_GetClockFreq
2377                     	xref.b	c_lreg
2378                     	xref.b	c_x
2397                     	xref	c_lursh
2398                     	xref	c_lsub
2399                     	xref	c_smul
2400                     	xref	c_ludv
2401                     	xref	c_rtol
2402                     	xref	c_llsh
2403                     	xref	c_ltor
2404                     	end
