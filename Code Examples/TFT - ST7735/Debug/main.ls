   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  14                     .const:	section	.text
  15  0000               L3_font:
  16  0000 00            	dc.b	0
  17  0001 00            	dc.b	0
  18  0002 00            	dc.b	0
  19  0003 00            	dc.b	0
  20  0004 00            	dc.b	0
  21  0005 00            	dc.b	0
  22  0006 00            	dc.b	0
  23  0007 5f            	dc.b	95
  24  0008 00            	dc.b	0
  25  0009 00            	dc.b	0
  26  000a 00            	dc.b	0
  27  000b 07            	dc.b	7
  28  000c 00            	dc.b	0
  29  000d 07            	dc.b	7
  30  000e 00            	dc.b	0
  31  000f 14            	dc.b	20
  32  0010 7f            	dc.b	127
  33  0011 14            	dc.b	20
  34  0012 7f            	dc.b	127
  35  0013 14            	dc.b	20
  36  0014 24            	dc.b	36
  37  0015 2a            	dc.b	42
  38  0016 7f            	dc.b	127
  39  0017 2a            	dc.b	42
  40  0018 12            	dc.b	18
  41  0019 23            	dc.b	35
  42  001a 13            	dc.b	19
  43  001b 08            	dc.b	8
  44  001c 64            	dc.b	100
  45  001d 62            	dc.b	98
  46  001e 36            	dc.b	54
  47  001f 49            	dc.b	73
  48  0020 55            	dc.b	85
  49  0021 22            	dc.b	34
  50  0022 50            	dc.b	80
  51  0023 00            	dc.b	0
  52  0024 05            	dc.b	5
  53  0025 03            	dc.b	3
  54  0026 00            	dc.b	0
  55  0027 00            	dc.b	0
  56  0028 00            	dc.b	0
  57  0029 1c            	dc.b	28
  58  002a 22            	dc.b	34
  59  002b 41            	dc.b	65
  60  002c 00            	dc.b	0
  61  002d 00            	dc.b	0
  62  002e 41            	dc.b	65
  63  002f 22            	dc.b	34
  64  0030 1c            	dc.b	28
  65  0031 00            	dc.b	0
  66  0032 14            	dc.b	20
  67  0033 08            	dc.b	8
  68  0034 3e            	dc.b	62
  69  0035 08            	dc.b	8
  70  0036 14            	dc.b	20
  71  0037 08            	dc.b	8
  72  0038 08            	dc.b	8
  73  0039 3e            	dc.b	62
  74  003a 08            	dc.b	8
  75  003b 08            	dc.b	8
  76  003c 00            	dc.b	0
  77  003d 50            	dc.b	80
  78  003e 30            	dc.b	48
  79  003f 00            	dc.b	0
  80  0040 00            	dc.b	0
  81  0041 08            	dc.b	8
  82  0042 08            	dc.b	8
  83  0043 08            	dc.b	8
  84  0044 08            	dc.b	8
  85  0045 08            	dc.b	8
  86  0046 00            	dc.b	0
  87  0047 60            	dc.b	96
  88  0048 60            	dc.b	96
  89  0049 00            	dc.b	0
  90  004a 00            	dc.b	0
  91  004b 20            	dc.b	32
  92  004c 10            	dc.b	16
  93  004d 08            	dc.b	8
  94  004e 04            	dc.b	4
  95  004f 02            	dc.b	2
  96  0050 3e            	dc.b	62
  97  0051 51            	dc.b	81
  98  0052 49            	dc.b	73
  99  0053 45            	dc.b	69
 100  0054 3e            	dc.b	62
 101  0055 00            	dc.b	0
 102  0056 42            	dc.b	66
 103  0057 7f            	dc.b	127
 104  0058 40            	dc.b	64
 105  0059 00            	dc.b	0
 106  005a 42            	dc.b	66
 107  005b 61            	dc.b	97
 108  005c 51            	dc.b	81
 109  005d 49            	dc.b	73
 110  005e 46            	dc.b	70
 111  005f 21            	dc.b	33
 112  0060 41            	dc.b	65
 113  0061 45            	dc.b	69
 114  0062 4b            	dc.b	75
 115  0063 31            	dc.b	49
 116  0064 18            	dc.b	24
 117  0065 14            	dc.b	20
 118  0066 12            	dc.b	18
 119  0067 7f            	dc.b	127
 120  0068 10            	dc.b	16
 121  0069 27            	dc.b	39
 122  006a 45            	dc.b	69
 123  006b 45            	dc.b	69
 124  006c 45            	dc.b	69
 125  006d 39            	dc.b	57
 126  006e 3c            	dc.b	60
 127  006f 4a            	dc.b	74
 128  0070 49            	dc.b	73
 129  0071 49            	dc.b	73
 130  0072 30            	dc.b	48
 131  0073 01            	dc.b	1
 132  0074 71            	dc.b	113
 133  0075 09            	dc.b	9
 134  0076 05            	dc.b	5
 135  0077 03            	dc.b	3
 136  0078 36            	dc.b	54
 137  0079 49            	dc.b	73
 138  007a 49            	dc.b	73
 139  007b 49            	dc.b	73
 140  007c 36            	dc.b	54
 141  007d 06            	dc.b	6
 142  007e 49            	dc.b	73
 143  007f 49            	dc.b	73
 144  0080 29            	dc.b	41
 145  0081 1e            	dc.b	30
 146  0082 00            	dc.b	0
 147  0083 36            	dc.b	54
 148  0084 36            	dc.b	54
 149  0085 00            	dc.b	0
 150  0086 00            	dc.b	0
 151  0087 00            	dc.b	0
 152  0088 56            	dc.b	86
 153  0089 36            	dc.b	54
 154  008a 00            	dc.b	0
 155  008b 00            	dc.b	0
 156  008c 08            	dc.b	8
 157  008d 14            	dc.b	20
 158  008e 22            	dc.b	34
 159  008f 41            	dc.b	65
 160  0090 00            	dc.b	0
 161  0091 14            	dc.b	20
 162  0092 14            	dc.b	20
 163  0093 14            	dc.b	20
 164  0094 14            	dc.b	20
 165  0095 14            	dc.b	20
 166  0096 00            	dc.b	0
 167  0097 41            	dc.b	65
 168  0098 22            	dc.b	34
 169  0099 14            	dc.b	20
 170  009a 08            	dc.b	8
 171  009b 02            	dc.b	2
 172  009c 01            	dc.b	1
 173  009d 51            	dc.b	81
 174  009e 09            	dc.b	9
 175  009f 06            	dc.b	6
 176  00a0 32            	dc.b	50
 177  00a1 49            	dc.b	73
 178  00a2 79            	dc.b	121
 179  00a3 41            	dc.b	65
 180  00a4 3e            	dc.b	62
 181  00a5 7e            	dc.b	126
 182  00a6 11            	dc.b	17
 183  00a7 11            	dc.b	17
 184  00a8 11            	dc.b	17
 185  00a9 7e            	dc.b	126
 186  00aa 7f            	dc.b	127
 187  00ab 49            	dc.b	73
 188  00ac 49            	dc.b	73
 189  00ad 49            	dc.b	73
 190  00ae 36            	dc.b	54
 191  00af 3e            	dc.b	62
 192  00b0 41            	dc.b	65
 193  00b1 41            	dc.b	65
 194  00b2 41            	dc.b	65
 195  00b3 22            	dc.b	34
 196  00b4 7f            	dc.b	127
 197  00b5 41            	dc.b	65
 198  00b6 41            	dc.b	65
 199  00b7 22            	dc.b	34
 200  00b8 1c            	dc.b	28
 201  00b9 7f            	dc.b	127
 202  00ba 49            	dc.b	73
 203  00bb 49            	dc.b	73
 204  00bc 49            	dc.b	73
 205  00bd 41            	dc.b	65
 206  00be 7f            	dc.b	127
 207  00bf 09            	dc.b	9
 208  00c0 09            	dc.b	9
 209  00c1 09            	dc.b	9
 210  00c2 01            	dc.b	1
 211  00c3 3e            	dc.b	62
 212  00c4 41            	dc.b	65
 213  00c5 49            	dc.b	73
 214  00c6 49            	dc.b	73
 215  00c7 7a            	dc.b	122
 216  00c8 7f            	dc.b	127
 217  00c9 08            	dc.b	8
 218  00ca 08            	dc.b	8
 219  00cb 08            	dc.b	8
 220  00cc 7f            	dc.b	127
 221  00cd 00            	dc.b	0
 222  00ce 41            	dc.b	65
 223  00cf 7f            	dc.b	127
 224  00d0 41            	dc.b	65
 225  00d1 00            	dc.b	0
 226  00d2 20            	dc.b	32
 227  00d3 40            	dc.b	64
 228  00d4 41            	dc.b	65
 229  00d5 3f            	dc.b	63
 230  00d6 01            	dc.b	1
 231  00d7 7f            	dc.b	127
 232  00d8 08            	dc.b	8
 233  00d9 14            	dc.b	20
 234  00da 22            	dc.b	34
 235  00db 41            	dc.b	65
 236  00dc 7f            	dc.b	127
 237  00dd 40            	dc.b	64
 238  00de 40            	dc.b	64
 239  00df 40            	dc.b	64
 240  00e0 40            	dc.b	64
 241  00e1 7f            	dc.b	127
 242  00e2 02            	dc.b	2
 243  00e3 0c            	dc.b	12
 244  00e4 02            	dc.b	2
 245  00e5 7f            	dc.b	127
 246  00e6 7f            	dc.b	127
 247  00e7 04            	dc.b	4
 248  00e8 08            	dc.b	8
 249  00e9 10            	dc.b	16
 250  00ea 7f            	dc.b	127
 251  00eb 3e            	dc.b	62
 252  00ec 41            	dc.b	65
 253  00ed 41            	dc.b	65
 254  00ee 41            	dc.b	65
 255  00ef 3e            	dc.b	62
 256  00f0 7f            	dc.b	127
 257  00f1 09            	dc.b	9
 258  00f2 09            	dc.b	9
 259  00f3 09            	dc.b	9
 260  00f4 06            	dc.b	6
 261  00f5 3e            	dc.b	62
 262  00f6 41            	dc.b	65
 263  00f7 51            	dc.b	81
 264  00f8 21            	dc.b	33
 265  00f9 5e            	dc.b	94
 266  00fa 7f            	dc.b	127
 267  00fb 09            	dc.b	9
 268  00fc 19            	dc.b	25
 269  00fd 29            	dc.b	41
 270  00fe 46            	dc.b	70
 271  00ff 46            	dc.b	70
 272  0100 49            	dc.b	73
 273  0101 49            	dc.b	73
 274  0102 49            	dc.b	73
 275  0103 31            	dc.b	49
 276  0104 01            	dc.b	1
 277  0105 01            	dc.b	1
 278  0106 7f            	dc.b	127
 279  0107 01            	dc.b	1
 280  0108 01            	dc.b	1
 281  0109 3f            	dc.b	63
 282  010a 40            	dc.b	64
 283  010b 40            	dc.b	64
 284  010c 40            	dc.b	64
 285  010d 3f            	dc.b	63
 286  010e 1f            	dc.b	31
 287  010f 20            	dc.b	32
 288  0110 40            	dc.b	64
 289  0111 20            	dc.b	32
 290  0112 1f            	dc.b	31
 291  0113 3f            	dc.b	63
 292  0114 40            	dc.b	64
 293  0115 38            	dc.b	56
 294  0116 40            	dc.b	64
 295  0117 3f            	dc.b	63
 296  0118 63            	dc.b	99
 297  0119 14            	dc.b	20
 298  011a 08            	dc.b	8
 299  011b 14            	dc.b	20
 300  011c 63            	dc.b	99
 301  011d 07            	dc.b	7
 302  011e 08            	dc.b	8
 303  011f 70            	dc.b	112
 304  0120 08            	dc.b	8
 305  0121 07            	dc.b	7
 306  0122 61            	dc.b	97
 307  0123 51            	dc.b	81
 308  0124 49            	dc.b	73
 309  0125 45            	dc.b	69
 310  0126 43            	dc.b	67
 311  0127 00            	dc.b	0
 312  0128 7f            	dc.b	127
 313  0129 41            	dc.b	65
 314  012a 41            	dc.b	65
 315  012b 00            	dc.b	0
 316  012c 02            	dc.b	2
 317  012d 04            	dc.b	4
 318  012e 08            	dc.b	8
 319  012f 10            	dc.b	16
 320  0130 20            	dc.b	32
 321  0131 00            	dc.b	0
 322  0132 41            	dc.b	65
 323  0133 41            	dc.b	65
 324  0134 7f            	dc.b	127
 325  0135 00            	dc.b	0
 326  0136 04            	dc.b	4
 327  0137 02            	dc.b	2
 328  0138 01            	dc.b	1
 329  0139 02            	dc.b	2
 330  013a 04            	dc.b	4
 331  013b 40            	dc.b	64
 332  013c 40            	dc.b	64
 333  013d 40            	dc.b	64
 334  013e 40            	dc.b	64
 335  013f 40            	dc.b	64
 336  0140 00            	dc.b	0
 337  0141 01            	dc.b	1
 338  0142 02            	dc.b	2
 339  0143 04            	dc.b	4
 340  0144 00            	dc.b	0
 341  0145 20            	dc.b	32
 342  0146 54            	dc.b	84
 343  0147 54            	dc.b	84
 344  0148 54            	dc.b	84
 345  0149 78            	dc.b	120
 346  014a 7f            	dc.b	127
 347  014b 48            	dc.b	72
 348  014c 44            	dc.b	68
 349  014d 44            	dc.b	68
 350  014e 38            	dc.b	56
 351  014f 38            	dc.b	56
 352  0150 44            	dc.b	68
 353  0151 44            	dc.b	68
 354  0152 44            	dc.b	68
 355  0153 20            	dc.b	32
 356  0154 38            	dc.b	56
 357  0155 44            	dc.b	68
 358  0156 44            	dc.b	68
 359  0157 48            	dc.b	72
 360  0158 7f            	dc.b	127
 361  0159 38            	dc.b	56
 362  015a 54            	dc.b	84
 363  015b 54            	dc.b	84
 364  015c 54            	dc.b	84
 365  015d 18            	dc.b	24
 366  015e 08            	dc.b	8
 367  015f 7e            	dc.b	126
 368  0160 09            	dc.b	9
 369  0161 01            	dc.b	1
 370  0162 02            	dc.b	2
 371  0163 0c            	dc.b	12
 372  0164 52            	dc.b	82
 373  0165 52            	dc.b	82
 374  0166 52            	dc.b	82
 375  0167 3e            	dc.b	62
 376  0168 7f            	dc.b	127
 377  0169 08            	dc.b	8
 378  016a 04            	dc.b	4
 379  016b 04            	dc.b	4
 380  016c 78            	dc.b	120
 381  016d 00            	dc.b	0
 382  016e 44            	dc.b	68
 383  016f 7d            	dc.b	125
 384  0170 40            	dc.b	64
 385  0171 00            	dc.b	0
 386  0172 20            	dc.b	32
 387  0173 40            	dc.b	64
 388  0174 44            	dc.b	68
 389  0175 3d            	dc.b	61
 390  0176 00            	dc.b	0
 391  0177 7f            	dc.b	127
 392  0178 10            	dc.b	16
 393  0179 28            	dc.b	40
 394  017a 44            	dc.b	68
 395  017b 00            	dc.b	0
 396  017c 00            	dc.b	0
 397  017d 41            	dc.b	65
 398  017e 7f            	dc.b	127
 399  017f 40            	dc.b	64
 400  0180 00            	dc.b	0
 401  0181 7c            	dc.b	124
 402  0182 04            	dc.b	4
 403  0183 18            	dc.b	24
 404  0184 04            	dc.b	4
 405  0185 78            	dc.b	120
 406  0186 7c            	dc.b	124
 407  0187 08            	dc.b	8
 408  0188 04            	dc.b	4
 409  0189 04            	dc.b	4
 410  018a 78            	dc.b	120
 411  018b 38            	dc.b	56
 412  018c 44            	dc.b	68
 413  018d 44            	dc.b	68
 414  018e 44            	dc.b	68
 415  018f 38            	dc.b	56
 416  0190 7c            	dc.b	124
 417  0191 14            	dc.b	20
 418  0192 14            	dc.b	20
 419  0193 14            	dc.b	20
 420  0194 08            	dc.b	8
 421  0195 08            	dc.b	8
 422  0196 14            	dc.b	20
 423  0197 14            	dc.b	20
 424  0198 18            	dc.b	24
 425  0199 7c            	dc.b	124
 426  019a 7c            	dc.b	124
 427  019b 08            	dc.b	8
 428  019c 04            	dc.b	4
 429  019d 04            	dc.b	4
 430  019e 08            	dc.b	8
 431  019f 48            	dc.b	72
 432  01a0 54            	dc.b	84
 433  01a1 54            	dc.b	84
 434  01a2 54            	dc.b	84
 435  01a3 20            	dc.b	32
 436  01a4 04            	dc.b	4
 437  01a5 3f            	dc.b	63
 438  01a6 44            	dc.b	68
 439  01a7 40            	dc.b	64
 440  01a8 20            	dc.b	32
 441  01a9 3c            	dc.b	60
 442  01aa 40            	dc.b	64
 443  01ab 40            	dc.b	64
 444  01ac 20            	dc.b	32
 445  01ad 7c            	dc.b	124
 446  01ae 1c            	dc.b	28
 447  01af 20            	dc.b	32
 448  01b0 40            	dc.b	64
 449  01b1 20            	dc.b	32
 450  01b2 1c            	dc.b	28
 451  01b3 3c            	dc.b	60
 452  01b4 40            	dc.b	64
 453  01b5 30            	dc.b	48
 454  01b6 40            	dc.b	64
 455  01b7 3c            	dc.b	60
 456  01b8 44            	dc.b	68
 457  01b9 28            	dc.b	40
 458  01ba 10            	dc.b	16
 459  01bb 28            	dc.b	40
 460  01bc 44            	dc.b	68
 461  01bd 0c            	dc.b	12
 462  01be 50            	dc.b	80
 463  01bf 50            	dc.b	80
 464  01c0 50            	dc.b	80
 465  01c1 3c            	dc.b	60
 466  01c2 44            	dc.b	68
 467  01c3 64            	dc.b	100
 468  01c4 54            	dc.b	84
 469  01c5 4c            	dc.b	76
 470  01c6 44            	dc.b	68
 471  01c7 00            	dc.b	0
 472  01c8 08            	dc.b	8
 473  01c9 36            	dc.b	54
 474  01ca 41            	dc.b	65
 475  01cb 00            	dc.b	0
 476  01cc 00            	dc.b	0
 477  01cd 00            	dc.b	0
 478  01ce 7f            	dc.b	127
 479  01cf 00            	dc.b	0
 480  01d0 00            	dc.b	0
 481  01d1 00            	dc.b	0
 482  01d2 41            	dc.b	65
 483  01d3 36            	dc.b	54
 484  01d4 08            	dc.b	8
 485  01d5 00            	dc.b	0
 486  01d6 10            	dc.b	16
 487  01d7 08            	dc.b	8
 488  01d8 08            	dc.b	8
 489  01d9 10            	dc.b	16
 490  01da 08            	dc.b	8
 491  01db 78            	dc.b	120
 492  01dc 46            	dc.b	70
 493  01dd 41            	dc.b	65
 494  01de 46            	dc.b	70
 495  01df 78            	dc.b	120
 597                     ; 13 void main(void)
 597                     ; 14 {
 599                     	switch	.text
 600  0000               _main:
 602  0000 5207          	subw	sp,#7
 603       00000007      OFST:	set	7
 606                     ; 15 	 float f = -0.09;
 608  0002 ce0207        	ldw	x,L16+2
 609  0005 1f03          	ldw	(OFST-4,sp),x
 610  0007 ce0205        	ldw	x,L16
 611  000a 1f01          	ldw	(OFST-6,sp),x
 613                     ; 16      signed int i = -9;
 615  000c aefff7        	ldw	x,#65527
 616  000f 1f05          	ldw	(OFST-2,sp),x
 618                     ; 17      signed char c = 127;
 620  0011 a67f          	ld	a,#127
 621  0013 6b07          	ld	(OFST+0,sp),a
 623                     ; 19      setup_clock();
 625  0015 cd01e0        	call	_setup_clock
 627                     ; 20 	 setup_GPIOs();
 629  0018 cd0248        	call	_setup_GPIOs
 631                     ; 21 	 ST7735_init();
 633  001b cd0000        	call	_ST7735_init
 635                     ; 23      ST7735_Set_Rotation(0x01);
 637  001e a601          	ld	a,#1
 638  0020 cd0000        	call	_ST7735_Set_Rotation
 640                     ; 25      TFT_fill(Swap_Colour(GREEN));
 642  0023 ae07e0        	ldw	x,#2016
 643  0026 cd0000        	call	_Swap_Colour
 645  0029 cd0000        	call	_TFT_fill
 647                     ; 26      Draw_Circle(79, 63, 20, YES, Swap_Colour(RED));
 649  002c aef800        	ldw	x,#63488
 650  002f cd0000        	call	_Swap_Colour
 652  0032 89            	pushw	x
 653  0033 4b01          	push	#1
 654  0035 ae0014        	ldw	x,#20
 655  0038 89            	pushw	x
 656  0039 ae003f        	ldw	x,#63
 657  003c 89            	pushw	x
 658  003d ae004f        	ldw	x,#79
 659  0040 cd0000        	call	_Draw_Circle
 661  0043 5b07          	addw	sp,#7
 662                     ; 27      delay_ms(4000);
 664  0045 ae0fa0        	ldw	x,#4000
 665  0048 cd0000        	call	_delay_ms
 667                     ; 29      TFT_fill(Swap_Colour(WHITE));
 669  004b aeffff        	ldw	x,#65535
 670  004e cd0000        	call	_Swap_Colour
 672  0051 cd0000        	call	_TFT_fill
 674                     ; 31      Draw_Circle(6, 6, 4, YES, RED);
 676  0054 aef800        	ldw	x,#63488
 677  0057 89            	pushw	x
 678  0058 4b01          	push	#1
 679  005a ae0004        	ldw	x,#4
 680  005d 89            	pushw	x
 681  005e ae0006        	ldw	x,#6
 682  0061 89            	pushw	x
 683  0062 ae0006        	ldw	x,#6
 684  0065 cd0000        	call	_Draw_Circle
 686  0068 5b07          	addw	sp,#7
 687                     ; 32      Draw_Circle(153, 6, 4, YES, RED);
 689  006a aef800        	ldw	x,#63488
 690  006d 89            	pushw	x
 691  006e 4b01          	push	#1
 692  0070 ae0004        	ldw	x,#4
 693  0073 89            	pushw	x
 694  0074 ae0006        	ldw	x,#6
 695  0077 89            	pushw	x
 696  0078 ae0099        	ldw	x,#153
 697  007b cd0000        	call	_Draw_Circle
 699  007e 5b07          	addw	sp,#7
 700                     ; 33      Draw_Circle(6, 121, 4, YES, RED);
 702  0080 aef800        	ldw	x,#63488
 703  0083 89            	pushw	x
 704  0084 4b01          	push	#1
 705  0086 ae0004        	ldw	x,#4
 706  0089 89            	pushw	x
 707  008a ae0079        	ldw	x,#121
 708  008d 89            	pushw	x
 709  008e ae0006        	ldw	x,#6
 710  0091 cd0000        	call	_Draw_Circle
 712  0094 5b07          	addw	sp,#7
 713                     ; 34      Draw_Circle(153, 121, 4, YES, RED);
 715  0096 aef800        	ldw	x,#63488
 716  0099 89            	pushw	x
 717  009a 4b01          	push	#1
 718  009c ae0004        	ldw	x,#4
 719  009f 89            	pushw	x
 720  00a0 ae0079        	ldw	x,#121
 721  00a3 89            	pushw	x
 722  00a4 ae0099        	ldw	x,#153
 723  00a7 cd0000        	call	_Draw_Circle
 725  00aa 5b07          	addw	sp,#7
 726                     ; 36      delay_ms(1000);
 728  00ac ae03e8        	ldw	x,#1000
 729  00af cd0000        	call	_delay_ms
 731                     ; 38      Draw_Line(14, 0, 14, 127, CYAN);
 733  00b2 ae07ff        	ldw	x,#2047
 734  00b5 89            	pushw	x
 735  00b6 ae007f        	ldw	x,#127
 736  00b9 89            	pushw	x
 737  00ba ae000e        	ldw	x,#14
 738  00bd 89            	pushw	x
 739  00be 5f            	clrw	x
 740  00bf 89            	pushw	x
 741  00c0 ae000e        	ldw	x,#14
 742  00c3 cd0000        	call	_Draw_Line
 744  00c6 5b08          	addw	sp,#8
 745                     ; 39      Draw_Line(145, 0, 145, 127, CYAN);
 747  00c8 ae07ff        	ldw	x,#2047
 748  00cb 89            	pushw	x
 749  00cc ae007f        	ldw	x,#127
 750  00cf 89            	pushw	x
 751  00d0 ae0091        	ldw	x,#145
 752  00d3 89            	pushw	x
 753  00d4 5f            	clrw	x
 754  00d5 89            	pushw	x
 755  00d6 ae0091        	ldw	x,#145
 756  00d9 cd0000        	call	_Draw_Line
 758  00dc 5b08          	addw	sp,#8
 759                     ; 40      Draw_Line(0, 14, 159, 14, CYAN);
 761  00de ae07ff        	ldw	x,#2047
 762  00e1 89            	pushw	x
 763  00e2 ae000e        	ldw	x,#14
 764  00e5 89            	pushw	x
 765  00e6 ae009f        	ldw	x,#159
 766  00e9 89            	pushw	x
 767  00ea ae000e        	ldw	x,#14
 768  00ed 89            	pushw	x
 769  00ee 5f            	clrw	x
 770  00ef cd0000        	call	_Draw_Line
 772  00f2 5b08          	addw	sp,#8
 773                     ; 41      Draw_Line(0, 113, 159, 113, CYAN);
 775  00f4 ae07ff        	ldw	x,#2047
 776  00f7 89            	pushw	x
 777  00f8 ae0071        	ldw	x,#113
 778  00fb 89            	pushw	x
 779  00fc ae009f        	ldw	x,#159
 780  00ff 89            	pushw	x
 781  0100 ae0071        	ldw	x,#113
 782  0103 89            	pushw	x
 783  0104 5f            	clrw	x
 784  0105 cd0000        	call	_Draw_Line
 786  0108 5b08          	addw	sp,#8
 787                     ; 43      delay_ms(1000);
 789  010a ae03e8        	ldw	x,#1000
 790  010d cd0000        	call	_delay_ms
 792                     ; 45      Draw_Rectangle(17, 17, 142, 110, YES, ROUND, BLUE, WHITE);
 794  0110 aeffff        	ldw	x,#65535
 795  0113 89            	pushw	x
 796  0114 ae001f        	ldw	x,#31
 797  0117 89            	pushw	x
 798  0118 4b01          	push	#1
 799  011a 4b01          	push	#1
 800  011c ae006e        	ldw	x,#110
 801  011f 89            	pushw	x
 802  0120 ae008e        	ldw	x,#142
 803  0123 89            	pushw	x
 804  0124 ae0011        	ldw	x,#17
 805  0127 89            	pushw	x
 806  0128 ae0011        	ldw	x,#17
 807  012b cd0000        	call	_Draw_Rectangle
 809  012e 5b0c          	addw	sp,#12
 810                     ; 46      delay_ms(1000);
 812  0130 ae03e8        	ldw	x,#1000
 813  0133 cd0000        	call	_delay_ms
 815                     ; 48      print_str(22, 58, 2, YELLOW, BLUE, "MicroArena");
 817  0136 ae01fa        	ldw	x,#L56
 818  0139 89            	pushw	x
 819  013a ae001f        	ldw	x,#31
 820  013d 89            	pushw	x
 821  013e aeffe0        	ldw	x,#65504
 822  0141 89            	pushw	x
 823  0142 4b02          	push	#2
 824  0144 ae003a        	ldw	x,#58
 825  0147 89            	pushw	x
 826  0148 ae0016        	ldw	x,#22
 827  014b cd0000        	call	_print_str
 829  014e 5b09          	addw	sp,#9
 830                     ; 49      delay_ms(4000);
 832  0150 ae0fa0        	ldw	x,#4000
 833  0153 cd0000        	call	_delay_ms
 835                     ; 51      TFT_fill(BLACK);
 837  0156 5f            	clrw	x
 838  0157 cd0000        	call	_TFT_fill
 840                     ; 52      print_str(20, 90, 1, YELLOW, BLACK, "www.fb.com/MicroArena");
 842  015a ae01e4        	ldw	x,#L76
 843  015d 89            	pushw	x
 844  015e 5f            	clrw	x
 845  015f 89            	pushw	x
 846  0160 aeffe0        	ldw	x,#65504
 847  0163 89            	pushw	x
 848  0164 4b01          	push	#1
 849  0166 ae005a        	ldw	x,#90
 850  0169 89            	pushw	x
 851  016a ae0014        	ldw	x,#20
 852  016d cd0000        	call	_print_str
 854  0170 5b09          	addw	sp,#9
 855  0172               L17:
 856                     ; 56              print_F(60, 20, 1, BLUE, BLACK, f, 2);
 858  0172 4b02          	push	#2
 859  0174 1e04          	ldw	x,(OFST-3,sp)
 860  0176 89            	pushw	x
 861  0177 1e04          	ldw	x,(OFST-3,sp)
 862  0179 89            	pushw	x
 863  017a 5f            	clrw	x
 864  017b 89            	pushw	x
 865  017c ae001f        	ldw	x,#31
 866  017f 89            	pushw	x
 867  0180 4b01          	push	#1
 868  0182 ae0014        	ldw	x,#20
 869  0185 89            	pushw	x
 870  0186 ae003c        	ldw	x,#60
 871  0189 cd0000        	call	_print_F
 873  018c 5b0c          	addw	sp,#12
 874                     ; 57              print_C(60, 40, 1, RED, BLACK, c);
 876  018e 7b07          	ld	a,(OFST+0,sp)
 877  0190 5f            	clrw	x
 878  0191 4d            	tnz	a
 879  0192 2a01          	jrpl	L6
 880  0194 53            	cplw	x
 881  0195               L6:
 882  0195 97            	ld	xl,a
 883  0196 89            	pushw	x
 884  0197 5f            	clrw	x
 885  0198 89            	pushw	x
 886  0199 aef800        	ldw	x,#63488
 887  019c 89            	pushw	x
 888  019d 4b01          	push	#1
 889  019f ae0028        	ldw	x,#40
 890  01a2 89            	pushw	x
 891  01a3 ae003c        	ldw	x,#60
 892  01a6 cd0000        	call	_print_C
 894  01a9 5b09          	addw	sp,#9
 895                     ; 58              print_I(60, 60, 1, GREEN, BLACK, i);
 897  01ab 1e05          	ldw	x,(OFST-2,sp)
 898  01ad 89            	pushw	x
 899  01ae 5f            	clrw	x
 900  01af 89            	pushw	x
 901  01b0 ae07e0        	ldw	x,#2016
 902  01b3 89            	pushw	x
 903  01b4 4b01          	push	#1
 904  01b6 ae003c        	ldw	x,#60
 905  01b9 89            	pushw	x
 906  01ba ae003c        	ldw	x,#60
 907  01bd cd0000        	call	_print_I
 909  01c0 5b09          	addw	sp,#9
 910                     ; 59              f += 0.01;
 912  01c2 ae01e0        	ldw	x,#L101
 913  01c5 cd0000        	call	c_ltor
 915  01c8 96            	ldw	x,sp
 916  01c9 1c0001        	addw	x,#OFST-6
 917  01cc cd0000        	call	c_fgadd
 920                     ; 60              c -= 1;
 922  01cf 0a07          	dec	(OFST+0,sp)
 924                     ; 61              i += 1;
 926  01d1 1e05          	ldw	x,(OFST-2,sp)
 927  01d3 1c0001        	addw	x,#1
 928  01d6 1f05          	ldw	(OFST-2,sp),x
 930                     ; 66              delay_ms(60);
 932  01d8 ae003c        	ldw	x,#60
 933  01db cd0000        	call	_delay_ms
 936  01de 2092          	jra	L17
 969                     ; 71 void setup_clock(void)
 969                     ; 72 {
 970                     	switch	.text
 971  01e0               _setup_clock:
 975                     ; 73 	CLK_DeInit();
 977  01e0 cd0000        	call	_CLK_DeInit
 979                     ; 75 	CLK_HSECmd(ENABLE);
 981  01e3 a601          	ld	a,#1
 982  01e5 cd0000        	call	_CLK_HSECmd
 984                     ; 76 	CLK_LSICmd(DISABLE);
 986  01e8 4f            	clr	a
 987  01e9 cd0000        	call	_CLK_LSICmd
 989                     ; 77 	CLK_HSICmd(ENABLE);
 991  01ec a601          	ld	a,#1
 992  01ee cd0000        	call	_CLK_HSICmd
 995  01f1               L711:
 996                     ; 78 	while(CLK_GetFlagStatus(CLK_FLAG_HSERDY) == FALSE);
 998  01f1 ae0202        	ldw	x,#514
 999  01f4 cd0000        	call	_CLK_GetFlagStatus
1001  01f7 4d            	tnz	a
1002  01f8 27f7          	jreq	L711
1003                     ; 80 	CLK_ClockSwitchCmd(ENABLE);
1005  01fa a601          	ld	a,#1
1006  01fc cd0000        	call	_CLK_ClockSwitchCmd
1008                     ; 81 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
1010  01ff 4f            	clr	a
1011  0200 cd0000        	call	_CLK_HSIPrescalerConfig
1013                     ; 82 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
1015  0203 a680          	ld	a,#128
1016  0205 cd0000        	call	_CLK_SYSCLKConfig
1018                     ; 84 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 
1018                     ; 85 	DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
1020  0208 4b01          	push	#1
1021  020a 4b00          	push	#0
1022  020c ae01b4        	ldw	x,#436
1023  020f cd0000        	call	_CLK_ClockSwitchConfig
1025  0212 85            	popw	x
1026                     ; 87 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
1028  0213 ae0101        	ldw	x,#257
1029  0216 cd0000        	call	_CLK_PeripheralClockConfig
1031                     ; 88 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
1033  0219 5f            	clrw	x
1034  021a cd0000        	call	_CLK_PeripheralClockConfig
1036                     ; 89 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
1038  021d ae1300        	ldw	x,#4864
1039  0220 cd0000        	call	_CLK_PeripheralClockConfig
1041                     ; 90 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
1043  0223 ae1200        	ldw	x,#4608
1044  0226 cd0000        	call	_CLK_PeripheralClockConfig
1046                     ; 91 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, DISABLE);
1048  0229 ae0300        	ldw	x,#768
1049  022c cd0000        	call	_CLK_PeripheralClockConfig
1051                     ; 92 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
1053  022f ae0700        	ldw	x,#1792
1054  0232 cd0000        	call	_CLK_PeripheralClockConfig
1056                     ; 93 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
1058  0235 ae0500        	ldw	x,#1280
1059  0238 cd0000        	call	_CLK_PeripheralClockConfig
1061                     ; 94 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, DISABLE);
1063  023b ae0600        	ldw	x,#1536
1064  023e cd0000        	call	_CLK_PeripheralClockConfig
1066                     ; 95 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
1068  0241 ae0400        	ldw	x,#1024
1069  0244 cd0000        	call	_CLK_PeripheralClockConfig
1071                     ; 96 }
1074  0247 81            	ret
1098                     ; 99 void setup_GPIOs(void)
1098                     ; 100 {
1099                     	switch	.text
1100  0248               _setup_GPIOs:
1104                     ; 101 	GPIO_DeInit(SPI_PORT);
1106  0248 ae500a        	ldw	x,#20490
1107  024b cd0000        	call	_GPIO_DeInit
1109                     ; 102 	GPIO_DeInit(CTL_PORT);
1111  024e ae500f        	ldw	x,#20495
1112  0251 cd0000        	call	_GPIO_DeInit
1114                     ; 103 }
1117  0254 81            	ret
1150                     	xdef	_main
1151                     	xdef	_setup_GPIOs
1152                     	xdef	_setup_clock
1153                     	xref	_print_F
1154                     	xref	_print_I
1155                     	xref	_print_C
1156                     	xref	_print_str
1157                     	xref	_Draw_Circle
1158                     	xref	_Draw_Rectangle
1159                     	xref	_Draw_Line
1160                     	xref	_TFT_fill
1161                     	xref	_ST7735_Set_Rotation
1162                     	xref	_ST7735_init
1163                     	xref	_Swap_Colour
1164                     	switch	.ubsct
1165  0000               _length:
1166  0000 0000          	ds.b	2
1167                     	xdef	_length
1168  0002               _width:
1169  0002 0000          	ds.b	2
1170                     	xdef	_width
1171                     	xref	_delay_ms
1172                     	xref	_GPIO_DeInit
1173                     	xref	_CLK_GetFlagStatus
1174                     	xref	_CLK_SYSCLKConfig
1175                     	xref	_CLK_HSIPrescalerConfig
1176                     	xref	_CLK_ClockSwitchConfig
1177                     	xref	_CLK_PeripheralClockConfig
1178                     	xref	_CLK_ClockSwitchCmd
1179                     	xref	_CLK_LSICmd
1180                     	xref	_CLK_HSICmd
1181                     	xref	_CLK_HSECmd
1182                     	xref	_CLK_DeInit
1183                     	switch	.const
1184  01e0               L101:
1185  01e0 3c23d70a      	dc.w	15395,-10486
1186  01e4               L76:
1187  01e4 7777772e6662  	dc.b	"www.fb.com/MicroAr"
1188  01f6 656e6100      	dc.b	"ena",0
1189  01fa               L56:
1190  01fa 4d6963726f41  	dc.b	"MicroArena",0
1191  0205               L16:
1192  0205 bdb851eb      	dc.w	-16968,20971
1193                     	xref.b	c_x
1213                     	xref	c_fgadd
1214                     	xref	c_ltor
1215                     	end
