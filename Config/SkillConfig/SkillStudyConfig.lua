--获取技能学习条件及需求 0 
-- print("SkillConfig",SkillConfig,SkillConfig[10000]);
_G.BasicResInfo = {
[0]={dwLevel=1,dwMoney=5,dwGold=380,dwWood=380,dwWater=380,dwFire=380,dwSoil=380,dwBookId=0,dwProfession=0,dwCanUp=true,},
[1]={dwLevel=2,dwMoney=9,dwGold=500,dwWood=500,dwWater=500,dwFire=500,dwSoil=500,dwBookId=0,dwProfession=0,dwCanUp=true,},
[2]={dwLevel=3,dwMoney=14,dwGold=620,dwWood=620,dwWater=620,dwFire=620,dwSoil=620,dwBookId=0,dwProfession=0,dwCanUp=true,},
[3]={dwLevel=4,dwMoney=21,dwGold=750,dwWood=750,dwWater=750,dwFire=750,dwSoil=750,dwBookId=0,dwProfession=0,dwCanUp=true,},
[4]={dwLevel=5,dwMoney=29,dwGold=890,dwWood=890,dwWater=890,dwFire=890,dwSoil=890,dwBookId=0,dwProfession=0,dwCanUp=true,},
[5]={dwLevel=6,dwMoney=40,dwGold=1030,dwWood=1030,dwWater=1030,dwFire=1030,dwSoil=1030,dwBookId=0,dwProfession=0,dwCanUp=true,},
[6]={dwLevel=7,dwMoney=53,dwGold=1180,dwWood=1180,dwWater=1180,dwFire=1180,dwSoil=1180,dwBookId=0,dwProfession=0,dwCanUp=true,},
[7]={dwLevel=8,dwMoney=70,dwGold=1340,dwWood=1340,dwWater=1340,dwFire=1340,dwSoil=1340,dwBookId=0,dwProfession=0,dwCanUp=true,},
[8]={dwLevel=9,dwMoney=90,dwGold=1500,dwWood=1500,dwWater=1500,dwFire=1500,dwSoil=1500,dwBookId=0,dwProfession=0,dwCanUp=true,},
[9]={dwLevel=10,dwMoney=115,dwGold=1670,dwWood=1670,dwWater=1670,dwFire=1670,dwSoil=1670,dwBookId=0,dwProfession=0,dwCanUp=true,},
[10]={dwLevel=11,dwMoney=145,dwGold=1850,dwWood=1850,dwWater=1850,dwFire=1850,dwSoil=1850,dwBookId=0,dwProfession=0,dwCanUp=true,},
[11]={dwLevel=12,dwMoney=182,dwGold=2040,dwWood=2040,dwWater=2040,dwFire=2040,dwSoil=2040,dwBookId=0,dwProfession=0,dwCanUp=true,},
[12]={dwLevel=13,dwMoney=225,dwGold=2230,dwWood=2230,dwWater=2230,dwFire=2230,dwSoil=2230,dwBookId=0,dwProfession=0,dwCanUp=true,},
[13]={dwLevel=14,dwMoney=276,dwGold=2430,dwWood=2430,dwWater=2430,dwFire=2430,dwSoil=2430,dwBookId=0,dwProfession=0,dwCanUp=true,},
[14]={dwLevel=15,dwMoney=337,dwGold=2650,dwWood=2650,dwWater=2650,dwFire=2650,dwSoil=2650,dwBookId=0,dwProfession=0,dwCanUp=true,},
[15]={dwLevel=16,dwMoney=409,dwGold=2870,dwWood=2870,dwWater=2870,dwFire=2870,dwSoil=2870,dwBookId=0,dwProfession=0,dwCanUp=true,},
[16]={dwLevel=17,dwMoney=493,dwGold=3100,dwWood=3100,dwWater=3100,dwFire=3100,dwSoil=3100,dwBookId=0,dwProfession=0,dwCanUp=true,},
[17]={dwLevel=18,dwMoney=591,dwGold=3340,dwWood=3340,dwWater=3340,dwFire=3340,dwSoil=3340,dwBookId=0,dwProfession=0,dwCanUp=true,},
[18]={dwLevel=19,dwMoney=705,dwGold=3590,dwWood=3590,dwWater=3590,dwFire=3590,dwSoil=3590,dwBookId=0,dwProfession=0,dwCanUp=true,},
[19]={dwLevel=20,dwMoney=837,dwGold=3850,dwWood=3850,dwWater=3850,dwFire=3850,dwSoil=3850,dwBookId=0,dwProfession=0,dwCanUp=true,},
[20]={dwLevel=21,dwMoney=990,dwGold=4120,dwWood=4120,dwWater=4120,dwFire=4120,dwSoil=4120,dwBookId=0,dwProfession=0,dwCanUp=true,},
[21]={dwLevel=22,dwMoney=1165,dwGold=4410,dwWood=4410,dwWater=4410,dwFire=4410,dwSoil=4410,dwBookId=0,dwProfession=0,dwCanUp=true,},
[22]={dwLevel=23,dwMoney=1366,dwGold=4700,dwWood=4700,dwWater=4700,dwFire=4700,dwSoil=4700,dwBookId=0,dwProfession=0,dwCanUp=true,},
[23]={dwLevel=24,dwMoney=1595,dwGold=5010,dwWood=5010,dwWater=5010,dwFire=5010,dwSoil=5010,dwBookId=0,dwProfession=0,dwCanUp=true,},
[24]={dwLevel=25,dwMoney=1856,dwGold=5330,dwWood=5330,dwWater=5330,dwFire=5330,dwSoil=5330,dwBookId=0,dwProfession=0,dwCanUp=true,},
[25]={dwLevel=26,dwMoney=2153,dwGold=5660,dwWood=5660,dwWater=5660,dwFire=5660,dwSoil=5660,dwBookId=0,dwProfession=0,dwCanUp=true,},
[26]={dwLevel=27,dwMoney=2490,dwGold=6000,dwWood=6000,dwWater=6000,dwFire=6000,dwSoil=6000,dwBookId=0,dwProfession=0,dwCanUp=true,},
[27]={dwLevel=28,dwMoney=2870,dwGold=6350,dwWood=6350,dwWater=6350,dwFire=6350,dwSoil=6350,dwBookId=0,dwProfession=0,dwCanUp=true,},
[28]={dwLevel=29,dwMoney=3299,dwGold=6720,dwWood=6720,dwWater=6720,dwFire=6720,dwSoil=6720,dwBookId=0,dwProfession=0,dwCanUp=true,},
[29]={dwLevel=30,dwMoney=3781,dwGold=7100,dwWood=7100,dwWater=7100,dwFire=7100,dwSoil=7100,dwBookId=0,dwProfession=0,dwCanUp=true,},
[30]={dwLevel=31,dwMoney=4323,dwGold=7500,dwWood=7500,dwWater=7500,dwFire=7500,dwSoil=7500,dwBookId=0,dwProfession=0,dwCanUp=true,},
[31]={dwLevel=32,dwMoney=4929,dwGold=7910,dwWood=7910,dwWater=7910,dwFire=7910,dwSoil=7910,dwBookId=0,dwProfession=0,dwCanUp=true,},
[32]={dwLevel=33,dwMoney=5607,dwGold=8330,dwWood=8330,dwWater=8330,dwFire=8330,dwSoil=8330,dwBookId=0,dwProfession=0,dwCanUp=true,},
[33]={dwLevel=34,dwMoney=6363,dwGold=8770,dwWood=8770,dwWater=8770,dwFire=8770,dwSoil=8770,dwBookId=0,dwProfession=0,dwCanUp=true,},
[34]={dwLevel=35,dwMoney=7205,dwGold=9220,dwWood=9220,dwWater=9220,dwFire=9220,dwSoil=9220,dwBookId=0,dwProfession=0,dwCanUp=true,},
[35]={dwLevel=36,dwMoney=8141,dwGold=9690,dwWood=9690,dwWater=9690,dwFire=9690,dwSoil=9690,dwBookId=0,dwProfession=0,dwCanUp=true,},
[36]={dwLevel=37,dwMoney=9179,dwGold=10180,dwWood=10180,dwWater=10180,dwFire=10180,dwSoil=10180,dwBookId=0,dwProfession=0,dwCanUp=true,},
[37]={dwLevel=38,dwMoney=10329,dwGold=10680,dwWood=10680,dwWater=10680,dwFire=10680,dwSoil=10680,dwBookId=0,dwProfession=0,dwCanUp=true,},
[38]={dwLevel=39,dwMoney=11600,dwGold=11190,dwWood=11190,dwWater=11190,dwFire=11190,dwSoil=11190,dwBookId=0,dwProfession=0,dwCanUp=true,},
[39]={dwLevel=40,dwMoney=13004,dwGold=11720,dwWood=11720,dwWater=11720,dwFire=11720,dwSoil=11720,dwBookId=0,dwProfession=0,dwCanUp=true,},
[40]={dwLevel=41,dwMoney=14551,dwGold=12270,dwWood=12270,dwWater=12270,dwFire=12270,dwSoil=12270,dwBookId=0,dwProfession=0,dwCanUp=true,},
[41]={dwLevel=42,dwMoney=16254,dwGold=12840,dwWood=12840,dwWater=12840,dwFire=12840,dwSoil=12840,dwBookId=0,dwProfession=0,dwCanUp=true,},
[42]={dwLevel=43,dwMoney=18126,dwGold=13420,dwWood=13420,dwWater=13420,dwFire=13420,dwSoil=13420,dwBookId=0,dwProfession=0,dwCanUp=true,},
[43]={dwLevel=44,dwMoney=20181,dwGold=14020,dwWood=14020,dwWater=14020,dwFire=14020,dwSoil=14020,dwBookId=0,dwProfession=0,dwCanUp=true,},
[44]={dwLevel=45,dwMoney=22433,dwGold=14640,dwWood=14640,dwWater=14640,dwFire=14640,dwSoil=14640,dwBookId=0,dwProfession=0,dwCanUp=true,},
[45]={dwLevel=46,dwMoney=24898,dwGold=15280,dwWood=15280,dwWater=15280,dwFire=15280,dwSoil=15280,dwBookId=0,dwProfession=0,dwCanUp=true,},
[46]={dwLevel=47,dwMoney=27594,dwGold=15930,dwWood=15930,dwWater=15930,dwFire=15930,dwSoil=15930,dwBookId=0,dwProfession=0,dwCanUp=true,},
[47]={dwLevel=48,dwMoney=30538,dwGold=16610,dwWood=16610,dwWater=16610,dwFire=16610,dwSoil=16610,dwBookId=0,dwProfession=0,dwCanUp=true,},
[48]={dwLevel=49,dwMoney=33749,dwGold=17300,dwWood=17300,dwWater=17300,dwFire=17300,dwSoil=17300,dwBookId=0,dwProfession=0,dwCanUp=true,},
[49]={dwLevel=50,dwMoney=37247,dwGold=18020,dwWood=18020,dwWater=18020,dwFire=18020,dwSoil=18020,dwBookId=0,dwProfession=0,dwCanUp=true,},
[50]={dwLevel=51,dwMoney=41053,dwGold=18750,dwWood=18750,dwWater=18750,dwFire=18750,dwSoil=18750,dwBookId=0,dwProfession=0,dwCanUp=true,},
[51]={dwLevel=52,dwMoney=45191,dwGold=19500,dwWood=19500,dwWater=19500,dwFire=19500,dwSoil=19500,dwBookId=0,dwProfession=0,dwCanUp=true,},
[52]={dwLevel=53,dwMoney=49685,dwGold=20270,dwWood=20270,dwWater=20270,dwFire=20270,dwSoil=20270,dwBookId=0,dwProfession=0,dwCanUp=true,},
[53]={dwLevel=54,dwMoney=54559,dwGold=21070,dwWood=21070,dwWater=21070,dwFire=21070,dwSoil=21070,dwBookId=0,dwProfession=0,dwCanUp=true,},
[54]={dwLevel=55,dwMoney=59841,dwGold=21880,dwWood=21880,dwWater=21880,dwFire=21880,dwSoil=21880,dwBookId=0,dwProfession=0,dwCanUp=true,},
[55]={dwLevel=56,dwMoney=65560,dwGold=22720,dwWood=22720,dwWater=22720,dwFire=22720,dwSoil=22720,dwBookId=0,dwProfession=0,dwCanUp=true,},
[56]={dwLevel=57,dwMoney=71745,dwGold=23570,dwWood=23570,dwWater=23570,dwFire=23570,dwSoil=23570,dwBookId=0,dwProfession=0,dwCanUp=true,},
[57]={dwLevel=58,dwMoney=78428,dwGold=24450,dwWood=24450,dwWater=24450,dwFire=24450,dwSoil=24450,dwBookId=0,dwProfession=0,dwCanUp=true,},
[58]={dwLevel=59,dwMoney=85644,dwGold=25350,dwWood=25350,dwWater=25350,dwFire=25350,dwSoil=25350,dwBookId=0,dwProfession=0,dwCanUp=true,},
[59]={dwLevel=60,dwMoney=93427,dwGold=26280,dwWood=26280,dwWater=26280,dwFire=26280,dwSoil=26280,dwBookId=0,dwProfession=0,dwCanUp=true,},
[60]={dwLevel=61,dwMoney=101815,dwGold=27220,dwWood=27220,dwWater=27220,dwFire=27220,dwSoil=27220,dwBookId=0,dwProfession=0,dwCanUp=true,},
[61]={dwLevel=62,dwMoney=110847,dwGold=28190,dwWood=28190,dwWater=28190,dwFire=28190,dwSoil=28190,dwBookId=0,dwProfession=0,dwCanUp=true,},
[62]={dwLevel=63,dwMoney=120565,dwGold=29180,dwWood=29180,dwWater=29180,dwFire=29180,dwSoil=29180,dwBookId=0,dwProfession=0,dwCanUp=true,},
[63]={dwLevel=64,dwMoney=131012,dwGold=30200,dwWood=30200,dwWater=30200,dwFire=30200,dwSoil=30200,dwBookId=0,dwProfession=0,dwCanUp=true,},
[64]={dwLevel=65,dwMoney=142234,dwGold=31240,dwWood=31240,dwWater=31240,dwFire=31240,dwSoil=31240,dwBookId=0,dwProfession=0,dwCanUp=true,},
[65]={dwLevel=66,dwMoney=154280,dwGold=32300,dwWood=32300,dwWater=32300,dwFire=32300,dwSoil=32300,dwBookId=0,dwProfession=0,dwCanUp=true,},
[66]={dwLevel=67,dwMoney=167201,dwGold=33390,dwWood=33390,dwWater=33390,dwFire=33390,dwSoil=33390,dwBookId=0,dwProfession=0,dwCanUp=true,},
[67]={dwLevel=68,dwMoney=181049,dwGold=34500,dwWood=34500,dwWater=34500,dwFire=34500,dwSoil=34500,dwBookId=0,dwProfession=0,dwCanUp=true,},
[68]={dwLevel=69,dwMoney=195881,dwGold=35640,dwWood=35640,dwWater=35640,dwFire=35640,dwSoil=35640,dwBookId=0,dwProfession=0,dwCanUp=true,},
[69]={dwLevel=70,dwMoney=211755,dwGold=36810,dwWood=36810,dwWater=36810,dwFire=36810,dwSoil=36810,dwBookId=0,dwProfession=0,dwCanUp=true,},
[70]={dwLevel=71,dwMoney=228733,dwGold=38000,dwWood=38000,dwWater=38000,dwFire=38000,dwSoil=38000,dwBookId=0,dwProfession=0,dwCanUp=true,},
[71]={dwLevel=72,dwMoney=246879,dwGold=39210,dwWood=39210,dwWater=39210,dwFire=39210,dwSoil=39210,dwBookId=0,dwProfession=0,dwCanUp=true,},
[72]={dwLevel=73,dwMoney=266261,dwGold=40450,dwWood=40450,dwWater=40450,dwFire=40450,dwSoil=40450,dwBookId=0,dwProfession=0,dwCanUp=true,},
[73]={dwLevel=74,dwMoney=286951,dwGold=41720,dwWood=41720,dwWater=41720,dwFire=41720,dwSoil=41720,dwBookId=0,dwProfession=0,dwCanUp=true,},
[74]={dwLevel=75,dwMoney=309021,dwGold=43020,dwWood=43020,dwWater=43020,dwFire=43020,dwSoil=43020,dwBookId=0,dwProfession=0,dwCanUp=true,},
[75]={dwLevel=76,dwMoney=332549,dwGold=44340,dwWood=44340,dwWater=44340,dwFire=44340,dwSoil=44340,dwBookId=0,dwProfession=0,dwCanUp=true,},
[76]={dwLevel=77,dwMoney=357618,dwGold=45690,dwWood=45690,dwWater=45690,dwFire=45690,dwSoil=45690,dwBookId=0,dwProfession=0,dwCanUp=true,},
[77]={dwLevel=78,dwMoney=384311,dwGold=47070,dwWood=47070,dwWater=47070,dwFire=47070,dwSoil=47070,dwBookId=0,dwProfession=0,dwCanUp=true,},
[78]={dwLevel=79,dwMoney=412717,dwGold=48470,dwWood=48470,dwWater=48470,dwFire=48470,dwSoil=48470,dwBookId=0,dwProfession=0,dwCanUp=true,},
[79]={dwLevel=80,dwMoney=442930,dwGold=49910,dwWood=49910,dwWater=49910,dwFire=49910,dwSoil=49910,dwBookId=0,dwProfession=0,dwCanUp=true,},
[80]={dwLevel=81,dwMoney=475045,dwGold=51370,dwWood=51370,dwWater=51370,dwFire=51370,dwSoil=51370,dwBookId=0,dwProfession=0,dwCanUp=true,},
[81]={dwLevel=82,dwMoney=509163,dwGold=52860,dwWood=52860,dwWater=52860,dwFire=52860,dwSoil=52860,dwBookId=0,dwProfession=0,dwCanUp=true,},
[82]={dwLevel=83,dwMoney=545391,dwGold=54380,dwWood=54380,dwWater=54380,dwFire=54380,dwSoil=54380,dwBookId=0,dwProfession=0,dwCanUp=true,},
[83]={dwLevel=84,dwMoney=583838,dwGold=55940,dwWood=55940,dwWater=55940,dwFire=55940,dwSoil=55940,dwBookId=0,dwProfession=0,dwCanUp=true,},
[84]={dwLevel=85,dwMoney=624619,dwGold=57520,dwWood=57520,dwWater=57520,dwFire=57520,dwSoil=57520,dwBookId=0,dwProfession=0,dwCanUp=true,},
[85]={dwLevel=86,dwMoney=667853,dwGold=59130,dwWood=59130,dwWater=59130,dwFire=59130,dwSoil=59130,dwBookId=0,dwProfession=0,dwCanUp=true,},
[86]={dwLevel=87,dwMoney=713664,dwGold=60770,dwWood=60770,dwWater=60770,dwFire=60770,dwSoil=60770,dwBookId=0,dwProfession=0,dwCanUp=true,},
[87]={dwLevel=88,dwMoney=762184,dwGold=62440,dwWood=62440,dwWater=62440,dwFire=62440,dwSoil=62440,dwBookId=0,dwProfession=0,dwCanUp=true,},
[88]={dwLevel=89,dwMoney=813545,dwGold=64140,dwWood=64140,dwWater=64140,dwFire=64140,dwSoil=64140,dwBookId=0,dwProfession=0,dwCanUp=true,},
[89]={dwLevel=90,dwMoney=867890,dwGold=65880,dwWood=65880,dwWater=65880,dwFire=65880,dwSoil=65880,dwBookId=0,dwProfession=0,dwCanUp=true,},
[90]={dwLevel=91,dwMoney=925365,dwGold=67650,dwWood=67650,dwWater=67650,dwFire=67650,dwSoil=67650,dwBookId=0,dwProfession=0,dwCanUp=true,},
[91]={dwLevel=92,dwMoney=986121,dwGold=69440,dwWood=69440,dwWater=69440,dwFire=69440,dwSoil=69440,dwBookId=0,dwProfession=0,dwCanUp=true,},
[92]={dwLevel=93,dwMoney=1050317,dwGold=71270,dwWood=71270,dwWater=71270,dwFire=71270,dwSoil=71270,dwBookId=0,dwProfession=0,dwCanUp=true,},
[93]={dwLevel=94,dwMoney=1118117,dwGold=73140,dwWood=73140,dwWater=73140,dwFire=73140,dwSoil=73140,dwBookId=0,dwProfession=0,dwCanUp=true,},
[94]={dwLevel=95,dwMoney=1189694,dwGold=75030,dwWood=75030,dwWater=75030,dwFire=75030,dwSoil=75030,dwBookId=0,dwProfession=0,dwCanUp=true,},
[95]={dwLevel=96,dwMoney=1265223,dwGold=76960,dwWood=76960,dwWater=76960,dwFire=76960,dwSoil=76960,dwBookId=0,dwProfession=0,dwCanUp=true,},
[96]={dwLevel=97,dwMoney=1344891,dwGold=78930,dwWood=78930,dwWater=78930,dwFire=78930,dwSoil=78930,dwBookId=0,dwProfession=0,dwCanUp=true,},
[97]={dwLevel=98,dwMoney=1428888,dwGold=80920,dwWood=80920,dwWater=80920,dwFire=80920,dwSoil=80920,dwBookId=0,dwProfession=0,dwCanUp=true,},
[98]={dwLevel=99,dwMoney=1517414,dwGold=82950,dwWood=82950,dwWater=82950,dwFire=82950,dwSoil=82950,dwBookId=0,dwProfession=0,dwCanUp=true,},
[99]={dwLevel=100,dwMoney=1610675,dwGold=85020,dwWood=85020,dwWater=85020,dwFire=85020,dwSoil=85020,dwBookId=0,dwProfession=0,dwCanUp=true,},
[100]={dwLevel=101,dwMoney=1708885,dwGold=87120,dwWood=87120,dwWater=87120,dwFire=87120,dwSoil=87120,dwBookId=0,dwProfession=0,dwCanUp=true,},
[101]={dwLevel=102,dwMoney=1812266,dwGold=89260,dwWood=89260,dwWater=89260,dwFire=89260,dwSoil=89260,dwBookId=0,dwProfession=0,dwCanUp=true,},
[102]={dwLevel=103,dwMoney=1921050,dwGold=91430,dwWood=91430,dwWater=91430,dwFire=91430,dwSoil=91430,dwBookId=0,dwProfession=0,dwCanUp=true,},
[103]={dwLevel=104,dwMoney=2035474,dwGold=93630,dwWood=93630,dwWater=93630,dwFire=93630,dwSoil=93630,dwBookId=0,dwProfession=0,dwCanUp=true,},
[104]={dwLevel=105,dwMoney=2155787,dwGold=95870,dwWood=95870,dwWater=95870,dwFire=95870,dwSoil=95870,dwBookId=0,dwProfession=0,dwCanUp=true,},
[105]={dwLevel=106,dwMoney=2282244,dwGold=98150,dwWood=98150,dwWater=98150,dwFire=98150,dwSoil=98150,dwBookId=0,dwProfession=0,dwCanUp=true,},
[106]={dwLevel=107,dwMoney=2415112,dwGold=100470,dwWood=100470,dwWater=100470,dwFire=100470,dwSoil=100470,dwBookId=0,dwProfession=0,dwCanUp=true,},
[107]={dwLevel=108,dwMoney=2554665,dwGold=102820,dwWood=102820,dwWater=102820,dwFire=102820,dwSoil=102820,dwBookId=0,dwProfession=0,dwCanUp=true,},
[108]={dwLevel=109,dwMoney=2701189,dwGold=105210,dwWood=105210,dwWater=105210,dwFire=105210,dwSoil=105210,dwBookId=0,dwProfession=0,dwCanUp=true,},
[109]={dwLevel=110,dwMoney=2854978,dwGold=107630,dwWood=107630,dwWater=107630,dwFire=107630,dwSoil=107630,dwBookId=0,dwProfession=0,dwCanUp=true,},
[110]={dwLevel=111,dwMoney=3016338,dwGold=110090,dwWood=110090,dwWater=110090,dwFire=110090,dwSoil=110090,dwBookId=0,dwProfession=0,dwCanUp=true,},
[111]={dwLevel=112,dwMoney=3185584,dwGold=112600,dwWood=112600,dwWater=112600,dwFire=112600,dwSoil=112600,dwBookId=0,dwProfession=0,dwCanUp=true,},
[112]={dwLevel=113,dwMoney=3363043,dwGold=115140,dwWood=115140,dwWater=115140,dwFire=115140,dwSoil=115140,dwBookId=0,dwProfession=0,dwCanUp=true,},
[113]={dwLevel=114,dwMoney=3549052,dwGold=117710,dwWood=117710,dwWater=117710,dwFire=117710,dwSoil=117710,dwBookId=0,dwProfession=0,dwCanUp=true,},
[114]={dwLevel=115,dwMoney=3743960,dwGold=120330,dwWood=120330,dwWater=120330,dwFire=120330,dwSoil=120330,dwBookId=0,dwProfession=0,dwCanUp=true,},
[115]={dwLevel=116,dwMoney=3948129,dwGold=122990,dwWood=122990,dwWater=122990,dwFire=122990,dwSoil=122990,dwBookId=0,dwProfession=0,dwCanUp=true,},
[116]={dwLevel=117,dwMoney=4161931,dwGold=125680,dwWood=125680,dwWater=125680,dwFire=125680,dwSoil=125680,dwBookId=0,dwProfession=0,dwCanUp=true,},
[117]={dwLevel=118,dwMoney=4385752,dwGold=128420,dwWood=128420,dwWater=128420,dwFire=128420,dwSoil=128420,dwBookId=0,dwProfession=0,dwCanUp=true,},
[118]={dwLevel=119,dwMoney=4619989,dwGold=131200,dwWood=131200,dwWater=131200,dwFire=131200,dwSoil=131200,dwBookId=0,dwProfession=0,dwCanUp=true,},
[119]={dwLevel=120,dwMoney=4865054,dwGold=134010,dwWood=134010,dwWater=134010,dwFire=134010,dwSoil=134010,dwBookId=0,dwProfession=0,dwCanUp=true,},
[120]={dwLevel=121,dwMoney=4865054,dwGold=134010,dwWood=134010,dwWater=134010,dwFire=134010,dwSoil=134010,dwBookId=0,dwProfession=0,dwCanUp=true,},
};

