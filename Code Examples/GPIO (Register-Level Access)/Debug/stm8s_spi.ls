   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  43                     ; 50 void SPI_DeInit(void)
  43                     ; 51 {
  45                     	switch	.text
  46  0000               _SPI_DeInit:
  50                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  52  0000 725f5200      	clr	20992
  53                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  55  0004 725f5201      	clr	20993
  56                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  58  0008 725f5202      	clr	20994
  59                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  61  000c 35025203      	mov	20995,#2
  62                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  64  0010 35075205      	mov	20997,#7
  65                     ; 57 }
  68  0014 81            	ret
 384                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 384                     ; 79 {
 385                     	switch	.text
 386  0015               _SPI_Init:
 388  0015 89            	pushw	x
 389  0016 88            	push	a
 390       00000001      OFST:	set	1
 393                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 395                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 397                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 399                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 401                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 403                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 405                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 407                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 409                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 409                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 411  0017 7b07          	ld	a,(OFST+6,sp)
 412  0019 1a08          	or	a,(OFST+7,sp)
 413  001b 6b01          	ld	(OFST+0,sp),a
 415  001d 9f            	ld	a,xl
 416  001e 1a02          	or	a,(OFST+1,sp)
 417  0020 1a01          	or	a,(OFST+0,sp)
 418  0022 c75200        	ld	20992,a
 419                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 421  0025 7b09          	ld	a,(OFST+8,sp)
 422  0027 1a0a          	or	a,(OFST+9,sp)
 423  0029 c75201        	ld	20993,a
 424                     ; 97   if (Mode == SPI_MODE_MASTER)
 426  002c 7b06          	ld	a,(OFST+5,sp)
 427  002e a104          	cp	a,#4
 428  0030 2606          	jrne	L302
 429                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 431  0032 72105201      	bset	20993,#0
 433  0036 2004          	jra	L502
 434  0038               L302:
 435                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 437  0038 72115201      	bres	20993,#0
 438  003c               L502:
 439                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 441  003c c65200        	ld	a,20992
 442  003f 1a06          	or	a,(OFST+5,sp)
 443  0041 c75200        	ld	20992,a
 444                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 446  0044 7b0b          	ld	a,(OFST+10,sp)
 447  0046 c75205        	ld	20997,a
 448                     ; 111 }
 451  0049 5b03          	addw	sp,#3
 452  004b 81            	ret
 507                     ; 119 void SPI_Cmd(FunctionalState NewState)
 507                     ; 120 {
 508                     	switch	.text
 509  004c               _SPI_Cmd:
 513                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 515                     ; 124   if (NewState != DISABLE)
 517  004c 4d            	tnz	a
 518  004d 2706          	jreq	L532
 519                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 521  004f 721c5200      	bset	20992,#6
 523  0053 2004          	jra	L732
 524  0055               L532:
 525                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 527  0055 721d5200      	bres	20992,#6
 528  0059               L732:
 529                     ; 132 }
 532  0059 81            	ret
 641                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 641                     ; 142 {
 642                     	switch	.text
 643  005a               _SPI_ITConfig:
 645  005a 89            	pushw	x
 646  005b 88            	push	a
 647       00000001      OFST:	set	1
 650                     ; 143   uint8_t itpos = 0;
 652                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 654                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 656                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 658  005c 9e            	ld	a,xh
 659  005d a40f          	and	a,#15
 660  005f 5f            	clrw	x
 661  0060 97            	ld	xl,a
 662  0061 a601          	ld	a,#1
 663  0063 5d            	tnzw	x
 664  0064 2704          	jreq	L41
 665  0066               L61:
 666  0066 48            	sll	a
 667  0067 5a            	decw	x
 668  0068 26fc          	jrne	L61
 669  006a               L41:
 670  006a 6b01          	ld	(OFST+0,sp),a
 672                     ; 151   if (NewState != DISABLE)
 674  006c 0d03          	tnz	(OFST+2,sp)
 675  006e 270a          	jreq	L113
 676                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 678  0070 c65202        	ld	a,20994
 679  0073 1a01          	or	a,(OFST+0,sp)
 680  0075 c75202        	ld	20994,a
 682  0078 2009          	jra	L313
 683  007a               L113:
 684                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 686  007a 7b01          	ld	a,(OFST+0,sp)
 687  007c 43            	cpl	a
 688  007d c45202        	and	a,20994
 689  0080 c75202        	ld	20994,a
 690  0083               L313:
 691                     ; 159 }
 694  0083 5b03          	addw	sp,#3
 695  0085 81            	ret
 729                     ; 166 void SPI_SendData(uint8_t Data)
 729                     ; 167 {
 730                     	switch	.text
 731  0086               _SPI_SendData:
 735                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 737  0086 c75204        	ld	20996,a
 738                     ; 169 }
 741  0089 81            	ret
 764                     ; 176 uint8_t SPI_ReceiveData(void)
 764                     ; 177 {
 765                     	switch	.text
 766  008a               _SPI_ReceiveData:
 770                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 772  008a c65204        	ld	a,20996
 775  008d 81            	ret
 811                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 811                     ; 188 {
 812                     	switch	.text
 813  008e               _SPI_NSSInternalSoftwareCmd:
 817                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 819                     ; 192   if (NewState != DISABLE)
 821  008e 4d            	tnz	a
 822  008f 2706          	jreq	L163
 823                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 825  0091 72105201      	bset	20993,#0
 827  0095 2004          	jra	L363
 828  0097               L163:
 829                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 831  0097 72115201      	bres	20993,#0
 832  009b               L363:
 833                     ; 200 }
 836  009b 81            	ret
 859                     ; 207 void SPI_TransmitCRC(void)
 859                     ; 208 {
 860                     	switch	.text
 861  009c               _SPI_TransmitCRC:
 865                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 867  009c 72185201      	bset	20993,#4
 868                     ; 210 }
 871  00a0 81            	ret
 907                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 907                     ; 219 {
 908                     	switch	.text
 909  00a1               _SPI_CalculateCRCCmd:
 913                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 915                     ; 223   if (NewState != DISABLE)
 917  00a1 4d            	tnz	a
 918  00a2 2706          	jreq	L314
 919                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 921  00a4 721a5201      	bset	20993,#5
 923  00a8 2004          	jra	L514
 924  00aa               L314:
 925                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 927  00aa 721b5201      	bres	20993,#5
 928  00ae               L514:
 929                     ; 231 }
 932  00ae 81            	ret
 996                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 996                     ; 239 {
 997                     	switch	.text
 998  00af               _SPI_GetCRC:
1000  00af 88            	push	a
1001       00000001      OFST:	set	1
1004                     ; 240   uint8_t crcreg = 0;
1006                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1008                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1010  00b0 4d            	tnz	a
1011  00b1 2707          	jreq	L154
1012                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1014  00b3 c65207        	ld	a,20999
1015  00b6 6b01          	ld	(OFST+0,sp),a
1018  00b8 2005          	jra	L354
1019  00ba               L154:
1020                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1022  00ba c65206        	ld	a,20998
1023  00bd 6b01          	ld	(OFST+0,sp),a
1025  00bf               L354:
1026                     ; 255   return crcreg;
1028  00bf 7b01          	ld	a,(OFST+0,sp)
1031  00c1 5b01          	addw	sp,#1
1032  00c3 81            	ret
1057                     ; 263 void SPI_ResetCRC(void)
1057                     ; 264 {
1058                     	switch	.text
1059  00c4               _SPI_ResetCRC:
1063                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1065  00c4 a601          	ld	a,#1
1066  00c6 add9          	call	_SPI_CalculateCRCCmd
1068                     ; 270   SPI_Cmd(ENABLE);
1070  00c8 a601          	ld	a,#1
1071  00ca ad80          	call	_SPI_Cmd
1073                     ; 271 }
1076  00cc 81            	ret
1100                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1100                     ; 279 {
1101                     	switch	.text
1102  00cd               _SPI_GetCRCPolynomial:
1106                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1108  00cd c65205        	ld	a,20997
1111  00d0 81            	ret
1167                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1167                     ; 289 {
1168                     	switch	.text
1169  00d1               _SPI_BiDirectionalLineConfig:
1173                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1175                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1177  00d1 4d            	tnz	a
1178  00d2 2706          	jreq	L325
1179                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1181  00d4 721c5201      	bset	20993,#6
1183  00d8 2004          	jra	L525
1184  00da               L325:
1185                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1187  00da 721d5201      	bres	20993,#6
1188  00de               L525:
1189                     ; 301 }
1192  00de 81            	ret
1313                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1313                     ; 312 {
1314                     	switch	.text
1315  00df               _SPI_GetFlagStatus:
1317  00df 88            	push	a
1318       00000001      OFST:	set	1
1321                     ; 313   FlagStatus status = RESET;
1323                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1325                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1327  00e0 c45203        	and	a,20995
1328  00e3 2706          	jreq	L306
1329                     ; 320     status = SET; /* SPI_FLAG is set */
1331  00e5 a601          	ld	a,#1
1332  00e7 6b01          	ld	(OFST+0,sp),a
1335  00e9 2002          	jra	L506
1336  00eb               L306:
1337                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1339  00eb 0f01          	clr	(OFST+0,sp)
1341  00ed               L506:
1342                     ; 328   return status;
1344  00ed 7b01          	ld	a,(OFST+0,sp)
1347  00ef 5b01          	addw	sp,#1
1348  00f1 81            	ret
1383                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1383                     ; 347 {
1384                     	switch	.text
1385  00f2               _SPI_ClearFlag:
1389                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1391                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1393  00f2 43            	cpl	a
1394  00f3 c75203        	ld	20995,a
1395                     ; 351 }
1398  00f6 81            	ret
1480                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1480                     ; 367 {
1481                     	switch	.text
1482  00f7               _SPI_GetITStatus:
1484  00f7 88            	push	a
1485  00f8 89            	pushw	x
1486       00000002      OFST:	set	2
1489                     ; 368   ITStatus pendingbitstatus = RESET;
1491                     ; 369   uint8_t itpos = 0;
1493                     ; 370   uint8_t itmask1 = 0;
1495                     ; 371   uint8_t itmask2 = 0;
1497                     ; 372   uint8_t enablestatus = 0;
1499                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1501                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1503  00f9 a40f          	and	a,#15
1504  00fb 5f            	clrw	x
1505  00fc 97            	ld	xl,a
1506  00fd a601          	ld	a,#1
1507  00ff 5d            	tnzw	x
1508  0100 2704          	jreq	L05
1509  0102               L25:
1510  0102 48            	sll	a
1511  0103 5a            	decw	x
1512  0104 26fc          	jrne	L25
1513  0106               L05:
1514  0106 6b01          	ld	(OFST-1,sp),a
1516                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1518  0108 7b03          	ld	a,(OFST+1,sp)
1519  010a 4e            	swap	a
1520  010b a40f          	and	a,#15
1521  010d 6b02          	ld	(OFST+0,sp),a
1523                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1525  010f 7b02          	ld	a,(OFST+0,sp)
1526  0111 5f            	clrw	x
1527  0112 97            	ld	xl,a
1528  0113 a601          	ld	a,#1
1529  0115 5d            	tnzw	x
1530  0116 2704          	jreq	L45
1531  0118               L65:
1532  0118 48            	sll	a
1533  0119 5a            	decw	x
1534  011a 26fc          	jrne	L65
1535  011c               L45:
1536  011c 6b02          	ld	(OFST+0,sp),a
1538                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1540  011e c65203        	ld	a,20995
1541  0121 1402          	and	a,(OFST+0,sp)
1542  0123 6b02          	ld	(OFST+0,sp),a
1544                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1546  0125 c65202        	ld	a,20994
1547  0128 1501          	bcp	a,(OFST-1,sp)
1548  012a 270a          	jreq	L766
1550  012c 0d02          	tnz	(OFST+0,sp)
1551  012e 2706          	jreq	L766
1552                     ; 387     pendingbitstatus = SET;
1554  0130 a601          	ld	a,#1
1555  0132 6b02          	ld	(OFST+0,sp),a
1558  0134 2002          	jra	L176
1559  0136               L766:
1560                     ; 392     pendingbitstatus = RESET;
1562  0136 0f02          	clr	(OFST+0,sp)
1564  0138               L176:
1565                     ; 395   return  pendingbitstatus;
1567  0138 7b02          	ld	a,(OFST+0,sp)
1570  013a 5b03          	addw	sp,#3
1571  013c 81            	ret
1616                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1616                     ; 413 {
1617                     	switch	.text
1618  013d               _SPI_ClearITPendingBit:
1620  013d 88            	push	a
1621       00000001      OFST:	set	1
1624                     ; 414   uint8_t itpos = 0;
1626                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1628                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1630  013e a4f0          	and	a,#240
1631  0140 4e            	swap	a
1632  0141 a40f          	and	a,#15
1633  0143 5f            	clrw	x
1634  0144 97            	ld	xl,a
1635  0145 a601          	ld	a,#1
1636  0147 5d            	tnzw	x
1637  0148 2704          	jreq	L26
1638  014a               L46:
1639  014a 48            	sll	a
1640  014b 5a            	decw	x
1641  014c 26fc          	jrne	L46
1642  014e               L26:
1643  014e 6b01          	ld	(OFST+0,sp),a
1645                     ; 422   SPI->SR = (uint8_t)(~itpos);
1647  0150 7b01          	ld	a,(OFST+0,sp)
1648  0152 43            	cpl	a
1649  0153 c75203        	ld	20995,a
1650                     ; 424 }
1653  0156 84            	pop	a
1654  0157 81            	ret
1667                     	xdef	_SPI_ClearITPendingBit
1668                     	xdef	_SPI_GetITStatus
1669                     	xdef	_SPI_ClearFlag
1670                     	xdef	_SPI_GetFlagStatus
1671                     	xdef	_SPI_BiDirectionalLineConfig
1672                     	xdef	_SPI_GetCRCPolynomial
1673                     	xdef	_SPI_ResetCRC
1674                     	xdef	_SPI_GetCRC
1675                     	xdef	_SPI_CalculateCRCCmd
1676                     	xdef	_SPI_TransmitCRC
1677                     	xdef	_SPI_NSSInternalSoftwareCmd
1678                     	xdef	_SPI_ReceiveData
1679                     	xdef	_SPI_SendData
1680                     	xdef	_SPI_ITConfig
1681                     	xdef	_SPI_Cmd
1682                     	xdef	_SPI_Init
1683                     	xdef	_SPI_DeInit
1702                     	end
