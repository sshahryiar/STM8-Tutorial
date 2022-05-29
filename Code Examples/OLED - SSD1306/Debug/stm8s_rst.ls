   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
 121                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 121                     ; 55 {
 123                     	switch	.text
 124  0000               _RST_GetFlagStatus:
 128                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 130                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 132  0000 c450b3        	and	a,20659
 133  0003 2702          	jreq	L01
 134  0005 a601          	ld	a,#1
 135  0007               L01:
 138  0007 81            	ret	
 173                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 173                     ; 70 {
 174                     	switch	.text
 175  0008               _RST_ClearFlag:
 179                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 181                     ; 74   RST->SR = (uint8_t)RST_Flag;
 183  0008 c750b3        	ld	20659,a
 184                     ; 75 }
 187  000b 81            	ret	
 200                     	xdef	_RST_ClearFlag
 201                     	xdef	_RST_GetFlagStatus
 220                     	end
