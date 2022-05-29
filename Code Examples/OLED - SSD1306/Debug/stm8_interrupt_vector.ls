   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  49                     ; 12 @far @interrupt void NonHandledInterrupt (void)
  49                     ; 13 {
  50                     	switch	.text
  51  0000               f_NonHandledInterrupt:
  55                     ; 17 	return;
  58  0000 80            	iret	
  60                     .const:	section	.text
  61  0000               __vectab:
  62  0000 82            	dc.b	130
  64  0001 00            	dc.b	page(__stext)
  65  0002 0000          	dc.w	__stext
  66  0004 82            	dc.b	130
  68  0005 00            	dc.b	page(f_NonHandledInterrupt)
  69  0006 0000          	dc.w	f_NonHandledInterrupt
  70  0008 82            	dc.b	130
  72  0009 00            	dc.b	page(f_NonHandledInterrupt)
  73  000a 0000          	dc.w	f_NonHandledInterrupt
  74  000c 82            	dc.b	130
  76  000d 00            	dc.b	page(f_NonHandledInterrupt)
  77  000e 0000          	dc.w	f_NonHandledInterrupt
  78  0010 82            	dc.b	130
  80  0011 00            	dc.b	page(f_NonHandledInterrupt)
  81  0012 0000          	dc.w	f_NonHandledInterrupt
  82  0014 82            	dc.b	130
  84  0015 00            	dc.b	page(f_NonHandledInterrupt)
  85  0016 0000          	dc.w	f_NonHandledInterrupt
  86  0018 82            	dc.b	130
  88  0019 00            	dc.b	page(f_NonHandledInterrupt)
  89  001a 0000          	dc.w	f_NonHandledInterrupt
  90  001c 82            	dc.b	130
  92  001d 00            	dc.b	page(f_NonHandledInterrupt)
  93  001e 0000          	dc.w	f_NonHandledInterrupt
  94  0020 82            	dc.b	130
  96  0021 00            	dc.b	page(f_NonHandledInterrupt)
  97  0022 0000          	dc.w	f_NonHandledInterrupt
  98  0024 82            	dc.b	130
 100  0025 00            	dc.b	page(f_NonHandledInterrupt)
 101  0026 0000          	dc.w	f_NonHandledInterrupt
 102  0028 82            	dc.b	130
 104  0029 00            	dc.b	page(f_NonHandledInterrupt)
 105  002a 0000          	dc.w	f_NonHandledInterrupt
 106  002c 82            	dc.b	130
 108  002d 00            	dc.b	page(f_NonHandledInterrupt)
 109  002e 0000          	dc.w	f_NonHandledInterrupt
 110  0030 82            	dc.b	130
 112  0031 00            	dc.b	page(f_NonHandledInterrupt)
 113  0032 0000          	dc.w	f_NonHandledInterrupt
 114  0034 82            	dc.b	130
 116  0035 00            	dc.b	page(f_NonHandledInterrupt)
 117  0036 0000          	dc.w	f_NonHandledInterrupt
 118  0038 82            	dc.b	130
 120  0039 00            	dc.b	page(f_NonHandledInterrupt)
 121  003a 0000          	dc.w	f_NonHandledInterrupt
 122  003c 82            	dc.b	130
 124  003d 00            	dc.b	page(f_NonHandledInterrupt)
 125  003e 0000          	dc.w	f_NonHandledInterrupt
 126  0040 82            	dc.b	130
 128  0041 00            	dc.b	page(f_NonHandledInterrupt)
 129  0042 0000          	dc.w	f_NonHandledInterrupt
 130  0044 82            	dc.b	130
 132  0045 00            	dc.b	page(f_NonHandledInterrupt)
 133  0046 0000          	dc.w	f_NonHandledInterrupt
 134  0048 82            	dc.b	130
 136  0049 00            	dc.b	page(f_NonHandledInterrupt)
 137  004a 0000          	dc.w	f_NonHandledInterrupt
 138  004c 82            	dc.b	130
 140  004d 00            	dc.b	page(f_NonHandledInterrupt)
 141  004e 0000          	dc.w	f_NonHandledInterrupt
 142  0050 82            	dc.b	130
 144  0051 00            	dc.b	page(f_NonHandledInterrupt)
 145  0052 0000          	dc.w	f_NonHandledInterrupt
 146  0054 82            	dc.b	130
 148  0055 00            	dc.b	page(f_NonHandledInterrupt)
 149  0056 0000          	dc.w	f_NonHandledInterrupt
 150  0058 82            	dc.b	130
 152  0059 00            	dc.b	page(f_NonHandledInterrupt)
 153  005a 0000          	dc.w	f_NonHandledInterrupt
 154  005c 82            	dc.b	130
 156  005d 00            	dc.b	page(f_NonHandledInterrupt)
 157  005e 0000          	dc.w	f_NonHandledInterrupt
 158  0060 82            	dc.b	130
 160  0061 00            	dc.b	page(f_NonHandledInterrupt)
 161  0062 0000          	dc.w	f_NonHandledInterrupt
 162  0064 82            	dc.b	130
 164  0065 00            	dc.b	page(f_NonHandledInterrupt)
 165  0066 0000          	dc.w	f_NonHandledInterrupt
 166  0068 82            	dc.b	130
 168  0069 00            	dc.b	page(f_NonHandledInterrupt)
 169  006a 0000          	dc.w	f_NonHandledInterrupt
 170  006c 82            	dc.b	130
 172  006d 00            	dc.b	page(f_NonHandledInterrupt)
 173  006e 0000          	dc.w	f_NonHandledInterrupt
 174  0070 82            	dc.b	130
 176  0071 00            	dc.b	page(f_NonHandledInterrupt)
 177  0072 0000          	dc.w	f_NonHandledInterrupt
 178  0074 82            	dc.b	130
 180  0075 00            	dc.b	page(f_NonHandledInterrupt)
 181  0076 0000          	dc.w	f_NonHandledInterrupt
 182  0078 82            	dc.b	130
 184  0079 00            	dc.b	page(f_NonHandledInterrupt)
 185  007a 0000          	dc.w	f_NonHandledInterrupt
 186  007c 82            	dc.b	130
 188  007d 00            	dc.b	page(f_NonHandledInterrupt)
 189  007e 0000          	dc.w	f_NonHandledInterrupt
 240                     	xdef	__vectab
 241                     	xref	__stext
 242                     	xdef	f_NonHandledInterrupt
 261                     	end
