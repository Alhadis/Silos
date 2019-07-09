module OAOAI2111HSV0 ( ZN, A1, A2, B, C, D)
input A1, A2, B, C, D
output ZN

timing A1 ZN, 0.06069
timing A2 ZN, 0.06255
timing B ZN, 0.04426
timing C ZN, 0.02683
timing D ZN, 0.01763

module CLKNHSV0 (ZN, I)
input I
output ZN

timing I ZN, 0.011565

module AOI21HSV0 ( ZN, A1, A2, B)
input A1, A2, B
output ZN

timing A1 ZN, 0.06069
timing A2 ZN, 0.06255
timing B ZN, 0.04426

module OAI211HSV0 ( ZN, A1, A2, B, C)
input A1, A2, B, C
output ZN

timing A1 ZN, 0.06069
timing A2 ZN, 0.06255
timing B ZN, 0.04426
timing C ZN, 0.02683

module CLKNAND2HSV0 ( ZN, A1, A2)
input A1, A2
output ZN

timing A1 ZN, 0.01502
timing A2 ZN, 0.01676

module NOR2HSV0 ( ZN, A1, A2)
input A1, A2
output ZN

timing A1 ZN, 0.01808
timing A2 ZN, 0.02020

module AOI211HSV0 ( ZN, A1, A2, B, C) 
input A1, A2, B, C
output ZN

timing A1 ZN, 0.03868
timing A2 ZN, 0.04225
timing B ZN, 0.02554
timing C ZN, 0.02399

module OAI21HSV0 ( ZN, A1, A2, B) 
input A1, A2, B
output ZN

timing A1 ZN, 0.02779
timing A2 ZN, 0.03027
timing B ZN, 0.01836

module NOR4HSV0 ( ZN, A1, A2, A3, A4)
input A1, A2, A3, A4
output ZN

timing A1 ZN, 0.03448
timing A2 ZN, 0.03973
timing A3 ZN, 0.02946
timing A4 ZN, 0.04461

module AO21HSV0 ( Z, A1, A2, B)
input A1, A2, B
output Z

timing A1 Z, 0.04796
timing A2 Z, 0.05049
timing B Z, 0.03231

module NAND4HSV0 ( ZN, A1, A2, A3, A4)
input A1, A2, A3, A4
output ZN

timing A1 ZN, 0.02864
timing A2 ZN, 0.03355
timing A3 ZN, 0.03651
timing A4 ZN, 0.03829

module AOI222HSV0 ( ZN, A1, A2, B1, B2, C1, C2)
input A1, A2, B1, B2, C1, C2
output ZN

timing A1 ZN, 0.03362
timing A2 ZN, 0.03360
timing B1 ZN, 0.04398
timing B2 ZN, 0.04208
timing C1 ZN, 0.04656
timing C2 ZN, 0.04884

module OA211HSV0 ( Z, A1, A2, B, C)
input A1, A2, B, C
output Z

timing A1 Z, 0.05551
timing A2 Z, 0.05904
timing B Z, 0.05504
timing C Z, 0.05723

module OAI222HSV0 ( ZN, A1, A2, B1, B2, C1, C2) 
input A1, A2, B1, B2, C1, C2
output ZN

timing A1 ZN, 0.04558
timing A2 ZN, 0.04876
timing B1 ZN, 0.05195
timing B2 ZN, 0.05769
timing C1 ZN, 0.03787
timing C2 ZN, 0.04114

module AND4HSV0 ( Z, A1, A2, A3, A4)
input A1, A2, A3, A4
output Z

timing A1 Z, 0.05432
timing A2 Z, 0.05897
timing A3 Z, 0.06192
timing A4 Z, 0.06547

module OAI221HSV0 ( ZN, A1, A2, B1, B2, C)
input A1, A2, B1, B2, C
output ZN

timing A1 ZN, 0.03834
timing A2 ZN, 0.04093
timing B1 ZN, 0.04470
timing B2 ZN, 0.04764
timing C ZN, 0.02415

