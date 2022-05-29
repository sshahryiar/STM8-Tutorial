   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  92                     ; 149 void TSL_Init(void)
  92                     ; 150 {
  94                     	switch	.text
  95  0000               _TSL_Init:
  99                     ; 152   disableInterrupts();
 102  0000 9b            sim
 104                     ; 154   DetectionIntegrator = DETECTION_INTEGRATOR_DEFAULT;
 107  0001 35020012      	mov	_DetectionIntegrator,#2
 108                     ; 155   EndDetectionIntegrator = END_DETECTION_INTEGRATOR_DEFAULT;
 110  0005 35020011      	mov	_EndDetectionIntegrator,#2
 111                     ; 156   ECSTimeStep = ECS_TIME_STEP_DEFAULT;
 113  0009 3514000f      	mov	_ECSTimeStep,#20
 114                     ; 157   ECSTemporization = ECS_TEMPO_DEFAULT;
 116  000d 3514000e      	mov	_ECSTemporization,#20
 117                     ; 158   RecalibrationIntegrator = RECALIBRATION_INTEGRATOR_DEFAULT;
 119  0011 350a0010      	mov	_RecalibrationIntegrator,#10
 120                     ; 159   DetectionTimeout = DTO_DEFAULT;
 122  0015 3f13          	clr	_DetectionTimeout
 123                     ; 161   ECS_K_Fast = ECS_IIR_KFAST_DEFAULT;
 125  0017 3514000d      	mov	_ECS_K_Fast,#20
 126                     ; 162   ECS_K_Slow = ECS_IIR_KSLOW_DEFAULT;
 128  001b 350a000c      	mov	_ECS_K_Slow,#10
 129                     ; 163   ECSTimeStepCounter = ECSTimeStep;
 131  001f 35140002      	mov	_ECSTimeStepCounter,#20
 132                     ; 164   ECSTempoCounter = 0;
 134  0023 3f01          	clr	_ECSTempoCounter
 135                     ; 165   ECSTempoPrescaler = 0;
 137  0025 3f00          	clr	_ECSTempoPrescaler
 138                     ; 167   TSL_IO_Init();
 140  0027 cd0000        	call	_TSL_IO_Init
 142                     ; 170   TSL_Timer_Init();
 144  002a cd0000        	call	_TSL_Timer_Init
 146                     ; 174   TSL_SCKey_Init();
 148  002d cd0000        	call	_TSL_SCKey_Init
 150                     ; 180   enableInterrupts();
 153  0030 9a            rim
 155                     ; 182   TSLState = TSL_IDLE_STATE;
 158  0031 35010028      	mov	_TSLState,#1
 159                     ; 184 }
 162  0035 81            	ret
 198                     ; 197 void TSL_Action(void)
 198                     ; 198 {
 199                     	switch	.text
 200  0036               _TSL_Action:
 204                     ; 200   switch (TSLState)
 206  0036 b628          	ld	a,_TSLState
 208                     ; 330       break;
 209  0038 4a            	dec	a
 210  0039 270c          	jreq	L53
 211  003b 4a            	dec	a
 212  003c 271e          	jreq	L73
 213  003e 4a            	dec	a
 214  003f 2724          	jreq	L14
 215  0041 a008          	sub	a,#8
 216  0043 2731          	jreq	L34
 217  0045               L17:
 219  0045 20fe          	jra	L17
 220  0047               L53:
 221                     ; 204       disableInterrupts();
 224  0047 9b            sim
 226                     ; 205       Local_TickFlag.b.DTO_1sec = TSL_Tick_Flags.b.DTO_1sec;
 229                     	btst		_TSL_Tick_Flags,#0
 230  004d 90110003      	bccm	_Local_TickFlag,#0
 231                     ; 206       TSL_Tick_Flags.b.DTO_1sec = 0;
 233  0051 72110000      	bres	_TSL_Tick_Flags,#0
 234                     ; 207       enableInterrupts();
 237  0055 9a            rim
 239                     ; 209       TSLState = TSL_SCKEY_P1_ACQ_STATE;
 242  0056 35020028      	mov	_TSLState,#2
 243                     ; 210       break;
 245  005a 202d          	jra	L16
 246  005c               L73:
 247                     ; 212     case TSL_SCKEY_P1_ACQ_STATE:
 247                     ; 213       TSL_SCKEY_P1_Acquisition();
 249  005c cd0000        	call	_TSL_SCKEY_P1_Acquisition
 251                     ; 216       TSLState = TSL_SCKEY_P1_PROC_STATE;
 253  005f 35030028      	mov	_TSLState,#3
 254                     ; 217       break;
 256  0063 2024          	jra	L16
 257  0065               L14:
 258                     ; 219     case TSL_SCKEY_P1_PROC_STATE:
 258                     ; 220       for (KeyIndex = 0; KeyIndex < SCKEY_P1_KEY_COUNT; KeyIndex++)
 260  0065 3f0a          	clr	_KeyIndex
 261  0067               L36:
 262                     ; 222         TSL_SCKey_Process();
 264  0067 cd0000        	call	_TSL_SCKey_Process
 266                     ; 220       for (KeyIndex = 0; KeyIndex < SCKEY_P1_KEY_COUNT; KeyIndex++)
 268  006a 3c0a          	inc	_KeyIndex
 271  006c 3d0a          	tnz	_KeyIndex
 272  006e 27f7          	jreq	L36
 273                     ; 234       TSLState = TSL_ECS_STATE;
 275  0070 350b0028      	mov	_TSLState,#11
 276                     ; 237       break;
 278  0074 2013          	jra	L16
 279  0076               L34:
 280                     ; 323     case TSL_ECS_STATE:
 280                     ; 324       TSL_ECS();
 282  0076 cd0000        	call	_TSL_ECS
 284                     ; 325       TSL_GlobalSetting.whole = TSL_TempGlobalSetting.whole;
 286  0079 be06          	ldw	x,_TSL_TempGlobalSetting
 287  007b bf26          	ldw	_TSL_GlobalSetting,x
 288                     ; 326       TSL_TempGlobalSetting.whole = 0;
 290  007d 5f            	clrw	x
 291  007e bf06          	ldw	_TSL_TempGlobalSetting,x
 292                     ; 327       TSL_GlobalState.whole = TSL_TempGlobalState.whole;
 294  0080 450525        	mov	_TSL_GlobalState,_TSL_TempGlobalState
 295                     ; 328       TSL_TempGlobalState.whole = 0;
 297  0083 3f05          	clr	_TSL_TempGlobalState
 298                     ; 329       TSLState = TSL_IDLE_STATE;
 300  0085 35010028      	mov	_TSLState,#1
 301                     ; 330       break;
 303  0089               L16:
 304                     ; 338 }
 307  0089 81            	ret
