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
 101  000c a60a          	ld	a,#10
 102  000e e70c          	ld	(12,x),a
 103                     ; 66     pKeyStruct->EndDetectThreshold = SCKEY_ENDDETECTTHRESHOLD_DEFAULT;
 105  0010 be00          	ldw	x,_pKeyStruct
 106  0012 a608          	ld	a,#8
 107  0014 e70d          	ld	(13,x),a
 108                     ; 67     pKeyStruct->RecalibrationThreshold = SCKEY_RECALIBRATIONTHRESHOLD_DEFAULT;
 110  0016 be00          	ldw	x,_pKeyStruct
 111  0018 a6f6          	ld	a,#246
 112  001a e70e          	ld	(14,x),a
 113                     ; 61   for (KeyIndex = 0; KeyIndex < NUMBER_OF_SINGLE_CHANNEL_KEYS; KeyIndex++)
 115  001c 3c00          	inc	_KeyIndex
 118  001e 3d00          	tnz	_KeyIndex
 119  0020 27e0          	jreq	L53
 120                     ; 69 }
 123  0022 81            	ret
 154                     ; 82 void TSL_SCKEY_P1_Acquisition(void)
 154                     ; 83 {
 155                     	switch	.text
 156  0023               _TSL_SCKEY_P1_Acquisition:
 160                     ; 84   sTouchIO.PORT_ADDR = (GPIO_TypeDef *)(SCKEY_P1_PORT_ADDR);
 162  0023 ae500a        	ldw	x,#20490
 163  0026 bf00          	ldw	_sTouchIO,x
 164                     ; 85   for (KeyIndex = 0; KeyIndex < SCKEY_P1_KEY_COUNT; KeyIndex++)
 166  0028 3f00          	clr	_KeyIndex
 167  002a               L35:
 168                     ; 87     TSL_SetStructPointer();
 170  002a cd0000        	call	_TSL_SetStructPointer
 172                     ; 88     if ((pKeyStruct->State.whole != ERROR_STATE) && (pKeyStruct->State.whole != DISABLED_STATE))
 174  002d 92c600        	ld	a,[_pKeyStruct.w]
 175  0030 a108          	cp	a,#8
 176  0032 273e          	jreq	L16
 178  0034 92c600        	ld	a,[_pKeyStruct.w]
 179  0037 a180          	cp	a,#128
 180  0039 2737          	jreq	L16
 181                     ; 90       sTouchIO.AcqMask = Table_SCKEY_BITS[KeyIndex];
 183  003b b600          	ld	a,_KeyIndex
 184  003d 5f            	clrw	x
 185  003e 97            	ld	xl,a
 186  003f d60000        	ld	a,(_Table_SCKEY_BITS,x)
 187  0042 b702          	ld	_sTouchIO+2,a
 188                     ; 91       sTouchIO.DriveMask = (u8)(sTouchIO.AcqMask | SCKEY_P1_DRIVEN_SHIELD_MASK);
 190  0044 b602          	ld	a,_sTouchIO+2
 191  0046 aa08          	or	a,#8
 192  0048 b703          	ld	_sTouchIO+3,a
 193                     ; 92       sTouchIO.Measurement = &sSCKeyInfo[KeyIndex].Channel.LastMeas;
 195  004a b600          	ld	a,_KeyIndex
 196  004c 97            	ld	xl,a
 197  004d a60f          	ld	a,#15
 198  004f 42            	mul	x,a
 199  0050 01            	rrwa	x,a
 200  0051 ab05          	add	a,#_sSCKeyInfo+5
 201  0053 2401          	jrnc	L01
 202  0055 5c            	incw	x
 203  0056               L01:
 204  0056 5f            	clrw	x
 205  0057 97            	ld	xl,a
 206  0058 bf04          	ldw	_sTouchIO+4,x
 207                     ; 93       sTouchIO.RejectedNb = &sSCKeyInfo[KeyIndex].Channel.LastMeasRejectNb;
 209  005a b600          	ld	a,_KeyIndex
 210  005c 97            	ld	xl,a
 211  005d a60f          	ld	a,#15
 212  005f 42            	mul	x,a
 213  0060 01            	rrwa	x,a
 214  0061 ab07          	add	a,#_sSCKeyInfo+7
 215  0063 2401          	jrnc	L21
 216  0065 5c            	incw	x
 217  0066               L21:
 218  0066 5f            	clrw	x
 219  0067 97            	ld	xl,a
 220  0068 bf06          	ldw	_sTouchIO+6,x
 221                     ; 94       sTouchIO.Type = SCKEY_TYPE;
 223  006a 3f08          	clr	_sTouchIO+8
 224                     ; 95       TSL_IO_Acquisition(SCKEY_ACQ_NUM, SCKEY_ADJUST_LEVEL);
 226  006c ae0301        	ldw	x,#769
 227  006f cd0000        	call	_TSL_IO_Acquisition
 229  0072               L16:
 230                     ; 85   for (KeyIndex = 0; KeyIndex < SCKEY_P1_KEY_COUNT; KeyIndex++)
 232  0072 3c00          	inc	_KeyIndex
 235  0074 3d00          	tnz	_KeyIndex
 236  0076 27b2          	jreq	L35
 237                     ; 98 }
 240  0078 81            	ret
 278                     ; 176 void TSL_SCKey_Process(void)
 278                     ; 177 {
 279                     	switch	.text
 280  0079               _TSL_SCKey_Process:
 284                     ; 178   TSL_SetStructPointer();
 286  0079 cd0000        	call	_TSL_SetStructPointer
 288                     ; 180   TSL_DeltaCalculation();
 290  007c cd0000        	call	_TSL_DeltaCalculation
 292                     ; 182   switch (pKeyStruct->State.whole)
 294  007f 92c600        	ld	a,[_pKeyStruct.w]
 296                     ; 233       break;
 297  0082 4a            	dec	a
 298  0083 2751          	jreq	L57
 299  0085 4a            	dec	a
 300  0086 271a          	jreq	L36
 301  0088 a002          	sub	a,#2
 302  008a 272d          	jreq	L76
 303  008c a004          	sub	a,#4
 304  008e 2759          	jreq	L77
 305  0090 a009          	sub	a,#9
 306  0092 273d          	jreq	L37
 307  0094 a003          	sub	a,#3
 308  0096 271c          	jreq	L56
 309  0098 a010          	sub	a,#16
 310  009a 2730          	jreq	L17
 311  009c a05c          	sub	a,#92
 312  009e 274e          	jreq	L101
 313  00a0               L721:
 315  00a0 20fe          	jra	L721
 316  00a2               L36:
 317                     ; 185     case IDLE_STATE:
 317                     ; 186       if (TSL_SCKey_CheckErrorCondition())
 319  00a2 cd0241        	call	_TSL_SCKey_CheckErrorCondition
 321  00a5 4d            	tnz	a
 322  00a6 2705          	jreq	L121
 323                     ; 188         TSL_SCKey_SetErrorState();
 325  00a8 cd0000        	call	_TSL_SCKey_SetErrorState
 327                     ; 189         break;
 329  00ab 2044          	jra	L711
 330  00ad               L121:
 331                     ; 191       TSL_SCKey_IdleTreatment();
 333  00ad ad5f          	call	_TSL_SCKey_IdleTreatment
 335                     ; 192       TSL_SCKey_CheckDisabled();
 337  00af cd0221        	call	_TSL_SCKey_CheckDisabled
 339                     ; 193       break;
 341  00b2 203d          	jra	L711
 342  00b4               L56:
 343                     ; 195     case PRE_DETECTED_STATE:
 343                     ; 196       TSL_SCKey_PreDetectTreatment();
 345  00b4 cd0147        	call	_TSL_SCKey_PreDetectTreatment
 347                     ; 197       break;
 349  00b7 2038          	jra	L711
 350  00b9               L76:
 351                     ; 199     case DETECTED_STATE:
 351                     ; 200       if (TSL_SCKey_CheckErrorCondition())
 353  00b9 cd0241        	call	_TSL_SCKey_CheckErrorCondition
 355  00bc 4d            	tnz	a
 356  00bd 2705          	jreq	L321
 357                     ; 202         TSL_SCKey_SetErrorState();
 359  00bf cd0000        	call	_TSL_SCKey_SetErrorState
 361                     ; 203         break;
 363  00c2 202d          	jra	L711
 364  00c4               L321:
 365                     ; 205       TSL_SCKey_DetectedTreatment();
 367  00c4 cd0175        	call	_TSL_SCKey_DetectedTreatment
 369                     ; 206       TSL_SCKey_CheckDisabled();
 371  00c7 cd0221        	call	_TSL_SCKey_CheckDisabled
 373                     ; 207       break;
 375  00ca 2025          	jra	L711
 376  00cc               L17:
 377                     ; 209     case POST_DETECTED_STATE:
 377                     ; 210       TSL_SCKey_PostDetectTreatment();
 379  00cc cd019e        	call	_TSL_SCKey_PostDetectTreatment
 381                     ; 211       break;
 383  00cf 2020          	jra	L711
 384  00d1               L37:
 385                     ; 213     case PRE_CALIBRATION_STATE:
 385                     ; 214       TSL_SCKey_PreRecalibrationTreatment();
 387  00d1 cd01c8        	call	_TSL_SCKey_PreRecalibrationTreatment
 389                     ; 215       break;
 391  00d4 201b          	jra	L711
 392  00d6               L57:
 393                     ; 217     case CALIBRATION_STATE:
 393                     ; 218       if (TSL_SCKey_CheckErrorCondition())
 395  00d6 cd0241        	call	_TSL_SCKey_CheckErrorCondition
 397  00d9 4d            	tnz	a
 398  00da 2705          	jreq	L521
 399                     ; 220         TSL_SCKey_SetErrorState();
 401  00dc cd0000        	call	_TSL_SCKey_SetErrorState
 403                     ; 221         break;
 405  00df 2010          	jra	L711
 406  00e1               L521:
 407                     ; 223       TSL_SCKey_CalibrationTreatment();
 409  00e1 cd01f2        	call	_TSL_SCKey_CalibrationTreatment
 411                     ; 224       TSL_SCKey_CheckDisabled();
 413  00e4 cd0221        	call	_TSL_SCKey_CheckDisabled
 415                     ; 225       break;
 417  00e7 2008          	jra	L711
 418  00e9               L77:
 419                     ; 227     case ERROR_STATE:
 419                     ; 228       TSL_SCKey_CheckDisabled();
 421  00e9 cd0221        	call	_TSL_SCKey_CheckDisabled
 423                     ; 229       break;
 425  00ec 2003          	jra	L711
 426  00ee               L101:
 427                     ; 231     case DISABLED_STATE:
 427                     ; 232       TSL_SCKey_CheckEnabled();
 429  00ee cd022d        	call	_TSL_SCKey_CheckEnabled
 431                     ; 233       break;
 433  00f1               L711:
 434                     ; 243   TSL_TempGlobalSetting.whole |= pKeyStruct->Setting.whole;
 436  00f1 be00          	ldw	x,_pKeyStruct
 437  00f3 ee01          	ldw	x,(1,x)
 438  00f5 01            	rrwa	x,a
 439  00f6 ba01          	or	a,_TSL_TempGlobalSetting+1
 440  00f8 01            	rrwa	x,a
 441  00f9 ba00          	or	a,_TSL_TempGlobalSetting
 442  00fb 01            	rrwa	x,a
 443  00fc bf00          	ldw	_TSL_TempGlobalSetting,x
 444                     ; 244   TSL_TempGlobalState.whole |= pKeyStruct->State.whole;
 446  00fe b600          	ld	a,_TSL_TempGlobalState
 447  0100 92ca00        	or	a,[_pKeyStruct.w]
 448  0103 b700          	ld	_TSL_TempGlobalState,a
 449                     ; 245   pKeyStruct->Setting.b.CHANGED = 0;
 451  0105 be00          	ldw	x,_pKeyStruct
 452  0107 e602          	ld	a,(2,x)
 453  0109 a4f7          	and	a,#247
 454  010b e702          	ld	(2,x),a
 455                     ; 246 }
 458  010d 81            	ret
 488                     ; 259 void TSL_SCKey_IdleTreatment(void)
 488                     ; 260 {
 489                     	switch	.text
 490  010e               _TSL_SCKey_IdleTreatment:
 494                     ; 262   if (pKeyStruct->Channel.LastMeasRejectNb > MAX_REJECTED_MEASUREMENTS)
 496  010e be00          	ldw	x,_pKeyStruct
 497  0110 e607          	ld	a,(7,x)
 498  0112 a106          	cp	a,#6
 499  0114 2501          	jrult	L341
 500                     ; 264     return;
 503  0116 81            	ret
 504  0117               L341:
 505                     ; 268   if (Delta <= pKeyStruct->RecalibrationThreshold)
 507  0117 9c            	rvf
 508  0118 be00          	ldw	x,_pKeyStruct
 509  011a e60e          	ld	a,(14,x)
 510  011c 5f            	clrw	x
 511  011d 4d            	tnz	a
 512  011e 2a01          	jrpl	L02
 513  0120 53            	cplw	x
 514  0121               L02:
 515  0121 97            	ld	xl,a
 516  0122 b300          	cpw	x,_Delta
 517  0124 2f04          	jrslt	L541
 518                     ; 270     TSL_SCKey_SetPreRecalibrationState();
 520  0126 cd0000        	call	_TSL_SCKey_SetPreRecalibrationState
 522                     ; 271     return;
 525  0129 81            	ret
 526  012a               L541:
 527                     ; 276   if (Delta >= pKeyStruct->DetectThreshold)
 529  012a 9c            	rvf
 530  012b be00          	ldw	x,_pKeyStruct
 531  012d e60c          	ld	a,(12,x)
 532  012f 5f            	clrw	x
 533  0130 4d            	tnz	a
 534  0131 2a01          	jrpl	L22
 535  0133 53            	cplw	x
 536  0134               L22:
 537  0134 97            	ld	xl,a
 538  0135 b300          	cpw	x,_Delta
 539  0137 2c0d          	jrsgt	L741
 540                     ; 281     TSL_SCKey_SetPreDetectState();
 542  0139 cd0000        	call	_TSL_SCKey_SetPreDetectState
 544                     ; 282     if (!DetectionIntegrator)
 546  013c 3d00          	tnz	_DetectionIntegrator
 547  013e 2606          	jrne	L741
 548                     ; 284       pKeyStruct->Channel.IntegratorCounter++;
 550  0140 be00          	ldw	x,_pKeyStruct
 551  0142 6c0a          	inc	(10,x)
 552                     ; 285       TSL_SCKey_PreDetectTreatment();
 554  0144 ad01          	call	_TSL_SCKey_PreDetectTreatment
 556  0146               L741:
 557                     ; 288 }
 560  0146 81            	ret
 589                     ; 301 void TSL_SCKey_PreDetectTreatment(void)
 589                     ; 302 {
 590                     	switch	.text
 591  0147               _TSL_SCKey_PreDetectTreatment:
 595                     ; 305   if ((pKeyStruct->Channel.LastMeasRejectNb <= MAX_REJECTED_MEASUREMENTS) &&
 595                     ; 306       (Delta >= pKeyStruct->DetectThreshold))
 597  0147 be00          	ldw	x,_pKeyStruct
 598  0149 e607          	ld	a,(7,x)
 599  014b a106          	cp	a,#6
 600  014d 2421          	jruge	L361
 602  014f 9c            	rvf
 603  0150 be00          	ldw	x,_pKeyStruct
 604  0152 e60c          	ld	a,(12,x)
 605  0154 5f            	clrw	x
 606  0155 4d            	tnz	a
 607  0156 2a01          	jrpl	L62
 608  0158 53            	cplw	x
 609  0159               L62:
 610  0159 97            	ld	xl,a
 611  015a b300          	cpw	x,_Delta
 612  015c 2c12          	jrsgt	L361
 613                     ; 312     TSL_SCKey_DxS();
 615  015e cd0000        	call	_TSL_SCKey_DxS
 617                     ; 313     pKeyStruct->Channel.IntegratorCounter--;
 619  0161 be00          	ldw	x,_pKeyStruct
 620  0163 6a0a          	dec	(10,x)
 621                     ; 314     if (!pKeyStruct->Channel.IntegratorCounter)
 623  0165 be00          	ldw	x,_pKeyStruct
 624  0167 6d0a          	tnz	(10,x)
 625  0169 2609          	jrne	L761
 626                     ; 316       TSL_SCKey_SetDetectedState();
 628  016b cd0000        	call	_TSL_SCKey_SetDetectedState
 630  016e 2004          	jra	L761
 631  0170               L361:
 632                     ; 321     TSL_SCKey_BackToIdleState();
 634  0170 cd0000        	call	_TSL_SCKey_BackToIdleState
 636                     ; 322     return;
 639  0173 81            	ret
 640  0174               L761:
 641                     ; 324 }
 644  0174 81            	ret
 674                     ; 337 void TSL_SCKey_DetectedTreatment(void)
 674                     ; 338 {
 675                     	switch	.text
 676  0175               _TSL_SCKey_DetectedTreatment:
 680                     ; 340   if ((pKeyStruct->Channel.LastMeasRejectNb <= MAX_REJECTED_MEASUREMENTS) &&
 680                     ; 341       (Delta <= pKeyStruct->EndDetectThreshold))
 682  0175 be00          	ldw	x,_pKeyStruct
 683  0177 e607          	ld	a,(7,x)
 684  0179 a106          	cp	a,#6
 685  017b 241d          	jruge	L102
 687  017d 9c            	rvf
 688  017e be00          	ldw	x,_pKeyStruct
 689  0180 e60d          	ld	a,(13,x)
 690  0182 5f            	clrw	x
 691  0183 4d            	tnz	a
 692  0184 2a01          	jrpl	L23
 693  0186 53            	cplw	x
 694  0187               L23:
 695  0187 97            	ld	xl,a
 696  0188 b300          	cpw	x,_Delta
 697  018a 2f0e          	jrslt	L102
 698                     ; 348     TSL_SCKey_SetPostDetectState();
 700  018c cd0000        	call	_TSL_SCKey_SetPostDetectState
 702                     ; 349     if (!EndDetectionIntegrator)
 704  018f 3d00          	tnz	_EndDetectionIntegrator
 705  0191 2606          	jrne	L302
 706                     ; 351       pKeyStruct->Channel.IntegratorCounter++;
 708  0193 be00          	ldw	x,_pKeyStruct
 709  0195 6c0a          	inc	(10,x)
 710                     ; 352       TSL_SCKey_PostDetectTreatment();
 712  0197 ad05          	call	_TSL_SCKey_PostDetectTreatment
 714  0199               L302:
 715                     ; 354     return;
 718  0199 81            	ret
 719  019a               L102:
 720                     ; 357   TSL_SCKey_DetectionTimeout();
 722  019a cd0000        	call	_TSL_SCKey_DetectionTimeout
 724                     ; 358 }
 727  019d 81            	ret
 755                     ; 371 void TSL_SCKey_PostDetectTreatment(void)
 755                     ; 372 {
 756                     	switch	.text
 757  019e               _TSL_SCKey_PostDetectTreatment:
 761                     ; 374   if ((pKeyStruct->Channel.LastMeasRejectNb <= MAX_REJECTED_MEASUREMENTS) &&
 761                     ; 375       (Delta <= pKeyStruct->EndDetectThreshold))
 763  019e be00          	ldw	x,_pKeyStruct
 764  01a0 e607          	ld	a,(7,x)
 765  01a2 a106          	cp	a,#6
 766  01a4 241e          	jruge	L512
 768  01a6 9c            	rvf
 769  01a7 be00          	ldw	x,_pKeyStruct
 770  01a9 e60d          	ld	a,(13,x)
 771  01ab 5f            	clrw	x
 772  01ac 4d            	tnz	a
 773  01ad 2a01          	jrpl	L63
 774  01af 53            	cplw	x
 775  01b0               L63:
 776  01b0 97            	ld	xl,a
 777  01b1 b300          	cpw	x,_Delta
 778  01b3 2f0f          	jrslt	L512
 779                     ; 382     pKeyStruct->Channel.IntegratorCounter--;
 781  01b5 be00          	ldw	x,_pKeyStruct
 782  01b7 6a0a          	dec	(10,x)
 783                     ; 383     if (!pKeyStruct->Channel.IntegratorCounter)
 785  01b9 be00          	ldw	x,_pKeyStruct
 786  01bb 6d0a          	tnz	(10,x)
 787  01bd 2608          	jrne	L122
 788                     ; 385       TSL_SCKey_SetIdleState();
 790  01bf cd0000        	call	_TSL_SCKey_SetIdleState
 792  01c2 2003          	jra	L122
 793  01c4               L512:
 794                     ; 391     TSL_SCKey_BackToDetectedState();
 796  01c4 cd0000        	call	_TSL_SCKey_BackToDetectedState
 798  01c7               L122:
 799                     ; 393 }
 802  01c7 81            	ret
 830                     ; 406 void TSL_SCKey_PreRecalibrationTreatment(void)
 830                     ; 407 {
 831                     	switch	.text
 832  01c8               _TSL_SCKey_PreRecalibrationTreatment:
 836                     ; 408   if ((pKeyStruct->Channel.LastMeasRejectNb <= MAX_REJECTED_MEASUREMENTS) &&
 836                     ; 409       (Delta <= pKeyStruct->RecalibrationThreshold))
 838  01c8 be00          	ldw	x,_pKeyStruct
 839  01ca e607          	ld	a,(7,x)
 840  01cc a106          	cp	a,#6
 841  01ce 241e          	jruge	L332
 843  01d0 9c            	rvf
 844  01d1 be00          	ldw	x,_pKeyStruct
 845  01d3 e60e          	ld	a,(14,x)
 846  01d5 5f            	clrw	x
 847  01d6 4d            	tnz	a
 848  01d7 2a01          	jrpl	L24
 849  01d9 53            	cplw	x
 850  01da               L24:
 851  01da 97            	ld	xl,a
 852  01db b300          	cpw	x,_Delta
 853  01dd 2f0f          	jrslt	L332
 854                     ; 411     pKeyStruct->Channel.IntegratorCounter--;
 856  01df be00          	ldw	x,_pKeyStruct
 857  01e1 6a0a          	dec	(10,x)
 858                     ; 412     if (!pKeyStruct->Channel.IntegratorCounter)
 860  01e3 be00          	ldw	x,_pKeyStruct
 861  01e5 6d0a          	tnz	(10,x)
 862  01e7 2608          	jrne	L732
 863                     ; 414       TSL_SCKey_SetCalibrationState();
 865  01e9 cd0000        	call	_TSL_SCKey_SetCalibrationState
 867  01ec 2003          	jra	L732
 868  01ee               L332:
 869                     ; 419     TSL_SCKey_BackToIdleState();
 871  01ee cd0000        	call	_TSL_SCKey_BackToIdleState
 873  01f1               L732:
 874                     ; 421 }
 877  01f1 81            	ret
 903                     ; 434 void TSL_SCKey_CalibrationTreatment(void)
 903                     ; 435 {
 904                     	switch	.text
 905  01f2               _TSL_SCKey_CalibrationTreatment:
 909                     ; 436   if (pKeyStruct->Channel.LastMeasRejectNb <= MAX_REJECTED_MEASUREMENTS)
 911  01f2 be00          	ldw	x,_pKeyStruct
 912  01f4 e607          	ld	a,(7,x)
 913  01f6 a106          	cp	a,#6
 914  01f8 2426          	jruge	L152
 915                     ; 438     pKeyStruct->Channel.Reference += pKeyStruct->Channel.LastMeas;
 917  01fa be00          	ldw	x,_pKeyStruct
 918  01fc e609          	ld	a,(9,x)
 919  01fe eb06          	add	a,(6,x)
 920  0200 e709          	ld	(9,x),a
 921  0202 e608          	ld	a,(8,x)
 922  0204 e905          	adc	a,(5,x)
 923  0206 e708          	ld	(8,x),a
 924                     ; 439     pKeyStruct->Counter--;
 926  0208 be00          	ldw	x,_pKeyStruct
 927  020a 6a03          	dec	(3,x)
 928                     ; 440     if (!pKeyStruct->Counter)
 930  020c be00          	ldw	x,_pKeyStruct
 931  020e 6d03          	tnz	(3,x)
 932  0210 260e          	jrne	L152
 933                     ; 443       pKeyStruct->Channel.Reference = (pKeyStruct->Channel.Reference >> 3);
 935  0212 be00          	ldw	x,_pKeyStruct
 936  0214 a603          	ld	a,#3
 937  0216               L64:
 938  0216 6408          	srl	(8,x)
 939  0218 6609          	rrc	(9,x)
 940  021a 4a            	dec	a
 941  021b 26f9          	jrne	L64
 942                     ; 444       TSL_SCKey_SetIdleState();
 944  021d cd0000        	call	_TSL_SCKey_SetIdleState
 946  0220               L152:
 947                     ; 447 }
 950  0220 81            	ret
 976                     ; 460 void TSL_SCKey_CheckDisabled(void)
 976                     ; 461 {
 977                     	switch	.text
 978  0221               _TSL_SCKey_CheckDisabled:
 982                     ; 462   if (!pKeyStruct->Setting.b.ENABLED)
 984  0221 be00          	ldw	x,_pKeyStruct
 985  0223 e602          	ld	a,(2,x)
 986  0225 a502          	bcp	a,#2
 987  0227 2603          	jrne	L562
 988                     ; 464     TSL_SCKey_SetDisabledState();
 990  0229 cd0000        	call	_TSL_SCKey_SetDisabledState
 992  022c               L562:
 993                     ; 466 }
 996  022c 81            	ret
