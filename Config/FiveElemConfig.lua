--得到當前調和進度條上限
function _G.FiveElemGetBalanceMax()
	local j,m,s,h,t = CFiveElemSystem:GetValue()
	local all = j + m + s +h + t;
	if all > 500000 then
		return 1000000;
	else
		return 100000;
	end
end
--得到五行状态名
--参数:五行等级，五行类别
--返回:五行状态名（附加颜色）
function _G.FiveElemGetNameStr(lv,_type)
	if _type == _G.enumFiveElemType.Metal then
		local MetalName 
		if lv<10 then
			MetalName = ""
		elseif lv<20 then
			MetalName = ""
		elseif lv<30 then
			MetalName = ""
		else
			MetalName = ""
		end
		
		return "<p><font color= '#FDF445'>"..MetalName.."</font></p>"
	end
	if _type == _G.enumFiveElemType.Wood then
		local WoodName 
		if lv<10 then
			WoodName = ""
		elseif lv<20 then
			WoodName = ""
		elseif lv<30 then
			WoodName = ""
		else
			WoodName = ""
		end
		return "<p><font color= '#6BDD65'>"..WoodName.."</font></p>"
	end
	if _type == _G.enumFiveElemType.Water then
	    local WaterName 
		if lv<10 then
			WaterName = ""
		elseif lv<20 then
			WaterName = ""
		elseif lv<30 then
			WaterName = ""
		else
			WaterName = ""
		end
		return "<p><font color= '#6CE7EE'>"..WaterName.."</font></p>"
	end
	if _type == _G.enumFiveElemType.Fire then
		local FireName 
		if lv<10 then
			FireName = ""
		elseif lv<20 then
			FireName = ""
		elseif lv<30 then
			FireName = ""
		else
			FireName = ""
		end
		return "<p><font color= '#DD4747'>"..FireName.."</font></p>"
	end
	if _type == _G.enumFiveElemType.Earth then
		local EarthName 
		if lv<10 then
			EarthName = ""
		elseif lv<20 then
			EarthName = ""
		elseif lv<30 then
			EarthName = ""
		else
			EarthName = ""
		end
		return "<p><font color= '#D9671B'>"..EarthName.."</font></p>"
	end
	if _type == _G.enumFiveElemType.Dantian then
		local DantianName 
		if lv<10 then
			DantianName = ""
		elseif lv<20 then
			DantianName = ""
		elseif lv<30 then
			DantianName = ""
		else
			DantianName = ""
		end
		return "<p><font color= '#cdc6c4'>"..DantianName.."</font></p>"
	end
