function D = GeometryAndLoading_2020FinalFrame
% Definition of Data

% Number of members and nodes
%m = 150; n = 73;
Coord = readmatrix('NodeMatrix.xlsx')
n = size(Coord,1)
disp(n)

Con = readmatrix('ConnectivityMatrix.xlsx')
m = size(Con,1)
disp(m)

% Nodal Coordinates
%{
Coord=[17.8519	-6.9285	4.8199 %1
17.8519	6.9285	4.8199%2
17.8519	-6.9285	17.1949%3
17.8519	6.9285	17.1949%4
33.6519	-6.9285	4.8199%5
33.6519	6.9285	4.8199%6
33.2028	-8.6903	8.9316%7
33.2028	8.6903	8.9316%8
40.2	-6.9285	4.8199%9
40.2	6.9285	4.8199%10
38.8111	0	4.8199%11
40.2	-9	17.25%12
40.2	9	17.25%13
43.9702	-6.9285	4.8199%14
43.9702	6.9285	4.8199%15
44.1936	-8.5838	8.9073%16
44.1936	8.5838	8.9073%17
44.7306	-8.4965	12.5%18
44.7306	8.4965	12.5%19
46.4449	-6.5303	23.1329%20
46.4449	6.5303	23.1329%21
59.114	0	3.2174%22
58.3535	-10.7511 12.7365%23
58.3535	10.7511 12.7365%24
73.15	-13.25	2%25
73.15	13.25	2%26
73.15	-13.2	12.9934%27
73.15	13.2	12.9934%28
73.15	-10.55	23.1%29
73.15	10.55	23.1%30
73.15	-6.2731	38.5%31
73.15	6.2731	38.5%32
73.15	-0.5	44.2%33
73.15	0.5	44.2%34
75.8773	-9.7773	23.1%35
75.8773	9.7773	23.1%36
79.706	-7.6675	14.875%37
79.03	7.648	14.38%38
92.265	-7.5	5.907%39
92.265	7.5	5.907%40
93.5544	-8.6	10.944%41
93.5544	8.6	10.944%42
93.5413	-3.3815	7.1771%43
93.5413	3.5795	7.1771%44
93.5233	-4.2625	16.4%45
93.5233	4.0525	16.4%46
97.5434	-6.2378	4.9119%47
97.5434	6.2378	4.9119%48
97.9434	0	4.9386%49
99.5	-6.6405	13.7059%50
99.5	6.5347	13.7059%51
99.5	0	17%52
103.4434	-6.23783	5.9386%53
103.4434	6.23783	5.9386%54
105.5721	-9.05647	10.9688%55
105.5721	9.05647	10.9688%56
];
%}




%{
CORRECT ONE
Coord = [17.016	-7.472	17.675
17.016	7.472	17.675
17.016	-7.472	5.3
17.016	7.472	5.3
32.77	-7.802	9.532
32.77	7.802	9.532
33.816	-7.372	5.3
33.816	7.372	5.3
44.464	-7.802	9.532
44.464	7.802	9.532
43.903	-7.372	5.3
43.903	7.372	5.3
40.2	-8.999	17.249
40.2	8.999	17.249
44.728	-8.004	11.524
44.728	8.004	11.524
46.192	-5.982	22.572
46.192	5.982	22.572
56.6	-10.158	12.134
56.6	10.158	12.134
73.35	-13.25	2
73.35	13.25	2
73.35	-13.25	13
73.35	13.25	13
73.35	-10.55	24.017
73.35	10.55	24.017
73.35	-6.729	38.7
73.35	6.729	38.7
73.35	0	44.4
58.9	0	3.747
40.2	0	5.3
40.2	-7.372	5.3
40.2	7.372	5.3
75.898	-9.598	24.017
75.898	9.598	24.017
79.906	-8.093	14.25
76.85	-7.3	24.017
76.85	7.3	24.017
93.168	-8.594	10.839
93.168	8.594	10.839
92.861	-6.241	5.696
92.861	6.241	5.696
98.62	-6.394	4.198
98.62	6.394	4.198
105.87	-6.394	5.695
105.87	6.394	5.695
106.473	-8.818	10.854
106.473	8.818	10.854
99.5	-8.701	10.846
99.5	8.701	10.846
99.5	-6.819	13.545
99.5	6.819	13.545
99.5	-2.45	15
99.5	2.45	15
99.5	-1.2	15
99.5	1.2	15
93.723	-5.263	15.775
93.723	5.263	15.775
93.741	-4.907	6.552
93.741	4.907	6.552
79.23	8.092	13.755
105.87	0	5.77
51.245	-8.012	17.505
51.245	8.012	17.505
73.35	-12.146	17.505
73.35	12.146	17.505
62.297	-10.079	17.505
62.297	10.079	17.505
62.297	-11.198	12.427
62.297	11.198	12.427
46.381	-1.879	24
46.381	1.879	24
47.941	0	18.282
];
%}