local function CopyTable(from,to)
	for n,v in pairs(from)do
		to[n] = v;
	end
end;

local function MoneyCount(dwLevel)
	local dwMoney = math.floor(50+((dwLevel-1)*(26+(dwLevel-2)*(0.5+dwLevel/100)))*(1+dwLevel/60)*(1+dwLevel/60)*(1+dwLevel/60)*(1+dwLevel/60)*(1+dwLevel/60));
	
	return dwMoney;
end;

local function ZhenqiCount(dwLevel)
	local dwValue = math.floor(30+(dwLevel-1)*(10+(dwLevel-2)*(4+dwLevel/15)));
	
	return dwValue;
end;

--无双专用银子
local function MatchlessMoneyCount(dwLevel)
	local dwMoney = 1000000
	if (dwLevel == 1) then
		dwMoney = 10000*100;
	elseif (dwLevel == 2) then
		dwMoney = 10000*500;
	elseif (dwLevel == 3) then
		dwMoney = 10000*2000;	
	elseif (dwLevel == 4) then
		dwMoney = 10000*5000;
	elseif (dwLevel == 5) then
		dwMoney = 10000*10000;
	end
	return dwMoney;
end;

--无双专用真气
local function MatchlessZhenqiCount(dwLevel)
	local Need = 10000;
	if (dwLevel == 1) then
		Need = 10000;
	elseif (dwLevel == 2) then
		Need = 30000;
	elseif (dwLevel == 3) then
		Need = 60000;
	elseif (dwLevel == 4) then
		Need = 90000;
	end
	return Need;
