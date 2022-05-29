   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  74                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  74                     ; 88 {
  76                     	switch	.text
  77  0000               _FLASH_Unlock:
  81                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  83                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  85  0000 a1fd          	cp	a,#253
  86  0002 260a          	jrne	L73
  87                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  89  0004 35565062      	mov	20578,#86
  90                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  92  0008 35ae5062      	mov	20578,#174
  94  000c 2008          	jra	L14
  95  000e               L73:
  96                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  98  000e 35ae5064      	mov	20580,#174
  99                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 101  0012 35565064      	mov	20580,#86
 102  0016               L14:
 103                     ; 104 }
 106  0016 81            	ret
 141                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 141                     ; 113 {
 142                     	switch	.text
 143  0017               _FLASH_Lock:
 147                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 149                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 151  0017 c4505f        	and	a,20575
 152  001a c7505f        	ld	20575,a
 153                     ; 119 }
 156  001d 81            	ret
 179                     ; 126 void FLASH_DeInit(void)
 179                     ; 127 {
 180                     	switch	.text
 181  001e               _FLASH_DeInit:
 185                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 187  001e 725f505a      	clr	20570
 188                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 190  0022 725f505b      	clr	20571
 191                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 193  0026 35ff505c      	mov	20572,#255
 194                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 196  002a 7217505f      	bres	20575,#3
 197                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 199  002e 7213505f      	bres	20575,#1
 200                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 202  0032 c6505f        	ld	a,20575
 203                     ; 134 }
 206  0035 81            	ret
 261                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 261                     ; 143 {
 262                     	switch	.text
 263  0036               _FLASH_ITConfig:
 267                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 269                     ; 147   if(NewState != DISABLE)
 271  0036 4d            	tnz	a
 272  0037 2706          	jreq	L711
 273                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 275  0039 7212505a      	bset	20570,#1
 277  003d 2004          	jra	L121
 278  003f               L711:
 279                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 281  003f 7213505a      	bres	20570,#1
 282  0043               L121:
 283                     ; 155 }
 286  0043 81            	ret
 318                     ; 164 void FLASH_EraseByte(uint32_t Address)
 318                     ; 165 {
 319                     	switch	.text
 320  0044               _FLASH_EraseByte:
 322       00000000      OFST:	set	0
 325                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 327                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 329  0044 7b04          	ld	a,(OFST+4,sp)
 330  0046 b700          	ld	c_x,a
 331  0048 1e05          	ldw	x,(OFST+5,sp)
 332  004a bf01          	ldw	c_x+1,x
 333  004c 4f            	clr	a
 334  004d 92bd0000      	ldf	[c_x.e],a
 335                     ; 171 }
 338  0051 81            	ret
 377                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 377                     ; 182 {
 378                     	switch	.text
 379  0052               _FLASH_ProgramByte:
 381       00000000      OFST:	set	0
 384                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 386                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 388  0052 7b07          	ld	a,(OFST+7,sp)
 389  0054 88            	push	a
 390  0055 7b05          	ld	a,(OFST+5,sp)
 391  0057 b700          	ld	c_x,a
 392  0059 1e06          	ldw	x,(OFST+6,sp)
 393  005b 84            	pop	a
 394  005c bf01          	ldw	c_x+1,x
 395  005e 92bd0000      	ldf	[c_x.e],a
 396                     ; 186 }
 399  0062 81            	ret
 431                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 431                     ; 196 {
 432                     	switch	.text
 433  0063               _FLASH_ReadByte:
 435       00000000      OFST:	set	0
 438                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 440                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 442  0063 7b04          	ld	a,(OFST+4,sp)
 443  0065 b700          	ld	c_x,a
 444  0067 1e05          	ldw	x,(OFST+5,sp)
 445  0069 bf01          	ldw	c_x+1,x
 446  006b 92bc0000      	ldf	a,[c_x.e]
 449  006f 81            	ret
 488                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 488                     ; 213 {
 489                     	switch	.text
 490  0070               _FLASH_ProgramWord:
 492       00000000      OFST:	set	0
 495                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 497                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 499  0070 721c505b      	bset	20571,#6
 500                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 502  0074 721d505c      	bres	20572,#6
 503                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 505  0078 7b07          	ld	a,(OFST+7,sp)
 506  007a 88            	push	a
 507  007b 7b05          	ld	a,(OFST+5,sp)
 508  007d b700          	ld	c_x,a
 509  007f 1e06          	ldw	x,(OFST+6,sp)
 510  0081 84            	pop	a
 511  0082 bf01          	ldw	c_x+1,x
 512  0084 92bd0000      	ldf	[c_x.e],a
 513                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 515  0088 7b08          	ld	a,(OFST+8,sp)
 516  008a 88            	push	a
 517  008b 7b05          	ld	a,(OFST+5,sp)
 518  008d b700          	ld	c_x,a
 519  008f 1e06          	ldw	x,(OFST+6,sp)
 520  0091 84            	pop	a
 521  0092 90ae0001      	ldw	y,#1
 522  0096 bf01          	ldw	c_x+1,x
 523  0098 93            	ldw	x,y
 524  0099 92a70000      	ldf	([c_x.e],x),a
 525                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 527  009d 7b09          	ld	a,(OFST+9,sp)
 528  009f 88            	push	a
 529  00a0 7b05          	ld	a,(OFST+5,sp)
 530  00a2 b700          	ld	c_x,a
 531  00a4 1e06          	ldw	x,(OFST+6,sp)
 532  00a6 84            	pop	a
 533  00a7 90ae0002      	ldw	y,#2
 534  00ab bf01          	ldw	c_x+1,x
 535  00ad 93            	ldw	x,y
 536  00ae 92a70000      	ldf	([c_x.e],x),a
 537                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 539  00b2 7b0a          	ld	a,(OFST+10,sp)
 540  00b4 88            	push	a
 541  00b5 7b05          	ld	a,(OFST+5,sp)
 542  00b7 b700          	ld	c_x,a
 543  00b9 1e06          	ldw	x,(OFST+6,sp)
 544  00bb 84            	pop	a
 545  00bc 90ae0003      	ldw	y,#3
 546  00c0 bf01          	ldw	c_x+1,x
 547  00c2 93            	ldw	x,y
 548  00c3 92a70000      	ldf	([c_x.e],x),a
 549                     ; 229 }
 552  00c7 81            	ret
 593                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 593                     ; 238 {
 594                     	switch	.text
 595  00c8               _FLASH_ProgramOptionByte:
 597  00c8 89            	pushw	x
 598       00000000      OFST:	set	0
 601                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 603                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 605  00c9 721e505b      	bset	20571,#7
 606                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 608  00cd 721f505c      	bres	20572,#7
 609                     ; 247   if(Address == 0x4800)
 611  00d1 a34800        	cpw	x,#18432
 612  00d4 2607          	jrne	L522
 613                     ; 250     *((NEAR uint8_t*)Address) = Data;
 615  00d6 7b05          	ld	a,(OFST+5,sp)
 616  00d8 1e01          	ldw	x,(OFST+1,sp)
 617  00da f7            	ld	(x),a
 619  00db 200c          	jra	L722
 620  00dd               L522:
 621                     ; 255     *((NEAR uint8_t*)Address) = Data;
 623  00dd 7b05          	ld	a,(OFST+5,sp)
 624  00df 1e01          	ldw	x,(OFST+1,sp)
 625  00e1 f7            	ld	(x),a
 626                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 628  00e2 7b05          	ld	a,(OFST+5,sp)
 629  00e4 43            	cpl	a
 630  00e5 1e01          	ldw	x,(OFST+1,sp)
 631  00e7 e701          	ld	(1,x),a
 632  00e9               L722:
 633                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 635  00e9 a6fd          	ld	a,#253
 636  00eb cd01d3        	call	_FLASH_WaitForLastOperation
 638                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 640  00ee 721f505b      	bres	20571,#7
 641                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 643  00f2 721e505c      	bset	20572,#7
 644                     ; 263 }
 647  00f6 85            	popw	x
 648  00f7 81            	ret
 682                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 682                     ; 271 {
 683                     	switch	.text
 684  00f8               _FLASH_EraseOptionByte:
 686  00f8 89            	pushw	x
 687       00000000      OFST:	set	0
 690                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 692                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 694  00f9 721e505b      	bset	20571,#7
 695                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 697  00fd 721f505c      	bres	20572,#7
 698                     ; 280   if(Address == 0x4800)
 700  0101 a34800        	cpw	x,#18432
 701  0104 2603          	jrne	L542
 702                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 704  0106 7f            	clr	(x)
 706  0107 2009          	jra	L742
 707  0109               L542:
 708                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 710  0109 1e01          	ldw	x,(OFST+1,sp)
 711  010b 7f            	clr	(x)
 712                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 714  010c 1e01          	ldw	x,(OFST+1,sp)
 715  010e a6ff          	ld	a,#255
 716  0110 e701          	ld	(1,x),a
 717  0112               L742:
 718                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 720  0112 a6fd          	ld	a,#253
 721  0114 cd01d3        	call	_FLASH_WaitForLastOperation
 723                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 725  0117 721f505b      	bres	20571,#7
 726                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 728  011b 721e505c      	bset	20572,#7
 729                     ; 296 }
 732  011f 85            	popw	x
 733  0120 81            	ret
 788                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 788                     ; 304 {
 789                     	switch	.text
 790  0121               _FLASH_ReadOptionByte:
 792  0121 5204          	subw	sp,#4
 793       00000004      OFST:	set	4
 796                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 798                     ; 306   uint16_t res_value = 0;
 800                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 802                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 804  0123 f6            	ld	a,(x)
 805  0124 6b01          	ld	(OFST-3,sp),a
 807                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 809  0126 e601          	ld	a,(1,x)
 810  0128 6b02          	ld	(OFST-2,sp),a
 812                     ; 315   if(Address == 0x4800)	 
 814  012a a34800        	cpw	x,#18432
 815  012d 2608          	jrne	L372
 816                     ; 317     res_value =	 value_optbyte;
 818  012f 7b01          	ld	a,(OFST-3,sp)
 819  0131 5f            	clrw	x
 820  0132 97            	ld	xl,a
 821  0133 1f03          	ldw	(OFST-1,sp),x
 824  0135 2023          	jra	L572
 825  0137               L372:
 826                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 828  0137 7b02          	ld	a,(OFST-2,sp)
 829  0139 43            	cpl	a
 830  013a 1101          	cp	a,(OFST-3,sp)
 831  013c 2617          	jrne	L772
 832                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 834  013e 7b01          	ld	a,(OFST-3,sp)
 835  0140 5f            	clrw	x
 836  0141 97            	ld	xl,a
 837  0142 4f            	clr	a
 838  0143 02            	rlwa	x,a
 839  0144 1f03          	ldw	(OFST-1,sp),x
 841                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 843  0146 7b02          	ld	a,(OFST-2,sp)
 844  0148 5f            	clrw	x
 845  0149 97            	ld	xl,a
 846  014a 01            	rrwa	x,a
 847  014b 1a04          	or	a,(OFST+0,sp)
 848  014d 01            	rrwa	x,a
 849  014e 1a03          	or	a,(OFST-1,sp)
 850  0150 01            	rrwa	x,a
 851  0151 1f03          	ldw	(OFST-1,sp),x
 854  0153 2005          	jra	L572
 855  0155               L772:
 856                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 858  0155 ae5555        	ldw	x,#21845
 859  0158 1f03          	ldw	(OFST-1,sp),x
 861  015a               L572:
 862                     ; 331   return(res_value);
 864  015a 1e03          	ldw	x,(OFST-1,sp)
 867  015c 5b04          	addw	sp,#4
 868  015e 81            	ret
 942                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 942                     ; 341 {
 943                     	switch	.text
 944  015f               _FLASH_SetLowPowerMode:
 946  015f 88            	push	a
 947       00000000      OFST:	set	0
 950                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 952                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 954  0160 c6505a        	ld	a,20570
 955  0163 a4f3          	and	a,#243
 956  0165 c7505a        	ld	20570,a
 957                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 959  0168 c6505a        	ld	a,20570
 960  016b 1a01          	or	a,(OFST+1,sp)
 961  016d c7505a        	ld	20570,a
 962                     ; 350 }
 965  0170 84            	pop	a
 966  0171 81            	ret
1024                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1024                     ; 359 {
1025                     	switch	.text
1026  0172               _FLASH_SetProgrammingTime:
1030                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1032                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1034  0172 7211505a      	bres	20570,#0
1035                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1037  0176 ca505a        	or	a,20570
1038  0179 c7505a        	ld	20570,a
1039                     ; 365 }
1042  017c 81            	ret
1067                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1067                     ; 373 {
1068                     	switch	.text
1069  017d               _FLASH_GetLowPowerMode:
1073                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1075  017d c6505a        	ld	a,20570
1076  0180 a40c          	and	a,#12
1079  0182 81            	ret
1104                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1104                     ; 383 {
1105                     	switch	.text
1106  0183               _FLASH_GetProgrammingTime:
1110                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1112  0183 c6505a        	ld	a,20570
1113  0186 a401          	and	a,#1
1116  0188 81            	ret
1148                     ; 392 uint32_t FLASH_GetBootSize(void)
1148                     ; 393 {
1149                     	switch	.text
1150  0189               _FLASH_GetBootSize:
1152  0189 5204          	subw	sp,#4
1153       00000004      OFST:	set	4
1156                     ; 394   uint32_t temp = 0;
1158                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1160  018b c6505d        	ld	a,20573
1161  018e 5f            	clrw	x
1162  018f 97            	ld	xl,a
1163  0190 90ae0200      	ldw	y,#512
1164  0194 cd0000        	call	c_umul
1166  0197 96            	ldw	x,sp
1167  0198 1c0001        	addw	x,#OFST-3
1168  019b cd0000        	call	c_rtol
1171                     ; 400   if(FLASH->FPR == 0xFF)
1173  019e c6505d        	ld	a,20573
1174  01a1 a1ff          	cp	a,#255
1175  01a3 2611          	jrne	L714
1176                     ; 402     temp += 512;
1178  01a5 ae0200        	ldw	x,#512
1179  01a8 bf02          	ldw	c_lreg+2,x
1180  01aa ae0000        	ldw	x,#0
1181  01ad bf00          	ldw	c_lreg,x
1182  01af 96            	ldw	x,sp
1183  01b0 1c0001        	addw	x,#OFST-3
1184  01b3 cd0000        	call	c_lgadd
1187  01b6               L714:
1188                     ; 406   return(temp);
1190  01b6 96            	ldw	x,sp
1191  01b7 1c0001        	addw	x,#OFST-3
1192  01ba cd0000        	call	c_ltor
1196  01bd 5b04          	addw	sp,#4
1197  01bf 81            	ret
1306                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1306                     ; 418 {
1307                     	switch	.text
1308  01c0               _FLASH_GetFlagStatus:
1310  01c0 88            	push	a
1311       00000001      OFST:	set	1
1314                     ; 419   FlagStatus status = RESET;
1316                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1318                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1320  01c1 c4505f        	and	a,20575
1321  01c4 2706          	jreq	L174
1322                     ; 426     status = SET; /* FLASH_FLAG is set */
1324  01c6 a601          	ld	a,#1
1325  01c8 6b01          	ld	(OFST+0,sp),a
1328  01ca 2002          	jra	L374
1329  01cc               L174:
1330                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1332  01cc 0f01          	clr	(OFST+0,sp)
1334  01ce               L374:
1335                     ; 434   return status;
1337  01ce 7b01          	ld	a,(OFST+0,sp)
1340  01d0 5b01          	addw	sp,#1
1341  01d2 81            	ret
1430                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1430                     ; 550 {
1431                     	switch	.text
1432  01d3               _FLASH_WaitForLastOperation:
1434  01d3 5203          	subw	sp,#3
1435       00000003      OFST:	set	3
1438                     ; 551   uint8_t flagstatus = 0x00;
1440  01d5 0f03          	clr	(OFST+0,sp)
1442                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1444  01d7 aeffff        	ldw	x,#65535
1445  01da 1f01          	ldw	(OFST-2,sp),x
1447                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1449  01dc a1fd          	cp	a,#253
1450  01de 2628          	jrne	L155
1452  01e0 200e          	jra	L735
1453  01e2               L535:
1454                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1454                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1456  01e2 c6505f        	ld	a,20575
1457  01e5 a405          	and	a,#5
1458  01e7 6b03          	ld	(OFST+0,sp),a
1460                     ; 563         timeout--;
1462  01e9 1e01          	ldw	x,(OFST-2,sp)
1463  01eb 1d0001        	subw	x,#1
1464  01ee 1f01          	ldw	(OFST-2,sp),x
1466  01f0               L735:
1467                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1469  01f0 0d03          	tnz	(OFST+0,sp)
1470  01f2 261c          	jrne	L545
1472  01f4 1e01          	ldw	x,(OFST-2,sp)
1473  01f6 26ea          	jrne	L535
1474  01f8 2016          	jra	L545
1475  01fa               L745:
1476                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1476                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1478  01fa c6505f        	ld	a,20575
1479  01fd a441          	and	a,#65
1480  01ff 6b03          	ld	(OFST+0,sp),a
1482                     ; 572         timeout--;
1484  0201 1e01          	ldw	x,(OFST-2,sp)
1485  0203 1d0001        	subw	x,#1
1486  0206 1f01          	ldw	(OFST-2,sp),x
1488  0208               L155:
1489                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1491  0208 0d03          	tnz	(OFST+0,sp)
1492  020a 2604          	jrne	L545
1494  020c 1e01          	ldw	x,(OFST-2,sp)
1495  020e 26ea          	jrne	L745
1496  0210               L545:
1497                     ; 584   if(timeout == 0x00 )
1499  0210 1e01          	ldw	x,(OFST-2,sp)
1500  0212 2604          	jrne	L755
1501                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1503  0214 a602          	ld	a,#2
1504  0216 6b03          	ld	(OFST+0,sp),a
1506  0218               L755:
1507                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1509  0218 7b03          	ld	a,(OFST+0,sp)
1512  021a 5b03          	addw	sp,#3
1513  021c 81            	ret
1572                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1572                     ; 600 {
1573                     	switch	.text
1574  021d               _FLASH_EraseBlock:
1576  021d 89            	pushw	x
1577  021e 5207          	subw	sp,#7
1578       00000007      OFST:	set	7
1581                     ; 601   uint32_t startaddress = 0;
1583                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1585                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1587  0220 7b0c          	ld	a,(OFST+5,sp)
1588  0222 a1fd          	cp	a,#253
1589  0224 260c          	jrne	L706
1590                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1592                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1594  0226 ae8000        	ldw	x,#32768
1595  0229 1f03          	ldw	(OFST-4,sp),x
1596  022b ae0000        	ldw	x,#0
1597  022e 1f01          	ldw	(OFST-6,sp),x
1600  0230 200a          	jra	L116
1601  0232               L706:
1602                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1604                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1606  0232 ae4000        	ldw	x,#16384
1607  0235 1f03          	ldw	(OFST-4,sp),x
1608  0237 ae0000        	ldw	x,#0
1609  023a 1f01          	ldw	(OFST-6,sp),x
1611  023c               L116:
1612                     ; 625   pwFlash = (PointerAttr uint8_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1614  023c 1e08          	ldw	x,(OFST+1,sp)
1615  023e a680          	ld	a,#128
1616  0240 cd0000        	call	c_cmulx
1618  0243 96            	ldw	x,sp
1619  0244 1c0001        	addw	x,#OFST-6
1620  0247 cd0000        	call	c_ladd
1622  024a 450100        	mov	c_x,c_lreg+1
1623  024d be02          	ldw	x,c_lreg+2
1624  024f b600          	ld	a,c_x
1625  0251 6b05          	ld	(OFST-2,sp),a
1626  0253 1f06          	ldw	(OFST-1,sp),x
1628                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1630  0255 721a505b      	bset	20571,#5
1631                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1633  0259 721b505c      	bres	20572,#5
1634                     ; 640     *pwFlash = (uint8_t)0;
1636  025d 7b05          	ld	a,(OFST-2,sp)
1637  025f b700          	ld	c_x,a
1638  0261 1e06          	ldw	x,(OFST-1,sp)
1639  0263 bf01          	ldw	c_x+1,x
1640  0265 4f            	clr	a
1641  0266 92bd0000      	ldf	[c_x.e],a
1642                     ; 641   *(pwFlash + 1) = (uint8_t)0;
1644  026a 7b05          	ld	a,(OFST-2,sp)
1645  026c b700          	ld	c_x,a
1646  026e 1e06          	ldw	x,(OFST-1,sp)
1647  0270 90ae0001      	ldw	y,#1
1648  0274 bf01          	ldw	c_x+1,x
1649  0276 93            	ldw	x,y
1650  0277 4f            	clr	a
1651  0278 92a70000      	ldf	([c_x.e],x),a
1652                     ; 642   *(pwFlash + 2) = (uint8_t)0;
1654  027c 7b05          	ld	a,(OFST-2,sp)
1655  027e b700          	ld	c_x,a
1656  0280 1e06          	ldw	x,(OFST-1,sp)
1657  0282 90ae0002      	ldw	y,#2
1658  0286 bf01          	ldw	c_x+1,x
1659  0288 93            	ldw	x,y
1660  0289 4f            	clr	a
1661  028a 92a70000      	ldf	([c_x.e],x),a
1662                     ; 643   *(pwFlash + 3) = (uint8_t)0;    
1664  028e 7b05          	ld	a,(OFST-2,sp)
1665  0290 b700          	ld	c_x,a
1666  0292 1e06          	ldw	x,(OFST-1,sp)
1667  0294 90ae0003      	ldw	y,#3
1668  0298 bf01          	ldw	c_x+1,x
1669  029a 93            	ldw	x,y
1670  029b 4f            	clr	a
1671  029c 92a70000      	ldf	([c_x.e],x),a
1672                     ; 645 }
1675  02a0 5b09          	addw	sp,#9
1676  02a2 81            	ret
1774                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1774                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1774                     ; 658 {
1775                     	switch	.text
1776  02a3               _FLASH_ProgramBlock:
1778  02a3 89            	pushw	x
1779  02a4 5206          	subw	sp,#6
1780       00000006      OFST:	set	6
1783                     ; 659   uint16_t Count = 0;
1785                     ; 660   uint32_t startaddress = 0;
1787                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1789                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1791                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1793  02a6 7b0b          	ld	a,(OFST+5,sp)
1794  02a8 a1fd          	cp	a,#253
1795  02aa 260c          	jrne	L756
1796                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1798                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1800  02ac ae8000        	ldw	x,#32768
1801  02af 1f03          	ldw	(OFST-3,sp),x
1802  02b1 ae0000        	ldw	x,#0
1803  02b4 1f01          	ldw	(OFST-5,sp),x
1806  02b6 200a          	jra	L166
1807  02b8               L756:
1808                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1810                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1812  02b8 ae4000        	ldw	x,#16384
1813  02bb 1f03          	ldw	(OFST-3,sp),x
1814  02bd ae0000        	ldw	x,#0
1815  02c0 1f01          	ldw	(OFST-5,sp),x
1817  02c2               L166:
1818                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1820  02c2 1e07          	ldw	x,(OFST+1,sp)
1821  02c4 a680          	ld	a,#128
1822  02c6 cd0000        	call	c_cmulx
1824  02c9 96            	ldw	x,sp
1825  02ca 1c0001        	addw	x,#OFST-5
1826  02cd cd0000        	call	c_lgadd
1829                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1831  02d0 0d0c          	tnz	(OFST+6,sp)
1832  02d2 260a          	jrne	L366
1833                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
1835  02d4 7210505b      	bset	20571,#0
1836                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1838  02d8 7211505c      	bres	20572,#0
1840  02dc 2008          	jra	L566
1841  02de               L366:
1842                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
1844  02de 7218505b      	bset	20571,#4
1845                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1847  02e2 7219505c      	bres	20572,#4
1848  02e6               L566:
1849                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1851  02e6 5f            	clrw	x
1852  02e7 1f05          	ldw	(OFST-1,sp),x
1854  02e9               L766:
1855                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1857  02e9 1e0d          	ldw	x,(OFST+7,sp)
1858  02eb 72fb05        	addw	x,(OFST-1,sp)
1859  02ee f6            	ld	a,(x)
1860  02ef 88            	push	a
1861  02f0 7b03          	ld	a,(OFST-3,sp)
1862  02f2 b700          	ld	c_x,a
1863  02f4 1e04          	ldw	x,(OFST-2,sp)
1864  02f6 84            	pop	a
1865  02f7 1605          	ldw	y,(OFST-1,sp)
1866  02f9 bf01          	ldw	c_x+1,x
1867  02fb 93            	ldw	x,y
1868  02fc 92a70000      	ldf	([c_x.e],x),a
1869                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1871  0300 1e05          	ldw	x,(OFST-1,sp)
1872  0302 1c0001        	addw	x,#1
1873  0305 1f05          	ldw	(OFST-1,sp),x
1877  0307 1e05          	ldw	x,(OFST-1,sp)
1878  0309 a30080        	cpw	x,#128
1879  030c 25db          	jrult	L766
1880                     ; 698 }
1883  030e 5b08          	addw	sp,#8
1884  0310 81            	ret
1897                     	xdef	_FLASH_WaitForLastOperation
1898                     	xdef	_FLASH_ProgramBlock
1899                     	xdef	_FLASH_EraseBlock
1900                     	xdef	_FLASH_GetFlagStatus
1901                     	xdef	_FLASH_GetBootSize
1902                     	xdef	_FLASH_GetProgrammingTime
1903                     	xdef	_FLASH_GetLowPowerMode
1904                     	xdef	_FLASH_SetProgrammingTime
1905                     	xdef	_FLASH_SetLowPowerMode
1906                     	xdef	_FLASH_EraseOptionByte
1907                     	xdef	_FLASH_ProgramOptionByte
1908                     	xdef	_FLASH_ReadOptionByte
1909                     	xdef	_FLASH_ProgramWord
1910                     	xdef	_FLASH_ReadByte
1911                     	xdef	_FLASH_ProgramByte
1912                     	xdef	_FLASH_EraseByte
1913                     	xdef	_FLASH_ITConfig
1914                     	xdef	_FLASH_DeInit
1915                     	xdef	_FLASH_Lock
1916                     	xdef	_FLASH_Unlock
1917                     	xref.b	c_lreg
1918                     	xref.b	c_x
1919                     	xref.b	c_y
1938                     	xref	c_ladd
1939                     	xref	c_cmulx
1940                     	xref	c_ltor
1941                     	xref	c_lgadd
1942                     	xref	c_rtol
1943                     	xref	c_umul
1944                     	end
