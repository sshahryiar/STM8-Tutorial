   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  61                     ; 9 void main(void)
  61                     ; 10 {
  63                     	switch	.text
  64  0000               _main:
  66  0000 89            	pushw	x
  67       00000002      OFST:	set	2
  70                     ; 11 	signed int pwm_duty = 0x0000;
  72                     ; 13 	clock_setup();
  74  0001 ad55          	call	_clock_setup
  76                     ; 14 	GPIO_setup();
  78  0003 cd00ba        	call	_GPIO_setup
  80                     ; 15 	TIM2_setup();
  82  0006 cd00dd        	call	_TIM2_setup
  84  0009               L72:
  85                     ; 19 		for(pwm_duty = 0; pwm_duty < 1000; pwm_duty += 10)
  87  0009 5f            	clrw	x
  88  000a 1f01          	ldw	(OFST-1,sp),x
  90  000c               L33:
  91                     ; 21 			TIM2_SetCompare1(pwm_duty);
  93  000c 1e01          	ldw	x,(OFST-1,sp)
  94  000e cd0000        	call	_TIM2_SetCompare1
  96                     ; 22 			TIM2_SetCompare2(pwm_duty);
  98  0011 1e01          	ldw	x,(OFST-1,sp)
  99  0013 cd0000        	call	_TIM2_SetCompare2
 101                     ; 23 			TIM2_SetCompare3(pwm_duty);
 103  0016 1e01          	ldw	x,(OFST-1,sp)
 104  0018 cd0000        	call	_TIM2_SetCompare3
 106                     ; 24 			delay_ms(10);
 108  001b ae000a        	ldw	x,#10
 109  001e cd0000        	call	_delay_ms
 111                     ; 19 		for(pwm_duty = 0; pwm_duty < 1000; pwm_duty += 10)
 113  0021 1e01          	ldw	x,(OFST-1,sp)
 114  0023 1c000a        	addw	x,#10
 115  0026 1f01          	ldw	(OFST-1,sp),x
 119  0028 9c            	rvf
 120  0029 1e01          	ldw	x,(OFST-1,sp)
 121  002b a303e8        	cpw	x,#1000
 122  002e 2fdc          	jrslt	L33
 123                     ; 26 		for(pwm_duty = 1000; pwm_duty > 0; pwm_duty -= 10)
 125  0030 ae03e8        	ldw	x,#1000
 126  0033 1f01          	ldw	(OFST-1,sp),x
 128  0035               L14:
 129                     ; 28 			TIM2_SetCompare1(pwm_duty);
 131  0035 1e01          	ldw	x,(OFST-1,sp)
 132  0037 cd0000        	call	_TIM2_SetCompare1
 134                     ; 29 			TIM2_SetCompare2(pwm_duty);
 136  003a 1e01          	ldw	x,(OFST-1,sp)
 137  003c cd0000        	call	_TIM2_SetCompare2
 139                     ; 30 			TIM2_SetCompare3(pwm_duty);
 141  003f 1e01          	ldw	x,(OFST-1,sp)
 142  0041 cd0000        	call	_TIM2_SetCompare3
 144                     ; 31 			delay_ms(10);
 146  0044 ae000a        	ldw	x,#10
 147  0047 cd0000        	call	_delay_ms
 149                     ; 26 		for(pwm_duty = 1000; pwm_duty > 0; pwm_duty -= 10)
 151  004a 1e01          	ldw	x,(OFST-1,sp)
 152  004c 1d000a        	subw	x,#10
 153  004f 1f01          	ldw	(OFST-1,sp),x
 157  0051 9c            	rvf
 158  0052 1e01          	ldw	x,(OFST-1,sp)
 159  0054 2cdf          	jrsgt	L14
 161  0056 20b1          	jra	L72
 194                     ; 37 void clock_setup(void)
 194                     ; 38 {
 195                     	switch	.text
 196  0058               _clock_setup:
 200                     ; 39 	CLK_DeInit();
 202  0058 cd0000        	call	_CLK_DeInit
 204                     ; 41 	CLK_HSECmd(DISABLE);
 206  005b 4f            	clr	a
 207  005c cd0000        	call	_CLK_HSECmd
 209                     ; 42 	CLK_LSICmd(DISABLE);
 211  005f 4f            	clr	a
 212  0060 cd0000        	call	_CLK_LSICmd
 214                     ; 43 	CLK_HSICmd(ENABLE);
 216  0063 a601          	ld	a,#1
 217  0065 cd0000        	call	_CLK_HSICmd
 220  0068               L16:
 221                     ; 44 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 223  0068 ae0102        	ldw	x,#258
 224  006b cd0000        	call	_CLK_GetFlagStatus
 226  006e 4d            	tnz	a
 227  006f 27f7          	jreq	L16
 228                     ; 46 	CLK_ClockSwitchCmd(ENABLE);
 230  0071 a601          	ld	a,#1
 231  0073 cd0000        	call	_CLK_ClockSwitchCmd
 233                     ; 47 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 235  0076 a618          	ld	a,#24
 236  0078 cd0000        	call	_CLK_HSIPrescalerConfig
 238                     ; 48 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 240  007b a680          	ld	a,#128
 241  007d cd0000        	call	_CLK_SYSCLKConfig
 243                     ; 50 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, 
 243                     ; 51 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 245  0080 4b01          	push	#1
 246  0082 4b00          	push	#0
 247  0084 ae01e1        	ldw	x,#481
 248  0087 cd0000        	call	_CLK_ClockSwitchConfig
 250  008a 85            	popw	x
 251                     ; 53 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 253  008b ae0100        	ldw	x,#256
 254  008e cd0000        	call	_CLK_PeripheralClockConfig
 256                     ; 54 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 258  0091 5f            	clrw	x
 259  0092 cd0000        	call	_CLK_PeripheralClockConfig
 261                     ; 55 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 263  0095 ae1300        	ldw	x,#4864
 264  0098 cd0000        	call	_CLK_PeripheralClockConfig
 266                     ; 56 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 268  009b ae1200        	ldw	x,#4608
 269  009e cd0000        	call	_CLK_PeripheralClockConfig
 271                     ; 57 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 273  00a1 ae0300        	ldw	x,#768
 274  00a4 cd0000        	call	_CLK_PeripheralClockConfig
 276                     ; 58 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 278  00a7 ae0700        	ldw	x,#1792
 279  00aa cd0000        	call	_CLK_PeripheralClockConfig
 281                     ; 59 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 283  00ad ae0501        	ldw	x,#1281
 284  00b0 cd0000        	call	_CLK_PeripheralClockConfig
 286                     ; 60 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 288  00b3 ae0400        	ldw	x,#1024
 289  00b6 cd0000        	call	_CLK_PeripheralClockConfig
 291                     ; 61 }
 294  00b9 81            	ret
 319                     ; 64 void GPIO_setup(void)
 319                     ; 65 {
 320                     	switch	.text
 321  00ba               _GPIO_setup:
 325                     ; 66 	GPIO_DeInit(GPIOA);
 327  00ba ae5000        	ldw	x,#20480
 328  00bd cd0000        	call	_GPIO_DeInit
 330                     ; 67 	GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
 332  00c0 4bf0          	push	#240
 333  00c2 4b08          	push	#8
 334  00c4 ae5000        	ldw	x,#20480
 335  00c7 cd0000        	call	_GPIO_Init
 337  00ca 85            	popw	x
 338                     ; 69 	GPIO_DeInit(GPIOD);
 340  00cb ae500f        	ldw	x,#20495
 341  00ce cd0000        	call	_GPIO_DeInit
 343                     ; 70 	GPIO_Init(GPIOD, ((GPIO_Pin_TypeDef)GPIO_PIN_3 | GPIO_PIN_4), GPIO_MODE_OUT_PP_HIGH_FAST);
 345  00d1 4bf0          	push	#240
 346  00d3 4b18          	push	#24
 347  00d5 ae500f        	ldw	x,#20495
 348  00d8 cd0000        	call	_GPIO_Init
 350  00db 85            	popw	x
 351                     ; 71 }
 354  00dc 81            	ret
 383                     ; 74 void TIM2_setup(void)
 383                     ; 75 {
 384                     	switch	.text
 385  00dd               _TIM2_setup:
 389                     ; 76 	TIM2_DeInit();
 391  00dd cd0000        	call	_TIM2_DeInit
 393                     ; 77     TIM2_TimeBaseInit(TIM2_PRESCALER_32, 1000);
 395  00e0 ae03e8        	ldw	x,#1000
 396  00e3 89            	pushw	x
 397  00e4 a605          	ld	a,#5
 398  00e6 cd0000        	call	_TIM2_TimeBaseInit
 400  00e9 85            	popw	x
 401                     ; 78 	TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_HIGH);
 403  00ea 4b00          	push	#0
 404  00ec ae03e8        	ldw	x,#1000
 405  00ef 89            	pushw	x
 406  00f0 ae6011        	ldw	x,#24593
 407  00f3 cd0000        	call	_TIM2_OC1Init
 409  00f6 5b03          	addw	sp,#3
 410                     ; 79 	TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_LOW);
 412  00f8 4b22          	push	#34
 413  00fa ae03e8        	ldw	x,#1000
 414  00fd 89            	pushw	x
 415  00fe ae6011        	ldw	x,#24593
 416  0101 cd0000        	call	_TIM2_OC2Init
 418  0104 5b03          	addw	sp,#3
 419                     ; 80 	TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 1000, TIM2_OCPOLARITY_HIGH);
 421  0106 4b00          	push	#0
 422  0108 ae03e8        	ldw	x,#1000
 423  010b 89            	pushw	x
 424  010c ae6011        	ldw	x,#24593
 425  010f cd0000        	call	_TIM2_OC3Init
 427  0112 5b03          	addw	sp,#3
 428                     ; 81 	TIM2_Cmd(ENABLE);
 430  0114 a601          	ld	a,#1
 431  0116 cd0000        	call	_TIM2_Cmd
 433                     ; 82 }
 436  0119 81            	ret
 449                     	xdef	_main
 450                     	xdef	_TIM2_setup
 451                     	xdef	_GPIO_setup
 452                     	xdef	_clock_setup
 453                     	xref	_TIM2_SetCompare3
 454                     	xref	_TIM2_SetCompare2
 455                     	xref	_TIM2_SetCompare1
 456                     	xref	_TIM2_Cmd
 457                     	xref	_TIM2_OC3Init
 458                     	xref	_TIM2_OC2Init
 459                     	xref	_TIM2_OC1Init
 460                     	xref	_TIM2_TimeBaseInit
 461                     	xref	_TIM2_DeInit
 462                     	xref	_GPIO_Init
 463                     	xref	_GPIO_DeInit
 464                     	xref	_CLK_GetFlagStatus
 465                     	xref	_CLK_SYSCLKConfig
 466                     	xref	_CLK_HSIPrescalerConfig
 467                     	xref	_CLK_ClockSwitchConfig
 468                     	xref	_CLK_PeripheralClockConfig
 469                     	xref	_CLK_ClockSwitchCmd
 470                     	xref	_CLK_LSICmd
 471                     	xref	_CLK_HSICmd
 472                     	xref	_CLK_HSECmd
 473                     	xref	_CLK_DeInit
 474                     	xref	_delay_ms
 493                     	end