% Connectivity (Organized in rows of 10)
%{
Con = [1 2 1 1%1
    1 5 1 1%2
    1 7 1 1%3
    2 4 1 1%4
    2 8 1 1%5
    2 6 1 1%6
    1 3 1 1%7
    3 4 1 1%8
    3 7 1 1%9
    3 20 1 1%10
    4 21 1 1%11
    4 8 1 1%12
    5 7 1 1%13
    5 9 1 1%14
    5 11 1 1%15
    6 8 1 1%16
    6 10 1 1%17
    6 11 1 1%18
    5 16 1 1%19 delete
    7 16 1 1%20
    7 18 1 1%21
    7 12 1 1%22
    8 13 1 1%23
    8 19 1 1%24
    8 17 1 1%25
    6 17 1 1%26 % delete
    9 11 1 1%27
    9 14 1 1%28
    10 11 1 1%29
    10 15 1 1%30
    11 14 1 1%31
    11 15 1 1%32
    12 20 1 1%33
    12 18 1 1%34
    13 21 1 1%35
    13 19 1 1%36
    14 16 1 1%37
    14 25 1 1%38
    14 23 1 1%39
    14 22 1 1%40
    15 17 1 1%41
    15 24 1 1%42
    15 26 1 1%43
    15 22 1 1%44
    16 18 1 1%45
    16 23 1 1%46
    17 19 1 1%47
    17 24 1 1%48
    18 23 1 1%49
    18 20 1 1%50
    19 24 1 1%51
    19 21 1 1%52
    20 21 1 1%53
    20 23 1 1%54
    21 24 1 1%55
    22 25 1 1%56
    22 26 1 1%57
    23 25 1 1%58
    23 27 1 1%59
    24 26 1 1%60
    24 28 1 1%61
    25 27 1 1%62
    25 39 1 1%63
    25 41 1 1%64
    26 28 1 1%65
    26 40 1 1%66
    26 42 1 1%67
    27 29 1 1%68
    27 35 1 1%69
    27 37 1 1%70
    27 41 1 1%71
    28 30 1 1%72
    28 36 1 1%73
    28 38 1 1%74
    28 42 1 1%75
    29 31 1 1%76
    29 35 1 1%77
    30 32 1 1%78
    30 36 1 1%79
    31 33 1 1%80
    31 41 1 1%81
    32 34 1 1%82
    32 42 1 1%83
    33 34 1 1%84
    35 37 1 1%85
    35 36 1 1%86
    36 38 1 1%87
    39 41 1 1%88
    39 43 1 1%89
    39 47 1 1%90
    40 42 1 1%91
    40 48 1 1%92
    40 44 1 1%93
    41 45 1 1%94
    41 50 1 1%95
    41 55 1 1%96
    41 47 1 1%97
    42 46 1 1%98
    42 48 1 1%99
    42 51 1 1%100
    42 56 1 1%101
    43 47 1 1%102
    44 49 1 1%103
    44 48 1 1%104
    45 52 1 1%105
    45 50 1 1%106
    46 52 1 1%107
    46 51 1 1%108
    47 55 1 1%109
    47 53 1 1%110
    48 56 1 1%111
    48 54 1 1%112
    49 54 1 1%113
    50 52 1 1%114
    50 55 1 1%115
    51 52 1 1%116
    51 56 1 1%117
    52 55 1 1%118
    52 56 1 1%119
    53 55 1 1%120
    53 54 1 1%121
    54 56 1 1%122
    55 56 1 1%123
    39 49 1 1%124
    37 38 1 1%125  Engine tubes begin here
    37 43 1 1%126
    37 44 1 1%127
    37 45 1 1%128
    37 46 1 1%129
    38 43 1 1%130
    38 44 1 1%131
    38 45 1 1%132
    38 46 1 1%133
    43 44 1 1%134
    43 45 1 1%135
    43 46 1 1%136
    44 45 1 1%137
    44 46 1 1%138
    45 46 1 1];%139
%}

