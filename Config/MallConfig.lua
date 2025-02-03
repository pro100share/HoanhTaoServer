
_G.MallMsgConfig = 
{
	BuySuccessByGold = 1,
	BuySuccessByBindGold = 2,
	NoPack = 3,
	NoGold = 4,
	NoBindGold = 5,
	NoMallValue = 6,
	NoUp = 7,
	PriceChange = 8
}


---------------------------------
--------商城配置表---------------
---------------------------------

--[[
	dwItemEnum ,物品配置ID
	bIsHot，是否热卖
	dwDiscount，折扣
	dwPriceType，销售类型   见_G.MallSellTypeConfig
	dwPrice，出售价格
	dwBindType,是否绑定，见Config\ItemConfig\ItemSystemEnum.lua里的enItemBindType
	bIsSale，是否上架
	]]--


_G.MallSellTypeConfig = 
{
	eMoney = 0,--银两
	eGold = 1,--元宝
	eBindGold = 2,--绑定元宝
	eMallValue = 3,--尊贵度
}
_G.MallItemNumPerPage = 1
_G.MallParamConfig = 
{
	ChargeLink = "http://10.1.104.198/bugfree/site/login",
}
--商城分类
_G.MallItemTypeConfig = 
{
--常用类
	Normal = 1,
--药品类
	Drug = 2,
--坐骑类
	Vehicle = 3,
--变强类
	Equip = 4,
--宝石类
	Stone = 5,
--活动类
	Active = 6,
--礼金类
	BindGold = 7,
--暗格类
	Ange = 8,
--抢购类
	Limit = 9,
--时间类
    Time = 10
}
_G.MallConfigParam = 
{
	GoldTips = 
	{
		12000150001,
		12000150002,
		12000150003,
	},
	picConfig = 
	{
		Gold = '',
		BindGold = ''
	},
	CurPage = MallItemTypeConfig.Active,
}

