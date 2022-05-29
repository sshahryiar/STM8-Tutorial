   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  82                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  82                     ; 49 {
  84                     	switch	.text
  85  0000               _IWDG_WriteAccessCmd:
  89                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  91                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  93  0000 c750e0        	ld	20704,a
  94                     ; 54 }
  97  0003 81            	ret	
 187                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 187                     ; 64 {
 188                     	switch	.text
 189  0004               _IWDG_SetPrescaler:
 193                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 195                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 197  0004 c750e1        	ld	20705,a
 198                     ; 69 }
 201  0007 81            	ret	
 233                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 233                     ; 79 {
 234                     	switch	.text
 235  0008               _IWDG_SetReload:
 239                     ; 80   IWDG->RLR = IWDG_Reload;
 241  0008 c750e2        	ld	20706,a
 242                     ; 81 }
 245  000b 81            	ret	
 268                     ; 89 void IWDG_ReloadCounter(void)
 268                     ; 90 {
 269                     	switch	.text
 270  000c               _IWDG_ReloadCounter:
 274                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 276  000c 35aa50e0      	mov	20704,#170
 277                     ; 92 }
 280  0010 81            	ret	
 303                     ; 99 void IWDG_Enable(void)
 303                     ; 100 {
 304                     	switch	.text
 305  0011               _IWDG_Enable:
 309                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 311  0011 35cc50e0      	mov	20704,#204
 312                     ; 102 }
 315  0015 81            	ret	
 328                     	xdef	_IWDG_Enable
 329                     	xdef	_IWDG_ReloadCounter
 330                     	xdef	_IWDG_SetReload
 331                     	xdef	_IWDG_SetPrescaler
 332                     	xdef	_IWDG_WriteAccessCmd
 351                     	end
