   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  79                     ; 59 void TSL_SCKey_Init(void)
  79                     ; 60 {
  81                     	switch	.text
  82  0000               _TSL_SCKey_Init:
  86                     ; 61   for (KeyIndex = 0; KeyIndex < NUMBER_OF_SINGLE_CHANNEL_KEYS; KeyIndex++)
  88  0000 3f00          	clr	_KeyIndex
  89  0002               L53:
  90                     ; 63     TSL_SetStructPointer();
  92  0002 cd0000        	call	_TSL_SetStructPointer
  94                     ; 64     pKeyStruct->State.whole = DISABLED_STATE;
  96  0005 a680          	ld	a,#128
  97  0007 92c700        	ld	[_pKeyStruct.w],a
  98                     ; 65     pKeyStruct->DetectThreshold = SCKEY_DETECTTHRESHOLD_DEFAULT;
 100  000a be00          	ldw	x,_pKeyStruct
 101  000c a61e          	ld	a,#30
 102  000e e70c          	ld	(12,x),a
 103                     ; 66     pKeyStruct->EndDetectThreshold = SCKEY_ENDDETECTTHRESHOLD_DEFAULT;
 105  0010 be00          	ldw	x,_pKeyStruct
 106  0012 a612          	ld	a,#18
 107  0014 e70d          	ld	(13,x),a
 108                     ; 67     pKeyStruct->RecalibrationThreshold = SCKEY_RECALIBRATIONTHRESHOLD_DEFAULT;
 110  0016 be00          	ldw	x,_pKeyStruct
 111  0018 a6ee          	ld	a,#238
 112  001a e70e          	ld	(14,x),a
 113                     ; 61   for (KeyIndex = 0; KeyIndex < NUMBER_OF_SINGLE_CHANNEL_KEYS; KeyIndex++)
 115  001c 3c00          	inc	_KeyIndex
 118  001e b600          	ld	a,_KeyIndex
 119  0020 a103          	cp	a,#3
 120  0022 25de          	jrult	L53
 121                     ; 69 }
 124  0024 81            	ret
 155                     ; 82 void TSL_SCKEY_P1_Acquisition(void)
 155                     ; 83 {
 156                     	switch	.text
 157  0025               _TSL_SCKEY_P1_Acquisition:
 161                     ; 84   sTouchIO.PORT_ADDR = (GPIO_TypeDef *)(SCKEY_P1_PORT_ADDR);
 163  0025 ae5005        	ldw	x,#20485
 164  0028 bf00          	ldw	_sTouchIO,x
 165                     ; 85   for (KeyIndex = 0; KeyIndex < SCKEY_P1_KEY_COUNT; KeyIndex++)
 167  002a 3f00          	clr	_KeyIndex
 168  002c               L35:
 169                     ; 87     TSL_SetStructPointer();
 171  002c cd0000        	call	_TSL_SetStructPointer
 173                     ; 88     if ((pKeyStruct->State.whole != ERROR_STATE) && (pKeyStruct->State.whole != DISABLED_STATE))
 175  002f 92c600        	ld	a,[_pKeyStruct.w]
 176  0032 a108          	cp	a,#8
 177  0034 273e          	jreq	L16
 179  0036 92c600        	ld	a,[_pKeyStruct.w]
 180  0039 a180          	cp	a,#128
 181  003b 2737          	jreq	L16
 182                     ; 90       sTouchIO.AcqMask = Table_SCKEY_BITS[KeyIndex];
 184  003d b600          	ld	a,_KeyIndex
 185  003f 5f            	clrw	x
 186  0040 97            	ld	xl,a
 187  0041 d60000        	ld	a,(_Table_SCKEY_BITS,x)
 188  0044 b702          	ld	_sTouchIO+2,a
 189                     ; 91       sTouchIO.DriveMask = (u8)(sTouchIO.AcqMask | SCKEY_P1_DRIVEN_SHIELD_MASK);
 191  0046 b602          	ld	a,_sTouchIO+2
 192  0048 aa80          	or	a,#128
 193  004a b703          	ld	_sTouchIO+3,a
 194                     ; 92       sTouchIO.Measurement = &sSCKeyInfo[KeyIndex].Channel.LastMeas;
 196  004c b600          	ld	a,_KeyIndex
 197  004e 97            	ld	xl,a
 198  004f a60f          	ld	a,#15
 199  0051 42            	mul	x,a
 200  0052 01            	rrwa	x,a
 201  0053 ab05          	add	a,#_sSCKeyInfo+5
 202  0055 2401          	jrnc	L01
 203  0057 5c            	incw	x
 204  0058               L01:
 205  0058 5f            	clrw	x
 206  0059 97            	ld	xl,a
 207  005a bf04          	ldw	_sTouchIO+4,x
 208                     ; 93       sTouchIO.RejectedNb = &sSCKeyInfo[KeyIndex].Channel.LastMeasRejectNb;
 210  005c b600          	ld	a,_KeyIndex
 211  005e 97            	ld	xl,a
 212  005f a60f          	ld	a,#15
 213  0061 42            	mul	x,a
 214  0062 01            	rrwa	x,a
 215  0063 ab07          	add	a,#_sSCKeyInfo+7
 216  0065 2401          	jrnc	L21
 217  0067 5c            	incw	x
 218  0068               L21:
 219  0068 5f            	clrw	x
 220  0069 97            	ld	xl,a
 221  006a bf06          	ldw	_sTouchIO+6,x
 222                     ; 94       sTouchIO.Type = SCKEY_TYPE;
 224  006c 3f08          	clr	_sTouchIO+8
 225                     ; 95       TSL_IO_Acquisition(SCKEY_ACQ_NUM, SCKEY_ADJUST_LEVEL);
 227  006e ae0302        	ldw	x,#770
 228  0071 cd0000        	call	_TSL_IO_Acquisition
 230  0074               L16:
 231                     ; 85   for (KeyIndex = 0; KeyIndex < SCKEY_P1_KEY_COUNT; KeyIndex++)
 233  0074 3c00          	inc	_KeyIndex
 236  0076 b600          	ld	a,_KeyIndex
 237  0078 a103          	cp	a,#3
 238  007a 25b0          	jrult	L35
 239                     ; 98 }
 242  007c 81            	ret
 280                     ; 176 void TSL_SCKey_Process(void)
 280                     ; 177 {
 281                     	switch	.text
 282  007d               _TSL_SCKey_Process:
 286                     ; 178   TSL_SetStructPointer();
 288  007d cd0000        	call	_TSL_SetStructPointer
 290                     ; 180   TSL_DeltaCalculation();
 292  0080 cd0000        	call	_TSL_DeltaCalculation
 294                     ; 182   switch (pKeyStruct->State.whole)
 296  0083 92c600        	ld	a,[_pKeyStruct.w]
 298                     ; 233       break;
 299  0086 4a            	dec	a
 300  0087 2751          	jreq	L57
 301  0089 4a            	dec	a
 302  008a 271a          	jreq	L36
 303  008c a002          	sub	a,#2
 304  008e 272d          	jreq	L76
 305  0090 a004          	sub	a,#4
 306  0092 2759          	jreq	L77
 307  0094 a009          	sub	a,#9
 308  0096 273d          	jreq	L37
 309  0098 a003          	sub	a,#3
 310  009a 271c          	jreq	L56
 311  009c a010          	sub	a,#16
 312  009e 2730          	jreq	L17
 313  00a0 a05c          	sub	a,#92
 314  00a2 274e          	jreq	L101
 315  00a4               L721:
 317  00a4 20fe          	jra	L721
 318  00a6               L36:
 319                     ; 185     case IDLE_STATE:
 319                     ; 186       if (TSL_SCKey_CheckErrorCondition())
 321  00a6 cd0245        	call	_TSL_SCKey_CheckErrorCondition
 323  00a9 4d            	tnz	a
 324  00aa 2705          	jreq	L121
 325                     ; 188         TSL_SCKey_SetErrorState();
 327  00ac cd0000        	call	_TSL_SCKey_SetErrorState
 329                     ; 189         break;
 331  00af 2044          	jra	L711
 332  00b1               L121:
 333                     ; 191       TSL_SCKey_IdleTreatment();
 335  00b1 ad5f          	call	_TSL_SCKey_IdleTreatment
 337                     ; 192       TSL_SCKey_CheckDisabled();
 339  00b3 cd0225        	call	_TSL_SCKey_CheckDisabled
 341                     ; 193       break;
 343  00b6 203d          	jra	L711
 344  00b8               L56:
 345                     ; 195     case PRE_DETECTED_STATE:
 345                     ; 196       TSL_SCKey_PreDetectTreatment();
 347  00b8 cd014b        	call	_TSL_SCKey_PreDetectTreatment
 349                     ; 197       break;
 351  00bb 2038          	jra	L711
 352  00bd               L76:
 353                     ; 199     case DETECTED_STATE:
 353                     ; 200       if (TSL_SCKey_CheckErrorCondition())
 355  00bd cd0245        	call	_TSL_SCKey_CheckErrorCondition
 357  00c0 4d            	tnz	a
 358  00c1 2705          	jreq	L321
 359                     ; 202         TSL_SCKey_SetErrorState();
 361  00c3 cd0000        	call	_TSL_SCKey_SetErrorState
 363                     ; 203         break;
 365  00c6 202d          	jra	L711
 366  00c8               L321:
 367                     ; 205       TSL_SCKey_DetectedTreatment();
 369  00c8 cd0179        	call	_TSL_SCKey_DetectedTreatment
 371                     ; 206       TSL_SCKey_CheckDisabled();
 373  00cb cd0225        	call	_TSL_SCKey_CheckDisabled
 375                     ; 207       break;
 377  00ce 2025          	jra	L711
 378  00d0               L17:
 379                     ; 209     case POST_DETECTED_STATE:
 379                     ; 210       TSL_SCKey_PostDetectTreatment();
 381  00d0 cd01a2        	call	_TSL_SCKey_PostDetectTreatment
 383                     ; 211       break;
 385  00d3 2020          	jra	L711
 386  00d5               L37:
 387                     ; 213     case PRE_CALIBRATION_STATE:
 387                     ; 214       TSL_SCKey_PreRecalibrationTreatment();
 389  00d5 cd01cc        	call	_TSL_SCKey_PreRecalibrationTreatment
 391                     ; 215       break;
 393  00d8 201b          	jra	L711
 394  00da               L57:
 395                     ; 217     case CALIBRATION_STATE:
 395                     ; 218       if (TSL_SCKey_CheckErrorCondition())
 397  00da cd0245        	call	_TSL_SCKey_CheckErrorCondition
 399  00dd 4d            	tnz	a
 400  00de 2705          	jreq	L521
 401                     ; 220         TSL_SCKey_SetErrorState();
 403  00e0 cd0000        	call	_TSL_SCKey_SetErrorState
 405                     ; 221         break;
 407  00e3 2010          	jra	L711
 408  00e5               L521:
 409                     ; 223       TSL_SCKey_CalibrationTreatment();
 411  00e5 cd01f6        	call	_TSL_SCKey_CalibrationTreatment
 413                     ; 224       TSL_SCKey_CheckDisabled();
 415  00e8 cd0225        	call	_TSL_SCKey_CheckDisabled
 417                     ; 225       break;
 419  00eb 2008          	jra	L711
 420  00ed               L77:
 421                     ; 227     case ERROR_STATE:
 421                     ; 228       TSL_SCKey_CheckDisabled();
 423  00ed cd0225        	call	_TSL_SCKey_CheckDisabled
 425                     ; 229       break;
 427  00f0 2003          	jra	L711
 428  00f2               L101:
 429                     ; 231     case DISABLED_STATE:
 429                     ; 232       TSL_SCKey_CheckEnabled();
 431  00f2 cd0231        	call	_TSL_SCKey_CheckEnabled
 433                     ; 233       break;
 435  00f5               L711:
 436                     ; 243   TSL_TempGlobalSetting.whole |= pKeyStruct->Setting.whole;
 438  00f5 be00          	ldw	x,_pKeyStruct
 439  00f7 ee01          	ldw	x,(1,x)
 440  00f9 01            	rrwa	x,a
 441  00fa ba01          	or	a,_TSL_TempGlobalSetting+1
 442  00fc 01            	rrwa	x,a
 443  00fd ba00          	or	a,_TSL_TempGlobalSetting
 444  00ff 01            	rrwa	x,a
 445  0100 bf00          	ldw	_TSL_TempGlobalSetting,x
 446                     ; 244   TSL_TempGlobalState.whole |= pKeyStruct->State.whole;
 448  0102 b600          	ld	a,_TSL_TempGlobalState
 449  0104 92ca00        	or	a,[_pKeyStruct.w]
 450  0107 b700          	ld	_TSL_TempGlobalState,a
 451                     ; 245   pKeyStruct->Setting.b.CHANGED = 0;
 453  0109 be00          	ldw	x,_pKeyStruct
 454  010b e602          	ld	a,(2,x)
 455  010d a4f7          	and	a,#247
 456  010f e702          	ld	(2,x),a
 457                     ; 246 }
 460  0111 81            	ret
 490                     ; 259 void TSL_SCKey_IdleTreatment(void)
 490                     ; 260 {
 491                     	switch	.text
 492  0112               _TSL_SCKey_IdleTreatment:
 496                     ; 262   if (pKeyStruct->Channel.LastMeasRejectNb > MAX_REJECTED_MEASUREMENTS)
 498  0112 be00          	ldw	x,_pKeyStruct
 499  0114 e607          	ld	a,(7,x)
 500  0116 a115          	cp	a,#21
 501  0118 2501          	jrult	L341
 502                     ; 264     return;
 505  011a 81            	ret
 506  011b               L341:
 507                     ; 268   if (Delta <= pKeyStruct->RecalibrationThreshold)
 509  011b 9c            	rvf
 510  011c be00          	ldw	x,_pKeyStruct
 511  011e e60e          	ld	a,(14,x)
 512  0120 5f            	clrw	x
 513  0121 4d            	tnz	a
 514  0122 2a01          	jrpl	L02
 515  0124 53            	cplw	x
 516  0125               L02:
 517  0125 97            	ld	xl,a
 518  0126 b300          	cpw	x,_Delta
 519  0128 2f04          	jrslt	L541
 520                     ; 270     TSL_SCKey_SetPreRecalibrationState();
 522  012a cd0000        	call	_TSL_SCKey_SetPreRecalibrationState
 524                     ; 271     return;
 527  012d 81            	ret
 528  012e               L541:
 529                     ; 276   if (Delta >= pKeyStruct->DetectThreshold)
 531  012e 9c            	rvf
 532  012f be00          	ldw	x,_pKeyStruct
 533  0131 e60c          	ld	a,(12,x)
 534  0133 5f            	clrw	x
 535  0134 4d            	tnz	a
 536  0135 2a01          	jrpl	L22
 537  0137 53            	cplw	x
 538  0138               L22:
 539  0138 97            	ld	xl,a
 540  0139 b300          	cpw	x,_Delta
 541  013b 2c0d          	jrsgt	L741
 542                     ; 281     TSL_SCKey_SetPreDetectState();
 544  013d cd0000        	call	_TSL_SCKey_SetPreDetectState
 546                     ; 282     if (!DetectionIntegrator)
 548  0140 3d00          	tnz	_DetectionIntegrator
 549  0142 2606          	jrne	L741
 550                     ; 284       pKeyStruct->Channel.IntegratorCounter++;
 552  0144 be00          	ldw	x,_pKeyStruct
 553  0146 6c0a          	inc	(10,x)
 554                     ; 285       TSL_SCKey_PreDetectTreatment();
 556  0148 ad01          	call	_TSL_SCKey_PreDetectTreatment
 558  014a               L741:
 559                     ; 288 }
 562  014a 81            	ret
 591                     ; 301 void TSL_SCKey_PreDetectTreatment(void)
 591                     ; 302 {
 592                     	switch	.text
 593  014b               _TSL_SCKey_PreDetectTreatment:
 597                     ; 305   if ((pKeyStruct->Channel.LastMeasRejectNb <= MAX_REJECTED_MEASUREMENTS) &&
 597                     ; 306       (Delta >= pKeyStruct->DetectThreshold))
 599  014b be00          	ldw	x,_pKeyStruct
 600  014d e607          	ld	a,(7,x)
 601  014f a115          	cp	a,#21
 602  0151 2421          	jruge	L361
 604  0153 9c            	rvf
 605  0154 be00          	ldw	x,_pKeyStruct
 606  0156 e60c          	ld	a,(12,x)
 607  0158 5f            	clrw	x
 608  0159 4d            	tnz	a
 609  015a 2a01          	jrpl	L62
 610  015c 53            	cplw	x
 611  015d               L62:
 612  015d 97            	ld	xl,a
 613  015e b300          	cpw	x,_Delta
 614  0160 2c12          	jrsgt	L361
 615                     ; 312     TSL_SCKey_DxS();
 617  0162 cd0000        	call	_TSL_SCKey_DxS
 619                     ; 313     pKeyStruct->Channel.IntegratorCounter--;
 621  0165 be00          	ldw	x,_pKeyStruct
 622  0167 6a0a          	dec	(10,x)
 623                     ; 314     if (!pKeyStruct->Channel.IntegratorCounter)
 625  0169 be00          	ldw	x,_pKeyStruct
 626  016b 6d0a          	tnz	(10,x)
 627  016d 2609          	jrne	L761
 628                     ; 316       TSL_SCKey_SetDetectedState();
 630  016f cd0000        	call	_TSL_SCKey_SetDetectedState
 632  0172 2004          	jra	L761
 633  0174               L361:
 634                     ; 321     TSL_SCKey_BackToIdleState();
 636  0174 cd0000        	call	_TSL_SCKey_BackToIdleState
 638                     ; 322     return;
 641  0177 81            	ret
 642  0178               L761:
 643                     ; 324 }
 646  0178 81            	ret
 676                     ; 337 void TSL_SCKey_DetectedTreatment(void)
 676                     ; 338 {
 677                     	switch	.text
 678  0179               _TSL_SCKey_DetectedTreatment:
 682                     ; 340   if ((pKeyStruct->Channel.LastMeasRejectNb <= MAX_REJECTED_MEASUREMENTS) &&
 682                     ; 341       (Delta <= pKeyStruct->EndDetectThreshold))
 684  0179 be00          	ldw	x,_pKeyStruct
 685  017b e607          	ld	a,(7,x)
 686  017d a115          	cp	a,#21
 687  017f 241d          	jruge	L102
 689  0181 9c            	rvf
 690  0182 be00          	ldw	x,_pKeyStruct
 691  0184 e60d          	ld	a,(13,x)
 692  0186 5f            	clrw	x
 693  0187 4d            	tnz	a
 694  0188 2a01          	jrpl	L23
 695  018a 53            	cplw	x
 696  018b               L23:
 697  018b 97            	ld	xl,a
 698  018c b300          	cpw	x,_Delta
 699  018e 2f0e          	jrslt	L102
 700                     ; 348     TSL_SCKey_SetPostDetectState();
 702  0190 cd0000        	call	_TSL_SCKey_SetPostDetectState
 704                     ; 349     if (!EndDetectionIntegrator)
 706  0193 3d00          	tnz	_EndDetectionIntegrator
 707  0195 2606          	jrne	L302
 708                     ; 351       pKeyStruct->Channel.IntegratorCounter++;
 710  0197 be00          	ldw	x,_pKeyStruct
 711  0199 6c0a          	inc	(10,x)
 712                     ; 352       TSL_SCKey_PostDetectTreatment();
 714  019b ad05          	call	_TSL_SCKey_PostDetectTreatment
 716  019d               L302:
 717                     ; 354     return;
 720  019d 81            	ret
 721  019e               L102:
 722                     ; 357   TSL_SCKey_DetectionTimeout();
 724  019e cd0000        	call	_TSL_SCKey_DetectionTimeout
 726                     ; 358 }
 729  01a1 81            	ret
 757                     ; 371 void TSL_SCKey_PostDetectTreatment(void)
 757                     ; 372 {
 758                     	switch	.text
 759  01a2               _TSL_SCKey_PostDetectTreatment:
 763                     ; 374   if ((pKeyStruct->Channel.LastMeasRejectNb <= MAX_REJECTED_MEASUREMENTS) &&
 763                     ; 375       (Delta <= pKeyStruct->EndDetectThreshold))
 765  01a2 be00          	ldw	x,_pKeyStruct
 766  01a4 e607          	ld	a,(7,x)
 767  01a6 a115          	cp	a,#21
 768  01a8 241e          	jruge	L512
 770  01aa 9c            	rvf
 771  01ab be00          	ldw	x,_pKeyStruct
 772  01ad e60d          	ld	a,(13,x)
 773  01af 5f            	clrw	x
 774  01b0 4d            	tnz	a
 775  01b1 2a01          	jrpl	L63
 776  01b3 53            	cplw	x
 777  01b4               L63:
 778  01b4 97            	ld	xl,a
 779  01b5 b300          	cpw	x,_Delta
 780  01b7 2f0f          	jrslt	L512
 781                     ; 382     pKeyStruct->Channel.IntegratorCounter--;
 783  01b9 be00          	ldw	x,_pKeyStruct
 784  01bb 6a0a          	dec	(10,x)
 785                     ; 383     if (!pKeyStruct->Channel.IntegratorCounter)
 787  01bd be00          	ldw	x,_pKeyStruct
 788  01bf 6d0a          	tnz	(10,x)
 789  01c1 2608          	jrne	L122
 790                     ; 385       TSL_SCKey_SetIdleState();
 792  01c3 cd0000        	call	_TSL_SCKey_SetIdleState
 794  01c6 2003          	jra	L122
 795  01c8               L512:
 796                     ; 391     TSL_SCKey_BackToDetectedState();
 798  01c8 cd0000        	call	_TSL_SCKey_BackToDetectedState
 800  01cb               L122:
 801                     ; 393 }
 804  01cb 81            	ret
 832                     ; 406 void TSL_SCKey_PreRecalibrationTreatment(void)
 832                     ; 407 {
 833                     	switch	.text
 834  01cc               _TSL_SCKey_PreRecalibrationTreatment:
 838                     ; 408   if ((pKeyStruct->Channel.LastMeasRejectNb <= MAX_REJECTED_MEASUREMENTS) &&
 838                     ; 409       (Delta <= pKeyStruct->RecalibrationThreshold))
 840  01cc be00          	ldw	x,_pKeyStruct
 841  01ce e607          	ld	a,(7,x)
 842  01d0 a115          	cp	a,#21
 843  01d2 241e          	jruge	L332
 845  01d4 9c            	rvf
 846  01d5 be00          	ldw	x,_pKeyStruct
 847  01d7 e60e          	ld	a,(14,x)
 848  01d9 5f            	clrw	x
 849  01da 4d            	tnz	a
 850  01db 2a01          	jrpl	L24
 851  01dd 53            	cplw	x
 852  01de               L24:
 853  01de 97            	ld	xl,a
 854  01df b300          	cpw	x,_Delta
 855  01e1 2f0f          	jrslt	L332
 856                     ; 411     pKeyStruct->Channel.IntegratorCounter--;
 858  01e3 be00          	ldw	x,_pKeyStruct
 859  01e5 6a0a          	dec	(10,x)
 860                     ; 412     if (!pKeyStruct->Channel.IntegratorCounter)
 862  01e7 be00          	ldw	x,_pKeyStruct
 863  01e9 6d0a          	tnz	(10,x)
 864  01eb 2608          	jrne	L732
 865                     ; 414       TSL_SCKey_SetCalibrationState();
 867  01ed cd0000        	call	_TSL_SCKey_SetCalibrationState
 869  01f0 2003          	jra	L732
 870  01f2               L332:
 871                     ; 419     TSL_SCKey_BackToIdleState();
 873  01f2 cd0000        	call	_TSL_SCKey_BackToIdleState
 875  01f5               L732:
 876                     ; 421 }
 879  01f5 81            	ret
 905                     ; 434 void TSL_SCKey_CalibrationTreatment(void)
 905                     ; 435 {
 906                     	switch	.text
 907  01f6               _TSL_SCKey_CalibrationTreatment:
 911                     ; 436   if (pKeyStruct->Channel.LastMeasRejectNb <= MAX_REJECTED_MEASUREMENTS)
 913  01f6 be00          	ldw	x,_pKeyStruct
 914  01f8 e607          	ld	a,(7,x)
 915  01fa a115          	cp	a,#21
 916  01fc 2426          	jruge	L152
 917                     ; 438     pKeyStruct->Channel.Reference += pKeyStruct->Channel.LastMeas;
 919  01fe be00          	ldw	x,_pKeyStruct
 920  0200 e609          	ld	a,(9,x)
 921  0202 eb06          	add	a,(6,x)
 922  0204 e709          	ld	(9,x),a
 923  0206 e608          	ld	a,(8,x)
 924  0208 e905          	adc	a,(5,x)
 925  020a e708          	ld	(8,x),a
 926                     ; 439     pKeyStruct->Counter--;
 928  020c be00          	ldw	x,_pKeyStruct
 929  020e 6a03          	dec	(3,x)
 930                     ; 440     if (!pKeyStruct->Counter)
 932  0210 be00          	ldw	x,_pKeyStruct
 933  0212 6d03          	tnz	(3,x)
 934  0214 260e          	jrne	L152
 935                     ; 443       pKeyStruct->Channel.Reference = (pKeyStruct->Channel.Reference >> 3);
 937  0216 be00          	ldw	x,_pKeyStruct
 938  0218 a603          	ld	a,#3
 939  021a               L64:
 940  021a 6408          	srl	(8,x)
 941  021c 6609          	rrc	(9,x)
 942  021e 4a            	dec	a
 943  021f 26f9          	jrne	L64
 944                     ; 444       TSL_SCKey_SetIdleState();
 946  0221 cd0000        	call	_TSL_SCKey_SetIdleState
 948  0224               L152:
 949                     ; 447 }
 952  0224 81            	ret
 978                     ; 460 void TSL_SCKey_CheckDisabled(void)
 978                     ; 461 {
 979                     	switch	.text
 980  0225               _TSL_SCKey_CheckDisabled:
 984                     ; 462   if (!pKeyStruct->Setting.b.ENABLED)
 986  0225 be00          	ldw	x,_pKeyStruct
 987  0227 e602          	ld	a,(2,x)
 988  0229 a502          	bcp	a,#2
 989  022b 2603          	jrne	L562
 990                     ; 464     TSL_SCKey_SetDisabledState();
 992  022d cd0000        	call	_TSL_SCKey_SetDisabledState
 994  0230               L562:
 995                     ; 466 }
 998  0230 81            	ret
