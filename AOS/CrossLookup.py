import json

SFCC_SKU='''
zone1-2dayair
zone1-ground
zone1-overnight
zone2-2dayair
zone2-ground
zone2-overnight
zone3-2dayair
zone3-ground
AOS205
DLXSWP2+
RX0022
ASSAMPLESWELL
AOSWELL5
A91981
ALSWELL
2106
AA2000
AA1001
AA1008
AASCFHS
AA1010
AA1005
AA304
AABROW
AALASH
AA1004
AA2001
AA2003
AAFOIL
AASWELL
AA1000
AA1012
AASWELL3
AA1002
AAVRS
AOS2002
AOSSWELL1
SWELLLUSH
MDSWELL1
AOS2003
AOSWELL3
JL0002
Jl003
AOS1003
1306
JLSP
AUSWELL1
3245
UCSN501
BM1011
MDSWELL
SWELLNELLY
NDSWELL4
BL0000
BO48101
BO48340
BO46603
BO48225
45
BN0002
BN0041
BN0003
BN1131
BN0028
BN0030
BN0013
BN0006
BN0035
BN0014
BN0010
BN1225
BN0020
BN0001
BN0011
BN0040
BN0012
BN0019
BN0031
BNMAN5
1565
BN0004
BN0016
BN0005
BN0017
BN9066
BN0026
BN9913
B72
BN0015
BN102
BNSWELL3
BNSWELL2
BNSWELL6
BNSAMPLE1
BNSWELL4
BNSWELL7
BN0009
BN101
1383
52
BN0024
BN0018
BN0027
BN0029
BN0034
BNSWELL5
3111
BLC007
3110
BLC017
BLC008
3107
BLSWELL1
BLC005
BLC006
3264
BT019
BT018
3311
BT014
BT027
BT005
BT020
BT032
BT015
BT030
BT026
BT021
BT034
3259
BT016
BT008
BT035
3262
BT022
BT023
BT025
3313
BT024
BT029
BT017
AOS203
BOB0003
1999
1405
1700
CG001
1526
CBHOLIDAY
AOS201
RX02
RX22
3063
MD1021
AOSPOP
JL1232
CPRX001
U1018
U2015
U1012
U1007
DLXSWP3
AA1006
FHF0022
FHF0029
IS6390
IS6389
MT006
FHF1260
SO0012
DESWELL4
AO6002
2586
AO6088
DE2022
AO6001
2285
AO3003
2585
2589
AO1005
AO1002
AO1001
2705
DESWELL2
DESWELL5
Ao503
AO504
DESWELL3
EM003
EMSWELL2
EM002
EM001
EMSWELL
EM004
FRSWELL4
EVE001
EMSWELL1
FR0006
FR0007
FR0001
FR0003
FR0004
FRBUNDLE1
FR7088
FR3033
FRANSC
FRSWELL5
FR9077
FRBRIGHT
FR0036
FRCLE
FR3376
FR0027
FR0011
FR0012
FR0013
FRBUNDLE2
FRSWELL2
FRHYD
FR7099
FR0037
FR0038
FR0017
FR0016
FR0015
FR0018
FR0035
FR8077
FR0023
FRSCL
FR8099
FRTRAVEL
FR0080
FRSWELL3
FR0024
FR6088
FR0028
CBMKIT
FHFSWELL8
FHF0232
FHFSWELL3
FHF0041
FHF1256
FHF12205
FHF0002
FHF13189
FHF13172
FHF0013
FHF1406
FHF1390
FHF8099
FHF11987
FHF0782
FHF0015
FHF13042
FHF0014
FHF1310
FHF12663
FHF0039
FHFSWELL12
FHF13158
FHF1245
fhfminiswell
FHF0012
FHF0553
FHF0016
FHF0751
FHF0001
FHFSWELL4
FHF12847
FHF0461
FHF1415
FHF13233
FHF0017
FHF12717
FHF0005
FHF0010
FHFSWELL13
FHF12137
FHF03110
FHF0018
FHF0008
FHF0004
FHF6089
FHFSWELL6
FHF0009
FHF1819
FHF12199
FHF0042
FR3333
FHFSWELL5
FHF1306
FHF1796
FHF12236
FHF1697
FHF1833
FHFSWELL9
FHF0020
FHF0195
FHF0713
FHF0218
FHF0038
FHF0007
FHFSWELL2
FHF1192
FHF1376
FHF12243
FHF0037
FHF0006
FHF0775
FHF0201
FHF13271
FHF1243
FHFSWELL19
FHF12526
FHF0023
FHF0011
FHF12403
FHF6002
FHFSWELL10
FHF0614
FHF6005
FHF6004
FHF11963
FHF1765
FHF1772
FHF0025
FHF1680
FHF1727
FHF0040
FHF1298
FHF11925
FHF0026
FHF13226
FHF0028
FHF0027
FHF6001
FHF1407
FHF0003
FHFSWELL11
FHF0036
FHFSWELL7
FHF1611
FHF0031
HASAMPLESWELL
ROOTFREESAMPLE
eGiftCertificate
HH551R
HH600R
HH200R
HH550R
HH2001
HH4509
HH001
SWELLMIST
1508
HH401R
HH402R
HHDUO1
HH1002
HH700R
HH5016
HHSWELL2
HH400R
HHSWELL1
HH5000
HHSWELL3
HHSWELL5
HHSWELL4
HHSWELL6
HHSWELL7
RX0011
RX0001
DS002
HGSWELL1
AO501
AO502
AOS200
RASWELL19
AOS204
HF512
2633
HF912
HF812
HF412
HF212
HF612
HF1012
HF112
HFSWELL1
HF312
HN014S
HN018S
HN024S
HN103G
HN017S
HN044D
HNSWELL1
HM105P
HN002S
HN114S
HN016S
HN043G
HUMSWELL1
HN032G
HN098S
HN107K
HUMSWELL2
HN063S
HN005S
HN006S
HN089S
HN017T
HN029T
HUMSWELL3
HN007S
HN256S
HN015S
HN013S
HN010S
HN011S
AO2007
AOSWELL7
IL0034
97
ILSWELL1
IL0048
IL0036
IL0037
ILLFlatTop
485
197
1456
ISSWELL9
IS1547
2642
ISSWELL5
IS048
IS020
2651
IS014
ISSWELL11
2672
ISSWELL7
ISRX001
IS039
IS041
2671
IS025
2842
2658
ISGENX
2649
ISSWELL8
IS040
IS023
IS1321
IS047
IS042
IS6394
IS017
3069
2691
2652
ISSWELL1
ISSWELL4
IS037
IS015
2674
ISSWELL3
2650
ISSWELL6
IS038
IS018
IS046
IS016
2673
ISSWELL2
IS019
IS021
IS022
IS024
IS011
ISSWELL13
IS6393
ISOSAMPLE
JI0088
AOS202
LM1601A
LM0001
LM0028
LM0002
LMSWELL2
LM0037
LM0006
LM0031
LM1603
LMBC
LM0045
LMBT
LM1602
LM0033
LM0044
LMDAWN
LMSWELL11
LM0007
LMDBLU
LM1088
LM0008
LM0009
LM0010
LM0011
LM0012
LM0013
LMSWELL3
670
LM0049
LM0050
LMSWELL5
LM1404
LMOBundle
672
2794
LMSWELL8
LM1002
LM0017
LM2023
LM0307
LMMICEX
LM0032
LM8099
676
LM9817
LM9816
LM0038
LMPRN
LM1601
LM0020
LMSWELL13
LM0046
LM0021
LM2022
LM0022
LM0060K
SWELLPD
LM0029
LM7081
LMSWELL4
684
LMSWELL7
LM0024
LMSWELL9
LMSWELL14
LM0025
1477
688
LX0035
LMSWELL12
LMSWELL10
LTSWELL
LS0002
LS0006
3132
LS0001
LS0004
LTSWELL1
LS0003
LL1100
2738
LL0073
LL0102
LLSWELL4
LL0055
LL0100
2752
2745
LL0097
LL0059
LL0098
LL0096
2751
LL0099
3121
2742
LLSWELL3
2755
LLSWELL1
LLSWELL2
LL0077
2746
2744
2739
2737
2754
LL0056
LL0101
2740
2749
LL0054
LL0057
LL0060
LL0047
LL0058
LL0053
LL0103
LL0104
2756
MXGLO
CUR002
CUR001KIT
MBK002
MBK001
MBKSWELL
MBK004
MBK006
T0003
MC1016
MC0002
MC1028
MCSWELL6
MC1017
MC1004
MC1003
MC1018
MC1013
MC1005
MC1006
MC1021
MCSWELL3
MC1007
MCSWELL
MC1031
MC103
MC101
MC1023
MC1001
MC1029
MC1026
MCSWELL5
MC1012
MCPCO
MCSWELL4
MC1008
MC1011
MC1025
MC1030
MC0004
MC1022
MCSWELL7
MC1009
MC1010
MC0011
MC102
MC1014
MC1015
MC1002
MCSWELL2
MFSWELL1
MISC1
MTCLEAR
TMBUNDLE
TR178
MT005
MT007
MIT001
MTSWELL1
MSB004
MTS003
MH0003
MH0001
MH0002
DS003
MSBSWELL
1535
MSB003
ND0024
ND0022
ND0023
ND0025
ND0026
ND0027
ND0012
BFBUNDLE
ND1001
ND0013
ND0014
ND0015
ND0017
ND0019
ND0018
ND0020
ND0021
ND120221
ND13021
ND13025
ND12521
ND13011
ND14001
ND13501
ND14071
ND12021
ND15121
ND13541
ND14101
ND13511
ND12011
ND12031
ND13040
ND0028
ND0001
ND0002
ND035
ND0004
ND0005
ND0006
ND0008
ND0011
ND0009
ND0010
NDSWELL1
ND13051
ND13551
NDSWELL3
NDSWELL5
2264
1742
1749
NGSWELL4
NGSWELL6
1745
NG2012
1707
NGGIFT
NG1033
NG2018
NG2013
NGSWELL
NG2014
NG3001
2780
NGSWELL5
1708
NGSWELL7
NG9077
NG2016
1705
NGSWELL11
NG30010
1706
NG3003
NN1003
NN1002
NN1001
NOSAMPLESWELL
MD1011
PACONSULT
SSPUMP
PEEPAD
PEAST6
PEMCU1
PEDEU1
PEECF21
PEINOS
1570
PELVCL
PE1031
1178
PEUZ9
PE1002
PE5086
PEZL15
3228
SWELLBAR
3236
PE1605
PE0102
LMSWELL6
LM6011
RARR498
RAPS319
AR217
MT81
RAAR218
3075
2418
2973
3005
MT85
RASWELL22
2942
2991
2921
3008
2911
RACB412
SR02
RAAR240
RASWELL13
RASWELL24
RA0019
2928
2913
RASWELL23
RASWELL12
2989
RAAR219
2997
2385
334
2408
RASWELL10
RA001
RASWELL21
RASPPSF1
2361
2349
2348
RASR569
RASR560
SR603
RASR570
3017
314
RASWELL8
3002
MT50
2967
RAAR1
2949
RASWELL26
RARX001
RAAR287
RAMT77
RASWELL16
RACB415
RAMT78
3078
3033
RF2
3006
RACB418
RAMT79
2295
RASWELL11
3058
3059
2999
RA0067
RAMT55
EC4
RASWELL20
EC3
EC1
RF4
2957
1321
2918
3003
RAPS342
3019
3026
3035
RARR553
2992
RASR576
SR577
RASR579
RASR578
RASWELL18
RAAR260
RASR582
2916
3018
RASR564
3004
2952
3046
3012
RAMT124
2994
RATK04
3013
RAAR242
1530
2480
RASWELL17
2920
3060
RA8022
2945
2926
RASWELL25
3084
EC6
2929
2965
3034
3048
2426
2993
2940
3021
2970
3039
RA003
RASWELL14
2472
EC5
2353
3011
RASR581
RASR580
3010
3047
1125
633
2333
2365
EC2
RAPS340
RACB419
RAMT83
2425
RA0146
SR600
MT93
2919
2308
RAMTT2
185
2995
RACB437
SR604
2968
RARR502
3025
2915
2937
2302
RASR561
RAMTLS1
RASWELL9
3045
2360
RARR504
RAAR210
RACB400
MT52
3027
RAAR212
RASWELL15
2463
3030
RF5
2345
2362
RAAR238
2325
2980
3009
3176
RAPS341
RAMT51
RARR496
RARR511
RASR568
RA002
3001
RAMT95
2998
3062
RAAR236
RAPS344
3061
RAAR258
3007
RASR571
RASR601
RACB422
2473
SCURX001
AOSWELL6
AO2006
AO5001
AO0001
AOSYSTEM
AO301
AOSWELL8
AOSWELL2
2230
SN101
SE0005
SNSWELL3
2602
SE0007
2908
SESWELL
2909
SE0006
2603
SE0008
2601
SNSWELL1
SE2001
2600
SN2001
SE1001
SHIPUP
RA0186
AM0003
RA0027M
MS2S10
708
SSWELL9
SSSWELL6
706
SSWELL10
709
SS039
SS013
SS053
SS037
1578
SS047
SS012
SS049C
703
SSWELL3
SSSWELL2
ssswell2
SS048-D
SS054
SS006
696
702
711
SSWELL4
SS048
1284
SSWELL6
SS049S
SS048-A
SS045
SS046
ss046
1579
SSWELL5
SS048-MA
SS027
SS052
SS048-O
SS055
SSSWELL
SS008
757
695
697
SS038
SS040
SSSWELL8
SS041
SS11334
SS007
SS048-RS
SS025
SS008-C
705
SSSWELL7
AO5003
AOSWELL1
SSSWELL4
SSWELL7
SSSWELL3
SR0001
SO0022
1603
SASWELL1
SO0026
SO0008
SO0018
SASWELL6
SO0009
SO2001
SO0019
SO0014
SO0020
SO305
SASWELL3
SO0004
SO0010
SO0003
SO0013
SA9988
SO0007
1604
SO0015
SO0016
SO0011
SASWELL4
SO0025
SA7088
SO0017
SO2003
1608
SO0021
SO2000
SO2002
2281
3292
SA2003
SASWELL2
SO0024
SS0111
1607
SO0023
SUSWELL
SASWELL5
SLSWELL1
TA1001
TASWELL
TASSI1
test001
test002
test003
TMPBUNDLE
TMPROBB
TMPROB
TMPROC
TMP101
SWELLOIL
SWELLC
ANMA001K
ANMA002K
AO1003
AO1004
AO3000
AO30002
AO3001
AO3002
AO3004
AO3006
AO3007
AO3008
AOPEEL
AOPEEL1
AR176
AR177
AR215
AR216
AR261
AR262
AR290
AR291
B51
B52
B53
BB0001
BLC001
BLC002
BLC003
BLC004
BLC010
BLC011
BLC012
BLC013
BLC014
BLC015
BN0032
BN0033
BN1022
BNMAN15
BNMAN8
BOB002
BOB1004
BOB1005
BT001
BT002
BT003
BT004
BT006
BT007
BT010
BT011
BT012
BT013
BX001
BX002
CB416
CB417
CBUNDLE1
CBUNDLE2
CBUNDLE3
CC5012
CC5013
HF1013
HF712
HH100A
HH100R
ICL01
ICL02
ICL03
ICL04
ICL05
IL0008
IL0009
IL0010
IL0011
IL0017
IL0018
IL0019
IL0020
IL0021
IL0040
IL0041
IL0042
IL0043
IL0044
ILPCB1
ILPCB2
ILPCB3
ILPCB4
ILPCB5
IS001
IS002
IS003
IS004
IS005
IS006
IS007
IS008
IS009
IS010
IS012
IS013
IS026
IS027
IS028
IS029
IS030
IS031
IS032
IS033
IS035
IS036
IS043
IS044
IS045
IS1371
IS1372
IS1373
IS1374
IS1375
Il3008
JL0001
JL0004
LL0001
LL0002
LL0003
LL0004
LL0005
LL0006
LL0007
LL0008
LL0009
LL0010
LL0011
LL0012
LL0013
LL0014
LL0015
LL0016
LL0017
LL0018
LL0019
LL0020
LL0034
LL0035
LL0036
LL0037
LL0038
LL0039
LL0040
LL0041
LL0042
LL0043
LL0044
LL0045
LL0048
LL0049
LL0050
LL0051
LL0061
LL0062
LL0063
LL0064
LL0065
LL0066
LL0067
LL0068
LL0069
LL0070
LL0071
LL0072
LL0074
LL0075
LL0076
LL0078
LL0079
LL0080
LL0081
LL0082
LL0083
LL0084
LL0085
LL0086
LL0087
LL0088
LL0089
LL0090
LL0091
LL0092
LL0093
LL0094
LL0095
LL0105
LL0106
LL0107
LL0108
LL0109
LL0110
LL0111
LL0112
LL0113
LL0114
LL0115
LL0116
LL0117
LL0118
LL0119
LL0120
LL0121
LL0122
LL0123
LL0124
LL0125
LL0126
LL0127
LL0128
LL1101
LL1102
LL2998
LL3000
LM0015
LM0016
LM0018
LM0023
LM0026
LM0051
LM0052
LM0308
LM0601
LM0602
LM1999
LM5001
LM5002
LM5003
LM9955
LS002
LS003
MSB001K
MSB002K
MT146
MT147
MT148
MT149
MT15
MT16
MT36
MT37
MT87
MT88
ND13041
ND13047
NG001
NG0010
NG0011
NG0012
NG002
NG003
NG004
NG005
NG005S
NG006
NG007
NG008
NG009
NG010
NG10001
NG2008
NG2009
NG2010
NG2011
NG2015
NG6089
PE0105
PE0106
PE0204
PE0205
PE3365
PEEPA
PELSG3
PEONO6
PS300
PS301
PS312
PS313
PS323
PS324
PS358
PS359
RA0030
RA0031
RA01
RA0141
RA02
RA03
RA04
RA32
RA33
RA5566
RAAR170
RAAR171
RAAR172
RAAR173
RAAR174
RAAR175
RAAR190
RAAR191
RAAR192
RAAR193
RAAR194
RAAR195
RAAR196
RAAR197
RAAR198
RAAR199
RAAR213
RAAR214
RAAR263
RAAR264
RAAR280
RAAR281
RAAR282
RAAR283
RAAR284
RAAR285
RAAR286
RAAR288
RAAR289
RAAR531
RAAR532
RAAR910
RAAR911
RACB2022
RACB2023
RACB380
RACB381
RACB382
RACB383
RACB392
RACB393
RACB402
RACB403
RACB420
RACB421
RACB431
RACB432
RACB433
RACB434
RACB435
RACB436
RACB438
RACB439
RACB440
RACB441
RACB442
RACB443
RACB450
RACB451
RACB452
RACB453
RAMT05
RAMT06
RAMT112
RAMT113
RAMT114
RAMT115
RAMT116
RAMT117
RAMT118
RAMT119
RAMT120
RAMT121
RAMT122
RAMT123
RAMT126
RAMT127
RAMT128
RAMT129
RAMT130
RAMT131
RAMT132
RAMT133
RAMT144
RAMT145
RAMT150
RAMT151
RAMT152
RAMT153
RAMT154
RAMT155
RAMT17
RAMT18
RAMT30
RAMT306
RAMT307
RAMT31
RAMT34
RAMT35
RAMT38
RAMT39
RAMT53
RAMT54
RAMT57
RAMT58
RAMT74
RAMT75
RAMT89
RAMT90
RAMT91
RAMT92
RAPS302
RAPS303
RAPS304
RAPS305
RAPS321
RAPS322
RAPS354
RAPS355
RAPS356
RAPS357
RAPS366
RAPS367
RAPS368
RAPS369
RARR470
RARR471
RARR472
RARR473
RARR474
RARR475
RARR484
RARR485
RARR486
RARR487
RARR488
RARR489
RARR500
RARR501
RARR515
RARR516
RARR517
RARR518
RARR519
RARR520
RARR533
RARR534
RARR535
RARR536
RARR537
RARR538
RARR539
RARR540
RARR541
RARR542
RARR551
RARR552
SA6000
SA6001
SA6002
SC0011
SC0012
SE0001
SE0002
SE0003
SE0004
SE0009
SE0010
SE0011
SE0012
SE0013
SE0014
SE0015
SE0016
SO0001
SO0002
SO0005
SO0006
SO1001
SO1002
SO1003
SO1004
SO301
SO302
SO303
SO304
SS001
SS001T
SS003
SS003T
SS005
SS0052K
SS009
SS009BK
SS010
SS010BK
SS011
SS011T
SS014
SS014BK
SS021
SS021B
SS024
SS024B
SS034
SS034T
SS035
SS035BK
SS035T
SS036
SS036T
SS043F
SS044
SS044F
SS1043
SSPR2
'''

SFCC_SKULIST = []

for SKU in SFCC_SKU.split():
    SFCC_SKULIST.append(SKU)

#print(SFCC_SKULIST)

with open('Code.json') as f:
   data = json.load(f)
   SKU =[]
   for sku in data["QueryResponse"]["Item"]:
        try:
            SKU.append(sku["Sku"])
        except:
            pass
            #print("not found")

missing_sku =[]

print("SFCC SKU Size")
print(SFCC_SKULIST.__len__())

print("QBO SKU Size")
print(SKU.__len__())

counter=0

for sku in SFCC_SKULIST:
    status = sku in SKU
    if status!=True:
        counter=counter+1
        missing_sku.append(sku)

print("=================")
print("QBO SKU")
print(SKU)

print("=================")
print("SFCC SKU")
print(SFCC_SKULIST)


print("=================")
print("Missing SKU")
print(missing_sku)