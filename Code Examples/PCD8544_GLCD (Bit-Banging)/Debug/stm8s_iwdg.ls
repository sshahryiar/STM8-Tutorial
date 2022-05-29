   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  77                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  77                     ; 49 {
  78                     	switch	.text
  79  0000               f_IWDG_WriteAccessCmd:
  83                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  85                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  87  0000 c750e0        	ld	20704,a
  88                     ; 54 }
  91  0003 87            	retf
 180                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 180                     ; 64 {
 181                     	switch	.text
 182  0004               f_IWDG_SetPrescaler:
 186                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 188                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 190  0004 c750e1        	ld	20705,a
 191                     ; 69 }
 194  0007 87            	retf
 225                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 225                     ; 79 {
 226                     	switch	.text
 227  0008               f_IWDG_SetReload:
 231                     ; 80   IWDG->RLR = IWDG_Reload;
 233  0008 c750e2        	ld	20706,a
 234                     ; 81 }
 237  000b 87            	retf
 259                     ; 89 void IWDG_ReloadCounter(void)
 259                     ; 90 {
 260                     	switch	.text
 261  000c               f_IWDG_ReloadCounter:
 265                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 267  000c 35aa50e0      	mov	20704,#170
 268                     ; 92 }
 271  0010 87            	retf
 293                     ; 99 void IWDG_Enable(void)
 293                     ; 100 {
 294                     	switch	.text
 295  0011               f_IWDG_Enable:
 299                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 301  0011 35cc50e0      	mov	20704,#204
 302                     ; 102 }
 305  0015 87            	retf
 317                     	xdef	f_IWDG_Enable
 318                     	xdef	f_IWDG_ReloadCounter
 319                     	xdef	f_IWDG_SetReload
 320                     	xdef	f_IWDG_SetPrescaler
 321                     	xdef	f_IWDG_WriteAccessCmd
 340                     	end