module AOI32HSV0 ( ZN, A1, A2, A3, B1, B2) 
input A1, A2, A3, B1, B2
output ZN

timing A1 ZN, 0.03720
timing A2 ZN, 0.04068
timing A3 ZN, 0.04578
timing B1 ZN, 0.01916
timing B2 ZN, 0.02159

module OAI33HSV1 ( ZN, A1, A2, A3, B1, B2, B3)
input A1, A2, A3, B1, B2, B3
output ZN

timing A1 ZN, 0.04469
timing A2 ZN, 0.05146
timing A3 ZN, 0.05414
timing B1 ZN, 0.03136
timing B2 ZN, 0.03843
timing B3 ZN, 0.04249

module NOR3HSV0 ( ZN, A1, A2, A3)
input A1, A2, A3
output ZN

timing A1 ZN, 0.02595
timing A2 ZN, 0.02945
timing A3 ZN, 0.03105

module AOI31HSV0 ( ZN, A1, A2, A3, B)
input A1, A2, A3, B
output ZN

timing A1 ZN, 0.03265
timing A2 ZN, 0.03635
timing A3 ZN, 0.03846
timing B ZN, 0.01477

module OAI31HSV0 ( ZN, A1, A2, A3, B)
input A1, A2, A3, B
output ZN

timing A1 ZN, 0.03505
timing A2 ZN, 0.04026
timing A3 ZN, 0.04293
timing B ZN, 0.01942

module NAND3HSV0 ( ZN, A1, A2, A3)
input A1, A2, A3
output ZN

timing A1 ZN, 0.02263
timing A2 ZN, 0.02474
timing A3 ZN, 0.02625

module INOR2HSV0 ( ZN, A1, B1)
input A1, B1
output ZN

timing A1 ZN, 0.03383
timing B1 ZN, 0.01961

module OA33HSV0 ( Z, A1, A2, A3, B1, B2, B3) 
input A1, A2, A3, B1, B2, B3
output Z

timing A1 Z, 0.06489
timing A2 Z, 0.07183
timing A3 Z, 0.07346
timing B1 Z, 0.07890
timing B2 Z, 0.08357
timing B3 Z, 0.08970

module AND2HSV0 ( Z, A1, A2)
input A1, A2
output Z

timing A1 Z, 0.03439
timing A2 Z, 0.03692

module AOI33HSV0 ( ZN, A1, A2, A3, B1, B2, B3)
input A1, A2, A3, B1, B2, B3
output ZN

timing A1 ZN, 0.04113
timing A2 ZN, 0.04383
timing A3 ZN, 0.04556
timing B1 ZN, 0.02581
timing B2 ZN, 0.02961
timing B3 ZN, 0.03097

module AOI221HSV0 ( ZN, A1, A2, B1, B2, C)
input A1, A2, B1, B2, C
output ZN

timing A1 ZN, 0.04160
timing A2 ZN, 0.04461
timing B1 ZN, 0.03418
timing B2 ZN, 0.03789
timing C ZN, 0.02038

module OAI22HSV0 ( ZN, A1, A2, B1, B2)
input A1, A2, B1, B2
output ZN

timing A1 ZN, 0.04935
timing A2 ZN, 0.02888
timing B1 ZN, 0.03316
timing B2 ZN, 0.03657

module IAO22HSV0 ( ZN, A1, A2, B1, B2)
input A1, A2, B1, B2
output ZN

timing A1 ZN, 0.04384
timing A2 ZN, 0.04344
timing B1 ZN, 0.02782
timing B2 ZN, 0.02974

module IAO21HSV0 ( ZN, A1, A2, B)
input A1, A2, B
output ZN

timing A1 ZN, 0.04392
timing A2 ZN, 0.04646
timing B ZN, 0.02016

module IOA22HSV0 ( ZN, A1, A2, B1, B2) 
input A1, A2, B1, B2
output ZN

