_G.enumFiveElemType = 
{
	Metal = 1001,
	Wood = 1002,
	Water = 1003,
	Fire = 1004,
	Earth = 1005,
	Dantian = 1006,
}
--五行真气增长速度公式(每小时)
--==玩家等级 * 1 + 120 + 120 * (五行等级/10 + 0.3)
--参数：角色等级lv，增长基数 m_wuxing_speed_base = 25，增长倍数基数 m_wuxing_lv_base = 8，五行等级
function _G.ERF_Count_WuxingSpeed(player_lv,wuxing_lv)
	return ( player_lv * 2 ) + 78 + FiveElemConfig[wuxing_lv+1].resume
end

--五行恢复速度（附加速度）
function _G.ERF_Count_WuxingSpeedEx(player_lv,wuxing_lv,dwTime,bMember)
	return ERF_Count_WuxingSpeed(player_lv,wuxing_lv)
end

--五行属性计算，参数：五行等级，五行类别
--五行系别等级 lv	
--五行系别	   _type
function _G.ERF_Count_AttribOfWuxing(lv,_type)
	if lv == 0 then
		return 0
	end
 	if _type == _G.enumFiveElemType.Metal then
		return FiveElemConfig[lv+1].atk
	end
	if _type == _G.enumFiveElemType.Wood then
		return FiveElemConfig[lv+1].hpmax
	end
	if _type == _G.enumFiveElemType.Water then
		return FiveElemConfig[lv+1].flee
	end
	if _type == _G.enumFiveElemType.Fire then
		return FiveElemConfig[lv+1].crit
	end
	if _type == _G.enumFiveElemType.Earth then
		return FiveElemConfig[lv+1].def
	end
	if _type == _G.enumFiveElemType.Dantian then
		return FiveElemConfig[lv+1].mpmax
	end
	
	
	
	
	return lv
end

--五行容量计算，参数：等级
--等级 lv

function _G.ERF_Count_tempOfWuxing(lv)
	return FiveElemConfig[lv+1].dantian_limit
end


--五行真气消耗，参数：等级，五行类别
--等级   lv
--五行系别	   _type

function _G.ERF_Count_ConsumeOfWuxing(lv,_type)
--	print('_type =',_type)
	--金。木。水。火。土
	if _type == _G.enumFiveElemType.Metal then
		return FiveElemConfig[lv+1].expend_1 , FiveElemConfig[lv+1].expend_5 , FiveElemConfig[lv+1].expend_4,FiveElemConfig[lv+1].expend_3,FiveElemConfig[lv+1].expend_2
	end
	if _type == _G.enumFiveElemType.Wood then
		return FiveElemConfig[lv+1].expend_3,FiveElemConfig[lv+1].expend_1,FiveElemConfig[lv+1].expend_2,FiveElemConfig[lv+1].expend_4,FiveElemConfig[lv+1].expend_5
	end
	if _type == _G.enumFiveElemType.Water then
		return FiveElemConfig[lv+1].expend_2,FiveElemConfig[lv+1].expend_4,FiveElemConfig[lv+1].expend_1,FiveElemConfig[lv+1].expend_5,FiveElemConfig[lv+1].expend_3
	end
	if _type == _G.enumFiveElemType.Fire then
		return FiveElemConfig[lv+1].expend_5,FiveElemConfig[lv+1].expend_2,FiveElemConfig[lv+1].expend_3,FiveElemConfig[lv+1].expend_1,FiveElemConfig[lv+1].expend_4
	end
	if _type == _G.enumFiveElemType.Earth then
		return FiveElemConfig[lv+1].expend_4,FiveElemConfig[lv+1].expend_3,FiveElemConfig[lv+1].expend_5,FiveElemConfig[lv+1].expend_2,FiveElemConfig[lv+1].expend_1
	end
	if _type == _G.enumFiveElemType.Dantian then
		return FiveElemConfig[lv+1].expend_dt , FiveElemConfig[lv+1].expend_dt , FiveElemConfig[lv+1].expend_dt , FiveElemConfig[lv+1].expend_dt , FiveElemConfig[lv+1].expend_dt
	end
end