end;





local Skill = SkillConfig[1];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end

local Skill = SkillConfig[2];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end

local Skill = SkillConfig[11001];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwLevel = 15;
	end;
	return sResInfo;
end

local Skill = SkillConfig[11002];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwLevel = 10;
	else
		sResInfo.dwCanUp = false;
	end;
	return sResInfo;
end

local Skill = SkillConfig[11003];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111003;
		sResInfo.dwLevel = 66;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[11004];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111004;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[11005];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111005;
	end;
	return sResInfo;
end

local Skill = SkillConfig[11006];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111006;
	end;
	return sResInfo;
end

local Skill = SkillConfig[11007];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111007;
		sResInfo.dwLevel = 71;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.9);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[11008];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111008;
		sResInfo.dwLevel = 54;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[11009];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111009;
		sResInfo.dwLevel = 62;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[11010];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111010;
	end;
	return sResInfo;
end

local Skill = SkillConfig[11011];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111011;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[11012];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111012;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.9);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[11013];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111013;
		sResInfo.dwLevel = 19;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.9);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	
	return sResInfo;
end

--跳跃
local Skill = SkillConfig[11015];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111015;
		sResInfo.dwLevel = 19;
	else
		sResInfo.dwCanUp = false;
	end;
	
	return sResInfo;
