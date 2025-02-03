--服务器冲穴反馈
_G.enumPulseFeedBack = 
{
	--冲穴判断
	Success = 1,
	Faild 	= 2,
	
	--冲穴反馈
	Begin = 3,
	ConverseCount = 4,
	ShareExp = 5,
	PlayPfx = 6,
	
	PlayPfxForever = 7,
	Full = 8,
	FinishOnePulse = 10,
	FinishAllPulse = 11,
	AddExp = 12,
	VipChange = 99,
	----------------
	Exp = 101,
	All = 102,
	Pulse = 103,
	WuValue = 104,
}
---冲脉道具配置
_G.PulseItem = 
{
	nItemID = 2500040,
	dwPercent = 300,
}

--冲脉时间
_G.PulseCountTime = 10
--冲脉分享次数
_G.PulseShareTimes = 12
_G.PulseShareTimesEx = 24
--VIP增加几率
_G.PulseMemberAddRate = 0
--经脉分享距离
_G.PulseShareDistance = 8
--冲脉杀怪的数量上限
_G.PulseKillMonsterMax = 35;
--冲脉伤害的倍数计算
function _G.CountPulseHurtValue(objPlayer,objMonster)
	local dwPer = 6;
	
	local dwMyLevel = objPlayer:GetLevel();
	local dwEnemyLevel = objMonster:GetLevel();
	if dwEnemyLevel > dwMyLevel then
		dwPer = 3;
	end
	
	return dwPer;
end;
--战斗力计算
function _G.CountPulseFightValue(curNum,fullNum)
	
	
	return curNum + fullNum;
end;