%{
THIS IS THE CORRECT ONE!!
Con = [1	3	1	1
2	4	1	1
1	2	1	1
3	4	1	1
1	17	1	1
2	18	1	1
1	5	1	1
2	6	1	1
3	5	1	1
4	6	1	1
3	7	1	1
4	8	1	1
7	32	1	1
8	33	1	1
32	11	1	1
33	12	1	1
7	5	1	1
8	6	1	1
7	9	1	1
8	10	1	1
5	9	1	1
6	10	1	1
5	15	1	1
6	16	1	1
5	13	1	1
6	14	1	1
13	17	1	1
14	18	1	1
13	15	1	1
14	16	1	1
11	9	1	1
12	10	1	1
9	15	1	1
10	16	1	1
15	17	1	1
16	18	1	1
17	71	1	1
18	72	1	1
71	72	1	1
17	19	1	1
18	20	1	1
15	19	1	1
16	20	1	1
11	19	1	1
12	20	1	1
11	21	1	1
12	22	1	1
19	23	1	1
20	24	1	1
19	21	1	1
20	22	1	1
21	23	1	1
22	24	1	1
23	25	1	1
24	26	1	1
25	27	1	1
26	28	1	1
27	29	1	1
29	28	1	1
21	30	1	1
22	30	1	1
11	30	1	1
12	30	1	1
11	31	1	1
12	31	1	1
32	31	1	1
33	31	1	1
7	8	1	1
23	34	1	1
24	35	1	1
34	36	1	1
61	35	1	1
23	36	1	1
24	61	1	1
27	39	1	1
28	40	1	1
21	41	1	1
22	42	1	1
21	39	1	1
22	40	1	1
23	39	1	1
24	40	1	1
25	34	1	1
26	35	1	1
34	37	1	1
35	38	1	1
37	38	1	1
39	41	1	1
40	42	1	1
39	43	1	1
40	44	1	1
43	47	1	1
44	48	1	1
47	45	1	1
48	46	1	1
41	59	1	1
42	60	1	1
59	43	1	1
60	44	1	1
45	46	1	1
47	62	1	1
48	62	1	1
39	49	1	1
40	50	1	1
49	47	1	1
50	48	1	1
39	57	1	1
40	58	1	1
39	51	1	1
40	52	1	1
51	57	1	1
52	58	1	1
51	47	1	1
52	48	1	1
49	51	1	1
50	52	1	1
53	55	1	1
54	56	1	1
55	56	1	1
57	55	1	1
58	56	1	1
47	55	1	1
48	56	1	1
41	43	1	1
42	44	1	1
43	45	1	1
44	46	1	1
71	73	1	1
72	73	1	1
63	67	1	1
64	68	1	1
65	67	1	1
66	68	1	1
69	67	1	1
70	68	1	1
57	59	1	1
58	60	1	1
57	60	1	1
57	36	1	1
57	61	1	1
57	58	1	1
58	59	1	1
58	36	1	1
58	61	1	1
36	61	1	1
36	59	1	1
36	60	1	1
61	59	1	1
61	60	1	1
59	60	1	1
];
%}

% Definition of Degree of freedom (free=0 &  fixed=1) (Organized in rows of 10)

Re = readmatrix('DegreeOfFreedomMatrix_ForEdits.xlsx')
%{
19-20 CORRECT ONE
Re= [0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;1 1 1 1 1 1;1 1 1 1 1 1;
     1 1 1 1 1 1;1 1 1 1 1 1;0 0 0 0 0 0;0 0 0 0 0 0;1 1 1 1 1 1;1 1 1 1 1 1;1 1 1 1 1 1;1 1 1 1 1 1;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;];
     
%}

