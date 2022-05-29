   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  74                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  74                     ; 88 {
  75                     	switch	.text
  76  0000               f_FLASH_Unlock:
  80                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  82                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  84  0000 a1fd          	cp	a,#253
  85  0002 260a          	jrne	L73
  86                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  88  0004 35565062      	mov	20578,#86
  89                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  91  0008 35ae5062      	mov	20578,#174
  93  000c 2008          	jra	L14
  94  000e               L73:
  95                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  97  000e 35ae5064      	mov	20580,#174
  98                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 100  0012 35565064      	mov	20580,#86
 101  0016               L14:
 102                     ; 104 }
 105  0016 87            	retf
 139                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 139                     ; 113 {
 140                     	switch	.text
 141  0017               f_FLASH_Lock:
 145                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 147                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 149  0017 c4505f        	and	a,20575
 150  001a c7505f        	ld	20575,a
 151                     ; 119 }
 154  001d 87            	retf
 176                     ; 126 void FLASH_DeInit(void)
 176                     ; 127 {
 177                     	switch	.text
 178  001e               f_FLASH_DeInit:
 182                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 184  001e 725f505a      	clr	20570
 185                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 187  0022 725f505b      	clr	20571
 188                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 190  0026 35ff505c      	mov	20572,#255
 191                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 193  002a 7217505f      	bres	20575,#3
 194                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 196  002e 7213505f      	bres	20575,#1
 197                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 199  0032 c6505f        	ld	a,20575
 200                     ; 134 }
 203  0035 87            	retf
 257                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 257                     ; 143 {
 258                     	switch	.text
 259  0036               f_FLASH_ITConfig:
 263                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 265                     ; 147   if(NewState != DISABLE)
 267  0036 4d            	tnz	a
 268  0037 2706          	jreq	L711
 269                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 271  0039 7212505a      	bset	20570,#1
 273  003d 2004          	jra	L121
 274  003f               L711:
 275                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 277  003f 7213505a      	bres	20570,#1
 278  0043               L121:
 279                     ; 155 }
 282  0043 87            	retf
 313                     ; 164 void FLASH_EraseByte(uint32_t Address)
 313                     ; 165 {
 314                     	switch	.text
 315  0044               f_FLASH_EraseByte:
 317       00000000      OFST:	set	0
 320                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 322                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 324  0044 1e06          	ldw	x,(OFST+6,sp)
 325  0046 7f            	clr	(x)
 326                     ; 171 }
 329  0047 87            	retf
 367                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 367                     ; 182 {
 368                     	switch	.text
 369  0048               f_FLASH_ProgramByte:
 371       00000000      OFST:	set	0
 374                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 376                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 378  0048 7b08          	ld	a,(OFST+8,sp)
 379  004a 1e06          	ldw	x,(OFST+6,sp)
 380  004c f7            	ld	(x),a
 381                     ; 186 }
 384  004d 87            	retf
 415                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 415                     ; 196 {
 416                     	switch	.text
 417  004e               f_FLASH_ReadByte:
 419       00000000      OFST:	set	0
 422                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 424                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 426  004e 1e06          	ldw	x,(OFST+6,sp)
 427  0050 f6            	ld	a,(x)
 430  0051 87            	retf
 468                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 468                     ; 213 {
 469                     	switch	.text
 470  0052               f_FLASH_ProgramWord:
 472       00000000      OFST:	set	0
 475                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 477                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 479  0052 721c505b      	bset	20571,#6
 480                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 482  0056 721d505c      	bres	20572,#6
 483                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 485  005a 7b08          	ld	a,(OFST+8,sp)
 486  005c 1e06          	ldw	x,(OFST+6,sp)
 487  005e f7            	ld	(x),a
 488                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 490  005f 7b09          	ld	a,(OFST+9,sp)
 491  0061 1e06          	ldw	x,(OFST+6,sp)
 492  0063 e701          	ld	(1,x),a
 493                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 495  0065 7b0a          	ld	a,(OFST+10,sp)
 496  0067 1e06          	ldw	x,(OFST+6,sp)
 497  0069 e702          	ld	(2,x),a
 498                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 500  006b 7b0b          	ld	a,(OFST+11,sp)
 501  006d 1e06          	ldw	x,(OFST+6,sp)
 502  006f e703          	ld	(3,x),a
 503                     ; 229 }
 506  0071 87            	retf
 546                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 546                     ; 238 {
 547                     	switch	.text
 548  0072               f_FLASH_ProgramOptionByte:
 550  0072 89            	pushw	x
 551       00000000      OFST:	set	0
 554                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 556                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 558  0073 721e505b      	bset	20571,#7
 559                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 561  0077 721f505c      	bres	20572,#7
 562                     ; 247   if(Address == 0x4800)
 564  007b a34800        	cpw	x,#18432
 565  007e 2607          	jrne	L522
 566                     ; 250     *((NEAR uint8_t*)Address) = Data;
 568  0080 7b06          	ld	a,(OFST+6,sp)
 569  0082 1e01          	ldw	x,(OFST+1,sp)
 570  0084 f7            	ld	(x),a
 572  0085 200c          	jra	L722
 573  0087               L522:
 574                     ; 255     *((NEAR uint8_t*)Address) = Data;
 576  0087 7b06          	ld	a,(OFST+6,sp)
 577  0089 1e01          	ldw	x,(OFST+1,sp)
 578  008b f7            	ld	(x),a
 579                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 581  008c 7b06          	ld	a,(OFST+6,sp)
 582  008e 43            	cpl	a
 583  008f 1e01          	ldw	x,(OFST+1,sp)
 584  0091 e701          	ld	(1,x),a
 585  0093               L722:
 586                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 588  0093 a6fd          	ld	a,#253
 589  0095 8d830183      	callf	f_FLASH_WaitForLastOperation
 591                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 593  0099 721f505b      	bres	20571,#7
 594                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 596  009d 721e505c      	bset	20572,#7
 597                     ; 263 }
 600  00a1 85            	popw	x
 601  00a2 87            	retf
 634                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 634                     ; 271 {
 635                     	switch	.text
 636  00a3               f_FLASH_EraseOptionByte:
 638  00a3 89            	pushw	x
 639       00000000      OFST:	set	0
 642                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 644                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 646  00a4 721e505b      	bset	20571,#7
 647                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 649  00a8 721f505c      	bres	20572,#7
 650                     ; 280   if(Address == 0x4800)
 652  00ac a34800        	cpw	x,#18432
 653  00af 2603          	jrne	L542
 654                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 656  00b1 7f            	clr	(x)
 658  00b2 2009          	jra	L742
 659  00b4               L542:
 660                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 662  00b4 1e01          	ldw	x,(OFST+1,sp)
 663  00b6 7f            	clr	(x)
 664                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 666  00b7 1e01          	ldw	x,(OFST+1,sp)
 667  00b9 a6ff          	ld	a,#255
 668  00bb e701          	ld	(1,x),a
 669  00bd               L742:
 670                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 672  00bd a6fd          	ld	a,#253
 673  00bf 8d830183      	callf	f_FLASH_WaitForLastOperation
 675                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 677  00c3 721f505b      	bres	20571,#7
 678                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 680  00c7 721e505c      	bset	20572,#7
 681                     ; 296 }
 684  00cb 85            	popw	x
 685  00cc 87            	retf
 739                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 739                     ; 304 {
 740                     	switch	.text
 741  00cd               f_FLASH_ReadOptionByte:
 743  00cd 5204          	subw	sp,#4
 744       00000004      OFST:	set	4
 747                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 749                     ; 306   uint16_t res_value = 0;
 751                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 753                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 755  00cf f6            	ld	a,(x)
 756  00d0 6b01          	ld	(OFST-3,sp),a
 758                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 760  00d2 e601          	ld	a,(1,x)
 761  00d4 6b02          	ld	(OFST-2,sp),a
 763                     ; 315   if(Address == 0x4800)	 
 765  00d6 a34800        	cpw	x,#18432
 766  00d9 2608          	jrne	L372
 767                     ; 317     res_value =	 value_optbyte;
 769  00db 7b01          	ld	a,(OFST-3,sp)
 770  00dd 5f            	clrw	x
 771  00de 97            	ld	xl,a
 772  00df 1f03          	ldw	(OFST-1,sp),x
 775  00e1 2023          	jra	L572
 776  00e3               L372:
 777                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 779  00e3 7b02          	ld	a,(OFST-2,sp)
 780  00e5 43            	cpl	a
 781  00e6 1101          	cp	a,(OFST-3,sp)
 782  00e8 2617          	jrne	L772
 783                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 785  00ea 7b01          	ld	a,(OFST-3,sp)
 786  00ec 5f            	clrw	x
 787  00ed 97            	ld	xl,a
 788  00ee 4f            	clr	a
 789  00ef 02            	rlwa	x,a
 790  00f0 1f03          	ldw	(OFST-1,sp),x
 792                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 794  00f2 7b02          	ld	a,(OFST-2,sp)
 795  00f4 5f            	clrw	x
 796  00f5 97            	ld	xl,a
 797  00f6 01            	rrwa	x,a
 798  00f7 1a04          	or	a,(OFST+0,sp)
 799  00f9 01            	rrwa	x,a
 800  00fa 1a03          	or	a,(OFST-1,sp)
 801  00fc 01            	rrwa	x,a
 802  00fd 1f03          	ldw	(OFST-1,sp),x
 805  00ff 2005          	jra	L572
 806  0101               L772:
 807                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 809  0101 ae5555        	ldw	x,#21845
 810  0104 1f03          	ldw	(OFST-1,sp),x
 812  0106               L572:
 813                     ; 331   return(res_value);
 815  0106 1e03          	ldw	x,(OFST-1,sp)
 818  0108 5b04          	addw	sp,#4
 819  010a 87            	retf
 892                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 892                     ; 341 {
 893                     	switch	.text
 894  010b               f_FLASH_SetLowPowerMode:
 896  010b 88            	push	a
 897       00000000      OFST:	set	0
 900                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 902                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 904  010c c6505a        	ld	a,20570
 905  010f a4f3          	and	a,#243
 906  0111 c7505a        	ld	20570,a
 907                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 909  0114 c6505a        	ld	a,20570
 910  0117 1a01          	or	a,(OFST+1,sp)
 911  0119 c7505a        	ld	20570,a
 912                     ; 350 }
 915  011c 84            	pop	a
 916  011d 87            	retf
 973                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
 973                     ; 359 {
 974                     	switch	.text
 975  011e               f_FLASH_SetProgrammingTime:
 979                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
 981                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
 983  011e 7211505a      	bres	20570,#0
 984                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
 986  0122 ca505a        	or	a,20570
 987  0125 c7505a        	ld	20570,a
 988                     ; 365 }
 991  0128 87            	retf
1015                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1015                     ; 373 {
1016                     	switch	.text
1017  0129               f_FLASH_GetLowPowerMode:
1021                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1023  0129 c6505a        	ld	a,20570
1024  012c a40c          	and	a,#12
1027  012e 87            	retf
1051                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1051                     ; 383 {
1052                     	switch	.text
1053  012f               f_FLASH_GetProgrammingTime:
1057                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1059  012f c6505a        	ld	a,20570
1060  0132 a401          	and	a,#1
1063  0134 87            	retf
1094                     ; 392 uint32_t FLASH_GetBootSize(void)
1094                     ; 393 {
1095                     	switch	.text
1096  0135               f_FLASH_GetBootSize:
1098  0135 5204          	subw	sp,#4
1099       00000004      OFST:	set	4
1102                     ; 394   uint32_t temp = 0;
1104                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1106  0137 c6505d        	ld	a,20573
1107  013a 5f            	clrw	x
1108  013b 97            	ld	xl,a
1109  013c 90ae0200      	ldw	y,#512
1110  0140 8d000000      	callf	d_umul
1112  0144 96            	ldw	x,sp
1113  0145 1c0001        	addw	x,#OFST-3
1114  0148 8d000000      	callf	d_rtol
1117                     ; 400   if(FLASH->FPR == 0xFF)
1119  014c c6505d        	ld	a,20573
1120  014f a1ff          	cp	a,#255
1121  0151 2612          	jrne	L714
1122                     ; 402     temp += 512;
1124  0153 ae0200        	ldw	x,#512
1125  0156 bf02          	ldw	c_lreg+2,x
1126  0158 ae0000        	ldw	x,#0
1127  015b bf00          	ldw	c_lreg,x
1128  015d 96            	ldw	x,sp
1129  015e 1c0001        	addw	x,#OFST-3
1130  0161 8d000000      	callf	d_lgadd
1133  0165               L714:
1134                     ; 406   return(temp);
1136  0165 96            	ldw	x,sp
1137  0166 1c0001        	addw	x,#OFST-3
1138  0169 8d000000      	callf	d_ltor
1142  016d 5b04          	addw	sp,#4
1143  016f 87            	retf
1251                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1251                     ; 418 {
1252                     	switch	.text
1253  0170               f_FLASH_GetFlagStatus:
1255  0170 88            	push	a
1256       00000001      OFST:	set	1
1259                     ; 419   FlagStatus status = RESET;
1261                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1263                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1265  0171 c4505f        	and	a,20575
1266  0174 2706          	jreq	L174
1267                     ; 426     status = SET; /* FLASH_FLAG is set */
1269  0176 a601          	ld	a,#1
1270  0178 6b01          	ld	(OFST+0,sp),a
1273  017a 2002          	jra	L374
1274  017c               L174:
1275                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1277  017c 0f01          	clr	(OFST+0,sp)
1279  017e               L374:
1280                     ; 434   return status;
1282  017e 7b01          	ld	a,(OFST+0,sp)
1285  0180 5b01          	addw	sp,#1
1286  0182 87            	retf
1374                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1374                     ; 550 {
1375                     	switch	.text
1376  0183               f_FLASH_WaitForLastOperation:
1378  0183 5203          	subw	sp,#3
1379       00000003      OFST:	set	3
1382                     ; 551   uint8_t flagstatus = 0x00;
1384  0185 0f03          	clr	(OFST+0,sp)
1386                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1388  0187 aeffff        	ldw	x,#65535
1389  018a 1f01          	ldw	(OFST-2,sp),x
1391                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1393  018c a1fd          	cp	a,#253
1394  018e 2628          	jrne	L155
1396  0190 200e          	jra	L735
1397  0192               L535:
1398                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1398                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1400  0192 c6505f        	ld	a,20575
1401  0195 a405          	and	a,#5
1402  0197 6b03          	ld	(OFST+0,sp),a
1404                     ; 563         timeout--;
1406  0199 1e01          	ldw	x,(OFST-2,sp)
1407  019b 1d0001        	subw	x,#1
1408  019e 1f01          	ldw	(OFST-2,sp),x
1410  01a0               L735:
1411                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1413  01a0 0d03          	tnz	(OFST+0,sp)
1414  01a2 261c          	jrne	L545
1416  01a4 1e01          	ldw	x,(OFST-2,sp)
1417  01a6 26ea          	jrne	L535
1418  01a8 2016          	jra	L545
1419  01aa               L745:
1420                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1420                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1422  01aa c6505f        	ld	a,20575
1423  01ad a441          	and	a,#65
1424  01af 6b03          	ld	(OFST+0,sp),a
1426                     ; 572         timeout--;
1428  01b1 1e01          	ldw	x,(OFST-2,sp)
1429  01b3 1d0001        	subw	x,#1
1430  01b6 1f01          	ldw	(OFST-2,sp),x
1432  01b8               L155:
1433                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1435  01b8 0d03          	tnz	(OFST+0,sp)
1436  01ba 2604          	jrne	L545
1438  01bc 1e01          	ldw	x,(OFST-2,sp)
1439  01be 26ea          	jrne	L745
1440  01c0               L545:
1441                     ; 583   if(timeout == 0x00 )
1443  01c0 1e01          	ldw	x,(OFST-2,sp)
1444  01c2 2604          	jrne	L755
1445                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1447  01c4 a602          	ld	a,#2
1448  01c6 6b03          	ld	(OFST+0,sp),a
1450  01c8               L755:
1451                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1453  01c8 7b03          	ld	a,(OFST+0,sp)
1456  01ca 5b03          	addw	sp,#3
1457  01cc 87            	retf
1515                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1515                     ; 599 {
1516                     	switch	.text
1517  01cd               f_FLASH_EraseBlock:
1519  01cd 89            	pushw	x
1520  01ce 5206          	subw	sp,#6
1521       00000006      OFST:	set	6
1524                     ; 600   uint32_t startaddress = 0;
1526                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1528                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1530  01d0 7b0c          	ld	a,(OFST+6,sp)
1531  01d2 a1fd          	cp	a,#253
1532  01d4 260c          	jrne	L706
1533                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1535                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1537  01d6 ae8000        	ldw	x,#32768
1538  01d9 1f05          	ldw	(OFST-1,sp),x
1539  01db ae0000        	ldw	x,#0
1540  01de 1f03          	ldw	(OFST-3,sp),x
1543  01e0 200a          	jra	L116
1544  01e2               L706:
1545                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1547                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1549  01e2 ae4000        	ldw	x,#16384
1550  01e5 1f05          	ldw	(OFST-1,sp),x
1551  01e7 ae0000        	ldw	x,#0
1552  01ea 1f03          	ldw	(OFST-3,sp),x
1554  01ec               L116:
1555                     ; 627     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1557  01ec 1e07          	ldw	x,(OFST+1,sp)
1558  01ee a680          	ld	a,#128
1559  01f0 8d000000      	callf	d_cmulx
1561  01f4 96            	ldw	x,sp
1562  01f5 1c0003        	addw	x,#OFST-3
1563  01f8 8d000000      	callf	d_ladd
1565  01fc be02          	ldw	x,c_lreg+2
1566  01fe 1f01          	ldw	(OFST-5,sp),x
1568                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
1570  0200 721a505b      	bset	20571,#5
1571                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1573  0204 721b505c      	bres	20572,#5
1574                     ; 636     *pwFlash = (uint32_t)0;
1576  0208 1e01          	ldw	x,(OFST-5,sp)
1577  020a a600          	ld	a,#0
1578  020c e703          	ld	(3,x),a
1579  020e a600          	ld	a,#0
1580  0210 e702          	ld	(2,x),a
1581  0212 a600          	ld	a,#0
1582  0214 e701          	ld	(1,x),a
1583  0216 a600          	ld	a,#0
1584  0218 f7            	ld	(x),a
1585                     ; 644 }
1588  0219 5b08          	addw	sp,#8
1589  021b 87            	retf
1686                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1686                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1686                     ; 657 {
1687                     	switch	.text
1688  021c               f_FLASH_ProgramBlock:
1690  021c 89            	pushw	x
1691  021d 5206          	subw	sp,#6
1692       00000006      OFST:	set	6
1695                     ; 658   uint16_t Count = 0;
1697                     ; 659   uint32_t startaddress = 0;
1699                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1701                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1703                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1705  021f 7b0c          	ld	a,(OFST+6,sp)
1706  0221 a1fd          	cp	a,#253
1707  0223 260c          	jrne	L756
1708                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1710                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1712  0225 ae8000        	ldw	x,#32768
1713  0228 1f03          	ldw	(OFST-3,sp),x
1714  022a ae0000        	ldw	x,#0
1715  022d 1f01          	ldw	(OFST-5,sp),x
1718  022f 200a          	jra	L166
1719  0231               L756:
1720                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1722                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1724  0231 ae4000        	ldw	x,#16384
1725  0234 1f03          	ldw	(OFST-3,sp),x
1726  0236 ae0000        	ldw	x,#0
1727  0239 1f01          	ldw	(OFST-5,sp),x
1729  023b               L166:
1730                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1732  023b 1e07          	ldw	x,(OFST+1,sp)
1733  023d a680          	ld	a,#128
1734  023f 8d000000      	callf	d_cmulx
1736  0243 96            	ldw	x,sp
1737  0244 1c0001        	addw	x,#OFST-5
1738  0247 8d000000      	callf	d_lgadd
1741                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1743  024b 0d0d          	tnz	(OFST+7,sp)
1744  024d 260a          	jrne	L366
1745                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
1747  024f 7210505b      	bset	20571,#0
1748                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1750  0253 7211505c      	bres	20572,#0
1752  0257 2008          	jra	L566
1753  0259               L366:
1754                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
1756  0259 7218505b      	bset	20571,#4
1757                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1759  025d 7219505c      	bres	20572,#4
1760  0261               L566:
1761                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1763  0261 5f            	clrw	x
1764  0262 1f05          	ldw	(OFST-1,sp),x
1766  0264               L766:
1767                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1769  0264 1e0e          	ldw	x,(OFST+8,sp)
1770  0266 72fb05        	addw	x,(OFST-1,sp)
1771  0269 f6            	ld	a,(x)
1772  026a 1e03          	ldw	x,(OFST-3,sp)
1773  026c 72fb05        	addw	x,(OFST-1,sp)
1774  026f f7            	ld	(x),a
1775                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1777  0270 1e05          	ldw	x,(OFST-1,sp)
1778  0272 1c0001        	addw	x,#1
1779  0275 1f05          	ldw	(OFST-1,sp),x
1783  0277 1e05          	ldw	x,(OFST-1,sp)
1784  0279 a30080        	cpw	x,#128
1785  027c 25e6          	jrult	L766
1786                     ; 697 }
1789  027e 5b08          	addw	sp,#8
1790  0280 87            	retf
1802                     	xdef	f_FLASH_WaitForLastOperation
1803                     	xdef	f_FLASH_ProgramBlock
1804                     	xdef	f_FLASH_EraseBlock
1805                     	xdef	f_FLASH_GetFlagStatus
1806                     	xdef	f_FLASH_GetBootSize
1807                     	xdef	f_FLASH_GetProgrammingTime
1808                     	xdef	f_FLASH_GetLowPowerMode
1809                     	xdef	f_FLASH_SetProgrammingTime
1810                     	xdef	f_FLASH_SetLowPowerMode
1811                     	xdef	f_FLASH_EraseOptionByte
1812                     	xdef	f_FLASH_ProgramOptionByte
1813                     	xdef	f_FLASH_ReadOptionByte
1814                     	xdef	f_FLASH_ProgramWord
1815                     	xdef	f_FLASH_ReadByte
1816                     	xdef	f_FLASH_ProgramByte
1817                     	xdef	f_FLASH_EraseByte
1818                     	xdef	f_FLASH_ITConfig
1819                     	xdef	f_FLASH_DeInit
1820                     	xdef	f_FLASH_Lock
1821                     	xdef	f_FLASH_Unlock
1822                     	xref.b	c_lreg
1823                     	xref.b	c_x
1824                     	xref.b	c_y
1843                     	xref	d_ladd
1844                     	xref	d_cmulx
1845                     	xref	d_ltor
1846                     	xref	d_lgadd
1847                     	xref	d_rtol
1848                     	xref	d_umul
1849                     	end
