   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  42                     ; 50 void SPI_DeInit(void)
  42                     ; 51 {
  43                     	switch	.text
  44  0000               f_SPI_DeInit:
  48                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  50  0000 725f5200      	clr	20992
  51                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  53  0004 725f5201      	clr	20993
  54                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  56  0008 725f5202      	clr	20994
  57                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  59  000c 35025203      	mov	20995,#2
  60                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  62  0010 35075205      	mov	20997,#7
  63                     ; 57 }
  66  0014 87            	retf
 379                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 379                     ; 79 {
 380                     	switch	.text
 381  0015               f_SPI_Init:
 383  0015 89            	pushw	x
 384  0016 88            	push	a
 385       00000001      OFST:	set	1
 388                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 390                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 392                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 394                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 396                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 398                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 400                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 402                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 404                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 404                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 406  0017 7b08          	ld	a,(OFST+7,sp)
 407  0019 1a09          	or	a,(OFST+8,sp)
 408  001b 6b01          	ld	(OFST+0,sp),a
 410  001d 9f            	ld	a,xl
 411  001e 1a02          	or	a,(OFST+1,sp)
 412  0020 1a01          	or	a,(OFST+0,sp)
 413  0022 c75200        	ld	20992,a
 414                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 416  0025 7b0a          	ld	a,(OFST+9,sp)
 417  0027 1a0b          	or	a,(OFST+10,sp)
 418  0029 c75201        	ld	20993,a
 419                     ; 97   if (Mode == SPI_MODE_MASTER)
 421  002c 7b07          	ld	a,(OFST+6,sp)
 422  002e a104          	cp	a,#4
 423  0030 2606          	jrne	L102
 424                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 426  0032 72105201      	bset	20993,#0
 428  0036 2004          	jra	L302
 429  0038               L102:
 430                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 432  0038 72115201      	bres	20993,#0
 433  003c               L302:
 434                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 436  003c c65200        	ld	a,20992
 437  003f 1a07          	or	a,(OFST+6,sp)
 438  0041 c75200        	ld	20992,a
 439                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 441  0044 7b0c          	ld	a,(OFST+11,sp)
 442  0046 c75205        	ld	20997,a
 443                     ; 111 }
 446  0049 5b03          	addw	sp,#3
 447  004b 87            	retf
 501                     ; 119 void SPI_Cmd(FunctionalState NewState)
 501                     ; 120 {
 502                     	switch	.text
 503  004c               f_SPI_Cmd:
 507                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 509                     ; 124   if (NewState != DISABLE)
 511  004c 4d            	tnz	a
 512  004d 2706          	jreq	L332
 513                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 515  004f 721c5200      	bset	20992,#6
 517  0053 2004          	jra	L532
 518  0055               L332:
 519                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 521  0055 721d5200      	bres	20992,#6
 522  0059               L532:
 523                     ; 132 }
 526  0059 87            	retf
 632                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 632                     ; 142 {
 633                     	switch	.text
 634  005a               f_SPI_ITConfig:
 636  005a 89            	pushw	x
 637  005b 88            	push	a
 638       00000001      OFST:	set	1
 641                     ; 143   uint8_t itpos = 0;
 643                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 645                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 647                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 649  005c 9e            	ld	a,xh
 650  005d a40f          	and	a,#15
 651  005f 5f            	clrw	x
 652  0060 97            	ld	xl,a
 653  0061 a601          	ld	a,#1
 654  0063 5d            	tnzw	x
 655  0064 2704          	jreq	L41
 656  0066               L61:
 657  0066 48            	sll	a
 658  0067 5a            	decw	x
 659  0068 26fc          	jrne	L61
 660  006a               L41:
 661  006a 6b01          	ld	(OFST+0,sp),a
 663                     ; 151   if (NewState != DISABLE)
 665  006c 0d03          	tnz	(OFST+2,sp)
 666  006e 270a          	jreq	L503
 667                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 669  0070 c65202        	ld	a,20994
 670  0073 1a01          	or	a,(OFST+0,sp)
 671  0075 c75202        	ld	20994,a
 673  0078 2009          	jra	L703
 674  007a               L503:
 675                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 677  007a 7b01          	ld	a,(OFST+0,sp)
 678  007c 43            	cpl	a
 679  007d c45202        	and	a,20994
 680  0080 c75202        	ld	20994,a
 681  0083               L703:
 682                     ; 159 }
 685  0083 5b03          	addw	sp,#3
 686  0085 87            	retf
 717                     ; 166 void SPI_SendData(uint8_t Data)
 717                     ; 167 {
 718                     	switch	.text
 719  0086               f_SPI_SendData:
 723                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 725  0086 c75204        	ld	20996,a
 726                     ; 169 }
 729  0089 87            	retf
 751                     ; 176 uint8_t SPI_ReceiveData(void)
 751                     ; 177 {
 752                     	switch	.text
 753  008a               f_SPI_ReceiveData:
 757                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 759  008a c65204        	ld	a,20996
 762  008d 87            	retf
 797                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 797                     ; 188 {
 798                     	switch	.text
 799  008e               f_SPI_NSSInternalSoftwareCmd:
 803                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 805                     ; 192   if (NewState != DISABLE)
 807  008e 4d            	tnz	a
 808  008f 2706          	jreq	L353
 809                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 811  0091 72105201      	bset	20993,#0
 813  0095 2004          	jra	L553
 814  0097               L353:
 815                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 817  0097 72115201      	bres	20993,#0
 818  009b               L553:
 819                     ; 200 }
 822  009b 87            	retf
 844                     ; 207 void SPI_TransmitCRC(void)
 844                     ; 208 {
 845                     	switch	.text
 846  009c               f_SPI_TransmitCRC:
 850                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 852  009c 72185201      	bset	20993,#4
 853                     ; 210 }
 856  00a0 87            	retf
 891                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 891                     ; 219 {
 892                     	switch	.text
 893  00a1               f_SPI_CalculateCRCCmd:
 897                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 899                     ; 223   if (NewState != DISABLE)
 901  00a1 4d            	tnz	a
 902  00a2 2706          	jreq	L504
 903                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 905  00a4 721a5201      	bset	20993,#5
 907  00a8 2004          	jra	L704
 908  00aa               L504:
 909                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 911  00aa 721b5201      	bres	20993,#5
 912  00ae               L704:
 913                     ; 231 }
 916  00ae 87            	retf
 977                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 977                     ; 239 {
 978                     	switch	.text
 979  00af               f_SPI_GetCRC:
 981  00af 88            	push	a
 982       00000001      OFST:	set	1
 985                     ; 240   uint8_t crcreg = 0;
 987                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
 989                     ; 245   if (SPI_CRC != SPI_CRC_RX)
 991  00b0 4d            	tnz	a
 992  00b1 2707          	jreq	L144
 993                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
 995  00b3 c65207        	ld	a,20999
 996  00b6 6b01          	ld	(OFST+0,sp),a
 999  00b8 2005          	jra	L344
1000  00ba               L144:
1001                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1003  00ba c65206        	ld	a,20998
1004  00bd 6b01          	ld	(OFST+0,sp),a
1006  00bf               L344:
1007                     ; 255   return crcreg;
1009  00bf 7b01          	ld	a,(OFST+0,sp)
1012  00c1 5b01          	addw	sp,#1
1013  00c3 87            	retf
1037                     ; 263 void SPI_ResetCRC(void)
1037                     ; 264 {
1038                     	switch	.text
1039  00c4               f_SPI_ResetCRC:
1043                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1045  00c4 a601          	ld	a,#1
1046  00c6 8da100a1      	callf	f_SPI_CalculateCRCCmd
1048                     ; 270   SPI_Cmd(ENABLE);
1050  00ca a601          	ld	a,#1
1051  00cc 8d4c004c      	callf	f_SPI_Cmd
1053                     ; 271 }
1056  00d0 87            	retf
1079                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1079                     ; 279 {
1080                     	switch	.text
1081  00d1               f_SPI_GetCRCPolynomial:
1085                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1087  00d1 c65205        	ld	a,20997
1090  00d4 87            	retf
1145                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1145                     ; 289 {
1146                     	switch	.text
1147  00d5               f_SPI_BiDirectionalLineConfig:
1151                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1153                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1155  00d5 4d            	tnz	a
1156  00d6 2706          	jreq	L315
1157                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1159  00d8 721c5201      	bset	20993,#6
1161  00dc 2004          	jra	L515
1162  00de               L315:
1163                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1165  00de 721d5201      	bres	20993,#6
1166  00e2               L515:
1167                     ; 301 }
1170  00e2 87            	retf
1290                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1290                     ; 312 {
1291                     	switch	.text
1292  00e3               f_SPI_GetFlagStatus:
1294  00e3 88            	push	a
1295       00000001      OFST:	set	1
1298                     ; 313   FlagStatus status = RESET;
1300                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1302                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1304  00e4 c45203        	and	a,20995
1305  00e7 2706          	jreq	L375
1306                     ; 320     status = SET; /* SPI_FLAG is set */
1308  00e9 a601          	ld	a,#1
1309  00eb 6b01          	ld	(OFST+0,sp),a
1312  00ed 2002          	jra	L575
1313  00ef               L375:
1314                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1316  00ef 0f01          	clr	(OFST+0,sp)
1318  00f1               L575:
1319                     ; 328   return status;
1321  00f1 7b01          	ld	a,(OFST+0,sp)
1324  00f3 5b01          	addw	sp,#1
1325  00f5 87            	retf
1359                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1359                     ; 347 {
1360                     	switch	.text
1361  00f6               f_SPI_ClearFlag:
1365                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1367                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1369  00f6 43            	cpl	a
1370  00f7 c75203        	ld	20995,a
1371                     ; 351 }
1374  00fa 87            	retf
1447                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1447                     ; 367 {
1448                     	switch	.text
1449  00fb               f_SPI_GetITStatus:
1451  00fb 88            	push	a
1452  00fc 89            	pushw	x
1453       00000002      OFST:	set	2
1456                     ; 368   ITStatus pendingbitstatus = RESET;
1458                     ; 369   uint8_t itpos = 0;
1460                     ; 370   uint8_t itmask1 = 0;
1462                     ; 371   uint8_t itmask2 = 0;
1464                     ; 372   uint8_t enablestatus = 0;
1466                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1468                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1470  00fd a40f          	and	a,#15
1471  00ff 5f            	clrw	x
1472  0100 97            	ld	xl,a
1473  0101 a601          	ld	a,#1
1474  0103 5d            	tnzw	x
1475  0104 2704          	jreq	L05
1476  0106               L25:
1477  0106 48            	sll	a
1478  0107 5a            	decw	x
1479  0108 26fc          	jrne	L25
1480  010a               L05:
1481  010a 6b01          	ld	(OFST-1,sp),a
1483                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1485  010c 7b03          	ld	a,(OFST+1,sp)
1486  010e 4e            	swap	a
1487  010f a40f          	and	a,#15
1488  0111 6b02          	ld	(OFST+0,sp),a
1490                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1492  0113 7b02          	ld	a,(OFST+0,sp)
1493  0115 5f            	clrw	x
1494  0116 97            	ld	xl,a
1495  0117 a601          	ld	a,#1
1496  0119 5d            	tnzw	x
1497  011a 2704          	jreq	L45
1498  011c               L65:
1499  011c 48            	sll	a
1500  011d 5a            	decw	x
1501  011e 26fc          	jrne	L65
1502  0120               L45:
1503  0120 6b02          	ld	(OFST+0,sp),a
1505                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1507  0122 c65203        	ld	a,20995
1508  0125 1402          	and	a,(OFST+0,sp)
1509  0127 6b02          	ld	(OFST+0,sp),a
1511                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1513  0129 c65202        	ld	a,20994
1514  012c 1501          	bcp	a,(OFST-1,sp)
1515  012e 270a          	jreq	L746
1517  0130 0d02          	tnz	(OFST+0,sp)
1518  0132 2706          	jreq	L746
1519                     ; 387     pendingbitstatus = SET;
1521  0134 a601          	ld	a,#1
1522  0136 6b02          	ld	(OFST+0,sp),a
1525  0138 2002          	jra	L156
1526  013a               L746:
1527                     ; 392     pendingbitstatus = RESET;
1529  013a 0f02          	clr	(OFST+0,sp)
1531  013c               L156:
1532                     ; 395   return  pendingbitstatus;
1534  013c 7b02          	ld	a,(OFST+0,sp)
1537  013e 5b03          	addw	sp,#3
1538  0140 87            	retf
1580                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1580                     ; 413 {
1581                     	switch	.text
1582  0141               f_SPI_ClearITPendingBit:
1584  0141 88            	push	a
1585       00000001      OFST:	set	1
1588                     ; 414   uint8_t itpos = 0;
1590                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1592                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1594  0142 a4f0          	and	a,#240
1595  0144 4e            	swap	a
1596  0145 a40f          	and	a,#15
1597  0147 5f            	clrw	x
1598  0148 97            	ld	xl,a
1599  0149 a601          	ld	a,#1
1600  014b 5d            	tnzw	x
1601  014c 2704          	jreq	L26
1602  014e               L46:
1603  014e 48            	sll	a
1604  014f 5a            	decw	x
1605  0150 26fc          	jrne	L46
1606  0152               L26:
1607  0152 6b01          	ld	(OFST+0,sp),a
1609                     ; 422   SPI->SR = (uint8_t)(~itpos);
1611  0154 7b01          	ld	a,(OFST+0,sp)
1612  0156 43            	cpl	a
1613  0157 c75203        	ld	20995,a
1614                     ; 424 }
1617  015a 84            	pop	a
1618  015b 87            	retf
1630                     	xdef	f_SPI_ClearITPendingBit
1631                     	xdef	f_SPI_GetITStatus
1632                     	xdef	f_SPI_ClearFlag
1633                     	xdef	f_SPI_GetFlagStatus
1634                     	xdef	f_SPI_BiDirectionalLineConfig
1635                     	xdef	f_SPI_GetCRCPolynomial
1636                     	xdef	f_SPI_ResetCRC
1637                     	xdef	f_SPI_GetCRC
1638                     	xdef	f_SPI_CalculateCRCCmd
1639                     	xdef	f_SPI_TransmitCRC
1640                     	xdef	f_SPI_NSSInternalSoftwareCmd
1641                     	xdef	f_SPI_ReceiveData
1642                     	xdef	f_SPI_SendData
1643                     	xdef	f_SPI_ITConfig
1644                     	xdef	f_SPI_Cmd
1645                     	xdef	f_SPI_Init
1646                     	xdef	f_SPI_DeInit
1665                     	end