end


-- local Skill = SkillConfig[11017];
-- function  Skill:GetSkillStudyCondition(dwSkillLevel)
	-- local sResInfo = {};
	-- CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	-- if dwSkillLevel == 0 then
		-- sResInfo.dwBookId = 5111017;
	-- else
		-- sResInfo.dwCanUp = false;
	-- end;
	-- return sResInfo;
-- end


local Skill = SkillConfig[12001];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112001;
	end;
	return sResInfo;
end


local Skill = SkillConfig[12002];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112002;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[12003];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112003;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[12004];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112004;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13008];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113008;
		sResInfo.dwLevel = 30;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13009];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113009;
		sResInfo.dwLevel = 30;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13010];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113010;
		sResInfo.dwLevel = 30;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13011];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113011;
		sResInfo.dwLevel = 30;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13012];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113012;
		sResInfo.dwLevel = 30;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13013];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113013;
		sResInfo.dwLevel = 30;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13014];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113014;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13015];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113015;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13016];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113016;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13017];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113017;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13018];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113018;
		sResInfo.dwLevel = 68;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13019];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113019;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13020];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113020;
		sResInfo.dwLevel = 76;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13021];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113021;
		sResInfo.dwLevel = 65;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13022];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113022;
		sResInfo.dwLevel = 55;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13023];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113023;
		sResInfo.dwLevel = 69;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13024];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113024;
		sResInfo.dwLevel = 62;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13025];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113025;
		sResInfo.dwLevel = 57;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13026];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113026;
		sResInfo.dwLevel = 49;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13027];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113027;
		sResInfo.dwLevel = 52;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13028];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113028;
		sResInfo.dwLevel = 74;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[12006];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112006;
		sResInfo.dwLevel = 46;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	
	return sResInfo;