1024                     ; 479 void TSL_SCKey_CheckEnabled(void)
1024                     ; 480 {
1025                     	switch	.text
1026  0231               _TSL_SCKey_CheckEnabled:
1030                     ; 481   if (pKeyStruct->Setting.b.ENABLED && pKeyStruct->Setting.b.IMPLEMENTED)
1032  0231 be00          	ldw	x,_pKeyStruct
1033  0233 e602          	ld	a,(2,x)
1034  0235 a502          	bcp	a,#2
1035  0237 270b          	jreq	L772
1037  0239 be00          	ldw	x,_pKeyStruct
1038  023b e602          	ld	a,(2,x)
1039  023d a501          	bcp	a,#1
1040  023f 2703          	jreq	L772
1041                     ; 483     TSL_SCKey_SetCalibrationState();
1043  0241 cd0000        	call	_TSL_SCKey_SetCalibrationState
1045  0244               L772:
1046                     ; 485 }
1049  0244 81            	ret
1074                     ; 498 u8 TSL_SCKey_CheckErrorCondition(void)
1074                     ; 499 {
1075                     	switch	.text
1076  0245               _TSL_SCKey_CheckErrorCondition:
1080                     ; 500   if ((pKeyStruct->Channel.LastMeas < SCKEY_MIN_ACQUISITION)
1080                     ; 501       || (pKeyStruct->Channel.LastMeas > SCKEY_MAX_ACQUISITION))
1082  0245 be00          	ldw	x,_pKeyStruct
1083  0247 9093          	ldw	y,x
1084  0249 90ee05        	ldw	y,(5,y)
1085  024c 90a30032      	cpw	y,#50
1086  0250 250d          	jrult	L313
1088  0252 be00          	ldw	x,_pKeyStruct
1089  0254 9093          	ldw	y,x
1090  0256 90ee05        	ldw	y,(5,y)
1091  0259 90a30bb9      	cpw	y,#3001
1092  025d 2503          	jrult	L113
1093  025f               L313:
1094                     ; 503     return 0xFF;  // Error case !
1096  025f a6ff          	ld	a,#255
1099  0261 81            	ret
1100  0262               L113:
1101                     ; 506   return 0;
1103  0262 4f            	clr	a
1106  0263 81            	ret
1119                     	xref	_TSL_SCKey_DetectionTimeout
1120                     	xref	_TSL_SCKey_DxS
1121                     	xref	_TSL_SCKey_SetDisabledState
1122                     	xref	_TSL_SCKey_SetErrorState
1123                     	xref	_TSL_SCKey_SetCalibrationState
1124                     	xref	_TSL_SCKey_SetPreRecalibrationState
1125                     	xref	_TSL_SCKey_BackToDetectedState
1126                     	xref	_TSL_SCKey_SetPostDetectState
1127                     	xref	_TSL_SCKey_SetDetectedState
1128                     	xref	_TSL_SCKey_SetPreDetectState
1129                     	xref	_TSL_SCKey_BackToIdleState
1130                     	xref	_TSL_SCKey_SetIdleState
1131                     	xref	_TSL_DeltaCalculation
1132                     	xref	_TSL_SetStructPointer
1133                     	xref.b	_TSL_TempGlobalState
1134                     	xref.b	_TSL_TempGlobalSetting
1135                     	xref.b	_Delta
1136                     	xref.b	_KeyIndex
1137                     	xref	_TSL_IO_Acquisition
1138                     	xref	_Table_SCKEY_BITS
1139                     	xref.b	_sTouchIO
1140                     	xref.b	_EndDetectionIntegrator
1141                     	xref.b	_DetectionIntegrator
1142                     	xref.b	_sSCKeyInfo
1143                     	xref.b	_pKeyStruct
1144                     	xdef	_TSL_SCKey_CheckErrorCondition
1145                     	xdef	_TSL_SCKey_CheckEnabled
1146                     	xdef	_TSL_SCKey_CheckDisabled
1147                     	xdef	_TSL_SCKey_CalibrationTreatment
1148                     	xdef	_TSL_SCKey_PreRecalibrationTreatment
1149                     	xdef	_TSL_SCKey_PostDetectTreatment
1150                     	xdef	_TSL_SCKey_DetectedTreatment
1151                     	xdef	_TSL_SCKey_PreDetectTreatment
1152                     	xdef	_TSL_SCKey_IdleTreatment
1153                     	xdef	_TSL_SCKey_Process
1154                     	xdef	_TSL_SCKEY_P1_Acquisition
1155                     	xdef	_TSL_SCKey_Init
1174                     	end
