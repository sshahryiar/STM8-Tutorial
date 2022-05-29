   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  58                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  58                     ; 54 {
  59                     	switch	.text
  60  0000               f_WWDG_Init:
  62  0000 89            	pushw	x
  63       00000000      OFST:	set	0
  66                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  68                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  70  0001 357f50d2      	mov	20690,#127
  71                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  73  0005 9e            	ld	a,xh
  74  0006 aac0          	or	a,#192
  75  0008 c750d1        	ld	20689,a
  76                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  78  000b 7b02          	ld	a,(OFST+2,sp)
  79  000d aa40          	or	a,#64
  80  000f a47f          	and	a,#127
  81  0011 c750d2        	ld	20690,a
  82                     ; 61 }
  85  0014 85            	popw	x
  86  0015 87            	retf
 117                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 117                     ; 70 {
 118                     	switch	.text
 119  0016               f_WWDG_SetCounter:
 123                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 125                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 127  0016 a47f          	and	a,#127
 128  0018 c750d1        	ld	20689,a
 129                     ; 77 }
 132  001b 87            	retf
 154                     ; 86 uint8_t WWDG_GetCounter(void)
 154                     ; 87 {
 155                     	switch	.text
 156  001c               f_WWDG_GetCounter:
 160                     ; 88   return(WWDG->CR);
 162  001c c650d1        	ld	a,20689
 165  001f 87            	retf
 187                     ; 96 void WWDG_SWReset(void)
 187                     ; 97 {
 188                     	switch	.text
 189  0020               f_WWDG_SWReset:
 193                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 195  0020 358050d1      	mov	20689,#128
 196                     ; 99 }
 199  0024 87            	retf
 231                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 231                     ; 109 {
 232                     	switch	.text
 233  0025               f_WWDG_SetWindowValue:
 237                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 239                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 241  0025 aa40          	or	a,#64
 242  0027 a47f          	and	a,#127
 243  0029 c750d2        	ld	20690,a
 244                     ; 114 }
 247  002c 87            	retf
 259                     	xdef	f_WWDG_SetWindowValue
 260                     	xdef	f_WWDG_SWReset
 261                     	xdef	f_WWDG_GetCounter
 262                     	xdef	f_WWDG_SetCounter
 263                     	xdef	f_WWDG_Init
 282                     	end