end

local Skill = SkillConfig[12007];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112007;
		sResInfo.dwLevel = 40;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--土真气消耗
	end;
	
	return sResInfo;
end

local Skill = SkillConfig[12008];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112008;
		sResInfo.dwLevel = 52;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	
	return sResInfo;
end

local Skill = SkillConfig[12009];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112009;
		sResInfo.dwLevel = 65;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	
	return sResInfo;
end

local Skill = SkillConfig[12010];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112010;
		sResInfo.dwLevel = 40;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	
	return sResInfo;
end

local Skill = SkillConfig[12011];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112011;
		sResInfo.dwLevel = 73;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	
	return sResInfo;
end

local Skill = SkillConfig[12012];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112012;
		sResInfo.dwLevel = 40;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	
	return sResInfo;
end

local Skill = SkillConfig[12013];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112013;
		sResInfo.dwLevel = 40;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	
	return sResInfo;
end

local Skill = SkillConfig[12014];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112014;
		sResInfo.dwLevel = 40;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	
	return sResInfo;
end

local Skill = SkillConfig[12015];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112015;
		sResInfo.dwLevel = 40;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	
	return sResInfo;
end

local Skill = SkillConfig[12016];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112016;
		sResInfo.dwLevel = 33;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	
	return sResInfo;