% Definition of Point Loads (Load) and Distributed Loads (w) (Organized in rows of 10)
nodeLoad = 250;
Load = readmatrix('NodeLoadMatrix_ForEdits.xlsx')
%{
Load= [0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 nodeLoad 0 0 0;0 0 -nodeLoad 0 0 0;0 0 nodeLoad 0 0 0;0 0 -nodeLoad 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
       0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 nodeLoad 0 0 0;0 0 -nodeLoad 0 0 0;0 0 nodeLoad 0 0 0;0 0 -nodeLoad 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
       0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
       0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
       0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
       0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;];  
%} 
%{
19-20 CORRECT ONE
nodeLoad = 250;
Load= [0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 nodeLoad 0 0 0;0 0 -nodeLoad 0 0 0;0 0 nodeLoad 0 0 0;0 0 -nodeLoad 0 0 0;0 0 nodeLoad 0 0 0;0 0 -nodeLoad 0 0 0;
     0 0 nodeLoad 0 0 0;0 0 -nodeLoad 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;
     0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;];
%}

w = zeros(size(Con,1),3); 

% Definition of Modulus of Elasticity and Shear Modulus
% Material: 4130 Steel
E=ones(1,size(Con,1))*2.97e7;
G=ones(1,size(Con,1))*1.16e7;

% Std Areas (in^2)
ZeroTh = .000001;
RD5x35 = .051129;
RD5x49 = .0694261;


RD75x35 = .078618;
RD75x49 = .1079106;
SQ75x35 = .0971857;
RD1x35 = .106107;
RD1x49 = .146395;
RD1x65 = .19093;
RD1x83 = .239110;
RD1x95 = .270098;
RD1x120 = .331752;
RD1xSD = .785398;
SQ1x35 = 0.1321857;
SQ1x49 = 0.1806335;
SQ1x65 = 0.2330008;

RD2xSD = 3.1415927;
RD375x28 = 0.0305237;
RD5x28 = 0.0415193;
RD625x28 = 0.0525149;
SQ625x35 = 0.0824227;
RD625x49 = 0.0886683;
RD75x28 = 0.0635104;
RE1x15x65 = 0.3048958;
RD625x35 = 0.0648739;

