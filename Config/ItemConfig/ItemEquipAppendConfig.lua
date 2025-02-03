--装备附加属性计算列表
--计算流程：1，随机计算出附加属性条数N；2，根据EquipConfig中配置的 dwPropertyID ，找到属性组；
--3，根据是否可以重复标记，确定这N条随机出的算法；4，根据随机出的种类，计算出Value值，保存。
--enPropertyType中定义的枚举是附加属性类型，目前只用到前6条。

--[[
key ：是属性组的ID，和ItemEquipConfig中的dwPropertyID是一样的
dwPropertyID ：附加属性组ID
dwAppendType ：标记当前的附加属性是否可以重复；0表示可以重复，1表示不可以重复
dwMinPower ：攻击力的最小随机数值
dwMaxPower ：攻击力的最大随机数值
dwMinDefence ：防御力的最小随机数值
dwMaxDefence ：防御力的最大随机数值
dwMinBaoJi ：暴击的最小随机数值
dwMaxBaoJi ：暴击的最大随机数值
dwMinShenFa ：身法的最小随机数值
dwMaxShenFa ：身法的最大随机数值
dwMinHPLimited ：HP的最小随机数值
dwMaxHPLimited ：HP的最大随机数值
dwMinMPLimited ：MP的最小随机数值
dwMaxMPLimited ：MP的最大随机数值
dwMinSubDamage ：伤害减免最小随机数值
dwMaxSubDamage ：伤害减免最大随机数值
dwMaxGrowth ：每阶最大成长度数值，护身宝甲专属

dwBuff1 ：附加Buff1
dwBuff2 ：附加Buff2
dwBuff3 ：附加Buff3
dwBuff4 ：附加Buff4
dwBuff5 ：附加Buff5

--]]
-----------add by 刘科建 用来通过数字索引到对应字符串索引-------------------------
_G.EquipAppendTypeNumToStrConfig = 
{
	[enPropertyType.eAttackPower] = {dwMin = "dwMinPower", dwMax = "dwMaxPower"};
	[enPropertyType.eDefence] = {dwMin = "dwMinDefence", dwMax = "dwMaxDefence"};
	[enPropertyType.eShenFa] = {dwMin = "dwMinShenFa", dwMax = "dwMaxShenFa"};
	[enPropertyType.eBaoJi] = {dwMin = "dwMinBaoJi", dwMax = "dwMaxBaoJi"};
	[enPropertyType.eHPLimited] = {dwMin = "dwMinHPLimited", dwMax = "dwMaxHPLimited"};
	[enPropertyType.eMPLimited] = {dwMin = "dwMinMPLimited", dwMax = "dwMaxMPLimited"};
};
----------end----------------------------------------------------------------------------------------
----更改附加属性条数规则：1,QualityToProperty 和 PropertyToQuality 是附加属性条数（或者物品配置dwLevel字段）
--对应的品质信息（普通、绿、蓝、紫、金），它们是顺查表和发查表的关系，需要同时更改。
--2, 护身保甲是特殊装备，所以 AmuletPropertyToQuality 是护身保甲dwLevel到品质的对应表,功能和PropertyToQuality相同
--3, 情侣信物是特殊装备，所以 KeepsakePropertyToQuality 是情侣信物dwLevel到品质的对应表,功能和PropertyToQuality相同
--4, 注意一点：物品的品质和普通装备使用的是同一个配置表，所以一旦更改 PropertyToQuality ，那么就需要相应调整物品的 dwLevel 来获得相应显示颜色