timing A1 ZN, 0.04438
timing A2 ZN, 0.04689
timing B1 ZN, 0.02847
timing B2 ZN, 0.03082

module XOR2HSV0 ( Z, A1, A2)
input A1, A2
output Z

timing A1 Z, 0.03643
timing A2 Z, 0.06438

module XNOR2HSV0 ( ZN, A1, A2) 
input A1, A2
output ZN

timing A1 ZN, 0.04043
timing A2 ZN, 0.07143

module OA221HSV0 ( Z, A1, A2, B1, B2, C) 
input A1, A2, B1, B2, C
output Z

timing A1 Z, 0.06454
timing A2 Z, 0.06810
timing B1 Z, 0.07293
timing B2 Z, 0.07939
timing C Z, 0.06931

module AND3HSV0 ( Z, A1, A2, A3) 
input A1, A2, A3
output Z

timing A1 Z, 0.04357
timing A2 Z, 0.04586
timing A3 Z, 0.04588

module INOR3HSV0 ( ZN, A1, B1, B2) 
input A1, B1, B2
output ZN

timing A1 ZN, 0.04212
timing B1 ZN, 0.03010
timing B2 ZN, 0.03151

module MUX2NHSV0 ( ZN, I0, I1, S)
input I0, I1, S
output ZN

timing I0 ZN, 0.02742
timing I1 ZN, 0.02521
timing S ZN, 0.01731

module INAND2HSV0 ( ZN, A1, B1)
input A1, B1
output ZN

timing A1 ZN, 0.03337
timing B1 ZN, 0.01735

module AOI22HSV0 ( ZN, A1, A2, B1, B2)
input A1, A2, B1, B2
output ZN

timing A1 ZN, 0.03092
timing A2 ZN, 0.03180
timing B1 ZN, 0.02046
timing B2 ZN, 0.02332

module OAOAOAI211111HSV0 ( ZN, A1, A2, B, C, D, E, F)
input A1, A2, B, C, D, E, F
output ZN

timing A1 ZN, 0.09860
timing A2 ZN, 0.10000
timing B ZN, 0.07604
timing C ZN, 0.05488
timing D ZN, 0.04080
timing E ZN, 0.02573
timing F ZN, 0.01694

module AND5HSV0 ( Z, A1, A2, A3, A4, A5)
input A1, A2, A3, A4, A5
output Z

timing A1 Z, 0.04506
timing A2 Z, 0.04679
timing A3 Z, 0.05334
timing A4 Z, 0.05790
timing A5 Z, 0.06057

module OAOI211HSV0 ( ZN, A1, A2, B, C)
input A1, A2, B, C
output ZN

timing A1 ZN, 0.04533
timing A2 ZN, 0.04643
timing B ZN, 0.02980
timing C ZN, 0.01722

module AOAOI2111HSV0 ( ZN, A1, A2, B, C, D)
input A1, A2, B, C, D
output ZN

timing A1 ZN, 0.05750
timing A2 ZN, 0.06073
timing B ZN, 0.04141
timing C ZN, 0.03008
timing D ZN, 0.01836

module AO211HSV0 ( Z, A1, A2, B, C)
input A1, A2, B, C
output Z

timing A1 Z, 0.06431
timing A2 Z, 0.06945
timing B Z, 0.04640
timing C Z, 0.04361

module AOAI211HSV0 ( ZN, A1, A2, B, C)
input A1, A2, B, C
output ZN

timing A1 ZN, 0.03991
timing A2 ZN, 0.04200
timing B ZN, 0.02434
timing C ZN, 0.01668

module OR3HSV0 ( Z, A1, A2, A3)
input A1, A2, A3
output Z

timing A1 Z, 0.04821
timing A2 Z, 0.05198
timing A3 Z, 0.05489

module AO31HSV0 ( Z, A1, A2, A3, B)
input A1, A2, A3, B
output Z

timing A1 Z, 0.05809
timing A2 Z, 0.06257
timing A3 Z, 0.06619
timing B Z, 0.03259

