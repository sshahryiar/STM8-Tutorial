   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  42                     ; 50 void SPI_DeInit(void)
  42                     ; 51 {
  44                     	switch	.text
  45  0000               _SPI_DeInit:
  49                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  51  0000 725f5200      	clr	20992
  52                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  54  0004 725f5201      	clr	20993
  55                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  57  0008 725f5202      	clr	20994
  58                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  60  000c 35025203      	mov	20995,#2
  61                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  63  0010 35075205      	mov	20997,#7
  64                     ; 57 }
  67  0014 81            	ret
 381                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 381                     ; 79 {
 382                     	switch	.text
 383  0015               _SPI_Init:
 385  0015 89            	pushw	x
 386  0016 88            	push	a
 387       00000001      OFST:	set	1
 390                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 392                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 394                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 396                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 398                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 400                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 402                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 404                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 406                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 406                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 408  0017 7b07          	ld	a,(OFST+6,sp)
 409  0019 1a08          	or	a,(OFST+7,sp)
 410  001b 6b01          	ld	(OFST+0,sp),a
 412  001d 9f            	ld	a,xl
 413  001e 1a02          	or	a,(OFST+1,sp)
 414  0020 1a01          	or	a,(OFST+0,sp)
 415  0022 c75200        	ld	20992,a
 416                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 418  0025 7b09          	ld	a,(OFST+8,sp)
 419  0027 1a0a          	or	a,(OFST+9,sp)
 420  0029 c75201        	ld	20993,a
 421                     ; 97   if (Mode == SPI_MODE_MASTER)
 423  002c 7b06          	ld	a,(OFST+5,sp)
 424  002e a104          	cp	a,#4
 425  0030 2606          	jrne	L102
 426                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 428  0032 72105201      	bset	20993,#0
 430  0036 2004          	jra	L302
 431  0038               L102:
 432                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 434  0038 72115201      	bres	20993,#0
 435  003c               L302:
 436                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 438  003c c65200        	ld	a,20992
 439  003f 1a06          	or	a,(OFST+5,sp)
 440  0041 c75200        	ld	20992,a
 441                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 443  0044 7b0b          	ld	a,(OFST+10,sp)
 444  0046 c75205        	ld	20997,a
 445                     ; 111 }
 448  0049 5b03          	addw	sp,#3
 449  004b 81            	ret
 504                     ; 119 void SPI_Cmd(FunctionalState NewState)
 504                     ; 120 {
 505                     	switch	.text
 506  004c               _SPI_Cmd:
 510                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 512                     ; 124   if (NewState != DISABLE)
 514  004c 4d            	tnz	a
 515  004d 2706          	jreq	L332
 516                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 518  004f 721c5200      	bset	20992,#6
 520  0053 2004          	jra	L532
 521  0055               L332:
 522                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 524  0055 721d5200      	bres	20992,#6
 525  0059               L532:
 526                     ; 132 }
 529  0059 81            	ret
 636                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 636                     ; 142 {
 637                     	switch	.text
 638  005a               _SPI_ITConfig:
 640  005a 89            	pushw	x
 641  005b 88            	push	a
 642       00000001      OFST:	set	1
 645                     ; 143   uint8_t itpos = 0;
 647                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 649                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 651                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 653  005c 9e            	ld	a,xh
 654  005d a40f          	and	a,#15
 655  005f 5f            	clrw	x
 656  0060 97            	ld	xl,a
 657  0061 a601          	ld	a,#1
 658  0063 5d            	tnzw	x
 659  0064 2704          	jreq	L41
 660  0066               L61:
 661  0066 48            	sll	a
 662  0067 5a            	decw	x
 663  0068 26fc          	jrne	L61
 664  006a               L41:
 665  006a 6b01          	ld	(OFST+0,sp),a
 667                     ; 151   if (NewState != DISABLE)
 669  006c 0d03          	tnz	(OFST+2,sp)
 670  006e 270a          	jreq	L503
 671                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 673  0070 c65202        	ld	a,20994
 674  0073 1a01          	or	a,(OFST+0,sp)
 675  0075 c75202        	ld	20994,a
 677  0078 2009          	jra	L703
 678  007a               L503:
 679                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 681  007a 7b01          	ld	a,(OFST+0,sp)
 682  007c 43            	cpl	a
 683  007d c45202        	and	a,20994
 684  0080 c75202        	ld	20994,a
 685  0083               L703:
 686                     ; 159 }
 689  0083 5b03          	addw	sp,#3
 690  0085 81            	ret
 722                     ; 166 void SPI_SendData(uint8_t Data)
 722                     ; 167 {
 723                     	switch	.text
 724  0086               _SPI_SendData:
 728                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 730  0086 c75204        	ld	20996,a
 731                     ; 169 }
 734  0089 81            	ret
 757                     ; 176 uint8_t SPI_ReceiveData(void)
 757                     ; 177 {
 758                     	switch	.text
 759  008a               _SPI_ReceiveData:
 763                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 765  008a c65204        	ld	a,20996
 768  008d 81            	ret
 804                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 804                     ; 188 {
 805                     	switch	.text
 806  008e               _SPI_NSSInternalSoftwareCmd:
 810                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 812                     ; 192   if (NewState != DISABLE)
 814  008e 4d            	tnz	a
 815  008f 2706          	jreq	L353
 816                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 818  0091 72105201      	bset	20993,#0
 820  0095 2004          	jra	L553
 821  0097               L353:
 822                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 824  0097 72115201      	bres	20993,#0
 825  009b               L553:
 826                     ; 200 }
 829  009b 81            	ret
 852                     ; 207 void SPI_TransmitCRC(void)
 852                     ; 208 {
 853                     	switch	.text
 854  009c               _SPI_TransmitCRC:
 858                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 860  009c 72185201      	bset	20993,#4
 861                     ; 210 }
 864  00a0 81            	ret
 900                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 900                     ; 219 {
 901                     	switch	.text
 902  00a1               _SPI_CalculateCRCCmd:
 906                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 908                     ; 223   if (NewState != DISABLE)
 910  00a1 4d            	tnz	a
 911  00a2 2706          	jreq	L504
 912                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 914  00a4 721a5201      	bset	20993,#5
 916  00a8 2004          	jra	L704
 917  00aa               L504:
 918                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 920  00aa 721b5201      	bres	20993,#5
 921  00ae               L704:
 922                     ; 231 }
 925  00ae 81            	ret
 987                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 987                     ; 239 {
 988                     	switch	.text
 989  00af               _SPI_GetCRC:
 991  00af 88            	push	a
 992       00000001      OFST:	set	1
 995                     ; 240   uint8_t crcreg = 0;
 997                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
 999                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1001  00b0 4d            	tnz	a
1002  00b1 2707          	jreq	L144
1003                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1005  00b3 c65207        	ld	a,20999
1006  00b6 6b01          	ld	(OFST+0,sp),a
1009  00b8 2005          	jra	L344
1010  00ba               L144:
1011                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1013  00ba c65206        	ld	a,20998
1014  00bd 6b01          	ld	(OFST+0,sp),a
1016  00bf               L344:
1017                     ; 255   return crcreg;
1019  00bf 7b01          	ld	a,(OFST+0,sp)
1022  00c1 5b01          	addw	sp,#1
1023  00c3 81            	ret
1048                     ; 263 void SPI_ResetCRC(void)
1048                     ; 264 {
1049                     	switch	.text
1050  00c4               _SPI_ResetCRC:
1054                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1056  00c4 a601          	ld	a,#1
1057  00c6 add9          	call	_SPI_CalculateCRCCmd
1059                     ; 270   SPI_Cmd(ENABLE);
1061  00c8 a601          	ld	a,#1
1062  00ca ad80          	call	_SPI_Cmd
1064                     ; 271 }
1067  00cc 81            	ret
1091                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1091                     ; 279 {
1092                     	switch	.text
1093  00cd               _SPI_GetCRCPolynomial:
1097                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1099  00cd c65205        	ld	a,20997
1102  00d0 81            	ret
1158                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1158                     ; 289 {
1159                     	switch	.text
1160  00d1               _SPI_BiDirectionalLineConfig:
1164                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1166                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1168  00d1 4d            	tnz	a
1169  00d2 2706          	jreq	L315
1170                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1172  00d4 721c5201      	bset	20993,#6
1174  00d8 2004          	jra	L515
1175  00da               L315:
1176                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1178  00da 721d5201      	bres	20993,#6
1179  00de               L515:
1180                     ; 301 }
1183  00de 81            	ret
1304                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1304                     ; 312 {
1305                     	switch	.text
1306  00df               _SPI_GetFlagStatus:
1308  00df 88            	push	a
1309       00000001      OFST:	set	1
1312                     ; 313   FlagStatus status = RESET;
1314                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1316                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1318  00e0 c45203        	and	a,20995
1319  00e3 2706          	jreq	L375
1320                     ; 320     status = SET; /* SPI_FLAG is set */
1322  00e5 a601          	ld	a,#1
1323  00e7 6b01          	ld	(OFST+0,sp),a
1326  00e9 2002          	jra	L575
1327  00eb               L375:
1328                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1330  00eb 0f01          	clr	(OFST+0,sp)
1332  00ed               L575:
1333                     ; 328   return status;
1335  00ed 7b01          	ld	a,(OFST+0,sp)
1338  00ef 5b01          	addw	sp,#1
1339  00f1 81            	ret
1374                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1374                     ; 347 {
1375                     	switch	.text
1376  00f2               _SPI_ClearFlag:
1380                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1382                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1384  00f2 43            	cpl	a
1385  00f3 c75203        	ld	20995,a
1386                     ; 351 }
1389  00f6 81            	ret
1463                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1463                     ; 367 {
1464                     	switch	.text
1465  00f7               _SPI_GetITStatus:
1467  00f7 88            	push	a
1468  00f8 89            	pushw	x
1469       00000002      OFST:	set	2
1472                     ; 368   ITStatus pendingbitstatus = RESET;
1474                     ; 369   uint8_t itpos = 0;
1476                     ; 370   uint8_t itmask1 = 0;
1478                     ; 371   uint8_t itmask2 = 0;
1480                     ; 372   uint8_t enablestatus = 0;
1482                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1484                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1486  00f9 a40f          	and	a,#15
1487  00fb 5f            	clrw	x
1488  00fc 97            	ld	xl,a
1489  00fd a601          	ld	a,#1
1490  00ff 5d            	tnzw	x
1491  0100 2704          	jreq	L05
1492  0102               L25:
1493  0102 48            	sll	a
1494  0103 5a            	decw	x
1495  0104 26fc          	jrne	L25
1496  0106               L05:
1497  0106 6b01          	ld	(OFST-1,sp),a
1499                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1501  0108 7b03          	ld	a,(OFST+1,sp)
1502  010a 4e            	swap	a
1503  010b a40f          	and	a,#15
1504  010d 6b02          	ld	(OFST+0,sp),a
1506                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1508  010f 7b02          	ld	a,(OFST+0,sp)
1509  0111 5f            	clrw	x
1510  0112 97            	ld	xl,a
1511  0113 a601          	ld	a,#1
1512  0115 5d            	tnzw	x
1513  0116 2704          	jreq	L45
1514  0118               L65:
1515  0118 48            	sll	a
1516  0119 5a            	decw	x
1517  011a 26fc          	jrne	L65
1518  011c               L45:
1519  011c 6b02          	ld	(OFST+0,sp),a
1521                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1523  011e c65203        	ld	a,20995
1524  0121 1402          	and	a,(OFST+0,sp)
1525  0123 6b02          	ld	(OFST+0,sp),a
1527                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1529  0125 c65202        	ld	a,20994
1530  0128 1501          	bcp	a,(OFST-1,sp)
1531  012a 270a          	jreq	L746
1533  012c 0d02          	tnz	(OFST+0,sp)
1534  012e 2706          	jreq	L746
1535                     ; 387     pendingbitstatus = SET;
1537  0130 a601          	ld	a,#1
1538  0132 6b02          	ld	(OFST+0,sp),a
1541  0134 2002          	jra	L156
1542  0136               L746:
1543                     ; 392     pendingbitstatus = RESET;
1545  0136 0f02          	clr	(OFST+0,sp)
1547  0138               L156:
1548                     ; 395   return  pendingbitstatus;
1550  0138 7b02          	ld	a,(OFST+0,sp)
1553  013a 5b03          	addw	sp,#3
1554  013c 81            	ret
1597                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1597                     ; 413 {
1598                     	switch	.text
1599  013d               _SPI_ClearITPendingBit:
1601  013d 88            	push	a
1602       00000001      OFST:	set	1
1605                     ; 414   uint8_t itpos = 0;
1607                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1609                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1611  013e a4f0          	and	a,#240
1612  0140 4e            	swap	a
1613  0141 a40f          	and	a,#15
1614  0143 5f            	clrw	x
1615  0144 97            	ld	xl,a
1616  0145 a601          	ld	a,#1
1617  0147 5d            	tnzw	x
1618  0148 2704          	jreq	L26
1619  014a               L46:
1620  014a 48            	sll	a
1621  014b 5a            	decw	x
1622  014c 26fc          	jrne	L46
1623  014e               L26:
1624  014e 6b01          	ld	(OFST+0,sp),a
1626                     ; 422   SPI->SR = (uint8_t)(~itpos);
1628  0150 7b01          	ld	a,(OFST+0,sp)
1629  0152 43            	cpl	a
1630  0153 c75203        	ld	20995,a
1631                     ; 424 }
1634  0156 84            	pop	a
1635  0157 81            	ret
1648                     	xdef	_SPI_ClearITPendingBit
1649                     	xdef	_SPI_GetITStatus
1650                     	xdef	_SPI_ClearFlag
1651                     	xdef	_SPI_GetFlagStatus
1652                     	xdef	_SPI_BiDirectionalLineConfig
1653                     	xdef	_SPI_GetCRCPolynomial
1654                     	xdef	_SPI_ResetCRC
1655                     	xdef	_SPI_GetCRC
1656                     	xdef	_SPI_CalculateCRCCmd
1657                     	xdef	_SPI_TransmitCRC
1658                     	xdef	_SPI_NSSInternalSoftwareCmd
1659                     	xdef	_SPI_ReceiveData
1660                     	xdef	_SPI_SendData
1661                     	xdef	_SPI_ITConfig
1662                     	xdef	_SPI_Cmd
1663                     	xdef	_SPI_Init
1664                     	xdef	_SPI_DeInit
1683                     	end