--装备的品质枚举，获取装备品质的时候，传递的就是这里的值
_G.enQualityType = 
{
	eNormal = 0,	--普通
	eGreen = 1,		--绿色
	eBlue = 2,		--蓝色
	ePink = 3,		--紫色
	eGold = 4,		--金黄色
};
--装备品质---附加属性条数
_G.QualityToProperty = 
{
	[enQualityType.eNormal] 	= { 0, 0 },
	[enQualityType.eGreen] 		= { 1, 3 },
	[enQualityType.eBlue] 		= { 4, 5 },
	[enQualityType.ePink] 		= { 6, 6 },
	[enQualityType.eGold] 		= { 7, 10 },
};
--装备的品质对应的装备附加属性条数
_G.PropertyToQuality = 
{
	[0] = enQualityType.eNormal,	--普通装备
	[1] = enQualityType.eGreen,		--一条附加属性对应的品质
	[2] = enQualityType.eGreen,
	[3] = enQualityType.eGreen,
	[4] = enQualityType.eBlue,
	[5] = enQualityType.eBlue,
	[6] = enQualityType.ePink,
	[7] = enQualityType.eGold,
	[8] = enQualityType.eGold,
	[9] = enQualityType.eGold,
	[10] = enQualityType.eGold,
};
--护身宝甲 dwLevel 等级对应的品质显示信息
_G.AmuletPropertyToQuality = 
{
	[0] = enQualityType.ePink,	--普通装备
	[1] = enQualityType.ePink,		--一条附加属性对应的品质
	[2] = enQualityType.ePink,
	[3] = enQualityType.ePink,
	[4] = enQualityType.ePink,
	[5] = enQualityType.ePink,
	[6] = enQualityType.ePink,
	[7] = enQualityType.eGold,
	[8] = enQualityType.eGold,
	[9] = enQualityType.eGold,
	[10] = enQualityType.eGold,
};
--情侣信物 dwLevel 等级对应的品质显示信息
_G.KeepsakePropertyToQuality = 
{
	[0] = enQualityType.eNormal,	--普通装备
	[1] = enQualityType.eNormal,		--一条附加属性对应的品质
	[2] = enQualityType.eGreen,
	[3] = enQualityType.eGreen,
	[4] = enQualityType.eBlue,
	[5] = enQualityType.eBlue,
	[6] = enQualityType.eBlue,
	[7] = enQualityType.eBlue,
	[8] = enQualityType.eBlue,
	[9] = enQualityType.eBlue,
	[10] = enQualityType.eBlue,
};
--品质对应的颜色配置，基础配置
_G.QualityColorConfig = {
	--颜色与文字
	[enQualityType.eNormal] = 	{"#d7dadb","【凡品】","",							"0xffd7dadb","lv0",},
	[enQualityType.eGreen] = 	{"#31cf32","【良品】","img://CUITooltipGreen.png",	"0xff31cf32","lv1",},
	[enQualityType.eBlue] = 	{"#03b3fd","【上品】","img://CUITooltipBlue.png",	"0xff03b3fd","lv2",},
	[enQualityType.ePink] = 	{"#b734f8","【珍品】","img://CUITooltipPink.png",	"0xffb734f8","lv3",},
	[enQualityType.eGold] = 	{"#ffff00","【绝品】","img://CUITooltipGold.png",	"0xffffff00","lv4",},
};
--附加属性条数对应的颜色值配置，Tips系统使用的是这里的配置
_G.PropertyColorConfig = {
	--颜色与文字
	[0] = QualityColorConfig[ PropertyToQuality[0] ],
	[1] = QualityColorConfig[ PropertyToQuality[1] ],
	[2] = QualityColorConfig[ PropertyToQuality[2] ],
	[3] = QualityColorConfig[ PropertyToQuality[3] ],
	[4] = QualityColorConfig[ PropertyToQuality[4] ],
	[5] = QualityColorConfig[ PropertyToQuality[5] ],
	[6] = QualityColorConfig[ PropertyToQuality[6] ],
	[7] = QualityColorConfig[ PropertyToQuality[7] ],
	[8] = QualityColorConfig[ PropertyToQuality[8] ],
	[9] = QualityColorConfig[ PropertyToQuality[9] ],
	[10] = QualityColorConfig[ PropertyToQuality[10] ],
};
--护身保甲dwLevel字段对应的颜色配置，Tips系统使用的是这里的配置
_G.AmuletPropertyColorConfig = {
	--颜色与文字
	[0] = QualityColorConfig[ AmuletPropertyToQuality[0] ],
	[1] = QualityColorConfig[ AmuletPropertyToQuality[1] ],
	[2] = QualityColorConfig[ AmuletPropertyToQuality[2] ],
	[3] = QualityColorConfig[ AmuletPropertyToQuality[3] ],
	[4] = QualityColorConfig[ AmuletPropertyToQuality[4] ],
	[5] = QualityColorConfig[ AmuletPropertyToQuality[5] ],
	[6] = QualityColorConfig[ AmuletPropertyToQuality[6] ],
	[7] = QualityColorConfig[ AmuletPropertyToQuality[7] ],
	[8] = QualityColorConfig[ AmuletPropertyToQuality[8] ],
	[9] = QualityColorConfig[ AmuletPropertyToQuality[9] ],
	[10] = QualityColorConfig[ AmuletPropertyToQuality[10] ],
};
--情侣信物dwLevel字段对应的颜色配置，Tips系统使用的是这里的配置
_G.KeepsakePropertyColorConfig = {
	--颜色与文字
	[0] = QualityColorConfig[ KeepsakePropertyToQuality[0] ],
	[1] = QualityColorConfig[ KeepsakePropertyToQuality[1] ],
	[2] = QualityColorConfig[ KeepsakePropertyToQuality[2] ],
	[3] = QualityColorConfig[ KeepsakePropertyToQuality[3] ],
	[4] = QualityColorConfig[ KeepsakePropertyToQuality[4] ],
	[5] = QualityColorConfig[ KeepsakePropertyToQuality[5] ],
	[6] = QualityColorConfig[ KeepsakePropertyToQuality[6] ],
	[7] = QualityColorConfig[ KeepsakePropertyToQuality[7] ],
	[8] = QualityColorConfig[ KeepsakePropertyToQuality[8] ],
	[9] = QualityColorConfig[ KeepsakePropertyToQuality[9] ],
	[10] = QualityColorConfig[ KeepsakePropertyToQuality[10] ],
};

