   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     .const:	section	.text
  15  0000               __vectab:
  16  0000 82            	dc.b	130
  18  0001 00            	dc.b	page(__stext)
  19  0002 0000          	dc.w	__stext
  20  0004 82            	dc.b	130
  22  0005 00            	dc.b	page(f_NonHandledInterrupt)
  23  0006 0000          	dc.w	f_NonHandledInterrupt
  24  0008 82            	dc.b	130
  26  0009 00            	dc.b	page(f_NonHandledInterrupt)
  27  000a 0000          	dc.w	f_NonHandledInterrupt
  28  000c 82            	dc.b	130
  30  000d 00            	dc.b	page(f_AWU_trigger_IRQHandler)
  31  000e 0000          	dc.w	f_AWU_trigger_IRQHandler
  32  0010 82            	dc.b	130
  34  0011 00            	dc.b	page(f_NonHandledInterrupt)
  35  0012 0000          	dc.w	f_NonHandledInterrupt
  36  0014 82            	dc.b	130
  38  0015 00            	dc.b	page(f_NonHandledInterrupt)
  39  0016 0000          	dc.w	f_NonHandledInterrupt
  40  0018 82            	dc.b	130
  42  0019 00            	dc.b	page(f_NonHandledInterrupt)
  43  001a 0000          	dc.w	f_NonHandledInterrupt
  44  001c 82            	dc.b	130
  46  001d 00            	dc.b	page(f_NonHandledInterrupt)
  47  001e 0000          	dc.w	f_NonHandledInterrupt
  48  0020 82            	dc.b	130
  50  0021 00            	dc.b	page(f_NonHandledInterrupt)
  51  0022 0000          	dc.w	f_NonHandledInterrupt
  52  0024 82            	dc.b	130
  54  0025 00            	dc.b	page(f_NonHandledInterrupt)
  55  0026 0000          	dc.w	f_NonHandledInterrupt
  56  0028 82            	dc.b	130
  58  0029 00            	dc.b	page(f_NonHandledInterrupt)
  59  002a 0000          	dc.w	f_NonHandledInterrupt
  60  002c 82            	dc.b	130
  62  002d 00            	dc.b	page(f_NonHandledInterrupt)
  63  002e 0000          	dc.w	f_NonHandledInterrupt
  64  0030 82            	dc.b	130
  66  0031 00            	dc.b	page(f_NonHandledInterrupt)
  67  0032 0000          	dc.w	f_NonHandledInterrupt
  68  0034 82            	dc.b	130
  70  0035 00            	dc.b	page(f_NonHandledInterrupt)
  71  0036 0000          	dc.w	f_NonHandledInterrupt
  72  0038 82            	dc.b	130
  74  0039 00            	dc.b	page(f_NonHandledInterrupt)
  75  003a 0000          	dc.w	f_NonHandledInterrupt
  76  003c 82            	dc.b	130
  78  003d 00            	dc.b	page(f_NonHandledInterrupt)
  79  003e 0000          	dc.w	f_NonHandledInterrupt
  80  0040 82            	dc.b	130
  82  0041 00            	dc.b	page(f_NonHandledInterrupt)
  83  0042 0000          	dc.w	f_NonHandledInterrupt
  84  0044 82            	dc.b	130
  86  0045 00            	dc.b	page(f_NonHandledInterrupt)
  87  0046 0000          	dc.w	f_NonHandledInterrupt
  88  0048 82            	dc.b	130
  90  0049 00            	dc.b	page(f_NonHandledInterrupt)
  91  004a 0000          	dc.w	f_NonHandledInterrupt
  92  004c 82            	dc.b	130
  94  004d 00            	dc.b	page(f_NonHandledInterrupt)
  95  004e 0000          	dc.w	f_NonHandledInterrupt
  96  0050 82            	dc.b	130
  98  0051 00            	dc.b	page(f_NonHandledInterrupt)
  99  0052 0000          	dc.w	f_NonHandledInterrupt
 100  0054 82            	dc.b	130
 102  0055 00            	dc.b	page(f_NonHandledInterrupt)
 103  0056 0000          	dc.w	f_NonHandledInterrupt
 104  0058 82            	dc.b	130
 106  0059 00            	dc.b	page(f_NonHandledInterrupt)
 107  005a 0000          	dc.w	f_NonHandledInterrupt
 108  005c 82            	dc.b	130
 110  005d 00            	dc.b	page(f_NonHandledInterrupt)
 111  005e 0000          	dc.w	f_NonHandledInterrupt
 112  0060 82            	dc.b	130
 114  0061 00            	dc.b	page(f_NonHandledInterrupt)
 115  0062 0000          	dc.w	f_NonHandledInterrupt
 116  0064 82            	dc.b	130
 118  0065 00            	dc.b	page(f_NonHandledInterrupt)
 119  0066 0000          	dc.w	f_NonHandledInterrupt
 120  0068 82            	dc.b	130
 122  0069 00            	dc.b	page(f_NonHandledInterrupt)
 123  006a 0000          	dc.w	f_NonHandledInterrupt
 124  006c 82            	dc.b	130
 126  006d 00            	dc.b	page(f_NonHandledInterrupt)
 127  006e 0000          	dc.w	f_NonHandledInterrupt
 128  0070 82            	dc.b	130
 130  0071 00            	dc.b	page(f_NonHandledInterrupt)
 131  0072 0000          	dc.w	f_NonHandledInterrupt
 132  0074 82            	dc.b	130
 134  0075 00            	dc.b	page(f_NonHandledInterrupt)
 135  0076 0000          	dc.w	f_NonHandledInterrupt
 136  0078 82            	dc.b	130
 138  0079 00            	dc.b	page(f_NonHandledInterrupt)
 139  007a 0000          	dc.w	f_NonHandledInterrupt
 140  007c 82            	dc.b	130
 142  007d 00            	dc.b	page(f_NonHandledInterrupt)
 143  007e 0000          	dc.w	f_NonHandledInterrupt
 203                     	xdef	__vectab
 204                     	xref	f_NonHandledInterrupt
 205                     	xref	__stext
 206                     	xref	f_AWU_trigger_IRQHandler
 225                     	end
