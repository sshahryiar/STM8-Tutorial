   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 53 void UART2_DeInit(void)
  42                     ; 54 {
  43                     	switch	.text
  44  0000               f_UART2_DeInit:
  48                     ; 57   (void) UART2->SR;
  50  0000 c65240        	ld	a,21056
  51                     ; 58   (void)UART2->DR;
  53  0003 c65241        	ld	a,21057
  54                     ; 60   UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  56  0006 725f5243      	clr	21059
  57                     ; 61   UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  59  000a 725f5242      	clr	21058
  60                     ; 63   UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  62  000e 725f5244      	clr	21060
  63                     ; 64   UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  65  0012 725f5245      	clr	21061
  66                     ; 65   UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  68  0016 725f5246      	clr	21062
  69                     ; 66   UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  71  001a 725f5247      	clr	21063
  72                     ; 67   UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  74  001e 725f5248      	clr	21064
  75                     ; 68   UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  77  0022 725f5249      	clr	21065
  78                     ; 69 }
  81  0026 87            	retf
 391                     .const:	section	.text
 392  0000               L01:
 393  0000 00000064      	dc.l	100
 394                     ; 85 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 394                     ; 86 {
 395                     	switch	.text
 396  0027               f_UART2_Init:
 398  0027 520e          	subw	sp,#14
 399       0000000e      OFST:	set	14
 402                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 406                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 410                     ; 91   assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 412                     ; 92   assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 414                     ; 93   assert_param(IS_UART2_STOPBITS_OK(StopBits));
 416                     ; 94   assert_param(IS_UART2_PARITY_OK(Parity));
 418                     ; 95   assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 420                     ; 96   assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 422                     ; 99   UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 424  0029 72195244      	bres	21060,#4
 425                     ; 101   UART2->CR1 |= (uint8_t)WordLength; 
 427  002d c65244        	ld	a,21060
 428  0030 1a16          	or	a,(OFST+8,sp)
 429  0032 c75244        	ld	21060,a
 430                     ; 104   UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 432  0035 c65246        	ld	a,21062
 433  0038 a4cf          	and	a,#207
 434  003a c75246        	ld	21062,a
 435                     ; 106   UART2->CR3 |= (uint8_t)StopBits; 
 437  003d c65246        	ld	a,21062
 438  0040 1a17          	or	a,(OFST+9,sp)
 439  0042 c75246        	ld	21062,a
 440                     ; 109   UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 442  0045 c65244        	ld	a,21060
 443  0048 a4f9          	and	a,#249
 444  004a c75244        	ld	21060,a
 445                     ; 111   UART2->CR1 |= (uint8_t)Parity;
 447  004d c65244        	ld	a,21060
 448  0050 1a18          	or	a,(OFST+10,sp)
 449  0052 c75244        	ld	21060,a
 450                     ; 114   UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 452  0055 725f5242      	clr	21058
 453                     ; 116   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 455  0059 c65243        	ld	a,21059
 456  005c a40f          	and	a,#15
 457  005e c75243        	ld	21059,a
 458                     ; 118   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 460  0061 c65243        	ld	a,21059
 461  0064 a4f0          	and	a,#240
 462  0066 c75243        	ld	21059,a
 463                     ; 121   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 465  0069 96            	ldw	x,sp
 466  006a 1c0012        	addw	x,#OFST+4
 467  006d 8d000000      	callf	d_ltor
 469  0071 a604          	ld	a,#4
 470  0073 8d000000      	callf	d_llsh
 472  0077 96            	ldw	x,sp
 473  0078 1c0001        	addw	x,#OFST-13
 474  007b 8d000000      	callf	d_rtol
 477  007f 8d000000      	callf	f_CLK_GetClockFreq
 479  0083 96            	ldw	x,sp
 480  0084 1c0001        	addw	x,#OFST-13
 481  0087 8d000000      	callf	d_ludv
 483  008b 96            	ldw	x,sp
 484  008c 1c000b        	addw	x,#OFST-3
 485  008f 8d000000      	callf	d_rtol
 488                     ; 122   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 490  0093 96            	ldw	x,sp
 491  0094 1c0012        	addw	x,#OFST+4
 492  0097 8d000000      	callf	d_ltor
 494  009b a604          	ld	a,#4
 495  009d 8d000000      	callf	d_llsh
 497  00a1 96            	ldw	x,sp
 498  00a2 1c0001        	addw	x,#OFST-13
 499  00a5 8d000000      	callf	d_rtol
 502  00a9 8d000000      	callf	f_CLK_GetClockFreq
 504  00ad a664          	ld	a,#100
 505  00af 8d000000      	callf	d_smul
 507  00b3 96            	ldw	x,sp
 508  00b4 1c0001        	addw	x,#OFST-13
 509  00b7 8d000000      	callf	d_ludv
 511  00bb 96            	ldw	x,sp
 512  00bc 1c0007        	addw	x,#OFST-7
 513  00bf 8d000000      	callf	d_rtol
 516                     ; 126   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 516                     ; 127                                 << 4) / 100) & (uint8_t)0x0F); 
 518  00c3 96            	ldw	x,sp
 519  00c4 1c000b        	addw	x,#OFST-3
 520  00c7 8d000000      	callf	d_ltor
 522  00cb a664          	ld	a,#100
 523  00cd 8d000000      	callf	d_smul
 525  00d1 96            	ldw	x,sp
 526  00d2 1c0001        	addw	x,#OFST-13
 527  00d5 8d000000      	callf	d_rtol
 530  00d9 96            	ldw	x,sp
 531  00da 1c0007        	addw	x,#OFST-7
 532  00dd 8d000000      	callf	d_ltor
 534  00e1 96            	ldw	x,sp
 535  00e2 1c0001        	addw	x,#OFST-13
 536  00e5 8d000000      	callf	d_lsub
 538  00e9 a604          	ld	a,#4
 539  00eb 8d000000      	callf	d_llsh
 541  00ef ae0000        	ldw	x,#L01
 542  00f2 8d000000      	callf	d_ludv
 544  00f6 b603          	ld	a,c_lreg+3
 545  00f8 a40f          	and	a,#15
 546  00fa 6b05          	ld	(OFST-9,sp),a
 548                     ; 128   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 550  00fc 96            	ldw	x,sp
 551  00fd 1c000b        	addw	x,#OFST-3
 552  0100 8d000000      	callf	d_ltor
 554  0104 a604          	ld	a,#4
 555  0106 8d000000      	callf	d_lursh
 557  010a b603          	ld	a,c_lreg+3
 558  010c a4f0          	and	a,#240
 559  010e b703          	ld	c_lreg+3,a
 560  0110 3f02          	clr	c_lreg+2
 561  0112 3f01          	clr	c_lreg+1
 562  0114 3f00          	clr	c_lreg
 563  0116 b603          	ld	a,c_lreg+3
 564  0118 6b06          	ld	(OFST-8,sp),a
 566                     ; 130   UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 568  011a 7b05          	ld	a,(OFST-9,sp)
 569  011c 1a06          	or	a,(OFST-8,sp)
 570  011e c75243        	ld	21059,a
 571                     ; 132   UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 573  0121 7b0e          	ld	a,(OFST+0,sp)
 574  0123 c75242        	ld	21058,a
 575                     ; 135   UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 577  0126 c65245        	ld	a,21061
 578  0129 a4f3          	and	a,#243
 579  012b c75245        	ld	21061,a
 580                     ; 137   UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 582  012e c65246        	ld	a,21062
 583  0131 a4f8          	and	a,#248
 584  0133 c75246        	ld	21062,a
 585                     ; 139   UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 585                     ; 140     UART2_CR3_CPHA | UART2_CR3_LBCL));
 587  0136 7b19          	ld	a,(OFST+11,sp)
 588  0138 a407          	and	a,#7
 589  013a ca5246        	or	a,21062
 590  013d c75246        	ld	21062,a
 591                     ; 142   if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 593  0140 7b1a          	ld	a,(OFST+12,sp)
 594  0142 a504          	bcp	a,#4
 595  0144 2706          	jreq	L171
 596                     ; 145     UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 598  0146 72165245      	bset	21061,#3
 600  014a 2004          	jra	L371
 601  014c               L171:
 602                     ; 150     UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 604  014c 72175245      	bres	21061,#3
 605  0150               L371:
 606                     ; 152   if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 608  0150 7b1a          	ld	a,(OFST+12,sp)
 609  0152 a508          	bcp	a,#8
 610  0154 2706          	jreq	L571
 611                     ; 155     UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 613  0156 72145245      	bset	21061,#2
 615  015a 2004          	jra	L771
 616  015c               L571:
 617                     ; 160     UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 619  015c 72155245      	bres	21061,#2
 620  0160               L771:
 621                     ; 164   if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 623  0160 7b19          	ld	a,(OFST+11,sp)
 624  0162 a580          	bcp	a,#128
 625  0164 2706          	jreq	L102
 626                     ; 167     UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 628  0166 72175246      	bres	21062,#3
 630  016a 200a          	jra	L302
 631  016c               L102:
 632                     ; 171     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 634  016c 7b19          	ld	a,(OFST+11,sp)
 635  016e a408          	and	a,#8
 636  0170 ca5246        	or	a,21062
 637  0173 c75246        	ld	21062,a
 638  0176               L302:
 639                     ; 173 }
 642  0176 5b0e          	addw	sp,#14
 643  0178 87            	retf
 697                     ; 181 void UART2_Cmd(FunctionalState NewState)
 697                     ; 182 {
 698                     	switch	.text
 699  0179               f_UART2_Cmd:
 703                     ; 183   if (NewState != DISABLE)
 705  0179 4d            	tnz	a
 706  017a 2706          	jreq	L332
 707                     ; 186     UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 709  017c 721b5244      	bres	21060,#5
 711  0180 2004          	jra	L532
 712  0182               L332:
 713                     ; 191     UART2->CR1 |= UART2_CR1_UARTD; 
 715  0182 721a5244      	bset	21060,#5
 716  0186               L532:
 717                     ; 193 }
 720  0186 87            	retf
 847                     ; 210 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 847                     ; 211 {
 848                     	switch	.text
 849  0187               f_UART2_ITConfig:
 851  0187 89            	pushw	x
 852  0188 89            	pushw	x
 853       00000002      OFST:	set	2
 856                     ; 212   uint8_t uartreg = 0, itpos = 0x00;
 860                     ; 215   assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 862                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 864                     ; 219   uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 866  0189 9e            	ld	a,xh
 867  018a 6b01          	ld	(OFST-1,sp),a
 869                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 871  018c 9f            	ld	a,xl
 872  018d a40f          	and	a,#15
 873  018f 5f            	clrw	x
 874  0190 97            	ld	xl,a
 875  0191 a601          	ld	a,#1
 876  0193 5d            	tnzw	x
 877  0194 2704          	jreq	L61
 878  0196               L02:
 879  0196 48            	sll	a
 880  0197 5a            	decw	x
 881  0198 26fc          	jrne	L02
 882  019a               L61:
 883  019a 6b02          	ld	(OFST+0,sp),a
 885                     ; 224   if (NewState != DISABLE)
 887  019c 0d08          	tnz	(OFST+6,sp)
 888  019e 273a          	jreq	L313
 889                     ; 227     if (uartreg == 0x01)
 891  01a0 7b01          	ld	a,(OFST-1,sp)
 892  01a2 a101          	cp	a,#1
 893  01a4 260a          	jrne	L513
 894                     ; 229       UART2->CR1 |= itpos;
 896  01a6 c65244        	ld	a,21060
 897  01a9 1a02          	or	a,(OFST+0,sp)
 898  01ab c75244        	ld	21060,a
 900  01ae 2066          	jra	L133
 901  01b0               L513:
 902                     ; 231     else if (uartreg == 0x02)
 904  01b0 7b01          	ld	a,(OFST-1,sp)
 905  01b2 a102          	cp	a,#2
 906  01b4 260a          	jrne	L123
 907                     ; 233       UART2->CR2 |= itpos;
 909  01b6 c65245        	ld	a,21061
 910  01b9 1a02          	or	a,(OFST+0,sp)
 911  01bb c75245        	ld	21061,a
 913  01be 2056          	jra	L133
 914  01c0               L123:
 915                     ; 235     else if (uartreg == 0x03)
 917  01c0 7b01          	ld	a,(OFST-1,sp)
 918  01c2 a103          	cp	a,#3
 919  01c4 260a          	jrne	L523
 920                     ; 237       UART2->CR4 |= itpos;
 922  01c6 c65247        	ld	a,21063
 923  01c9 1a02          	or	a,(OFST+0,sp)
 924  01cb c75247        	ld	21063,a
 926  01ce 2046          	jra	L133
 927  01d0               L523:
 928                     ; 241       UART2->CR6 |= itpos;
 930  01d0 c65249        	ld	a,21065
 931  01d3 1a02          	or	a,(OFST+0,sp)
 932  01d5 c75249        	ld	21065,a
 933  01d8 203c          	jra	L133
 934  01da               L313:
 935                     ; 247     if (uartreg == 0x01)
 937  01da 7b01          	ld	a,(OFST-1,sp)
 938  01dc a101          	cp	a,#1
 939  01de 260b          	jrne	L333
 940                     ; 249       UART2->CR1 &= (uint8_t)(~itpos);
 942  01e0 7b02          	ld	a,(OFST+0,sp)
 943  01e2 43            	cpl	a
 944  01e3 c45244        	and	a,21060
 945  01e6 c75244        	ld	21060,a
 947  01e9 202b          	jra	L133
 948  01eb               L333:
 949                     ; 251     else if (uartreg == 0x02)
 951  01eb 7b01          	ld	a,(OFST-1,sp)
 952  01ed a102          	cp	a,#2
 953  01ef 260b          	jrne	L733
 954                     ; 253       UART2->CR2 &= (uint8_t)(~itpos);
 956  01f1 7b02          	ld	a,(OFST+0,sp)
 957  01f3 43            	cpl	a
 958  01f4 c45245        	and	a,21061
 959  01f7 c75245        	ld	21061,a
 961  01fa 201a          	jra	L133
 962  01fc               L733:
 963                     ; 255     else if (uartreg == 0x03)
 965  01fc 7b01          	ld	a,(OFST-1,sp)
 966  01fe a103          	cp	a,#3
 967  0200 260b          	jrne	L343
 968                     ; 257       UART2->CR4 &= (uint8_t)(~itpos);
 970  0202 7b02          	ld	a,(OFST+0,sp)
 971  0204 43            	cpl	a
 972  0205 c45247        	and	a,21063
 973  0208 c75247        	ld	21063,a
 975  020b 2009          	jra	L133
 976  020d               L343:
 977                     ; 261       UART2->CR6 &= (uint8_t)(~itpos);
 979  020d 7b02          	ld	a,(OFST+0,sp)
 980  020f 43            	cpl	a
 981  0210 c45249        	and	a,21065
 982  0213 c75249        	ld	21065,a
 983  0216               L133:
 984                     ; 264 }
 987  0216 5b04          	addw	sp,#4
 988  0218 87            	retf
