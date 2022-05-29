   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  62                     .const:	section	.text
  63  0000               L6:
  64  0000 0000ea60      	dc.l	60000
  65                     ; 9 void main(void)
  65                     ; 10 {
  66                     	scross	off
  67                     	switch	.text
  68  0000               _main:
  70  0000 89            	pushw	x
  71       00000002      OFST:	set	2
  74                     ; 11 	unsigned int t = 0;
  76                     ; 13 	clock_setup();
  78  0001 ad5c          	call	_clock_setup
  80                     ; 14 	GPIO_setup();
  82  0003 cd00cb        	call	_GPIO_setup
  84                     ; 16 	GPIO_WriteLow(GPIOD, GPIO_PIN_0);
  86  0006 4b01          	push	#1
  87  0008 ae500f        	ldw	x,#20495
  88  000b cd0000        	call	_GPIO_WriteLow
  90  000e 84            	pop	a
  91                     ; 17 	for(t = 0; t < 60000; t++);
  93  000f 5f            	clrw	x
  94  0010 1f01          	ldw	(OFST-1,sp),x
  96  0012               L72:
 100  0012 1e01          	ldw	x,(OFST-1,sp)
 101  0014 1c0001        	addw	x,#1
 102  0017 1f01          	ldw	(OFST-1,sp),x
 106  0019 9c            	rvf
 107  001a 1e01          	ldw	x,(OFST-1,sp)
 108  001c cd0000        	call	c_uitolx
 110  001f ae0000        	ldw	x,#L6
 111  0022 cd0000        	call	c_lcmp
 113  0025 2feb          	jrslt	L72
 114                     ; 19 	IWDG_setup();
 116  0027 cd00ee        	call	_IWDG_setup
 118  002a               L53:
 119                     ; 23 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 121  002a 4b01          	push	#1
 122  002c ae500f        	ldw	x,#20495
 123  002f cd0000        	call	_GPIO_WriteReverse
 125  0032 84            	pop	a
 126                     ; 24 		for(t = 0; t < 1000; t++)
 128  0033 5f            	clrw	x
 129  0034 1f01          	ldw	(OFST-1,sp),x
 131  0036               L14:
 132                     ; 26 			if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_7) == FALSE)
 134  0036 4b80          	push	#128
 135  0038 ae5005        	ldw	x,#20485
 136  003b cd0000        	call	_GPIO_ReadInputPin
 138  003e 5b01          	addw	sp,#1
 139  0040 4d            	tnz	a
 140  0041 260c          	jrne	L74
 141                     ; 28 				IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 143  0043 a655          	ld	a,#85
 144  0045 cd0000        	call	_IWDG_WriteAccessCmd
 146                     ; 29 				IWDG_ReloadCounter();
 148  0048 cd0000        	call	_IWDG_ReloadCounter
 150                     ; 30 				IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 152  004b 4f            	clr	a
 153  004c cd0000        	call	_IWDG_WriteAccessCmd
 155  004f               L74:
 156                     ; 24 		for(t = 0; t < 1000; t++)
 158  004f 1e01          	ldw	x,(OFST-1,sp)
 159  0051 1c0001        	addw	x,#1
 160  0054 1f01          	ldw	(OFST-1,sp),x
 164  0056 1e01          	ldw	x,(OFST-1,sp)
 165  0058 a303e8        	cpw	x,#1000
 166  005b 25d9          	jrult	L14
 168  005d 20cb          	jra	L53
 201                     ; 37 void clock_setup(void)
 201                     ; 38 {
 202                     	switch	.text
 203  005f               _clock_setup:
 207                     ; 39 	CLK_DeInit();
 209  005f cd0000        	call	_CLK_DeInit
 211                     ; 41 	CLK_HSECmd(DISABLE);
 213  0062 4f            	clr	a
 214  0063 cd0000        	call	_CLK_HSECmd
 216                     ; 42 	CLK_LSICmd(ENABLE);
 218  0066 a601          	ld	a,#1
 219  0068 cd0000        	call	_CLK_LSICmd
 222  006b               L36:
 223                     ; 43 	while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == FALSE);
 225  006b ae0110        	ldw	x,#272
 226  006e cd0000        	call	_CLK_GetFlagStatus
 228  0071 4d            	tnz	a
 229  0072 27f7          	jreq	L36
 230                     ; 44 	CLK_HSICmd(ENABLE);
 232  0074 a601          	ld	a,#1
 233  0076 cd0000        	call	_CLK_HSICmd
 236  0079               L17:
 237                     ; 45 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 239  0079 ae0102        	ldw	x,#258
 240  007c cd0000        	call	_CLK_GetFlagStatus
 242  007f 4d            	tnz	a
 243  0080 27f7          	jreq	L17
 244                     ; 47 	CLK_ClockSwitchCmd(ENABLE);
 246  0082 a601          	ld	a,#1
 247  0084 cd0000        	call	_CLK_ClockSwitchCmd
 249                     ; 48 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 251  0087 a618          	ld	a,#24
 252  0089 cd0000        	call	_CLK_HSIPrescalerConfig
 254                     ; 49 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV4);
 256  008c a682          	ld	a,#130
 257  008e cd0000        	call	_CLK_SYSCLKConfig
 259                     ; 51 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 259                     ; 52 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 261  0091 4b01          	push	#1
 262  0093 4b00          	push	#0
 263  0095 ae01e1        	ldw	x,#481
 264  0098 cd0000        	call	_CLK_ClockSwitchConfig
 266  009b 85            	popw	x
 267                     ; 54 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 269  009c ae0100        	ldw	x,#256
 270  009f cd0000        	call	_CLK_PeripheralClockConfig
 272                     ; 55 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 274  00a2 5f            	clrw	x
 275  00a3 cd0000        	call	_CLK_PeripheralClockConfig
 277                     ; 56 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 279  00a6 ae1300        	ldw	x,#4864
 280  00a9 cd0000        	call	_CLK_PeripheralClockConfig
 282                     ; 57 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 284  00ac ae1200        	ldw	x,#4608
 285  00af cd0000        	call	_CLK_PeripheralClockConfig
 287                     ; 58 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 289  00b2 ae0300        	ldw	x,#768
 290  00b5 cd0000        	call	_CLK_PeripheralClockConfig
 292                     ; 59 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 294  00b8 ae0700        	ldw	x,#1792
 295  00bb cd0000        	call	_CLK_PeripheralClockConfig
 297                     ; 60 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 299  00be ae0500        	ldw	x,#1280
 300  00c1 cd0000        	call	_CLK_PeripheralClockConfig
 302                     ; 61 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 304  00c4 ae0400        	ldw	x,#1024
 305  00c7 cd0000        	call	_CLK_PeripheralClockConfig
 307                     ; 62 }
 310  00ca 81            	ret
 335                     ; 65 void GPIO_setup(void)
 335                     ; 66 {
 336                     	switch	.text
 337  00cb               _GPIO_setup:
 341                     ; 67 	GPIO_DeInit(GPIOB);
 343  00cb ae5005        	ldw	x,#20485
 344  00ce cd0000        	call	_GPIO_DeInit
 346                     ; 68 	GPIO_DeInit(GPIOD);
 348  00d1 ae500f        	ldw	x,#20495
 349  00d4 cd0000        	call	_GPIO_DeInit
 351                     ; 70 	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);
 353  00d7 4b40          	push	#64
 354  00d9 4b80          	push	#128
 355  00db ae5005        	ldw	x,#20485
 356  00de cd0000        	call	_GPIO_Init
 358  00e1 85            	popw	x
 359                     ; 71 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 361  00e2 4be0          	push	#224
 362  00e4 4b01          	push	#1
 363  00e6 ae500f        	ldw	x,#20495
 364  00e9 cd0000        	call	_GPIO_Init
 366  00ec 85            	popw	x
 367                     ; 72 }
 370  00ed 81            	ret
 397                     ; 75 void IWDG_setup(void)
 397                     ; 76 {
 398                     	switch	.text
 399  00ee               _IWDG_setup:
 403                     ; 77 	IWDG_Enable();
 405  00ee cd0000        	call	_IWDG_Enable
 407                     ; 78 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 409  00f1 a655          	ld	a,#85
 410  00f3 cd0000        	call	_IWDG_WriteAccessCmd
 412                     ; 79 	IWDG_SetPrescaler(IWDG_Prescaler_128);
 414  00f6 a605          	ld	a,#5
 415  00f8 cd0000        	call	_IWDG_SetPrescaler
 417                     ; 80 	IWDG_SetReload(0x99);
 419  00fb a699          	ld	a,#153
 420  00fd cd0000        	call	_IWDG_SetReload
 422                     ; 81 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
 424  0100 4f            	clr	a
 425  0101 cd0000        	call	_IWDG_WriteAccessCmd
 427                     ; 82 }
 430  0104 81            	ret
 443                     	xdef	_main
 444                     	xdef	_IWDG_setup
 445                     	xdef	_GPIO_setup
 446                     	xdef	_clock_setup
 447                     	xref	_IWDG_Enable
 448                     	xref	_IWDG_ReloadCounter
 449                     	xref	_IWDG_SetReload
 450                     	xref	_IWDG_SetPrescaler
 451                     	xref	_IWDG_WriteAccessCmd
 452                     	xref	_GPIO_ReadInputPin
 453                     	xref	_GPIO_WriteReverse
 454                     	xref	_GPIO_WriteLow
 455                     	xref	_GPIO_Init
 456                     	xref	_GPIO_DeInit
 457                     	xref	_CLK_GetFlagStatus
 458                     	xref	_CLK_SYSCLKConfig
 459                     	xref	_CLK_HSIPrescalerConfig
 460                     	xref	_CLK_ClockSwitchConfig
 461                     	xref	_CLK_PeripheralClockConfig
 462                     	xref	_CLK_ClockSwitchCmd
 463                     	xref	_CLK_LSICmd
 464                     	xref	_CLK_HSICmd
 465                     	xref	_CLK_HSECmd
 466                     	xref	_CLK_DeInit
 485                     	xref	c_lcmp
 486                     	xref	c_uitolx
 487                     	end