1022                     ; 479 void TSL_SCKey_CheckEnabled(void)
1022                     ; 480 {
1023                     	switch	.text
1024  022d               _TSL_SCKey_CheckEnabled:
1028                     ; 481   if (pKeyStruct->Setting.b.ENABLED && pKeyStruct->Setting.b.IMPLEMENTED)
1030  022d be00          	ldw	x,_pKeyStruct
1031  022f e602          	ld	a,(2,x)
1032  0231 a502          	bcp	a,#2
1033  0233 270b          	jreq	L772
1035  0235 be00          	ldw	x,_pKeyStruct
1036  0237 e602          	ld	a,(2,x)
1037  0239 a501          	bcp	a,#1
1038  023b 2703          	jreq	L772
1039                     ; 483     TSL_SCKey_SetCalibrationState();
1041  023d cd0000        	call	_TSL_SCKey_SetCalibrationState
1043  0240               L772:
1044                     ; 485 }
1047  0240 81            	ret
1072                     ; 498 u8 TSL_SCKey_CheckErrorCondition(void)
1072                     ; 499 {
1073                     	switch	.text
1074  0241               _TSL_SCKey_CheckErrorCondition:
1078                     ; 500   if ((pKeyStruct->Channel.LastMeas < SCKEY_MIN_ACQUISITION)
1078                     ; 501       || (pKeyStruct->Channel.LastMeas > SCKEY_MAX_ACQUISITION))
1080  0241 be00          	ldw	x,_pKeyStruct
1081  0243 9093          	ldw	y,x
1082  0245 90ee05        	ldw	y,(5,y)
1083  0248 90a30032      	cpw	y,#50
1084  024c 250d          	jrult	L313
1086  024e be00          	ldw	x,_pKeyStruct
1087  0250 9093          	ldw	y,x
1088  0252 90ee05        	ldw	y,(5,y)
1089  0255 90a30bb9      	cpw	y,#3001
1090  0259 2503          	jrult	L113
1091  025b               L313:
1092                     ; 503     return 0xFF;  // Error case !
1094  025b a6ff          	ld	a,#255
1097  025d 81            	ret
1098  025e               L113:
1099                     ; 506   return 0;
1101  025e 4f            	clr	a
1104  025f 81            	ret
1117                     	xref	_TSL_SCKey_DetectionTimeout
1118                     	xref	_TSL_SCKey_DxS
1119                     	xref	_TSL_SCKey_SetDisabledState
1120                     	xref	_TSL_SCKey_SetErrorState
1121                     	xref	_TSL_SCKey_SetCalibrationState
1122                     	xref	_TSL_SCKey_SetPreRecalibrationState
1123                     	xref	_TSL_SCKey_BackToDetectedState
1124                     	xref	_TSL_SCKey_SetPostDetectState
1125                     	xref	_TSL_SCKey_SetDetectedState
1126                     	xref	_TSL_SCKey_SetPreDetectState
1127                     	xref	_TSL_SCKey_BackToIdleState
1128                     	xref	_TSL_SCKey_SetIdleState
1129                     	xref	_TSL_DeltaCalculation
1130                     	xref	_TSL_SetStructPointer
1131                     	xref.b	_TSL_TempGlobalState
1132                     	xref.b	_TSL_TempGlobalSetting
1133                     	xref.b	_Delta
1134                     	xref.b	_KeyIndex
1135                     	xref	_TSL_IO_Acquisition
1136                     	xref	_Table_SCKEY_BITS
1137                     	xref.b	_sTouchIO
1138                     	xref.b	_EndDetectionIntegrator
1139                     	xref.b	_DetectionIntegrator
1140                     	xref.b	_sSCKeyInfo
1141                     	xref.b	_pKeyStruct
1142                     	xdef	_TSL_SCKey_CheckErrorCondition
1143                     	xdef	_TSL_SCKey_CheckEnabled
1144                     	xdef	_TSL_SCKey_CheckDisabled
1145                     	xdef	_TSL_SCKey_CalibrationTreatment
1146                     	xdef	_TSL_SCKey_PreRecalibrationTreatment
1147                     	xdef	_TSL_SCKey_PostDetectTreatment
1148                     	xdef	_TSL_SCKey_DetectedTreatment
1149                     	xdef	_TSL_SCKey_PreDetectTreatment
1150                     	xdef	_TSL_SCKey_IdleTreatment
1151                     	xdef	_TSL_SCKey_Process
1152                     	xdef	_TSL_SCKEY_P1_Acquisition
1153                     	xdef	_TSL_SCKey_Init
1172                     	end