--添加附加属性类型到min和max字符串的索引
_G.PropertyTypeToMinMax = 
{
	[enPropertyType.eAttackPower] = { "dwMinPower", "dwMaxPower" },
	[enPropertyType.eDefence] = { "dwMinDefence", "dwMaxDefence" },
	[enPropertyType.eBaoJi] = { "dwMinBaoJi", "dwMaxBaoJi" },
	[enPropertyType.eShenFa] = { "dwMinShenFa", "dwMaxShenFa" },
	[enPropertyType.eHPLimited] = { "dwMinHPLimited", "dwMaxHPLimited" },
	[enPropertyType.eMPLimited] = { "dwMinMPLimited", "dwMaxMPLimited" },
	[enPropertyType.eSubDamage] = { "dwMinSubDamage", "dwMaxSubDamage" },
	[enPropertyType.eAttackSpeed] = { nil, nil },
	[enPropertyType.eMoveSpeed] = { nil, nil },
};

_G.EquipAppendConfig = 
{
	--普通装备附加信息
	[1]={dwPropertyID=1,dwAppendType=0,dwMinPower=3,dwMaxPower=14,dwMinDefence=2,dwMaxDefence=10,dwMinShenFa=2,dwMaxShenFa=8,dwMinBaoJi=1,dwMaxBaoJi=7,dwMinHPLimited=10,dwMaxHPLimited=42,dwMinMPLimited=5,dwMaxMPLimited=22,dwMinSubDamage=0,dwMaxSubDamage=0,dwMaxGrowth=0,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[2]={dwPropertyID=2,dwAppendType=0,dwMinPower=5,dwMaxPower=22,dwMinDefence=3,dwMaxDefence=15,dwMinShenFa=3,dwMaxShenFa=13,dwMinBaoJi=2,dwMaxBaoJi=11,dwMinHPLimited=16,dwMaxHPLimited=66,dwMinMPLimited=9,dwMaxMPLimited=38,dwMinSubDamage=0,dwMaxSubDamage=0,dwMaxGrowth=0,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[3]={dwPropertyID=3,dwAppendType=0,dwMinPower=7,dwMaxPower=30,dwMinDefence=5,dwMaxDefence=20,dwMinShenFa=4,dwMaxShenFa=18,dwMinBaoJi=3,dwMaxBaoJi=15,dwMinHPLimited=22,dwMaxHPLimited=90,dwMinMPLimited=13,dwMaxMPLimited=54,dwMinSubDamage=0,dwMaxSubDamage=0,dwMaxGrowth=0,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[4]={dwPropertyID=4,dwAppendType=0,dwMinPower=10,dwMaxPower=42,dwMinDefence=6,dwMaxDefence=26,dwMinShenFa=5,dwMaxShenFa=23,dwMinBaoJi=5,dwMaxBaoJi=21,dwMinHPLimited=31,dwMaxHPLimited=126,dwMinMPLimited=19,dwMaxMPLimited=78,dwMinSubDamage=0,dwMaxSubDamage=0,dwMaxGrowth=0,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[5]={dwPropertyID=5,dwAppendType=0,dwMinPower=14,dwMaxPower=56,dwMinDefence=8,dwMaxDefence=33,dwMinShenFa=7,dwMaxShenFa=30,dwMinBaoJi=7,dwMaxBaoJi=28,dwMinHPLimited=42,dwMaxHPLimited=168,dwMinMPLimited=26,dwMaxMPLimited=106,dwMinSubDamage=0,dwMaxSubDamage=0,dwMaxGrowth=0,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[6]={dwPropertyID=6,dwAppendType=0,dwMinPower=17,dwMaxPower=70,dwMinDefence=10,dwMaxDefence=40,dwMinShenFa=9,dwMaxShenFa=37,dwMinBaoJi=8,dwMaxBaoJi=35,dwMinHPLimited=52,dwMaxHPLimited=210,dwMinMPLimited=33,dwMaxMPLimited=134,dwMinSubDamage=0,dwMaxSubDamage=0,dwMaxGrowth=0,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[7]={dwPropertyID=7,dwAppendType=0,dwMinPower=22,dwMaxPower=88,dwMinDefence=12,dwMaxDefence=50,dwMinShenFa=11,dwMaxShenFa=46,dwMinBaoJi=11,dwMaxBaoJi=44,dwMinHPLimited=66,dwMaxHPLimited=264,dwMinMPLimited=42,dwMaxMPLimited=170,dwMinSubDamage=0,dwMaxSubDamage=0,dwMaxGrowth=0,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	--护身宝甲相关的附加属性值
	[1500010]={dwPropertyID=1500010,dwAppendType=1,dwMinPower=0,dwMaxPower=0,dwMinDefence=0,dwMaxDefence=30,dwMinShenFa=0,dwMaxShenFa=0,dwMinBaoJi=0,dwMaxBaoJi=0,dwMinHPLimited=0,dwMaxHPLimited=220,dwMinMPLimited=0,dwMaxMPLimited=0,dwMinSubDamage=0,dwMaxSubDamage=0,dwMaxGrowth=18000,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[1500020]={dwPropertyID=1500020,dwAppendType=1,dwMinPower=0,dwMaxPower=100,dwMinDefence=30,dwMaxDefence=60,dwMinShenFa=0,dwMaxShenFa=0,dwMinBaoJi=0,dwMaxBaoJi=0,dwMinHPLimited=220,dwMaxHPLimited=440,dwMinMPLimited=0,dwMaxMPLimited=0,dwMinSubDamage=0,dwMaxSubDamage=0,dwMaxGrowth=50000,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[1500030]={dwPropertyID=1500030,dwAppendType=1,dwMinPower=100,dwMaxPower=250,dwMinDefence=60,dwMaxDefence=120,dwMinShenFa=0,dwMaxShenFa=0,dwMinBaoJi=0,dwMaxBaoJi=0,dwMinHPLimited=440,dwMaxHPLimited=960,dwMinMPLimited=0,dwMaxMPLimited=0,dwMinSubDamage=0,dwMaxSubDamage=0,dwMaxGrowth=200000,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[1500040]={dwPropertyID=1500040,dwAppendType=1,dwMinPower=250,dwMaxPower=680,dwMinDefence=120,dwMaxDefence=280,dwMinShenFa=0,dwMaxShenFa=0,dwMinBaoJi=0,dwMaxBaoJi=80,dwMinHPLimited=960,dwMaxHPLimited=1920,dwMinMPLimited=0,dwMaxMPLimited=0,dwMinSubDamage=0,dwMaxSubDamage=100,dwMaxGrowth=1000000,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[1500050]={dwPropertyID=1500050,dwAppendType=1,dwMinPower=680,dwMaxPower=1400,dwMinDefence=280,dwMaxDefence=620,dwMinShenFa=0,dwMaxShenFa=0,dwMinBaoJi=80,dwMaxBaoJi=140,dwMinHPLimited=1920,dwMaxHPLimited=4000,dwMinMPLimited=0,dwMaxMPLimited=0,dwMinSubDamage=100,dwMaxSubDamage=200,dwMaxGrowth=8000000,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[1500060]={dwPropertyID=1500060,dwAppendType=1,dwMinPower=1400,dwMaxPower=2600,dwMinDefence=620,dwMaxDefence=1250,dwMinShenFa=0,dwMaxShenFa=0,dwMinBaoJi=140,dwMaxBaoJi=300,dwMinHPLimited=4000,dwMaxHPLimited=9600,dwMinMPLimited=0,dwMaxMPLimited=0,dwMinSubDamage=200,dwMaxSubDamage=300,dwMaxGrowth=40000000,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
	[1500070]={dwPropertyID=1500070,dwAppendType=1,dwMinPower=2600,dwMaxPower=4800,dwMinDefence=1250,dwMaxDefence=2380,dwMinShenFa=0,dwMaxShenFa=0,dwMinBaoJi=300,dwMaxBaoJi=540,dwMinHPLimited=9600,dwMaxHPLimited=22800,dwMinMPLimited=0,dwMaxMPLimited=0,dwMinSubDamage=300,dwMaxSubDamage=500,dwMaxGrowth=200000000,dwBuff1=0,dwBuff2=0,dwBuff3=0,dwBuff4=0,dwBuff=0,},
};

--装备掉落的附加属性值随机范围，随机值从 0~100W
_G.EquipAppendDropConfig = {
	RandomMax = 650000;--百分比按照 RandomMax/100W 计算，最终值为EquipAppendConfig 的 Max*百分比
};