end

local Skill = SkillConfig[12017];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5112017;
		sResInfo.dwLevel = 59;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	
	return sResInfo;
end



local Skill = SkillConfig[13001];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113001;
		sResInfo.dwLevel = 10;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13002];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113002;
		sResInfo.dwLevel = 10;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13003];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113003;
		sResInfo.dwLevel = 10;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13004];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113004;
		sResInfo.dwLevel = 10;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13005];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113005;
		sResInfo.dwLevel = 10;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13006];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113006;
		sResInfo.dwLevel = 10;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[13007];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5113007;
		sResInfo.dwLevel = 50;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.2);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.6);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.8);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.4);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[21000];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end


local Skill = SkillConfig[61003];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end

local Skill = SkillConfig[21001];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5121001;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--土真气消耗
	end;
	return sResInfo;
end

--////////////////////////////////////////////////////////////////

local Skill = SkillConfig[21002];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5121002;
		sResInfo.dwLevel = 5;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--土真气消耗
	end;
	return sResInfo;
end

--//////////////////////////////////////////////////////////////////

local Skill = SkillConfig[21003];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5121003;
		sResInfo.dwLevel = 10;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--土真气消耗
	end;
	return sResInfo;
end


local Skill = SkillConfig[21004];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5121004;
		sResInfo.dwLevel = 5;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--土真气消耗
	end;
	return sResInfo;
