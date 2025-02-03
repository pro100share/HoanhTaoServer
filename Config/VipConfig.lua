_G.VipMsgConfig = 
{
	--TimeOver = 1,
	BeVip = 2,
	
	GetItem = 3,
	
	GetItemSure = 4,
	GetItemNoPack = 5,
	
	BeVip = 6,
	
	UniCast  = 7,
}




_G.VipConfig = 
{
    VipBuffId = 8888, 
    VipBtnLv = 20,   ---VIP按钮多少级前隐藏
	--VIP卡配置
	--dwTime 增加时间 单位：秒
	--dwTransNum 增加传送次数
	VipItemList = 
	{
		[1] = {dwItemEnum = 5920004,dwBindType = 1,dwItemNumber = 1},
		[2] = {dwItemEnum = 5910003,dwBindType = 1,dwItemNumber = 1},
		[3] = {dwItemEnum = 9405010,dwBindType = 1,dwItemNumber = 2},
		[4] = {dwItemEnum = 2400110,dwBindType = 1,dwItemNumber = 1},
	},
	VipCard = 
	{
		---{dwItemEnum = 5500080,dwTime = 24*60*60*1000,dwTransNum = 10,},
	--	{dwItemEnum = 5500040,dwTime = 3*24*60*60*1000,dwTransNum = 10,},
		{dwItemEnum = 5500040,dwTime = 30*24*60*60*1000,dwTransNum = 10,},
	--	{dwItemEnum = 5500040,dwTime = 604800,dwTransNum = 10,},
		{dwItemEnum = 5500050,dwTime = 90*24*60*60*1000,dwTransNum = 50,},
		{dwItemEnum = 5500060,dwTime = 180*24*60*60*1000,dwTransNum = 200,},
		{dwItemEnum = 5500041,dwTime = 2*60*60*1000,dwTransNum = 0,},
	},
	--功能描述配置
	VipLabelName = 
	{
		"1.立即开启随身商店",
		"2.立即开启随身仓库",
		"3.VIP专享<font color='#65aaff'>免费跨地图传送</font>",
		"4.VIP专享<font color='#65aaff'>一键自动打造装备</font>",	
		"5.VIP专享挂机中<font color='#65aaff'>宝甲自动熔炼</font>",		
		"1.VIP专享<font color='#65aaff'>额外积攒1颗煞元</font>",
		"2.VIP专享<font color='#65aaff'>一键挖宝</font>",
		"3.VIP专享<font color='#65aaff'>签到额外奖励</font>",		
		"1.专享演武真气收益<font color='#65aaff'>提高1.2倍</font>",
		"2.VIP打怪额外经验<font color='#65aaff'>加成1.2倍</font>",
		"3.经脉经验分享额外<font color='#65aaff'>增加12次</font>",
		"4.VIP专享闭关聚气<font color='#65aaff'>24次</font>",
	
	--	'13.进入各个副本活动次数每日增加1次',
	},
	VipLimitTime = 6*60*60*1000,
	VipPic = 'VIPLOGO.png',
	Attri = {dwAttack = 150,dwDefense = 80,dwFlee=0,dwCrit=0,dwHPMax=700,dwMPMax=0};
	AddAttr = 
	{
		dwHPMax = "生命",
		dwMPMax = "内力",
		dwAttack = "攻击",
		dwDefense = "防御",
		dwFlee = "身法",
		dwCrit ="暴击",
	},	
	GiftList =
	{
		[6500570] ={"总收益价值5640元宝！","3000万","3000","60颗","30颗"},
		[6500580] ={"总收益价值16920元宝！","9000万","9000","180颗","90颗"},
		[6500590] ={"总收益价值33840元宝！","1亿8千万","18000","360颗","180颗"},
	},
}