module OA31HSV0 ( Z, A1, A2, A3, B)
input A1, A2, A3, B
output Z
timing A1 Z, 0.05873
timing A2 Z, 0.06367
timing A3 Z, 0.06705
timing B Z, 0.05058

module INOR4HSV0 ( ZN, A1, B1, B2, B3)
input A1, B1, B2, B3
output ZN

timing A1 ZN, 0.05096
timing B1 ZN, 0.03966
timing B2 ZN, 0.04332
timing B3 ZN, 0.04410

module MUX2HSV0 ( Z, I0, I1, S)
input I0, I1, S
output Z

timing I0 Z, 0.04939
timing I1 Z, 0.04830
timing S Z, 0.05106

module OA21HSV0 ( Z, A1, A2, B)
input A1, A2, B
output Z

timing A1 Z, 0.05117
timing A2 Z, 0.05469
timing B Z, 0.03988

module OA22HSV0 ( Z, A1, A2, B1, B2)
input A1, A2, B1, B2
output Z

timing A1 Z, 0.04531
timing A2 Z, 0.05298
timing B1 Z, 0.05701
timing B2 Z, 0.06148

module INAND4HSV0 ( ZN, A1, B1, B2, B3) 
input A1, B1, B2, B3
output ZN

timing A1 ZN, 0.04716
timing B1 ZN, 0.03324
timing B2 ZN, 0.03684
timing B3 ZN, 0.03822

module AOA211HSV0 ( Z, A1, A2, B, C);
input A1, A2, B, C
output Z

timing A1 Z, 0.06854
timing A2 Z, 0.07248
timing B Z, 0.04819
timing C Z, 0.03863

module OAI32HSV0 ( ZN, A1, A2, A3, B1, B2) 
input A1, A2, A3, B1, B2
output ZN

timing A1 ZN, 0.03532
timing A2 ZN, 0.04169
timing A3 ZN, 0.04467
timing B1 ZN, 0.03891
timing B2 ZN, 0.04188

module INAND3HSV0 ( ZN, A1, B1, B2)
input A1, B1, B2
output ZN

timing A1 ZN, 0.04007
timing B1 ZN, 0.02663
timing B2 ZN, 0.02904

module OAO211HSV0 ( Z, A1, A2, B, C)
input A1, A2, B, C
output Z

timing A1 Z, 0.07327
timing A2 Z, 0.07450
timing B Z, 0.05372
timing C Z, 0.03685

module IOA21HSV0 ( ZN, A1, A2, B)
input A1, A2, B
output ZN

timing A1 ZN, 0.04062
timing A2 ZN, 0.04238
timing B ZN, 0.01820

module OR2HSV0 ( Z, A1, A2)
input A1, A2
output Z

timing A1 Z, 0.03643
timing A2 Z, 0.03883

module OA32HSV0 ( Z, A1, A2, A3, B1, B2)
input A1, A2, A3, B1, B2
output Z

timing A1 Z, 0.06629
timing A2 Z, 0.07213
timing A3 Z, 0.07517
timing B1 Z, 0.06760
timing B2 Z, 0.07236

module AO32HSV0 ( Z, A1, A2, A3, B1, B2)
input A1, A2, A3, B1, B2
output Z

timing A1 Z, 0.06111
timing A2 Z, 0.06462
timing A3 Z, 0.06822
timing B1 Z, 0.03990
timing B2 Z, 0.04191

module AO221HSV0 ( Z, A1, A2, B1, B2, C)
input A1, A2, B1, B2, C
output Z

timing A1 Z, 0.06673
timing A2 Z, 0.07158
timing B1 Z, 0.05899
timing B2 Z, 0.06235
timing C Z, 0.04056

module MAJ23HSV0 ( Z, A1, A2, A3)
input A1, A2, A3
output Z

timing A1 Z, 0.06434
timing A2 Z, 0.06157
timing A3 Z, 0.04965

module AO22HSV0 ( Z, A1, A2, B1, B2)
input A1, A2, B1, B2
output Z

