   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  47                     ; 50 void SPI_DeInit(void)
  47                     ; 51 {
  49                     	switch	.text
  50  0000               _SPI_DeInit:
  54                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  56  0000 725f5200      	clr	20992
  57                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  59  0004 725f5201      	clr	20993
  60                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  62  0008 725f5202      	clr	20994
  63                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  65  000c 35025203      	mov	20995,#2
  66                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  68  0010 35075205      	mov	20997,#7
  69                     ; 57 }
  72  0014 81            	ret	
 386                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 386                     ; 79 {
 387                     	switch	.text
 388  0015               _SPI_Init:
 390  0015 89            	pushw	x
 391  0016 88            	push	a
 392       00000001      OFST:	set	1
 395                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 397                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 399                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 401                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 403                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 405                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 407                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 409                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 411                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 411                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 413  0017 7b07          	ld	a,(OFST+6,sp)
 414  0019 1a08          	or	a,(OFST+7,sp)
 415  001b 6b01          	ld	(OFST+0,sp),a
 417  001d 9f            	ld	a,xl
 418  001e 1a02          	or	a,(OFST+1,sp)
 419  0020 1a01          	or	a,(OFST+0,sp)
 420  0022 c75200        	ld	20992,a
 421                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 423  0025 7b09          	ld	a,(OFST+8,sp)
 424  0027 1a0a          	or	a,(OFST+9,sp)
 425  0029 c75201        	ld	20993,a
 426                     ; 97   if (Mode == SPI_MODE_MASTER)
 428  002c 7b06          	ld	a,(OFST+5,sp)
 429  002e a104          	cp	a,#4
 430  0030 2606          	jrne	L102
 431                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 433  0032 72105201      	bset	20993,#0
 435  0036 2004          	jra	L302
 436  0038               L102:
 437                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 439  0038 72115201      	bres	20993,#0
 440  003c               L302:
 441                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 443  003c c65200        	ld	a,20992
 444  003f 1a06          	or	a,(OFST+5,sp)
 445  0041 c75200        	ld	20992,a
 446                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 448  0044 7b0b          	ld	a,(OFST+10,sp)
 449  0046 c75205        	ld	20997,a
 450                     ; 111 }
 453  0049 5b03          	addw	sp,#3
 454  004b 81            	ret	
 509                     ; 119 void SPI_Cmd(FunctionalState NewState)
 509                     ; 120 {
 510                     	switch	.text
 511  004c               _SPI_Cmd:
 515                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 517                     ; 124   if (NewState != DISABLE)
 519  004c 4d            	tnz	a
 520  004d 2705          	jreq	L332
 521                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 523  004f 721c5200      	bset	20992,#6
 526  0053 81            	ret	
 527  0054               L332:
 528                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 530  0054 721d5200      	bres	20992,#6
 531                     ; 132 }
 534  0058 81            	ret	
 641                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 641                     ; 142 {
 642                     	switch	.text
 643  0059               _SPI_ITConfig:
 645  0059 89            	pushw	x
 646  005a 88            	push	a
 647       00000001      OFST:	set	1
 650                     ; 143   uint8_t itpos = 0;
 652                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 654                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 656                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 658  005b 9e            	ld	a,xh
 659  005c a40f          	and	a,#15
 660  005e 5f            	clrw	x
 661  005f 97            	ld	xl,a
 662  0060 a601          	ld	a,#1
 663  0062 5d            	tnzw	x
 664  0063 2704          	jreq	L41
 665  0065               L61:
 666  0065 48            	sll	a
 667  0066 5a            	decw	x
 668  0067 26fc          	jrne	L61
 669  0069               L41:
 670  0069 6b01          	ld	(OFST+0,sp),a
 672                     ; 151   if (NewState != DISABLE)
 674  006b 0d03          	tnz	(OFST+2,sp)
 675  006d 2707          	jreq	L503
 676                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 678  006f c65202        	ld	a,20994
 679  0072 1a01          	or	a,(OFST+0,sp)
 681  0074 2004          	jra	L703
 682  0076               L503:
 683                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 685  0076 43            	cpl	a
 686  0077 c45202        	and	a,20994
 687  007a               L703:
 688  007a c75202        	ld	20994,a
 689                     ; 159 }
 692  007d 5b03          	addw	sp,#3
 693  007f 81            	ret	
 725                     ; 166 void SPI_SendData(uint8_t Data)
 725                     ; 167 {
 726                     	switch	.text
 727  0080               _SPI_SendData:
 731                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 733  0080 c75204        	ld	20996,a
 734                     ; 169 }
 737  0083 81            	ret	
 760                     ; 176 uint8_t SPI_ReceiveData(void)
 760                     ; 177 {
 761                     	switch	.text
 762  0084               _SPI_ReceiveData:
 766                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 768  0084 c65204        	ld	a,20996
 771  0087 81            	ret	
 807                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 807                     ; 188 {
 808                     	switch	.text
 809  0088               _SPI_NSSInternalSoftwareCmd:
 813                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 815                     ; 192   if (NewState != DISABLE)
 817  0088 4d            	tnz	a
 818  0089 2705          	jreq	L353
 819                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 821  008b 72105201      	bset	20993,#0
 824  008f 81            	ret	
 825  0090               L353:
 826                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 828  0090 72115201      	bres	20993,#0
 829                     ; 200 }
 832  0094 81            	ret	
 855                     ; 207 void SPI_TransmitCRC(void)
 855                     ; 208 {
 856                     	switch	.text
 857  0095               _SPI_TransmitCRC:
 861                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 863  0095 72185201      	bset	20993,#4
 864                     ; 210 }
 867  0099 81            	ret	
 903                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 903                     ; 219 {
 904                     	switch	.text
 905  009a               _SPI_CalculateCRCCmd:
 909                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 911                     ; 223   if (NewState != DISABLE)
 913  009a 4d            	tnz	a
 914  009b 2705          	jreq	L504
 915                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 917  009d 721a5201      	bset	20993,#5
 920  00a1 81            	ret	
 921  00a2               L504:
 922                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 924  00a2 721b5201      	bres	20993,#5
 925                     ; 231 }
 928  00a6 81            	ret	
 990                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 990                     ; 239 {
 991                     	switch	.text
 992  00a7               _SPI_GetCRC:
 994       00000001      OFST:	set	1
 997                     ; 240   uint8_t crcreg = 0;
 999                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1001                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1003  00a7 4d            	tnz	a
1004  00a8 2704          	jreq	L144
1005                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1007  00aa c65207        	ld	a,20999
1011  00ad 81            	ret	
1012  00ae               L144:
1013                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1015  00ae c65206        	ld	a,20998
1017                     ; 255   return crcreg;
1021  00b1 81            	ret	
1046                     ; 263 void SPI_ResetCRC(void)
1046                     ; 264 {
1047                     	switch	.text
1048  00b2               _SPI_ResetCRC:
1052                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1054  00b2 a601          	ld	a,#1
1055  00b4 ade4          	call	_SPI_CalculateCRCCmd
1057                     ; 270   SPI_Cmd(ENABLE);
1059  00b6 a601          	ld	a,#1
1061                     ; 271 }
1064  00b8 2092          	jp	_SPI_Cmd
1088                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1088                     ; 279 {
1089                     	switch	.text
1090  00ba               _SPI_GetCRCPolynomial:
1094                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1096  00ba c65205        	ld	a,20997
1099  00bd 81            	ret	
1155                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1155                     ; 289 {
1156                     	switch	.text
1157  00be               _SPI_BiDirectionalLineConfig:
1161                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1163                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1165  00be 4d            	tnz	a
1166  00bf 2705          	jreq	L315
1167                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1169  00c1 721c5201      	bset	20993,#6
1172  00c5 81            	ret	
1173  00c6               L315:
1174                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1176  00c6 721d5201      	bres	20993,#6
1177                     ; 301 }
1180  00ca 81            	ret	
1301                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1301                     ; 312 {
1302                     	switch	.text
1303  00cb               _SPI_GetFlagStatus:
1305       00000001      OFST:	set	1
1308                     ; 313   FlagStatus status = RESET;
1310                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1312                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1314  00cb c45203        	and	a,20995
1315  00ce 2702          	jreq	L375
1316                     ; 320     status = SET; /* SPI_FLAG is set */
1318  00d0 a601          	ld	a,#1
1321  00d2               L375:
1322                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1325                     ; 328   return status;
1329  00d2 81            	ret	
1364                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1364                     ; 347 {
1365                     	switch	.text
1366  00d3               _SPI_ClearFlag:
1370                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1372                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1374  00d3 43            	cpl	a
1375  00d4 c75203        	ld	20995,a
1376                     ; 351 }
1379  00d7 81            	ret	
1453                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1453                     ; 367 {
1454                     	switch	.text
1455  00d8               _SPI_GetITStatus:
1457  00d8 88            	push	a
1458  00d9 89            	pushw	x
1459       00000002      OFST:	set	2
1462                     ; 368   ITStatus pendingbitstatus = RESET;
1464                     ; 369   uint8_t itpos = 0;
1466                     ; 370   uint8_t itmask1 = 0;
1468                     ; 371   uint8_t itmask2 = 0;
1470                     ; 372   uint8_t enablestatus = 0;
1472                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1474                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1476  00da a40f          	and	a,#15
1477  00dc 5f            	clrw	x
1478  00dd 97            	ld	xl,a
1479  00de a601          	ld	a,#1
1480  00e0 5d            	tnzw	x
1481  00e1 2704          	jreq	L45
1482  00e3               L65:
1483  00e3 48            	sll	a
1484  00e4 5a            	decw	x
1485  00e5 26fc          	jrne	L65
1486  00e7               L45:
1487  00e7 6b01          	ld	(OFST-1,sp),a
1489                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1491  00e9 7b03          	ld	a,(OFST+1,sp)
1492  00eb 4e            	swap	a
1493  00ec a40f          	and	a,#15
1494  00ee 6b02          	ld	(OFST+0,sp),a
1496                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1498  00f0 5f            	clrw	x
1499  00f1 97            	ld	xl,a
1500  00f2 a601          	ld	a,#1
1501  00f4 5d            	tnzw	x
1502  00f5 2704          	jreq	L06
1503  00f7               L26:
1504  00f7 48            	sll	a
1505  00f8 5a            	decw	x
1506  00f9 26fc          	jrne	L26
1507  00fb               L06:
1509                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1511  00fb c45203        	and	a,20995
1512  00fe 6b02          	ld	(OFST+0,sp),a
1514                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1516  0100 c65202        	ld	a,20994
1517  0103 1501          	bcp	a,(OFST-1,sp)
1518  0105 2708          	jreq	L746
1520  0107 7b02          	ld	a,(OFST+0,sp)
1521  0109 2704          	jreq	L746
1522                     ; 387     pendingbitstatus = SET;
1524  010b a601          	ld	a,#1
1527  010d 2001          	jra	L156
1528  010f               L746:
1529                     ; 392     pendingbitstatus = RESET;
1531  010f 4f            	clr	a
1533  0110               L156:
1534                     ; 395   return  pendingbitstatus;
1538  0110 5b03          	addw	sp,#3
1539  0112 81            	ret	
1582                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1582                     ; 413 {
1583                     	switch	.text
1584  0113               _SPI_ClearITPendingBit:
1586       00000001      OFST:	set	1
1589                     ; 414   uint8_t itpos = 0;
1591                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1593                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1595  0113 4e            	swap	a
1596  0114 a40f          	and	a,#15
1597  0116 5f            	clrw	x
1598  0117 97            	ld	xl,a
1599  0118 a601          	ld	a,#1
1600  011a 5d            	tnzw	x
1601  011b 2704          	jreq	L66
1602  011d               L07:
1603  011d 48            	sll	a
1604  011e 5a            	decw	x
1605  011f 26fc          	jrne	L07
1606  0121               L66:
1608                     ; 422   SPI->SR = (uint8_t)(~itpos);
1610  0121 43            	cpl	a
1611  0122 c75203        	ld	20995,a
1612                     ; 424 }
1615  0125 81            	ret	
1628                     	xdef	_SPI_ClearITPendingBit
1629                     	xdef	_SPI_GetITStatus
1630                     	xdef	_SPI_ClearFlag
1631                     	xdef	_SPI_GetFlagStatus
1632                     	xdef	_SPI_BiDirectionalLineConfig
1633                     	xdef	_SPI_GetCRCPolynomial
1634                     	xdef	_SPI_ResetCRC
1635                     	xdef	_SPI_GetCRC
1636                     	xdef	_SPI_CalculateCRCCmd
1637                     	xdef	_SPI_TransmitCRC
1638                     	xdef	_SPI_NSSInternalSoftwareCmd
1639                     	xdef	_SPI_ReceiveData
1640                     	xdef	_SPI_SendData
1641                     	xdef	_SPI_ITConfig
1642                     	xdef	_SPI_Cmd
1643                     	xdef	_SPI_Init
1644                     	xdef	_SPI_DeInit
1663                     	end
