   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  83                     ; 11 void main(void)
  83                     ; 12 {
  85                     	switch	.text
  86  0000               _main:
  88  0000 88            	push	a
  89       00000001      OFST:	set	1
  92                     ; 15 	setup_clock();
  94  0001 ad44          	call	_setup_clock
  96                     ; 16 	setup_GPIO();
  98  0003 cd00af        	call	_setup_GPIO
 100                     ; 17 	setup_capacitive_touch();
 102  0006 cd00c1        	call	_setup_capacitive_touch
 104  0009               L34:
 105                     ; 21 		TSL_Action();
 107  0009 cd0000        	call	_TSL_Action
 109                     ; 23 		if ((TSL_GlobalSetting.b.CHANGED) && (TSLState == TSL_IDLE_STATE)) 
 111  000c b601          	ld	a,_TSL_GlobalSetting+1
 112  000e a508          	bcp	a,#8
 113  0010 2716          	jreq	L74
 115  0012 b600          	ld	a,_TSLState
 116  0014 a101          	cp	a,#1
 117  0016 2610          	jrne	L74
 118                     ; 25 			TSL_GlobalSetting.b.CHANGED = 0;
 120  0018 72170001      	bres	_TSL_GlobalSetting+1,#3
 121                     ; 27 			if (sSCKeyInfo[0].Setting.b.DETECTED) 
 123  001c b602          	ld	a,_sSCKeyInfo+2
 124  001e a504          	bcp	a,#4
 125  0020 2706          	jreq	L74
 126                     ; 29 				state ^= 1;
 128  0022 7b01          	ld	a,(OFST+0,sp)
 129  0024 a801          	xor	a,	#1
 130  0026 6b01          	ld	(OFST+0,sp),a
 132  0028               L74:
 133                     ; 33 		switch(state)
 135  0028 7b01          	ld	a,(OFST+0,sp)
 136  002a a101          	cp	a,#1
 137  002c 2608          	jrne	L5
 140  002e               L3:
 141                     ; 37 				delay_ms(60);
 143  002e ae003c        	ldw	x,#60
 144  0031 cd0000        	call	_delay_ms
 146                     ; 38 				break;
 148  0034 2006          	jra	L55
 149  0036               L5:
 150                     ; 43 				delay_ms(120);
 152  0036 ae0078        	ldw	x,#120
 153  0039 cd0000        	call	_delay_ms
 155                     ; 44 				break;	
 156  003c               L55:
 157                     ; 48 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 159  003c 4b01          	push	#1
 160  003e ae500f        	ldw	x,#20495
 161  0041 cd0000        	call	_GPIO_WriteReverse
 163  0044 84            	pop	a
 165  0045 20c2          	jra	L34
 198                     ; 54 void setup_clock(void)
 198                     ; 55 {
 199                     	switch	.text
 200  0047               _setup_clock:
 204                     ; 56 	CLK_DeInit();
 206  0047 cd0000        	call	_CLK_DeInit
 208                     ; 58 	CLK_HSECmd(ENABLE);
 210  004a a601          	ld	a,#1
 211  004c cd0000        	call	_CLK_HSECmd
 213                     ; 59 	CLK_LSICmd(DISABLE);
 215  004f 4f            	clr	a
 216  0050 cd0000        	call	_CLK_LSICmd
 218                     ; 60 	CLK_HSICmd(ENABLE);
 220  0053 a601          	ld	a,#1
 221  0055 cd0000        	call	_CLK_HSICmd
 224  0058               L37:
 225                     ; 61 	while(CLK_GetFlagStatus(CLK_FLAG_HSERDY) == FALSE);
 227  0058 ae0202        	ldw	x,#514
 228  005b cd0000        	call	_CLK_GetFlagStatus
 230  005e 4d            	tnz	a
 231  005f 27f7          	jreq	L37
 232                     ; 63 	CLK_ClockSwitchCmd(ENABLE);
 234  0061 a601          	ld	a,#1
 235  0063 cd0000        	call	_CLK_ClockSwitchCmd
 237                     ; 64 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 239  0066 4f            	clr	a
 240  0067 cd0000        	call	_CLK_HSIPrescalerConfig
 242                     ; 65 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 244  006a a680          	ld	a,#128
 245  006c cd0000        	call	_CLK_SYSCLKConfig
 247                     ; 67 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 
 247                     ; 68 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 249  006f 4b01          	push	#1
 250  0071 4b00          	push	#0
 251  0073 ae01b4        	ldw	x,#436
 252  0076 cd0000        	call	_CLK_ClockSwitchConfig
 254  0079 85            	popw	x
 255                     ; 70 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 257  007a ae0100        	ldw	x,#256
 258  007d cd0000        	call	_CLK_PeripheralClockConfig
 260                     ; 71 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 262  0080 5f            	clrw	x
 263  0081 cd0000        	call	_CLK_PeripheralClockConfig
 265                     ; 72 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 267  0084 ae1300        	ldw	x,#4864
 268  0087 cd0000        	call	_CLK_PeripheralClockConfig
 270                     ; 73 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 272  008a ae1200        	ldw	x,#4608
 273  008d cd0000        	call	_CLK_PeripheralClockConfig
 275                     ; 74 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
 277  0090 ae0300        	ldw	x,#768
 278  0093 cd0000        	call	_CLK_PeripheralClockConfig
 280                     ; 75 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 282  0096 ae0700        	ldw	x,#1792
 283  0099 cd0000        	call	_CLK_PeripheralClockConfig
 285                     ; 76 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 287  009c ae0500        	ldw	x,#1280
 288  009f cd0000        	call	_CLK_PeripheralClockConfig
 290                     ; 77 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);
 292  00a2 ae0601        	ldw	x,#1537
 293  00a5 cd0000        	call	_CLK_PeripheralClockConfig
 295                     ; 78 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 297  00a8 ae0401        	ldw	x,#1025
 298  00ab cd0000        	call	_CLK_PeripheralClockConfig
 300                     ; 79 }
 303  00ae 81            	ret
 328                     ; 82 void setup_GPIO(void)
 328                     ; 83 {
 329                     	switch	.text
 330  00af               _setup_GPIO:
 334                     ; 84 	GPIO_DeInit(GPIOD);
 336  00af ae500f        	ldw	x,#20495
 337  00b2 cd0000        	call	_GPIO_DeInit
 339                     ; 85 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_SLOW);
 341  00b5 4bc0          	push	#192
 342  00b7 4b01          	push	#1
 343  00b9 ae500f        	ldw	x,#20495
 344  00bc cd0000        	call	_GPIO_Init
 346  00bf 85            	popw	x
 347                     ; 86 }
 350  00c0 81            	ret
 377                     ; 89 void setup_capacitive_touch(void)
 377                     ; 90 {
 378                     	switch	.text
 379  00c1               _setup_capacitive_touch:
 383                     ; 91 	TSL_Init();
 385  00c1 cd0000        	call	_TSL_Init
 387                     ; 93 	sSCKeyInfo[0].Setting.b.IMPLEMENTED = 1; 
 389  00c4 72100002      	bset	_sSCKeyInfo+2,#0
 390                     ; 94 	sSCKeyInfo[0].Setting.b.ENABLED = 1;  
 392  00c8 72120002      	bset	_sSCKeyInfo+2,#1
 393                     ; 96 	enableInterrupts();
 396  00cc 9a            rim
 398                     ; 97 }
 402  00cd 81            	ret
 415                     	xdef	_main
 416                     	xdef	_setup_capacitive_touch
 417                     	xdef	_setup_GPIO
 418                     	xdef	_setup_clock
 419                     	xref	_TSL_Action
 420                     	xref	_TSL_Init
 421                     	xref.b	_sSCKeyInfo
 422                     	xref.b	_TSL_GlobalSetting
 423                     	xref.b	_TSLState
 424                     	xref	_delay_ms
 425                     	xref	_GPIO_WriteReverse
 426                     	xref	_GPIO_Init
 427                     	xref	_GPIO_DeInit
 428                     	xref	_CLK_GetFlagStatus
 429                     	xref	_CLK_SYSCLKConfig
 430                     	xref	_CLK_HSIPrescalerConfig
 431                     	xref	_CLK_ClockSwitchConfig
 432                     	xref	_CLK_PeripheralClockConfig
 433                     	xref	_CLK_ClockSwitchCmd
 434                     	xref	_CLK_LSICmd
 435                     	xref	_CLK_HSICmd
 436                     	xref	_CLK_HSECmd
 437                     	xref	_CLK_DeInit
 456                     	end