_G.PulseCount =
{
	"-1.png",
	"-2.png",
	"-3.png",
	"-4.png",
	"-5.png",
	"-6.png",
	"-7.png",
	"-8.png",
	"-9.png",
	"-0.png",
}
_G.PulsePfxConfig = 
{
	Forever = 
	{
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
	},
	Once = 
	{
		91098,
		91099,
	}
}
_G.PulseConfig = 
{
	--petype 经脉穴位所加属性类别
	--patype 冲通该经脉后所加属性类别
	[1] = 
	{
		name = '阳维脉',number=40,petype1 = '攻击',petype2 = '0',patype1 = '攻击',patype2 = '0',dwAttack=70,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,
		---经脉打通限制
		dwLevel = 14,
		---经脉描述
		PulseDis = "督脉中的重要脉络，直接影响督脉的通畅",		
		Pulse = 
		{
		[1]={dwId=1,dwAttack=0,dwDefense=6,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=10000,exp=0,zhenqi_metal=800,zhenqi_wood=800,zhenqi_water=0,zhenqi_fire=1000,zhenqi_earth=1000,jingmai_effect='jingmaidatong_01.pfx',},
		[2]={dwId=2,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=25,dwMPMax=0,rate=9000,exp=0,zhenqi_metal=1200,zhenqi_wood=1200,zhenqi_water=0,zhenqi_fire=1500,zhenqi_earth=1500,jingmai_effect='jingmaidatong_01.pfx',},
		[3]={dwId=3,dwAttack=0,dwDefense=7,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=8000,exp=0,zhenqi_metal=1840,zhenqi_wood=1840,zhenqi_water=0,zhenqi_fire=2300,zhenqi_earth=2300,jingmai_effect='jingmaidatong_01.pfx',},
		[4]={dwId=4,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=30,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=2800,zhenqi_wood=2800,zhenqi_water=0,zhenqi_fire=3500,zhenqi_earth=3500,jingmai_effect='jingmaidatong_01.pfx',},
		[5]={dwId=5,dwAttack=0,dwDefense=9,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=4000,zhenqi_wood=4000,zhenqi_water=0,zhenqi_fire=5000,zhenqi_earth=5000,jingmai_effect='jingmaidatong_01.pfx',},
		[6]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=36,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=5440,zhenqi_wood=5440,zhenqi_water=0,zhenqi_fire=6800,zhenqi_earth=6800,jingmai_effect='jingmaidatong_01.pfx',},
		[7]={dwId=7,dwAttack=0,dwDefense=11,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=7040,zhenqi_wood=7040,zhenqi_water=0,zhenqi_fire=8800,zhenqi_earth=8800,jingmai_effect='jingmaidatong_01.pfx',},
		[8]={dwId=8,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=44,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=8800,zhenqi_wood=8800,zhenqi_water=0,zhenqi_fire=11000,zhenqi_earth=11000,jingmai_effect='jingmaidatong_01.pfx',},
		[9]={dwId=9,dwAttack=0,dwDefense=14,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=10560,zhenqi_wood=10560,zhenqi_water=0,zhenqi_fire=13200,zhenqi_earth=13200,jingmai_effect='jingmaidatong_01.pfx',},
		[10]={dwId=10,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=55,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=12400,zhenqi_wood=12400,zhenqi_water=0,zhenqi_fire=15500,zhenqi_earth=15500,jingmai_effect='jingmaidatong_01.pfx',},
		[11]={dwId=11,dwAttack=0,dwDefense=17,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=15360,zhenqi_wood=15360,zhenqi_water=0,zhenqi_fire=19200,zhenqi_earth=19200,jingmai_effect='jingmaidatong_01.pfx',},
		[12]={dwId=12,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=70,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=18800,zhenqi_wood=18800,zhenqi_water=0,zhenqi_fire=23500,zhenqi_earth=23500,jingmai_effect='jingmaidatong_01.pfx',},
		[13]={dwId=13,dwAttack=0,dwDefense=21,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=21200,zhenqi_wood=21200,zhenqi_water=0,zhenqi_fire=26500,zhenqi_earth=26500,jingmai_effect='jingmaidatong_01.pfx',},
		[14]={dwId=14,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=90,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=23840,zhenqi_wood=23840,zhenqi_water=0,zhenqi_fire=29800,zhenqi_earth=29800,jingmai_effect='jingmaidatong_01.pfx',},
		[15]={dwId=15,dwAttack=0,dwDefense=25,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=26640,zhenqi_wood=26640,zhenqi_water=0,zhenqi_fire=33300,zhenqi_earth=33300,jingmai_effect='jingmaidatong_01.pfx',},
		[16]={dwId=16,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=116,dwMPMax=0,rate=3000,exp=0,zhenqi_metal=30400,zhenqi_wood=30400,zhenqi_water=0,zhenqi_fire=38000,zhenqi_earth=38000,jingmai_effect='jingmaidatong_01.pfx',},
		[17]={dwId=17,dwAttack=0,dwDefense=30,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=34800,zhenqi_wood=34800,zhenqi_water=0,zhenqi_fire=43500,zhenqi_earth=43500,jingmai_effect='jingmaidatong_01.pfx',},
		[18]={dwId=18,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=149,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=39680,zhenqi_wood=39680,zhenqi_water=0,zhenqi_fire=49600,zhenqi_earth=49600,jingmai_effect='jingmaidatong_01.pfx',},
		[19]={dwId=19,dwAttack=0,dwDefense=37,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=44800,zhenqi_wood=44800,zhenqi_water=0,zhenqi_fire=56000,zhenqi_earth=56000,jingmai_effect='jingmaidatong_01.pfx',},
		[20]={dwId=20,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=190,dwMPMax=0,rate=2000,exp=0,zhenqi_metal=50000,zhenqi_wood=50000,zhenqi_water=0,zhenqi_fire=62500,zhenqi_earth=62500,jingmai_effect='jingmaidatong_01.pfx',},
		[21]={dwId=21,dwAttack=0,dwDefense=47,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=55200,zhenqi_wood=55200,zhenqi_water=0,zhenqi_fire=69000,zhenqi_earth=69000,jingmai_effect='jingmaidatong_01.pfx',},
		[22]={dwId=22,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=240,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=60000,zhenqi_wood=60000,zhenqi_water=0,zhenqi_fire=75000,zhenqi_earth=75000,jingmai_effect='jingmaidatong_01.pfx',},
		[23]={dwId=23,dwAttack=0,dwDefense=61,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=65200,zhenqi_wood=65200,zhenqi_water=0,zhenqi_fire=81500,zhenqi_earth=81500,jingmai_effect='jingmaidatong_01.pfx',},
		[24]={dwId=24,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=300,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=70400,zhenqi_wood=70400,zhenqi_water=0,zhenqi_fire=88000,zhenqi_earth=88000,jingmai_effect='jingmaidatong_01.pfx',},
		[25]={dwId=25,dwAttack=0,dwDefense=80,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=970,exp=0,zhenqi_metal=75200,zhenqi_wood=75200,zhenqi_water=0,zhenqi_fire=94000,zhenqi_earth=94000,jingmai_effect='jingmaidatong_01.pfx',},
		[26]={dwId=26,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=375,dwMPMax=0,rate=940,exp=0,zhenqi_metal=80000,zhenqi_wood=80000,zhenqi_water=0,zhenqi_fire=100000,zhenqi_earth=100000,jingmai_effect='jingmaidatong_01.pfx',},
		[27]={dwId=27,dwAttack=0,dwDefense=105,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=910,exp=0,zhenqi_metal=84000,zhenqi_wood=84000,zhenqi_water=0,zhenqi_fire=105000,zhenqi_earth=105000,jingmai_effect='jingmaidatong_01.pfx',},
		[28]={dwId=28,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=470,dwMPMax=0,rate=880,exp=0,zhenqi_metal=88000,zhenqi_wood=88000,zhenqi_water=0,zhenqi_fire=110000,zhenqi_earth=110000,jingmai_effect='jingmaidatong_01.pfx',},
		[29]={dwId=29,dwAttack=0,dwDefense=137,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=850,exp=0,zhenqi_metal=94400,zhenqi_wood=94400,zhenqi_water=0,zhenqi_fire=118000,zhenqi_earth=118000,jingmai_effect='jingmaidatong_01.pfx',},
		[30]={dwId=30,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=760,dwMPMax=0,rate=820,exp=0,zhenqi_metal=100800,zhenqi_wood=100800,zhenqi_water=0,zhenqi_fire=126000,zhenqi_earth=126000,jingmai_effect='jingmaidatong_01.pfx',},
		[31]={dwId=31,dwAttack=0,dwDefense=177,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=790,exp=0,zhenqi_metal=107200,zhenqi_wood=107200,zhenqi_water=0,zhenqi_fire=134000,zhenqi_earth=134000,jingmai_effect='jingmaidatong_01.pfx',},
		[32]={dwId=32,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=900,dwMPMax=0,rate=760,exp=0,zhenqi_metal=113600,zhenqi_wood=113600,zhenqi_water=0,zhenqi_fire=142000,zhenqi_earth=142000,jingmai_effect='jingmaidatong_01.pfx',},
		[33]={dwId=33,dwAttack=0,dwDefense=226,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=730,exp=0,zhenqi_metal=120000,zhenqi_wood=120000,zhenqi_water=0,zhenqi_fire=150000,zhenqi_earth=150000,jingmai_effect='jingmaidatong_01.pfx',},
		[34]={dwId=34,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1060,dwMPMax=0,rate=700,exp=0,zhenqi_metal=128000,zhenqi_wood=128000,zhenqi_water=0,zhenqi_fire=160000,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[35]={dwId=35,dwAttack=0,dwDefense=285,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=670,exp=0,zhenqi_metal=136000,zhenqi_wood=136000,zhenqi_water=0,zhenqi_fire=170000,zhenqi_earth=170000,jingmai_effect='jingmaidatong_01.pfx',},
		[36]={dwId=36,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1250,dwMPMax=0,rate=640,exp=0,zhenqi_metal=144000,zhenqi_wood=144000,zhenqi_water=0,zhenqi_fire=180000,zhenqi_earth=180000,jingmai_effect='jingmaidatong_01.pfx',},
		[37]={dwId=37,dwAttack=0,dwDefense=355,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=610,exp=0,zhenqi_metal=152000,zhenqi_wood=152000,zhenqi_water=0,zhenqi_fire=190000,zhenqi_earth=190000,jingmai_effect='jingmaidatong_01.pfx',},
		[38]={dwId=38,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1480,dwMPMax=0,rate=580,exp=0,zhenqi_metal=160000,zhenqi_wood=160000,zhenqi_water=0,zhenqi_fire=200000,zhenqi_earth=200000,jingmai_effect='jingmaidatong_01.pfx',},
		[39]={dwId=39,dwAttack=0,dwDefense=450,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=550,exp=0,zhenqi_metal=160000,zhenqi_wood=160000,zhenqi_water=0,zhenqi_fire=200000,zhenqi_earth=200000,jingmai_effect='jingmaidatong_01.pfx',},
		[40]={dwId=40,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1880,dwMPMax=0,rate=520,exp=0,zhenqi_metal=160000,zhenqi_wood=160000,zhenqi_water=0,zhenqi_fire=200000,zhenqi_earth=200000,jingmai_effect='jingmaidatong_02.pfx',},
		}
	},
	[2] = 
	{
		name = '阴维脉',number=40,petype1 = '生命',petype2 = '内力',patype1 = '生命',patype2 = '0',dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=140,dwMPMax=0,
		---经脉打通限制
		dwLevel = 18,		
		---经脉描述
		PulseDis = "任脉中的重要脉络，直接影响任脉的通畅",		
		Pulse = 
		{
		[1]={dwId=1,dwAttack=8,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=10000,exp=0,zhenqi_metal=1000,zhenqi_wood=1000,zhenqi_water=0,zhenqi_fire=800,zhenqi_earth=800,jingmai_effect='jingmaidatong_01.pfx',},
		[2]={dwId=2,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=10,rate=9000,exp=0,zhenqi_metal=1500,zhenqi_wood=1500,zhenqi_water=0,zhenqi_fire=1200,zhenqi_earth=1200,jingmai_effect='jingmaidatong_01.pfx',},
		[3]={dwId=3,dwAttack=10,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=8000,exp=0,zhenqi_metal=2300,zhenqi_wood=2300,zhenqi_water=0,zhenqi_fire=1840,zhenqi_earth=1840,jingmai_effect='jingmaidatong_01.pfx',},
		[4]={dwId=4,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=11,rate=7000,exp=0,zhenqi_metal=3500,zhenqi_wood=3500,zhenqi_water=0,zhenqi_fire=2800,zhenqi_earth=2800,jingmai_effect='jingmaidatong_01.pfx',},
		[5]={dwId=5,dwAttack=12,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=5000,zhenqi_wood=5000,zhenqi_water=0,zhenqi_fire=4000,zhenqi_earth=4000,jingmai_effect='jingmaidatong_01.pfx',},
		[6]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=13,rate=7000,exp=0,zhenqi_metal=6800,zhenqi_wood=6800,zhenqi_water=0,zhenqi_fire=5440,zhenqi_earth=5440,jingmai_effect='jingmaidatong_01.pfx',},
		[7]={dwId=7,dwAttack=14,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=8800,zhenqi_wood=8800,zhenqi_water=0,zhenqi_fire=7040,zhenqi_earth=7040,jingmai_effect='jingmaidatong_01.pfx',},
		[8]={dwId=8,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=16,rate=7000,exp=0,zhenqi_metal=11000,zhenqi_wood=11000,zhenqi_water=0,zhenqi_fire=8800,zhenqi_earth=8800,jingmai_effect='jingmaidatong_01.pfx',},
		[9]={dwId=9,dwAttack=17,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=13200,zhenqi_wood=13200,zhenqi_water=0,zhenqi_fire=10560,zhenqi_earth=10560,jingmai_effect='jingmaidatong_01.pfx',},
		[10]={dwId=10,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=20,rate=6000,exp=0,zhenqi_metal=15500,zhenqi_wood=15500,zhenqi_water=0,zhenqi_fire=12400,zhenqi_earth=12400,jingmai_effect='jingmaidatong_01.pfx',},
		[11]={dwId=11,dwAttack=21,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=19200,zhenqi_wood=19200,zhenqi_water=0,zhenqi_fire=15360,zhenqi_earth=15360,jingmai_effect='jingmaidatong_01.pfx',},
		[12]={dwId=12,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=25,rate=5000,exp=0,zhenqi_metal=23500,zhenqi_wood=23500,zhenqi_water=0,zhenqi_fire=18800,zhenqi_earth=18800,jingmai_effect='jingmaidatong_01.pfx',},
		[13]={dwId=13,dwAttack=26,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=26500,zhenqi_wood=26500,zhenqi_water=0,zhenqi_fire=21200,zhenqi_earth=21200,jingmai_effect='jingmaidatong_01.pfx',},
		[14]={dwId=14,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=31,rate=5000,exp=0,zhenqi_metal=29800,zhenqi_wood=29800,zhenqi_water=0,zhenqi_fire=23840,zhenqi_earth=23840,jingmai_effect='jingmaidatong_01.pfx',},
		[15]={dwId=15,dwAttack=32,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=33300,zhenqi_wood=33300,zhenqi_water=0,zhenqi_fire=26640,zhenqi_earth=26640,jingmai_effect='jingmaidatong_01.pfx',},
		[16]={dwId=16,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=38,rate=3000,exp=0,zhenqi_metal=38000,zhenqi_wood=38000,zhenqi_water=0,zhenqi_fire=30400,zhenqi_earth=30400,jingmai_effect='jingmaidatong_01.pfx',},
		[17]={dwId=17,dwAttack=40,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=43500,zhenqi_wood=43500,zhenqi_water=0,zhenqi_fire=34800,zhenqi_earth=34800,jingmai_effect='jingmaidatong_01.pfx',},
		[18]={dwId=18,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=46,rate=2500,exp=0,zhenqi_metal=49600,zhenqi_wood=49600,zhenqi_water=0,zhenqi_fire=39680,zhenqi_earth=39680,jingmai_effect='jingmaidatong_01.pfx',},
		[19]={dwId=19,dwAttack=50,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=56000,zhenqi_wood=56000,zhenqi_water=0,zhenqi_fire=44800,zhenqi_earth=44800,jingmai_effect='jingmaidatong_01.pfx',},
		[20]={dwId=20,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=55,rate=2000,exp=0,zhenqi_metal=62500,zhenqi_wood=62500,zhenqi_water=0,zhenqi_fire=50000,zhenqi_earth=50000,jingmai_effect='jingmaidatong_01.pfx',},
		[21]={dwId=21,dwAttack=62,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=69000,zhenqi_wood=69000,zhenqi_water=0,zhenqi_fire=55200,zhenqi_earth=55200,jingmai_effect='jingmaidatong_01.pfx',},
		[22]={dwId=22,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=65,rate=1000,exp=0,zhenqi_metal=75000,zhenqi_wood=75000,zhenqi_water=0,zhenqi_fire=60000,zhenqi_earth=60000,jingmai_effect='jingmaidatong_01.pfx',},
		[23]={dwId=23,dwAttack=77,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=81500,zhenqi_wood=81500,zhenqi_water=0,zhenqi_fire=65200,zhenqi_earth=65200,jingmai_effect='jingmaidatong_01.pfx',},
		[24]={dwId=24,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=76,rate=1000,exp=0,zhenqi_metal=88000,zhenqi_wood=88000,zhenqi_water=0,zhenqi_fire=70400,zhenqi_earth=70400,jingmai_effect='jingmaidatong_01.pfx',},
		[25]={dwId=25,dwAttack=100,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=970,exp=0,zhenqi_metal=94000,zhenqi_wood=94000,zhenqi_water=0,zhenqi_fire=75200,zhenqi_earth=75200,jingmai_effect='jingmaidatong_01.pfx',},
		[26]={dwId=26,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=100,rate=940,exp=0,zhenqi_metal=100000,zhenqi_wood=100000,zhenqi_water=0,zhenqi_fire=80000,zhenqi_earth=80000,jingmai_effect='jingmaidatong_01.pfx',},
		[27]={dwId=27,dwAttack=130,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=910,exp=0,zhenqi_metal=105000,zhenqi_wood=105000,zhenqi_water=0,zhenqi_fire=84000,zhenqi_earth=84000,jingmai_effect='jingmaidatong_01.pfx',},
		[28]={dwId=28,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=115,rate=880,exp=0,zhenqi_metal=110000,zhenqi_wood=110000,zhenqi_water=0,zhenqi_fire=88000,zhenqi_earth=88000,jingmai_effect='jingmaidatong_01.pfx',},
		[29]={dwId=29,dwAttack=170,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=850,exp=0,zhenqi_metal=118000,zhenqi_wood=118000,zhenqi_water=0,zhenqi_fire=94400,zhenqi_earth=94400,jingmai_effect='jingmaidatong_01.pfx',},
		[30]={dwId=30,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=135,rate=820,exp=0,zhenqi_metal=126000,zhenqi_wood=126000,zhenqi_water=0,zhenqi_fire=100800,zhenqi_earth=100800,jingmai_effect='jingmaidatong_01.pfx',},
		[31]={dwId=31,dwAttack=280,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=790,exp=0,zhenqi_metal=134000,zhenqi_wood=134000,zhenqi_water=0,zhenqi_fire=107200,zhenqi_earth=107200,jingmai_effect='jingmaidatong_01.pfx',},
		[32]={dwId=32,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=160,rate=760,exp=0,zhenqi_metal=142000,zhenqi_wood=142000,zhenqi_water=0,zhenqi_fire=113600,zhenqi_earth=113600,jingmai_effect='jingmaidatong_01.pfx',},
		[33]={dwId=33,dwAttack=330,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=730,exp=0,zhenqi_metal=150000,zhenqi_wood=150000,zhenqi_water=0,zhenqi_fire=120000,zhenqi_earth=120000,jingmai_effect='jingmaidatong_01.pfx',},
		[34]={dwId=34,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=190,rate=700,exp=0,zhenqi_metal=160000,zhenqi_wood=160000,zhenqi_water=0,zhenqi_fire=128000,zhenqi_earth=128000,jingmai_effect='jingmaidatong_01.pfx',},
		[35]={dwId=35,dwAttack=430,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=670,exp=0,zhenqi_metal=170000,zhenqi_wood=170000,zhenqi_water=0,zhenqi_fire=136000,zhenqi_earth=136000,jingmai_effect='jingmaidatong_01.pfx',},
		[36]={dwId=36,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=225,rate=640,exp=0,zhenqi_metal=180000,zhenqi_wood=180000,zhenqi_water=0,zhenqi_fire=144000,zhenqi_earth=144000,jingmai_effect='jingmaidatong_01.pfx',},
		[37]={dwId=37,dwAttack=580,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=610,exp=0,zhenqi_metal=190000,zhenqi_wood=190000,zhenqi_water=0,zhenqi_fire=152000,zhenqi_earth=152000,jingmai_effect='jingmaidatong_01.pfx',},
		[38]={dwId=38,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=265,rate=580,exp=0,zhenqi_metal=200000,zhenqi_wood=200000,zhenqi_water=0,zhenqi_fire=160000,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[39]={dwId=39,dwAttack=780,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=550,exp=0,zhenqi_metal=200000,zhenqi_wood=200000,zhenqi_water=0,zhenqi_fire=160000,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[40]={dwId=40,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=370,rate=520,exp=0,zhenqi_metal=200000,zhenqi_wood=200000,zhenqi_water=0,zhenqi_fire=160000,zhenqi_earth=160000,jingmai_effect='jingmaidatong_02.pfx',},
		}
	},
	[3] = 
	{
		name = '阳跷脉',number=40,petype1 = '暴击',petype2 = '身法',patype1 = '暴击',patype2 = '0',dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=55,dwHPMax=0,dwMPMax=0,
		---经脉打通限制
		dwLevel = 22,		
		---经脉描述
		PulseDis = "督脉中的重要脉络，直接影响督脉的通畅",		
		Pulse = 
		{
		[1]={dwId=1,dwAttack=0,dwDefense=0,dwFlee=7,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=10000,exp=0,zhenqi_metal=800,zhenqi_wood=1000,zhenqi_water=1000,zhenqi_fire=0,zhenqi_earth=800,jingmai_effect='jingmaidatong_01.pfx',},
		[2]={dwId=2,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=26,dwMPMax=0,rate=9000,exp=0,zhenqi_metal=1200,zhenqi_wood=1500,zhenqi_water=1500,zhenqi_fire=0,zhenqi_earth=1200,jingmai_effect='jingmaidatong_01.pfx',},
		[3]={dwId=3,dwAttack=0,dwDefense=0,dwFlee=8,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=8000,exp=0,zhenqi_metal=1840,zhenqi_wood=2300,zhenqi_water=2300,zhenqi_fire=0,zhenqi_earth=1840,jingmai_effect='jingmaidatong_01.pfx',},
		[4]={dwId=4,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=30,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=2800,zhenqi_wood=3500,zhenqi_water=3500,zhenqi_fire=0,zhenqi_earth=2800,jingmai_effect='jingmaidatong_01.pfx',},
		[5]={dwId=5,dwAttack=0,dwDefense=0,dwFlee=10,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=4000,zhenqi_wood=5000,zhenqi_water=5000,zhenqi_fire=0,zhenqi_earth=4000,jingmai_effect='jingmaidatong_01.pfx',},
		[6]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=36,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=5440,zhenqi_wood=6800,zhenqi_water=6800,zhenqi_fire=0,zhenqi_earth=5440,jingmai_effect='jingmaidatong_01.pfx',},
		[7]={dwId=7,dwAttack=0,dwDefense=0,dwFlee=13,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=7040,zhenqi_wood=8800,zhenqi_water=8800,zhenqi_fire=0,zhenqi_earth=7040,jingmai_effect='jingmaidatong_01.pfx',},
		[8]={dwId=8,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=45,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=8800,zhenqi_wood=11000,zhenqi_water=11000,zhenqi_fire=0,zhenqi_earth=8800,jingmai_effect='jingmaidatong_01.pfx',},
		[9]={dwId=9,dwAttack=0,dwDefense=0,dwFlee=17,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=10560,zhenqi_wood=13200,zhenqi_water=13200,zhenqi_fire=0,zhenqi_earth=10560,jingmai_effect='jingmaidatong_01.pfx',},
		[10]={dwId=10,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=58,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=12400,zhenqi_wood=15500,zhenqi_water=15500,zhenqi_fire=0,zhenqi_earth=12400,jingmai_effect='jingmaidatong_01.pfx',},
		[11]={dwId=11,dwAttack=0,dwDefense=0,dwFlee=22,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=15360,zhenqi_wood=19200,zhenqi_water=19200,zhenqi_fire=0,zhenqi_earth=15360,jingmai_effect='jingmaidatong_01.pfx',},
		[12]={dwId=12,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=76,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=18800,zhenqi_wood=23500,zhenqi_water=23500,zhenqi_fire=0,zhenqi_earth=18800,jingmai_effect='jingmaidatong_01.pfx',},
		[13]={dwId=13,dwAttack=0,dwDefense=0,dwFlee=28,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=21200,zhenqi_wood=26500,zhenqi_water=26500,zhenqi_fire=0,zhenqi_earth=21200,jingmai_effect='jingmaidatong_01.pfx',},
		[14]={dwId=14,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=100,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=23840,zhenqi_wood=29800,zhenqi_water=29800,zhenqi_fire=0,zhenqi_earth=23840,jingmai_effect='jingmaidatong_01.pfx',},
		[15]={dwId=15,dwAttack=0,dwDefense=0,dwFlee=35,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=26640,zhenqi_wood=33300,zhenqi_water=33300,zhenqi_fire=0,zhenqi_earth=26640,jingmai_effect='jingmaidatong_01.pfx',},
		[16]={dwId=16,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=131,dwMPMax=0,rate=3000,exp=0,zhenqi_metal=30400,zhenqi_wood=38000,zhenqi_water=38000,zhenqi_fire=0,zhenqi_earth=30400,jingmai_effect='jingmaidatong_01.pfx',},
		[17]={dwId=17,dwAttack=0,dwDefense=0,dwFlee=43,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=34800,zhenqi_wood=43500,zhenqi_water=43500,zhenqi_fire=0,zhenqi_earth=34800,jingmai_effect='jingmaidatong_01.pfx',},
		[18]={dwId=18,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=170,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=39680,zhenqi_wood=49600,zhenqi_water=49600,zhenqi_fire=0,zhenqi_earth=39680,jingmai_effect='jingmaidatong_01.pfx',},
		[19]={dwId=19,dwAttack=0,dwDefense=0,dwFlee=52,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=44800,zhenqi_wood=56000,zhenqi_water=56000,zhenqi_fire=0,zhenqi_earth=44800,jingmai_effect='jingmaidatong_01.pfx',},
		[20]={dwId=20,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=218,dwMPMax=0,rate=2000,exp=0,zhenqi_metal=50000,zhenqi_wood=62500,zhenqi_water=62500,zhenqi_fire=0,zhenqi_earth=50000,jingmai_effect='jingmaidatong_01.pfx',},
		[21]={dwId=21,dwAttack=0,dwDefense=0,dwFlee=62,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=55200,zhenqi_wood=69000,zhenqi_water=69000,zhenqi_fire=0,zhenqi_earth=55200,jingmai_effect='jingmaidatong_01.pfx',},
		[22]={dwId=22,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=276,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=60000,zhenqi_wood=75000,zhenqi_water=75000,zhenqi_fire=0,zhenqi_earth=60000,jingmai_effect='jingmaidatong_01.pfx',},
		[23]={dwId=23,dwAttack=0,dwDefense=0,dwFlee=73,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=65200,zhenqi_wood=81500,zhenqi_water=81500,zhenqi_fire=0,zhenqi_earth=65200,jingmai_effect='jingmaidatong_01.pfx',},
		[24]={dwId=24,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=346,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=70400,zhenqi_wood=88000,zhenqi_water=88000,zhenqi_fire=0,zhenqi_earth=70400,jingmai_effect='jingmaidatong_01.pfx',},
		[25]={dwId=25,dwAttack=0,dwDefense=0,dwFlee=85,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=970,exp=0,zhenqi_metal=75200,zhenqi_wood=94000,zhenqi_water=94000,zhenqi_fire=0,zhenqi_earth=75200,jingmai_effect='jingmaidatong_01.pfx',},
		[26]={dwId=26,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=434,dwMPMax=0,rate=940,exp=0,zhenqi_metal=80000,zhenqi_wood=100000,zhenqi_water=100000,zhenqi_fire=0,zhenqi_earth=80000,jingmai_effect='jingmaidatong_01.pfx',},
		[27]={dwId=27,dwAttack=0,dwDefense=0,dwFlee=90,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=910,exp=0,zhenqi_metal=84000,zhenqi_wood=105000,zhenqi_water=105000,zhenqi_fire=0,zhenqi_earth=84000,jingmai_effect='jingmaidatong_01.pfx',},
		[28]={dwId=28,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=540,dwMPMax=0,rate=880,exp=0,zhenqi_metal=88000,zhenqi_wood=110000,zhenqi_water=110000,zhenqi_fire=0,zhenqi_earth=88000,jingmai_effect='jingmaidatong_01.pfx',},
		[29]={dwId=29,dwAttack=0,dwDefense=0,dwFlee=100,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=850,exp=0,zhenqi_metal=94400,zhenqi_wood=118000,zhenqi_water=118000,zhenqi_fire=0,zhenqi_earth=94400,jingmai_effect='jingmaidatong_01.pfx',},
		[30]={dwId=30,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=800,dwMPMax=0,rate=820,exp=0,zhenqi_metal=100800,zhenqi_wood=126000,zhenqi_water=126000,zhenqi_fire=0,zhenqi_earth=100800,jingmai_effect='jingmaidatong_01.pfx',},
		[31]={dwId=31,dwAttack=0,dwDefense=0,dwFlee=110,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=790,exp=0,zhenqi_metal=107200,zhenqi_wood=134000,zhenqi_water=134000,zhenqi_fire=0,zhenqi_earth=107200,jingmai_effect='jingmaidatong_01.pfx',},
		[32]={dwId=32,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1050,dwMPMax=0,rate=760,exp=0,zhenqi_metal=113600,zhenqi_wood=142000,zhenqi_water=142000,zhenqi_fire=0,zhenqi_earth=113600,jingmai_effect='jingmaidatong_01.pfx',},
		[33]={dwId=33,dwAttack=0,dwDefense=0,dwFlee=120,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=730,exp=0,zhenqi_metal=120000,zhenqi_wood=150000,zhenqi_water=150000,zhenqi_fire=0,zhenqi_earth=120000,jingmai_effect='jingmaidatong_01.pfx',},
		[34]={dwId=34,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1330,dwMPMax=0,rate=700,exp=0,zhenqi_metal=128000,zhenqi_wood=160000,zhenqi_water=160000,zhenqi_fire=0,zhenqi_earth=128000,jingmai_effect='jingmaidatong_01.pfx',},
		[35]={dwId=35,dwAttack=0,dwDefense=0,dwFlee=130,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=670,exp=0,zhenqi_metal=136000,zhenqi_wood=170000,zhenqi_water=170000,zhenqi_fire=0,zhenqi_earth=136000,jingmai_effect='jingmaidatong_01.pfx',},
		[36]={dwId=36,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1650,dwMPMax=0,rate=640,exp=0,zhenqi_metal=144000,zhenqi_wood=180000,zhenqi_water=180000,zhenqi_fire=0,zhenqi_earth=144000,jingmai_effect='jingmaidatong_01.pfx',},
		[37]={dwId=37,dwAttack=0,dwDefense=0,dwFlee=140,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=610,exp=0,zhenqi_metal=152000,zhenqi_wood=190000,zhenqi_water=190000,zhenqi_fire=0,zhenqi_earth=152000,jingmai_effect='jingmaidatong_01.pfx',},
		[38]={dwId=38,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=2020,dwMPMax=0,rate=580,exp=0,zhenqi_metal=160000,zhenqi_wood=200000,zhenqi_water=200000,zhenqi_fire=0,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[39]={dwId=39,dwAttack=0,dwDefense=0,dwFlee=150,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=550,exp=0,zhenqi_metal=160000,zhenqi_wood=200000,zhenqi_water=200000,zhenqi_fire=0,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[40]={dwId=40,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=2550,dwMPMax=0,rate=520,exp=0,zhenqi_metal=160000,zhenqi_wood=200000,zhenqi_water=200000,zhenqi_fire=0,zhenqi_earth=160000,jingmai_effect='jingmaidatong_02.pfx',},
		}
	},
	[4] = 
	{
		name = '阴跷脉',number=40,petype1 = '攻击',petype2 = '0',patype1 = '攻击',patype2 = '0',dwAttack=100,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,
		---经脉打通限制
		dwLevel = 26,		
		---经脉描述
		PulseDis = "任脉中的重要脉络，直接影响任脉的通畅",		
		Pulse = 
		{
		[1]={dwId=1,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=3,dwHPMax=0,dwMPMax=0,rate=10000,exp=0,zhenqi_metal=1000,zhenqi_wood=0,zhenqi_water=800,zhenqi_fire=1000,zhenqi_earth=800,jingmai_effect='jingmaidatong_01.pfx',},
		[2]={dwId=2,dwAttack=10,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=9000,exp=0,zhenqi_metal=1500,zhenqi_wood=0,zhenqi_water=1200,zhenqi_fire=1500,zhenqi_earth=1200,jingmai_effect='jingmaidatong_01.pfx',},
		[3]={dwId=3,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=5,dwHPMax=0,dwMPMax=0,rate=8000,exp=0,zhenqi_metal=2300,zhenqi_wood=0,zhenqi_water=1840,zhenqi_fire=2300,zhenqi_earth=1840,jingmai_effect='jingmaidatong_01.pfx',},
		[4]={dwId=4,dwAttack=12,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=3500,zhenqi_wood=0,zhenqi_water=2800,zhenqi_fire=3500,zhenqi_earth=2800,jingmai_effect='jingmaidatong_01.pfx',},
		[5]={dwId=5,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=7,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=5000,zhenqi_wood=0,zhenqi_water=4000,zhenqi_fire=5000,zhenqi_earth=4000,jingmai_effect='jingmaidatong_01.pfx',},
		[6]={dwId=6,dwAttack=14,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=6800,zhenqi_wood=0,zhenqi_water=5440,zhenqi_fire=6800,zhenqi_earth=5440,jingmai_effect='jingmaidatong_01.pfx',},
		[7]={dwId=7,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=10,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=8800,zhenqi_wood=0,zhenqi_water=7040,zhenqi_fire=8800,zhenqi_earth=7040,jingmai_effect='jingmaidatong_01.pfx',},
		[8]={dwId=8,dwAttack=17,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=11000,zhenqi_wood=0,zhenqi_water=8800,zhenqi_fire=11000,zhenqi_earth=8800,jingmai_effect='jingmaidatong_01.pfx',},
		[9]={dwId=9,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=14,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=13200,zhenqi_wood=0,zhenqi_water=10560,zhenqi_fire=13200,zhenqi_earth=10560,jingmai_effect='jingmaidatong_01.pfx',},
		[10]={dwId=10,dwAttack=20,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=15500,zhenqi_wood=0,zhenqi_water=12400,zhenqi_fire=15500,zhenqi_earth=12400,jingmai_effect='jingmaidatong_01.pfx',},
		[11]={dwId=11,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=18,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=19200,zhenqi_wood=0,zhenqi_water=15360,zhenqi_fire=19200,zhenqi_earth=15360,jingmai_effect='jingmaidatong_01.pfx',},
		[12]={dwId=12,dwAttack=24,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=23500,zhenqi_wood=0,zhenqi_water=18800,zhenqi_fire=23500,zhenqi_earth=18800,jingmai_effect='jingmaidatong_01.pfx',},
		[13]={dwId=13,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=23,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=26500,zhenqi_wood=0,zhenqi_water=21200,zhenqi_fire=26500,zhenqi_earth=21200,jingmai_effect='jingmaidatong_01.pfx',},
		[14]={dwId=14,dwAttack=28,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=29800,zhenqi_wood=0,zhenqi_water=23840,zhenqi_fire=29800,zhenqi_earth=23840,jingmai_effect='jingmaidatong_01.pfx',},
		[15]={dwId=15,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=29,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=33300,zhenqi_wood=0,zhenqi_water=26640,zhenqi_fire=33300,zhenqi_earth=26640,jingmai_effect='jingmaidatong_01.pfx',},
		[16]={dwId=16,dwAttack=33,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=3000,exp=0,zhenqi_metal=38000,zhenqi_wood=0,zhenqi_water=30400,zhenqi_fire=38000,zhenqi_earth=30400,jingmai_effect='jingmaidatong_01.pfx',},
		[17]={dwId=17,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=36,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=43500,zhenqi_wood=0,zhenqi_water=34800,zhenqi_fire=43500,zhenqi_earth=34800,jingmai_effect='jingmaidatong_01.pfx',},
		[18]={dwId=18,dwAttack=38,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=49600,zhenqi_wood=0,zhenqi_water=39680,zhenqi_fire=49600,zhenqi_earth=39680,jingmai_effect='jingmaidatong_01.pfx',},
		[19]={dwId=19,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=44,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=56000,zhenqi_wood=0,zhenqi_water=44800,zhenqi_fire=56000,zhenqi_earth=44800,jingmai_effect='jingmaidatong_01.pfx',},
		[20]={dwId=20,dwAttack=45,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2000,exp=0,zhenqi_metal=62500,zhenqi_wood=0,zhenqi_water=50000,zhenqi_fire=62500,zhenqi_earth=50000,jingmai_effect='jingmaidatong_01.pfx',},
		[21]={dwId=21,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=53,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=69000,zhenqi_wood=0,zhenqi_water=55200,zhenqi_fire=69000,zhenqi_earth=55200,jingmai_effect='jingmaidatong_01.pfx',},
		[22]={dwId=22,dwAttack=55,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=75000,zhenqi_wood=0,zhenqi_water=60000,zhenqi_fire=75000,zhenqi_earth=60000,jingmai_effect='jingmaidatong_01.pfx',},
		[23]={dwId=23,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=63,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=81500,zhenqi_wood=0,zhenqi_water=65200,zhenqi_fire=81500,zhenqi_earth=65200,jingmai_effect='jingmaidatong_01.pfx',},
		[24]={dwId=24,dwAttack=69,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=88000,zhenqi_wood=0,zhenqi_water=70400,zhenqi_fire=88000,zhenqi_earth=70400,jingmai_effect='jingmaidatong_01.pfx',},
		[25]={dwId=25,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=80,dwHPMax=0,dwMPMax=0,rate=970,exp=0,zhenqi_metal=94000,zhenqi_wood=0,zhenqi_water=75200,zhenqi_fire=94000,zhenqi_earth=75200,jingmai_effect='jingmaidatong_01.pfx',},
		[26]={dwId=26,dwAttack=100,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=940,exp=0,zhenqi_metal=100000,zhenqi_wood=0,zhenqi_water=80000,zhenqi_fire=100000,zhenqi_earth=80000,jingmai_effect='jingmaidatong_01.pfx',},
		[27]={dwId=27,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=90,dwHPMax=0,dwMPMax=0,rate=910,exp=0,zhenqi_metal=105000,zhenqi_wood=0,zhenqi_water=84000,zhenqi_fire=105000,zhenqi_earth=84000,jingmai_effect='jingmaidatong_01.pfx',},
		[28]={dwId=28,dwAttack=140,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=880,exp=0,zhenqi_metal=110000,zhenqi_wood=0,zhenqi_water=88000,zhenqi_fire=110000,zhenqi_earth=88000,jingmai_effect='jingmaidatong_01.pfx',},
		[29]={dwId=29,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=100,dwHPMax=0,dwMPMax=0,rate=850,exp=0,zhenqi_metal=118000,zhenqi_wood=0,zhenqi_water=94400,zhenqi_fire=118000,zhenqi_earth=94400,jingmai_effect='jingmaidatong_01.pfx',},
		[30]={dwId=30,dwAttack=190,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=820,exp=0,zhenqi_metal=126000,zhenqi_wood=0,zhenqi_water=100800,zhenqi_fire=126000,zhenqi_earth=100800,jingmai_effect='jingmaidatong_01.pfx',},
		[31]={dwId=31,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=110,dwHPMax=0,dwMPMax=0,rate=790,exp=0,zhenqi_metal=134000,zhenqi_wood=0,zhenqi_water=107200,zhenqi_fire=134000,zhenqi_earth=107200,jingmai_effect='jingmaidatong_01.pfx',},
		[32]={dwId=32,dwAttack=250,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=760,exp=0,zhenqi_metal=142000,zhenqi_wood=0,zhenqi_water=113600,zhenqi_fire=142000,zhenqi_earth=113600,jingmai_effect='jingmaidatong_01.pfx',},
		[33]={dwId=33,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=120,dwHPMax=0,dwMPMax=0,rate=730,exp=0,zhenqi_metal=150000,zhenqi_wood=0,zhenqi_water=120000,zhenqi_fire=150000,zhenqi_earth=120000,jingmai_effect='jingmaidatong_01.pfx',},
		[34]={dwId=34,dwAttack=320,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=700,exp=0,zhenqi_metal=160000,zhenqi_wood=0,zhenqi_water=128000,zhenqi_fire=160000,zhenqi_earth=128000,jingmai_effect='jingmaidatong_01.pfx',},
		[35]={dwId=35,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=130,dwHPMax=0,dwMPMax=0,rate=670,exp=0,zhenqi_metal=170000,zhenqi_wood=0,zhenqi_water=136000,zhenqi_fire=170000,zhenqi_earth=136000,jingmai_effect='jingmaidatong_01.pfx',},
		[36]={dwId=36,dwAttack=400,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=640,exp=0,zhenqi_metal=180000,zhenqi_wood=0,zhenqi_water=144000,zhenqi_fire=180000,zhenqi_earth=144000,jingmai_effect='jingmaidatong_01.pfx',},
		[37]={dwId=37,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=140,dwHPMax=0,dwMPMax=0,rate=610,exp=0,zhenqi_metal=190000,zhenqi_wood=0,zhenqi_water=152000,zhenqi_fire=190000,zhenqi_earth=152000,jingmai_effect='jingmaidatong_01.pfx',},
		[38]={dwId=38,dwAttack=490,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=580,exp=0,zhenqi_metal=200000,zhenqi_wood=0,zhenqi_water=160000,zhenqi_fire=200000,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[39]={dwId=39,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=150,dwHPMax=0,dwMPMax=0,rate=550,exp=0,zhenqi_metal=200000,zhenqi_wood=0,zhenqi_water=160000,zhenqi_fire=200000,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[40]={dwId=40,dwAttack=600,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=520,exp=0,zhenqi_metal=200000,zhenqi_wood=0,zhenqi_water=160000,zhenqi_fire=200000,zhenqi_earth=160000,jingmai_effect='jingmaidatong_02.pfx',},
		}
	},
	[5] = 
	{
		name = '带脉',number=40,petype1 = '身法',petype2 = '暴击',patype1 = '身法',patype2 = '0',dwAttack=0,dwDefense=0,dwFlee=145,dwCrit=0,dwHPMax=0,dwMPMax=0,
		---经脉打通限制
		dwLevel = 16,		
		---经脉描述
		PulseDis = "如腰带能约束纵行的诸脉，故称“束带”",		
		Pulse = 
		{
		[1]={dwId=1,dwAttack=0,dwDefense=0,dwFlee=6,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=10000,exp=0,zhenqi_metal=800,zhenqi_wood=800,zhenqi_water=1000,zhenqi_fire=800,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[2]={dwId=2,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=5,dwHPMax=0,dwMPMax=0,rate=9000,exp=0,zhenqi_metal=1200,zhenqi_wood=1200,zhenqi_water=1500,zhenqi_fire=1200,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[3]={dwId=3,dwAttack=0,dwDefense=0,dwFlee=8,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=8000,exp=0,zhenqi_metal=1840,zhenqi_wood=1840,zhenqi_water=2300,zhenqi_fire=1840,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[4]={dwId=4,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=6,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=2800,zhenqi_wood=2800,zhenqi_water=3500,zhenqi_fire=2800,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[5]={dwId=5,dwAttack=0,dwDefense=0,dwFlee=11,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=4000,zhenqi_wood=4000,zhenqi_water=5000,zhenqi_fire=4000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[6]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=7,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=5440,zhenqi_wood=5440,zhenqi_water=6800,zhenqi_fire=5440,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[7]={dwId=7,dwAttack=0,dwDefense=0,dwFlee=15,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=7040,zhenqi_wood=7040,zhenqi_water=8800,zhenqi_fire=7040,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[8]={dwId=8,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=9,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=8800,zhenqi_wood=8800,zhenqi_water=11000,zhenqi_fire=8800,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[9]={dwId=9,dwAttack=0,dwDefense=0,dwFlee=20,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=10560,zhenqi_wood=10560,zhenqi_water=13200,zhenqi_fire=10560,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[10]={dwId=10,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=11,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=12400,zhenqi_wood=12400,zhenqi_water=15500,zhenqi_fire=12400,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[11]={dwId=11,dwAttack=0,dwDefense=0,dwFlee=26,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=15360,zhenqi_wood=15360,zhenqi_water=19200,zhenqi_fire=15360,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[12]={dwId=12,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=14,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=18800,zhenqi_wood=18800,zhenqi_water=23500,zhenqi_fire=18800,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[13]={dwId=13,dwAttack=0,dwDefense=0,dwFlee=33,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=21200,zhenqi_wood=21200,zhenqi_water=26500,zhenqi_fire=21200,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[14]={dwId=14,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=18,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=23840,zhenqi_wood=23840,zhenqi_water=29800,zhenqi_fire=23840,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[15]={dwId=15,dwAttack=0,dwDefense=0,dwFlee=41,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=26640,zhenqi_wood=26640,zhenqi_water=33300,zhenqi_fire=26640,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[16]={dwId=16,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=23,dwHPMax=0,dwMPMax=0,rate=3000,exp=0,zhenqi_metal=30400,zhenqi_wood=30400,zhenqi_water=38000,zhenqi_fire=30400,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[17]={dwId=17,dwAttack=0,dwDefense=0,dwFlee=50,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=34800,zhenqi_wood=34800,zhenqi_water=43500,zhenqi_fire=34800,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[18]={dwId=18,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=28,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=39680,zhenqi_wood=39680,zhenqi_water=49600,zhenqi_fire=39680,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[19]={dwId=19,dwAttack=0,dwDefense=0,dwFlee=60,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=44800,zhenqi_wood=44800,zhenqi_water=56000,zhenqi_fire=44800,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[20]={dwId=20,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=34,dwHPMax=0,dwMPMax=0,rate=2000,exp=0,zhenqi_metal=50000,zhenqi_wood=50000,zhenqi_water=62500,zhenqi_fire=50000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[21]={dwId=21,dwAttack=0,dwDefense=0,dwFlee=71,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=55200,zhenqi_wood=55200,zhenqi_water=69000,zhenqi_fire=55200,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[22]={dwId=22,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=41,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=60000,zhenqi_wood=60000,zhenqi_water=75000,zhenqi_fire=60000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[23]={dwId=23,dwAttack=0,dwDefense=0,dwFlee=83,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=65200,zhenqi_wood=65200,zhenqi_water=81500,zhenqi_fire=65200,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[24]={dwId=24,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=49,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=70400,zhenqi_wood=70400,zhenqi_water=88000,zhenqi_fire=70400,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[25]={dwId=25,dwAttack=0,dwDefense=0,dwFlee=100,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=970,exp=0,zhenqi_metal=75200,zhenqi_wood=75200,zhenqi_water=94000,zhenqi_fire=75200,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[26]={dwId=26,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=60,dwHPMax=0,dwMPMax=0,rate=940,exp=0,zhenqi_metal=80000,zhenqi_wood=80000,zhenqi_water=100000,zhenqi_fire=80000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[27]={dwId=27,dwAttack=0,dwDefense=0,dwFlee=105,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=910,exp=0,zhenqi_metal=84000,zhenqi_wood=84000,zhenqi_water=105000,zhenqi_fire=84000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[28]={dwId=28,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=65,dwHPMax=0,dwMPMax=0,rate=880,exp=0,zhenqi_metal=88000,zhenqi_wood=88000,zhenqi_water=110000,zhenqi_fire=88000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[29]={dwId=29,dwAttack=0,dwDefense=0,dwFlee=110,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=850,exp=0,zhenqi_metal=94400,zhenqi_wood=94400,zhenqi_water=118000,zhenqi_fire=94400,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[30]={dwId=30,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=70,dwHPMax=0,dwMPMax=0,rate=820,exp=0,zhenqi_metal=100800,zhenqi_wood=100800,zhenqi_water=126000,zhenqi_fire=100800,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[31]={dwId=31,dwAttack=0,dwDefense=0,dwFlee=115,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=790,exp=0,zhenqi_metal=107200,zhenqi_wood=107200,zhenqi_water=134000,zhenqi_fire=107200,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[32]={dwId=32,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=75,dwHPMax=0,dwMPMax=0,rate=760,exp=0,zhenqi_metal=113600,zhenqi_wood=113600,zhenqi_water=142000,zhenqi_fire=113600,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[33]={dwId=33,dwAttack=0,dwDefense=0,dwFlee=120,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=730,exp=0,zhenqi_metal=120000,zhenqi_wood=120000,zhenqi_water=150000,zhenqi_fire=120000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[34]={dwId=34,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=80,dwHPMax=0,dwMPMax=0,rate=700,exp=0,zhenqi_metal=128000,zhenqi_wood=128000,zhenqi_water=160000,zhenqi_fire=128000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[35]={dwId=35,dwAttack=0,dwDefense=0,dwFlee=125,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=670,exp=0,zhenqi_metal=136000,zhenqi_wood=136000,zhenqi_water=170000,zhenqi_fire=136000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[36]={dwId=36,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=85,dwHPMax=0,dwMPMax=0,rate=640,exp=0,zhenqi_metal=144000,zhenqi_wood=144000,zhenqi_water=180000,zhenqi_fire=144000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[37]={dwId=37,dwAttack=0,dwDefense=0,dwFlee=130,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=610,exp=0,zhenqi_metal=152000,zhenqi_wood=152000,zhenqi_water=190000,zhenqi_fire=152000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[38]={dwId=38,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=90,dwHPMax=0,dwMPMax=0,rate=580,exp=0,zhenqi_metal=160000,zhenqi_wood=160000,zhenqi_water=200000,zhenqi_fire=160000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[39]={dwId=39,dwAttack=0,dwDefense=0,dwFlee=150,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=550,exp=0,zhenqi_metal=160000,zhenqi_wood=160000,zhenqi_water=200000,zhenqi_fire=160000,zhenqi_earth=0,jingmai_effect='jingmaidatong_01.pfx',},
		[40]={dwId=40,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=120,dwHPMax=0,dwMPMax=0,rate=520,exp=0,zhenqi_metal=160000,zhenqi_wood=160000,zhenqi_water=200000,zhenqi_fire=160000,zhenqi_earth=0,jingmai_effect='jingmaidatong_02.pfx',},
		}
	},
	[6] = 
	{
		name = '冲脉',number=40,petype1 = '生命',petype2 = '内力',patype1 = '内力',patype2 = '0',dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=115,
		---经脉打通限制
		dwLevel = 12,		
		---经脉描述
		PulseDis = "能调节十二经气血，故称“血海”",		
		Pulse = 
		{
		[1]={dwId=1,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=20,dwMPMax=0,rate=10000,exp=0,zhenqi_metal=0,zhenqi_wood=1000,zhenqi_water=800,zhenqi_fire=800,zhenqi_earth=800,jingmai_effect='jingmaidatong_01.pfx',},
		[2]={dwId=2,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=25,dwMPMax=0,rate=9000,exp=0,zhenqi_metal=0,zhenqi_wood=1500,zhenqi_water=1200,zhenqi_fire=1200,zhenqi_earth=1200,jingmai_effect='jingmaidatong_01.pfx',},
		[3]={dwId=3,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=30,dwMPMax=0,rate=8000,exp=0,zhenqi_metal=0,zhenqi_wood=2300,zhenqi_water=1840,zhenqi_fire=1840,zhenqi_earth=1840,jingmai_effect='jingmaidatong_01.pfx',},
		[4]={dwId=4,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=35,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=0,zhenqi_wood=3500,zhenqi_water=2800,zhenqi_fire=2800,zhenqi_earth=2800,jingmai_effect='jingmaidatong_01.pfx',},
		[5]={dwId=5,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=36,rate=7000,exp=0,zhenqi_metal=0,zhenqi_wood=5000,zhenqi_water=4000,zhenqi_fire=4000,zhenqi_earth=4000,jingmai_effect='jingmaidatong_01.pfx',},
		[6]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=42,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=0,zhenqi_wood=6800,zhenqi_water=5440,zhenqi_fire=5440,zhenqi_earth=5440,jingmai_effect='jingmaidatong_01.pfx',},
		[7]={dwId=7,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=49,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=0,zhenqi_wood=8800,zhenqi_water=7040,zhenqi_fire=7040,zhenqi_earth=7040,jingmai_effect='jingmaidatong_01.pfx',},
		[8]={dwId=8,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=56,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=0,zhenqi_wood=11000,zhenqi_water=8800,zhenqi_fire=8800,zhenqi_earth=8800,jingmai_effect='jingmaidatong_01.pfx',},
		[9]={dwId=9,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=63,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=0,zhenqi_wood=13200,zhenqi_water=10560,zhenqi_fire=10560,zhenqi_earth=10560,jingmai_effect='jingmaidatong_01.pfx',},
		[10]={dwId=10,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=70,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=0,zhenqi_wood=15500,zhenqi_water=12400,zhenqi_fire=12400,zhenqi_earth=12400,jingmai_effect='jingmaidatong_01.pfx',},
		[11]={dwId=11,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=76,rate=6000,exp=0,zhenqi_metal=0,zhenqi_wood=19200,zhenqi_water=15360,zhenqi_fire=15360,zhenqi_earth=15360,jingmai_effect='jingmaidatong_01.pfx',},
		[12]={dwId=12,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=80,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=0,zhenqi_wood=23500,zhenqi_water=18800,zhenqi_fire=18800,zhenqi_earth=18800,jingmai_effect='jingmaidatong_01.pfx',},
		[13]={dwId=13,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=90,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=0,zhenqi_wood=26500,zhenqi_water=21200,zhenqi_fire=21200,zhenqi_earth=21200,jingmai_effect='jingmaidatong_01.pfx',},
		[14]={dwId=14,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=100,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=0,zhenqi_wood=29800,zhenqi_water=23840,zhenqi_fire=23840,zhenqi_earth=23840,jingmai_effect='jingmaidatong_01.pfx',},
		[15]={dwId=15,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=110,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=0,zhenqi_wood=33300,zhenqi_water=26640,zhenqi_fire=26640,zhenqi_earth=26640,jingmai_effect='jingmaidatong_01.pfx',},
		[16]={dwId=16,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=120,dwMPMax=0,rate=3000,exp=0,zhenqi_metal=0,zhenqi_wood=38000,zhenqi_water=30400,zhenqi_fire=30400,zhenqi_earth=30400,jingmai_effect='jingmaidatong_01.pfx',},
		[17]={dwId=17,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=122,rate=2500,exp=0,zhenqi_metal=0,zhenqi_wood=43500,zhenqi_water=34800,zhenqi_fire=34800,zhenqi_earth=34800,jingmai_effect='jingmaidatong_01.pfx',},
		[18]={dwId=18,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=134,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=0,zhenqi_wood=49600,zhenqi_water=39680,zhenqi_fire=39680,zhenqi_earth=39680,jingmai_effect='jingmaidatong_01.pfx',},
		[19]={dwId=19,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=148,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=0,zhenqi_wood=56000,zhenqi_water=44800,zhenqi_fire=44800,zhenqi_earth=44800,jingmai_effect='jingmaidatong_01.pfx',},
		[20]={dwId=20,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=168,dwMPMax=0,rate=2000,exp=0,zhenqi_metal=0,zhenqi_wood=62500,zhenqi_water=50000,zhenqi_fire=50000,zhenqi_earth=50000,jingmai_effect='jingmaidatong_01.pfx',},
		[21]={dwId=21,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=195,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=0,zhenqi_wood=69000,zhenqi_water=55200,zhenqi_fire=55200,zhenqi_earth=55200,jingmai_effect='jingmaidatong_01.pfx',},
		[22]={dwId=22,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=232,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=0,zhenqi_wood=75000,zhenqi_water=60000,zhenqi_fire=60000,zhenqi_earth=60000,jingmai_effect='jingmaidatong_01.pfx',},
		[23]={dwId=23,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=178,rate=1000,exp=0,zhenqi_metal=0,zhenqi_wood=81500,zhenqi_water=65200,zhenqi_fire=65200,zhenqi_earth=65200,jingmai_effect='jingmaidatong_01.pfx',},
		[24]={dwId=24,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=281,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=0,zhenqi_wood=88000,zhenqi_water=70400,zhenqi_fire=70400,zhenqi_earth=70400,jingmai_effect='jingmaidatong_01.pfx',},
		[25]={dwId=25,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=340,dwMPMax=0,rate=970,exp=0,zhenqi_metal=0,zhenqi_wood=94000,zhenqi_water=75200,zhenqi_fire=75200,zhenqi_earth=75200,jingmai_effect='jingmaidatong_01.pfx',},
		[26]={dwId=26,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=410,dwMPMax=0,rate=940,exp=0,zhenqi_metal=0,zhenqi_wood=100000,zhenqi_water=80000,zhenqi_fire=80000,zhenqi_earth=80000,jingmai_effect='jingmaidatong_01.pfx',},
		[27]={dwId=27,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=495,dwMPMax=0,rate=910,exp=0,zhenqi_metal=0,zhenqi_wood=105000,zhenqi_water=84000,zhenqi_fire=84000,zhenqi_earth=84000,jingmai_effect='jingmaidatong_01.pfx',},
		[28]={dwId=28,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=600,dwMPMax=0,rate=880,exp=0,zhenqi_metal=0,zhenqi_wood=110000,zhenqi_water=88000,zhenqi_fire=88000,zhenqi_earth=88000,jingmai_effect='jingmaidatong_01.pfx',},
		[29]={dwId=29,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=420,rate=850,exp=0,zhenqi_metal=0,zhenqi_wood=118000,zhenqi_water=94400,zhenqi_fire=94400,zhenqi_earth=94400,jingmai_effect='jingmaidatong_01.pfx',},
		[30]={dwId=30,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=880,dwMPMax=0,rate=820,exp=0,zhenqi_metal=0,zhenqi_wood=126000,zhenqi_water=100800,zhenqi_fire=100800,zhenqi_earth=100800,jingmai_effect='jingmaidatong_01.pfx',},
		[31]={dwId=31,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=980,dwMPMax=0,rate=790,exp=0,zhenqi_metal=0,zhenqi_wood=134000,zhenqi_water=107200,zhenqi_fire=107200,zhenqi_earth=107200,jingmai_effect='jingmaidatong_01.pfx',},
		[32]={dwId=32,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1080,dwMPMax=0,rate=760,exp=0,zhenqi_metal=0,zhenqi_wood=142000,zhenqi_water=113600,zhenqi_fire=113600,zhenqi_earth=113600,jingmai_effect='jingmaidatong_01.pfx',},
		[33]={dwId=33,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1200,dwMPMax=0,rate=730,exp=0,zhenqi_metal=0,zhenqi_wood=150000,zhenqi_water=120000,zhenqi_fire=120000,zhenqi_earth=120000,jingmai_effect='jingmaidatong_01.pfx',},
		[34]={dwId=34,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1320,dwMPMax=0,rate=700,exp=0,zhenqi_metal=0,zhenqi_wood=160000,zhenqi_water=128000,zhenqi_fire=128000,zhenqi_earth=128000,jingmai_effect='jingmaidatong_01.pfx',},
		[35]={dwId=35,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=1000,rate=670,exp=0,zhenqi_metal=0,zhenqi_wood=170000,zhenqi_water=136000,zhenqi_fire=136000,zhenqi_earth=136000,jingmai_effect='jingmaidatong_01.pfx',},
		[36]={dwId=36,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1460,dwMPMax=0,rate=640,exp=0,zhenqi_metal=0,zhenqi_wood=180000,zhenqi_water=144000,zhenqi_fire=144000,zhenqi_earth=144000,jingmai_effect='jingmaidatong_01.pfx',},
		[37]={dwId=37,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1600,dwMPMax=0,rate=610,exp=0,zhenqi_metal=0,zhenqi_wood=190000,zhenqi_water=152000,zhenqi_fire=152000,zhenqi_earth=152000,jingmai_effect='jingmaidatong_01.pfx',},
		[38]={dwId=38,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1760,dwMPMax=0,rate=580,exp=0,zhenqi_metal=0,zhenqi_wood=200000,zhenqi_water=160000,zhenqi_fire=160000,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[39]={dwId=39,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1920,dwMPMax=0,rate=550,exp=0,zhenqi_metal=0,zhenqi_wood=200000,zhenqi_water=160000,zhenqi_fire=160000,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[40]={dwId=40,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=2125,dwMPMax=0,rate=520,exp=0,zhenqi_metal=0,zhenqi_wood=200000,zhenqi_water=160000,zhenqi_fire=160000,zhenqi_earth=160000,jingmai_effect='jingmaidatong_02.pfx',},
		}
	},
	[7] = 
	{
		name = '任脉',number=40,petype1 = '防御',petype2 = '0',patype1 = '防御',patype2 = '0',dwAttack=0,dwDefense=80,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,
		---经脉打通限制
		dwLevel = 20,		
		---经脉描述
		PulseDis = "能总任一身之阴经，故称“阴脉之海”",
		Pulse = 
		{
		[1]={dwId=1,dwAttack=0,dwDefense=6,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=10000,exp=0,zhenqi_metal=800,zhenqi_wood=0,zhenqi_water=800,zhenqi_fire=800,zhenqi_earth=1000,jingmai_effect='jingmaidatong_01.pfx',},
		[2]={dwId=2,dwAttack=0,dwDefense=8,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=9000,exp=0,zhenqi_metal=1200,zhenqi_wood=0,zhenqi_water=1200,zhenqi_fire=1200,zhenqi_earth=1500,jingmai_effect='jingmaidatong_01.pfx',},
		[3]={dwId=3,dwAttack=0,dwDefense=9,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=8000,exp=0,zhenqi_metal=1840,zhenqi_wood=0,zhenqi_water=1840,zhenqi_fire=1840,zhenqi_earth=2300,jingmai_effect='jingmaidatong_01.pfx',},
		[4]={dwId=4,dwAttack=0,dwDefense=10,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=2800,zhenqi_wood=0,zhenqi_water=2800,zhenqi_fire=2800,zhenqi_earth=3500,jingmai_effect='jingmaidatong_01.pfx',},
		[5]={dwId=5,dwAttack=0,dwDefense=11,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=4000,zhenqi_wood=0,zhenqi_water=4000,zhenqi_fire=4000,zhenqi_earth=5000,jingmai_effect='jingmaidatong_01.pfx',},
		[6]={dwId=6,dwAttack=0,dwDefense=12,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=5440,zhenqi_wood=0,zhenqi_water=5440,zhenqi_fire=5440,zhenqi_earth=6800,jingmai_effect='jingmaidatong_01.pfx',},
		[7]={dwId=7,dwAttack=0,dwDefense=14,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=7040,zhenqi_wood=0,zhenqi_water=7040,zhenqi_fire=7040,zhenqi_earth=8800,jingmai_effect='jingmaidatong_01.pfx',},
		[8]={dwId=8,dwAttack=0,dwDefense=15,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=8800,zhenqi_wood=0,zhenqi_water=8800,zhenqi_fire=8800,zhenqi_earth=11000,jingmai_effect='jingmaidatong_01.pfx',},
		[9]={dwId=9,dwAttack=0,dwDefense=16,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=10560,zhenqi_wood=0,zhenqi_water=10560,zhenqi_fire=10560,zhenqi_earth=13200,jingmai_effect='jingmaidatong_01.pfx',},
		[10]={dwId=10,dwAttack=0,dwDefense=18,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=12400,zhenqi_wood=0,zhenqi_water=12400,zhenqi_fire=12400,zhenqi_earth=15500,jingmai_effect='jingmaidatong_01.pfx',},
		[11]={dwId=11,dwAttack=0,dwDefense=19,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=15360,zhenqi_wood=0,zhenqi_water=15360,zhenqi_fire=15360,zhenqi_earth=19200,jingmai_effect='jingmaidatong_01.pfx',},
		[12]={dwId=12,dwAttack=0,dwDefense=20,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=18800,zhenqi_wood=0,zhenqi_water=18800,zhenqi_fire=18800,zhenqi_earth=23500,jingmai_effect='jingmaidatong_01.pfx',},
		[13]={dwId=13,dwAttack=0,dwDefense=22,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=21200,zhenqi_wood=0,zhenqi_water=21200,zhenqi_fire=21200,zhenqi_earth=26500,jingmai_effect='jingmaidatong_01.pfx',},
		[14]={dwId=14,dwAttack=0,dwDefense=23,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=23840,zhenqi_wood=0,zhenqi_water=23840,zhenqi_fire=23840,zhenqi_earth=29800,jingmai_effect='jingmaidatong_01.pfx',},
		[15]={dwId=15,dwAttack=0,dwDefense=24,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=26640,zhenqi_wood=0,zhenqi_water=26640,zhenqi_fire=26640,zhenqi_earth=33300,jingmai_effect='jingmaidatong_01.pfx',},
		[16]={dwId=16,dwAttack=0,dwDefense=26,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=3000,exp=0,zhenqi_metal=30400,zhenqi_wood=0,zhenqi_water=30400,zhenqi_fire=30400,zhenqi_earth=38000,jingmai_effect='jingmaidatong_01.pfx',},
		[17]={dwId=17,dwAttack=0,dwDefense=27,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=34800,zhenqi_wood=0,zhenqi_water=34800,zhenqi_fire=34800,zhenqi_earth=43500,jingmai_effect='jingmaidatong_01.pfx',},
		[18]={dwId=18,dwAttack=0,dwDefense=28,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=39680,zhenqi_wood=0,zhenqi_water=39680,zhenqi_fire=39680,zhenqi_earth=49600,jingmai_effect='jingmaidatong_01.pfx',},
		[19]={dwId=19,dwAttack=0,dwDefense=30,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=44800,zhenqi_wood=0,zhenqi_water=44800,zhenqi_fire=44800,zhenqi_earth=56000,jingmai_effect='jingmaidatong_01.pfx',},
		[20]={dwId=20,dwAttack=0,dwDefense=32,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2000,exp=0,zhenqi_metal=50000,zhenqi_wood=0,zhenqi_water=50000,zhenqi_fire=50000,zhenqi_earth=62500,jingmai_effect='jingmaidatong_01.pfx',},
		[21]={dwId=21,dwAttack=0,dwDefense=35,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=55200,zhenqi_wood=0,zhenqi_water=55200,zhenqi_fire=55200,zhenqi_earth=69000,jingmai_effect='jingmaidatong_01.pfx',},
		[22]={dwId=22,dwAttack=0,dwDefense=40,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=60000,zhenqi_wood=0,zhenqi_water=60000,zhenqi_fire=60000,zhenqi_earth=75000,jingmai_effect='jingmaidatong_01.pfx',},
		[23]={dwId=23,dwAttack=0,dwDefense=48,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=65200,zhenqi_wood=0,zhenqi_water=65200,zhenqi_fire=65200,zhenqi_earth=81500,jingmai_effect='jingmaidatong_01.pfx',},
		[24]={dwId=24,dwAttack=0,dwDefense=60,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=70400,zhenqi_wood=0,zhenqi_water=70400,zhenqi_fire=70400,zhenqi_earth=88000,jingmai_effect='jingmaidatong_01.pfx',},
		[25]={dwId=25,dwAttack=0,dwDefense=80,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=970,exp=0,zhenqi_metal=75200,zhenqi_wood=0,zhenqi_water=75200,zhenqi_fire=75200,zhenqi_earth=94000,jingmai_effect='jingmaidatong_01.pfx',},
		[26]={dwId=26,dwAttack=0,dwDefense=100,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=940,exp=0,zhenqi_metal=80000,zhenqi_wood=0,zhenqi_water=80000,zhenqi_fire=80000,zhenqi_earth=100000,jingmai_effect='jingmaidatong_01.pfx',},
		[27]={dwId=27,dwAttack=0,dwDefense=122,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=910,exp=0,zhenqi_metal=84000,zhenqi_wood=0,zhenqi_water=84000,zhenqi_fire=84000,zhenqi_earth=105000,jingmai_effect='jingmaidatong_01.pfx',},
		[28]={dwId=28,dwAttack=0,dwDefense=144,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=880,exp=0,zhenqi_metal=88000,zhenqi_wood=0,zhenqi_water=88000,zhenqi_fire=88000,zhenqi_earth=110000,jingmai_effect='jingmaidatong_01.pfx',},
		[29]={dwId=29,dwAttack=0,dwDefense=168,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=850,exp=0,zhenqi_metal=94400,zhenqi_wood=0,zhenqi_water=94400,zhenqi_fire=94400,zhenqi_earth=118000,jingmai_effect='jingmaidatong_01.pfx',},
		[30]={dwId=30,dwAttack=0,dwDefense=192,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=820,exp=0,zhenqi_metal=100800,zhenqi_wood=0,zhenqi_water=100800,zhenqi_fire=100800,zhenqi_earth=126000,jingmai_effect='jingmaidatong_01.pfx',},
		[31]={dwId=31,dwAttack=0,dwDefense=218,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=790,exp=0,zhenqi_metal=107200,zhenqi_wood=0,zhenqi_water=107200,zhenqi_fire=107200,zhenqi_earth=134000,jingmai_effect='jingmaidatong_01.pfx',},
		[32]={dwId=32,dwAttack=0,dwDefense=244,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=760,exp=0,zhenqi_metal=113600,zhenqi_wood=0,zhenqi_water=113600,zhenqi_fire=113600,zhenqi_earth=142000,jingmai_effect='jingmaidatong_01.pfx',},
		[33]={dwId=33,dwAttack=0,dwDefense=272,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=730,exp=0,zhenqi_metal=120000,zhenqi_wood=0,zhenqi_water=120000,zhenqi_fire=120000,zhenqi_earth=150000,jingmai_effect='jingmaidatong_01.pfx',},
		[34]={dwId=34,dwAttack=0,dwDefense=300,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=700,exp=0,zhenqi_metal=128000,zhenqi_wood=0,zhenqi_water=128000,zhenqi_fire=128000,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[35]={dwId=35,dwAttack=0,dwDefense=330,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=670,exp=0,zhenqi_metal=136000,zhenqi_wood=0,zhenqi_water=136000,zhenqi_fire=136000,zhenqi_earth=170000,jingmai_effect='jingmaidatong_01.pfx',},
		[36]={dwId=36,dwAttack=0,dwDefense=360,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=640,exp=0,zhenqi_metal=144000,zhenqi_wood=0,zhenqi_water=144000,zhenqi_fire=144000,zhenqi_earth=180000,jingmai_effect='jingmaidatong_01.pfx',},
		[37]={dwId=37,dwAttack=0,dwDefense=392,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=610,exp=0,zhenqi_metal=152000,zhenqi_wood=0,zhenqi_water=152000,zhenqi_fire=152000,zhenqi_earth=190000,jingmai_effect='jingmaidatong_01.pfx',},
		[38]={dwId=38,dwAttack=0,dwDefense=424,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=580,exp=0,zhenqi_metal=160000,zhenqi_wood=0,zhenqi_water=160000,zhenqi_fire=160000,zhenqi_earth=200000,jingmai_effect='jingmaidatong_01.pfx',},
		[39]={dwId=39,dwAttack=0,dwDefense=458,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=550,exp=0,zhenqi_metal=160000,zhenqi_wood=0,zhenqi_water=160000,zhenqi_fire=160000,zhenqi_earth=200000,jingmai_effect='jingmaidatong_01.pfx',},
		[40]={dwId=40,dwAttack=0,dwDefense=500,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=520,exp=0,zhenqi_metal=160000,zhenqi_wood=0,zhenqi_water=160000,zhenqi_fire=160000,zhenqi_earth=200000,jingmai_effect='jingmaidatong_02.pfx',},
		}
	},
	[8] = 
	{
		name = '督脉',number=40,petype1 = '生命',petype2 = '0',patype1 = '生命',patype2 = '0',dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=200,dwMPMax=0,
		---经脉打通限制
		dwLevel = 8,		
		---经脉描述
		PulseDis = "能总督一身之阳经，故称“阳脉之海”",
		Pulse = 
		{
		[1]={dwId=1,dwAttack=8,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=10000,exp=0,zhenqi_metal=1000,zhenqi_wood=800,zhenqi_water=800,zhenqi_fire=0,zhenqi_earth=800,jingmai_effect='jingmaidatong_01.pfx',},
		[2]={dwId=2,dwAttack=10,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=9000,exp=0,zhenqi_metal=1500,zhenqi_wood=1200,zhenqi_water=1200,zhenqi_fire=0,zhenqi_earth=1200,jingmai_effect='jingmaidatong_01.pfx',},
		[3]={dwId=3,dwAttack=11,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=8000,exp=0,zhenqi_metal=2300,zhenqi_wood=1840,zhenqi_water=1840,zhenqi_fire=0,zhenqi_earth=1840,jingmai_effect='jingmaidatong_01.pfx',},
		[4]={dwId=4,dwAttack=12,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=3500,zhenqi_wood=2800,zhenqi_water=2800,zhenqi_fire=0,zhenqi_earth=2800,jingmai_effect='jingmaidatong_01.pfx',},
		[5]={dwId=5,dwAttack=14,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=5000,zhenqi_wood=4000,zhenqi_water=4000,zhenqi_fire=0,zhenqi_earth=4000,jingmai_effect='jingmaidatong_01.pfx',},
		[6]={dwId=6,dwAttack=16,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=6800,zhenqi_wood=5440,zhenqi_water=5440,zhenqi_fire=0,zhenqi_earth=5440,jingmai_effect='jingmaidatong_01.pfx',},
		[7]={dwId=7,dwAttack=17,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=8800,zhenqi_wood=7040,zhenqi_water=7040,zhenqi_fire=0,zhenqi_earth=7040,jingmai_effect='jingmaidatong_01.pfx',},
		[8]={dwId=8,dwAttack=18,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=7000,exp=0,zhenqi_metal=11000,zhenqi_wood=8800,zhenqi_water=8800,zhenqi_fire=0,zhenqi_earth=8800,jingmai_effect='jingmaidatong_01.pfx',},
		[9]={dwId=9,dwAttack=20,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=13200,zhenqi_wood=10560,zhenqi_water=10560,zhenqi_fire=0,zhenqi_earth=10560,jingmai_effect='jingmaidatong_01.pfx',},
		[10]={dwId=10,dwAttack=22,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=15500,zhenqi_wood=12400,zhenqi_water=12400,zhenqi_fire=0,zhenqi_earth=12400,jingmai_effect='jingmaidatong_01.pfx',},
		[11]={dwId=11,dwAttack=23,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=6000,exp=0,zhenqi_metal=19200,zhenqi_wood=15360,zhenqi_water=15360,zhenqi_fire=0,zhenqi_earth=15360,jingmai_effect='jingmaidatong_01.pfx',},
		[12]={dwId=12,dwAttack=24,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=23500,zhenqi_wood=18800,zhenqi_water=18800,zhenqi_fire=0,zhenqi_earth=18800,jingmai_effect='jingmaidatong_01.pfx',},
		[13]={dwId=13,dwAttack=26,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=26500,zhenqi_wood=21200,zhenqi_water=21200,zhenqi_fire=0,zhenqi_earth=21200,jingmai_effect='jingmaidatong_01.pfx',},
		[14]={dwId=14,dwAttack=28,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=29800,zhenqi_wood=23840,zhenqi_water=23840,zhenqi_fire=0,zhenqi_earth=23840,jingmai_effect='jingmaidatong_01.pfx',},
		[15]={dwId=15,dwAttack=29,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=5000,exp=0,zhenqi_metal=33300,zhenqi_wood=26640,zhenqi_water=26640,zhenqi_fire=0,zhenqi_earth=26640,jingmai_effect='jingmaidatong_01.pfx',},
		[16]={dwId=16,dwAttack=30,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=3000,exp=0,zhenqi_metal=38000,zhenqi_wood=30400,zhenqi_water=30400,zhenqi_fire=0,zhenqi_earth=30400,jingmai_effect='jingmaidatong_01.pfx',},
		[17]={dwId=17,dwAttack=32,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=43500,zhenqi_wood=34800,zhenqi_water=34800,zhenqi_fire=0,zhenqi_earth=34800,jingmai_effect='jingmaidatong_01.pfx',},
		[18]={dwId=18,dwAttack=34,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=49600,zhenqi_wood=39680,zhenqi_water=39680,zhenqi_fire=0,zhenqi_earth=39680,jingmai_effect='jingmaidatong_01.pfx',},
		[19]={dwId=19,dwAttack=36,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2500,exp=0,zhenqi_metal=56000,zhenqi_wood=44800,zhenqi_water=44800,zhenqi_fire=0,zhenqi_earth=44800,jingmai_effect='jingmaidatong_01.pfx',},
		[20]={dwId=20,dwAttack=39,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=2000,exp=0,zhenqi_metal=62500,zhenqi_wood=50000,zhenqi_water=50000,zhenqi_fire=0,zhenqi_earth=50000,jingmai_effect='jingmaidatong_01.pfx',},
		[21]={dwId=21,dwAttack=44,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=69000,zhenqi_wood=55200,zhenqi_water=55200,zhenqi_fire=0,zhenqi_earth=55200,jingmai_effect='jingmaidatong_01.pfx',},
		[22]={dwId=22,dwAttack=50,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=75000,zhenqi_wood=60000,zhenqi_water=60000,zhenqi_fire=0,zhenqi_earth=60000,jingmai_effect='jingmaidatong_01.pfx',},
		[23]={dwId=23,dwAttack=58,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=81500,zhenqi_wood=65200,zhenqi_water=65200,zhenqi_fire=0,zhenqi_earth=65200,jingmai_effect='jingmaidatong_01.pfx',},
		[24]={dwId=24,dwAttack=68,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=1000,exp=0,zhenqi_metal=88000,zhenqi_wood=70400,zhenqi_water=70400,zhenqi_fire=0,zhenqi_earth=70400,jingmai_effect='jingmaidatong_01.pfx',},
		[25]={dwId=25,dwAttack=80,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=970,exp=0,zhenqi_metal=94000,zhenqi_wood=75200,zhenqi_water=75200,zhenqi_fire=0,zhenqi_earth=75200,jingmai_effect='jingmaidatong_01.pfx',},
		[26]={dwId=26,dwAttack=94,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=940,exp=0,zhenqi_metal=100000,zhenqi_wood=80000,zhenqi_water=80000,zhenqi_fire=0,zhenqi_earth=80000,jingmai_effect='jingmaidatong_01.pfx',},
		[27]={dwId=27,dwAttack=110,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=910,exp=0,zhenqi_metal=105000,zhenqi_wood=84000,zhenqi_water=84000,zhenqi_fire=0,zhenqi_earth=84000,jingmai_effect='jingmaidatong_01.pfx',},
		[28]={dwId=28,dwAttack=128,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=880,exp=0,zhenqi_metal=110000,zhenqi_wood=88000,zhenqi_water=88000,zhenqi_fire=0,zhenqi_earth=88000,jingmai_effect='jingmaidatong_01.pfx',},
		[29]={dwId=29,dwAttack=148,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=850,exp=0,zhenqi_metal=118000,zhenqi_wood=94400,zhenqi_water=94400,zhenqi_fire=0,zhenqi_earth=94400,jingmai_effect='jingmaidatong_01.pfx',},
		[30]={dwId=30,dwAttack=180,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=820,exp=0,zhenqi_metal=126000,zhenqi_wood=100800,zhenqi_water=100800,zhenqi_fire=0,zhenqi_earth=100800,jingmai_effect='jingmaidatong_01.pfx',},
		[31]={dwId=31,dwAttack=216,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=790,exp=0,zhenqi_metal=134000,zhenqi_wood=107200,zhenqi_water=107200,zhenqi_fire=0,zhenqi_earth=107200,jingmai_effect='jingmaidatong_01.pfx',},
		[32]={dwId=32,dwAttack=256,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=760,exp=0,zhenqi_metal=142000,zhenqi_wood=113600,zhenqi_water=113600,zhenqi_fire=0,zhenqi_earth=113600,jingmai_effect='jingmaidatong_01.pfx',},
		[33]={dwId=33,dwAttack=300,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=730,exp=0,zhenqi_metal=150000,zhenqi_wood=120000,zhenqi_water=120000,zhenqi_fire=0,zhenqi_earth=120000,jingmai_effect='jingmaidatong_01.pfx',},
		[34]={dwId=34,dwAttack=348,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=700,exp=0,zhenqi_metal=160000,zhenqi_wood=128000,zhenqi_water=128000,zhenqi_fire=0,zhenqi_earth=128000,jingmai_effect='jingmaidatong_01.pfx',},
		[35]={dwId=35,dwAttack=400,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=670,exp=0,zhenqi_metal=170000,zhenqi_wood=136000,zhenqi_water=136000,zhenqi_fire=0,zhenqi_earth=136000,jingmai_effect='jingmaidatong_01.pfx',},
		[36]={dwId=36,dwAttack=456,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=640,exp=0,zhenqi_metal=180000,zhenqi_wood=144000,zhenqi_water=144000,zhenqi_fire=0,zhenqi_earth=144000,jingmai_effect='jingmaidatong_01.pfx',},
		[37]={dwId=37,dwAttack=516,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=610,exp=0,zhenqi_metal=190000,zhenqi_wood=152000,zhenqi_water=152000,zhenqi_fire=0,zhenqi_earth=152000,jingmai_effect='jingmaidatong_01.pfx',},
		[38]={dwId=38,dwAttack=580,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=580,exp=0,zhenqi_metal=200000,zhenqi_wood=160000,zhenqi_water=160000,zhenqi_fire=0,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[39]={dwId=39,dwAttack=648,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=550,exp=0,zhenqi_metal=200000,zhenqi_wood=160000,zhenqi_water=160000,zhenqi_fire=0,zhenqi_earth=160000,jingmai_effect='jingmaidatong_01.pfx',},
		[40]={dwId=40,dwAttack=780,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,rate=520,exp=0,zhenqi_metal=200000,zhenqi_wood=160000,zhenqi_water=160000,zhenqi_fire=0,zhenqi_earth=160000,jingmai_effect='jingmaidatong_02.pfx',},
	    }
	},
}
_G.PulseExConfig = 
{
    dwWuValueTop = 1000, --悟值满值
	dwPulseAllNum = 320,
----界面显示内容
	StrConfig1= 
	{
---------经脉冲脉界面信息显示
         PulseName = "%s",       ---经脉名称     	     
		 PulseLevel = "Lv.%s",   -- 经脉等级
		 PulseLevelDes = "升级到Lv.%s所需消耗",   -- 升级到XX所需消耗		
         PulseAbilityYes = "已激活",		 
		 PulseAbilityNo = "未激活",
-----------套装信息显示
		 PulseSuitName = "%s", 
		 PulseSuitLevel = "Lv.%s",     
		 NotOpen = "<font color='#8c8b8a'>  未激活</font>",  
		 SixSwordName = "<a href = 'asfunction:hrefevent'><font color='#6ce7ee'><u>六脉神剑</u></font></a>",----这个需要有超链接啊，打开技能界面选择六脉神剑技能		 
		 SixSwordEffect = '技能伤害+%s%%',
----------套装经脉信息显示
		 dwAttack = '攻击+%s',
		 dwDefense = '防御+%s',
		 dwFlee = '身法+%s',
		 dwCrit = '暴击+%s',
		 dwHPMax = '生命+%s',
		 dwMPMax = '内力+%s', 
		 dwDuck = '闪避率+%s',
--------经脉图标配置
            ---固本培元
 			png1  =   'img://Icon_sk_13007_1.png',
			pngdis1 = 'img://Icon_sk_13007_0.png',
			w = 48, 
			h = 48,
			---无坚不摧
			png2  =   'img://Icon_sk_13011_1.png',
			pngdis2 = 'img://Icon_sk_13011_0.png',		
            ---炼体成钢
			png3  =   'img://Icon_sk_13015_1.png',
			pngdis3 =  'img://Icon_sk_13015_0.png',		
            ---矫健身姿
   			png4  =   'img://Icon_sk_60000_1.png',
			pngdis4 =  'img://Icon_sk_60000_0.png', 
            ---六脉神剑
   			png5  =   'img://Icon_sk_11007_1.png',
			pngdis5 =  'img://Icon_sk_11007_0.png',			
		 
		 
	},
----悬浮框显示内容
	StrConfig2 = 
	{
---------经脉悬浮框内容--------经脉描述在上边经脉配置表里找	
        PulseName = "<font color='#f79b0a' size='14'>%s</font>",       ---经脉名称
		NotBegin = "<font color='#7bff87'>   尚未打通</font>",             -- 经脉悬浮框里，满足条件但未升级的显示
		LevelLimit = "<font color='#cd0000'>   需求人物等级%s</font>",     -- 经脉悬浮框里，人物等级不满足的提示		
		PulseLevel = "<font color='#f79b0a' size='14'>   Lv.%s</font>",                       -- 经脉等级	
		PulseNum = "%s",                                                     --经脉本级效果（这里的字段配置颜色）
		PulseNextNum = "%s",                                                 --经脉下级效果（这里的字段配置颜色）
		PulseNextLevel = "<font color='#cdc6c4'>下一层效果</font>",               -- 经脉下层效果	
        dwShare	= "冲脉成功后，周围玩家可以获得经验分享，VIP玩家可以额外获得12次经验分享次数<br/>您已获得分享经验：%s",

----------套装悬浮框内容-------套装描述去套装配置里找
      	PulseSuitName = "<font color='#f79b0a' size='14'>%s</font>",               --套装属性悬浮框名字
		NotOpen = "<font color='#8c8b8a'>   未激活</font>",                    -- 界面套装名字后边显示的”未激活“
		PulseSuitLevel = "<font size='14'>   Lv.%s</font>",                           --套装属性悬浮框等级
		PulseNeedNum = "<font color='#ffd800'>%s %s级</font>",             --需求经脉等级（达成）
		PulseNeedNumDis = "<font color='#818181'>%s %s级</font>",           --需求经脉等级（未达成）
        NextLevelLimit = "<font color='#cdc6c4'>下一层需求</font>",         -- 套装悬浮框
		NextLevel = "<font color='#cdc6c4'>下一层效果</font>",               -- 套装悬浮框
----套装和经脉悬浮框属性显示
		dwAttack = "<font color='#31cf32'>攻击+%s</font>",
		dwDefense = "<font color='#31cf32'>防御+%s</font>",
		dwFlee = "<font color='#31cf32'>身法+%s</font>",
		dwCrit = "<font color='#31cf32'>暴击+%s</font>",
		dwHPMax = "<font color='#31cf32'>生命+%s</font>",
		dwMPMax = "<font color='#31cf32'>内力+%s</font>",
		dwDuck = "<font color='#31cf32'>闪避率+%s</font>",
-----套装和经脉满层
		Full = "<font color='#cd0000'>已满层</font>",
---六脉神剑相关	
		FinishEx = "<font color='#cd0000'>(%s未突破二十四层)</font>",
		Finish = "<font color='#31cf32'>(%s已突破二十四层)</font>",
		NotFinish = "<font color='#31cf32'>(%s已突破二十四层)</font>",
		SixSwordName = "<font color='#6ce7ee'>六脉神剑</font>",
		SixSwordHead = "<font color='#31cf32'>每贯通1条经脉，六脉神剑伤害+4%</font>",
		SixSwordHeadflg = false; --控制SixSwordHead是否开启
		SixSwordHeadEx = "<font color='#31cf32'>每条经脉突破24层，六脉神剑伤害+2%</font>",
		SixSwordSkillType = 2,---技能分页
		SixSwordSkillID = 11007,---技能ID
		SixSword = 
		{
			[1] = "<font color='#cdc6c4'>基础式-根基坚固才是修炼不二法门</font>",
			[2] = "<font color='#cdc6c4'>聚气式-气脉顺畅，运气自如，气成剑成</font>",
			[3] = "<font color='#cdc6c4'>少商剑-剑路雄劲，石破惊天，风雨大至</font>",
			[4] = "<font color='#cdc6c4'>商阳剑-巧妙灵活，难以捉摸</font>",
			[5] = "<font color='#cdc6c4'>中冲剑-大开大阖，气势雄迈</font>",
			[6] = "<font color='#cdc6c4'>关冲剑-以拙滞古朴取胜</font>",
			[7] = "<font color='#cdc6c4'>少冲剑-轻灵迅速，唯快不破</font>",
			[8] = "<font color='#cdc6c4'>少泽剑-忽来忽去，变化精微</font>",
		},
	},
	ProSerial1 = 
	{
		[1] = 'dwAttack',
		[2] = 'dwDefense',
		[3] = 'dwFlee',
		[4] = 'dwCrit',
		[5] = 'dwHPMax',
		[6] = 'dwMPMax',
	},
	ProSerial2 = 
	{
		[1] = 'dwAttack',
		[2] = 'dwDefense',
		[3] = 'dwFlee',
		[4] = 'dwCrit',
		[5] = 'dwHPMax',
		[6] = 'dwMPMax',
		[7] = 'dwDuck',
	},
-----悟槽满效果
	PulseEffect= 
	{
	PulseDis = "<font color='#cdc6c4'>每次冲脉失败悟值会随机向上增长，当悟值涨满后会触发领悟效果<br/><font color='#31cf32'>当前效果：%s",
	EffectDis = "无",
      [1] = '下次冲脉成功，自己获得经脉经验双倍',
      [2] = '下次冲脉100%成功',
      [3] = '下次冲脉失败真气返还30%',
      [4] = '下次冲脉失败真气返还60%',
      [5] = '下次冲脉失败真气返还80%',	  
	},
	OnePulseAttackPoint = 2,--一条脉2个百分点
	PulseArea = {0,1,5,15,20,25,30,40},
	PulseBgPng = 
	{
		{0,'img://JingMai_bg_01.png'},
		{80,'img://JingMai_bg_02.png'},
		{120,'img://JingMai_bg_03.png'},
		{200,'img://JingMai_bg_04.png'},	
		{280,'img://JingMai_bg_05.png'},		
	},
	WuNotice = {3000210012,3000210013,3000210014,3000210015,3000210016},
	PulseEx = 
	{
		[1] = 
		{
			name = '固本培元',
			---套装描述
			PulseDis = "",
			PulseLimit = 
			{
			[1]={dwId=1,dwPulse1=0,dwPulse2=0,dwPulse3=0,dwPulse4=0,dwPulse5=0,dwPulse6=4,dwPulse7=0,dwPulse8=0,},
			[2]={dwId=2,dwPulse1=0,dwPulse2=0,dwPulse3=1,dwPulse4=0,dwPulse5=0,dwPulse6=8,dwPulse7=0,dwPulse8=0,},
			[3]={dwId=3,dwPulse1=0,dwPulse2=1,dwPulse3=4,dwPulse4=0,dwPulse5=0,dwPulse6=12,dwPulse7=0,dwPulse8=0,},
			[4]={dwId=4,dwPulse1=0,dwPulse2=4,dwPulse3=8,dwPulse4=0,dwPulse5=0,dwPulse6=16,dwPulse7=0,dwPulse8=0,},
			[5]={dwId=5,dwPulse1=0,dwPulse2=8,dwPulse3=12,dwPulse4=0,dwPulse5=0,dwPulse6=20,dwPulse7=0,dwPulse8=0,},
			[6]={dwId=6,dwPulse1=0,dwPulse2=12,dwPulse3=16,dwPulse4=0,dwPulse5=0,dwPulse6=24,dwPulse7=0,dwPulse8=0,},
			[7]={dwId=6,dwPulse1=0,dwPulse2=16,dwPulse3=20,dwPulse4=0,dwPulse5=0,dwPulse6=28,dwPulse7=0,dwPulse8=0,},
			[8]={dwId=6,dwPulse1=0,dwPulse2=20,dwPulse3=24,dwPulse4=0,dwPulse5=0,dwPulse6=32,dwPulse7=0,dwPulse8=0,},
			[9]={dwId=6,dwPulse1=0,dwPulse2=24,dwPulse3=28,dwPulse4=0,dwPulse5=0,dwPulse6=36,dwPulse7=0,dwPulse8=0,},
		    [10]={dwId=6,dwPulse1=0,dwPulse2=28,dwPulse3=32,dwPulse4=0,dwPulse5=0,dwPulse6=40,dwPulse7=0,dwPulse8=0,},			
			},
			Attri = 
			{
			[1]={dwId=1,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=200,dwMPMax=0,dwDuck=0,},
			[2]={dwId=2,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=400,dwMPMax=0,dwDuck=0,},
			[3]={dwId=3,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=800,dwMPMax=200,dwDuck=0,},
			[4]={dwId=4,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=1400,dwMPMax=300,dwDuck=0,},
			[5]={dwId=5,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=2400,dwMPMax=400,dwDuck=0,},
			[6]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=3600,dwMPMax=500,dwDuck=0,},
			[7]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=7000,dwMPMax=600,dwDuck=0,},
			[8]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=9000,dwMPMax=700,dwDuck=0,},
			[9]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=11500,dwMPMax=800,dwDuck=0,},
			[10]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=14000,dwMPMax=1000,dwDuck=0,},			},
		},
		[2] = 
		{
			name = '无坚不摧',
			---套装描述
			PulseDis = "",
			PulseLimit = 
			{
				[1]={dwId=1,dwPulse1=0,dwPulse2=0,dwPulse3=0,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=0,dwPulse8=4,},
				[2]={dwId=2,dwPulse1=0,dwPulse2=1,dwPulse3=0,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=0,dwPulse8=8,},
				[3]={dwId=3,dwPulse1=0,dwPulse2=4,dwPulse3=0,dwPulse4=1,dwPulse5=0,dwPulse6=0,dwPulse7=0,dwPulse8=12,},
				[4]={dwId=4,dwPulse1=0,dwPulse2=8,dwPulse3=0,dwPulse4=4,dwPulse5=0,dwPulse6=0,dwPulse7=0,dwPulse8=16,},
				[5]={dwId=5,dwPulse1=0,dwPulse2=12,dwPulse3=0,dwPulse4=8,dwPulse5=0,dwPulse6=0,dwPulse7=0,dwPulse8=20,},
				[6]={dwId=6,dwPulse1=0,dwPulse2=16,dwPulse3=0,dwPulse4=12,dwPulse5=0,dwPulse6=0,dwPulse7=0,dwPulse8=24,},
				[7]={dwId=6,dwPulse1=0,dwPulse2=20,dwPulse3=0,dwPulse4=16,dwPulse5=0,dwPulse6=0,dwPulse7=0,dwPulse8=28,},
				[8]={dwId=6,dwPulse1=0,dwPulse2=24,dwPulse3=0,dwPulse4=20,dwPulse5=0,dwPulse6=0,dwPulse7=0,dwPulse8=32,},
				[9]={dwId=6,dwPulse1=0,dwPulse2=28,dwPulse3=0,dwPulse4=24,dwPulse5=0,dwPulse6=0,dwPulse7=0,dwPulse8=36,},
				[10]={dwId=6,dwPulse1=0,dwPulse2=32,dwPulse3=0,dwPulse4=28,dwPulse5=0,dwPulse6=0,dwPulse7=0,dwPulse8=40,},				
			},
			Attri = 
			{
				[1]={dwId=1,dwAttack=50,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[2]={dwId=2,dwAttack=100,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[3]={dwId=3,dwAttack=200,dwDefense=0,dwFlee=0,dwCrit=40,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[4]={dwId=4,dwAttack=350,dwDefense=0,dwFlee=0,dwCrit=80,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[5]={dwId=5,dwAttack=600,dwDefense=0,dwFlee=0,dwCrit=120,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[6]={dwId=6,dwAttack=900,dwDefense=0,dwFlee=0,dwCrit=210,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[7]={dwId=6,dwAttack=1400,dwDefense=0,dwFlee=0,dwCrit=200,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[8]={dwId=6,dwAttack=1800,dwDefense=0,dwFlee=0,dwCrit=200,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[9]={dwId=6,dwAttack=2300,dwDefense=0,dwFlee=0,dwCrit=200,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[10]={dwId=6,dwAttack=2800,dwDefense=0,dwFlee=0,dwCrit=200,dwHPMax=0,dwMPMax=0,dwDuck=0,},				
			},
		},
		[3] = 
		{
			name = '炼体成钢',
			---套装描述
			PulseDis = "",
			PulseLimit = 
			{
				[1]={dwId=1,dwPulse1=0,dwPulse2=0,dwPulse3=0,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=4,dwPulse8=0,},
				[2]={dwId=2,dwPulse1=1,dwPulse2=0,dwPulse3=0,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=8,dwPulse8=0,},
				[3]={dwId=3,dwPulse1=4,dwPulse2=0,dwPulse3=1,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=12,dwPulse8=0,},
				[4]={dwId=4,dwPulse1=8,dwPulse2=0,dwPulse3=4,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=16,dwPulse8=0,},
				[5]={dwId=5,dwPulse1=12,dwPulse2=0,dwPulse3=8,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=20,dwPulse8=0,},
				[6]={dwId=6,dwPulse1=16,dwPulse2=0,dwPulse3=12,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=24,dwPulse8=0,},
				[7]={dwId=6,dwPulse1=20,dwPulse2=0,dwPulse3=16,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=28,dwPulse8=0,},
				[8]={dwId=6,dwPulse1=24,dwPulse2=0,dwPulse3=20,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=32,dwPulse8=0,},
				[9]={dwId=6,dwPulse1=28,dwPulse2=0,dwPulse3=24,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=36,dwPulse8=0,},
				[10]={dwId=6,dwPulse1=32,dwPulse2=0,dwPulse3=28,dwPulse4=0,dwPulse5=0,dwPulse6=0,dwPulse7=40,dwPulse8=0,},				
			},
			Attri = 
			{
				[1]={dwId=1,dwAttack=0,dwDefense=30,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[2]={dwId=2,dwAttack=0,dwDefense=60,dwFlee=0,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[3]={dwId=3,dwAttack=0,dwDefense=110,dwFlee=0,dwCrit=0,dwHPMax=300,dwMPMax=0,dwDuck=0,},
				[4]={dwId=4,dwAttack=0,dwDefense=200,dwFlee=0,dwCrit=0,dwHPMax=500,dwMPMax=0,dwDuck=0,},
				[5]={dwId=5,dwAttack=0,dwDefense=350,dwFlee=0,dwCrit=0,dwHPMax=900,dwMPMax=0,dwDuck=0,},
				[6]={dwId=6,dwAttack=0,dwDefense=550,dwFlee=0,dwCrit=0,dwHPMax=1500,dwMPMax=0,dwDuck=0,},
				[7]={dwId=6,dwAttack=0,dwDefense=700,dwFlee=0,dwCrit=0,dwHPMax=2000,dwMPMax=0,dwDuck=0,},
				[8]={dwId=6,dwAttack=0,dwDefense=900,dwFlee=0,dwCrit=0,dwHPMax=2500,dwMPMax=0,dwDuck=0,},
				[9]={dwId=6,dwAttack=0,dwDefense=1150,dwFlee=0,dwCrit=0,dwHPMax=3000,dwMPMax=0,dwDuck=0,},
				[10]={dwId=6,dwAttack=0,dwDefense=1400,dwFlee=0,dwCrit=0,dwHPMax=3800,dwMPMax=0,dwDuck=0,},				
			},			
		},
		[4] = 
		{
			name = '矫健身姿',
			---套装描述
			PulseDis = "",
			PulseLimit = 
			{
				[1]={dwId=1,dwPulse1=0,dwPulse2=0,dwPulse3=0,dwPulse4=0,dwPulse5=4,dwPulse6=0,dwPulse7=0,dwPulse8=0,},
				[2]={dwId=2,dwPulse1=0,dwPulse2=0,dwPulse3=0,dwPulse4=1,dwPulse5=8,dwPulse6=0,dwPulse7=0,dwPulse8=0,},
				[3]={dwId=3,dwPulse1=1,dwPulse2=0,dwPulse3=0,dwPulse4=4,dwPulse5=12,dwPulse6=0,dwPulse7=0,dwPulse8=0,},
				[4]={dwId=4,dwPulse1=4,dwPulse2=0,dwPulse3=0,dwPulse4=8,dwPulse5=16,dwPulse6=0,dwPulse7=0,dwPulse8=0,},
				[5]={dwId=5,dwPulse1=8,dwPulse2=0,dwPulse3=0,dwPulse4=12,dwPulse5=20,dwPulse6=0,dwPulse7=0,dwPulse8=0,},
				[6]={dwId=6,dwPulse1=12,dwPulse2=0,dwPulse3=0,dwPulse4=16,dwPulse5=24,dwPulse6=0,dwPulse7=0,dwPulse8=0,},
				[7]={dwId=6,dwPulse1=16,dwPulse2=0,dwPulse3=0,dwPulse4=20,dwPulse5=28,dwPulse6=0,dwPulse7=0,dwPulse8=0,},
				[8]={dwId=6,dwPulse1=20,dwPulse2=0,dwPulse3=0,dwPulse4=24,dwPulse5=32,dwPulse6=0,dwPulse7=0,dwPulse8=0,},
				[9]={dwId=6,dwPulse1=24,dwPulse2=0,dwPulse3=0,dwPulse4=28,dwPulse5=36,dwPulse6=0,dwPulse7=0,dwPulse8=0,},
				[10]={dwId=6,dwPulse1=28,dwPulse2=0,dwPulse3=0,dwPulse4=32,dwPulse5=40,dwPulse6=0,dwPulse7=0,dwPulse8=0,},				
			},
			Attri = 
			{
				[1]={dwId=1,dwAttack=0,dwDefense=0,dwFlee=40,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[2]={dwId=2,dwAttack=0,dwDefense=0,dwFlee=60,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=0,},
				[3]={dwId=3,dwAttack=0,dwDefense=0,dwFlee=100,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=100,},
				[4]={dwId=4,dwAttack=0,dwDefense=0,dwFlee=150,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=150,},
				[5]={dwId=5,dwAttack=0,dwDefense=0,dwFlee=200,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=200,},
				[6]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=300,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=250,},
				[7]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=300,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=100,},
				[8]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=300,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=100,},
				[9]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=300,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=100,},
				[10]={dwId=6,dwAttack=0,dwDefense=0,dwFlee=300,dwCrit=0,dwHPMax=0,dwMPMax=0,dwDuck=100,},				
			},				
		},
	},
}

--龙脉配置
_G.PulseDragonConfig = 
{
	[1] = 
	{
		--激活后获得的属性
		FunProperty = function()
			local objAdv = SSingleAttrChange:new();
			local objPer = SSingleAttrChange:new();
			objAdv.dwAttack= 200 ;
			objAdv.dwDefense= 100;
			objAdv.dwFlee= 30;
			objAdv.dwCrit= 20;
			objAdv.dwHPMax= 1000;
			objAdv.dwMPMax= 40;
			objAdv.dwDuck= 0;
			return objAdv,objPer;
		end;
		
		--激活条件
		FunCheckCondition = function(dwPulseAllNumber,isPulseOpen)
			if not isPulseOpen then
				return;
			end
			
			if dwPulseAllNumber < 60 then
				return;
			end
			return true;
		end;
		
		dwCostItemEnumID = 2500061;--激活消耗的道具ID
		dwCostItemNum = 1;   --激活消耗的道具数量
	};
	[2] = 
	{
		FunProperty = function()
			local objAdv = SSingleAttrChange:new();
			local objPer = SSingleAttrChange:new();
			objAdv.dwAttack= 800;
			objAdv.dwDefense= 400;
			objAdv.dwFlee= 120;
			objAdv.dwCrit= 80;
			objAdv.dwHPMax= 4000;
			objAdv.dwMPMax= 160;
			objAdv.dwDuck= 0;
			return objAdv,objPer;
		end;
		
		--激活条件
		FunCheckCondition = function(dwPulseAllNumber,isPulseOpen)
			if not isPulseOpen then
				return;
			end
			
			if dwPulseAllNumber < 60 then
				return;
			end
			return true;
		end;
		dwCostItemEnumID = 2500062;--激活消耗的道具ID
		dwCostItemNum = 1;   --激活消耗的道具数量
	};
	[3] = 
	{
		FunProperty = function()
			local objAdv = SSingleAttrChange:new();
			local objPer = SSingleAttrChange:new();
			objAdv.dwAttack = 2000;
			objAdv.dwDefense = 1000;
			objAdv.dwFlee= 300;
			objAdv.dwCrit= 200;
			objAdv.dwHPMax= 10000;
			objAdv.dwMPMax= 400;
			objAdv.dwDuck= 0;
			return objAdv,objPer;
		end;
		
		--激活条件
		FunCheckCondition = function(dwPulseAllNumber,isPulseOpen)
			if not isPulseOpen then
				return;
			end
			
			if dwPulseAllNumber < 60 then
				return;
			end
			return true;
		end;
		dwCostItemEnumID = 2500063;--激活消耗的道具ID
		dwCostItemNum = 1;   --激活消耗的道具数量
	};
}

--龙脉的显示字符串
_G.PulseDragonStringConfig = 
{
	strTitle = "【龙脉】<br/>";
	
	Activation = {
		[0] = "【已激活】";
		[1] = "【未激活】";
	};
	
	strPrompt = "<br/><font color='#cdc6c4'>温馨提示：<br/>龙脉道具丹可以通过官方活动获得，使用后可激活对应龙脉<br/>龙脉加成效果不可叠加<font/>";
	
	strAttrShowWord = [[<font color='#cdc6c4'>%d</font><font color='#7bff87'>(+%d)</font>]];

	[1]=
	{
		szName = "<img src = 'img://Xtb_weapon.png'>北龙真脉",
		szDragonName = "北龙真脉",
		szCondition = "激活条件：经脉总层数达到60层，使用道具北龙真脉丹",
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 200<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 100<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>身法 + 30<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>暴击 + 20<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 1000<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 40";			--效果
	};
	[2]=
	{
		szName = "<img src = 'img://Xtb_weapon.png'>中龙真脉",
		szDragonName = "中龙真脉",
		szCondition = "激活条件：经脉总层数达到60层，使用道具中龙真脉丹",
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 800<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 400<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>身法 + 120<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>暴击 + 80<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 4000<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 160";			--效果
	};
	[3]=
	{
		szName = "<img src = 'img://Xtb_weapon.png'>南龙真脉",
		szDragonName = "南龙真脉",
		szCondition = "激活条件：经脉总层数达到60层，使用道具南龙真脉丹",
		szEffort = "加成效果：<img src = 'img://zb_xfk_shuxing_biaoshi.png'>攻击 + 2000<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>防御 + 1000<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>身法 + 300<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>暴击 + 200<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>生命 + 10000<br/>          <img src = 'img://zb_xfk_shuxing_biaoshi.png'>内力 + 400";				--效果
	};
	
	Color = {--颜色
		Name = "#dd02dc";--套装名字（1级xxx套装）
		Activation = {--激活状态
			[0] = "#4ae833";--已激活
			[1] = "#278cf1";--未激活
		};
		Condition = {--套装条件
			[0] = "#4ae833";--已激活
			[1] = "#278cf1";--未激活
		};
		Effort = {--加成效果
			[0] = "#039846";--已激活
			[1] = "#9d8e7c";--未激活
		};
	};
	
	Format = {--格式化配置
		Title = [[<p align="center"><font face='黑体,宋体' size='18' color='#FDF445'>%s</font></p>]];--标题
		Name = [[<p align="left"><font  face='黑体,宋体' size='16' color="%s">%s</font></p>]];--名字
		Condition = [[<p align="left"><font  face='黑体,宋体' size='14' color="%s">%s	%s</font></p>]];--条件
		Effort = [[<p align="left"><font  face='黑体,宋体' size='14' color="%s">%s</font></p>]];--效果
		Prompt = [[<p align="left"><font  face='黑体,宋体' size='14'>%s</font></p>]];--温馨提示
		Activation = [[<font face='黑体,宋体' size='14' color="%s">%s</font>]];--激活状态（已激活，未激活）
	};
}