-- 商城配置
_G.MallConfig = 
{
	-- 商品文件路径
	GoodsFile = "../Data/Mall/Goods.csv";
	Goods = {
                {id=1,type=1,Order=1,dwItemEnum=4100503,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=3,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=2,type=1,Order=2,dwItemEnum=2400110,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=25,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=3,type=1,Order=3,dwItemEnum=2500072,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=40,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=4,type=1,Order=4,dwItemEnum=2500082,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=40,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=5,type=1,Order=5,dwItemEnum=2500069,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=25,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=6,type=1,Order=6,dwItemEnum=2400260,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=40,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=7,type=1,Order=7,dwItemEnum=2400210,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=20,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=8,type=1,Order=8,dwItemEnum=5500010,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=25,dwBindType=0,bIsSale=1,dwlevel=15,},
				{id=9,type=1,Order=9,dwItemEnum=5500020,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=50,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=10,type=1,Order=10,dwItemEnum=5500030,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=10,dwBindType=0,bIsSale=1,dwlevel=25,},
				{id=11,type=1,Order=11,dwItemEnum=4100010,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=12,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=12,type=1,Order=12,dwItemEnum=2500030,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=50,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=13,type=1,Order=13,dwItemEnum=2400000,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=70,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=14,type=1,Order=14,dwItemEnum=2400010,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=70,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=15,type=1,Order=15,dwItemEnum=5500080,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=500,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=16,type=1,Order=16,dwItemEnum=2500090,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=25,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=17,type=1,Order=17,dwItemEnum=5500040,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=700,dwBindType=0,bIsSale=0,dwlevel=1,},
				{id=18,type=1,Order=18,dwItemEnum=2500320,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=70,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=19,type=1,Order=19,dwItemEnum=5500083,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=2000,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=20,type=1,Order=20,dwItemEnum=5501180,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=500,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=21,type=1,Order=21,dwItemEnum=5500085,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=70,dwBindType=0,bIsSale=1,dwlevel=1,},
				
				{id=1,type=4,Order=1,dwItemEnum=4100521,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=5,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=2,type=4,Order=2,dwItemEnum=4100516,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=50,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=3,type=4,Order=3,dwItemEnum=4100517,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=100,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=4,type=4,Order=4,dwItemEnum=2500190,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=50,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=5,type=4,Order=5,dwItemEnum=4100502,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=25,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=6,type=4,Order=6,dwItemEnum=4100501,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=50,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=7,type=4,Order=7,dwItemEnum=9405010,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=70,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=8,type=4,Order=8,dwItemEnum=4100410,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=70,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=9,type=4,Order=9,dwItemEnum=4100430,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=50,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=10,type=4,Order=10,dwItemEnum=2500331,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=70,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=11,type=4,Order=11,dwItemEnum=4100210,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=20,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=12,type=4,Order=12,dwItemEnum=4100290,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=20,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=13,type=4,Order=13,dwItemEnum=4100140,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=25,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=14,type=4,Order=14,dwItemEnum=2500050,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=50,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=15,type=4,Order=15,dwItemEnum=4100080,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=25,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=16,type=4,Order=16,dwItemEnum=4100110,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=60,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=17,type=4,Order=17,dwItemEnum=3900010,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=5,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=18,type=4,Order=18,dwItemEnum=4100120,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=120,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=19,type=4,Order=19,dwItemEnum=4100130,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=70,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=20,type=4,Order=20,dwItemEnum=4100451,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=50,dwBindType=0,bIsSale=1,dwlevel=1,},
				{id=21,type=4,Order=21,dwItemEnum=4100514,bIsHot=0,dwDiscount=1,dwPriceType=1,dwPrice=120,dwBindType=0,bIsSale=1,dwlevel=1,},
				
				{id=1,type=7,Order=1,dwItemEnum=2400110,bIsHot=1,dwDiscount=1,dwPriceType=2,dwPrice=120,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=2,type=7,Order=2,dwItemEnum=2500072,bIsHot=1,dwDiscount=1,dwPriceType=2,dwPrice=170,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=3,type=7,Order=3,dwItemEnum=2500082,bIsHot=1,dwDiscount=1,dwPriceType=2,dwPrice=170,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=4,type=7,Order=4,dwItemEnum=2500069,bIsHot=1,dwDiscount=1,dwPriceType=2,dwPrice=120,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=5,type=7,Order=5,dwItemEnum=9405010,bIsHot=1,dwDiscount=1,dwPriceType=2,dwPrice=350,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=6,type=7,Order=6,dwItemEnum=4100140,bIsHot=1,dwDiscount=1,dwPriceType=2,dwPrice=120,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=7,type=7,Order=7,dwItemEnum=4100410,bIsHot=1,dwDiscount=1,dwPriceType=2,dwPrice=350,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=8,type=7,Order=8,dwItemEnum=5500020,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=250,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=9,type=7,Order=9,dwItemEnum=2400260,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=150,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=10,type=7,Order=10,dwItemEnum=2400210,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=100,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=11,type=7,Order=11,dwItemEnum=5500030,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=40,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=12,type=7,Order=12,dwItemEnum=4100010,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=60,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=13,type=7,Order=13,dwItemEnum=2500030,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=250,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=14,type=7,Order=14,dwItemEnum=2400000,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=300,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=15,type=7,Order=15,dwItemEnum=2400010,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=300,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=16,type=7,Order=16,dwItemEnum=2500090,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=120,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=17,type=7,Order=17,dwItemEnum=4100120,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=600,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=18,type=7,Order=18,dwItemEnum=3900010,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=25,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=19,type=7,Order=19,dwItemEnum=5500010,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=120,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=20,type=7,Order=20,dwItemEnum=4100130,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=330,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=21,type=7,Order=21,dwItemEnum=2500050,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=250,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=22,type=7,Order=22,dwItemEnum=4100110,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=300,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=23,type=7,Order=23,dwItemEnum=5500080,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=2500,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=24,type=7,Order=24,dwItemEnum=4100080,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=120,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=25,type=7,Order=25,dwItemEnum=2400020,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=330,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=26,type=7,Order=26,dwItemEnum=2400030,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=330,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=27,type=7,Order=27,dwItemEnum=2500040,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=250,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=28,type=7,Order=28,dwItemEnum=4100210,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=250,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=29,type=7,Order=29,dwItemEnum=4100070,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=120,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=30,type=7,Order=30,dwItemEnum=4100040,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=120,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=31,type=7,Order=31,dwItemEnum=4100150,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=120,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=32,type=7,Order=32,dwItemEnum=2500180,bIsHot=0,dwDiscount=1,dwPriceType=2,dwPrice=2500,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=33,type=7,Order=33,dwItemEnum=5500040,bIsHot=1,dwDiscount=1,dwPriceType=2,dwPrice=3000,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=34,type=7,Order=34,dwItemEnum=5500050,bIsHot=1,dwDiscount=1,dwPriceType=2,dwPrice=2500,dwBindType=1,bIsSale=0,dwlevel=1,},
				{id=35,type=7,Order=35,dwItemEnum=5500060,bIsHot=1,dwDiscount=1,dwPriceType=2,dwPrice=7000,dwBindType=1,bIsSale=0,dwlevel=1,},
				
				{id=1,type=6,Order=1,dwItemEnum=6500570,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=18800,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=2,type=6,Order=2,dwItemEnum=6500580,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=28880,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=3,type=6,Order=3,dwItemEnum=6500590,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=59800,dwBindType=1,bIsSale=1,dwlevel=1,},
				{id=4,type=6,Order=4,dwItemEnum=8113004,bIsHot=1,dwDiscount=1,dwPriceType=1,dwPrice=200,dwBindType=1,bIsSale=1,dwlevel=1,},
	};
	
	-- DiscountBuff 老玩家回归buff
	-- MallDiscount 商城打折
	OldManBuff = {
		[130000] = {MallDiscount = 0.5};
		[130001] = {MallDiscount = 0.5};
		[130002] = {MallDiscount = 0.5};
	};
}