end


local Skill = SkillConfig[21005];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5121005;
		sResInfo.dwLevel = 35;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[21006];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5121006;
		sResInfo.dwLevel = 80;
		elseif dwSkillLevel < 70 then
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel)*100+45000;
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--土真气消耗
	elseif dwSkillLevel >= 70 then
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel)*100+45000;
		sResInfo.dwGold 	= 400000;	--金真气消耗
		sResInfo.dwWood 	= 400000;	--木真气消耗
		sResInfo.dwWater	= 400000;	--水真气消耗
		sResInfo.dwFire 	= 400000;	--火真气消耗
		sResInfo.dwSoil 	= 400000;	--土真气消耗
	end;
	return sResInfo;
end


local Skill = SkillConfig[31000];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end

local Skill = SkillConfig[31001];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5131001;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--土真气消耗
	end;
	return sResInfo;
end


local Skill = SkillConfig[31002];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5131002;
		sResInfo.dwLevel = 5;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[31003];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5131003;
		sResInfo.dwLevel = 10;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--土真气消耗
	end;
	return sResInfo;
end


local Skill = SkillConfig[31004];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5131004;
		sResInfo.dwLevel = 5;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[31005];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5131005;
		sResInfo.dwLevel = 35;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[31006];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5131006;
		sResInfo.dwLevel = 80;
	elseif dwSkillLevel < 70 then
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel)*100+45000;
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--土真气消耗
	elseif dwSkillLevel >= 70 then
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel)*100+45000;
		sResInfo.dwGold 	= 400000;	--金真气消耗
		sResInfo.dwWood 	= 400000;	--木真气消耗
		sResInfo.dwWater	= 400000;	--水真气消耗
		sResInfo.dwFire 	= 400000;	--火真气消耗
		sResInfo.dwSoil 	= 400000;	--土真气消耗
	end;
	return sResInfo;
end
local Skill = SkillConfig[41000];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end

local Skill = SkillConfig[41001];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5141001;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[41002];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5141002;
		sResInfo.dwLevel = 5;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[41003];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5141003;
		sResInfo.dwLevel = 10;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[41004];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5141004;
		sResInfo.dwLevel = 5;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[41005];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5141005;
		sResInfo.dwLevel = 35;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[41006];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5141006;
		sResInfo.dwLevel = 80;
	elseif dwSkillLevel < 70 then
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel)*100+45000;
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--土真气消耗
	elseif dwSkillLevel >= 70 then
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel)*100+45000;
		sResInfo.dwGold 	= 400000;	--金真气消耗
		sResInfo.dwWood 	= 400000;	--木真气消耗
		sResInfo.dwWater	= 400000;	--水真气消耗
		sResInfo.dwFire 	= 400000;	--火真气消耗
		sResInfo.dwSoil 	= 400000;	--土真气消耗
	end;
	return sResInfo;
end
local Skill = SkillConfig[51000];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 0,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,	--能否继续升级 true：可以，false：不可以 
	}	
	--------------------
	return sResInfo;
end

local Skill = SkillConfig[51001];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5151001;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--土真气消耗
	end;
	return sResInfo;
end


local Skill = SkillConfig[51002];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5151002;
		sResInfo.dwLevel = 5;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--土真气消耗
	end;
	return sResInfo;
end


local Skill = SkillConfig[51003];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5151003;
		sResInfo.dwLevel = 10;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--土真气消耗
	end;
	return sResInfo;
end



local Skill = SkillConfig[51004];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5151004;
		sResInfo.dwLevel = 5;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--土真气消耗
	end;
	return sResInfo;
end