1044                     ; 272 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1044                     ; 273 {
1045                     	switch	.text
1046  0219               f_UART2_IrDAConfig:
1050                     ; 274   assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1052                     ; 276   if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1054  0219 4d            	tnz	a
1055  021a 2706          	jreq	L573
1056                     ; 278     UART2->CR5 |= UART2_CR5_IRLP;
1058  021c 72145248      	bset	21064,#2
1060  0220 2004          	jra	L773
1061  0222               L573:
1062                     ; 282     UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1064  0222 72155248      	bres	21064,#2
1065  0226               L773:
1066                     ; 284 }
1069  0226 87            	retf
1103                     ; 292 void UART2_IrDACmd(FunctionalState NewState)
1103                     ; 293 {
1104                     	switch	.text
1105  0227               f_UART2_IrDACmd:
1109                     ; 295   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1111                     ; 297   if (NewState != DISABLE)
1113  0227 4d            	tnz	a
1114  0228 2706          	jreq	L714
1115                     ; 300     UART2->CR5 |= UART2_CR5_IREN;
1117  022a 72125248      	bset	21064,#1
1119  022e 2004          	jra	L124
1120  0230               L714:
1121                     ; 305     UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1123  0230 72135248      	bres	21064,#1
1124  0234               L124:
1125                     ; 307 }
1128  0234 87            	retf
1186                     ; 316 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1186                     ; 317 {
1187                     	switch	.text
1188  0235               f_UART2_LINBreakDetectionConfig:
1192                     ; 319   assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1194                     ; 321   if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1196  0235 4d            	tnz	a
1197  0236 2706          	jreq	L154
1198                     ; 323     UART2->CR4 |= UART2_CR4_LBDL;
1200  0238 721a5247      	bset	21063,#5
1202  023c 2004          	jra	L354
1203  023e               L154:
1204                     ; 327     UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1206  023e 721b5247      	bres	21063,#5
1207  0242               L354:
1208                     ; 329 }
1211  0242 87            	retf
1331                     ; 341 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1331                     ; 342                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1331                     ; 343                      UART2_LinDivUp_TypeDef UART2_DivUp)
1331                     ; 344 {
1332                     	switch	.text
1333  0243               f_UART2_LINConfig:
1335  0243 89            	pushw	x
1336       00000000      OFST:	set	0
1339                     ; 346   assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1341                     ; 347   assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1343                     ; 348   assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1345                     ; 350   if (UART2_Mode != UART2_LIN_MODE_MASTER)
1347  0244 9e            	ld	a,xh
1348  0245 4d            	tnz	a
1349  0246 2706          	jreq	L335
1350                     ; 352     UART2->CR6 |=  UART2_CR6_LSLV;
1352  0248 721a5249      	bset	21065,#5
1354  024c 2004          	jra	L535
1355  024e               L335:
1356                     ; 356     UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1358  024e 721b5249      	bres	21065,#5
1359  0252               L535:
1360                     ; 359   if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1362  0252 0d02          	tnz	(OFST+2,sp)
1363  0254 2706          	jreq	L735
1364                     ; 361     UART2->CR6 |=  UART2_CR6_LASE ;
1366  0256 72185249      	bset	21065,#4
1368  025a 2004          	jra	L145
1369  025c               L735:
1370                     ; 365     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1372  025c 72195249      	bres	21065,#4
1373  0260               L145:
1374                     ; 368   if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1376  0260 0d06          	tnz	(OFST+6,sp)
1377  0262 2706          	jreq	L345
1378                     ; 370     UART2->CR6 |=  UART2_CR6_LDUM;
1380  0264 721e5249      	bset	21065,#7
1382  0268 2004          	jra	L545
1383  026a               L345:
1384                     ; 374     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1386  026a 721f5249      	bres	21065,#7
1387  026e               L545:
1388                     ; 376 }
1391  026e 85            	popw	x
1392  026f 87            	retf
1426                     ; 384 void UART2_LINCmd(FunctionalState NewState)
1426                     ; 385 {
1427                     	switch	.text
1428  0270               f_UART2_LINCmd:
1432                     ; 386   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1434                     ; 388   if (NewState != DISABLE)
1436  0270 4d            	tnz	a
1437  0271 2706          	jreq	L565
1438                     ; 391     UART2->CR3 |= UART2_CR3_LINEN;
1440  0273 721c5246      	bset	21062,#6
1442  0277 2004          	jra	L765
1443  0279               L565:
1444                     ; 396     UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1446  0279 721d5246      	bres	21062,#6
1447  027d               L765:
1448                     ; 398 }
1451  027d 87            	retf
1485                     ; 406 void UART2_SmartCardCmd(FunctionalState NewState)
1485                     ; 407 {
1486                     	switch	.text
1487  027e               f_UART2_SmartCardCmd:
1491                     ; 409   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1493                     ; 411   if (NewState != DISABLE)
1495  027e 4d            	tnz	a
1496  027f 2706          	jreq	L706
1497                     ; 414     UART2->CR5 |= UART2_CR5_SCEN;
1499  0281 721a5248      	bset	21064,#5
1501  0285 2004          	jra	L116
1502  0287               L706:
1503                     ; 419     UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1505  0287 721b5248      	bres	21064,#5
1506  028b               L116:
1507                     ; 421 }
1510  028b 87            	retf
1545                     ; 429 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1545                     ; 430 {
1546                     	switch	.text
1547  028c               f_UART2_SmartCardNACKCmd:
1551                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1553                     ; 434   if (NewState != DISABLE)
1555  028c 4d            	tnz	a
1556  028d 2706          	jreq	L136
1557                     ; 437     UART2->CR5 |= UART2_CR5_NACK;
1559  028f 72185248      	bset	21064,#4
1561  0293 2004          	jra	L336
1562  0295               L136:
1563                     ; 442     UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1565  0295 72195248      	bres	21064,#4
1566  0299               L336:
1567                     ; 444 }
1570  0299 87            	retf
1626                     ; 452 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1626                     ; 453 {
1627                     	switch	.text
1628  029a               f_UART2_WakeUpConfig:
1632                     ; 454   assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1634                     ; 456   UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1636  029a 72175244      	bres	21060,#3
1637                     ; 457   UART2->CR1 |= (uint8_t)UART2_WakeUp;
1639  029e ca5244        	or	a,21060
1640  02a1 c75244        	ld	21060,a
1641                     ; 458 }
1644  02a4 87            	retf
1679                     ; 466 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1679                     ; 467 {
1680                     	switch	.text
1681  02a5               f_UART2_ReceiverWakeUpCmd:
1685                     ; 468   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1687                     ; 470   if (NewState != DISABLE)
1689  02a5 4d            	tnz	a
1690  02a6 2706          	jreq	L107
1691                     ; 473     UART2->CR2 |= UART2_CR2_RWU;
1693  02a8 72125245      	bset	21061,#1
1695  02ac 2004          	jra	L307
1696  02ae               L107:
1697                     ; 478     UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1699  02ae 72135245      	bres	21061,#1
1700  02b2               L307:
1701                     ; 480 }
1704  02b2 87            	retf
1726                     ; 487 uint8_t UART2_ReceiveData8(void)
1726                     ; 488 {
1727                     	switch	.text
1728  02b3               f_UART2_ReceiveData8:
1732                     ; 489   return ((uint8_t)UART2->DR);
1734  02b3 c65241        	ld	a,21057
1737  02b6 87            	retf
1768                     ; 497 uint16_t UART2_ReceiveData9(void)
1768                     ; 498 {
1769                     	switch	.text
1770  02b7               f_UART2_ReceiveData9:
1772  02b7 89            	pushw	x
1773       00000002      OFST:	set	2
1776                     ; 499   uint16_t temp = 0;
1778                     ; 501   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1780  02b8 c65244        	ld	a,21060
1781  02bb 5f            	clrw	x
1782  02bc a480          	and	a,#128
1783  02be 5f            	clrw	x
1784  02bf 02            	rlwa	x,a
1785  02c0 58            	sllw	x
1786  02c1 1f01          	ldw	(OFST-1,sp),x
1788                     ; 503   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1790  02c3 c65241        	ld	a,21057
1791  02c6 5f            	clrw	x
1792  02c7 97            	ld	xl,a
1793  02c8 01            	rrwa	x,a
1794  02c9 1a02          	or	a,(OFST+0,sp)
1795  02cb 01            	rrwa	x,a
1796  02cc 1a01          	or	a,(OFST-1,sp)
1797  02ce 01            	rrwa	x,a
1798  02cf 01            	rrwa	x,a
1799  02d0 a4ff          	and	a,#255
1800  02d2 01            	rrwa	x,a
1801  02d3 a401          	and	a,#1
1802  02d5 01            	rrwa	x,a
1805  02d6 5b02          	addw	sp,#2
1806  02d8 87            	retf
1837                     ; 511 void UART2_SendData8(uint8_t Data)
1837                     ; 512 {
1838                     	switch	.text
1839  02d9               f_UART2_SendData8:
1843                     ; 514   UART2->DR = Data;
1845  02d9 c75241        	ld	21057,a
1846                     ; 515 }
1849  02dc 87            	retf
1880                     ; 522 void UART2_SendData9(uint16_t Data)
1880                     ; 523 {
1881                     	switch	.text
1882  02dd               f_UART2_SendData9:
1884  02dd 89            	pushw	x
1885       00000000      OFST:	set	0
1888                     ; 525   UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1890  02de 721d5244      	bres	21060,#6
1891                     ; 528   UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1893  02e2 54            	srlw	x
1894  02e3 54            	srlw	x
1895  02e4 9f            	ld	a,xl
1896  02e5 a440          	and	a,#64
1897  02e7 ca5244        	or	a,21060
1898  02ea c75244        	ld	21060,a
1899                     ; 531   UART2->DR   = (uint8_t)(Data);                    
1901  02ed 7b02          	ld	a,(OFST+2,sp)
1902  02ef c75241        	ld	21057,a
1903                     ; 532 }
1906  02f2 85            	popw	x
1907  02f3 87            	retf
1929                     ; 539 void UART2_SendBreak(void)
1929                     ; 540 {
1930                     	switch	.text
1931  02f4               f_UART2_SendBreak:
1935                     ; 541   UART2->CR2 |= UART2_CR2_SBK;
1937  02f4 72105245      	bset	21061,#0
1938                     ; 542 }
1941  02f8 87            	retf
1972                     ; 549 void UART2_SetAddress(uint8_t UART2_Address)
1972                     ; 550 {
1973                     	switch	.text
1974  02f9               f_UART2_SetAddress:
1976  02f9 88            	push	a
1977       00000000      OFST:	set	0
1980                     ; 552   assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
1982                     ; 555   UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
1984  02fa c65247        	ld	a,21063
1985  02fd a4f0          	and	a,#240
1986  02ff c75247        	ld	21063,a
1987                     ; 557   UART2->CR4 |= UART2_Address;
1989  0302 c65247        	ld	a,21063
1990  0305 1a01          	or	a,(OFST+1,sp)
1991  0307 c75247        	ld	21063,a
1992                     ; 558 }
1995  030a 84            	pop	a
1996  030b 87            	retf
2027                     ; 566 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2027                     ; 567 {
2028                     	switch	.text
2029  030c               f_UART2_SetGuardTime:
2033                     ; 569   UART2->GTR = UART2_GuardTime;
2035  030c c7524a        	ld	21066,a
2036                     ; 570 }
2039  030f 87            	retf
2070                     ; 594 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2070                     ; 595 {
2071                     	switch	.text
2072  0310               f_UART2_SetPrescaler:
2076                     ; 597   UART2->PSCR = UART2_Prescaler;
2078  0310 c7524b        	ld	21067,a
2079                     ; 598 }
2082  0313 87            	retf
2238                     ; 606 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2238                     ; 607 {
2239                     	switch	.text
2240  0314               f_UART2_GetFlagStatus:
2242  0314 89            	pushw	x
2243  0315 88            	push	a
2244       00000001      OFST:	set	1
2247                     ; 608   FlagStatus status = RESET;
2249                     ; 611   assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2251                     ; 614   if (UART2_FLAG == UART2_FLAG_LBDF)
2253  0316 a30210        	cpw	x,#528
2254  0319 2610          	jrne	L3211
2255                     ; 616     if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2257  031b 9f            	ld	a,xl
2258  031c c45247        	and	a,21063
2259  031f 2706          	jreq	L5211
2260                     ; 619       status = SET;
2262  0321 a601          	ld	a,#1
2263  0323 6b01          	ld	(OFST+0,sp),a
2266  0325 2039          	jra	L1311
2267  0327               L5211:
2268                     ; 624       status = RESET;
2270  0327 0f01          	clr	(OFST+0,sp)
2272  0329 2035          	jra	L1311
2273  032b               L3211:
2274                     ; 627   else if (UART2_FLAG == UART2_FLAG_SBK)
2276  032b 1e02          	ldw	x,(OFST+1,sp)
2277  032d a30101        	cpw	x,#257
2278  0330 2611          	jrne	L3311
2279                     ; 629     if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2281  0332 c65245        	ld	a,21061
2282  0335 1503          	bcp	a,(OFST+2,sp)
2283  0337 2706          	jreq	L5311
2284                     ; 632       status = SET;
2286  0339 a601          	ld	a,#1
2287  033b 6b01          	ld	(OFST+0,sp),a
2290  033d 2021          	jra	L1311
2291  033f               L5311:
2292                     ; 637       status = RESET;
2294  033f 0f01          	clr	(OFST+0,sp)
2296  0341 201d          	jra	L1311
2297  0343               L3311:
2298                     ; 640   else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2300  0343 1e02          	ldw	x,(OFST+1,sp)
2301  0345 a30302        	cpw	x,#770
2302  0348 2707          	jreq	L5411
2304  034a 1e02          	ldw	x,(OFST+1,sp)
2305  034c a30301        	cpw	x,#769
2306  034f 2614          	jrne	L3411
2307  0351               L5411:
2308                     ; 642     if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2310  0351 c65249        	ld	a,21065
2311  0354 1503          	bcp	a,(OFST+2,sp)
2312  0356 2706          	jreq	L7411
2313                     ; 645       status = SET;
2315  0358 a601          	ld	a,#1
2316  035a 6b01          	ld	(OFST+0,sp),a
2319  035c 2002          	jra	L1311
2320  035e               L7411:
2321                     ; 650       status = RESET;
2323  035e 0f01          	clr	(OFST+0,sp)
2325  0360               L1311:
2326                     ; 668   return  status;
2328  0360 7b01          	ld	a,(OFST+0,sp)
2331  0362 5b03          	addw	sp,#3
2332  0364 87            	retf
2333  0365               L3411:
2334                     ; 655     if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2336  0365 c65240        	ld	a,21056
2337  0368 1503          	bcp	a,(OFST+2,sp)
2338  036a 2706          	jreq	L5511
2339                     ; 658       status = SET;
2341  036c a601          	ld	a,#1
2342  036e 6b01          	ld	(OFST+0,sp),a
2345  0370 20ee          	jra	L1311
2346  0372               L5511:
2347                     ; 663       status = RESET;
2349  0372 0f01          	clr	(OFST+0,sp)
2351  0374 20ea          	jra	L1311
2385                     ; 699 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2385                     ; 700 {
2386                     	switch	.text
2387  0376               f_UART2_ClearFlag:
2389  0376 89            	pushw	x
2390       00000000      OFST:	set	0
2393                     ; 701   assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2395                     ; 704   if (UART2_FLAG == UART2_FLAG_RXNE)
2397  0377 a30020        	cpw	x,#32
2398  037a 2606          	jrne	L7711
2399                     ; 706     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2401  037c 35df5240      	mov	21056,#223
2403  0380 201e          	jra	L1021
2404  0382               L7711:
2405                     ; 709   else if (UART2_FLAG == UART2_FLAG_LBDF)
2407  0382 1e01          	ldw	x,(OFST+1,sp)
2408  0384 a30210        	cpw	x,#528
2409  0387 2606          	jrne	L3021
2410                     ; 711     UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2412  0389 72195247      	bres	21063,#4
2414  038d 2011          	jra	L1021
2415  038f               L3021:
2416                     ; 714   else if (UART2_FLAG == UART2_FLAG_LHDF)
2418  038f 1e01          	ldw	x,(OFST+1,sp)
2419  0391 a30302        	cpw	x,#770
2420  0394 2606          	jrne	L7021
2421                     ; 716     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2423  0396 72135249      	bres	21065,#1
2425  039a 2004          	jra	L1021
2426  039c               L7021:
2427                     ; 721     UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2429  039c 72115249      	bres	21065,#0
2430  03a0               L1021:
2431                     ; 723 }
2434  03a0 85            	popw	x
2435  03a1 87            	retf
2508                     ; 738 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2508                     ; 739 {
2509                     	switch	.text
2510  03a2               f_UART2_GetITStatus:
2512  03a2 89            	pushw	x
2513  03a3 89            	pushw	x
2514       00000002      OFST:	set	2
2517                     ; 740   ITStatus pendingbitstatus = RESET;
2519                     ; 741   uint8_t itpos = 0;
2521                     ; 742   uint8_t itmask1 = 0;
2523                     ; 743   uint8_t itmask2 = 0;
2525                     ; 744   uint8_t enablestatus = 0;
2527                     ; 747   assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2529                     ; 750   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2531  03a4 9f            	ld	a,xl
2532  03a5 a40f          	and	a,#15
2533  03a7 5f            	clrw	x
2534  03a8 97            	ld	xl,a
2535  03a9 a601          	ld	a,#1
2536  03ab 5d            	tnzw	x
2537  03ac 2704          	jreq	L27
2538  03ae               L47:
2539  03ae 48            	sll	a
2540  03af 5a            	decw	x
2541  03b0 26fc          	jrne	L47
2542  03b2               L27:
2543  03b2 6b01          	ld	(OFST-1,sp),a
2545                     ; 752   itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2547  03b4 7b04          	ld	a,(OFST+2,sp)
2548  03b6 4e            	swap	a
2549  03b7 a40f          	and	a,#15
2550  03b9 6b02          	ld	(OFST+0,sp),a
2552                     ; 754   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2554  03bb 7b02          	ld	a,(OFST+0,sp)
2555  03bd 5f            	clrw	x
2556  03be 97            	ld	xl,a
2557  03bf a601          	ld	a,#1
2558  03c1 5d            	tnzw	x
2559  03c2 2704          	jreq	L67
2560  03c4               L001:
2561  03c4 48            	sll	a
2562  03c5 5a            	decw	x
2563  03c6 26fc          	jrne	L001
2564  03c8               L67:
2565  03c8 6b02          	ld	(OFST+0,sp),a
2567                     ; 757   if (UART2_IT == UART2_IT_PE)
2569  03ca 1e03          	ldw	x,(OFST+1,sp)
2570  03cc a30100        	cpw	x,#256
2571  03cf 261c          	jrne	L5421
2572                     ; 760     enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2574  03d1 c65244        	ld	a,21060
2575  03d4 1402          	and	a,(OFST+0,sp)
2576  03d6 6b02          	ld	(OFST+0,sp),a
2578                     ; 763     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2580  03d8 c65240        	ld	a,21056
2581  03db 1501          	bcp	a,(OFST-1,sp)
2582  03dd 270a          	jreq	L7421
2584  03df 0d02          	tnz	(OFST+0,sp)
2585  03e1 2706          	jreq	L7421
2586                     ; 766       pendingbitstatus = SET;
2588  03e3 a601          	ld	a,#1
2589  03e5 6b02          	ld	(OFST+0,sp),a
2592  03e7 2064          	jra	L3521
2593  03e9               L7421:
2594                     ; 771       pendingbitstatus = RESET;
2596  03e9 0f02          	clr	(OFST+0,sp)
2598  03eb 2060          	jra	L3521
2599  03ed               L5421:
2600                     ; 774   else if (UART2_IT == UART2_IT_LBDF)
2602  03ed 1e03          	ldw	x,(OFST+1,sp)
2603  03ef a30346        	cpw	x,#838
2604  03f2 261c          	jrne	L5521
2605                     ; 777     enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2607  03f4 c65247        	ld	a,21063
2608  03f7 1402          	and	a,(OFST+0,sp)
2609  03f9 6b02          	ld	(OFST+0,sp),a
2611                     ; 779     if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2613  03fb c65247        	ld	a,21063
2614  03fe 1501          	bcp	a,(OFST-1,sp)
2615  0400 270a          	jreq	L7521
2617  0402 0d02          	tnz	(OFST+0,sp)
2618  0404 2706          	jreq	L7521
2619                     ; 782       pendingbitstatus = SET;
2621  0406 a601          	ld	a,#1
2622  0408 6b02          	ld	(OFST+0,sp),a
2625  040a 2041          	jra	L3521
2626  040c               L7521:
2627                     ; 787       pendingbitstatus = RESET;
2629  040c 0f02          	clr	(OFST+0,sp)
2631  040e 203d          	jra	L3521
2632  0410               L5521:
2633                     ; 790   else if (UART2_IT == UART2_IT_LHDF)
2635  0410 1e03          	ldw	x,(OFST+1,sp)
2636  0412 a30412        	cpw	x,#1042
2637  0415 261c          	jrne	L5621
2638                     ; 793     enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2640  0417 c65249        	ld	a,21065
2641  041a 1402          	and	a,(OFST+0,sp)
2642  041c 6b02          	ld	(OFST+0,sp),a
2644                     ; 795     if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2646  041e c65249        	ld	a,21065
2647  0421 1501          	bcp	a,(OFST-1,sp)
2648  0423 270a          	jreq	L7621
2650  0425 0d02          	tnz	(OFST+0,sp)
2651  0427 2706          	jreq	L7621
2652                     ; 798       pendingbitstatus = SET;
2654  0429 a601          	ld	a,#1
2655  042b 6b02          	ld	(OFST+0,sp),a
2658  042d 201e          	jra	L3521
2659  042f               L7621:
2660                     ; 803       pendingbitstatus = RESET;
2662  042f 0f02          	clr	(OFST+0,sp)
2664  0431 201a          	jra	L3521
2665  0433               L5621:
2666                     ; 809     enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2668  0433 c65245        	ld	a,21061
2669  0436 1402          	and	a,(OFST+0,sp)
2670  0438 6b02          	ld	(OFST+0,sp),a
2672                     ; 811     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2674  043a c65240        	ld	a,21056
2675  043d 1501          	bcp	a,(OFST-1,sp)
2676  043f 270a          	jreq	L5721
2678  0441 0d02          	tnz	(OFST+0,sp)
2679  0443 2706          	jreq	L5721
2680                     ; 814       pendingbitstatus = SET;
2682  0445 a601          	ld	a,#1
2683  0447 6b02          	ld	(OFST+0,sp),a
2686  0449 2002          	jra	L3521
2687  044b               L5721:
2688                     ; 819       pendingbitstatus = RESET;
2690  044b 0f02          	clr	(OFST+0,sp)
2692  044d               L3521:
2693                     ; 823   return  pendingbitstatus;
2695  044d 7b02          	ld	a,(OFST+0,sp)
2698  044f 5b04          	addw	sp,#4
2699  0451 87            	retf
2734                     ; 852 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2734                     ; 853 {
2735                     	switch	.text
2736  0452               f_UART2_ClearITPendingBit:
2738  0452 89            	pushw	x
2739       00000000      OFST:	set	0
2742                     ; 854   assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2744                     ; 857   if (UART2_IT == UART2_IT_RXNE)
2746  0453 a30255        	cpw	x,#597
2747  0456 2606          	jrne	L7131
2748                     ; 859     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2750  0458 35df5240      	mov	21056,#223
2752  045c 2011          	jra	L1231
2753  045e               L7131:
2754                     ; 862   else if (UART2_IT == UART2_IT_LBDF)
2756  045e 1e01          	ldw	x,(OFST+1,sp)
2757  0460 a30346        	cpw	x,#838
2758  0463 2606          	jrne	L3231
2759                     ; 864     UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2761  0465 72195247      	bres	21063,#4
2763  0469 2004          	jra	L1231
2764  046b               L3231:
2765                     ; 869     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2767  046b 72135249      	bres	21065,#1
2768  046f               L1231:
2769                     ; 871 }
2772  046f 85            	popw	x
2773  0470 87            	retf
2785                     	xdef	f_UART2_ClearITPendingBit
2786                     	xdef	f_UART2_GetITStatus
2787                     	xdef	f_UART2_ClearFlag
2788                     	xdef	f_UART2_GetFlagStatus
2789                     	xdef	f_UART2_SetPrescaler
2790                     	xdef	f_UART2_SetGuardTime
2791                     	xdef	f_UART2_SetAddress
2792                     	xdef	f_UART2_SendBreak
2793                     	xdef	f_UART2_SendData9
2794                     	xdef	f_UART2_SendData8
2795                     	xdef	f_UART2_ReceiveData9
2796                     	xdef	f_UART2_ReceiveData8
2797                     	xdef	f_UART2_ReceiverWakeUpCmd
2798                     	xdef	f_UART2_WakeUpConfig
2799                     	xdef	f_UART2_SmartCardNACKCmd
2800                     	xdef	f_UART2_SmartCardCmd
2801                     	xdef	f_UART2_LINCmd
2802                     	xdef	f_UART2_LINConfig
2803                     	xdef	f_UART2_LINBreakDetectionConfig
2804                     	xdef	f_UART2_IrDACmd
2805                     	xdef	f_UART2_IrDAConfig
2806                     	xdef	f_UART2_ITConfig
2807                     	xdef	f_UART2_Cmd
2808                     	xdef	f_UART2_Init
2809                     	xdef	f_UART2_DeInit
2810                     	xref	f_CLK_GetClockFreq
2811                     	xref.b	c_lreg
2812                     	xref.b	c_x
2831                     	xref	d_lursh
2832                     	xref	d_lsub
2833                     	xref	d_smul
2834                     	xref	d_ludv
2835                     	xref	d_rtol
2836                     	xref	d_llsh
2837                     	xref	d_ltor
2838                     	end
