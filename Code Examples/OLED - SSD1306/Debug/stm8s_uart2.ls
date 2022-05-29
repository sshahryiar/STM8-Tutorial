   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  47                     ; 53 void UART2_DeInit(void)
  47                     ; 54 {
  49                     	switch	.text
  50  0000               _UART2_DeInit:
  54                     ; 57   (void) UART2->SR;
  56  0000 c65240        	ld	a,21056
  57                     ; 58   (void)UART2->DR;
  59  0003 c65241        	ld	a,21057
  60                     ; 60   UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  62  0006 725f5243      	clr	21059
  63                     ; 61   UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  65  000a 725f5242      	clr	21058
  66                     ; 63   UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  68  000e 725f5244      	clr	21060
  69                     ; 64   UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  71  0012 725f5245      	clr	21061
  72                     ; 65   UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  74  0016 725f5246      	clr	21062
  75                     ; 66   UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  77  001a 725f5247      	clr	21063
  78                     ; 67   UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  80  001e 725f5248      	clr	21064
  81                     ; 68   UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  83  0022 725f5249      	clr	21065
  84                     ; 69 }
  87  0026 81            	ret	
 398                     .const:	section	.text
 399  0000               L41:
 400  0000 00000064      	dc.l	100
 401                     ; 85 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 401                     ; 86 {
 402                     	switch	.text
 403  0027               _UART2_Init:
 405  0027 520e          	subw	sp,#14
 406       0000000e      OFST:	set	14
 409                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 413                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 417                     ; 91   assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 419                     ; 92   assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 421                     ; 93   assert_param(IS_UART2_STOPBITS_OK(StopBits));
 423                     ; 94   assert_param(IS_UART2_PARITY_OK(Parity));
 425                     ; 95   assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 427                     ; 96   assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 429                     ; 99   UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 431  0029 72195244      	bres	21060,#4
 432                     ; 101   UART2->CR1 |= (uint8_t)WordLength; 
 434  002d c65244        	ld	a,21060
 435  0030 1a15          	or	a,(OFST+7,sp)
 436  0032 c75244        	ld	21060,a
 437                     ; 104   UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 439  0035 c65246        	ld	a,21062
 440  0038 a4cf          	and	a,#207
 441  003a c75246        	ld	21062,a
 442                     ; 106   UART2->CR3 |= (uint8_t)StopBits; 
 444  003d c65246        	ld	a,21062
 445  0040 1a16          	or	a,(OFST+8,sp)
 446  0042 c75246        	ld	21062,a
 447                     ; 109   UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 449  0045 c65244        	ld	a,21060
 450  0048 a4f9          	and	a,#249
 451  004a c75244        	ld	21060,a
 452                     ; 111   UART2->CR1 |= (uint8_t)Parity;
 454  004d c65244        	ld	a,21060
 455  0050 1a17          	or	a,(OFST+9,sp)
 456  0052 c75244        	ld	21060,a
 457                     ; 114   UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 459  0055 725f5242      	clr	21058
 460                     ; 116   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 462  0059 c65243        	ld	a,21059
 463  005c a40f          	and	a,#15
 464  005e c75243        	ld	21059,a
 465                     ; 118   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 467  0061 c65243        	ld	a,21059
 468  0064 a4f0          	and	a,#240
 469  0066 c75243        	ld	21059,a
 470                     ; 121   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 472  0069 96            	ldw	x,sp
 473  006a cd013d        	call	LC001
 475  006d 96            	ldw	x,sp
 476  006e 5c            	incw	x
 477  006f cd0000        	call	c_rtol
 480  0072 cd0000        	call	_CLK_GetClockFreq
 482  0075 96            	ldw	x,sp
 483  0076 5c            	incw	x
 484  0077 cd0000        	call	c_ludv
 486  007a 96            	ldw	x,sp
 487  007b 1c000b        	addw	x,#OFST-3
 488  007e cd0000        	call	c_rtol
 491                     ; 122   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 493  0081 96            	ldw	x,sp
 494  0082 cd013d        	call	LC001
 496  0085 96            	ldw	x,sp
 497  0086 5c            	incw	x
 498  0087 cd0000        	call	c_rtol
 501  008a cd0000        	call	_CLK_GetClockFreq
 503  008d a664          	ld	a,#100
 504  008f cd0000        	call	c_smul
 506  0092 96            	ldw	x,sp
 507  0093 5c            	incw	x
 508  0094 cd0000        	call	c_ludv
 510  0097 96            	ldw	x,sp
 511  0098 1c0007        	addw	x,#OFST-7
 512  009b cd0000        	call	c_rtol
 515                     ; 126   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 515                     ; 127                                 << 4) / 100) & (uint8_t)0x0F); 
 517  009e 96            	ldw	x,sp
 518  009f 1c000b        	addw	x,#OFST-3
 519  00a2 cd0000        	call	c_ltor
 521  00a5 a664          	ld	a,#100
 522  00a7 cd0000        	call	c_smul
 524  00aa 96            	ldw	x,sp
 525  00ab 5c            	incw	x
 526  00ac cd0000        	call	c_rtol
 529  00af 96            	ldw	x,sp
 530  00b0 1c0007        	addw	x,#OFST-7
 531  00b3 cd0000        	call	c_ltor
 533  00b6 96            	ldw	x,sp
 534  00b7 5c            	incw	x
 535  00b8 cd0000        	call	c_lsub
 537  00bb a604          	ld	a,#4
 538  00bd cd0000        	call	c_llsh
 540  00c0 ae0000        	ldw	x,#L41
 541  00c3 cd0000        	call	c_ludv
 543  00c6 b603          	ld	a,c_lreg+3
 544  00c8 a40f          	and	a,#15
 545  00ca 6b05          	ld	(OFST-9,sp),a
 547                     ; 128   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 549  00cc 96            	ldw	x,sp
 550  00cd 1c000b        	addw	x,#OFST-3
 551  00d0 cd0000        	call	c_ltor
 553  00d3 a604          	ld	a,#4
 554  00d5 cd0000        	call	c_lursh
 556  00d8 b603          	ld	a,c_lreg+3
 557  00da a4f0          	and	a,#240
 558  00dc b703          	ld	c_lreg+3,a
 559  00de 3f02          	clr	c_lreg+2
 560  00e0 3f01          	clr	c_lreg+1
 561  00e2 3f00          	clr	c_lreg
 562  00e4 6b06          	ld	(OFST-8,sp),a
 564                     ; 130   UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 566  00e6 1a05          	or	a,(OFST-9,sp)
 567  00e8 c75243        	ld	21059,a
 568                     ; 132   UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 570  00eb 7b0e          	ld	a,(OFST+0,sp)
 571  00ed c75242        	ld	21058,a
 572                     ; 135   UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 574  00f0 c65245        	ld	a,21061
 575  00f3 a4f3          	and	a,#243
 576  00f5 c75245        	ld	21061,a
 577                     ; 137   UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 579  00f8 c65246        	ld	a,21062
 580  00fb a4f8          	and	a,#248
 581  00fd c75246        	ld	21062,a
 582                     ; 139   UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 582                     ; 140     UART2_CR3_CPHA | UART2_CR3_LBCL));
 584  0100 7b18          	ld	a,(OFST+10,sp)
 585  0102 a407          	and	a,#7
 586  0104 ca5246        	or	a,21062
 587  0107 c75246        	ld	21062,a
 588                     ; 142   if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 590  010a 7b19          	ld	a,(OFST+11,sp)
 591  010c a504          	bcp	a,#4
 592  010e 2706          	jreq	L171
 593                     ; 145     UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 595  0110 72165245      	bset	21061,#3
 597  0114 2004          	jra	L371
 598  0116               L171:
 599                     ; 150     UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 601  0116 72175245      	bres	21061,#3
 602  011a               L371:
 603                     ; 152   if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 605  011a a508          	bcp	a,#8
 606  011c 2706          	jreq	L571
 607                     ; 155     UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 609  011e 72145245      	bset	21061,#2
 611  0122 2004          	jra	L771
 612  0124               L571:
 613                     ; 160     UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 615  0124 72155245      	bres	21061,#2
 616  0128               L771:
 617                     ; 164   if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 619  0128 7b18          	ld	a,(OFST+10,sp)
 620  012a 2a06          	jrpl	L102
 621                     ; 167     UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 623  012c 72175246      	bres	21062,#3
 625  0130 2008          	jra	L302
 626  0132               L102:
 627                     ; 171     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 629  0132 a408          	and	a,#8
 630  0134 ca5246        	or	a,21062
 631  0137 c75246        	ld	21062,a
 632  013a               L302:
 633                     ; 173 }
 636  013a 5b0e          	addw	sp,#14
 637  013c 81            	ret	
 638  013d               LC001:
 639  013d 1c0011        	addw	x,#OFST+3
 640  0140 cd0000        	call	c_ltor
 642  0143 a604          	ld	a,#4
 643  0145 cc0000        	jp	c_llsh
 698                     ; 181 void UART2_Cmd(FunctionalState NewState)
 698                     ; 182 {
 699                     	switch	.text
 700  0148               _UART2_Cmd:
 704                     ; 183   if (NewState != DISABLE)
 706  0148 4d            	tnz	a
 707  0149 2705          	jreq	L332
 708                     ; 186     UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 710  014b 721b5244      	bres	21060,#5
 713  014f 81            	ret	
 714  0150               L332:
 715                     ; 191     UART2->CR1 |= UART2_CR1_UARTD; 
 717  0150 721a5244      	bset	21060,#5
 718                     ; 193 }
 721  0154 81            	ret	
 849                     ; 210 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 849                     ; 211 {
 850                     	switch	.text
 851  0155               _UART2_ITConfig:
 853  0155 89            	pushw	x
 854  0156 89            	pushw	x
 855       00000002      OFST:	set	2
 858                     ; 212   uint8_t uartreg = 0, itpos = 0x00;
 862                     ; 215   assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 864                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 866                     ; 219   uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 868  0157 9e            	ld	a,xh
 869  0158 6b01          	ld	(OFST-1,sp),a
 871                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 873  015a 9f            	ld	a,xl
 874  015b a40f          	and	a,#15
 875  015d 5f            	clrw	x
 876  015e 97            	ld	xl,a
 877  015f a601          	ld	a,#1
 878  0161 5d            	tnzw	x
 879  0162 2704          	jreq	L22
 880  0164               L42:
 881  0164 48            	sll	a
 882  0165 5a            	decw	x
 883  0166 26fc          	jrne	L42
 884  0168               L22:
 885  0168 6b02          	ld	(OFST+0,sp),a
 887                     ; 224   if (NewState != DISABLE)
 889  016a 7b07          	ld	a,(OFST+5,sp)
 890  016c 272a          	jreq	L313
 891                     ; 227     if (uartreg == 0x01)
 893  016e 7b01          	ld	a,(OFST-1,sp)
 894  0170 a101          	cp	a,#1
 895  0172 2607          	jrne	L513
 896                     ; 229       UART2->CR1 |= itpos;
 898  0174 c65244        	ld	a,21060
 899  0177 1a02          	or	a,(OFST+0,sp)
 901  0179 2029          	jp	LC004
 902  017b               L513:
 903                     ; 231     else if (uartreg == 0x02)
 905  017b a102          	cp	a,#2
 906  017d 2607          	jrne	L123
 907                     ; 233       UART2->CR2 |= itpos;
 909  017f c65245        	ld	a,21061
 910  0182 1a02          	or	a,(OFST+0,sp)
 912  0184 202d          	jp	LC003
 913  0186               L123:
 914                     ; 235     else if (uartreg == 0x03)
 916  0186 a103          	cp	a,#3
 917  0188 2607          	jrne	L523
 918                     ; 237       UART2->CR4 |= itpos;
 920  018a c65247        	ld	a,21063
 921  018d 1a02          	or	a,(OFST+0,sp)
 923  018f 2031          	jp	LC005
 924  0191               L523:
 925                     ; 241       UART2->CR6 |= itpos;
 927  0191 c65249        	ld	a,21065
 928  0194 1a02          	or	a,(OFST+0,sp)
 929  0196 2035          	jp	LC002
 930  0198               L313:
 931                     ; 247     if (uartreg == 0x01)
 933  0198 7b01          	ld	a,(OFST-1,sp)
 934  019a a101          	cp	a,#1
 935  019c 260b          	jrne	L333
 936                     ; 249       UART2->CR1 &= (uint8_t)(~itpos);
 938  019e 7b02          	ld	a,(OFST+0,sp)
 939  01a0 43            	cpl	a
 940  01a1 c45244        	and	a,21060
 941  01a4               LC004:
 942  01a4 c75244        	ld	21060,a
 944  01a7 2027          	jra	L133
 945  01a9               L333:
 946                     ; 251     else if (uartreg == 0x02)
 948  01a9 a102          	cp	a,#2
 949  01ab 260b          	jrne	L733
 950                     ; 253       UART2->CR2 &= (uint8_t)(~itpos);
 952  01ad 7b02          	ld	a,(OFST+0,sp)
 953  01af 43            	cpl	a
 954  01b0 c45245        	and	a,21061
 955  01b3               LC003:
 956  01b3 c75245        	ld	21061,a
 958  01b6 2018          	jra	L133
 959  01b8               L733:
 960                     ; 255     else if (uartreg == 0x03)
 962  01b8 a103          	cp	a,#3
 963  01ba 260b          	jrne	L343
 964                     ; 257       UART2->CR4 &= (uint8_t)(~itpos);
 966  01bc 7b02          	ld	a,(OFST+0,sp)
 967  01be 43            	cpl	a
 968  01bf c45247        	and	a,21063
 969  01c2               LC005:
 970  01c2 c75247        	ld	21063,a
 972  01c5 2009          	jra	L133
 973  01c7               L343:
 974                     ; 261       UART2->CR6 &= (uint8_t)(~itpos);
 976  01c7 7b02          	ld	a,(OFST+0,sp)
 977  01c9 43            	cpl	a
 978  01ca c45249        	and	a,21065
 979  01cd               LC002:
 980  01cd c75249        	ld	21065,a
 981  01d0               L133:
 982                     ; 264 }
 985  01d0 5b04          	addw	sp,#4
 986  01d2 81            	ret	