% Definition of Area (Organized in rows of 10)
%{
A=[SQ1x49 RD1x49 RD1x49 SQ1x49 RD1x49 RD1x49 SQ1x49 SQ1x49 RD1x49 RD1x65...
   RD1x65 RD1x49 RD1x49 RD1x49 RD75x35 RD1x49 RD1x49 RD75x35 RD1x49 RD1x49...
   RD1x49 RD1x49 RD1x49 RD1x49 RD1x49 RD1x49 RD1x35 RD1x49 RD1x35 RD1x49...
   SQ75x35 SQ75x35 RD1x49 RD75x35 RD1x49 RD75x35 RD1x95 RD1x65 RD1x65 RD75x35...
   RD1x95 RD1x65 RD1x65 RD75x35 RD1x95 RD75x35 RD1x95 RD75x35 RD1x65 RD1x95...
   RD1x65 RD1x95 RD1x95 RD75x35 RD75x35 RD75x35 RD75x35 RD1x65 RD1x65 RD1x65...
   RD1x65 RD1x95 RD1x35 RD1x49 RD1x95 RD1x35 RD1x49 RD1x95 RD1x95 RD1x49...
   RD1x49 RD1x95 RD1x95 RD1x49 RD1x49 RD1x95 RD1x95 RD1x95 RD1x95 RD1x95...
   RD1x65 RD1x95 RD1x65 RD1x95 RD5x35 RD1x95 RD5x35 RD75x35 RD75x49 RD1x49...
   RD75x35 RD1x49 RD75x35 RD1x35 RD1x35 RD1x49 RD75x35 RD1x35 RD75x35 RD1x35...
   RD1x49 RD5x35 RD5x35 RD5x35 RD1x35 RD1x35 RD1x35 RD1x35 RD75x35 RD1x49...
   RD75x35 RD1x49 RD5x35 RD5x35 RD1x35 RD5x35 RD1x35 RD1x35 RD1x35 RD75x35...
   RD1x49 RD75x35 RD1x49 RD5x35 RD2xSD RD2xSD RD2xSD RD2xSD RD2xSD RD2xSD...
   RD2xSD RD2xSD RD2xSD RD2xSD RD2xSD RD2xSD RD2xSD RD2xSD RD2xSD];

A =[SQ1x49	SQ1x49	SQ1x49	SQ1x49	RD1x65	RD1x65	RD1x49	RD1x49	RD1x49	RD1x49...
    RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49...
    RD1x49	RD1x49	RD1x49	RD1x49	RD1x35	RD1x35	RD1x35	RD1x35	RD1x49	RD1x49...
    RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD75x28...
    RD75x28	SQ1x49	SQ1x49	SQ1x49	SQ1x49	SQ1x49	SQ1x49	SQ1x49	SQ1x49	SQ1x49...
    SQ1x49	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD75x35...
    RD75x35	RD75x35	RD75x35	SQ625x35 SQ625x35 SQ1x35 SQ1x35	RD625x28 RD1x49 RD1x49...
    RD625x28 RD625x28 RD1x49 RD1x49	RD1x65 RD1x65 RD1x35 RD1x35	RD1x49	RD1x49...
    RD1x49	RD1x49	RD1x95	RD1x95	RD1x95	RD1x95 RD1x95 RD625x49 RD625x49 RD75x35...
    RD75x35	RD75x35	RD75x35	RD625x49 RD625x49 RD75x49 RD75x49 RD625x49	RD5x49	RD1x35...
    RD75x35	RD75x35	RD1x49	RD1x49	RD1x49	RD1x49	RD1x35	RD1x35	RD625x35 RD625x35...
    RD1x35	RD1x35	RD1x35	RD1x35	RD5x35	RD5x35	RE1x15x65 RE1x15x65	RE1x15x65 RD625x49...
    RD625x49 RD75x35 RD75x35 RD1x49	RD1x49	RD1x49	RD1x49	SQ1x35	SQ1x35	RD5x28...
    RD5x28	RD5x28	RD5x28	RD375x28 RD375x28 RD1xSD RD1xSD	RD1xSD	RD1xSD	RD1xSD...
    RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD];

%}
% Definition of Area (Organized in rows of 10)

A =[SQ1x49	SQ1x49	SQ1x49	SQ1x49	RD1x65	RD1x65	RD1x49	RD1x49	RD1x49	RD1x49...
    RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49...
    RD1x49	RD1x49	RD1x49	RD1x49	RD1x35	RD1x35	RD1x35	RD1x35	RD1x49	RD1x49...
    RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD75x28...
    RD75x28	RD1x65	RD1x65	RD1x65	RD1x65	RD1x65	RD1x65	RD1x65	RD1x65	RD1x65...
    RD1x65	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD75x35...
    RD75x35	RD75x35	RD75x35	SQ625x35 SQ625x35 SQ1x35 SQ1x35	RD625x28 RD1x49 RD1x49...
    RD625x28 RD625x28 RD1x49 RD1x49	RD1x65 RD1x65 RD1x35 RD1x35	RD1x49	RD1x49...
    RD1x49	RD1x49	RD1x95	RD1x95	RD1x95	RD1x95 RD1x95 RD625x49 RD625x49 RD75x35...
    RD75x35	RD75x35	RD75x35	RD625x49 RD625x49 RD75x49 RD75x49 RD625x49	RD5x49	RD1x35...
    RD75x35	RD75x35	RD1x49	RD1x49	RD1x49	RD1x49	RD1x35	RD1x35	RD625x35 RD625x35...
    RD1x35	RD1x35	RD1x35	RD1x35	RD5x35	RD5x35	RE1x15x65 RE1x15x65	RE1x15x65 RD625x49...
    RD625x49 RD75x35 RD75x35 RD1x49	RD1x49	RD1x49	RD1x49	SQ1x35	SQ1x35	RD5x28...
    RD5x28	RD5x28	RD5x28	RD375x28 RD375x28 RD1xSD RD1xSD	RD1xSD	RD1xSD	RD1xSD...
    RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD];
