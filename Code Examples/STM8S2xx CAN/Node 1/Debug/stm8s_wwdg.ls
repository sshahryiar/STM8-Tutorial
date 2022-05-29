   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  58                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  58                     ; 54 {
  60                     	switch	.text
  61  0000               _WWDG_Init:
  63  0000 89            	pushw	x
  64       00000000      OFST:	set	0
  67                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  69                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  71  0001 357f50d2      	mov	20690,#127
  72                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  74  0005 9e            	ld	a,xh
  75  0006 aac0          	or	a,#192
  76  0008 c750d1        	ld	20689,a
  77                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  79  000b 7b02          	ld	a,(OFST+2,sp)
  80  000d aa40          	or	a,#64
  81  000f a47f          	and	a,#127
  82  0011 c750d2        	ld	20690,a
  83                     ; 61 }
  86  0014 85            	popw	x
  87  0015 81            	ret
 119                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 119                     ; 70 {
 120                     	switch	.text
 121  0016               _WWDG_SetCounter:
 125                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 127                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 129  0016 a47f          	and	a,#127
 130  0018 c750d1        	ld	20689,a
 131                     ; 77 }
 134  001b 81            	ret
 157                     ; 86 uint8_t WWDG_GetCounter(void)
 157                     ; 87 {
 158                     	switch	.text
 159  001c               _WWDG_GetCounter:
 163                     ; 88   return(WWDG->CR);
 165  001c c650d1        	ld	a,20689
 168  001f 81            	ret
 191                     ; 96 void WWDG_SWReset(void)
 191                     ; 97 {
 192                     	switch	.text
 193  0020               _WWDG_SWReset:
 197                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 199  0020 358050d1      	mov	20689,#128
 200                     ; 99 }
 203  0024 81            	ret
 236                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 236                     ; 109 {
 237                     	switch	.text
 238  0025               _WWDG_SetWindowValue:
 242                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 244                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 246  0025 aa40          	or	a,#64
 247  0027 a47f          	and	a,#127
 248  0029 c750d2        	ld	20690,a
 249                     ; 114 }
 252  002c 81            	ret
 265                     	xdef	_WWDG_SetWindowValue
 266                     	xdef	_WWDG_SWReset
 267                     	xdef	_WWDG_GetCounter
 268                     	xdef	_WWDG_SetCounter
 269                     	xdef	_WWDG_Init
 288                     	end