--五行升级需求：人物等级
--参数：五行等级，五行类别
--等级   lv
--五行系别	   _type
--函数返回 人物等级
function _G.ERF_Limit_LvOfWuxingPlayer(lv,_type)
	if _type == _G.enumFiveElemType.Metal then
		return FiveElemConfig[lv+1].wuxing_lv
	end
	if _type == _G.enumFiveElemType.Wood then
		return FiveElemConfig[lv+1].wuxing_lv
	end
	if _type == _G.enumFiveElemType.Water then
		return FiveElemConfig[lv+1].wuxing_lv
	end
	if _type == _G.enumFiveElemType.Fire then
		return FiveElemConfig[lv+1].wuxing_lv
	end
	if _type == _G.enumFiveElemType.Earth then
		return FiveElemConfig[lv+1].wuxing_lv
	end
	if _type == _G.enumFiveElemType.Dantian then
		return FiveElemConfig[lv+1].dantian_lv
	end
end




--五行等级最高上限
--参数：人物等级，五行类别
--等级   lv
--五行系别	   _type
--函数返回 五行等级上限
function _G.ERF_Limit_LvOfWuxing(lv,_type)
	if _type == _G.enumFiveElemType.Metal then
		return 40
	end
	if _type == _G.enumFiveElemType.Wood then
		return 40
	end
	if _type == _G.enumFiveElemType.Water then
		return 40
	end
	if _type == _G.enumFiveElemType.Fire then
		return 40
	end
	if _type == _G.enumFiveElemType.Earth then
		return 40
	end
	if _type == _G.enumFiveElemType.Dantian then
		return 20
	end
end