%{
19-20 CORRECT VERSION
A =[SQ1x49	SQ1x49	SQ1x49	SQ1x49	RD1x65	RD1x65	RD1x49	RD1x49	RD1x49	RD1x49...
    RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49	RD1x49...
    RD1x49	RD1x49	RD1x49	RD1x49	RD1x35	RD1x35	RD1x35	RD1x35	RD1x49	RD1x49...
    RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD75x28...
    RD75x28	RD1x65	RD1x65	RD1x65	RD1x65	RD1x65	RD1x65	RD1x65	RD1x65	RD1x65...
    RD1x65	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD1x95	RD75x35...
    RD75x35	RD75x35	RD75x35	SQ625x35 SQ625x35 SQ1x35 SQ1x35	RD625x28 RD1x49 RD1x49...
    RD625x28 RD625x28 RD1x49 RD1x49	RD1x65 RD1x65 RD1x35 RD1x35	RD1x49	RD1x49...
    RD1x49	RD1x49	RD1x95	RD1x95	RD1x95	RD1x95 RD1x95 RD625x49 RD625x49 RD75x35...
    RD75x35	RD75x35	RD75x35	RD625x49 RD625x49 RD75x49 RD75x49 RD625x49	RD5x49	RD1x35...
    RD75x35	RD75x35	RD1x49	RD1x49	RD1x49	RD1x49	RD1x35	RD1x35	RD625x35 RD625x35...
    RD1x35	RD1x35	RD1x35	RD1x35	RD5x35	RD5x35	RE1x15x65 RE1x15x65	RE1x15x65 RD625x49...
    RD625x49 RD75x35 RD75x35 RD1x49	RD1x49	RD1x49	RD1x49	SQ1x35	SQ1x35	RD5x28...
    RD5x28	RD5x28	RD5x28	RD375x28 RD375x28 RD1xSD RD1xSD	RD1xSD	RD1xSD	RD1xSD...
    RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD	RD1xSD];
%}


% DONT CHANGE ANYTHING BELOW THIS POINT
%--------------------------------------
% Std I-y, I-z (in^4)
ZeroIh = 0.0000001;
ID5x35 = 0.0013898;
ID5x49 = 0.0017860;
ID75x35 = 0.0050360;
ID75x49 = 0.0066608;
IQ75x35 = 0.0081550;
ID1x35 = 0.0123675;
ID1x49 = 0.0165939;
ID1x65 = 0.0209653;
ID1x83 = 0.0253390;
ID1x95 = 0.0279569;
ID1x120 = 0.0327108;
ID1xSD = 0.0490874;
IQ1x35 = 0.0202877;
IQ1x49 = 0.0267870;
IQ1x65 = 0.0331999;
ID2xSD = 0.7853982;

ID375x28 = 0.0004624;
ID5x28 = 0.0011603;
ID625x28 = 0.0013898;
IQ625x35 = 0.0047794;
ID625x49 = 0.0037039;
ID75x28 = 0.0041446;
IE1x15x65Y = 0.0929707;
IE1x15x65Z = 0.0489862;
ID625x35 = 0.0028328;

% Std J
ZeroJh = 0.0000001;
JD5x35 = 0.0027795;
JD5x49 = 0.0035720;
JD75x35 = 0.0100720;
JD75x49 = 0.0133216;
JQ75x35 = 0.0163101;
JD1x35 = 0.0247349;
JD1x49 = 0.0331878;
JD1x65 = 0.0419307;
JD1x83 = 0.0506780;
JD1x95 = 0.0559138;
JD1x120 = 0.0654215;
JD1xSD = 0.0981748;
JQ1x35 = 0.0405755;
JQ1x49 = 0.0535739;
JQ1x65 = 0.0663999;
JD2xSD = 1.5707963;

JD375x28 = 0.0009248;
JD5x28 = 0.0023206;
JD625x28 = 0.0027795;
JQ625x35 = 0.0095589;
JD625x49 = 0.0074077;
JD75x28 =  0.0082892;
JE1x15x65 = 0.1419569 ;
JD625x35 = 0.0056655;