end
_G.ConfigElemMsg = 
{
	DantianNotice = 1,
	NoZhenqi = 2,
	NoLevel = 3,
	LevelUp = 4,
	PushFull = 5,
	PushOut = 6,
	PushComplete = 7,
	ConvertComplete = 8,
	Failed = 9,
	Suit = 10,
	NotMate = 11, --调和不匹配
	
	-----------------
	ConvertElem = 101,
	PopElem = 102,
	PopCoerceElem = 103,
	PalanceSuccess = 104,
}
_G.enumFiveElemType = 
{
	Metal = 1001,
	Wood = 1002,
	Water = 1003,
	Fire = 1004,
	Earth = 1005,
	Dantian = 1006,
}
_G.ConfigElemTimeItem = 
{
	Metal = 2300110,	--疾续丹-金
	Wood = 2300120,	--疾续丹-木
	Water = 2300130,	--疾续丹-水
	Fire = 2300140,	--疾续丹-火
	Earth = 2300150,	--疾续丹-土
}
-------------------------------------
-----配置和公式
-------------------------------------
_G.ConfigElemDrug = 
{
	2300000,--	加真气-五行都加  3000
	2300010,--	加真气-金   1000
	2300020,--	加真气-木	1000
	2300030,--	加真气-水	1000
	2300040,--	加真气-火	1000
	2300050,--	加真气-土	1000
} --加真气药品
--[[
系统：五行调和系统配置
--]]
--五行顺序
_G.FiveElementKey ={ 'dwMetalValue', 'dwWoodValue', 'dwWaterValue', 'dwFireValue', 'dwEarthValue'}
--五行配置
_G.FiveElementConsonanceConfig = 
{
	--调和进度条最大值
	dwElementMax = 100000,
	--调和进度条最小值
	dwElementMin = 0,
	--调和单量
	dwSnapInterval = 1,
	--兑换率
	exchange = 0.8,
	--调和最小值限制
	dwLimitMin = 100,
	--消耗道具ID
	dwItemID = 2500180,
	--消耗道具数量
	dwItemNum = 1,
	--进度tip显示格式
	szTipSize = '已分配: %s \n剩余分配: %s',
	--主窗口道具名格式
	--普通
	szItemName = "<u><font color='#31cf32'>%s</u></font>",
	--显红
	szItemNameRed = "<u><font color='#31cf32'>%s</u></font>",
	
	--材料窗口道具名格式
	--普通
	szStuffItemName = '%s',
	--显红
	szStuffItemNameRed = "<font color='#f15d27'>%s</font>",
	
	--进度初始状态(没有配或等于nil及显示原有真气状态)
	--公式 = dwElementMax * szFirstState
	szFirstState = 0,
	
	--调和成功执行函数(客户端)
	fSucceeded = function()
		CFiveElementConsonanceSystem:Hide();
	end;
	
	--错误提示文本
	szNotice = { 
					---执行调和
					--真气少于调和最小值
					szLackElem = SysStringConfigInfo[3000510012],
					--真气已满
					szFullElem = SysStringConfigInfo[3000510032],
					--真气未分配完
					szNotAdjust = SysStringConfigInfo[3000510015],
					--缺少道具
					szLackItem = SysStringConfigInfo[3000510014],
					--真气未发生改变
					szNotChange = '真气未改变！',
					
					---调和成功
					--有损调和
					szSucceedLack = SysStringConfigInfo[3000510013],
					--完整调和
					szSucceedSum = SysStringConfigInfo[3000510030],
					---调和失败
					--溢出或者不足
					szFailure = SysStringConfigInfo[3000510031],
				},
				
	--材料描述及链接
	szStuffDescribe = "<font color='#DCB857'>获得途径：</font><br/><font color='#D9CCBD'>1.击杀野怪或BOSS有几率掉落 ".."<U><a href = 'asfunction:hrefevent,CUIMissionDailyEx:OpenPanel(3)'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
		"2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,CUIDuplWnd:OpenWnd()'><font color='#0dab01'>立即前往</font></a></U><br/>3.更多获取途径请查看<font color='#278cf1'>五行调和丹</font>物品描述";
}
--参数
_G.ConfigFiveElemParam =
{
	dwClientMax = 100000;
	dwLimitLv = 30,
	colorPlace = '#0dab01',
	IconLimitLv = 100,--飞图标限制等级
	ZhenqiLimit = 5000,--真气灌注值
	TimeCount = 1500,--灌注时间
	ConvertItemEnum = 2300170,-- 五行石
	BalanceItemEnum = 2500180,-- 五行调和丹
	BalanceItemNum = 1,-- 五行调和丹消耗数量
	tabItemDes = {szItemDes = "五行调和丹可用于调节五行真气，进入五行道场副本有几率掉落此物",szTarget = '五行道场',dwMapID = 1002,dwPosX = -12,dwPosY = -24,},
	UpLvItemEnum = 
	{
		dwMetal = 2300180,	
		dwWood = 2300190,	
		dwWater = 2300200,	
		dwFire = 2300210,	
		dwEarth = 2300220,	
		dwDantian = 2300170,	
	},--2300170,-- 五行石	
	ConvertItemNum = 4, --五行石需求数
	tradeItemBefore = 2300160,--五气囊空
	tradeItem = 
	{
		dwMetal = 2300240,	--五气囊·金
		dwWood = 2300250,	--五气囊·木
		dwWater = 2300260,	--五气囊·水
		dwFire = 2300270,	--五气囊·火
		dwEarth = 2300280,	--五气囊·土
	},
	elemNameNotice = 
	{
		dwMetal = 3000560001,	--五气囊·金
		dwWood = 3000560002,	--五气囊·木
		dwWater = 3000560003,	--五气囊·水
		dwFire = 3000560004,	--五气囊·火
		dwEarth = 3000560005,	--五气囊·土
	},
	
	putElemNotice = 
	{
		dwMetal = 3000560006,	--您金真气不足，无法灌注
		dwWood = 3000560007,	--您金真气不足，无法灌注
		dwWater = 3000560008,	--您金真气不足，无法灌注
		dwFire = 3000560009,	--您金真气不足，无法灌注
		dwEarth = 3000560010,	--您金真气不足，无法灌注
	},
	elemBtnTips = 
	{
		dwMetal = 3000550001,
		dwWood = 3000550002,
		dwWater = 3000550003,
		dwFire = 3000550004,
		dwEarth = 3000550005,	
		dwDantian = 3000550006,	
	},
	--五行调和场景tips配置
	--FunJudge判斷函數
	--FunDo執行函數
	PlaceConfig = 
	{
		[1] = {Tips = 3000550030,dwPercent = 0.5,
		FunJudge = function(objItemSys,objMallSystem) 
			return true 
		end,
		FunDo = function(objItemSys) 
			objItemSys:OnError(3000510013)
		end},
		[2] = {Tips = 3000550031,dwPercent = 0.7,
		FunJudge = function(objItemSys,objMallSystem) 
			local ret = objItemSys:IsPacketMoneyEnough(100000)
			if ret == true then
				return true ;
			else
				objItemSys:OnError(3000510035)
				return false;
			end
		end,
		FunDo = function(objItemSys) 
			objItemSys:CostPacketMoney(100000, _G.ItemSysOperType.ElemBalance)
			objItemSys:OnError(3000510033)
		end},
		[3] = {Tips = 3000550032,dwPercent = 1,
		FunJudge = function(objItemSys,objMallSystem) 
			local ret = objItemSys:IsGoldEnough(100) 
			if ret == true then
				
				return true ;
			else
				--objItemSys:OnError(3000510036)
				---弹元宝不足窗口
				objMallSystem:SendNoGold()
				return false;
			end
		end,
		FunDo = function(objItemSys) 
			objItemSys:CostGold(100, _G.ItemSysOperType.ElemBalance)
			objItemSys:OnError(3000510034)
		end},
	},
	suitNotice =
	{
		3000520005,
		3000520006,
		3000520007,
		3000520008,
		3000520009,
	},
	tNameToStr = 
	{
		dwMetal = '金',
		dwWood = '木',
		dwWater = '水',
		dwFire = '火',
		dwEarth = '土',
	}
}
--客户端主界面五行增加刷新时间。1000为1秒
_G.ConfigElemFlushTime = 1000
--根据刷新时间计算出的速度参数
_G.ConfigElemFlushSpeedParam = 60*60*(ConfigElemFlushTime/1000)

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
	[1]={id=1,wuxing_lv=1,dantian_lv=40,atk=0,def=0,flee=0,crit=0,hpmax=0,mpmax=0,expend_1=0,expend_2=0,expend_3=0,expend_4=0,expend_5=0,expend_dt=1000,resume=0,dantian_limit=1000000,},
	[2]={id=2,wuxing_lv=1,dantian_lv=42,atk=3,def=2,flee=4,crit=2,hpmax=12,mpmax=15,expend_1=30,expend_2=41,expend_3=20,expend_4=30,expend_5=30,expend_dt=1500,resume=7,dantian_limit=11500,},
	[3]={id=3,wuxing_lv=1,dantian_lv=44,atk=6,def=4,flee=8,crit=4,hpmax=20,mpmax=30,expend_1=40,expend_2=54,expend_3=26,expend_4=40,expend_5=40,expend_dt=2050,resume=12,dantian_limit=13300,},
	[4]={id=4,wuxing_lv=1,dantian_lv=46,atk=10,def=6,flee=12,crit=6,hpmax=31,mpmax=47,expend_1=51,expend_2=69,expend_3=33,expend_4=51,expend_5=51,expend_dt=2650,resume=16,dantian_limit=15450,},
	[5]={id=5,wuxing_lv=1,dantian_lv=48,atk=16,def=10,flee=17,crit=9,hpmax=46,mpmax=67,expend_1=65,expend_2=88,expend_3=42,expend_4=65,expend_5=65,expend_dt=3300,resume=19,dantian_limit=18000,},
	[6]={id=6,wuxing_lv=1,dantian_lv=50,atk=24,def=15,flee=23,crit=13,hpmax=64,mpmax=89,expend_1=84,expend_2=113,expend_3=55,expend_4=84,expend_5=84,expend_dt=4000,resume=25,dantian_limit=21000,},
	[7]={id=7,wuxing_lv=1,dantian_lv=52,atk=34,def=20,flee=30,crit=18,hpmax=87,mpmax=114,expend_1=110,expend_2=149,expend_3=72,expend_4=110,expend_5=110,expend_dt=4750,resume=30,dantian_limit=24500,},
	[8]={id=8,wuxing_lv=1,dantian_lv=54,atk=45,def=26,flee=37,crit=23,hpmax=115,mpmax=142,expend_1=145,expend_2=196,expend_3=94,expend_4=145,expend_5=145,expend_dt=5550,resume=35,dantian_limit=28550,},
	[9]={id=9,wuxing_lv=1,dantian_lv=56,atk=58,def=33,flee=45,crit=29,hpmax=147,mpmax=172,expend_1=191,expend_2=258,expend_3=124,expend_4=191,expend_5=191,expend_dt=6400,resume=40,dantian_limit=33200,},
	[10]={id=10,wuxing_lv=1,dantian_lv=58,atk=73,def=41,flee=54,crit=35,hpmax=184,mpmax=204,expend_1=250,expend_2=338,expend_3=163,expend_4=250,expend_5=250,expend_dt=7300,resume=45,dantian_limit=38500,},
	[11]={id=11,wuxing_lv=1,dantian_lv=60,atk=89,def=50,flee=63,crit=43,hpmax=227,mpmax=239,expend_1=324,expend_2=437,expend_3=211,expend_4=324,expend_5=324,expend_dt=8250,resume=55,dantian_limit=44500,},
	[12]={id=12,wuxing_lv=20,dantian_lv=62,atk=107,def=59,flee=73,crit=50,hpmax=275,mpmax=276,expend_1=415,expend_2=560,expend_3=270,expend_4=415,expend_5=415,expend_dt=9250,resume=63,dantian_limit=51250,},
	[13]={id=13,wuxing_lv=20,dantian_lv=64,atk=127,def=70,flee=84,crit=59,hpmax=330,mpmax=316,expend_1=525,expend_2=709,expend_3=341,expend_4=525,expend_5=525,expend_dt=10300,resume=70,dantian_limit=58800,},
	[14]={id=14,wuxing_lv=20,dantian_lv=66,atk=148,def=81,flee=95,crit=68,hpmax=390,mpmax=358,expend_1=656,expend_2=886,expend_3=426,expend_4=656,expend_5=656,expend_dt=11400,resume=76,dantian_limit=67200,},
	[15]={id=15,wuxing_lv=20,dantian_lv=68,atk=171,def=93,flee=107,crit=77,hpmax=458,mpmax=403,expend_1=810,expend_2=1094,expend_3=527,expend_4=810,expend_5=810,expend_dt=12550,resume=82,dantian_limit=76500,},
	[16]={id=16,wuxing_lv=20,dantian_lv=70,atk=196,def=106,flee=120,crit=88,hpmax=532,mpmax=450,expend_1=989,expend_2=1335,expend_3=643,expend_4=989,expend_5=989,expend_dt=13750,resume=95,dantian_limit=86750,},
	[17]={id=17,wuxing_lv=20,dantian_lv=72,atk=222,def=119,flee=133,crit=99,hpmax=613,mpmax=500,expend_1=1195,expend_2=1613,expend_3=777,expend_4=1195,expend_5=1195,expend_dt=15000,resume=105,dantian_limit=98000,},
	[18]={id=18,wuxing_lv=20,dantian_lv=74,atk=250,def=134,flee=147,crit=110,hpmax=702,mpmax=552,expend_1=1430,expend_2=1931,expend_3=930,expend_4=1430,expend_5=1430,expend_dt=16300,resume=114,dantian_limit=110300,},
	[19]={id=19,wuxing_lv=20,dantian_lv=76,atk=279,def=149,flee=161,crit=123,hpmax=798,mpmax=607,expend_1=1696,expend_2=2290,expend_3=1102,expend_4=1696,expend_5=1696,expend_dt=17650,resume=122,dantian_limit=123700,},
	[20]={id=20,wuxing_lv=20,dantian_lv=78,atk=310,def=166,flee=176,crit=135,hpmax=903,mpmax=664,expend_1=1995,expend_2=2693,expend_3=1297,expend_4=1995,expend_5=1995,expend_dt=19050,resume=130,dantian_limit=138250,},
	[21]={id=21,wuxing_lv=40,dantian_lv=80,atk=343,def=183,flee=192,crit=149,hpmax=1016,mpmax=724,expend_1=2329,expend_2=3144,expend_3=1514,expend_4=2329,expend_5=2329,expend_dt=20500,resume=150,dantian_limit=154000,},
	[22]={id=22,wuxing_lv=40,dantian_lv=82,atk=378,def=201,flee=209,crit=163,hpmax=1138,mpmax=786,expend_1=2701,expend_2=3646,expend_3=1756,expend_4=2701,expend_5=2701,expend_dt=22000,resume=164,dantian_limit=171000,},
	[23]={id=23,wuxing_lv=40,dantian_lv=84,atk=414,def=219,flee=226,crit=178,hpmax=1269,mpmax=850,expend_1=3114,expend_2=4204,expend_3=2024,expend_4=3114,expend_5=3114,expend_dt=23550,resume=175,dantian_limit=189300,},
	[24]={id=24,wuxing_lv=40,dantian_lv=86,atk=452,def=239,flee=244,crit=193,hpmax=1409,mpmax=917,expend_1=3571,expend_2=4821,expend_3=2321,expend_4=3571,expend_5=3571,expend_dt=25150,resume=185,dantian_limit=208950,},
	[25]={id=25,wuxing_lv=40,dantian_lv=88,atk=491,def=260,flee=262,crit=209,hpmax=1558,mpmax=987,expend_1=4075,expend_2=5501,expend_3=2649,expend_4=4075,expend_5=4075,expend_dt=26800,resume=195,dantian_limit=230000,},
	[26]={id=26,wuxing_lv=40,dantian_lv=90,atk=533,def=281,flee=282,crit=226,hpmax=1718,mpmax=1059,expend_1=4629,expend_2=6249,expend_3=3009,expend_4=4629,expend_5=4629,expend_dt=28500,resume=220,dantian_limit=252500,},
	[27]={id=27,wuxing_lv=40,dantian_lv=92,atk=576,def=303,flee=302,crit=244,hpmax=1887,mpmax=1134,expend_1=5236,expend_2=7069,expend_3=3403,expend_4=5236,expend_5=5236,expend_dt=30250,resume=240,dantian_limit=276500,},
	[28]={id=28,wuxing_lv=40,dantian_lv=94,atk=620,def=326,flee=322,crit=262,hpmax=2067,mpmax=1211,expend_1=5899,expend_2=7964,expend_3=3834,expend_4=5899,expend_5=5899,expend_dt=32050,resume=256,dantian_limit=302050,},
	[29]={id=29,wuxing_lv=40,dantian_lv=96,atk=666,def=350,flee=343,crit=280,hpmax=2258,mpmax=1290,expend_1=6621,expend_2=8938,expend_3=4304,expend_4=6621,expend_5=6621,expend_dt=33900,resume=269,dantian_limit=329200,},
	[30]={id=30,wuxing_lv=40,dantian_lv=98,atk=714,def=374,flee=365,crit=299,hpmax=2460,mpmax=1372,expend_1=7405,expend_2=9997,expend_3=4813,expend_4=7405,expend_5=7405,expend_dt=35800,resume=280,dantian_limit=358000,},
	[31]={id=31,wuxing_lv=40,dantian_lv=100,atk=763,def=400,flee=387,crit=319,hpmax=2674,mpmax=1456,expend_1=8254,expend_2=11143,expend_3=5365,expend_4=8254,expend_5=8254,expend_dt=37750,resume=315,dantian_limit=388500,},
	[32]={id=32,wuxing_lv=60,dantian_lv=102,atk=815,def=426,flee=411,crit=340,hpmax=2899,mpmax=1543,expend_1=9173,expend_2=12384,expend_3=5962,expend_4=9173,expend_5=9173,expend_dt=39750,resume=340,dantian_limit=420750,},
	[33]={id=33,wuxing_lv=60,dantian_lv=104,atk=867,def=453,flee=434,crit=361,hpmax=3136,mpmax=1633,expend_1=10167,expend_2=13725,expend_3=6609,expend_4=10167,expend_5=10167,expend_dt=41800,resume=360,dantian_limit=454800,},
	[34]={id=34,wuxing_lv=60,dantian_lv=106,atk=922,def=481,flee=459,crit=383,hpmax=3385,mpmax=1725,expend_1=11241,expend_2=15175,expend_3=7307,expend_4=11241,expend_5=11241,expend_dt=43900,resume=378,dantian_limit=490700,},
	[35]={id=35,wuxing_lv=60,dantian_lv=108,atk=978,def=510,flee=484,crit=405,hpmax=3647,mpmax=1819,expend_1=12400,expend_2=16740,expend_3=8060,expend_4=12400,expend_5=12400,expend_dt=46050,resume=396,dantian_limit=528500,},
	[36]={id=36,wuxing_lv=60,dantian_lv=110,atk=1036,def=540,flee=510,crit=429,hpmax=3922,mpmax=1916,expend_1=13649,expend_2=18426,expend_3=8872,expend_4=13649,expend_5=13649,expend_dt=48250,resume=445,dantian_limit=568250,},
	[37]={id=37,wuxing_lv=60,dantian_lv=112,atk=1095,def=570,flee=536,crit=452,hpmax=4210,mpmax=2015,expend_1=14993,expend_2=20241,expend_3=9745,expend_4=14993,expend_5=14993,expend_dt=50500,resume=479,dantian_limit=610000,},
	[38]={id=38,wuxing_lv=60,dantian_lv=114,atk=1156,def=601,flee=563,crit=477,hpmax=4512,mpmax=2117,expend_1=16437,expend_2=22190,expend_3=10684,expend_4=16437,expend_5=16437,expend_dt=52800,resume=504,dantian_limit=653800,},
	[39]={id=39,wuxing_lv=60,dantian_lv=116,atk=1219,def=634,flee=591,crit=502,hpmax=4827,mpmax=2221,expend_1=17986,expend_2=24281,expend_3=11691,expend_4=17986,expend_5=17986,expend_dt=55150,resume=525,dantian_limit=699700,},
	[40]={id=40,wuxing_lv=60,dantian_lv=118,atk=1283,def=667,flee=619,crit=527,hpmax=5156,mpmax=2328,expend_1=19645,expend_2=26521,expend_3=12769,expend_4=19645,expend_5=19645,expend_dt=57550,resume=546,dantian_limit=747750,},
	[41]={id=41,wuxing_lv=60,dantian_lv=120,atk=1350,def=700,flee=649,crit=554,hpmax=5500,mpmax=2437,expend_1=21419,expend_2=28916,expend_3=13922,expend_4=21419,expend_5=21419,expend_dt=60000,resume=630,dantian_limit=798000,},
	[42]={id=42,wuxing_lv=80,dantian_lv=122,atk=1417,def=735,flee=678,crit=581,hpmax=5859,mpmax=2549,expend_1=23323,expend_2=31486,expend_3=15160,expend_4=23323,expend_5=23323,expend_dt=62500,resume=689,dantian_limit=850500,},
	[43]={id=43,wuxing_lv=80,dantian_lv=124,atk=1487,def=771,flee=709,crit=608,hpmax=6232,mpmax=2663,expend_1=25372,expend_2=34252,expend_3=16492,expend_4=25372,expend_5=25372,expend_dt=65050,resume=733,dantian_limit=905300,},
	[44]={id=44,wuxing_lv=80,dantian_lv=126,atk=1558,def=807,flee=740,crit=637,hpmax=6621,mpmax=2780,expend_1=27581,expend_2=37234,expend_3=17928,expend_4=27581,expend_5=27581,expend_dt=67650,resume=772,dantian_limit=962450,},
	[45]={id=45,wuxing_lv=80,dantian_lv=128,atk=1630,def=844,flee=771,crit=665,hpmax=7025,mpmax=2899,expend_1=29965,expend_2=40453,expend_3=19477,expend_4=29965,expend_5=29965,expend_dt=70300,resume=811,dantian_limit=1022000,},
	[46]={id=46,wuxing_lv=80,dantian_lv=130,atk=1705,def=882,flee=804,crit=695,hpmax=7445,mpmax=3021,expend_1=32539,expend_2=43928,expend_3=21150,expend_4=32539,expend_5=32539,expend_dt=73000,resume=910,dantian_limit=1084000,},
	[47]={id=47,wuxing_lv=80,dantian_lv=132,atk=1781,def=921,flee=837,crit=725,hpmax=7882,mpmax=3145,expend_1=35318,expend_2=47679,expend_3=22957,expend_4=35318,expend_5=35318,expend_dt=75750,resume=984,dantian_limit=1148500,},
	[48]={id=48,wuxing_lv=80,dantian_lv=134,atk=1859,def=961,flee=871,crit=756,hpmax=8335,mpmax=3271,expend_1=38317,expend_2=51728,expend_3=24906,expend_4=38317,expend_5=38317,expend_dt=78550,resume=1048,dantian_limit=1215550,},
	[49]={id=49,wuxing_lv=80,dantian_lv=136,atk=1938,def=1001,flee=905,crit=787,hpmax=8804,mpmax=3400,expend_1=41551,expend_2=56094,expend_3=27008,expend_4=41551,expend_5=41551,expend_dt=81400,resume=1112,dantian_limit=1285200,},
	[50]={id=50,wuxing_lv=80,dantian_lv=138,atk=2019,def=1043,flee=940,crit=819,hpmax=9291,mpmax=3532,expend_1=45035,expend_2=60797,expend_3=29273,expend_4=45035,expend_5=45035,expend_dt=84300,resume=1176,dantian_limit=1357500,},
	[51]={id=51,wuxing_lv=80,dantian_lv=140,atk=2102,def=1085,flee=976,crit=852,hpmax=9795,mpmax=3666,expend_1=48784,expend_2=65858,expend_3=31710,expend_4=48784,expend_5=48784,expend_dt=87250,resume=1360,dantian_limit=1432500,},
}
-----五行组合属性配置
_G.FiveElemComboConfig = 
{
	[1] = 
	{
		LvLimit = { dwMetalLv = 10,dwWoodLv = 10,dwWaterLv = 10,dwFireLv = 10,dwEarthLv = 10,},
		ProValue ={ [1]={'dwAttack',50,'攻击'},[2]={'dwDefense',35,'防御'},[3]={'dwHPMax',200,'生命上限'}},
	},
	[2] = 
	{
		LvLimit = { dwMetalLv = 20,dwWoodLv = 20,dwWaterLv = 20,dwFireLv = 20,dwEarthLv = 20,},
		ProValue ={ [1]={'dwAttack',100,'攻击'},[2]={'dwDefense',70,'防御'},[3]={'dwHPMax',400,'生命上限'}},
	},
	[3] = 
	{
		LvLimit = { dwMetalLv = 30,dwWoodLv = 30,dwWaterLv = 30,dwFireLv = 30,dwEarthLv = 30,},
		ProValue ={ [1]={'dwAttack',200,'攻击'},[2]={'dwDefense',130,'防御'},[3]={'dwHPMax',700,'生命上限'},[4]={'dwFlee',100,'身法'}},
	},
	[4] = 
	{
		LvLimit = { dwMetalLv = 35,dwWoodLv = 35,dwWaterLv = 35,dwFireLv = 35,dwEarthLv = 35,},
		ProValue ={ [1]={'dwAttack',350,'攻击'},[2]={'dwDefense',215,'防御'},[3]={'dwHPMax',1200,'生命上限'},[4]={'dwFlee',200,'身法'},[5]={'dwCrit',150,'暴击'}},
	},
	[5] = 
	{
		LvLimit = { dwMetalLv = 40,dwWoodLv = 40,dwWaterLv = 40,dwFireLv = 40,dwEarthLv = 40,},
		ProValue ={ [1]={'dwAttack',500,'攻击'},[2]={'dwDefense',320,'防御'},[3]={'dwHPMax',2000,'生命上限'},[4]={'dwFlee',350,'身法'},[5]={'dwCrit',350,'暴击'}},
	}
}


