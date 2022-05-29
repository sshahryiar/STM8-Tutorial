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
 565                     ; 8 unsigned int Swap_Colour(unsigned int colour)
 565                     ; 9 {
 567                     	switch	.text
 568  0000               _Swap_Colour:
 570  0000 89            	pushw	x
 571  0001 5204          	subw	sp,#4
 572       00000004      OFST:	set	4
 575                     ; 10     return ((colour << 0x000B) | (colour & 0x07E0) | (colour >> 0x000B));
 577  0003 4f            	clr	a
 578  0004 01            	rrwa	x,a
 579  0005 54            	srlw	x
 580  0006 54            	srlw	x
 581  0007 54            	srlw	x
 582  0008 1f03          	ldw	(OFST-1,sp),x
 584  000a 1e05          	ldw	x,(OFST+1,sp)
 585  000c 01            	rrwa	x,a
 586  000d a4e0          	and	a,#224
 587  000f 01            	rrwa	x,a
 588  0010 a407          	and	a,#7
 589  0012 01            	rrwa	x,a
 590  0013 1f01          	ldw	(OFST-3,sp),x
 592  0015 1e05          	ldw	x,(OFST+1,sp)
 593  0017 4f            	clr	a
 594  0018 02            	rlwa	x,a
 595  0019 58            	sllw	x
 596  001a 58            	sllw	x
 597  001b 58            	sllw	x
 598  001c 01            	rrwa	x,a
 599  001d 1a02          	or	a,(OFST-2,sp)
 600  001f 01            	rrwa	x,a
 601  0020 1a01          	or	a,(OFST-3,sp)
 602  0022 01            	rrwa	x,a
 603  0023 01            	rrwa	x,a
 604  0024 1a04          	or	a,(OFST+0,sp)
 605  0026 01            	rrwa	x,a
 606  0027 1a03          	or	a,(OFST-1,sp)
 607  0029 01            	rrwa	x,a
 610  002a 5b06          	addw	sp,#6
 611  002c 81            	ret
 663                     ; 14 unsigned int Color565(unsigned char r, unsigned char g, unsigned char b)
 663                     ; 15 {
 664                     	switch	.text
 665  002d               _Color565:
 667  002d 89            	pushw	x
 668  002e 5204          	subw	sp,#4
 669       00000004      OFST:	set	4
 672                     ; 16     return (((r & 0xF8) << 0x08) | ((g & 0xFC) << 0x03) | (b >> 0x03));
 674  0030 7b09          	ld	a,(OFST+5,sp)
 675  0032 44            	srl	a
 676  0033 44            	srl	a
 677  0034 44            	srl	a
 678  0035 5f            	clrw	x
 679  0036 97            	ld	xl,a
 680  0037 1f03          	ldw	(OFST-1,sp),x
 682  0039 7b06          	ld	a,(OFST+2,sp)
 683  003b a4fc          	and	a,#252
 684  003d 97            	ld	xl,a
 685  003e a608          	ld	a,#8
 686  0040 42            	mul	x,a
 687  0041 1f01          	ldw	(OFST-3,sp),x
 689  0043 7b05          	ld	a,(OFST+1,sp)
 690  0045 a4f8          	and	a,#248
 691  0047 5f            	clrw	x
 692  0048 97            	ld	xl,a
 693  0049 4f            	clr	a
 694  004a 02            	rlwa	x,a
 695  004b 01            	rrwa	x,a
 696  004c 1a02          	or	a,(OFST-2,sp)
 697  004e 01            	rrwa	x,a
 698  004f 1a01          	or	a,(OFST-3,sp)
 699  0051 01            	rrwa	x,a
 700  0052 01            	rrwa	x,a
 701  0053 1a04          	or	a,(OFST+0,sp)
 702  0055 01            	rrwa	x,a
 703  0056 1a03          	or	a,(OFST-1,sp)
 704  0058 01            	rrwa	x,a
 707  0059 5b06          	addw	sp,#6
 708  005b 81            	ret
 734                     ; 20 void SPI_setup(void)
 734                     ; 21 {
 735                     	switch	.text
 736  005c               _SPI_setup:
 740                     ; 22     SPI_DeInit();
 742  005c cd0000        	call	_SPI_DeInit
 744                     ; 24     SPI_Init(SPI_FIRSTBIT_MSB, 
 744                     ; 25                   SPI_BAUDRATEPRESCALER_2,
 744                     ; 26                   SPI_MODE_MASTER, 
 744                     ; 27                   SPI_CLOCKPOLARITY_HIGH,
 744                     ; 28                   SPI_CLOCKPHASE_1EDGE, 
 744                     ; 29                   SPI_DATADIRECTION_1LINE_TX, 
 744                     ; 30                   SPI_NSS_SOFT, 
 744                     ; 31                   0x00);
 746  005f 4b00          	push	#0
 747  0061 4b02          	push	#2
 748  0063 4bc0          	push	#192
 749  0065 4b00          	push	#0
 750  0067 4b02          	push	#2
 751  0069 4b04          	push	#4
 752  006b 5f            	clrw	x
 753  006c cd0000        	call	_SPI_Init
 755  006f 5b06          	addw	sp,#6
 756                     ; 33     SPI_Cmd(ENABLE);
 758  0071 a601          	ld	a,#1
 759  0073 cd0000        	call	_SPI_Cmd
 761                     ; 34 }
 764  0076 81            	ret
 790                     ; 37 void ST7735_HW_init(void)
 790                     ; 38 {	
 791                     	switch	.text
 792  0077               _ST7735_HW_init:
 796                     ; 39 	GPIO_Init(SPI_PORT, ((GPIO_Pin_TypeDef)(SCK_pin | SDA_pin)), GPIO_MODE_OUT_PP_HIGH_FAST);
 798  0077 4bf0          	push	#240
 799  0079 4b60          	push	#96
 800  007b ae500a        	ldw	x,#20490
 801  007e cd0000        	call	_GPIO_Init
 803  0081 85            	popw	x
 804                     ; 40     GPIO_Init(CTL_PORT, ((GPIO_Pin_TypeDef)(CS_pin | RS_pin | RST_pin)), GPIO_MODE_OUT_PP_HIGH_FAST);
 806  0082 4bf0          	push	#240
 807  0084 4be0          	push	#224
 808  0086 ae500f        	ldw	x,#20495
 809  0089 cd0000        	call	_GPIO_Init
 811  008c 85            	popw	x
 812                     ; 41     SPI_setup();
 814  008d adcd          	call	_SPI_setup
 816                     ; 42     delay_ms(10);    
 818  008f ae000a        	ldw	x,#10
 819  0092 cd0000        	call	_delay_ms
 821                     ; 43 }
 824  0095 81            	ret
 871                     ; 46 void ST7735_Write(unsigned char value, unsigned char mode)
 871                     ; 47 {
 872                     	switch	.text
 873  0096               _ST7735_Write:
 875  0096 89            	pushw	x
 876       00000000      OFST:	set	0
 879  0097               L341:
 880                     ; 48     while(SPI_GetFlagStatus(SPI_FLAG_BSY));
 882  0097 a680          	ld	a,#128
 883  0099 cd0000        	call	_SPI_GetFlagStatus
 885  009c 4d            	tnz	a
 886  009d 26f8          	jrne	L341
 887                     ; 49     GPIO_WriteLow(CTL_PORT, CS_pin);
 889  009f 4b80          	push	#128
 890  00a1 ae500f        	ldw	x,#20495
 891  00a4 cd0000        	call	_GPIO_WriteLow
 893  00a7 84            	pop	a
 894                     ; 51 	 switch(mode)
 896  00a8 7b02          	ld	a,(OFST+2,sp)
 898                     ; 62             break;
 899  00aa 4d            	tnz	a
 900  00ab 2705          	jreq	L311
 901  00ad 4a            	dec	a
 902  00ae 270d          	jreq	L511
 903  00b0 2014          	jra	L151
 904  00b2               L311:
 905                     ; 55             GPIO_WriteLow(CTL_PORT, RS_pin);
 907  00b2 4b20          	push	#32
 908  00b4 ae500f        	ldw	x,#20495
 909  00b7 cd0000        	call	_GPIO_WriteLow
 911  00ba 84            	pop	a
 912                     ; 56             break;
 914  00bb 2009          	jra	L151
 915  00bd               L511:
 916                     ; 61             GPIO_WriteHigh(CTL_PORT, RS_pin);
 918  00bd 4b20          	push	#32
 919  00bf ae500f        	ldw	x,#20495
 920  00c2 cd0000        	call	_GPIO_WriteHigh
 922  00c5 84            	pop	a
 923                     ; 62             break;
 925  00c6               L151:
 926                     ; 66     SPI_SendData(value);
 928  00c6 7b01          	ld	a,(OFST+1,sp)
 929  00c8 cd0000        	call	_SPI_SendData
 932  00cb               L551:
 933                     ; 67     while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
 935  00cb a602          	ld	a,#2
 936  00cd cd0000        	call	_SPI_GetFlagStatus
 938  00d0 4d            	tnz	a
 939  00d1 27f8          	jreq	L551
 940                     ; 69     GPIO_WriteHigh(CTL_PORT, CS_pin);
 942  00d3 4b80          	push	#128
 943  00d5 ae500f        	ldw	x,#20495
 944  00d8 cd0000        	call	_GPIO_WriteHigh
 946  00db 84            	pop	a
 947                     ; 70 }
 950  00dc 85            	popw	x
 951  00dd 81            	ret
 977                     ; 73 void ST7735_Reset(void)
 977                     ; 74 {
 978                     	switch	.text
 979  00de               _ST7735_Reset:
 983                     ; 75     GPIO_WriteLow(CTL_PORT, RST_pin);
 985  00de 4b40          	push	#64
 986  00e0 ae500f        	ldw	x,#20495
 987  00e3 cd0000        	call	_GPIO_WriteLow
 989  00e6 84            	pop	a
 990                     ; 76     delay_ms(2);
 992  00e7 ae0002        	ldw	x,#2
 993  00ea cd0000        	call	_delay_ms
 995                     ; 77     GPIO_WriteHigh(CTL_PORT, RST_pin);
 997  00ed 4b40          	push	#64
 998  00ef ae500f        	ldw	x,#20495
 999  00f2 cd0000        	call	_GPIO_WriteHigh
1001  00f5 84            	pop	a
1002                     ; 78     delay_ms(2);
1004  00f6 ae0002        	ldw	x,#2
1005  00f9 cd0000        	call	_delay_ms
1007                     ; 79 }
1010  00fc 81            	ret
1039                     ; 82 void ST7735_init(void)
1039                     ; 83 {
1040                     	switch	.text
1041  00fd               _ST7735_init:
1045                     ; 84     ST7735_HW_init();
1047  00fd cd0077        	call	_ST7735_HW_init
1049                     ; 85 	ST7735_Reset();
1051  0100 addc          	call	_ST7735_Reset
1053                     ; 87     ST7735_Write(ST7735_SWRESET, CMD);
1055  0102 ae0100        	ldw	x,#256
1056  0105 ad8f          	call	_ST7735_Write
1058                     ; 88     delay_us(150);
1060  0107 ae0096        	ldw	x,#150
1061  010a cd0000        	call	_delay_us
1063                     ; 89     ST7735_Write(ST7735_SLPOUT, CMD);
1065  010d ae1100        	ldw	x,#4352
1066  0110 ad84          	call	_ST7735_Write
1068                     ; 90     delay_us(150);
1070  0112 ae0096        	ldw	x,#150
1071  0115 cd0000        	call	_delay_us
1073                     ; 92     ST7735_Write(ST7735_FRMCTR1, CMD);
1075  0118 aeb100        	ldw	x,#45312
1076  011b cd0096        	call	_ST7735_Write
1078                     ; 93     ST7735_Write(0x01, DAT);
1080  011e ae0101        	ldw	x,#257
1081  0121 cd0096        	call	_ST7735_Write
1083                     ; 94     ST7735_Write(0x2C, DAT);
1085  0124 ae2c01        	ldw	x,#11265
1086  0127 cd0096        	call	_ST7735_Write
1088                     ; 95     ST7735_Write(0x2D, DAT);
1090  012a ae2d01        	ldw	x,#11521
1091  012d cd0096        	call	_ST7735_Write
1093                     ; 97     ST7735_Write(ST7735_FRMCTR2, CMD);
1095  0130 aeb200        	ldw	x,#45568
1096  0133 cd0096        	call	_ST7735_Write
1098                     ; 98     ST7735_Write(0x01, DAT);
1100  0136 ae0101        	ldw	x,#257
1101  0139 cd0096        	call	_ST7735_Write
1103                     ; 99     ST7735_Write(0x2C, DAT);
1105  013c ae2c01        	ldw	x,#11265
1106  013f cd0096        	call	_ST7735_Write
1108                     ; 100     ST7735_Write(0x2D, DAT);
1110  0142 ae2d01        	ldw	x,#11521
1111  0145 cd0096        	call	_ST7735_Write
1113                     ; 102     ST7735_Write(ST7735_FRMCTR3, CMD);
1115  0148 aeb300        	ldw	x,#45824
1116  014b cd0096        	call	_ST7735_Write
1118                     ; 103     ST7735_Write(0x01, DAT);
1120  014e ae0101        	ldw	x,#257
1121  0151 cd0096        	call	_ST7735_Write
1123                     ; 104     ST7735_Write(0x2C, DAT); 
1125  0154 ae2c01        	ldw	x,#11265
1126  0157 cd0096        	call	_ST7735_Write
1128                     ; 105     ST7735_Write(0x2D, DAT);
1130  015a ae2d01        	ldw	x,#11521
1131  015d cd0096        	call	_ST7735_Write
1133                     ; 106     ST7735_Write(0x01, DAT);
1135  0160 ae0101        	ldw	x,#257
1136  0163 cd0096        	call	_ST7735_Write
1138                     ; 107     ST7735_Write(0x2C, DAT);
1140  0166 ae2c01        	ldw	x,#11265
1141  0169 cd0096        	call	_ST7735_Write
1143                     ; 108     ST7735_Write(0x2D, DAT);
1145  016c ae2d01        	ldw	x,#11521
1146  016f cd0096        	call	_ST7735_Write
1148                     ; 110     ST7735_Write(ST7735_INVCTR, CMD);
1150  0172 aeb400        	ldw	x,#46080
1151  0175 cd0096        	call	_ST7735_Write
1153                     ; 111     ST7735_Write(0x07, DAT);
1155  0178 ae0701        	ldw	x,#1793
1156  017b cd0096        	call	_ST7735_Write
1158                     ; 113     ST7735_Write(ST7735_PWCTR1, CMD);
1160  017e aec000        	ldw	x,#49152
1161  0181 cd0096        	call	_ST7735_Write
1163                     ; 114     ST7735_Write(0xA2, DAT); 
1165  0184 aea201        	ldw	x,#41473
1166  0187 cd0096        	call	_ST7735_Write
1168                     ; 115     ST7735_Write(0x02, DAT); 
1170  018a ae0201        	ldw	x,#513
1171  018d cd0096        	call	_ST7735_Write
1173                     ; 116     ST7735_Write(0x84, DAT);
1175  0190 ae8401        	ldw	x,#33793
1176  0193 cd0096        	call	_ST7735_Write
1178                     ; 118     ST7735_Write(ST7735_PWCTR1, CMD);
1180  0196 aec000        	ldw	x,#49152
1181  0199 cd0096        	call	_ST7735_Write
1183                     ; 119     ST7735_Write(0xC5, DAT);
1185  019c aec501        	ldw	x,#50433
1186  019f cd0096        	call	_ST7735_Write
1188                     ; 121     ST7735_Write(ST7735_PWCTR2, CMD);
1190  01a2 aec100        	ldw	x,#49408
1191  01a5 cd0096        	call	_ST7735_Write
1193                     ; 122     ST7735_Write(0x0A, DAT);
1195  01a8 ae0a01        	ldw	x,#2561
1196  01ab cd0096        	call	_ST7735_Write
1198                     ; 123     ST7735_Write(0x00, DAT);
1200  01ae ae0001        	ldw	x,#1
1201  01b1 cd0096        	call	_ST7735_Write
1203                     ; 125     ST7735_Write(ST7735_PWCTR3, CMD);
1205  01b4 aec200        	ldw	x,#49664
1206  01b7 cd0096        	call	_ST7735_Write
1208                     ; 126     ST7735_Write(0x8A, DAT);
1210  01ba ae8a01        	ldw	x,#35329
1211  01bd cd0096        	call	_ST7735_Write
1213                     ; 127     ST7735_Write(0x2A, DAT);
1215  01c0 ae2a01        	ldw	x,#10753
1216  01c3 cd0096        	call	_ST7735_Write
1218                     ; 129     ST7735_Write(ST7735_PWCTR4, CMD);
1220  01c6 aec300        	ldw	x,#49920
1221  01c9 cd0096        	call	_ST7735_Write
1223                     ; 130     ST7735_Write(0x8A, DAT);
1225  01cc ae8a01        	ldw	x,#35329
1226  01cf cd0096        	call	_ST7735_Write
1228                     ; 131     ST7735_Write(0xEE, DAT);
1230  01d2 aeee01        	ldw	x,#60929
1231  01d5 cd0096        	call	_ST7735_Write
1233                     ; 133     ST7735_Write(ST7735_PWCTR5, CMD);
1235  01d8 aec400        	ldw	x,#50176
1236  01db cd0096        	call	_ST7735_Write
1238                     ; 134     ST7735_Write(0x0E, DAT);
1240  01de ae0e01        	ldw	x,#3585
1241  01e1 cd0096        	call	_ST7735_Write
1243                     ; 136     ST7735_Write(ST7735_VMCTR1, CMD);
1245  01e4 aec500        	ldw	x,#50432
1246  01e7 cd0096        	call	_ST7735_Write
1248                     ; 137     ST7735_Write(0x00, DAT);
1250  01ea ae0001        	ldw	x,#1
1251  01ed cd0096        	call	_ST7735_Write
1253                     ; 139     ST7735_Write(ST7735_COLMOD, CMD);
1255  01f0 ae3a00        	ldw	x,#14848
1256  01f3 cd0096        	call	_ST7735_Write
1258                     ; 140     ST7735_Write(0x05, DAT);
1260  01f6 ae0501        	ldw	x,#1281
1261  01f9 cd0096        	call	_ST7735_Write
1263                     ; 142     ST7735_Write(ST7735_MADCTL, CMD);
1265  01fc ae3600        	ldw	x,#13824
1266  01ff cd0096        	call	_ST7735_Write
1268                     ; 143     ST7735_Write(0xC8, DAT);
1270  0202 aec801        	ldw	x,#51201
1271  0205 cd0096        	call	_ST7735_Write
1273                     ; 145     ST7735_RAM_Address_Set();
1275  0208 cd0363        	call	_ST7735_RAM_Address_Set
1277                     ; 147     ST7735_Write(ST7735_GMCTRP1, CMD);
1279  020b aee000        	ldw	x,#57344
1280  020e cd0096        	call	_ST7735_Write
1282                     ; 148     ST7735_Write(0x02, DAT);
1284  0211 ae0201        	ldw	x,#513
1285  0214 cd0096        	call	_ST7735_Write
1287                     ; 149     ST7735_Write(0x1C, DAT);
1289  0217 ae1c01        	ldw	x,#7169
1290  021a cd0096        	call	_ST7735_Write
1292                     ; 150     ST7735_Write(0x07, DAT);
1294  021d ae0701        	ldw	x,#1793
1295  0220 cd0096        	call	_ST7735_Write
1297                     ; 151     ST7735_Write(0x12, DAT);
1299  0223 ae1201        	ldw	x,#4609
1300  0226 cd0096        	call	_ST7735_Write
1302                     ; 152     ST7735_Write(0x37, DAT);
1304  0229 ae3701        	ldw	x,#14081
1305  022c cd0096        	call	_ST7735_Write
1307                     ; 153     ST7735_Write(0x32, DAT);
1309  022f ae3201        	ldw	x,#12801
1310  0232 cd0096        	call	_ST7735_Write
1312                     ; 154     ST7735_Write(0x29, DAT);
1314  0235 ae2901        	ldw	x,#10497
1315  0238 cd0096        	call	_ST7735_Write
1317                     ; 155     ST7735_Write(0x2D, DAT);
1319  023b ae2d01        	ldw	x,#11521
1320  023e cd0096        	call	_ST7735_Write
1322                     ; 156     ST7735_Write(0x29, DAT);
1324  0241 ae2901        	ldw	x,#10497
1325  0244 cd0096        	call	_ST7735_Write
1327                     ; 157     ST7735_Write(0x25, DAT);
1329  0247 ae2501        	ldw	x,#9473
1330  024a cd0096        	call	_ST7735_Write
1332                     ; 158     ST7735_Write(0x2B, DAT);
1334  024d ae2b01        	ldw	x,#11009
1335  0250 cd0096        	call	_ST7735_Write
1337                     ; 159     ST7735_Write(0x39, DAT);
1339  0253 ae3901        	ldw	x,#14593
1340  0256 cd0096        	call	_ST7735_Write
1342                     ; 160     ST7735_Write(0x00, DAT);
1344  0259 ae0001        	ldw	x,#1
1345  025c cd0096        	call	_ST7735_Write
1347                     ; 161     ST7735_Write(0x01, DAT);
1349  025f ae0101        	ldw	x,#257
1350  0262 cd0096        	call	_ST7735_Write
1352                     ; 162     ST7735_Write(0x03, DAT);
1354  0265 ae0301        	ldw	x,#769
1355  0268 cd0096        	call	_ST7735_Write
1357                     ; 163     ST7735_Write(0x10, DAT);
1359  026b ae1001        	ldw	x,#4097
1360  026e cd0096        	call	_ST7735_Write
1362                     ; 165     ST7735_Write(ST7735_GMCTRN1, CMD);
1364  0271 aee100        	ldw	x,#57600
1365  0274 cd0096        	call	_ST7735_Write
1367                     ; 166     ST7735_Write(0x03, DAT);
1369  0277 ae0301        	ldw	x,#769
1370  027a cd0096        	call	_ST7735_Write
1372                     ; 167     ST7735_Write(0x1D, DAT);
1374  027d ae1d01        	ldw	x,#7425
1375  0280 cd0096        	call	_ST7735_Write
1377                     ; 168     ST7735_Write(0x07, DAT);
1379  0283 ae0701        	ldw	x,#1793
1380  0286 cd0096        	call	_ST7735_Write
1382                     ; 169     ST7735_Write(0x06, DAT);
1384  0289 ae0601        	ldw	x,#1537
1385  028c cd0096        	call	_ST7735_Write
1387                     ; 170     ST7735_Write(0x2E, DAT);
1389  028f ae2e01        	ldw	x,#11777
1390  0292 cd0096        	call	_ST7735_Write
1392                     ; 171     ST7735_Write(0x2C, DAT);
1394  0295 ae2c01        	ldw	x,#11265
1395  0298 cd0096        	call	_ST7735_Write
1397                     ; 172     ST7735_Write(0x29, DAT);
1399  029b ae2901        	ldw	x,#10497
1400  029e cd0096        	call	_ST7735_Write
1402                     ; 173     ST7735_Write(0x2D, DAT);
1404  02a1 ae2d01        	ldw	x,#11521
1405  02a4 cd0096        	call	_ST7735_Write
1407                     ; 174     ST7735_Write(0x2E, DAT);
1409  02a7 ae2e01        	ldw	x,#11777
1410  02aa cd0096        	call	_ST7735_Write
1412                     ; 175     ST7735_Write(0x2E, DAT);
1414  02ad ae2e01        	ldw	x,#11777
1415  02b0 cd0096        	call	_ST7735_Write
1417                     ; 176     ST7735_Write(0x37, DAT);
1419  02b3 ae3701        	ldw	x,#14081
1420  02b6 cd0096        	call	_ST7735_Write
1422                     ; 177     ST7735_Write(0x3F, DAT);
1424  02b9 ae3f01        	ldw	x,#16129
1425  02bc cd0096        	call	_ST7735_Write
1427                     ; 178     ST7735_Write(0x00, DAT);
1429  02bf ae0001        	ldw	x,#1
1430  02c2 cd0096        	call	_ST7735_Write
1432                     ; 179     ST7735_Write(0x00, DAT);
1434  02c5 ae0001        	ldw	x,#1
1435  02c8 cd0096        	call	_ST7735_Write
1437                     ; 180     ST7735_Write(0x02, DAT);
1439  02cb ae0201        	ldw	x,#513
1440  02ce cd0096        	call	_ST7735_Write
1442                     ; 181     ST7735_Write(0x10, DAT);
1444  02d1 ae1001        	ldw	x,#4097
1445  02d4 cd0096        	call	_ST7735_Write
1447                     ; 183     ST7735_Write(ST7735_NORON, CMD);
1449  02d7 ae1300        	ldw	x,#4864
1450  02da cd0096        	call	_ST7735_Write
1452                     ; 184     delay_ms(10);
1454  02dd ae000a        	ldw	x,#10
1455  02e0 cd0000        	call	_delay_ms
1457                     ; 186     ST7735_Write(ST7735_DISPON, CMD);
1459  02e3 ae2900        	ldw	x,#10496
1460  02e6 cd0096        	call	_ST7735_Write
1462                     ; 187     delay_ms(100);
1464  02e9 ae0064        	ldw	x,#100
1465  02ec cd0000        	call	_delay_ms
1467                     ; 189     ST7735_Write(ST7735_RAMWR, CMD);
1469  02ef ae2c00        	ldw	x,#11264
1470  02f2 cd0096        	call	_ST7735_Write
1472                     ; 190     delay_ms(100);
1474  02f5 ae0064        	ldw	x,#100
1475  02f8 cd0000        	call	_delay_ms
1477                     ; 191 }
1480  02fb 81            	ret
1515                     ; 194 void ST7735_Word_Write(unsigned int value)
1515                     ; 195 {
1516                     	switch	.text
1517  02fc               _ST7735_Word_Write:
1519  02fc 89            	pushw	x
1520       00000000      OFST:	set	0
1523                     ; 196     ST7735_Write(((value & 0xFF00) >> 0x08), DAT);
1525  02fd 9e            	ld	a,xh
1526  02fe ae0001        	ldw	x,#1
1527  0301 95            	ld	xh,a
1528  0302 cd0096        	call	_ST7735_Write
1530                     ; 197     ST7735_Write((value & 0x00FF), DAT);
1532  0305 7b02          	ld	a,(OFST+2,sp)
1533  0307 a4ff          	and	a,#255
1534  0309 ae0001        	ldw	x,#1
1535  030c 95            	ld	xh,a
1536  030d cd0096        	call	_ST7735_Write
1538                     ; 198 }
1541  0310 85            	popw	x
1542  0311 81            	ret
1605                     ; 201 void ST7735_Set_Addr_Window(signed int xs, signed int ys, signed int xe, signed int ye)
1605                     ; 202 {
1606                     	switch	.text
1607  0312               _ST7735_Set_Addr_Window:
1609  0312 89            	pushw	x
1610       00000000      OFST:	set	0
1613                     ; 203     ST7735_Write(ST7735_CASET, CMD);
1615  0313 ae2a00        	ldw	x,#10752
1616  0316 cd0096        	call	_ST7735_Write
1618                     ; 204     ST7735_Write(0x00, DAT);
1620  0319 ae0001        	ldw	x,#1
1621  031c cd0096        	call	_ST7735_Write
1623                     ; 205     ST7735_Write(xs, DAT);
1625  031f 7b02          	ld	a,(OFST+2,sp)
1626  0321 ae0001        	ldw	x,#1
1627  0324 95            	ld	xh,a
1628  0325 cd0096        	call	_ST7735_Write
1630                     ; 206     ST7735_Write(0x00, DAT);
1632  0328 ae0001        	ldw	x,#1
1633  032b cd0096        	call	_ST7735_Write
1635                     ; 207     ST7735_Write(xe, DAT);
1637  032e 7b08          	ld	a,(OFST+8,sp)
1638  0330 ae0001        	ldw	x,#1
1639  0333 95            	ld	xh,a
1640  0334 cd0096        	call	_ST7735_Write
1642                     ; 209     ST7735_Write(ST7735_RASET, CMD);
1644  0337 ae2b00        	ldw	x,#11008
1645  033a cd0096        	call	_ST7735_Write
1647                     ; 210     ST7735_Write(0x00, DAT);
1649  033d ae0001        	ldw	x,#1
1650  0340 cd0096        	call	_ST7735_Write
1652                     ; 211     ST7735_Write(ys, DAT);
1654  0343 7b06          	ld	a,(OFST+6,sp)
1655  0345 ae0001        	ldw	x,#1
1656  0348 95            	ld	xh,a
1657  0349 cd0096        	call	_ST7735_Write
1659                     ; 212     ST7735_Write(0x00, DAT);
1661  034c ae0001        	ldw	x,#1
1662  034f cd0096        	call	_ST7735_Write
1664                     ; 213     ST7735_Write(ye, DAT);
1666  0352 7b0a          	ld	a,(OFST+10,sp)
1667  0354 ae0001        	ldw	x,#1
1668  0357 95            	ld	xh,a
1669  0358 cd0096        	call	_ST7735_Write
1671                     ; 215     ST7735_Write(ST7735_RAMWR, CMD);
1673  035b ae2c00        	ldw	x,#11264
1674  035e cd0096        	call	_ST7735_Write
1676                     ; 216 }
1679  0361 85            	popw	x
1680  0362 81            	ret
1705                     ; 219 void ST7735_RAM_Address_Set(void)
1705                     ; 220 {
1706                     	switch	.text
1707  0363               _ST7735_RAM_Address_Set:
1711                     ; 221      ST7735_Set_Addr_Window(0x00, 0x00, 0x7F, 0x9F);
1713  0363 ae009f        	ldw	x,#159
1714  0366 89            	pushw	x
1715  0367 ae007f        	ldw	x,#127
1716  036a 89            	pushw	x
1717  036b 5f            	clrw	x
1718  036c 89            	pushw	x
1719  036d 5f            	clrw	x
1720  036e ada2          	call	_ST7735_Set_Addr_Window
1722  0370 5b06          	addw	sp,#6
1723                     ; 222 }
1726  0372 81            	ret
1762                     ; 225 void ST7735_Invert_Display(unsigned char i)
1762                     ; 226 {	 
1763                     	switch	.text
1764  0373               _ST7735_Invert_Display:
1768                     ; 227 	 ST7735_Write(i, CMD);
1770  0373 5f            	clrw	x
1771  0374 95            	ld	xh,a
1772  0375 cd0096        	call	_ST7735_Write
1774                     ; 228 }
1777  0378 81            	ret
1824                     ; 231 void ST7735_Set_Rotation(unsigned char m)
1824                     ; 232 {
1825                     	switch	.text
1826  0379               _ST7735_Set_Rotation:
1828  0379 88            	push	a
1829  037a 88            	push	a
1830       00000001      OFST:	set	1
1833                     ; 233     unsigned char rotation = 0x00;
1835                     ; 235     ST7735_Write(ST7735_MADCTL, CMD);
1837  037b ae3600        	ldw	x,#13824
1838  037e cd0096        	call	_ST7735_Write
1840                     ; 236     rotation = (m % 4);
1842  0381 7b02          	ld	a,(OFST+1,sp)
1843  0383 a403          	and	a,#3
1844  0385 6b01          	ld	(OFST+0,sp),a
1846                     ; 238     switch(rotation)
1848  0387 7b01          	ld	a,(OFST+0,sp)
1850                     ; 266             break;
1851  0389 4d            	tnz	a
1852  038a 270b          	jreq	L772
1853  038c 4a            	dec	a
1854  038d 271a          	jreq	L103
1855  038f 4a            	dec	a
1856  0390 2729          	jreq	L303
1857  0392 4a            	dec	a
1858  0393 2738          	jreq	L503
1859  0395 2046          	jra	L333
1860  0397               L772:
1861                     ; 242             ST7735_Write((MADCTL_MX | MADCTL_MY | MADCTL_RGB), DAT);
1863  0397 aec801        	ldw	x,#51201
1864  039a cd0096        	call	_ST7735_Write
1866                     ; 243             width  = ST7735_TFTWIDTH;
1868  039d ae0080        	ldw	x,#128
1869  03a0 bf00          	ldw	_width,x
1870                     ; 244             length = ST7735_TFTLENGTH;
1872  03a2 ae00a0        	ldw	x,#160
1873  03a5 bf00          	ldw	_length,x
1874                     ; 245             break;
1876  03a7 2034          	jra	L333
1877  03a9               L103:
1878                     ; 249             ST7735_Write((MADCTL_MY | MADCTL_MV | MADCTL_RGB), DAT);
1880  03a9 aea801        	ldw	x,#43009
1881  03ac cd0096        	call	_ST7735_Write
1883                     ; 250             width  = ST7735_TFTLENGTH;
1885  03af ae00a0        	ldw	x,#160
1886  03b2 bf00          	ldw	_width,x
1887                     ; 251             length = ST7735_TFTWIDTH;
1889  03b4 ae0080        	ldw	x,#128
1890  03b7 bf00          	ldw	_length,x
1891                     ; 252             break;
1893  03b9 2022          	jra	L333
1894  03bb               L303:
1895                     ; 256             ST7735_Write((MADCTL_RGB), DAT);
1897  03bb ae0801        	ldw	x,#2049
1898  03be cd0096        	call	_ST7735_Write
1900                     ; 257             width = ST7735_TFTWIDTH;
1902  03c1 ae0080        	ldw	x,#128
1903  03c4 bf00          	ldw	_width,x
1904                     ; 258             length = ST7735_TFTLENGTH;
1906  03c6 ae00a0        	ldw	x,#160
1907  03c9 bf00          	ldw	_length,x
1908                     ; 259             break;
1910  03cb 2010          	jra	L333
1911  03cd               L503:
1912                     ; 263             ST7735_Write((MADCTL_MX | MADCTL_MV | MADCTL_RGB), DAT);
1914  03cd ae6801        	ldw	x,#26625
1915  03d0 cd0096        	call	_ST7735_Write
1917                     ; 264             width = ST7735_TFTLENGTH;
1919  03d3 ae00a0        	ldw	x,#160
1920  03d6 bf00          	ldw	_width,x
1921                     ; 265             length = ST7735_TFTWIDTH;
1923  03d8 ae0080        	ldw	x,#128
1924  03db bf00          	ldw	_length,x
1925                     ; 266             break;
1927  03dd               L333:
1928                     ; 269 }
1931  03dd 85            	popw	x
1932  03de 81            	ret
1988                     ; 272 void TFT_fill(unsigned int colour)
1988                     ; 273 {
1989                     	switch	.text
1990  03df               _TFT_fill:
1992  03df 89            	pushw	x
1993  03e0 5204          	subw	sp,#4
1994       00000004      OFST:	set	4
1997                     ; 274     signed int i = 0x00;
1999                     ; 275     signed int j = 0x00;
2001                     ; 277     ST7735_Set_Addr_Window(0, 0, (width - 1), (length - 1));
2003  03e2 be00          	ldw	x,_length
2004  03e4 5a            	decw	x
2005  03e5 89            	pushw	x
2006  03e6 be00          	ldw	x,_width
2007  03e8 5a            	decw	x
2008  03e9 89            	pushw	x
2009  03ea 5f            	clrw	x
2010  03eb 89            	pushw	x
2011  03ec 5f            	clrw	x
2012  03ed cd0312        	call	_ST7735_Set_Addr_Window
2014  03f0 5b06          	addw	sp,#6
2015                     ; 279     for(j = length; j > 0; j--)
2017  03f2 be00          	ldw	x,_length
2018  03f4 1f01          	ldw	(OFST-3,sp),x
2021  03f6 201e          	jra	L763
2022  03f8               L363:
2023                     ; 281         for(i = width; i > 0; i--)
2025  03f8 be00          	ldw	x,_width
2026  03fa 1f03          	ldw	(OFST-1,sp),x
2029  03fc 200c          	jra	L773
2030  03fe               L373:
2031                     ; 283             ST7735_Word_Write(colour);
2033  03fe 1e05          	ldw	x,(OFST+1,sp)
2034  0400 cd02fc        	call	_ST7735_Word_Write
2036                     ; 281         for(i = width; i > 0; i--)
2038  0403 1e03          	ldw	x,(OFST-1,sp)
2039  0405 1d0001        	subw	x,#1
2040  0408 1f03          	ldw	(OFST-1,sp),x
2042  040a               L773:
2045  040a 9c            	rvf
2046  040b 1e03          	ldw	x,(OFST-1,sp)
2047  040d 2cef          	jrsgt	L373
2048                     ; 279     for(j = length; j > 0; j--)
2050  040f 1e01          	ldw	x,(OFST-3,sp)
2051  0411 1d0001        	subw	x,#1
2052  0414 1f01          	ldw	(OFST-3,sp),x
2054  0416               L763:
2057  0416 9c            	rvf
2058  0417 1e01          	ldw	x,(OFST-3,sp)
2059  0419 2cdd          	jrsgt	L363
2060                     ; 286 }
2063  041b 5b06          	addw	sp,#6
2064  041d 81            	ret
2118                     ; 289 void Draw_Pixel(signed int x_pos, signed int y_pos, unsigned int colour)
2118                     ; 290 {
2119                     	switch	.text
2120  041e               _Draw_Pixel:
2122  041e 89            	pushw	x
2123       00000000      OFST:	set	0
2126                     ; 291      ST7735_Set_Addr_Window(x_pos, y_pos, (1 + x_pos), (1 + y_pos));
2128  041f 1e05          	ldw	x,(OFST+5,sp)
2129  0421 5c            	incw	x
2130  0422 89            	pushw	x
2131  0423 1e03          	ldw	x,(OFST+3,sp)
2132  0425 5c            	incw	x
2133  0426 89            	pushw	x
2134  0427 1e09          	ldw	x,(OFST+9,sp)
2135  0429 89            	pushw	x
2136  042a 1e07          	ldw	x,(OFST+7,sp)
2137  042c cd0312        	call	_ST7735_Set_Addr_Window
2139  042f 5b06          	addw	sp,#6
2140                     ; 292      ST7735_Word_Write(colour);
2142  0431 1e07          	ldw	x,(OFST+7,sp)
2143  0433 cd02fc        	call	_ST7735_Word_Write
2145                     ; 293 }
2148  0436 85            	popw	x
2149  0437 81            	ret
2265                     ; 296 void Draw_Line(signed int x1, signed int y1, signed int x2, signed int y2, unsigned int colour)
2265                     ; 297 {
2266                     	switch	.text
2267  0438               _Draw_Line:
2269  0438 89            	pushw	x
2270  0439 520c          	subw	sp,#12
2271       0000000c      OFST:	set	12
2274                     ; 298     signed int dx = 0x0000;
2276                     ; 299     signed int dy = 0x0000;
2278                     ; 300     signed int stepx = 0x0000;
2280                     ; 301     signed int stepy = 0x0000;
2282                     ; 302     signed int fraction = 0x0000;
2284                     ; 304     dy = (y2 - y1);
2286  043b 1e15          	ldw	x,(OFST+9,sp)
2287  043d 72f011        	subw	x,(OFST+5,sp)
2288  0440 1f09          	ldw	(OFST-3,sp),x
2290                     ; 305     dx = (x2 - x1);
2292  0442 1e13          	ldw	x,(OFST+7,sp)
2293  0444 72f00d        	subw	x,(OFST+1,sp)
2294  0447 1f07          	ldw	(OFST-5,sp),x
2296                     ; 307     if (dy < 0)
2298  0449 9c            	rvf
2299  044a 1e09          	ldw	x,(OFST-3,sp)
2300  044c 2e0c          	jrsge	L315
2301                     ; 309         dy = -dy;
2303  044e 1e09          	ldw	x,(OFST-3,sp)
2304  0450 50            	negw	x
2305  0451 1f09          	ldw	(OFST-3,sp),x
2307                     ; 310         stepy = -1;
2309  0453 aeffff        	ldw	x,#65535
2310  0456 1f05          	ldw	(OFST-7,sp),x
2313  0458 2005          	jra	L515
2314  045a               L315:
2315                     ; 314         stepy = 1;
2317  045a ae0001        	ldw	x,#1
2318  045d 1f05          	ldw	(OFST-7,sp),x
2320  045f               L515:
2321                     ; 317     if (dx < 0)
2323  045f 9c            	rvf
2324  0460 1e07          	ldw	x,(OFST-5,sp)
2325  0462 2e0c          	jrsge	L715
2326                     ; 319         dx = -dx;
2328  0464 1e07          	ldw	x,(OFST-5,sp)
2329  0466 50            	negw	x
2330  0467 1f07          	ldw	(OFST-5,sp),x
2332                     ; 320         stepx = -1;
2334  0469 aeffff        	ldw	x,#65535
2335  046c 1f03          	ldw	(OFST-9,sp),x
2338  046e 2005          	jra	L125
2339  0470               L715:
2340                     ; 324         stepx = 1;
2342  0470 ae0001        	ldw	x,#1
2343  0473 1f03          	ldw	(OFST-9,sp),x
2345  0475               L125:
2346                     ; 327     dx <<= 0x01;
2348  0475 0808          	sll	(OFST-4,sp)
2349  0477 0907          	rlc	(OFST-5,sp)
2351                     ; 328     dy <<= 0x01;
2353  0479 080a          	sll	(OFST-2,sp)
2354  047b 0909          	rlc	(OFST-3,sp)
2356                     ; 330     Draw_Pixel(x1, y1, colour);
2358  047d 1e17          	ldw	x,(OFST+11,sp)
2359  047f 89            	pushw	x
2360  0480 1e13          	ldw	x,(OFST+7,sp)
2361  0482 89            	pushw	x
2362  0483 1e11          	ldw	x,(OFST+5,sp)
2363  0485 ad97          	call	_Draw_Pixel
2365  0487 5b04          	addw	sp,#4
2366                     ; 332     if (dx > dy)
2368  0489 9c            	rvf
2369  048a 1e07          	ldw	x,(OFST-5,sp)
2370  048c 1309          	cpw	x,(OFST-3,sp)
2371  048e 2d45          	jrsle	L325
2372                     ; 334         fraction = (dy - (dx >> 1));
2374  0490 1e07          	ldw	x,(OFST-5,sp)
2375  0492 57            	sraw	x
2376  0493 1f01          	ldw	(OFST-11,sp),x
2378  0495 1e09          	ldw	x,(OFST-3,sp)
2379  0497 72f001        	subw	x,(OFST-11,sp)
2380  049a 1f0b          	ldw	(OFST-1,sp),x
2383  049c 202e          	jra	L135
2384  049e               L525:
2385                     ; 337             if (fraction >= 0)
2387  049e 9c            	rvf
2388  049f 1e0b          	ldw	x,(OFST-1,sp)
2389  04a1 2f0e          	jrslt	L535
2390                     ; 339                 y1 += stepy;
2392  04a3 1e11          	ldw	x,(OFST+5,sp)
2393  04a5 72fb05        	addw	x,(OFST-7,sp)
2394  04a8 1f11          	ldw	(OFST+5,sp),x
2395                     ; 340                 fraction -= dx;
2397  04aa 1e0b          	ldw	x,(OFST-1,sp)
2398  04ac 72f007        	subw	x,(OFST-5,sp)
2399  04af 1f0b          	ldw	(OFST-1,sp),x
2401  04b1               L535:
2402                     ; 342             x1 += stepx;
2404  04b1 1e0d          	ldw	x,(OFST+1,sp)
2405  04b3 72fb03        	addw	x,(OFST-9,sp)
2406  04b6 1f0d          	ldw	(OFST+1,sp),x
2407                     ; 343             fraction += dy;
2409  04b8 1e0b          	ldw	x,(OFST-1,sp)
2410  04ba 72fb09        	addw	x,(OFST-3,sp)
2411  04bd 1f0b          	ldw	(OFST-1,sp),x
2413                     ; 345             Draw_Pixel(x1, y1, colour);
2415  04bf 1e17          	ldw	x,(OFST+11,sp)
2416  04c1 89            	pushw	x
2417  04c2 1e13          	ldw	x,(OFST+7,sp)
2418  04c4 89            	pushw	x
2419  04c5 1e11          	ldw	x,(OFST+5,sp)
2420  04c7 cd041e        	call	_Draw_Pixel
2422  04ca 5b04          	addw	sp,#4
2423  04cc               L135:
2424                     ; 335         while (x1 != x2)
2426  04cc 1e0d          	ldw	x,(OFST+1,sp)
2427  04ce 1313          	cpw	x,(OFST+7,sp)
2428  04d0 26cc          	jrne	L525
2430  04d2               L735:
2431                     ; 364 }
2434  04d2 5b0e          	addw	sp,#14
2435  04d4 81            	ret
2436  04d5               L325:
2437                     ; 350         fraction = (dx - (dy >> 1));
2439  04d5 1e09          	ldw	x,(OFST-3,sp)
2440  04d7 57            	sraw	x
2441  04d8 1f01          	ldw	(OFST-11,sp),x
2443  04da 1e07          	ldw	x,(OFST-5,sp)
2444  04dc 72f001        	subw	x,(OFST-11,sp)
2445  04df 1f0b          	ldw	(OFST-1,sp),x
2448  04e1 202e          	jra	L545
2449  04e3               L145:
2450                     ; 354             if (fraction >= 0)
2452  04e3 9c            	rvf
2453  04e4 1e0b          	ldw	x,(OFST-1,sp)
2454  04e6 2f0e          	jrslt	L155
2455                     ; 356                 x1 += stepx;
2457  04e8 1e0d          	ldw	x,(OFST+1,sp)
2458  04ea 72fb03        	addw	x,(OFST-9,sp)
2459  04ed 1f0d          	ldw	(OFST+1,sp),x
2460                     ; 357                 fraction -= dy;
2462  04ef 1e0b          	ldw	x,(OFST-1,sp)
2463  04f1 72f009        	subw	x,(OFST-3,sp)
2464  04f4 1f0b          	ldw	(OFST-1,sp),x
2466  04f6               L155:
2467                     ; 359             y1 += stepy;
2469  04f6 1e11          	ldw	x,(OFST+5,sp)
2470  04f8 72fb05        	addw	x,(OFST-7,sp)
2471  04fb 1f11          	ldw	(OFST+5,sp),x
2472                     ; 360             fraction += dx;
2474  04fd 1e0b          	ldw	x,(OFST-1,sp)
2475  04ff 72fb07        	addw	x,(OFST-5,sp)
2476  0502 1f0b          	ldw	(OFST-1,sp),x
2478                     ; 361             Draw_Pixel(x1, y1, colour);
2480  0504 1e17          	ldw	x,(OFST+11,sp)
2481  0506 89            	pushw	x
2482  0507 1e13          	ldw	x,(OFST+7,sp)
2483  0509 89            	pushw	x
2484  050a 1e11          	ldw	x,(OFST+5,sp)
2485  050c cd041e        	call	_Draw_Pixel
2487  050f 5b04          	addw	sp,#4
2488  0511               L545:
2489                     ; 352         while (y1 != y2)
2491  0511 1e11          	ldw	x,(OFST+5,sp)
2492  0513 1315          	cpw	x,(OFST+9,sp)
2493  0515 26cc          	jrne	L145
2494  0517 20b9          	jra	L735
2638                     ; 367 void Draw_Rectangle(signed int x1, signed int y1, signed int x2, signed int y2, unsigned char fill, unsigned char type, unsigned int colour, unsigned int back_colour)
2638                     ; 368 {
2639                     	switch	.text
2640  0519               _Draw_Rectangle:
2642  0519 89            	pushw	x
2643  051a 5205          	subw	sp,#5
2644       00000005      OFST:	set	5
2647                     ; 369      unsigned char i = 0x00;
2649                     ; 370      unsigned char xmin = 0x00;
2651                     ; 371      unsigned char xmax = 0x00;
2653                     ; 372      unsigned char ymin = 0x00;
2655                     ; 373      unsigned char ymax = 0x00;
2657                     ; 375      if(fill != NO)
2659  051c 0d10          	tnz	(OFST+11,sp)
2660  051e 275a          	jreq	L156
2661                     ; 377         if(x1 < x2)
2663  0520 9c            	rvf
2664  0521 130c          	cpw	x,(OFST+7,sp)
2665  0523 2e09          	jrsge	L356
2666                     ; 379            xmin = x1;
2668  0525 9f            	ld	a,xl
2669  0526 6b04          	ld	(OFST-1,sp),a
2671                     ; 380            xmax = x2;
2673  0528 7b0d          	ld	a,(OFST+8,sp)
2674  052a 6b01          	ld	(OFST-4,sp),a
2677  052c 2008          	jra	L556
2678  052e               L356:
2679                     ; 384            xmin = x2;
2681  052e 7b0d          	ld	a,(OFST+8,sp)
2682  0530 6b04          	ld	(OFST-1,sp),a
2684                     ; 385            xmax = x1;
2686  0532 7b07          	ld	a,(OFST+2,sp)
2687  0534 6b01          	ld	(OFST-4,sp),a
2689  0536               L556:
2690                     ; 388         if(y1 < y2)
2692  0536 9c            	rvf
2693  0537 1e0a          	ldw	x,(OFST+5,sp)
2694  0539 130e          	cpw	x,(OFST+9,sp)
2695  053b 2e0a          	jrsge	L756
2696                     ; 390            ymin = y1;
2698  053d 7b0b          	ld	a,(OFST+6,sp)
2699  053f 6b02          	ld	(OFST-3,sp),a
2701                     ; 391            ymax = y2;
2703  0541 7b0f          	ld	a,(OFST+10,sp)
2704  0543 6b03          	ld	(OFST-2,sp),a
2707  0545 202b          	jra	L766
2708  0547               L756:
2709                     ; 395            ymin = y2;
2711  0547 7b0f          	ld	a,(OFST+10,sp)
2712  0549 6b02          	ld	(OFST-3,sp),a
2714                     ; 396            ymax = y1;
2716  054b 7b0b          	ld	a,(OFST+6,sp)
2717  054d 6b03          	ld	(OFST-2,sp),a
2719  054f 2021          	jra	L766
2720  0551               L366:
2721                     ; 401              for(i = ymin; i <= ymax; ++i)
2723  0551 7b02          	ld	a,(OFST-3,sp)
2724  0553 6b05          	ld	(OFST+0,sp),a
2727  0555 2013          	jra	L776
2728  0557               L376:
2729                     ; 403                  Draw_Pixel(xmin, i, colour);
2731  0557 1e12          	ldw	x,(OFST+13,sp)
2732  0559 89            	pushw	x
2733  055a 7b07          	ld	a,(OFST+2,sp)
2734  055c 5f            	clrw	x
2735  055d 97            	ld	xl,a
2736  055e 89            	pushw	x
2737  055f 7b08          	ld	a,(OFST+3,sp)
2738  0561 5f            	clrw	x
2739  0562 97            	ld	xl,a
2740  0563 cd041e        	call	_Draw_Pixel
2742  0566 5b04          	addw	sp,#4
2743                     ; 401              for(i = ymin; i <= ymax; ++i)
2745  0568 0c05          	inc	(OFST+0,sp)
2747  056a               L776:
2750  056a 7b05          	ld	a,(OFST+0,sp)
2751  056c 1103          	cp	a,(OFST-2,sp)
2752  056e 23e7          	jrule	L376
2753                     ; 399         for(; xmin <= xmax; ++xmin)
2755  0570 0c04          	inc	(OFST-1,sp)
2757  0572               L766:
2760  0572 7b04          	ld	a,(OFST-1,sp)
2761  0574 1101          	cp	a,(OFST-4,sp)
2762  0576 23d9          	jrule	L366
2764  0578 204c          	jra	L307
2765  057a               L156:
2766                     ; 410         Draw_Line(x1, y1, x2, y1, colour);
2768  057a 1e12          	ldw	x,(OFST+13,sp)
2769  057c 89            	pushw	x
2770  057d 1e0c          	ldw	x,(OFST+7,sp)
2771  057f 89            	pushw	x
2772  0580 1e10          	ldw	x,(OFST+11,sp)
2773  0582 89            	pushw	x
2774  0583 1e10          	ldw	x,(OFST+11,sp)
2775  0585 89            	pushw	x
2776  0586 1e0e          	ldw	x,(OFST+9,sp)
2777  0588 cd0438        	call	_Draw_Line
2779  058b 5b08          	addw	sp,#8
2780                     ; 411         Draw_Line(x1, y2, x2, y2, colour);
2782  058d 1e12          	ldw	x,(OFST+13,sp)
2783  058f 89            	pushw	x
2784  0590 1e10          	ldw	x,(OFST+11,sp)
2785  0592 89            	pushw	x
2786  0593 1e10          	ldw	x,(OFST+11,sp)
2787  0595 89            	pushw	x
2788  0596 1e14          	ldw	x,(OFST+15,sp)
2789  0598 89            	pushw	x
2790  0599 1e0e          	ldw	x,(OFST+9,sp)
2791  059b cd0438        	call	_Draw_Line
2793  059e 5b08          	addw	sp,#8
2794                     ; 412         Draw_Line(x1, y1, x1, y2, colour);
2796  05a0 1e12          	ldw	x,(OFST+13,sp)
2797  05a2 89            	pushw	x
2798  05a3 1e10          	ldw	x,(OFST+11,sp)
2799  05a5 89            	pushw	x
2800  05a6 1e0a          	ldw	x,(OFST+5,sp)
2801  05a8 89            	pushw	x
2802  05a9 1e10          	ldw	x,(OFST+11,sp)
2803  05ab 89            	pushw	x
2804  05ac 1e0e          	ldw	x,(OFST+9,sp)
2805  05ae cd0438        	call	_Draw_Line
2807  05b1 5b08          	addw	sp,#8
2808                     ; 413         Draw_Line(x2, y1, x2, y2, colour);
2810  05b3 1e12          	ldw	x,(OFST+13,sp)
2811  05b5 89            	pushw	x
2812  05b6 1e10          	ldw	x,(OFST+11,sp)
2813  05b8 89            	pushw	x
2814  05b9 1e10          	ldw	x,(OFST+11,sp)
2815  05bb 89            	pushw	x
2816  05bc 1e10          	ldw	x,(OFST+11,sp)
2817  05be 89            	pushw	x
2818  05bf 1e14          	ldw	x,(OFST+15,sp)
2819  05c1 cd0438        	call	_Draw_Line
2821  05c4 5b08          	addw	sp,#8
2822  05c6               L307:
2823                     ; 416      if(type != SQUARE)
2825  05c6 0d11          	tnz	(OFST+12,sp)
2826  05c8 2734          	jreq	L507
2827                     ; 418          Draw_Pixel(x1, y1, back_colour);
2829  05ca 1e14          	ldw	x,(OFST+15,sp)
2830  05cc 89            	pushw	x
2831  05cd 1e0c          	ldw	x,(OFST+7,sp)
2832  05cf 89            	pushw	x
2833  05d0 1e0a          	ldw	x,(OFST+5,sp)
2834  05d2 cd041e        	call	_Draw_Pixel
2836  05d5 5b04          	addw	sp,#4
2837                     ; 419          Draw_Pixel(x1, y2, back_colour);
2839  05d7 1e14          	ldw	x,(OFST+15,sp)
2840  05d9 89            	pushw	x
2841  05da 1e10          	ldw	x,(OFST+11,sp)
2842  05dc 89            	pushw	x
2843  05dd 1e0a          	ldw	x,(OFST+5,sp)
2844  05df cd041e        	call	_Draw_Pixel
2846  05e2 5b04          	addw	sp,#4
2847                     ; 420          Draw_Pixel(x2, y1, back_colour);
2849  05e4 1e14          	ldw	x,(OFST+15,sp)
2850  05e6 89            	pushw	x
2851  05e7 1e0c          	ldw	x,(OFST+7,sp)
2852  05e9 89            	pushw	x
2853  05ea 1e10          	ldw	x,(OFST+11,sp)
2854  05ec cd041e        	call	_Draw_Pixel
2856  05ef 5b04          	addw	sp,#4
2857                     ; 421          Draw_Pixel(x2, y2, back_colour);
2859  05f1 1e14          	ldw	x,(OFST+15,sp)
2860  05f3 89            	pushw	x
2861  05f4 1e10          	ldw	x,(OFST+11,sp)
2862  05f6 89            	pushw	x
2863  05f7 1e10          	ldw	x,(OFST+11,sp)
2864  05f9 cd041e        	call	_Draw_Pixel
2866  05fc 5b04          	addw	sp,#4
2867  05fe               L507:
2868                     ; 423 }
2871  05fe 5b07          	addw	sp,#7
2872  0600 81            	ret
2971                     ; 426 void Draw_Circle(signed int xc, signed int yc, signed int radius, unsigned char fill, unsigned int colour)
2971                     ; 427 {
2972                     	switch	.text
2973  0601               _Draw_Circle:
2975  0601 89            	pushw	x
2976  0602 5208          	subw	sp,#8
2977       00000008      OFST:	set	8
2980                     ; 428    signed int a = 0x0000;
2982  0604 5f            	clrw	x
2983  0605 1f07          	ldw	(OFST-1,sp),x
2985                     ; 429    signed int b = 0x0000;
2987                     ; 430    signed int p = 0x0000;
2989                     ; 432    b = radius;
2991  0607 1e0f          	ldw	x,(OFST+7,sp)
2992  0609 1f05          	ldw	(OFST-3,sp),x
2994                     ; 433    p = (1 - b);
2996  060b ae0001        	ldw	x,#1
2997  060e 72f005        	subw	x,(OFST-3,sp)
2998  0611 1f03          	ldw	(OFST-5,sp),x
3000  0613               L167:
3001                     ; 437         if(fill != NO)
3003  0613 0d11          	tnz	(OFST+9,sp)
3004  0615 2603cc0699    	jreq	L767
3005                     ; 439             Draw_Line((xc - a), (yc + b), (xc + a), (yc + b), colour);
3007  061a 1e12          	ldw	x,(OFST+10,sp)
3008  061c 89            	pushw	x
3009  061d 1e0f          	ldw	x,(OFST+7,sp)
3010  061f 72fb07        	addw	x,(OFST-1,sp)
3011  0622 89            	pushw	x
3012  0623 1e0d          	ldw	x,(OFST+5,sp)
3013  0625 72fb0b        	addw	x,(OFST+3,sp)
3014  0628 89            	pushw	x
3015  0629 1e13          	ldw	x,(OFST+11,sp)
3016  062b 72fb0b        	addw	x,(OFST+3,sp)
3017  062e 89            	pushw	x
3018  062f 1e11          	ldw	x,(OFST+9,sp)
3019  0631 72f00f        	subw	x,(OFST+7,sp)
3020  0634 cd0438        	call	_Draw_Line
3022  0637 5b08          	addw	sp,#8
3023                     ; 440             Draw_Line((xc - a), (yc - b), (xc + a), (yc - b), colour);
3025  0639 1e12          	ldw	x,(OFST+10,sp)
3026  063b 89            	pushw	x
3027  063c 1e0f          	ldw	x,(OFST+7,sp)
3028  063e 72f007        	subw	x,(OFST-1,sp)
3029  0641 89            	pushw	x
3030  0642 1e0d          	ldw	x,(OFST+5,sp)
3031  0644 72fb0b        	addw	x,(OFST+3,sp)
3032  0647 89            	pushw	x
3033  0648 1e13          	ldw	x,(OFST+11,sp)
3034  064a 72f00b        	subw	x,(OFST+3,sp)
3035  064d 89            	pushw	x
3036  064e 1e11          	ldw	x,(OFST+9,sp)
3037  0650 72f00f        	subw	x,(OFST+7,sp)
3038  0653 cd0438        	call	_Draw_Line
3040  0656 5b08          	addw	sp,#8
3041                     ; 441             Draw_Line((xc - b), (yc + a), (xc + b), (yc + a), colour);
3043  0658 1e12          	ldw	x,(OFST+10,sp)
3044  065a 89            	pushw	x
3045  065b 1e0f          	ldw	x,(OFST+7,sp)
3046  065d 72fb09        	addw	x,(OFST+1,sp)
3047  0660 89            	pushw	x
3048  0661 1e0d          	ldw	x,(OFST+5,sp)
3049  0663 72fb09        	addw	x,(OFST+1,sp)
3050  0666 89            	pushw	x
3051  0667 1e13          	ldw	x,(OFST+11,sp)
3052  0669 72fb0d        	addw	x,(OFST+5,sp)
3053  066c 89            	pushw	x
3054  066d 1e11          	ldw	x,(OFST+9,sp)
3055  066f 72f00d        	subw	x,(OFST+5,sp)
3056  0672 cd0438        	call	_Draw_Line
3058  0675 5b08          	addw	sp,#8
3059                     ; 442             Draw_Line((xc - b), (yc - a), (xc + b), (yc - a), colour);
3061  0677 1e12          	ldw	x,(OFST+10,sp)
3062  0679 89            	pushw	x
3063  067a 1e0f          	ldw	x,(OFST+7,sp)
3064  067c 72f009        	subw	x,(OFST+1,sp)
3065  067f 89            	pushw	x
3066  0680 1e0d          	ldw	x,(OFST+5,sp)
3067  0682 72fb09        	addw	x,(OFST+1,sp)
3068  0685 89            	pushw	x
3069  0686 1e13          	ldw	x,(OFST+11,sp)
3070  0688 72f00d        	subw	x,(OFST+5,sp)
3071  068b 89            	pushw	x
3072  068c 1e11          	ldw	x,(OFST+9,sp)
3073  068e 72f00d        	subw	x,(OFST+5,sp)
3074  0691 cd0438        	call	_Draw_Line
3076  0694 5b08          	addw	sp,#8
3078  0696 cc0731        	jra	L177
3079  0699               L767:
3080                     ; 446             Draw_Pixel((xc + a), (yc + b), colour);
3082  0699 1e12          	ldw	x,(OFST+10,sp)
3083  069b 89            	pushw	x
3084  069c 1e0f          	ldw	x,(OFST+7,sp)
3085  069e 72fb07        	addw	x,(OFST-1,sp)
3086  06a1 89            	pushw	x
3087  06a2 1e0d          	ldw	x,(OFST+5,sp)
3088  06a4 72fb0b        	addw	x,(OFST+3,sp)
3089  06a7 cd041e        	call	_Draw_Pixel
3091  06aa 5b04          	addw	sp,#4
3092                     ; 447             Draw_Pixel((xc + b), (yc + a), colour);
3094  06ac 1e12          	ldw	x,(OFST+10,sp)
3095  06ae 89            	pushw	x
3096  06af 1e0f          	ldw	x,(OFST+7,sp)
3097  06b1 72fb09        	addw	x,(OFST+1,sp)
3098  06b4 89            	pushw	x
3099  06b5 1e0d          	ldw	x,(OFST+5,sp)
3100  06b7 72fb09        	addw	x,(OFST+1,sp)
3101  06ba cd041e        	call	_Draw_Pixel
3103  06bd 5b04          	addw	sp,#4
3104                     ; 448             Draw_Pixel((xc - a), (yc + b), colour);
3106  06bf 1e12          	ldw	x,(OFST+10,sp)
3107  06c1 89            	pushw	x
3108  06c2 1e0f          	ldw	x,(OFST+7,sp)
3109  06c4 72fb07        	addw	x,(OFST-1,sp)
3110  06c7 89            	pushw	x
3111  06c8 1e0d          	ldw	x,(OFST+5,sp)
3112  06ca 72f00b        	subw	x,(OFST+3,sp)
3113  06cd cd041e        	call	_Draw_Pixel
3115  06d0 5b04          	addw	sp,#4
3116                     ; 449             Draw_Pixel((xc - b), (yc + a), colour);
3118  06d2 1e12          	ldw	x,(OFST+10,sp)
3119  06d4 89            	pushw	x
3120  06d5 1e0f          	ldw	x,(OFST+7,sp)
3121  06d7 72fb09        	addw	x,(OFST+1,sp)
3122  06da 89            	pushw	x
3123  06db 1e0d          	ldw	x,(OFST+5,sp)
3124  06dd 72f009        	subw	x,(OFST+1,sp)
3125  06e0 cd041e        	call	_Draw_Pixel
3127  06e3 5b04          	addw	sp,#4
3128                     ; 450             Draw_Pixel((xc + b), (yc - a), colour);
3130  06e5 1e12          	ldw	x,(OFST+10,sp)
3131  06e7 89            	pushw	x
3132  06e8 1e0f          	ldw	x,(OFST+7,sp)
3133  06ea 72f009        	subw	x,(OFST+1,sp)
3134  06ed 89            	pushw	x
3135  06ee 1e0d          	ldw	x,(OFST+5,sp)
3136  06f0 72fb09        	addw	x,(OFST+1,sp)
3137  06f3 cd041e        	call	_Draw_Pixel
3139  06f6 5b04          	addw	sp,#4
3140                     ; 451             Draw_Pixel((xc + a), (yc - b), colour);
3142  06f8 1e12          	ldw	x,(OFST+10,sp)
3143  06fa 89            	pushw	x
3144  06fb 1e0f          	ldw	x,(OFST+7,sp)
3145  06fd 72f007        	subw	x,(OFST-1,sp)
3146  0700 89            	pushw	x
3147  0701 1e0d          	ldw	x,(OFST+5,sp)
3148  0703 72fb0b        	addw	x,(OFST+3,sp)
3149  0706 cd041e        	call	_Draw_Pixel
3151  0709 5b04          	addw	sp,#4
3152                     ; 452             Draw_Pixel((xc - a), (yc - b), colour);
3154  070b 1e12          	ldw	x,(OFST+10,sp)
3155  070d 89            	pushw	x
3156  070e 1e0f          	ldw	x,(OFST+7,sp)
3157  0710 72f007        	subw	x,(OFST-1,sp)
3158  0713 89            	pushw	x
3159  0714 1e0d          	ldw	x,(OFST+5,sp)
3160  0716 72f00b        	subw	x,(OFST+3,sp)
3161  0719 cd041e        	call	_Draw_Pixel
3163  071c 5b04          	addw	sp,#4
3164                     ; 453             Draw_Pixel((xc - b), (yc - a), colour);
3166  071e 1e12          	ldw	x,(OFST+10,sp)
3167  0720 89            	pushw	x
3168  0721 1e0f          	ldw	x,(OFST+7,sp)
3169  0723 72f009        	subw	x,(OFST+1,sp)
3170  0726 89            	pushw	x
3171  0727 1e0d          	ldw	x,(OFST+5,sp)
3172  0729 72f009        	subw	x,(OFST+1,sp)
3173  072c cd041e        	call	_Draw_Pixel
3175  072f 5b04          	addw	sp,#4
3176  0731               L177:
3177                     ; 456         if(p < 0)
3179  0731 9c            	rvf
3180  0732 1e03          	ldw	x,(OFST-5,sp)
3181  0734 2e15          	jrsge	L377
3182                     ; 458             p += (0x03 + (0x02 * a++));
3184  0736 1e07          	ldw	x,(OFST-1,sp)
3185  0738 1c0001        	addw	x,#1
3186  073b 1f07          	ldw	(OFST-1,sp),x
3187  073d 1d0001        	subw	x,#1
3189  0740 58            	sllw	x
3190  0741 1c0003        	addw	x,#3
3191  0744 72fb03        	addw	x,(OFST-5,sp)
3192  0747 1f03          	ldw	(OFST-5,sp),x
3195  0749 2022          	jra	L367
3196  074b               L377:
3197                     ; 462             p += (0x05 + (0x02 * ((a++) - (b--))));
3199  074b 1e05          	ldw	x,(OFST-3,sp)
3200  074d 1d0001        	subw	x,#1
3201  0750 1f05          	ldw	(OFST-3,sp),x
3202  0752 1c0001        	addw	x,#1
3204  0755 1f01          	ldw	(OFST-7,sp),x
3206  0757 1e07          	ldw	x,(OFST-1,sp)
3207  0759 1c0001        	addw	x,#1
3208  075c 1f07          	ldw	(OFST-1,sp),x
3209  075e 1d0001        	subw	x,#1
3211  0761 72f001        	subw	x,(OFST-7,sp)
3212  0764 58            	sllw	x
3213  0765 1c0005        	addw	x,#5
3214  0768 72fb03        	addw	x,(OFST-5,sp)
3215  076b 1f03          	ldw	(OFST-5,sp),x
3217  076d               L367:
3218                     ; 464     }while(a <= b);
3220  076d 9c            	rvf
3221  076e 1e07          	ldw	x,(OFST-1,sp)
3222  0770 1305          	cpw	x,(OFST-3,sp)
3223  0772 2c03          	jrsgt	L64
3224  0774 cc0613        	jp	L167
3225  0777               L64:
3226                     ; 465 }
3229  0777 5b0a          	addw	sp,#10
3230  0779 81            	ret
3302                     ; 468 void Draw_Font_Pixel(signed int x_pos, signed int y_pos, unsigned int colour, unsigned char pixel_size)
3302                     ; 469 {
3303                     	switch	.text
3304  077a               _Draw_Font_Pixel:
3306  077a 89            	pushw	x
3307  077b 88            	push	a
3308       00000001      OFST:	set	1
3311                     ; 470      unsigned char i = 0x00;
3313                     ; 472      ST7735_Set_Addr_Window(x_pos, y_pos, (x_pos + pixel_size - 1), (y_pos + pixel_size - 1));
3315  077c 7b06          	ld	a,(OFST+5,sp)
3316  077e 97            	ld	xl,a
3317  077f 7b07          	ld	a,(OFST+6,sp)
3318  0781 1b0a          	add	a,(OFST+9,sp)
3319  0783 2401          	jrnc	L25
3320  0785 5c            	incw	x
3321  0786               L25:
3322  0786 02            	rlwa	x,a
3323  0787 5a            	decw	x
3324  0788 89            	pushw	x
3325  0789 7b04          	ld	a,(OFST+3,sp)
3326  078b 97            	ld	xl,a
3327  078c 7b05          	ld	a,(OFST+4,sp)
3328  078e 1b0c          	add	a,(OFST+11,sp)
3329  0790 2401          	jrnc	L45
3330  0792 5c            	incw	x
3331  0793               L45:
3332  0793 02            	rlwa	x,a
3333  0794 5a            	decw	x
3334  0795 89            	pushw	x
3335  0796 1e0a          	ldw	x,(OFST+9,sp)
3336  0798 89            	pushw	x
3337  0799 1e08          	ldw	x,(OFST+7,sp)
3338  079b cd0312        	call	_ST7735_Set_Addr_Window
3340  079e 5b06          	addw	sp,#6
3341                     ; 474      for(i = 0x00; i < (pixel_size * pixel_size); i++)
3343  07a0 0f01          	clr	(OFST+0,sp)
3346  07a2 2007          	jra	L1401
3347  07a4               L5301:
3348                     ; 476          ST7735_Word_Write(colour);
3350  07a4 1e08          	ldw	x,(OFST+7,sp)
3351  07a6 cd02fc        	call	_ST7735_Word_Write
3353                     ; 474      for(i = 0x00; i < (pixel_size * pixel_size); i++)
3355  07a9 0c01          	inc	(OFST+0,sp)
3357  07ab               L1401:
3360  07ab 9c            	rvf
3361  07ac 7b0a          	ld	a,(OFST+9,sp)
3362  07ae 97            	ld	xl,a
3363  07af 7b0a          	ld	a,(OFST+9,sp)
3364  07b1 42            	mul	x,a
3365  07b2 7b01          	ld	a,(OFST+0,sp)
3366  07b4 905f          	clrw	y
3367  07b6 9097          	ld	yl,a
3368  07b8 90bf00        	ldw	c_y,y
3369  07bb b300          	cpw	x,c_y
3370  07bd 2ce5          	jrsgt	L5301
3371                     ; 478 }
3374  07bf 5b03          	addw	sp,#3
3375  07c1 81            	ret
3484                     ; 481 void print_char(signed int x_pos, signed int  y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char ch)
3484                     ; 482 {
3485                     	switch	.text
3486  07c2               _print_char:
3488  07c2 89            	pushw	x
3489  07c3 5205          	subw	sp,#5
3490       00000005      OFST:	set	5
3493                     ; 483      unsigned char i = 0x00;
3495                     ; 484      unsigned char j = 0x00;
3497                     ; 486      char value = 0x00;
3499                     ; 493      if(x_pos < font_size)
3501  07c5 9c            	rvf
3502  07c6 7b0c          	ld	a,(OFST+7,sp)
3503  07c8 905f          	clrw	y
3504  07ca 9097          	ld	yl,a
3505  07cc 90bf00        	ldw	c_y,y
3506  07cf b300          	cpw	x,c_y
3507  07d1 2e06          	jrsge	L3211
3508                     ; 495          x_pos = font_size;
3510  07d3 7b0c          	ld	a,(OFST+7,sp)
3511  07d5 5f            	clrw	x
3512  07d6 97            	ld	xl,a
3513  07d7 1f06          	ldw	(OFST+1,sp),x
3514  07d9               L3211:
3515                     ; 498      for (i = 0x00; i < 0x05; i++)
3517  07d9 0f03          	clr	(OFST-2,sp)
3519  07db               L5211:
3520                     ; 500          for (j = 0x00; j < 0x08; j++)
3522  07db 0f05          	clr	(OFST+0,sp)
3524  07dd               L3311:
3525                     ; 502              value = 0x00;
3527                     ; 503              value = ((font[((unsigned char)ch) - 0x20][i]));
3529  07dd 7b11          	ld	a,(OFST+12,sp)
3530  07df 97            	ld	xl,a
3531  07e0 a605          	ld	a,#5
3532  07e2 42            	mul	x,a
3533  07e3 1d00a0        	subw	x,#160
3534  07e6 01            	rrwa	x,a
3535  07e7 1b03          	add	a,(OFST-2,sp)
3536  07e9 2401          	jrnc	L06
3537  07eb 5c            	incw	x
3538  07ec               L06:
3539  07ec 02            	rlwa	x,a
3540  07ed d60000        	ld	a,(L3_font,x)
3541  07f0 6b04          	ld	(OFST-1,sp),a
3543                     ; 505              if((value >> j)  & 0x01)
3545  07f2 7b05          	ld	a,(OFST+0,sp)
3546  07f4 5f            	clrw	x
3547  07f5 97            	ld	xl,a
3548  07f6 7b04          	ld	a,(OFST-1,sp)
3549  07f8 5d            	tnzw	x
3550  07f9 2704          	jreq	L26
3551  07fb               L46:
3552  07fb 44            	srl	a
3553  07fc 5a            	decw	x
3554  07fd 26fc          	jrne	L46
3555  07ff               L26:
3556  07ff 5f            	clrw	x
3557  0800 a501          	bcp	a,#1
3558  0802 2712          	jreq	L1411
3559                     ; 507                  Draw_Font_Pixel(x_pos, y_pos, colour, font_size);
3561  0804 7b0c          	ld	a,(OFST+7,sp)
3562  0806 88            	push	a
3563  0807 1e0e          	ldw	x,(OFST+9,sp)
3564  0809 89            	pushw	x
3565  080a 1e0d          	ldw	x,(OFST+8,sp)
3566  080c 89            	pushw	x
3567  080d 1e0b          	ldw	x,(OFST+6,sp)
3568  080f cd077a        	call	_Draw_Font_Pixel
3570  0812 5b05          	addw	sp,#5
3572  0814 2010          	jra	L3411
3573  0816               L1411:
3574                     ; 511                  Draw_Font_Pixel(x_pos, y_pos, back_colour, font_size);
3576  0816 7b0c          	ld	a,(OFST+7,sp)
3577  0818 88            	push	a
3578  0819 1e10          	ldw	x,(OFST+11,sp)
3579  081b 89            	pushw	x
3580  081c 1e0d          	ldw	x,(OFST+8,sp)
3581  081e 89            	pushw	x
3582  081f 1e0b          	ldw	x,(OFST+6,sp)
3583  0821 cd077a        	call	_Draw_Font_Pixel
3585  0824 5b05          	addw	sp,#5
3586  0826               L3411:
3587                     ; 514              y_pos = y_pos + font_size;
3589  0826 7b0c          	ld	a,(OFST+7,sp)
3590  0828 5f            	clrw	x
3591  0829 97            	ld	xl,a
3592  082a 1f01          	ldw	(OFST-4,sp),x
3594  082c 1e0a          	ldw	x,(OFST+5,sp)
3595  082e 72fb01        	addw	x,(OFST-4,sp)
3596  0831 1f0a          	ldw	(OFST+5,sp),x
3597                     ; 500          for (j = 0x00; j < 0x08; j++)
3599  0833 0c05          	inc	(OFST+0,sp)
3603  0835 7b05          	ld	a,(OFST+0,sp)
3604  0837 a108          	cp	a,#8
3605  0839 25a2          	jrult	L3311
3606                     ; 516           y_pos -= (font_size << 0x03);
3608  083b 7b0c          	ld	a,(OFST+7,sp)
3609  083d 97            	ld	xl,a
3610  083e a608          	ld	a,#8
3611  0840 42            	mul	x,a
3612  0841 72f00a        	subw	x,(OFST+5,sp)
3613  0844 50            	negw	x
3614  0845 1f0a          	ldw	(OFST+5,sp),x
3615                     ; 517           x_pos += font_size;
3617  0847 7b0c          	ld	a,(OFST+7,sp)
3618  0849 5f            	clrw	x
3619  084a 97            	ld	xl,a
3620  084b 1f01          	ldw	(OFST-4,sp),x
3622  084d 1e06          	ldw	x,(OFST+1,sp)
3623  084f 72fb01        	addw	x,(OFST-4,sp)
3624  0852 1f06          	ldw	(OFST+1,sp),x
3625                     ; 498      for (i = 0x00; i < 0x05; i++)
3627  0854 0c03          	inc	(OFST-2,sp)
3631  0856 7b03          	ld	a,(OFST-2,sp)
3632  0858 a105          	cp	a,#5
3633  085a 2403cc07db    	jrult	L5211
3634                     ; 520       x_pos += font_size;
3636  085f 7b0c          	ld	a,(OFST+7,sp)
3637  0861 5f            	clrw	x
3638  0862 97            	ld	xl,a
3639  0863 1f01          	ldw	(OFST-4,sp),x
3641  0865 1e06          	ldw	x,(OFST+1,sp)
3642  0867 72fb01        	addw	x,(OFST-4,sp)
3643  086a 1f06          	ldw	(OFST+1,sp),x
3644                     ; 522       if(x_pos > width)
3646  086c 1e06          	ldw	x,(OFST+1,sp)
3647  086e b300          	cpw	x,_width
3648  0870 2319          	jrule	L5411
3649                     ; 524           x_pos = (font_size + 0x01);
3651  0872 a600          	ld	a,#0
3652  0874 97            	ld	xl,a
3653  0875 a601          	ld	a,#1
3654  0877 1b0c          	add	a,(OFST+7,sp)
3655  0879 2401          	jrnc	L66
3656  087b 5c            	incw	x
3657  087c               L66:
3658  087c 02            	rlwa	x,a
3659  087d 1f06          	ldw	(OFST+1,sp),x
3660  087f 01            	rrwa	x,a
3661                     ; 525           y_pos += (font_size << 0x03);
3663  0880 7b0c          	ld	a,(OFST+7,sp)
3664  0882 97            	ld	xl,a
3665  0883 a608          	ld	a,#8
3666  0885 42            	mul	x,a
3667  0886 72fb0a        	addw	x,(OFST+5,sp)
3668  0889 1f0a          	ldw	(OFST+5,sp),x
3669  088b               L5411:
3670                     ; 527 }
3673  088b 5b07          	addw	sp,#7
3674  088d 81            	ret
3755                     ; 530 void print_str(signed int x_pos, signed int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, char *ch)
3755                     ; 531 {
3756                     	switch	.text
3757  088e               _print_str:
3759  088e 89            	pushw	x
3760       00000000      OFST:	set	0
3763  088f               L1121:
3764                     ; 534          print_char(x_pos, y_pos, font_size, colour, back_colour, *ch++);
3766  088f 1e0c          	ldw	x,(OFST+12,sp)
3767  0891 1c0001        	addw	x,#1
3768  0894 1f0c          	ldw	(OFST+12,sp),x
3769  0896 1d0001        	subw	x,#1
3770  0899 f6            	ld	a,(x)
3771  089a 88            	push	a
3772  089b 1e0b          	ldw	x,(OFST+11,sp)
3773  089d 89            	pushw	x
3774  089e 1e0b          	ldw	x,(OFST+11,sp)
3775  08a0 89            	pushw	x
3776  08a1 7b0c          	ld	a,(OFST+12,sp)
3777  08a3 88            	push	a
3778  08a4 1e0b          	ldw	x,(OFST+11,sp)
3779  08a6 89            	pushw	x
3780  08a7 1e09          	ldw	x,(OFST+9,sp)
3781  08a9 cd07c2        	call	_print_char
3783  08ac 5b08          	addw	sp,#8
3784                     ; 535          x_pos += (font_size * 0x06);
3786  08ae 7b07          	ld	a,(OFST+7,sp)
3787  08b0 97            	ld	xl,a
3788  08b1 a606          	ld	a,#6
3789  08b3 42            	mul	x,a
3790  08b4 72fb01        	addw	x,(OFST+1,sp)
3791  08b7 1f01          	ldw	(OFST+1,sp),x
3792                     ; 536      }while((*ch >= 0x20) && (*ch <= 0x7F) && (*ch != '\n'));
3794  08b9 1e0c          	ldw	x,(OFST+12,sp)
3795  08bb f6            	ld	a,(x)
3796  08bc a120          	cp	a,#32
3797  08be 250e          	jrult	L7121
3799  08c0 1e0c          	ldw	x,(OFST+12,sp)
3800  08c2 f6            	ld	a,(x)
3801  08c3 a180          	cp	a,#128
3802  08c5 2407          	jruge	L7121
3804  08c7 1e0c          	ldw	x,(OFST+12,sp)
3805  08c9 f6            	ld	a,(x)
3806  08ca a10a          	cp	a,#10
3807  08cc 26c1          	jrne	L1121
3808  08ce               L7121:
3809                     ; 537 }
3812  08ce 85            	popw	x
3813  08cf 81            	ret
3816                     	switch	.const
3817  01e0               L3221_ch:
3818  01e0 20            	dc.b	32
3819  01e1 20            	dc.b	32
3820  01e2 20            	dc.b	32
3821  01e3 20            	dc.b	32
3909                     ; 540 void print_C(signed int x_pos, signed int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
3909                     ; 541 {
3910                     	switch	.text
3911  08d0               _print_C:
3913  08d0 89            	pushw	x
3914  08d1 5204          	subw	sp,#4
3915       00000004      OFST:	set	4
3918                     ; 542      char ch[4] = {0x20, 0x20, 0x20, 0x20};
3920  08d3 96            	ldw	x,sp
3921  08d4 1c0001        	addw	x,#OFST-3
3922  08d7 90ae01e0      	ldw	y,#L3221_ch
3923  08db a604          	ld	a,#4
3924  08dd cd0000        	call	c_xymvx
3926                     ; 544      if(value < 0x00)
3928  08e0 9c            	rvf
3929  08e1 1e10          	ldw	x,(OFST+12,sp)
3930  08e3 2e0b          	jrsge	L3721
3931                     ; 546         ch[0] = 0x2D;
3933  08e5 a62d          	ld	a,#45
3934  08e7 6b01          	ld	(OFST-3,sp),a
3936                     ; 547         value = -value;
3938  08e9 1e10          	ldw	x,(OFST+12,sp)
3939  08eb 50            	negw	x
3940  08ec 1f10          	ldw	(OFST+12,sp),x
3942  08ee 2004          	jra	L5721
3943  08f0               L3721:
3944                     ; 551         ch[0] = 0x20;
3946  08f0 a620          	ld	a,#32
3947  08f2 6b01          	ld	(OFST-3,sp),a
3949  08f4               L5721:
3950                     ; 554      if((value > 99) && (value <= 999))
3952  08f4 9c            	rvf
3953  08f5 1e10          	ldw	x,(OFST+12,sp)
3954  08f7 a30064        	cpw	x,#100
3955  08fa 2f39          	jrslt	L7721
3957  08fc 9c            	rvf
3958  08fd 1e10          	ldw	x,(OFST+12,sp)
3959  08ff a303e8        	cpw	x,#1000
3960  0902 2e31          	jrsge	L7721
3961                     ; 556          ch[1] = ((value / 100) + 0x30);
3963  0904 1e10          	ldw	x,(OFST+12,sp)
3964  0906 a664          	ld	a,#100
3965  0908 cd0000        	call	c_sdivx
3967  090b 1c0030        	addw	x,#48
3968  090e 01            	rrwa	x,a
3969  090f 6b02          	ld	(OFST-2,sp),a
3970  0911 02            	rlwa	x,a
3972                     ; 557          ch[2] = (((value % 100) / 10) + 0x30);
3974  0912 1e10          	ldw	x,(OFST+12,sp)
3975  0914 a664          	ld	a,#100
3976  0916 cd0000        	call	c_smodx
3978  0919 a60a          	ld	a,#10
3979  091b cd0000        	call	c_sdivx
3981  091e 1c0030        	addw	x,#48
3982  0921 01            	rrwa	x,a
3983  0922 6b03          	ld	(OFST-1,sp),a
3984  0924 02            	rlwa	x,a
3986                     ; 558          ch[3] = ((value % 10) + 0x30);
3988  0925 1e10          	ldw	x,(OFST+12,sp)
3989  0927 a60a          	ld	a,#10
3990  0929 cd0000        	call	c_smodx
3992  092c 1c0030        	addw	x,#48
3993  092f 01            	rrwa	x,a
3994  0930 6b04          	ld	(OFST+0,sp),a
3995  0932 02            	rlwa	x,a
3998  0933 205a          	jra	L1031
3999  0935               L7721:
4000                     ; 560      else if((value > 9) && (value <= 99))
4002  0935 9c            	rvf
4003  0936 1e10          	ldw	x,(OFST+12,sp)
4004  0938 a3000a        	cpw	x,#10
4005  093b 2f2f          	jrslt	L3031
4007  093d 9c            	rvf
4008  093e 1e10          	ldw	x,(OFST+12,sp)
4009  0940 a30064        	cpw	x,#100
4010  0943 2e27          	jrsge	L3031
4011                     ; 562          ch[1] = (((value % 100) / 10) + 0x30);
4013  0945 1e10          	ldw	x,(OFST+12,sp)
4014  0947 a664          	ld	a,#100
4015  0949 cd0000        	call	c_smodx
4017  094c a60a          	ld	a,#10
4018  094e cd0000        	call	c_sdivx
4020  0951 1c0030        	addw	x,#48
4021  0954 01            	rrwa	x,a
4022  0955 6b02          	ld	(OFST-2,sp),a
4023  0957 02            	rlwa	x,a
4025                     ; 563          ch[2] = ((value % 10) + 0x30);
4027  0958 1e10          	ldw	x,(OFST+12,sp)
4028  095a a60a          	ld	a,#10
4029  095c cd0000        	call	c_smodx
4031  095f 1c0030        	addw	x,#48
4032  0962 01            	rrwa	x,a
4033  0963 6b03          	ld	(OFST-1,sp),a
4034  0965 02            	rlwa	x,a
4036                     ; 564          ch[3] = 0x20;
4038  0966 a620          	ld	a,#32
4039  0968 6b04          	ld	(OFST+0,sp),a
4042  096a 2023          	jra	L1031
4043  096c               L3031:
4044                     ; 566      else if((value >= 0) && (value <= 9))
4046  096c 9c            	rvf
4047  096d 1e10          	ldw	x,(OFST+12,sp)
4048  096f 2f1e          	jrslt	L1031
4050  0971 9c            	rvf
4051  0972 1e10          	ldw	x,(OFST+12,sp)
4052  0974 a3000a        	cpw	x,#10
4053  0977 2e16          	jrsge	L1031
4054                     ; 568          ch[1] = ((value % 10) + 0x30);
4056  0979 1e10          	ldw	x,(OFST+12,sp)
4057  097b a60a          	ld	a,#10
4058  097d cd0000        	call	c_smodx
4060  0980 1c0030        	addw	x,#48
4061  0983 01            	rrwa	x,a
4062  0984 6b02          	ld	(OFST-2,sp),a
4063  0986 02            	rlwa	x,a
4065                     ; 569          ch[2] = 0x20;
4067  0987 a620          	ld	a,#32
4068  0989 6b03          	ld	(OFST-1,sp),a
4070                     ; 570          ch[3] = 0x20;
4072  098b a620          	ld	a,#32
4073  098d 6b04          	ld	(OFST+0,sp),a
4075  098f               L1031:
4076                     ; 573      print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
4078  098f 96            	ldw	x,sp
4079  0990 1c0001        	addw	x,#OFST-3
4080  0993 89            	pushw	x
4081  0994 1e10          	ldw	x,(OFST+12,sp)
4082  0996 89            	pushw	x
4083  0997 1e10          	ldw	x,(OFST+12,sp)
4084  0999 89            	pushw	x
4085  099a 7b11          	ld	a,(OFST+13,sp)
4086  099c 88            	push	a
4087  099d 1e10          	ldw	x,(OFST+12,sp)
4088  099f 89            	pushw	x
4089  09a0 1e0e          	ldw	x,(OFST+10,sp)
4090  09a2 cd088e        	call	_print_str
4092  09a5 5b09          	addw	sp,#9
4093                     ; 574 }
4096  09a7 5b06          	addw	sp,#6
4097  09a9 81            	ret
4100                     	switch	.const
4101  01e4               L1131_ch:
4102  01e4 20            	dc.b	32
4103  01e5 20            	dc.b	32
4104  01e6 20            	dc.b	32
4105  01e7 20            	dc.b	32
4106  01e8 20            	dc.b	32
4107  01e9 20            	dc.b	32
4195                     ; 577 void print_I(signed int x_pos, signed int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, signed int value)
4195                     ; 578 {
4196                     	switch	.text
4197  09aa               _print_I:
4199  09aa 89            	pushw	x
4200  09ab 5206          	subw	sp,#6
4201       00000006      OFST:	set	6
4204                     ; 579     char ch[6] = {0x20, 0x20, 0x20, 0x20, 0x20, 0x20};
4206  09ad 96            	ldw	x,sp
4207  09ae 1c0001        	addw	x,#OFST-5
4208  09b1 90ae01e4      	ldw	y,#L1131_ch
4209  09b5 a606          	ld	a,#6
4210  09b7 cd0000        	call	c_xymvx
4212                     ; 581     if(value < 0)
4214  09ba 9c            	rvf
4215  09bb 1e12          	ldw	x,(OFST+12,sp)
4216  09bd 2e0b          	jrsge	L1631
4217                     ; 583         ch[0] = 0x2D;
4219  09bf a62d          	ld	a,#45
4220  09c1 6b01          	ld	(OFST-5,sp),a
4222                     ; 584         value = -value;
4224  09c3 1e12          	ldw	x,(OFST+12,sp)
4225  09c5 50            	negw	x
4226  09c6 1f12          	ldw	(OFST+12,sp),x
4228  09c8 2004          	jra	L3631
4229  09ca               L1631:
4230                     ; 588         ch[0] = 0x20;
4232  09ca a620          	ld	a,#32
4233  09cc 6b01          	ld	(OFST-5,sp),a
4235  09ce               L3631:
4236                     ; 591     if(value > 9999)
4238  09ce 9c            	rvf
4239  09cf 1e12          	ldw	x,(OFST+12,sp)
4240  09d1 a32710        	cpw	x,#10000
4241  09d4 2f63          	jrslt	L5631
4242                     ; 593         ch[1] = ((value / 10000) + 0x30);
4244  09d6 1e12          	ldw	x,(OFST+12,sp)
4245  09d8 90ae2710      	ldw	y,#10000
4246  09dc cd0000        	call	c_idiv
4248  09df 1c0030        	addw	x,#48
4249  09e2 01            	rrwa	x,a
4250  09e3 6b02          	ld	(OFST-4,sp),a
4251  09e5 02            	rlwa	x,a
4253                     ; 594         ch[2] = (((value % 10000) / 1000) + 0x30);
4255  09e6 1e12          	ldw	x,(OFST+12,sp)
4256  09e8 90ae2710      	ldw	y,#10000
4257  09ec cd0000        	call	c_idiv
4259  09ef 51            	exgw	x,y
4260  09f0 90ae03e8      	ldw	y,#1000
4261  09f4 cd0000        	call	c_idiv
4263  09f7 1c0030        	addw	x,#48
4264  09fa 01            	rrwa	x,a
4265  09fb 6b03          	ld	(OFST-3,sp),a
4266  09fd 02            	rlwa	x,a
4268                     ; 595         ch[3] = (((value % 1000) / 100) + 0x30);
4270  09fe 1e12          	ldw	x,(OFST+12,sp)
4271  0a00 90ae03e8      	ldw	y,#1000
4272  0a04 cd0000        	call	c_idiv
4274  0a07 51            	exgw	x,y
4275  0a08 a664          	ld	a,#100
4276  0a0a cd0000        	call	c_sdivx
4278  0a0d 1c0030        	addw	x,#48
4279  0a10 01            	rrwa	x,a
4280  0a11 6b04          	ld	(OFST-2,sp),a
4281  0a13 02            	rlwa	x,a
4283                     ; 596         ch[4] = (((value % 100) / 10) + 0x30);
4285  0a14 1e12          	ldw	x,(OFST+12,sp)
4286  0a16 a664          	ld	a,#100
4287  0a18 cd0000        	call	c_smodx
4289  0a1b a60a          	ld	a,#10
4290  0a1d cd0000        	call	c_sdivx
4292  0a20 1c0030        	addw	x,#48
4293  0a23 01            	rrwa	x,a
4294  0a24 6b05          	ld	(OFST-1,sp),a
4295  0a26 02            	rlwa	x,a
4297                     ; 597         ch[5] = ((value % 10) + 0x30);
4299  0a27 1e12          	ldw	x,(OFST+12,sp)
4300  0a29 a60a          	ld	a,#10
4301  0a2b cd0000        	call	c_smodx
4303  0a2e 1c0030        	addw	x,#48
4304  0a31 01            	rrwa	x,a
4305  0a32 6b06          	ld	(OFST+0,sp),a
4306  0a34 02            	rlwa	x,a
4309  0a35 ac4e0b4e      	jpf	L7631
4310  0a39               L5631:
4311                     ; 600     else if((value > 999) && (value <= 9999))
4313  0a39 9c            	rvf
4314  0a3a 1e12          	ldw	x,(OFST+12,sp)
4315  0a3c a303e8        	cpw	x,#1000
4316  0a3f 2f5f          	jrslt	L1731
4318  0a41 9c            	rvf
4319  0a42 1e12          	ldw	x,(OFST+12,sp)
4320  0a44 a32710        	cpw	x,#10000
4321  0a47 2e57          	jrsge	L1731
4322                     ; 602         ch[1] = (((value % 10000) / 1000) + 0x30);
4324  0a49 1e12          	ldw	x,(OFST+12,sp)
4325  0a4b 90ae2710      	ldw	y,#10000
4326  0a4f cd0000        	call	c_idiv
4328  0a52 51            	exgw	x,y
4329  0a53 90ae03e8      	ldw	y,#1000
4330  0a57 cd0000        	call	c_idiv
4332  0a5a 1c0030        	addw	x,#48
4333  0a5d 01            	rrwa	x,a
4334  0a5e 6b02          	ld	(OFST-4,sp),a
4335  0a60 02            	rlwa	x,a
4337                     ; 603         ch[2] = (((value % 1000) / 100) + 0x30);
4339  0a61 1e12          	ldw	x,(OFST+12,sp)
4340  0a63 90ae03e8      	ldw	y,#1000
4341  0a67 cd0000        	call	c_idiv
4343  0a6a 51            	exgw	x,y
4344  0a6b a664          	ld	a,#100
4345  0a6d cd0000        	call	c_sdivx
4347  0a70 1c0030        	addw	x,#48
4348  0a73 01            	rrwa	x,a
4349  0a74 6b03          	ld	(OFST-3,sp),a
4350  0a76 02            	rlwa	x,a
4352                     ; 604         ch[3] = (((value % 100) / 10) + 0x30);
4354  0a77 1e12          	ldw	x,(OFST+12,sp)
4355  0a79 a664          	ld	a,#100
4356  0a7b cd0000        	call	c_smodx
4358  0a7e a60a          	ld	a,#10
4359  0a80 cd0000        	call	c_sdivx
4361  0a83 1c0030        	addw	x,#48
4362  0a86 01            	rrwa	x,a
4363  0a87 6b04          	ld	(OFST-2,sp),a
4364  0a89 02            	rlwa	x,a
4366                     ; 605         ch[4] = ((value % 10) + 0x30);
4368  0a8a 1e12          	ldw	x,(OFST+12,sp)
4369  0a8c a60a          	ld	a,#10
4370  0a8e cd0000        	call	c_smodx
4372  0a91 1c0030        	addw	x,#48
4373  0a94 01            	rrwa	x,a
4374  0a95 6b05          	ld	(OFST-1,sp),a
4375  0a97 02            	rlwa	x,a
4377                     ; 606         ch[5] = 0x20;
4379  0a98 a620          	ld	a,#32
4380  0a9a 6b06          	ld	(OFST+0,sp),a
4383  0a9c ac4e0b4e      	jpf	L7631
4384  0aa0               L1731:
4385                     ; 608     else if((value > 99) && (value <= 999))
4387  0aa0 9c            	rvf
4388  0aa1 1e12          	ldw	x,(OFST+12,sp)
4389  0aa3 a30064        	cpw	x,#100
4390  0aa6 2f49          	jrslt	L5731
4392  0aa8 9c            	rvf
4393  0aa9 1e12          	ldw	x,(OFST+12,sp)
4394  0aab a303e8        	cpw	x,#1000
4395  0aae 2e41          	jrsge	L5731
4396                     ; 610         ch[1] = (((value % 1000) / 100) + 0x30);
4398  0ab0 1e12          	ldw	x,(OFST+12,sp)
4399  0ab2 90ae03e8      	ldw	y,#1000
4400  0ab6 cd0000        	call	c_idiv
4402  0ab9 51            	exgw	x,y
4403  0aba a664          	ld	a,#100
4404  0abc cd0000        	call	c_sdivx
4406  0abf 1c0030        	addw	x,#48
4407  0ac2 01            	rrwa	x,a
4408  0ac3 6b02          	ld	(OFST-4,sp),a
4409  0ac5 02            	rlwa	x,a
4411                     ; 611         ch[2] = (((value % 100) / 10) + 0x30);
4413  0ac6 1e12          	ldw	x,(OFST+12,sp)
4414  0ac8 a664          	ld	a,#100
4415  0aca cd0000        	call	c_smodx
4417  0acd a60a          	ld	a,#10
4418  0acf cd0000        	call	c_sdivx
4420  0ad2 1c0030        	addw	x,#48
4421  0ad5 01            	rrwa	x,a
4422  0ad6 6b03          	ld	(OFST-3,sp),a
4423  0ad8 02            	rlwa	x,a
4425                     ; 612         ch[3] = ((value % 10) + 0x30);
4427  0ad9 1e12          	ldw	x,(OFST+12,sp)
4428  0adb a60a          	ld	a,#10
4429  0add cd0000        	call	c_smodx
4431  0ae0 1c0030        	addw	x,#48
4432  0ae3 01            	rrwa	x,a
4433  0ae4 6b04          	ld	(OFST-2,sp),a
4434  0ae6 02            	rlwa	x,a
4436                     ; 613         ch[4] = 0x20;
4438  0ae7 a620          	ld	a,#32
4439  0ae9 6b05          	ld	(OFST-1,sp),a
4441                     ; 614         ch[5] = 0x20;
4443  0aeb a620          	ld	a,#32
4444  0aed 6b06          	ld	(OFST+0,sp),a
4447  0aef 205d          	jra	L7631
4448  0af1               L5731:
4449                     ; 616     else if((value > 9) && (value <= 99))
4451  0af1 9c            	rvf
4452  0af2 1e12          	ldw	x,(OFST+12,sp)
4453  0af4 a3000a        	cpw	x,#10
4454  0af7 2f37          	jrslt	L1041
4456  0af9 9c            	rvf
4457  0afa 1e12          	ldw	x,(OFST+12,sp)
4458  0afc a30064        	cpw	x,#100
4459  0aff 2e2f          	jrsge	L1041
4460                     ; 618         ch[1] = (((value % 100) / 10) + 0x30);
4462  0b01 1e12          	ldw	x,(OFST+12,sp)
4463  0b03 a664          	ld	a,#100
4464  0b05 cd0000        	call	c_smodx
4466  0b08 a60a          	ld	a,#10
4467  0b0a cd0000        	call	c_sdivx
4469  0b0d 1c0030        	addw	x,#48
4470  0b10 01            	rrwa	x,a
4471  0b11 6b02          	ld	(OFST-4,sp),a
4472  0b13 02            	rlwa	x,a
4474                     ; 619         ch[2] = ((value % 10) + 0x30);
4476  0b14 1e12          	ldw	x,(OFST+12,sp)
4477  0b16 a60a          	ld	a,#10
4478  0b18 cd0000        	call	c_smodx
4480  0b1b 1c0030        	addw	x,#48
4481  0b1e 01            	rrwa	x,a
4482  0b1f 6b03          	ld	(OFST-3,sp),a
4483  0b21 02            	rlwa	x,a
4485                     ; 620         ch[3] = 0x20;
4487  0b22 a620          	ld	a,#32
4488  0b24 6b04          	ld	(OFST-2,sp),a
4490                     ; 621         ch[4] = 0x20;
4492  0b26 a620          	ld	a,#32
4493  0b28 6b05          	ld	(OFST-1,sp),a
4495                     ; 622         ch[5] = 0x20;
4497  0b2a a620          	ld	a,#32
4498  0b2c 6b06          	ld	(OFST+0,sp),a
4501  0b2e 201e          	jra	L7631
4502  0b30               L1041:
4503                     ; 626         ch[1] = ((value % 10) + 0x30);
4505  0b30 1e12          	ldw	x,(OFST+12,sp)
4506  0b32 a60a          	ld	a,#10
4507  0b34 cd0000        	call	c_smodx
4509  0b37 1c0030        	addw	x,#48
4510  0b3a 01            	rrwa	x,a
4511  0b3b 6b02          	ld	(OFST-4,sp),a
4512  0b3d 02            	rlwa	x,a
4514                     ; 627         ch[2] = 0x20;
4516  0b3e a620          	ld	a,#32
4517  0b40 6b03          	ld	(OFST-3,sp),a
4519                     ; 628         ch[3] = 0x20;
4521  0b42 a620          	ld	a,#32
4522  0b44 6b04          	ld	(OFST-2,sp),a
4524                     ; 629         ch[4] = 0x20;
4526  0b46 a620          	ld	a,#32
4527  0b48 6b05          	ld	(OFST-1,sp),a
4529                     ; 630         ch[5] = 0x20;
4531  0b4a a620          	ld	a,#32
4532  0b4c 6b06          	ld	(OFST+0,sp),a
4534  0b4e               L7631:
4535                     ; 633     print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
4537  0b4e 96            	ldw	x,sp
4538  0b4f 1c0001        	addw	x,#OFST-5
4539  0b52 89            	pushw	x
4540  0b53 1e12          	ldw	x,(OFST+12,sp)
4541  0b55 89            	pushw	x
4542  0b56 1e12          	ldw	x,(OFST+12,sp)
4543  0b58 89            	pushw	x
4544  0b59 7b13          	ld	a,(OFST+13,sp)
4545  0b5b 88            	push	a
4546  0b5c 1e12          	ldw	x,(OFST+12,sp)
4547  0b5e 89            	pushw	x
4548  0b5f 1e10          	ldw	x,(OFST+10,sp)
4549  0b61 cd088e        	call	_print_str
4551  0b64 5b09          	addw	sp,#9
4552                     ; 634 }
4555  0b66 5b08          	addw	sp,#8
4556  0b68 81            	ret
4559                     	switch	.const
4560  01ea               L5041_ch:
4561  01ea 2e            	dc.b	46
4562  01eb 20            	dc.b	32
4563  01ec 20            	dc.b	32
4564  01ed 20            	dc.b	32
4565  01ee 20            	dc.b	32
4662                     ; 637 void print_D(signed int x_pos, signed int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, unsigned int value, unsigned char points)
4662                     ; 638 {
4663                     	switch	.text
4664  0b69               _print_D:
4666  0b69 89            	pushw	x
4667  0b6a 5205          	subw	sp,#5
4668       00000005      OFST:	set	5
4671                     ; 639     char ch[5] = {0x2E, 0x20, 0x20, 0x20, 0x20};
4673  0b6c 96            	ldw	x,sp
4674  0b6d 1c0001        	addw	x,#OFST-4
4675  0b70 90ae01ea      	ldw	y,#L5041_ch
4676  0b74 a605          	ld	a,#5
4677  0b76 cd0000        	call	c_xymvx
4679                     ; 641     ch[1] = ((value / 1000) + 0x30);
4681  0b79 1e11          	ldw	x,(OFST+12,sp)
4682  0b7b 90ae03e8      	ldw	y,#1000
4683  0b7f 65            	divw	x,y
4684  0b80 1c0030        	addw	x,#48
4685  0b83 01            	rrwa	x,a
4686  0b84 6b02          	ld	(OFST-3,sp),a
4687  0b86 02            	rlwa	x,a
4689                     ; 643     if(points > 1)
4691  0b87 7b13          	ld	a,(OFST+14,sp)
4692  0b89 a102          	cp	a,#2
4693  0b8b 253d          	jrult	L1641
4694                     ; 645         ch[2] = (((value % 1000) / 100) + 0x30);
4696  0b8d 1e11          	ldw	x,(OFST+12,sp)
4697  0b8f 90ae03e8      	ldw	y,#1000
4698  0b93 65            	divw	x,y
4699  0b94 51            	exgw	x,y
4700  0b95 a664          	ld	a,#100
4701  0b97 62            	div	x,a
4702  0b98 1c0030        	addw	x,#48
4703  0b9b 01            	rrwa	x,a
4704  0b9c 6b03          	ld	(OFST-2,sp),a
4705  0b9e 02            	rlwa	x,a
4707                     ; 647         if(points > 2)
4709  0b9f 7b13          	ld	a,(OFST+14,sp)
4710  0ba1 a103          	cp	a,#3
4711  0ba3 2525          	jrult	L1641
4712                     ; 649             ch[3] = (((value % 100) / 10) + 0x30);
4714  0ba5 1e11          	ldw	x,(OFST+12,sp)
4715  0ba7 a664          	ld	a,#100
4716  0ba9 62            	div	x,a
4717  0baa 5f            	clrw	x
4718  0bab 97            	ld	xl,a
4719  0bac a60a          	ld	a,#10
4720  0bae 62            	div	x,a
4721  0baf 1c0030        	addw	x,#48
4722  0bb2 01            	rrwa	x,a
4723  0bb3 6b04          	ld	(OFST-1,sp),a
4724  0bb5 02            	rlwa	x,a
4726                     ; 651             if(points > 3)
4728  0bb6 7b13          	ld	a,(OFST+14,sp)
4729  0bb8 a104          	cp	a,#4
4730  0bba 250e          	jrult	L1641
4731                     ; 653                 ch[4] = ((value % 10) + 0x30);
4733  0bbc 1e11          	ldw	x,(OFST+12,sp)
4734  0bbe a60a          	ld	a,#10
4735  0bc0 62            	div	x,a
4736  0bc1 5f            	clrw	x
4737  0bc2 97            	ld	xl,a
4738  0bc3 1c0030        	addw	x,#48
4739  0bc6 01            	rrwa	x,a
4740  0bc7 6b05          	ld	(OFST+0,sp),a
4741  0bc9 02            	rlwa	x,a
4743  0bca               L1641:
4744                     ; 658     print_str(x_pos, y_pos, font_size, colour, back_colour, ch);
4746  0bca 96            	ldw	x,sp
4747  0bcb 1c0001        	addw	x,#OFST-4
4748  0bce 89            	pushw	x
4749  0bcf 1e11          	ldw	x,(OFST+12,sp)
4750  0bd1 89            	pushw	x
4751  0bd2 1e11          	ldw	x,(OFST+12,sp)
4752  0bd4 89            	pushw	x
4753  0bd5 7b12          	ld	a,(OFST+13,sp)
4754  0bd7 88            	push	a
4755  0bd8 1e11          	ldw	x,(OFST+12,sp)
4756  0bda 89            	pushw	x
4757  0bdb 1e0f          	ldw	x,(OFST+10,sp)
4758  0bdd cd088e        	call	_print_str
4760  0be0 5b09          	addw	sp,#9
4761                     ; 659 }
4764  0be2 5b07          	addw	sp,#7
4765  0be4 81            	ret
4865                     ; 662 void print_F(signed int x_pos, signed int y_pos, unsigned char font_size, unsigned int colour, unsigned int back_colour, float value, unsigned char points)
4865                     ; 663 {
4866                     	switch	.text
4867  0be5               _print_F:
4869  0be5 89            	pushw	x
4870  0be6 5208          	subw	sp,#8
4871       00000008      OFST:	set	8
4874                     ; 664     signed long tmp = 0x0000;
4876                     ; 666     tmp = value;
4878  0be8 96            	ldw	x,sp
4879  0be9 1c0014        	addw	x,#OFST+12
4880  0bec cd0000        	call	c_ltor
4882  0bef cd0000        	call	c_ftol
4884  0bf2 96            	ldw	x,sp
4885  0bf3 1c0005        	addw	x,#OFST-3
4886  0bf6 cd0000        	call	c_rtol
4889                     ; 667     print_I(x_pos, y_pos, font_size, colour, back_colour, tmp);
4891  0bf9 1e07          	ldw	x,(OFST-1,sp)
4892  0bfb 89            	pushw	x
4893  0bfc 1e14          	ldw	x,(OFST+12,sp)
4894  0bfe 89            	pushw	x
4895  0bff 1e14          	ldw	x,(OFST+12,sp)
4896  0c01 89            	pushw	x
4897  0c02 7b15          	ld	a,(OFST+13,sp)
4898  0c04 88            	push	a
4899  0c05 1e14          	ldw	x,(OFST+12,sp)
4900  0c07 89            	pushw	x
4901  0c08 1e12          	ldw	x,(OFST+10,sp)
4902  0c0a cd09aa        	call	_print_I
4904  0c0d 5b09          	addw	sp,#9
4905                     ; 668     tmp = ((value - tmp) * 10000);
4907  0c0f 96            	ldw	x,sp
4908  0c10 1c0005        	addw	x,#OFST-3
4909  0c13 cd0000        	call	c_ltor
4911  0c16 cd0000        	call	c_ltof
4913  0c19 96            	ldw	x,sp
4914  0c1a 1c0001        	addw	x,#OFST-7
4915  0c1d cd0000        	call	c_rtol
4918  0c20 96            	ldw	x,sp
4919  0c21 1c0014        	addw	x,#OFST+12
4920  0c24 cd0000        	call	c_ltor
4922  0c27 96            	ldw	x,sp
4923  0c28 1c0001        	addw	x,#OFST-7
4924  0c2b cd0000        	call	c_fsub
4926  0c2e ae01ef        	ldw	x,#L5451
4927  0c31 cd0000        	call	c_fmul
4929  0c34 cd0000        	call	c_ftol
4931  0c37 96            	ldw	x,sp
4932  0c38 1c0005        	addw	x,#OFST-3
4933  0c3b cd0000        	call	c_rtol
4936                     ; 670     if(tmp < 0)
4938  0c3e 9c            	rvf
4939  0c3f 9c            	rvf
4940  0c40 0d05          	tnz	(OFST-3,sp)
4941  0c42 2e07          	jrsge	L1551
4942                     ; 672        tmp = -tmp;
4944  0c44 96            	ldw	x,sp
4945  0c45 1c0005        	addw	x,#OFST-3
4946  0c48 cd0000        	call	c_lgneg
4949  0c4b               L1551:
4950                     ; 675     if((value >= 9999) && (value < 99999))
4952  0c4b 9c            	rvf
4953  0c4c ae270f        	ldw	x,#9999
4954  0c4f cd0000        	call	c_itof
4956  0c52 96            	ldw	x,sp
4957  0c53 1c0001        	addw	x,#OFST-7
4958  0c56 cd0000        	call	c_rtol
4961  0c59 96            	ldw	x,sp
4962  0c5a 1c0014        	addw	x,#OFST+12
4963  0c5d cd0000        	call	c_ltor
4965  0c60 96            	ldw	x,sp
4966  0c61 1c0001        	addw	x,#OFST-7
4967  0c64 cd0000        	call	c_fcmp
4969  0c67 2f49          	jrslt	L3551
4971  0c69 9c            	rvf
4972  0c6a ae869f        	ldw	x,#34463
4973  0c6d bf02          	ldw	c_lreg+2,x
4974  0c6f ae0001        	ldw	x,#1
4975  0c72 bf00          	ldw	c_lreg,x
4976  0c74 cd0000        	call	c_ltof
4978  0c77 96            	ldw	x,sp
4979  0c78 1c0001        	addw	x,#OFST-7
4980  0c7b cd0000        	call	c_rtol
4983  0c7e 96            	ldw	x,sp
4984  0c7f 1c0014        	addw	x,#OFST+12
4985  0c82 cd0000        	call	c_ltor
4987  0c85 96            	ldw	x,sp
4988  0c86 1c0001        	addw	x,#OFST-7
4989  0c89 cd0000        	call	c_fcmp
4991  0c8c 2e24          	jrsge	L3551
4992                     ; 677         print_D((x_pos + (0x24 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
4994  0c8e 7b18          	ld	a,(OFST+16,sp)
4995  0c90 88            	push	a
4996  0c91 1e08          	ldw	x,(OFST+0,sp)
4997  0c93 89            	pushw	x
4998  0c94 1e15          	ldw	x,(OFST+13,sp)
4999  0c96 89            	pushw	x
5000  0c97 1e15          	ldw	x,(OFST+13,sp)
5001  0c99 89            	pushw	x
5002  0c9a 7b16          	ld	a,(OFST+14,sp)
5003  0c9c 88            	push	a
5004  0c9d 1e15          	ldw	x,(OFST+13,sp)
5005  0c9f 89            	pushw	x
5006  0ca0 7b19          	ld	a,(OFST+17,sp)
5007  0ca2 97            	ld	xl,a
5008  0ca3 a624          	ld	a,#36
5009  0ca5 42            	mul	x,a
5010  0ca6 72fb13        	addw	x,(OFST+11,sp)
5011  0ca9 cd0b69        	call	_print_D
5013  0cac 5b0a          	addw	sp,#10
5015  0cae ac3c0e3c      	jpf	L5551
5016  0cb2               L3551:
5017                     ; 679     else if((value >= 999) && (value < 9999))
5019  0cb2 9c            	rvf
5020  0cb3 ae03e7        	ldw	x,#999
5021  0cb6 cd0000        	call	c_itof
5023  0cb9 96            	ldw	x,sp
5024  0cba 1c0001        	addw	x,#OFST-7
5025  0cbd cd0000        	call	c_rtol
5028  0cc0 96            	ldw	x,sp
5029  0cc1 1c0014        	addw	x,#OFST+12
5030  0cc4 cd0000        	call	c_ltor
5032  0cc7 96            	ldw	x,sp
5033  0cc8 1c0001        	addw	x,#OFST-7
5034  0ccb cd0000        	call	c_fcmp
5036  0cce 2f42          	jrslt	L7551
5038  0cd0 9c            	rvf
5039  0cd1 ae270f        	ldw	x,#9999
5040  0cd4 cd0000        	call	c_itof
5042  0cd7 96            	ldw	x,sp
5043  0cd8 1c0001        	addw	x,#OFST-7
5044  0cdb cd0000        	call	c_rtol
5047  0cde 96            	ldw	x,sp
5048  0cdf 1c0014        	addw	x,#OFST+12
5049  0ce2 cd0000        	call	c_ltor
5051  0ce5 96            	ldw	x,sp
5052  0ce6 1c0001        	addw	x,#OFST-7
5053  0ce9 cd0000        	call	c_fcmp
5055  0cec 2e24          	jrsge	L7551
5056                     ; 681         print_D((x_pos + (0x1E * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
5058  0cee 7b18          	ld	a,(OFST+16,sp)
5059  0cf0 88            	push	a
5060  0cf1 1e08          	ldw	x,(OFST+0,sp)
5061  0cf3 89            	pushw	x
5062  0cf4 1e15          	ldw	x,(OFST+13,sp)
5063  0cf6 89            	pushw	x
5064  0cf7 1e15          	ldw	x,(OFST+13,sp)
5065  0cf9 89            	pushw	x
5066  0cfa 7b16          	ld	a,(OFST+14,sp)
5067  0cfc 88            	push	a
5068  0cfd 1e15          	ldw	x,(OFST+13,sp)
5069  0cff 89            	pushw	x
5070  0d00 7b19          	ld	a,(OFST+17,sp)
5071  0d02 97            	ld	xl,a
5072  0d03 a61e          	ld	a,#30
5073  0d05 42            	mul	x,a
5074  0d06 72fb13        	addw	x,(OFST+11,sp)
5075  0d09 cd0b69        	call	_print_D
5077  0d0c 5b0a          	addw	sp,#10
5079  0d0e ac3c0e3c      	jpf	L5551
5080  0d12               L7551:
5081                     ; 683     else if((value >= 99) && (value < 999))
5083  0d12 9c            	rvf
5084  0d13 a663          	ld	a,#99
5085  0d15 cd0000        	call	c_ctof
5087  0d18 96            	ldw	x,sp
5088  0d19 1c0001        	addw	x,#OFST-7
5089  0d1c cd0000        	call	c_rtol
5092  0d1f 96            	ldw	x,sp
5093  0d20 1c0014        	addw	x,#OFST+12
5094  0d23 cd0000        	call	c_ltor
5096  0d26 96            	ldw	x,sp
5097  0d27 1c0001        	addw	x,#OFST-7
5098  0d2a cd0000        	call	c_fcmp
5100  0d2d 2f42          	jrslt	L3651
5102  0d2f 9c            	rvf
5103  0d30 ae03e7        	ldw	x,#999
5104  0d33 cd0000        	call	c_itof
5106  0d36 96            	ldw	x,sp
5107  0d37 1c0001        	addw	x,#OFST-7
5108  0d3a cd0000        	call	c_rtol
5111  0d3d 96            	ldw	x,sp
5112  0d3e 1c0014        	addw	x,#OFST+12
5113  0d41 cd0000        	call	c_ltor
5115  0d44 96            	ldw	x,sp
5116  0d45 1c0001        	addw	x,#OFST-7
5117  0d48 cd0000        	call	c_fcmp
5119  0d4b 2e24          	jrsge	L3651
5120                     ; 685         print_D((x_pos + (0x18 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
5122  0d4d 7b18          	ld	a,(OFST+16,sp)
5123  0d4f 88            	push	a
5124  0d50 1e08          	ldw	x,(OFST+0,sp)
5125  0d52 89            	pushw	x
5126  0d53 1e15          	ldw	x,(OFST+13,sp)
5127  0d55 89            	pushw	x
5128  0d56 1e15          	ldw	x,(OFST+13,sp)
5129  0d58 89            	pushw	x
5130  0d59 7b16          	ld	a,(OFST+14,sp)
5131  0d5b 88            	push	a
5132  0d5c 1e15          	ldw	x,(OFST+13,sp)
5133  0d5e 89            	pushw	x
5134  0d5f 7b19          	ld	a,(OFST+17,sp)
5135  0d61 97            	ld	xl,a
5136  0d62 a618          	ld	a,#24
5137  0d64 42            	mul	x,a
5138  0d65 72fb13        	addw	x,(OFST+11,sp)
5139  0d68 cd0b69        	call	_print_D
5141  0d6b 5b0a          	addw	sp,#10
5143  0d6d ac3c0e3c      	jpf	L5551
5144  0d71               L3651:
5145                     ; 687     else if((value >= 9) && (value < 99))
5147  0d71 9c            	rvf
5148  0d72 a609          	ld	a,#9
5149  0d74 cd0000        	call	c_ctof
5151  0d77 96            	ldw	x,sp
5152  0d78 1c0001        	addw	x,#OFST-7
5153  0d7b cd0000        	call	c_rtol
5156  0d7e 96            	ldw	x,sp
5157  0d7f 1c0014        	addw	x,#OFST+12
5158  0d82 cd0000        	call	c_ltor
5160  0d85 96            	ldw	x,sp
5161  0d86 1c0001        	addw	x,#OFST-7
5162  0d89 cd0000        	call	c_fcmp
5164  0d8c 2f3f          	jrslt	L7651
5166  0d8e 9c            	rvf
5167  0d8f a663          	ld	a,#99
5168  0d91 cd0000        	call	c_ctof
5170  0d94 96            	ldw	x,sp
5171  0d95 1c0001        	addw	x,#OFST-7
5172  0d98 cd0000        	call	c_rtol
5175  0d9b 96            	ldw	x,sp
5176  0d9c 1c0014        	addw	x,#OFST+12
5177  0d9f cd0000        	call	c_ltor
5179  0da2 96            	ldw	x,sp
5180  0da3 1c0001        	addw	x,#OFST-7
5181  0da6 cd0000        	call	c_fcmp
5183  0da9 2e22          	jrsge	L7651
5184                     ; 689         print_D((x_pos + (0x12 * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
5186  0dab 7b18          	ld	a,(OFST+16,sp)
5187  0dad 88            	push	a
5188  0dae 1e08          	ldw	x,(OFST+0,sp)
5189  0db0 89            	pushw	x
5190  0db1 1e15          	ldw	x,(OFST+13,sp)
5191  0db3 89            	pushw	x
5192  0db4 1e15          	ldw	x,(OFST+13,sp)
5193  0db6 89            	pushw	x
5194  0db7 7b16          	ld	a,(OFST+14,sp)
5195  0db9 88            	push	a
5196  0dba 1e15          	ldw	x,(OFST+13,sp)
5197  0dbc 89            	pushw	x
5198  0dbd 7b19          	ld	a,(OFST+17,sp)
5199  0dbf 97            	ld	xl,a
5200  0dc0 a612          	ld	a,#18
5201  0dc2 42            	mul	x,a
5202  0dc3 72fb13        	addw	x,(OFST+11,sp)
5203  0dc6 cd0b69        	call	_print_D
5205  0dc9 5b0a          	addw	sp,#10
5207  0dcb 206f          	jra	L5551
5208  0dcd               L7651:
5209                     ; 691     else if(value < 9)
5211  0dcd 9c            	rvf
5212  0dce a609          	ld	a,#9
5213  0dd0 cd0000        	call	c_ctof
5215  0dd3 96            	ldw	x,sp
5216  0dd4 1c0001        	addw	x,#OFST-7
5217  0dd7 cd0000        	call	c_rtol
5220  0dda 96            	ldw	x,sp
5221  0ddb 1c0014        	addw	x,#OFST+12
5222  0dde cd0000        	call	c_ltor
5224  0de1 96            	ldw	x,sp
5225  0de2 1c0001        	addw	x,#OFST-7
5226  0de5 cd0000        	call	c_fcmp
5228  0de8 2e52          	jrsge	L5551
5229                     ; 693         print_D((x_pos + (0x0C * font_size)), y_pos, font_size, colour, back_colour, tmp, points);
5231  0dea 7b18          	ld	a,(OFST+16,sp)
5232  0dec 88            	push	a
5233  0ded 1e08          	ldw	x,(OFST+0,sp)
5234  0def 89            	pushw	x
5235  0df0 1e15          	ldw	x,(OFST+13,sp)
5236  0df2 89            	pushw	x
5237  0df3 1e15          	ldw	x,(OFST+13,sp)
5238  0df5 89            	pushw	x
5239  0df6 7b16          	ld	a,(OFST+14,sp)
5240  0df8 88            	push	a
5241  0df9 1e15          	ldw	x,(OFST+13,sp)
5242  0dfb 89            	pushw	x
5243  0dfc 7b19          	ld	a,(OFST+17,sp)
5244  0dfe 97            	ld	xl,a
5245  0dff a60c          	ld	a,#12
5246  0e01 42            	mul	x,a
5247  0e02 72fb13        	addw	x,(OFST+11,sp)
5248  0e05 cd0b69        	call	_print_D
5250  0e08 5b0a          	addw	sp,#10
5251                     ; 695         if(value < 0)
5253  0e0a 9c            	rvf
5254  0e0b 9c            	rvf
5255  0e0c 0d14          	tnz	(OFST+12,sp)
5256  0e0e 2e17          	jrsge	L5751
5257                     ; 697             print_char(x_pos, y_pos, font_size, colour, back_colour, 0x2D);
5259  0e10 4b2d          	push	#45
5260  0e12 1e13          	ldw	x,(OFST+11,sp)
5261  0e14 89            	pushw	x
5262  0e15 1e13          	ldw	x,(OFST+11,sp)
5263  0e17 89            	pushw	x
5264  0e18 7b14          	ld	a,(OFST+12,sp)
5265  0e1a 88            	push	a
5266  0e1b 1e13          	ldw	x,(OFST+11,sp)
5267  0e1d 89            	pushw	x
5268  0e1e 1e11          	ldw	x,(OFST+9,sp)
5269  0e20 cd07c2        	call	_print_char
5271  0e23 5b08          	addw	sp,#8
5273  0e25 2015          	jra	L5551
5274  0e27               L5751:
5275                     ; 701             print_char(x_pos, y_pos, font_size, colour, back_colour, 0x20);
5277  0e27 4b20          	push	#32
5278  0e29 1e13          	ldw	x,(OFST+11,sp)
5279  0e2b 89            	pushw	x
5280  0e2c 1e13          	ldw	x,(OFST+11,sp)
5281  0e2e 89            	pushw	x
5282  0e2f 7b14          	ld	a,(OFST+12,sp)
5283  0e31 88            	push	a
5284  0e32 1e13          	ldw	x,(OFST+11,sp)
5285  0e34 89            	pushw	x
5286  0e35 1e11          	ldw	x,(OFST+9,sp)
5287  0e37 cd07c2        	call	_print_char
5289  0e3a 5b08          	addw	sp,#8
5290  0e3c               L5551:
5291                     ; 704 }
5294  0e3c 5b0a          	addw	sp,#10
5295  0e3e 81            	ret
5308                     	xdef	_print_F
5309                     	xdef	_print_D
5310                     	xdef	_print_I
5311                     	xdef	_print_C
5312                     	xdef	_print_str
5313                     	xdef	_print_char
5314                     	xdef	_Draw_Font_Pixel
5315                     	xdef	_Draw_Circle
5316                     	xdef	_Draw_Rectangle
5317                     	xdef	_Draw_Line
5318                     	xdef	_Draw_Pixel
5319                     	xdef	_TFT_fill
5320                     	xdef	_ST7735_Set_Rotation
5321                     	xdef	_ST7735_Invert_Display
5322                     	xdef	_ST7735_RAM_Address_Set
5323                     	xdef	_ST7735_Set_Addr_Window
5324                     	xdef	_ST7735_Word_Write
5325                     	xdef	_ST7735_init
5326                     	xdef	_ST7735_Reset
5327                     	xdef	_ST7735_Write
5328                     	xdef	_ST7735_HW_init
5329                     	xdef	_SPI_setup
5330                     	xdef	_Color565
5331                     	xdef	_Swap_Colour
5332                     	xref.b	_length
5333                     	xref.b	_width
5334                     	xref	_delay_ms
5335                     	xref	_delay_us
5336                     	xref	_SPI_GetFlagStatus
5337                     	xref	_SPI_SendData
5338                     	xref	_SPI_Cmd
5339                     	xref	_SPI_Init
5340                     	xref	_SPI_DeInit
5341                     	xref	_GPIO_WriteLow
5342                     	xref	_GPIO_WriteHigh
5343                     	xref	_GPIO_Init
5344                     	switch	.const
5345  01ef               L5451:
5346  01ef 461c4000      	dc.w	17948,16384
5347                     	xref.b	c_lreg
5348                     	xref.b	c_x
5349                     	xref.b	c_y
5369                     	xref	c_ctof
5370                     	xref	c_fcmp
5371                     	xref	c_itof
5372                     	xref	c_lgneg
5373                     	xref	c_fmul
5374                     	xref	c_fsub
5375                     	xref	c_ltof
5376                     	xref	c_rtol
5377                     	xref	c_ftol
5378                     	xref	c_ltor
5379                     	xref	c_idiv
5380                     	xref	c_smodx
5381                     	xref	c_sdivx
5382                     	xref	c_xymvx
5383                     	end