_G.MallOtherConfig = {}
_G.MallBindGoldConfig = {}
_G.MallTypeConfig = {}

--限购的配置
_G.MallLimitCOnfig = 
{
	--Data里面的抢购配置文件路径
	CfgFile = "../Data/PanicBuying/Config.lua";
	
	--刷新时间点
	ResetTime = 
	{
		"00:01";
		"01:01";
		"02:01";
		"03:01";
		"04:01";
		"05:01";
		"06:01";
		"07:01";
		"08:01";
		"09:01";
		"10:01";
		"11:01";
		"12:01";
		"13:01";
		"14:01";
		"15:01";
		"16:01";
		"17:01";
		"18:01";
		"19:01";
		"20:01";
		"21:01";
		"22:01";
		"23:01";
	};
	
	--返回商城界面上显示倒计时的wordid
	funcGetShowWordID = function(dwHour)
		if dwHour >=6 then
		return 12000110008;    --白色
		elseif dwHour >= 1 then
		return 12000110006;    --黄色
		else
	    return 12000110007;    --红色
		end
	end;
}

--商城抽奖
_G.MallDrawConfig = 
{
	--Data里面的商城抽奖配置文件路径
	CfgFile = "../Data/PanicBuying/LuckDraw.lua";
	--玩法说明
	Text = {
		StrNo1  = T"元宝不足,无法购买"; 
		StrNo2  = T"礼金不足,无法购买"; 
		StrNo3  = T"请选择要购买的物品"; 
		StrNo4  = T"当前物品已经购买请选择其他物品！"; 
		StrNo5  = T"包裹空间不足无法购买"; 
		StrRule = T"1.<font color='#FFFF00'>每日一次</font>试试手气机会<br>2.每种物品每日最多可购买一次<br>3.<font color='#FFFF00'>每日0点刷新</font>试试手气和购买按钮";
		StrTry  = T"试试手气（%s）";
		StrBuy  = T"你确定要花费<font color='#FF9912'>%s</font>,购买<font color='#FF9912'>%d</font>个<font color='#FF9912'>%d</font>折的<font color='#FF9912'>%s</font>吗？";
		StrG1   = T"元宝";
		StrG2   = T"礼金";
		Img1    = "img://999_1.png"		--问号图片
	};
	--刷新时间点
	ResetTime = 
	{
		"00:00";
	};
	
	--每天最大刷新次数
	FunRefreshNumber = function()
		return 1;
	end;
	
	--5个位置对应的折扣
	tbDiscount = 
	{
		[1] = 0.4;
		[2] = 0.5;
		[3] = 0.6;
		[4] = 0.7;
		[5] = 0.8;
	};
	
	--五个位置对应的抽取算法
	tbFunChooseLuckDraw = 
	{
		[1] = function(tbAllList)
			local tbWeightList = {};
			
			--算总权重值
			local dwAllWeight = 0;
			for k,tbDraw in pairs(tbAllList)do
				dwAllWeight = dwAllWeight + tbDraw.dwWeight;
				
				tbWeightList[k] = dwAllWeight;
			end
			
			--取随机数
			local dwRnd = math.random(dwAllWeight);
			
			local dwChooseIndex = 0;
			for k,dwWeight in pairs(tbWeightList)do
				if dwRnd <= dwWeight then
					dwChooseIndex = k;
					break;
				end
			end
			
			local  tbResult = tbAllList[dwChooseIndex];
			
			return tbResult;
		end;
		[2] = function(tbAllList)
			local tbWeightList = {};
			
			--算总权重值
			local dwAllWeight = 0;
			for k,tbDraw in pairs(tbAllList)do
				dwAllWeight = dwAllWeight + tbDraw.dwWeight;
				
				tbWeightList[k] = dwAllWeight;
			end
			
			--取随机数
			local dwRnd = math.random(dwAllWeight);
			
			local dwChooseIndex = 0;
			for k,dwWeight in pairs(tbWeightList)do
				if dwRnd <= dwWeight then
					dwChooseIndex = k;
					break;
				end
			end
			
			local  tbResult = tbAllList[dwChooseIndex];
			
			return tbResult;
		end;
		[3] = function(tbAllList)
			local tbWeightList = {};
			
			--算总权重值
			local dwAllWeight = 0;
			for k,tbDraw in pairs(tbAllList)do
				dwAllWeight = dwAllWeight + tbDraw.dwWeight;
				
				tbWeightList[k] = dwAllWeight;
			end
			
			--取随机数
			local dwRnd = math.random(dwAllWeight);
			
			local dwChooseIndex = 0;
			for k,dwWeight in pairs(tbWeightList)do
				if dwRnd <= dwWeight then
					dwChooseIndex = k;
					break;
				end
			end
			
			local  tbResult = tbAllList[dwChooseIndex];
			
			return tbResult;
		end;
		[4] = function(tbAllList)
			local tbWeightList = {};
			
			--算总权重值
			local dwAllWeight = 0;
			for k,tbDraw in pairs(tbAllList)do
				dwAllWeight = dwAllWeight + tbDraw.dwWeight;
				
				tbWeightList[k] = dwAllWeight;
			end
			
			--取随机数
			local dwRnd = math.random(dwAllWeight);
			
			local dwChooseIndex = 0;
			for k,dwWeight in pairs(tbWeightList)do
				if dwRnd <= dwWeight then
					dwChooseIndex = k;
					break;
				end
			end
			
			local  tbResult = tbAllList[dwChooseIndex];
			
			return tbResult;
		end;
		[5] = function(tbAllList)
			local tbWeightList = {};
			
			--算总权重值
			local dwAllWeight = 0;
			for k,tbDraw in pairs(tbAllList)do
				dwAllWeight = dwAllWeight + tbDraw.dwWeight;
				
				tbWeightList[k] = dwAllWeight;
			end
			
			--取随机数
			local dwRnd = math.random(dwAllWeight);
			
			local dwChooseIndex = 0;
			for k,dwWeight in pairs(tbWeightList)do
				if dwRnd <= dwWeight then
					dwChooseIndex = k;
					break;
				end
			end
			
			local  tbResult = tbAllList[dwChooseIndex];
			
			return tbResult;
		end;
	}
}

