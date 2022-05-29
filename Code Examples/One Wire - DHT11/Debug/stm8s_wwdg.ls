   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  62                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  62                     ; 54 {
  64                     	switch	.text
  65  0000               _WWDG_Init:
  67  0000 89            	pushw	x
  68       00000000      OFST:	set	0
  71                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  73                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  75  0001 357f50d2      	mov	20690,#127
  76                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  78  0005 9e            	ld	a,xh
  79  0006 aac0          	or	a,#192
  80  0008 c750d1        	ld	20689,a
  81                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  83  000b 7b02          	ld	a,(OFST+2,sp)
  84  000d aa40          	or	a,#64
  85  000f a47f          	and	a,#127
  86  0011 c750d2        	ld	20690,a
  87                     ; 61 }
  90  0014 85            	popw	x
  91  0015 81            	ret
 125                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 125                     ; 70 {
 126                     	switch	.text
 127  0016               _WWDG_SetCounter:
 131                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 133                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 135  0016 a47f          	and	a,#127
 136  0018 c750d1        	ld	20689,a
 137                     ; 77 }
 140  001b 81            	ret
 163                     ; 86 uint8_t WWDG_GetCounter(void)
 163                     ; 87 {
 164                     	switch	.text
 165  001c               _WWDG_GetCounter:
 169                     ; 88   return(WWDG->CR);
 171  001c c650d1        	ld	a,20689
 174  001f 81            	ret
 197                     ; 96 void WWDG_SWReset(void)
 197                     ; 97 {
 198                     	switch	.text
 199  0020               _WWDG_SWReset:
 203                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 205  0020 358050d1      	mov	20689,#128
 206                     ; 99 }
 209  0024 81            	ret
 244                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 244                     ; 109 {
 245                     	switch	.text
 246  0025               _WWDG_SetWindowValue:
 250                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 252                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 254  0025 aa40          	or	a,#64
 255  0027 a47f          	and	a,#127
 256  0029 c750d2        	ld	20690,a
 257                     ; 114 }
 260  002c 81            	ret
 273                     	xdef	_WWDG_SetWindowValue
 274                     	xdef	_WWDG_SWReset
 275                     	xdef	_WWDG_GetCounter
 276                     	xdef	_WWDG_SetCounter
 277                     	xdef	_WWDG_Init
 296                     	end