Iy=zeros(1,m);Iz=zeros(1,m);J=zeros(1,m);

for i=1:m
    if A(i) == ZeroTh
        Iy(i)=ZeroIh;Iz(i)=ZeroIh;J(i)=ZeroJh;
    end
    if A(i) == RD5x35
        Iy(i)=ID5x35;Iz(i)=ID5x35;J(i)=JD5x35;
    end
    if A(i) == RD5x49
        Iy(i)=ID5x49;Iz(i)=ID5x49;J(i)=JD5x49;
    end
    if A(i) == RD75x35
        Iy(i)=ID75x35;Iz(i)=ID75x35;J(i)=JD75x35;
    end
    if A(i) == RD75x49
        Iy(i)=ID75x49;Iz(i)=ID75x49;J(i)=JD75x49;
    end
    if A(i) == SQ75x35
        Iy(i)=IQ75x35;Iz(i)=IQ75x35;J(i)=JQ75x35;
    end
    if A(i) == RD1x35
        Iy(i)=ID1x35;Iz(i)=ID1x35;J(i)=JD1x35;
    end
    if A(i) == RD1x49
        Iy(i)=ID1x49;Iz(i)=ID1x49;J(i)=JD1x49;
    end
    if A(i) == RD1x65
        Iy(i)=ID1x65;Iz(i)=ID1x65;J(i)=JD1x65;
    end
    if A(i) == RD1x83
        Iy(i)=ID1x83;Iz(i)=ID1x83;J(i)=JD1x83;
    end
    if A(i) == RD1x95
        Iy(i)=ID1x95;Iz(i)=ID1x95;J(i)=JD1x95;
    end
    if A(i) == RD1x120
        Iy(i)=ID1x120;Iz(i)=ID1x120;J(i)=JD1x120;
    end
    if A(i) == RD1xSD
        Iy(i)=ID1xSD;Iz(i)=ID1xSD;J(i)=JD1xSD;
    end
    if A(i) == SQ1x35
        Iy(i)=IQ1x35;Iz(i)=IQ1x35;J(i)=JQ1x35;
    end
    if A(i) == SQ1x49
        Iy(i)=IQ1x49;Iz(i)=IQ1x49;J(i)=JQ1x49;
    end
    if A(i) == SQ1x65
        Iy(i)=IQ1x65;Iz(i)=IQ1x65;J(i)=JQ1x65;
    end
    if A(i) == RD2xSD
        Iy(i)=ID2xSD;Iz(i)=ID2xSD;J(i)=JD2xSD;
    end
    
    if A(i) == RD375x28
        Iy(i)=ID375x28;Iz(i)=ID375x28;J(i)=JD375x28;
    end
    if A(i) == RD5x28
        Iy(i)=ID5x28;Iz(i)=ID5x28;J(i)=JD5x28;
    end
    if A(i) == RD625x28
        Iy(i)=ID625x28;Iz(i)=ID625x28;J(i)=JD625x28;
    end
    if A(i) == RD625x35
        Iy(i)=ID625x35;Iz(i)=ID625x35;J(i)=JD625x35;
    end
    if A(i) == SQ625x35
        Iy(i)=IQ625x35;Iz(i)=IQ625x35;J(i)=JQ625x35;
    end
    if A(i) == RD625x49
        Iy(i)=ID625x49;Iz(i)=ID625x49;J(i)=JD625x49;
    end
    if A(i) == RD75x28
        Iy(i)=ID75x28;Iz(i)=ID75x28;J(i)=JD75x28;
    end
    if A(i) == RE1x15x65
        Iy(i)=IE1x15x65Y;Iz(i)=IE1x15x65Z;J(i)=JE1x15x65;
    end
end

% Refer to Help_DirectStiffnessSolver for help with these:
St=zeros(n,6);
be=zeros(1,m);

% Convert to structure array
D=struct('m',m,'n',n,'Coord',Coord','Con',Con','Re',Re','Load',Load','w',w','E',E','G',G','A',A','Iz',Iz','Iy',Iy','J',J','St',St','be',be','nodeLoad',nodeLoad);