local Skill = SkillConfig[51005];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5151005;
		sResInfo.dwLevel = 35;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--土真气消耗
	end;
	return sResInfo;
end

local Skill = SkillConfig[51006];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5151006;
		sResInfo.dwLevel = 80;
	elseif dwSkillLevel < 70 then
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel)*100+45000;
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 10+700);	--土真气消耗
	elseif dwSkillLevel >= 70 then
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel)*100+45000;
		sResInfo.dwGold 	= 400000;	--金真气消耗
		sResInfo.dwWood 	= 400000;	--木真气消耗
		sResInfo.dwWater	= 400000;	--水真气消耗
		sResInfo.dwFire 	= 400000;	--火真气消耗
		sResInfo.dwSoil 	= 400000;	--土真气消耗
	end;
	return sResInfo;
end
local Skill = SkillConfig[60000];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 5100000,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,
	};
	if(dwSkillLevel == 0 ) then
		sResInfo.dwCanUp = true;
		sResInfo.dwLevel = 34;
	end;
	return sResInfo;
end

local Skill = SkillConfig[60001];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 5100000,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,
	};
	if(dwSkillLevel == 0 ) then
		sResInfo.dwCanUp = true;
		sResInfo.dwLevel = 34;
	end;
	return sResInfo;
end

local Skill = SkillConfig[60002];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 5100000,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,
	};
	if(dwSkillLevel == 0 ) then
		sResInfo.dwCanUp = true;
		sResInfo.dwLevel = 34;
	end;
	return sResInfo;
end

local Skill = SkillConfig[60003];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 5100000,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,
	};
	if(dwSkillLevel == 0 ) then
		sResInfo.dwCanUp = true;
		sResInfo.dwLevel = 45;
	end;
	return sResInfo;
end

local Skill = SkillConfig[60004];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 5100000,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,
	};
	if(dwSkillLevel == 0 ) then
		sResInfo.dwCanUp = true;
		sResInfo.dwLevel = 55;
	end;
	return sResInfo;
end

local Skill = SkillConfig[60005];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {
				dwLevel = 0,		--等级需求
				dwMoney = 0, 		--银两需求
				dwGold = 0,		--真气-金
				dwWood = 0,		--真气-木
				dwWater = 0,		--真气-水
				dwFire = 0,		--真气-火
				dwSoil = 0,		--真气-土
				dwBookId = 5100000,	--书籍id
				dwProfession = 0,	--职业需求
				dwCanUp = false,
	};
	if(dwSkillLevel == 0 ) then
		sResInfo.dwCanUp = true;
		sResInfo.dwLevel = 65;
	end;
	return sResInfo;
end

local Skill = SkillConfig[61000];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5161000;
	end;
	return sResInfo;
end

local Skill = SkillConfig[61001];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	sResInfo.dwLevel = 10;
	
	
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5161001;
		sResInfo.dwLevel = 15;
	elseif (dwSkillLevel < 5) then
		sResInfo.dwLevel    = 20 * dwSkillLevel;
		sResInfo.dwMoney 	= MatchlessMoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(MatchlessZhenqiCount(dwSkillLevel));	--金真气消耗
		sResInfo.dwWood 	= math.floor(MatchlessZhenqiCount(dwSkillLevel));	--木真气消耗
		sResInfo.dwWater	= math.floor(MatchlessZhenqiCount(dwSkillLevel));	--水真气消耗
		sResInfo.dwFire 	= math.floor(MatchlessZhenqiCount(dwSkillLevel));	--火真气消耗
		sResInfo.dwSoil 	= math.floor(MatchlessZhenqiCount(dwSkillLevel));	--土真气消耗

	else
		sResInfo.dwCanUp = false;
	end;
	
		--sResInfo.dwCanUp = false;

	
	return sResInfo;
end


local Skill = SkillConfig[11016];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111016;
		sResInfo.dwLevel = 58;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--土真气消耗
	end;
		--sResInfo.dwCanUp = false;
	return sResInfo;
end

local Skill = SkillConfig[11017];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 5111017;
		sResInfo.dwLevel = 49;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--土真气消耗
	end;
		--sResInfo.dwCanUp = false;
	return sResInfo;
end


local Skill = SkillConfig[52000];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 7100024;		--桃花岛海图
		sResInfo.dwLevel = 1;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--土真气消耗
	end;
		--sResInfo.dwCanUp = false;
	return sResInfo;
end


local Skill = SkillConfig[52001];
function  Skill:GetSkillStudyCondition(dwSkillLevel)
	local sResInfo = {};
	CopyTable(BasicResInfo[dwSkillLevel],sResInfo);
	
	if dwSkillLevel == 0 then
		sResInfo.dwBookId = 7100024;		--桃花岛海图
		sResInfo.dwLevel = 1;
	else
		sResInfo.dwMoney 	= MoneyCount(dwSkillLevel);
		sResInfo.dwGold 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.3);	--金真气消耗
		sResInfo.dwWood 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.85);	--木真气消耗
		sResInfo.dwWater	= math.floor(ZhenqiCount(dwSkillLevel) * 1);	--水真气消耗
		sResInfo.dwFire 	= math.floor(ZhenqiCount(dwSkillLevel) * 0.7);	--火真气消耗
		sResInfo.dwSoil 	= math.floor(ZhenqiCount(dwSkillLevel) * 1.15);	--土真气消耗
	end;
		--sResInfo.dwCanUp = false;
	return sResInfo;
end