timing A1 Z, 0.05060
timing A2 Z, 0.05329
timing B1 Z, 0.03924
timing B2 Z, 0.04752

module OR5HSV0RD ( Z, A1, A2, A3, A4, A5)
input A1, A2, A3, A4, A5
output Z

timing A1 Z, 0.04614
timing A2 Z, 0.04854
timing A3 Z, 0.05628
timing A4 Z, 0.06084
timing A5 Z, 0.06379

module MUX4HSV0 ( Z, I0, I1, I2, I3, S0, S1)
input I0, I1, I2, I3, S0, S1
output Z

timing I0 Z, 0.08126
timing I1 Z, 0.08149
timing I2 Z, 0.07595
timing I3 Z, 0.07666
timing S0 Z, 0.08579
timing S1 Z, 0.05636

module AND6HSV0 ( Z, A1, A2, A3, A4, A5, A6)
input A1, A2, A3, A4, A5, A6
output Z

timing A1 Z, 0.05075
timing A2 Z, 0.05471
timing A3 Z, 0.05863
timing A4 Z, 0.05350
timing A5 Z, 0.05715
timing A6 Z, 0.06102

module OA222HSV0 ( Z, A1, A2, B1, B2, C1, C2)
input A1, A2, B1, B2, C1, C2
output Z

timing A1 Z, 0.06830
timing A2 Z, 0.07272
timing B1 Z, 0.08725
timing B2 Z, 0.08979
timing C1 Z, 0.07699
timing C2 Z, 0.08315

module MUX4NHSV0 ( ZN, I0, I1, I2, I3, S0, S1)
input I0, I1, I2, I3, S0, S1
output ZN

timing I0 ZN, 0.09610
timing I1 ZN, 0.09690
timing I2 ZN, 0.09158
timing I3 ZN, 0.09238
timing S0 ZN, 0.08891
timing S1 ZN, 0.05233

module OR4HSV0 ( Z, A1, A2, A3, A4)
input A1, A2, A3, A4
output Z

timing A1 Z, 0.05972
timing A2 Z, 0.06471
timing A3 Z, 0.06885
timing A4 Z, 0.07188

module DHSV1 ( Q, CK, D)
input CK, D
output Q

timing CK Q, 0.09387
timing D Q, 0.0

module I2NAND4HSV0 ( ZN, A1, A2, B1, B2)
input A1, A2, B1, B2
output ZN

timing A1 ZN, 0.04621
timing A2 ZN, 0.04894
timing B1 ZN, 0.03451
timing B2 ZN, 0.03625

module AO222HSV0 ( Z, A1, A2, B1, B2, C1, C2)
input A1, A2, B1, B2, C1, C2
output Z

timing A1 Z, 0.07279
timing A2 Z, 0.07487
timing B1 Z, 0.06484
timing B2 Z, 0.06734
timing C1 Z, 0.05128
timing C2 Z, 0.05405

module INHSV2 ( ZN, I)
input I
output ZN

timing I ZN, 0.01018

module INAND3HSV2 ( ZN, A1, B1, B2)
input A1, B1, B2
output ZN

timing A1 ZN, 0.04053
timing B1 ZN, 0.02281
timing B2 ZN, 0.02503

module BUFHSV2 ( Z, I)
input I
output Z

timing I Z, 0.03104

module CLKBUFHSV0 ( Z, I)
input I
output Z

timing I Z, 0.02751

module I2NOR4HSV0 ( ZN, A1, A2, B1, B2)
input A1, A2, B1, B2
output ZN

timing A1 ZN, 0.06053
timing A2 ZN, 0.06342
timing B1 ZN, 0.03951
timing B2 ZN, 0.03288

module MUX3HSV0 ( Z, I0, I1, I2, S0, S1)
input I0, I1, I2, S0, S1
output Z

timing I0 Z, 0.08875
timing I1 Z, 0.08772
timing I2 Z, 0.05221
timing S0 Z, 0.08760
timing S1 Z, 0.05968


