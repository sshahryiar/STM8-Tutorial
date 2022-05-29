   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  63                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  63                     ; 54 {
  65                     	switch	.text
  66  0000               _WWDG_Init:
  68  0000 89            	pushw	x
  69       00000000      OFST:	set	0
  72                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  74                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  76  0001 357f50d2      	mov	20690,#127
  77                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  79  0005 9e            	ld	a,xh
  80  0006 aac0          	or	a,#192
  81  0008 c750d1        	ld	20689,a
  82                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  84  000b 7b02          	ld	a,(OFST+2,sp)
  85  000d a47f          	and	a,#127
  86  000f aa40          	or	a,#64
  87  0011 c750d2        	ld	20690,a
  88                     ; 61 }
  91  0014 85            	popw	x
  92  0015 81            	ret	
 124                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 124                     ; 70 {
 125                     	switch	.text
 126  0016               _WWDG_SetCounter:
 130                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 132                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 134  0016 a47f          	and	a,#127
 135  0018 c750d1        	ld	20689,a
 136                     ; 77 }
 139  001b 81            	ret	
 162                     ; 86 uint8_t WWDG_GetCounter(void)
 162                     ; 87 {
 163                     	switch	.text
 164  001c               _WWDG_GetCounter:
 168                     ; 88   return(WWDG->CR);
 170  001c c650d1        	ld	a,20689
 173  001f 81            	ret	
 196                     ; 96 void WWDG_SWReset(void)
 196                     ; 97 {
 197                     	switch	.text
 198  0020               _WWDG_SWReset:
 202                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 204  0020 358050d1      	mov	20689,#128
 205                     ; 99 }
 208  0024 81            	ret	
 241                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 241                     ; 109 {
 242                     	switch	.text
 243  0025               _WWDG_SetWindowValue:
 247                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 249                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 251  0025 a47f          	and	a,#127
 252  0027 aa40          	or	a,#64
 253  0029 c750d2        	ld	20690,a
 254                     ; 114 }
 257  002c 81            	ret	
 270                     	xdef	_WWDG_SetWindowValue
 271                     	xdef	_WWDG_SWReset
 272                     	xdef	_WWDG_GetCounter
 273                     	xdef	_WWDG_SetCounter
 274                     	xdef	_WWDG_Init
 293                     	end