1043                     ; 272 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1043                     ; 273 {
1044                     	switch	.text
1045  01d3               _UART2_IrDAConfig:
1049                     ; 274   assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1051                     ; 276   if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1053  01d3 4d            	tnz	a
1054  01d4 2705          	jreq	L573
1055                     ; 278     UART2->CR5 |= UART2_CR5_IRLP;
1057  01d6 72145248      	bset	21064,#2
1060  01da 81            	ret	
1061  01db               L573:
1062                     ; 282     UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1064  01db 72155248      	bres	21064,#2
1065                     ; 284 }
1068  01df 81            	ret	
1103                     ; 292 void UART2_IrDACmd(FunctionalState NewState)
1103                     ; 293 {
1104                     	switch	.text
1105  01e0               _UART2_IrDACmd:
1109                     ; 295   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1111                     ; 297   if (NewState != DISABLE)
1113  01e0 4d            	tnz	a
1114  01e1 2705          	jreq	L714
1115                     ; 300     UART2->CR5 |= UART2_CR5_IREN;
1117  01e3 72125248      	bset	21064,#1
1120  01e7 81            	ret	
1121  01e8               L714:
1122                     ; 305     UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1124  01e8 72135248      	bres	21064,#1
1125                     ; 307 }
1128  01ec 81            	ret	
1187                     ; 316 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1187                     ; 317 {
1188                     	switch	.text
1189  01ed               _UART2_LINBreakDetectionConfig:
1193                     ; 319   assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1195                     ; 321   if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1197  01ed 4d            	tnz	a
1198  01ee 2705          	jreq	L154
1199                     ; 323     UART2->CR4 |= UART2_CR4_LBDL;
1201  01f0 721a5247      	bset	21063,#5
1204  01f4 81            	ret	
1205  01f5               L154:
1206                     ; 327     UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1208  01f5 721b5247      	bres	21063,#5
1209                     ; 329 }
1212  01f9 81            	ret	
1333                     ; 341 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1333                     ; 342                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1333                     ; 343                      UART2_LinDivUp_TypeDef UART2_DivUp)
1333                     ; 344 {
1334                     	switch	.text
1335  01fa               _UART2_LINConfig:
1337  01fa 89            	pushw	x
1338       00000000      OFST:	set	0
1341                     ; 346   assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1343                     ; 347   assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1345                     ; 348   assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1347                     ; 350   if (UART2_Mode != UART2_LIN_MODE_MASTER)
1349  01fb 9e            	ld	a,xh
1350  01fc 4d            	tnz	a
1351  01fd 2706          	jreq	L335
1352                     ; 352     UART2->CR6 |=  UART2_CR6_LSLV;
1354  01ff 721a5249      	bset	21065,#5
1356  0203 2004          	jra	L535
1357  0205               L335:
1358                     ; 356     UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1360  0205 721b5249      	bres	21065,#5
1361  0209               L535:
1362                     ; 359   if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1364  0209 7b02          	ld	a,(OFST+2,sp)
1365  020b 2706          	jreq	L735
1366                     ; 361     UART2->CR6 |=  UART2_CR6_LASE ;
1368  020d 72185249      	bset	21065,#4
1370  0211 2004          	jra	L145
1371  0213               L735:
1372                     ; 365     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1374  0213 72195249      	bres	21065,#4
1375  0217               L145:
1376                     ; 368   if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1378  0217 7b05          	ld	a,(OFST+5,sp)
1379  0219 2706          	jreq	L345
1380                     ; 370     UART2->CR6 |=  UART2_CR6_LDUM;
1382  021b 721e5249      	bset	21065,#7
1384  021f 2004          	jra	L545
1385  0221               L345:
1386                     ; 374     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1388  0221 721f5249      	bres	21065,#7
1389  0225               L545:
1390                     ; 376 }
1393  0225 85            	popw	x
1394  0226 81            	ret	
1429                     ; 384 void UART2_LINCmd(FunctionalState NewState)
1429                     ; 385 {
1430                     	switch	.text
1431  0227               _UART2_LINCmd:
1435                     ; 386   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1437                     ; 388   if (NewState != DISABLE)
1439  0227 4d            	tnz	a
1440  0228 2705          	jreq	L565
1441                     ; 391     UART2->CR3 |= UART2_CR3_LINEN;
1443  022a 721c5246      	bset	21062,#6
1446  022e 81            	ret	
1447  022f               L565:
1448                     ; 396     UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1450  022f 721d5246      	bres	21062,#6
1451                     ; 398 }
1454  0233 81            	ret	
1489                     ; 406 void UART2_SmartCardCmd(FunctionalState NewState)
1489                     ; 407 {
1490                     	switch	.text
1491  0234               _UART2_SmartCardCmd:
1495                     ; 409   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1497                     ; 411   if (NewState != DISABLE)
1499  0234 4d            	tnz	a
1500  0235 2705          	jreq	L706
1501                     ; 414     UART2->CR5 |= UART2_CR5_SCEN;
1503  0237 721a5248      	bset	21064,#5
1506  023b 81            	ret	
1507  023c               L706:
1508                     ; 419     UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1510  023c 721b5248      	bres	21064,#5
1511                     ; 421 }
1514  0240 81            	ret	
1550                     ; 429 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1550                     ; 430 {
1551                     	switch	.text
1552  0241               _UART2_SmartCardNACKCmd:
1556                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1558                     ; 434   if (NewState != DISABLE)
1560  0241 4d            	tnz	a
1561  0242 2705          	jreq	L136
1562                     ; 437     UART2->CR5 |= UART2_CR5_NACK;
1564  0244 72185248      	bset	21064,#4
1567  0248 81            	ret	
1568  0249               L136:
1569                     ; 442     UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1571  0249 72195248      	bres	21064,#4
1572                     ; 444 }
1575  024d 81            	ret	
1632                     ; 452 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1632                     ; 453 {
1633                     	switch	.text
1634  024e               _UART2_WakeUpConfig:
1638                     ; 454   assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1640                     ; 456   UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1642  024e 72175244      	bres	21060,#3
1643                     ; 457   UART2->CR1 |= (uint8_t)UART2_WakeUp;
1645  0252 ca5244        	or	a,21060
1646  0255 c75244        	ld	21060,a
1647                     ; 458 }
1650  0258 81            	ret	
1686                     ; 466 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1686                     ; 467 {
1687                     	switch	.text
1688  0259               _UART2_ReceiverWakeUpCmd:
1692                     ; 468   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1694                     ; 470   if (NewState != DISABLE)
1696  0259 4d            	tnz	a
1697  025a 2705          	jreq	L107
1698                     ; 473     UART2->CR2 |= UART2_CR2_RWU;
1700  025c 72125245      	bset	21061,#1
1703  0260 81            	ret	
1704  0261               L107:
1705                     ; 478     UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1707  0261 72135245      	bres	21061,#1
1708                     ; 480 }
1711  0265 81            	ret	
1734                     ; 487 uint8_t UART2_ReceiveData8(void)
1734                     ; 488 {
1735                     	switch	.text
1736  0266               _UART2_ReceiveData8:
1740                     ; 489   return ((uint8_t)UART2->DR);
1742  0266 c65241        	ld	a,21057
1745  0269 81            	ret	
1777                     ; 497 uint16_t UART2_ReceiveData9(void)
1777                     ; 498 {
1778                     	switch	.text
1779  026a               _UART2_ReceiveData9:
1781  026a 89            	pushw	x
1782       00000002      OFST:	set	2
1785                     ; 499   uint16_t temp = 0;
1787                     ; 501   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1789  026b c65244        	ld	a,21060
1790  026e a480          	and	a,#128
1791  0270 5f            	clrw	x
1792  0271 02            	rlwa	x,a
1793  0272 58            	sllw	x
1794  0273 1f01          	ldw	(OFST-1,sp),x
1796                     ; 503   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1798  0275 c65241        	ld	a,21057
1799  0278 5f            	clrw	x
1800  0279 97            	ld	xl,a
1801  027a 01            	rrwa	x,a
1802  027b 1a02          	or	a,(OFST+0,sp)
1803  027d 01            	rrwa	x,a
1804  027e 1a01          	or	a,(OFST-1,sp)
1805  0280 a401          	and	a,#1
1806  0282 01            	rrwa	x,a
1809  0283 5b02          	addw	sp,#2
1810  0285 81            	ret	
1842                     ; 511 void UART2_SendData8(uint8_t Data)
1842                     ; 512 {
1843                     	switch	.text
1844  0286               _UART2_SendData8:
1848                     ; 514   UART2->DR = Data;
1850  0286 c75241        	ld	21057,a
1851                     ; 515 }
1854  0289 81            	ret	
1886                     ; 522 void UART2_SendData9(uint16_t Data)
1886                     ; 523 {
1887                     	switch	.text
1888  028a               _UART2_SendData9:
1890  028a 89            	pushw	x
1891       00000000      OFST:	set	0
1894                     ; 525   UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1896  028b 721d5244      	bres	21060,#6
1897                     ; 528   UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1899  028f 54            	srlw	x
1900  0290 54            	srlw	x
1901  0291 9f            	ld	a,xl
1902  0292 a440          	and	a,#64
1903  0294 ca5244        	or	a,21060
1904  0297 c75244        	ld	21060,a
1905                     ; 531   UART2->DR   = (uint8_t)(Data);                    
1907  029a 7b02          	ld	a,(OFST+2,sp)
1908  029c c75241        	ld	21057,a
1909                     ; 532 }
1912  029f 85            	popw	x
1913  02a0 81            	ret	
1936                     ; 539 void UART2_SendBreak(void)
1936                     ; 540 {
1937                     	switch	.text
1938  02a1               _UART2_SendBreak:
1942                     ; 541   UART2->CR2 |= UART2_CR2_SBK;
1944  02a1 72105245      	bset	21061,#0
1945                     ; 542 }
1948  02a5 81            	ret	
1980                     ; 549 void UART2_SetAddress(uint8_t UART2_Address)
1980                     ; 550 {
1981                     	switch	.text
1982  02a6               _UART2_SetAddress:
1984  02a6 88            	push	a
1985       00000000      OFST:	set	0
1988                     ; 552   assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
1990                     ; 555   UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
1992  02a7 c65247        	ld	a,21063
1993  02aa a4f0          	and	a,#240
1994  02ac c75247        	ld	21063,a
1995                     ; 557   UART2->CR4 |= UART2_Address;
1997  02af c65247        	ld	a,21063
1998  02b2 1a01          	or	a,(OFST+1,sp)
1999  02b4 c75247        	ld	21063,a
2000                     ; 558 }
2003  02b7 84            	pop	a
2004  02b8 81            	ret	
2036                     ; 566 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2036                     ; 567 {
2037                     	switch	.text
2038  02b9               _UART2_SetGuardTime:
2042                     ; 569   UART2->GTR = UART2_GuardTime;
2044  02b9 c7524a        	ld	21066,a
2045                     ; 570 }
2048  02bc 81            	ret	
2080                     ; 594 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2080                     ; 595 {
2081                     	switch	.text
2082  02bd               _UART2_SetPrescaler:
2086                     ; 597   UART2->PSCR = UART2_Prescaler;
2088  02bd c7524b        	ld	21067,a
2089                     ; 598 }
2092  02c0 81            	ret	
2249                     ; 606 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2249                     ; 607 {
2250                     	switch	.text
2251  02c1               _UART2_GetFlagStatus:
2253  02c1 89            	pushw	x
2254  02c2 88            	push	a
2255       00000001      OFST:	set	1
2258                     ; 608   FlagStatus status = RESET;
2260                     ; 611   assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2262                     ; 614   if (UART2_FLAG == UART2_FLAG_LBDF)
2264  02c3 a30210        	cpw	x,#528
2265  02c6 2608          	jrne	L3211
2266                     ; 616     if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2268  02c8 9f            	ld	a,xl
2269  02c9 c45247        	and	a,21063
2270  02cc 2726          	jreq	L1311
2271                     ; 619       status = SET;
2273  02ce 201f          	jp	LC008
2274                     ; 624       status = RESET;
2275  02d0               L3211:
2276                     ; 627   else if (UART2_FLAG == UART2_FLAG_SBK)
2278  02d0 a30101        	cpw	x,#257
2279  02d3 2609          	jrne	L3311
2280                     ; 629     if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2282  02d5 c65245        	ld	a,21061
2283  02d8 1503          	bcp	a,(OFST+2,sp)
2284  02da 2717          	jreq	L7411
2285                     ; 632       status = SET;
2287  02dc 2011          	jp	LC008
2288                     ; 637       status = RESET;
2289  02de               L3311:
2290                     ; 640   else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2292  02de a30302        	cpw	x,#770
2293  02e1 2705          	jreq	L5411
2295  02e3 a30301        	cpw	x,#769
2296  02e6 260f          	jrne	L3411
2297  02e8               L5411:
2298                     ; 642     if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2300  02e8 c65249        	ld	a,21065
2301  02eb 1503          	bcp	a,(OFST+2,sp)
2302  02ed 2704          	jreq	L7411
2303                     ; 645       status = SET;
2305  02ef               LC008:
2309  02ef a601          	ld	a,#1
2313  02f1 2001          	jra	L1311
2314  02f3               L7411:
2315                     ; 650       status = RESET;
2319  02f3 4f            	clr	a
2321  02f4               L1311:
2322                     ; 668   return  status;
2326  02f4 5b03          	addw	sp,#3
2327  02f6 81            	ret	
2328  02f7               L3411:
2329                     ; 655     if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2331  02f7 c65240        	ld	a,21056
2332  02fa 1503          	bcp	a,(OFST+2,sp)
2333  02fc 27f5          	jreq	L7411
2334                     ; 658       status = SET;
2336  02fe 20ef          	jp	LC008
2337                     ; 663       status = RESET;
2372                     ; 699 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2372                     ; 700 {
2373                     	switch	.text
2374  0300               _UART2_ClearFlag:
2376       00000000      OFST:	set	0
2379                     ; 701   assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2381                     ; 704   if (UART2_FLAG == UART2_FLAG_RXNE)
2383  0300 a30020        	cpw	x,#32
2384  0303 2605          	jrne	L7711
2385                     ; 706     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2387  0305 35df5240      	mov	21056,#223
2390  0309 81            	ret	
2391  030a               L7711:
2392                     ; 709   else if (UART2_FLAG == UART2_FLAG_LBDF)
2394  030a a30210        	cpw	x,#528
2395  030d 2605          	jrne	L3021
2396                     ; 711     UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2398  030f 72195247      	bres	21063,#4
2401  0313 81            	ret	
2402  0314               L3021:
2403                     ; 714   else if (UART2_FLAG == UART2_FLAG_LHDF)
2405  0314 a30302        	cpw	x,#770
2406  0317 2605          	jrne	L7021
2407                     ; 716     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2409  0319 72135249      	bres	21065,#1
2412  031d 81            	ret	
2413  031e               L7021:
2414                     ; 721     UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2416  031e 72115249      	bres	21065,#0
2417                     ; 723 }
2420  0322 81            	ret	
2494                     ; 738 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2494                     ; 739 {
2495                     	switch	.text
2496  0323               _UART2_GetITStatus:
2498  0323 89            	pushw	x
2499  0324 89            	pushw	x
2500       00000002      OFST:	set	2
2503                     ; 740   ITStatus pendingbitstatus = RESET;
2505                     ; 741   uint8_t itpos = 0;
2507                     ; 742   uint8_t itmask1 = 0;
2509                     ; 743   uint8_t itmask2 = 0;
2511                     ; 744   uint8_t enablestatus = 0;
2513                     ; 747   assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2515                     ; 750   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2517  0325 9f            	ld	a,xl
2518  0326 a40f          	and	a,#15
2519  0328 5f            	clrw	x
2520  0329 97            	ld	xl,a
2521  032a a601          	ld	a,#1
2522  032c 5d            	tnzw	x
2523  032d 2704          	jreq	L67
2524  032f               L001:
2525  032f 48            	sll	a
2526  0330 5a            	decw	x
2527  0331 26fc          	jrne	L001
2528  0333               L67:
2529  0333 6b01          	ld	(OFST-1,sp),a
2531                     ; 752   itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2533  0335 7b04          	ld	a,(OFST+2,sp)
2534  0337 4e            	swap	a
2535  0338 a40f          	and	a,#15
2536  033a 6b02          	ld	(OFST+0,sp),a
2538                     ; 754   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2540  033c 5f            	clrw	x
2541  033d 97            	ld	xl,a
2542  033e a601          	ld	a,#1
2543  0340 5d            	tnzw	x
2544  0341 2704          	jreq	L201
2545  0343               L401:
2546  0343 48            	sll	a
2547  0344 5a            	decw	x
2548  0345 26fc          	jrne	L401
2549  0347               L201:
2550  0347 6b02          	ld	(OFST+0,sp),a
2552                     ; 757   if (UART2_IT == UART2_IT_PE)
2554  0349 1e03          	ldw	x,(OFST+1,sp)
2555  034b a30100        	cpw	x,#256
2556  034e 260c          	jrne	L5421
2557                     ; 760     enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2559  0350 c65244        	ld	a,21060
2560  0353 1402          	and	a,(OFST+0,sp)
2561  0355 6b02          	ld	(OFST+0,sp),a
2563                     ; 763     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2565  0357 c65240        	ld	a,21056
2567                     ; 766       pendingbitstatus = SET;
2569  035a 2020          	jp	LC011
2570                     ; 771       pendingbitstatus = RESET;
2571  035c               L5421:
2572                     ; 774   else if (UART2_IT == UART2_IT_LBDF)
2574  035c a30346        	cpw	x,#838
2575  035f 260c          	jrne	L5521
2576                     ; 777     enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2578  0361 c65247        	ld	a,21063
2579  0364 1402          	and	a,(OFST+0,sp)
2580  0366 6b02          	ld	(OFST+0,sp),a
2582                     ; 779     if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2584  0368 c65247        	ld	a,21063
2586                     ; 782       pendingbitstatus = SET;
2588  036b 200f          	jp	LC011
2589                     ; 787       pendingbitstatus = RESET;
2590  036d               L5521:
2591                     ; 790   else if (UART2_IT == UART2_IT_LHDF)
2593  036d a30412        	cpw	x,#1042
2594  0370 2616          	jrne	L5621
2595                     ; 793     enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2597  0372 c65249        	ld	a,21065
2598  0375 1402          	and	a,(OFST+0,sp)
2599  0377 6b02          	ld	(OFST+0,sp),a
2601                     ; 795     if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2603  0379 c65249        	ld	a,21065
2605  037c               LC011:
2606  037c 1501          	bcp	a,(OFST-1,sp)
2607  037e 271a          	jreq	L5721
2608  0380 7b02          	ld	a,(OFST+0,sp)
2609  0382 2716          	jreq	L5721
2610                     ; 798       pendingbitstatus = SET;
2612  0384               LC010:
2616  0384 a601          	ld	a,#1
2619  0386 2013          	jra	L3521
2620                     ; 803       pendingbitstatus = RESET;
2621  0388               L5621:
2622                     ; 809     enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2624  0388 c65245        	ld	a,21061
2625  038b 1402          	and	a,(OFST+0,sp)
2626  038d 6b02          	ld	(OFST+0,sp),a
2628                     ; 811     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2630  038f c65240        	ld	a,21056
2631  0392 1501          	bcp	a,(OFST-1,sp)
2632  0394 2704          	jreq	L5721
2634  0396 7b02          	ld	a,(OFST+0,sp)
2635                     ; 814       pendingbitstatus = SET;
2637  0398 26ea          	jrne	LC010
2638  039a               L5721:
2639                     ; 819       pendingbitstatus = RESET;
2644  039a 4f            	clr	a
2646  039b               L3521:
2647                     ; 823   return  pendingbitstatus;
2651  039b 5b04          	addw	sp,#4
2652  039d 81            	ret	
2688                     ; 852 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2688                     ; 853 {
2689                     	switch	.text
2690  039e               _UART2_ClearITPendingBit:
2692       00000000      OFST:	set	0
2695                     ; 854   assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2697                     ; 857   if (UART2_IT == UART2_IT_RXNE)
2699  039e a30255        	cpw	x,#597
2700  03a1 2605          	jrne	L7131
2701                     ; 859     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2703  03a3 35df5240      	mov	21056,#223
2706  03a7 81            	ret	
2707  03a8               L7131:
2708                     ; 862   else if (UART2_IT == UART2_IT_LBDF)
2710  03a8 a30346        	cpw	x,#838
2711  03ab 2605          	jrne	L3231
2712                     ; 864     UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2714  03ad 72195247      	bres	21063,#4
2717  03b1 81            	ret	
2718  03b2               L3231:
2719                     ; 869     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2721  03b2 72135249      	bres	21065,#1
2722                     ; 871 }
2725  03b6 81            	ret	
2738                     	xdef	_UART2_ClearITPendingBit
2739                     	xdef	_UART2_GetITStatus
2740                     	xdef	_UART2_ClearFlag
2741                     	xdef	_UART2_GetFlagStatus
2742                     	xdef	_UART2_SetPrescaler
2743                     	xdef	_UART2_SetGuardTime
2744                     	xdef	_UART2_SetAddress
2745                     	xdef	_UART2_SendBreak
2746                     	xdef	_UART2_SendData9
2747                     	xdef	_UART2_SendData8
2748                     	xdef	_UART2_ReceiveData9
2749                     	xdef	_UART2_ReceiveData8
2750                     	xdef	_UART2_ReceiverWakeUpCmd
2751                     	xdef	_UART2_WakeUpConfig
2752                     	xdef	_UART2_SmartCardNACKCmd
2753                     	xdef	_UART2_SmartCardCmd
2754                     	xdef	_UART2_LINCmd
2755                     	xdef	_UART2_LINConfig
2756                     	xdef	_UART2_LINBreakDetectionConfig
2757                     	xdef	_UART2_IrDACmd
2758                     	xdef	_UART2_IrDAConfig
2759                     	xdef	_UART2_ITConfig
2760                     	xdef	_UART2_Cmd
2761                     	xdef	_UART2_Init
2762                     	xdef	_UART2_DeInit
2763                     	xref	_CLK_GetClockFreq
2764                     	xref.b	c_lreg
2765                     	xref.b	c_x
2784                     	xref	c_lursh
2785                     	xref	c_lsub
2786                     	xref	c_smul
2787                     	xref	c_ludv
2788                     	xref	c_rtol
2789                     	xref	c_llsh
2790                     	xref	c_ltor
2791                     	end