_G.MallLimitName2Key = 
{
	dwID = 1;
	dwEnumID = 2,
	dwNumber = 3,
	dwPriceType = 4,
	dwPrice = 5,
	dwBindType = 6,
	dwHotFlag = 7,
	dwDiscount = 8,
	dwType = 9,
	dwLength = 10,
	dwBeginDay = 11,
	
	dwBuyFlag = 12;
}
_G.MalllimitKey2Name = {};
for k,v in pairs(MallLimitName2Key)do
	MalllimitKey2Name[v] = k;
end


--模型状态 （无需配置）
_G.eState = {Stay = 1,BuyByLiJin = 2,BuyByYuanBao = 3, TiaoXiYiXia = 4}
--模型配置
_G.MallModelConfig = 
{
	-- 调戏一下按钮模型动作id
	szUIType = 'UIShop',					
	model = {	
					sknFile = ResNpcModelConfig.Skns[10021051].szFile, 
					sklFile= ResNpcModelConfig.Skls[10021051].szFile, 
					sanFile = ResNpcModelConfig.Sans[1002105101].szFile,
					param_1_x = -0.1, param_1_y =-9.4, param_1_z = 1.5,param_2_x = -0.2, param_2_y = -0.8; param_2_z = -0.8,
					lieAction = ResNpcModelConfig.Sans[1002105102].szFile,
					AvatarRect = {x = 1024, y = 1800},
				},																			--模型
			
	--聊天泡泡显示时间(毫秒)
	dwShowTalkTime = 5000,
	--聊天泡泡显示间隔(毫秒)
	dwShowTalkInterval = 3000,
	
	[eState.Stay] = { 	
						szTalk = {															--聊天内容
									T"客官，本店本周新到一批货物，走过路过不要错过！",
									T"客官，大侠之路从这里起步哦！",
									T"客官好~嘻嘻，我这儿都是好东西，其他地方可买不着！",
								},
						action = {{pfxId = 0,bindPos ="dummy01",dwActionID = 1002105102},							--模型动作及特效
								},	
						},
	[eState.BuyByLiJin] = { 	
							szTalk = {
									T'客官好~嘻嘻，我这儿都是好东西，其他地方可买不着！',
									T'客官再往这边看看，不再挑几样么？',
								},
							action = {{pfxId = 0,bindPos ="dummy01",dwActionID = 1002105102},								--模型动作
									},	
						},
	[eState.BuyByYuanBao] = { 	
								szTalk = {
									T'客官好~嘻嘻，我这儿都是好东西，其他地方可买不着！',
									T'客官再往这边看看，不再挑几样么？',
									},
							action = {{pfxId = 0,bindPos ="dummy01",dwActionID = 1002105102},								--模型动作
									},	
						},
	[eState.TiaoXiYiXia] = { 	
								szTalk = {
									T'哇，一瞧客官就不是普通人，出手也必定大方！这几样便宜的不要，其他都给您包起来？'
									},
							action = {{pfxId = 0,bindPos ="dummy01",dwActionID = 1002105102},								--模型动作
									},	
						}
}