--[[
:序号
id:五行等级
wuxing_lv:五行属性升级的等级限制:类型说明
dantian_lv:丹田升级的等级限制:名称说明
atk:五行增加攻击力
def:五行增加防御力
flee:五行增加身法值
crit:五行增加暴击值
hpmax:五行增加HP上限
mpmax:五行增加MPMAX上限
expend_1:升级消耗_自身
expend_2:升级消耗_相生
expend_3:升级消耗_相克
expend_4:升级消耗_衍生
expend_5:升级消耗_克制
expend_dt:丹田_升级消耗
resume:五行成长
dantian_limit:丹田成长
--]]
_G.FiveElemConfig={ 
[1]={id=1,wuxing_lv=1,dantian_lv=5,atk=0,def=0,flee=0,crit=0,hpmax=0,mpmax=0,expend_1=20,expend_2=28,expend_3=11,expend_4=24,expend_5=17,expend_dt=100,resume=0,dantian_limit=8000000,},
[2]={id=2,wuxing_lv=1,dantian_lv=10,atk=2,def=4,flee=6,crit=3,hpmax=7,mpmax=10,expend_1=32,expend_2=45,expend_3=18,expend_4=38,expend_5=27,expend_dt=180,resume=9,dantian_limit=1300,},
[3]={id=3,wuxing_lv=1,dantian_lv=15,atk=5,def=7,flee=11,crit=6,hpmax=16,mpmax=22,expend_1=47,expend_2=66,expend_3=26,expend_4=56,expend_5=40,expend_dt=290,resume=14,dantian_limit=1820,},
[4]={id=4,wuxing_lv=1,dantian_lv=20,atk=9,def=11,flee=17,crit=10,hpmax=27,mpmax=42,expend_1=67,expend_2=94,expend_3=37,expend_4=80,expend_5=57,expend_dt=464,resume=20,dantian_limit=2390,},
[5]={id=5,wuxing_lv=1,dantian_lv=25,atk=14,def=17,flee=24,crit=15,hpmax=40,mpmax=70,expend_1=94,expend_2=132,expend_3=52,expend_4=113,expend_5=80,expend_dt=736,resume=27,dantian_limit=3040,},
[6]={id=6,wuxing_lv=1,dantian_lv=30,atk=20,def=24,flee=33,crit=21,hpmax=55,mpmax=106,expend_1=130,expend_2=182,expend_3=72,expend_4=156,expend_5=111,expend_dt=1140,resume=35,dantian_limit=3800,},
[7]={id=7,wuxing_lv=1,dantian_lv=35,atk=27,def=32,flee=43,crit=28,hpmax=72,mpmax=150,expend_1=177,expend_2=248,expend_3=97,expend_4=212,expend_5=150,expend_dt=1710,resume=44,dantian_limit=4700,},
[8]={id=8,wuxing_lv=1,dantian_lv=40,atk=35,def=42,flee=54,crit=37,hpmax=91,mpmax=202,expend_1=237,expend_2=332,expend_3=130,expend_4=284,expend_5=201,expend_dt=2480,resume=54,dantian_limit=5770,},
[9]={id=9,wuxing_lv=1,dantian_lv=44,atk=44,def=53,flee=66,crit=47,hpmax=112,mpmax=262,expend_1=312,expend_2=437,expend_3=172,expend_4=374,expend_5=265,expend_dt=3484,resume=66,dantian_limit=7040,},
[10]={id=10,wuxing_lv=1,dantian_lv=48,atk=54,def=65,flee=79,crit=58,hpmax=135,mpmax=330,expend_1=405,expend_2=567,expend_3=223,expend_4=486,expend_5=344,expend_dt=4756,resume=80,dantian_limit=8540,},
[11]={id=11,wuxing_lv=1,dantian_lv=52,atk=65,def=78,flee=94,crit=70,hpmax=160,mpmax=406,expend_1=519,expend_2=727,expend_3=285,expend_4=623,expend_5=441,expend_dt=6330,resume=96,dantian_limit=10300,},
[12]={id=12,wuxing_lv=1,dantian_lv=56,atk=77,def=93,flee=110,crit=83,hpmax=187,mpmax=490,expend_1=657,expend_2=920,expend_3=361,expend_4=788,expend_5=558,expend_dt=8240,resume=114,dantian_limit=12350,},
[13]={id=13,wuxing_lv=1,dantian_lv=60,atk=90,def=109,flee=127,crit=97,hpmax=216,mpmax=582,expend_1=822,expend_2=1151,expend_3=452,expend_4=986,expend_5=699,expend_dt=10520,resume=134,dantian_limit=14720,},
[14]={id=14,wuxing_lv=1,dantian_lv=63,atk=104,def=126,flee=145,crit=112,hpmax=247,mpmax=682,expend_1=1017,expend_2=1424,expend_3=559,expend_4=1220,expend_5=864,expend_dt=13204,resume=156,dantian_limit=17440,},
[15]={id=15,wuxing_lv=1,dantian_lv=66,atk=119,def=145,flee=164,crit=128,hpmax=280,mpmax=790,expend_1=1245,expend_2=1743,expend_3=685,expend_4=1494,expend_5=1058,expend_dt=16326,resume=180,dantian_limit=20540,},
[16]={id=16,wuxing_lv=1,dantian_lv=69,atk=135,def=165,flee=185,crit=145,hpmax=315,mpmax=906,expend_1=1509,expend_2=2113,expend_3=830,expend_4=1811,expend_5=1283,expend_dt=19920,resume=206,dantian_limit=24050,},
[17]={id=17,wuxing_lv=1,dantian_lv=72,atk=152,def=186,flee=207,crit=163,hpmax=352,mpmax=1030,expend_1=1812,expend_2=2537,expend_3=997,expend_4=2174,expend_5=1540,expend_dt=24020,resume=234,dantian_limit=28000,},
[18]={id=18,wuxing_lv=1,dantian_lv=75,atk=170,def=209,flee=230,crit=183,hpmax=391,mpmax=1162,expend_1=2157,expend_2=3020,expend_3=1186,expend_4=2588,expend_5=1833,expend_dt=28660,resume=264,dantian_limit=32420,},
[19]={id=19,wuxing_lv=1,dantian_lv=77,atk=189,def=233,flee=254,crit=204,hpmax=432,mpmax=1302,expend_1=2547,expend_2=3566,expend_3=1401,expend_4=3056,expend_5=2165,expend_dt=33874,resume=297,dantian_limit=37340,},
[20]={id=20,wuxing_lv=1,dantian_lv=79,atk=209,def=258,flee=279,crit=226,hpmax=475,mpmax=1450,expend_1=2986,expend_2=4180,expend_3=1642,expend_4=3583,expend_5=2538,expend_dt=39696,resume=333,dantian_limit=42790,},
[21]={id=21,wuxing_lv=1,dantian_lv=81,atk=230,def=284,flee=306,crit=249,hpmax=520,mpmax=1606,expend_1=3478,expend_2=4869,expend_3=1913,expend_4=4174,expend_5=2956,expend_dt=46160,resume=372,dantian_limit=48800,},
[22]={id=22,wuxing_lv=1,dantian_lv=83,atk=252,def=312,flee=334,crit=273,hpmax=567,mpmax=1770,expend_1=4027,expend_2=5638,expend_3=2215,expend_4=4832,expend_5=3423,expend_dt=53300,resume=414,dantian_limit=55400,},
[23]={id=23,wuxing_lv=1,dantian_lv=85,atk=275,def=341,flee=363,crit=298,hpmax=616,mpmax=1942,expend_1=4637,expend_2=6492,expend_3=2550,expend_4=5564,expend_5=3941,expend_dt=61150,resume=459,dantian_limit=62620,},
[24]={id=24,wuxing_lv=1,dantian_lv=86,atk=299,def=371,flee=393,crit=324,hpmax=667,mpmax=2122,expend_1=5312,expend_2=7437,expend_3=2922,expend_4=6374,expend_5=4515,expend_dt=69744,resume=507,dantian_limit=70490,},
[25]={id=25,wuxing_lv=1,dantian_lv=87,atk=324,def=403,flee=424,crit=351,hpmax=720,mpmax=2310,expend_1=6056,expend_2=8478,expend_3=3331,expend_4=7267,expend_5=5148,expend_dt=79116,resume=558,dantian_limit=79040,},
[26]={id=26,wuxing_lv=1,dantian_lv=88,atk=350,def=436,flee=457,crit=379,hpmax=775,mpmax=2506,expend_1=6873,expend_2=9622,expend_3=3780,expend_4=8248,expend_5=5842,expend_dt=89300,resume=612,dantian_limit=88300,},
[27]={id=27,wuxing_lv=1,dantian_lv=89,atk=377,def=470,flee=491,crit=408,hpmax=832,mpmax=2710,expend_1=7767,expend_2=10874,expend_3=4272,expend_4=9320,expend_5=6602,expend_dt=100330,resume=669,dantian_limit=98300,},
[28]={id=28,wuxing_lv=1,dantian_lv=90,atk=405,def=506,flee=526,crit=439,hpmax=891,mpmax=2922,expend_1=8742,expend_2=12239,expend_3=4808,expend_4=10490,expend_5=7431,expend_dt=112240,resume=729,dantian_limit=109070,},
[29]={id=29,wuxing_lv=1,dantian_lv=91,atk=434,def=543,flee=562,crit=471,hpmax=952,mpmax=3142,expend_1=9802,expend_2=13723,expend_3=5391,expend_4=11762,expend_5=8332,expend_dt=125064,resume=793,dantian_limit=120640,},
[30]={id=30,wuxing_lv=1,dantian_lv=92,atk=464,def=581,flee=599,crit=504,hpmax=1015,mpmax=3370,expend_1=10952,expend_2=15333,expend_3=6024,expend_4=13142,expend_5=9309,expend_dt=138836,resume=861,dantian_limit=133040,},
[31]={id=31,wuxing_lv=1,dantian_lv=93,atk=495,def=620,flee=638,crit=538,hpmax=1080,mpmax=3606,expend_1=12197,expend_2=17076,expend_3=6708,expend_4=14636,expend_5=10367,expend_dt=153590,resume=933,dantian_limit=146300,},
[32]={id=32,wuxing_lv=1,dantian_lv=94,atk=527,def=661,flee=678,crit=573,hpmax=1147,mpmax=3850,expend_1=13542,expend_2=18959,expend_3=7448,expend_4=16250,expend_5=11511,expend_dt=169360,resume=1009,dantian_limit=160450,},
[33]={id=33,wuxing_lv=1,dantian_lv=95,atk=560,def=703,flee=719,crit=609,hpmax=1216,mpmax=4102,expend_1=14992,expend_2=20989,expend_3=8246,expend_4=17990,expend_5=12743,expend_dt=186180,resume=1089,dantian_limit=175520,},
[34]={id=34,wuxing_lv=1,dantian_lv=96,atk=594,def=746,flee=761,crit=646,hpmax=1287,mpmax=4362,expend_1=16552,expend_2=23173,expend_3=9104,expend_4=19862,expend_5=14069,expend_dt=204084,resume=1173,dantian_limit=191540,},
[35]={id=35,wuxing_lv=1,dantian_lv=97,atk=629,def=791,flee=804,crit=684,hpmax=1360,mpmax=4630,expend_1=18227,expend_2=25518,expend_3=10025,expend_4=21872,expend_5=15493,expend_dt=223106,resume=1261,dantian_limit=208540,},
[36]={id=36,wuxing_lv=1,dantian_lv=98,atk=665,def=837,flee=849,crit=723,hpmax=1435,mpmax=4906,expend_1=20022,expend_2=28031,expend_3=11012,expend_4=24026,expend_5=17019,expend_dt=243280,resume=1353,dantian_limit=226550,},
[37]={id=37,wuxing_lv=1,dantian_lv=99,atk=702,def=884,flee=895,crit=763,hpmax=1512,mpmax=5190,expend_1=21942,expend_2=30719,expend_3=12068,expend_4=26330,expend_5=18651,expend_dt=264640,resume=1449,dantian_limit=245600,},
[38]={id=38,wuxing_lv=1,dantian_lv=100,atk=740,def=933,flee=942,crit=805,hpmax=1591,mpmax=5482,expend_1=23992,expend_2=33589,expend_3=13196,expend_4=28790,expend_5=20393,expend_dt=287220,resume=1549,dantian_limit=265720,},
[39]={id=39,wuxing_lv=1,dantian_lv=101,atk=779,def=983,flee=990,crit=848,hpmax=1672,mpmax=5782,expend_1=26177,expend_2=36648,expend_3=14397,expend_4=31412,expend_5=22250,expend_dt=311054,resume=1654,dantian_limit=286940,},
[40]={id=40,wuxing_lv=1,dantian_lv=102,atk=819,def=1034,flee=1039,crit=892,hpmax=1755,mpmax=6090,expend_1=28503,expend_2=39904,expend_3=15677,expend_4=34204,expend_5=24228,expend_dt=336176,resume=1764,dantian_limit=309290,},
[41]={id=41,wuxing_lv=1,dantian_lv=103,atk=860,def=1086,flee=1090,crit=937,hpmax=1840,mpmax=6406,expend_1=30976,expend_2=43366,expend_3=17037,expend_4=37171,expend_5=26330,expend_dt=362620,resume=1879,dantian_limit=332800,},
[42]={id=42,wuxing_lv=1,dantian_lv=104,atk=902,def=1140,flee=1142,crit=983,hpmax=1927,mpmax=6730,expend_1=33602,expend_2=47043,expend_3=18481,expend_4=40322,expend_5=28562,expend_dt=390420,resume=1999,dantian_limit=357500,},
[43]={id=43,wuxing_lv=1,dantian_lv=105,atk=945,def=1195,flee=1195,crit=1030,hpmax=2016,mpmax=7062,expend_1=36387,expend_2=50942,expend_3=20013,expend_4=43664,expend_5=30929,expend_dt=419610,resume=2124,dantian_limit=383420,},
[44]={id=44,wuxing_lv=1,dantian_lv=106,atk=989,def=1251,flee=1249,crit=1078,hpmax=2107,mpmax=7402,expend_1=39337,expend_2=55072,expend_3=21635,expend_4=47204,expend_5=33436,expend_dt=450224,resume=2254,dantian_limit=410590,},
[45]={id=45,wuxing_lv=1,dantian_lv=107,atk=1034,def=1309,flee=1304,crit=1127,hpmax=2200,mpmax=7750,expend_1=42458,expend_2=59441,expend_3=23352,expend_4=50950,expend_5=36089,expend_dt=482296,resume=2389,dantian_limit=439040,},
[46]={id=46,wuxing_lv=1,dantian_lv=108,atk=1080,def=1368,flee=1361,crit=1177,hpmax=2295,mpmax=8106,expend_1=45756,expend_2=64058,expend_3=25166,expend_4=54907,expend_5=38893,expend_dt=515860,resume=2529,dantian_limit=468800,},
[47]={id=47,wuxing_lv=1,dantian_lv=109,atk=1127,def=1428,flee=1419,crit=1228,hpmax=2392,mpmax=8470,expend_1=49237,expend_2=68932,expend_3=27080,expend_4=59084,expend_5=41851,expend_dt=550950,resume=2674,dantian_limit=499900,},
[48]={id=48,wuxing_lv=1,dantian_lv=110,atk=1175,def=1490,flee=1478,crit=1281,hpmax=2491,mpmax=8842,expend_1=52907,expend_2=74070,expend_3=29099,expend_4=63488,expend_5=44971,expend_dt=587600,resume=2824,dantian_limit=532370,},
[49]={id=49,wuxing_lv=1,dantian_lv=111,atk=1224,def=1553,flee=1538,crit=1335,hpmax=2592,mpmax=9222,expend_1=56772,expend_2=79481,expend_3=31225,expend_4=68126,expend_5=48256,expend_dt=625844,resume=2980,dantian_limit=566240,},
[50]={id=50,wuxing_lv=1,dantian_lv=112,atk=1274,def=1617,flee=1599,crit=1390,hpmax=2695,mpmax=9610,expend_1=60838,expend_2=85173,expend_3=33461,expend_4=73006,expend_5=51712,expend_dt=665716,resume=3142,dantian_limit=601540,},
[51]={id=51,wuxing_lv=1,dantian_lv=113,atk=1325,def=1682,flee=1662,crit=1446,hpmax=2800,mpmax=10006,expend_1=65111,expend_2=91155,expend_3=35811,expend_4=78133,expend_5=55344,expend_dt=707250,resume=3310,dantian_limit=638300,},
}