--五行系统各种操作类型，记录日志使用
_G.FiveElemSysOperType = {
    BuildRampart   = 1,    --众志成城
    CommercialAct  = 2,    --商业化活动
    Dupl           = 3,    --副本系统
    EquipBuild     = 4,    --装备修炼
    RefreshRank    = 5,    --答题1
    MakeUpResult   = 6,    --答题2
    ExChange       = 7,    --兑换系统
    GambleSystem   = 8,    --老顽童
    ProduceSystem  = 9,    --技能书合成
    MuseSystem     = 10,  --闭关系统
    MartialSystem  = 11,   --演武系统
    SitSystem      = 12,   --打坐系统
    CostSkillUp    = 13,   --技能升级消耗
    StoneSpendZQ   = 14,   --宝石合成消耗
    WarSystem      = 15,  --战场系统
    GrowUp         = 16,  --成长目标
    GuildPlayer    = 17,     --押镖奖励
    Marriage       = 18,   --结婚系统
    AddSpItem      = 19,   --通过脚本系统增加真气
    DelSpItem      = 20,   --通过脚本系统减少真气
    GiveWeeklyReward= 21,   --风云奖励
    DoReward       = 22,   --任务奖励
    DoCompleteWeeklyAllReward  = 23,   --周任务奖励  DoCompleteWeeklyAllReward
    OnReceiveWelfare    = 24,   --世家领取福利
	FiveElement = 25;    --五行调和
	ChgFiveByUseItem = 26, --通过使用道具脚本改变五行真气
	EscortAward = 27,   --个人押镖奖励
	CompleteDuplAward = 28, --副本一键完成奖励
    Recycling = 29, -- 资源回收
};