1217                     	xref	_TSL_ECS
1218                     	switch	.ubsct
1219  0000               _ECSTempoPrescaler:
1220  0000 00            	ds.b	1
1221                     	xdef	_ECSTempoPrescaler
1222  0001               _ECSTempoCounter:
1223  0001 00            	ds.b	1
1224                     	xdef	_ECSTempoCounter
1225  0002               _ECSTimeStepCounter:
1226  0002 00            	ds.b	1
1227                     	xdef	_ECSTimeStepCounter
1228  0003               _Local_TickFlag:
1229  0003 00            	ds.b	1
1230                     	xdef	_Local_TickFlag
1231  0004               _Local_TickECS10ms:
1232  0004 00            	ds.b	1
1233                     	xdef	_Local_TickECS10ms
1234  0005               _TSL_TempGlobalState:
1235  0005 00            	ds.b	1
1236                     	xdef	_TSL_TempGlobalState
1237  0006               _TSL_TempGlobalSetting:
1238  0006 0000          	ds.b	2
1239                     	xdef	_TSL_TempGlobalSetting
1240  0008               _Delta:
1241  0008 0000          	ds.b	2
1242                     	xdef	_Delta
1243  000a               _KeyIndex:
1244  000a 00            	ds.b	1
1245                     	xdef	_KeyIndex
1246                     	xref	_TSL_IO_Init
1247                     	xref	_TSL_SCKey_Process
1248                     	xref	_TSL_SCKEY_P1_Acquisition
1249                     	xref	_TSL_SCKey_Init
1250                     	xdef	_TSL_Action
1251                     	xdef	_TSL_Init
1252  000b               _IT_Sync_Flags:
1253  000b 00            	ds.b	1
1254                     	xdef	_IT_Sync_Flags
1255  000c               _ECS_K_Slow:
1256  000c 00            	ds.b	1
1257                     	xdef	_ECS_K_Slow
1258  000d               _ECS_K_Fast:
1259  000d 00            	ds.b	1
1260                     	xdef	_ECS_K_Fast
1261  000e               _ECSTemporization:
1262  000e 00            	ds.b	1
1263                     	xdef	_ECSTemporization
1264  000f               _ECSTimeStep:
1265  000f 00            	ds.b	1
1266                     	xdef	_ECSTimeStep
1267  0010               _RecalibrationIntegrator:
1268  0010 00            	ds.b	1
1269                     	xdef	_RecalibrationIntegrator
1270  0011               _EndDetectionIntegrator:
1271  0011 00            	ds.b	1
1272                     	xdef	_EndDetectionIntegrator
1273  0012               _DetectionIntegrator:
1274  0012 00            	ds.b	1
1275                     	xdef	_DetectionIntegrator
1276  0013               _DetectionTimeout:
1277  0013 00            	ds.b	1
1278                     	xdef	_DetectionTimeout
1279  0014               _sSCKeyInfo:
1280  0014 000000000000  	ds.b	15
1281                     	xdef	_sSCKeyInfo
1282  0023               _pKeyStruct:
1283  0023 0000          	ds.b	2
1284                     	xdef	_pKeyStruct
1285  0025               _TSL_GlobalState:
1286  0025 00            	ds.b	1
1287                     	xdef	_TSL_GlobalState
1288  0026               _TSL_GlobalSetting:
1289  0026 0000          	ds.b	2
1290                     	xdef	_TSL_GlobalSetting
1291  0028               _TSLState:
1292  0028 00            	ds.b	1
1293                     	xdef	_TSLState
1294                     	xref	_TSL_Timer_Init
1295                     	xref.b	_TSL_Tick_Flags
1315                     	end
