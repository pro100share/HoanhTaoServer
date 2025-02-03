--新手引导配置信息
--dwStartEventId：触发事件Id（无触发事件填写nil）
--dwEndEventId：结束事件Id（无结束事件填写nil）
--dwTime：持续时间（无限时间填写nil）
--dwNextGuideId：下一步引导Id（无下一步引导时填写nil）
--tabComponentIdList：组件Id列表
--bRepeat: 是否可重复触发
--dwTerminateEventId: 终止事件
--引导序号Id规则：1000001——1000099为对话事件触发引导，1000100——1000199为界面及窗口事件触发引导，1000200——1000299为升级事件触发引导，1000300——1000399为任务事件触发引导，1000400之后自然增长为其他事件触发引导。

_G.NoviceGuideConfig =
{
--1000001——1000099为对话事件触发引导
 [1000001]	=	{dwStartEventId=0700001	,dwEndEventId={0500026,0400028},dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400001,0500001}},
 [1000002]	=	{dwStartEventId=0700002	,dwEndEventId={0500026,0400028},dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400001,0500003}},
 [1000003]	=	{dwStartEventId=0700003	,dwEndEventId={0500026,0400028},dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400001,0500003}},
 [1000004]	=	{dwStartEventId=0700004	,dwEndEventId={0500026,0400028},dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400001,0500003}}, 

--1000200——1000299为升级事件触发引导
 --[1000200] = {dwStartEventId=0600001,dwEndEventId=0400002,dwTime=nil,dwNextGuideId=1000100,tabComponentIdList={0900003,0400003,0500005}},
 --[1000202] = {dwStartEventId=0600003,dwEndEventId=nil,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0700003}},
 --[1000203] = {dwStartEventId=0600004,dwEndEventId=nil,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0700003}},
 --[1000204] = {dwStartEventId=0600005,dwEndEventId=nil,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0700003}},
 --[1000205] = {dwStartEventId=0600006,dwEndEventId=nil,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0700003}}, 
 --[1000206] = {dwStartEventId=0600007,dwEndEventId=nil,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0700003}}, 
	[1000207] = {dwStartEventId = 0600008 ,dwEndEventId = {0500101,0600014},dwTime= nil,dwNextGuideId = nil,tabComponentIdList={ 1000013, 0500110}}, --奇物开启引导，连接名剑开启引导
	[1000208] = {dwStartEventId = 0600009 ,dwEndEventId = {0500101,0600015},dwTime= nil,dwNextGuideId = nil,tabComponentIdList={ 1000013, 0500112}}, --修行开启引导
	[1000209] = {dwStartEventId = 0600010 ,dwEndEventId = {0500101,0600016},dwTime= nil,dwNextGuideId = nil,tabComponentIdList={ 1000013, 0500113}}, --宝甲开启引导
	[1000210] = {dwStartEventId = 0600011 ,dwEndEventId = {0500101,0600017},dwTime= nil,dwNextGuideId = nil,tabComponentIdList={ 1000013, 0500114}}, --暗器开启引导
	[1000211] = {dwStartEventId = 0600012 ,dwEndEventId = {0500101,0600018},dwTime= nil,dwNextGuideId = nil,tabComponentIdList={ 1000013, 0500115}}, --法宝开启引导
	[1000212] = {dwStartEventId = 0600013 ,dwEndEventId = {0500101,0600019},dwTime= nil,dwNextGuideId = nil,tabComponentIdList={ 1000013, 0500116}}, --酒葫芦开启引导
	[1000213] = {dwStartEventId = 0600020 ,dwEndEventId = nil,dwTime= nil,dwNextGuideId = nil,tabComponentIdList={ 1000013, 0500117}}, --战旗开启引导	
 
--1000300——1000399为任务事件触发引导
	[1000300] = {dwStartEventId=0400032,dwEndEventId=nil,dwTime=5000,dwNextGuideId=nil,tabComponentIdList={0900004,0400023,0500021}},--获得装备
	[1000301] = {dwStartEventId=0200016,dwEndEventId=0400005,dwTime=nil,dwNextGuideId=1000106,tabComponentIdList={1000002,0500006}},--第一个技能
	[1000302] = {dwStartEventId=0200028,dwEndEventId=0400005,dwTime=nil,dwNextGuideId=1000111,tabComponentIdList={1000002,0500006}},--第二个技能
	[1000314] = {dwStartEventId=0200046,dwEndEventId=0400005,dwTime=nil,dwNextGuideId=1000138,tabComponentIdList={1000002,0500006}},--第三个技能
	[1000303] = {dwStartEventId=0200057,dwEndEventId=nil,dwTime=6000,dwNextGuideId=nil,tabComponentIdList={0500022}},	--打怪
	--[1000304] = {dwStartEventId=0200042,dwEndEventId=0400003,dwTime=nil,dwNextGuideId=1000103,tabComponentIdList={1000003,0500007}},--五行
	--[1000305] = {dwStartEventId=0200048,dwEndEventId=0400006,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={1000004,0500008}},--经脉	
	[1000306] = {dwStartEventId=0200049,dwEndEventId=0400005,dwTime=nil,dwNextGuideId=1000128,tabComponentIdList={1000002,0500006}},--第一个心法
	[1000307] = {dwStartEventId=0200056,dwEndEventId=0500057,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={1000006,0500010}},--打坐	
	[1000308] = {dwStartEventId=0200051,dwEndEventId=0400009,dwTime=nil,dwNextGuideId=1000133,tabComponentIdList={1000009,0500082}},--装备炼制
	[1000309] = {dwStartEventId=0200052,dwEndEventId=0400011,dwTime=nil,dwNextGuideId=1000152,tabComponentIdList={1000007,0500011}},--组队
	--[1000310] = {dwStartEventId=0400013,dwEndEventId=0500036,dwTime=5000,dwNextGuideId=nil,tabComponentIdList={0700002}},	--移动引导
	--[1000311]	=	{dwStartEventId=0200003,dwEndEventId=0400002,dwTime=nil,dwNextGuideId=1000100,tabComponentIdList={1000001,0500005}},--人物加点
	[1000312] = {dwStartEventId=0200054,dwEndEventId=0400005,dwTime=nil,dwNextGuideId=1000135,tabComponentIdList={1000002,0500006}},	--无双
	[1000313] = {dwStartEventId=0200060,dwEndEventId=0400029,dwTime=nil,dwNextGuideId=1000153,tabComponentIdList={1000010,0500080}},--好友
	[1000315] = {dwStartEventId=0200062,dwEndEventId=0400005,dwTime=nil,dwNextGuideId=1000155,tabComponentIdList={1000002,0500006}},--大挪移
	--[1000316] = {dwStartEventId=0200063,dwEndEventId=0400005,dwTime=nil,dwNextGuideId=1000158,tabComponentIdList={1000011,0500089}},--护身宝甲
	[1000317] = {dwStartEventId=0200067,dwEndEventId=0500081,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={1000012,0500099}},--江湖	
	
--1000100——1000199为界面及窗口事件触发引导	
--人物属性界面事件
 [1000100] = {dwStartEventId=nil,dwEndEventId={0500001,0500050},dwTime=nil,dwNextGuideId={1000102,1000151},tabComponentIdList={0900003,0400071,0500079}},
 --[1000101] = {dwStartEventId=0500001,dwEndEventId={0500030,0500050},dwTime=nil,dwNextGuideId={1000102,1000151},tabComponentIdList={0900005,0400028,0500027}},
 [1000102] = {dwStartEventId={0500001,0500050},dwEndEventId={0500030,0400013},dwTime=nil,dwNextGuideId=nil,dwIgnoreGuideId=1000101,tabComponentIdList={0900006,0400029,0500028}},
 [1000151] = {dwStartEventId=0500030,dwEndEventId=0400013,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400030,0500029}},
--五行界面事件
 [1000103] = {dwStartEventId=nil,dwEndEventId=0500003,dwTime=nil,dwNextGuideId=1000104,tabComponentIdList={0400031,0500031}}, 
 [1000104] = {dwStartEventId=nil,dwEndEventId=0500032,dwTime=nil,dwNextGuideId=1000105,tabComponentIdList={0900012,0400032,0500032}},
 [1000105] = {dwStartEventId=nil,dwEndEventId=0400014,dwTime=nil,dwNextGuideId=1000110,tabComponentIdList={0400033,0500033}},
 [1000110] = {dwStartEventId=nil,dwEndEventId=nil,dwTime=10000,dwNextGuideId=nil,tabComponentIdList={0900013,0400038,0500038}},
--技能界面事件
 [1000106] = {dwStartEventId=nil,dwEndEventId=0500007,dwTime=nil,dwNextGuideId=1000107,tabComponentIdList={0900017,0400034,0500034}},--第一个技能
 [1000107] = {dwStartEventId=nil,dwEndEventId=0500033,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0900010,0400035,0500035}},
 --[1000108] = {dwStartEventId=nil,dwEndEventId=0400008,dwTime=nil,dwNextGuideId=1000109,tabComponentIdList={0400036,0500037}},
 --[1000109] = {dwStartEventId=nil,dwEndEventId=nil,dwTime=5000,dwNextGuideId=nil,tabComponentIdList={0900011,0400037,0500040}},
 [1000111] = {dwStartEventId=nil,dwEndEventId=0500007,dwTime=nil,dwNextGuideId=1000112,tabComponentIdList={0900008,0400039,0500039}},--第二个技能
 [1000112] = {dwStartEventId=nil,dwEndEventId=0500033,dwTime=nil,dwNextGuideId=1000113,tabComponentIdList={0900010,0400035,0500035}},
 [1000113] = {dwStartEventId=nil,dwEndEventId=0400008,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400036,0500037}},
 --[1000114] = {dwStartEventId=nil,dwEndEventId=nil,dwTime=10000,dwNextGuideId=nil,tabComponentIdList={0900011,0400037,0500040}},
 [1000128] = {dwStartEventId=nil,dwEndEventId=0500035,dwTime=nil,dwNextGuideId=1000129,tabComponentIdList={0900020,0400063,0500055}},--第一个心法
 [1000129] = {dwStartEventId=nil,dwEndEventId=0500007,dwTime=nil,dwNextGuideId=1000130,tabComponentIdList={0900017,0400044,0500056}},
 [1000130] = {dwStartEventId=nil,dwEndEventId=0500033,dwTime=nil,dwNextGuideId=1000131,tabComponentIdList={0900010,0400035,0500035}},
 [1000131] = {dwStartEventId=nil,dwEndEventId=0400008,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400036,0500037}},
 [1000135] = {dwStartEventId=nil,dwEndEventId=0500007,dwTime=nil,dwNextGuideId=1000136,tabComponentIdList={0900019,0400070,0500066}}, --无双
 [1000136] = {dwStartEventId=nil,dwEndEventId=0500033,dwTime=nil,dwNextGuideId=1000137,tabComponentIdList={0900010,0400035,0500035}},
 [1000137] = {dwStartEventId=nil,dwEndEventId=0400008,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400036,0500037}},
 [1000138] = {dwStartEventId=nil,dwEndEventId=0500007,dwTime=nil,dwNextGuideId=1000139,tabComponentIdList={0900018,0400075,0500081}},--第三个技能
 [1000139] = {dwStartEventId=nil,dwEndEventId=0500033,dwTime=nil,dwNextGuideId=1000140,tabComponentIdList={0900010,0400035,0500035}},
 [1000140] = {dwStartEventId=nil,dwEndEventId=0400008,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400036,0500037}}, 
 --[1000154] = {dwStartEventId=nil,dwEndEventId=0500035,dwTime=nil,dwNextGuideId=1000155,tabComponentIdList={0900027,0400079,0500087}},
 [1000155] = {dwStartEventId=nil,dwEndEventId=0500007,dwTime=nil,dwNextGuideId=1000156,tabComponentIdList={0900016,0400079,0500088}},--大挪移
 [1000156] = {dwStartEventId=nil,dwEndEventId=0500033,dwTime=nil,dwNextGuideId=1000157,tabComponentIdList={0900010,0400035,0500035}},
 [1000157] = {dwStartEventId=nil,dwEndEventId=0400008,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400036,0500037}}, 
 
--经脉界面
 --[1000120] = {dwStartEventId=0400006,dwEndEventId=0500002,dwTime=nil,dwNextGuideId=1000121,tabComponentIdList={0400045,0500045}},
 [1000121] = {dwStartEventId=0500002,dwEndEventId=0500031,dwTime=nil,dwNextGuideId=1000122,tabComponentIdList={0900026,0400046,0500046}},
 [1000122] = {dwStartEventId=nil,dwEndEventId=0400006,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400047,0500047}},	
--打坐界面
 [1000132] = {dwStartEventId=nil,dwEndEventId=nil,dwTime=5000,dwNextGuideId=nil,tabComponentIdList={0400056,0500057}}, 
 
--装备炼制界面
 [1000133] = {dwStartEventId=nil,dwEndEventId=0500014,dwTime=nil,dwNextGuideId=1000134,tabComponentIdList={0900022,0400057,0500059}},
 [1000134] = {dwStartEventId=nil,dwEndEventId=0500040,dwTime=nil,dwNextGuideId=1000141,tabComponentIdList={0900023,0400058,0500060}},
 [1000141] = {dwStartEventId=nil,dwEndEventId=0100009,dwTime=nil,dwNextGuideId=1000142,tabComponentIdList={}},
 [1000142] = {dwStartEventId=nil,dwEndEventId=0400019,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400062,0500067}},  

--组队界面
 [1000152] = {dwStartEventId=nil,dwEndEventId=nil,dwTime=5000,dwNextGuideId=1000145,tabComponentIdList={0900028,0400064,0500070}},
 
--坐骑使用界面
 --[1000146] = {dwStartEventId=0400025,dwEndEventId=0500044,dwTime=nil,dwNextGuideId=1000147,tabComponentIdList={}},
 [1000147] = {dwStartEventId=0100010,dwEndEventId=0400026,dwTime=nil,dwNextGuideId=1000150,tabComponentIdList={1000008,0500012}},----获得坐骑
 -- [1000148] = {dwStartEventId=nil,dwEndEventId=0500054,dwTime=nil,dwNextGuideId=1000150,tabComponentIdList={0900015,0400068,0500075}},
 --[1000149] = {dwStartEventId=0500045,dwEndEventId=0500045,dwTime=nil,dwNextGuideId=1000150,tabComponentIdList={0900015,0400068,0500075}},
 [1000150] = {dwStartEventId=nil,dwEndEventId=0400027,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400069,0500076}},


--好友界面
 [1000153] = {dwStartEventId=nil,dwEndEventId=0500048,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0900024,0400073,0500077}},

--真气灌注界面
 [1000159] = {dwStartEventId=0500061,dwEndEventId=0500062,dwTime=nil,dwNextGuideId=1000160,tabComponentIdList={0400080,0500090}},
 [1000160] = {dwStartEventId=nil,dwEndEventId=0400033,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400081,0500091}}, 

--战魂界面
 -- [1000161] = {dwStartEventId=0800002,dwEndEventId=0500078,dwTime=nil,dwNextGuideId=1000162,tabComponentIdList={0400082,0500092}}, 
 -- [1000162] = {dwStartEventId=nil,dwEndEventId=0500072,dwTime=nil,dwNextGuideId=1000163,tabComponentIdList={0400083,0500093,0900029}},
 -- [1000163] = {dwStartEventId=nil,dwEndEventId=0500073,dwTime=nil,dwNextGuideId=1000164,tabComponentIdList={0400084,0500094}},
 -- [1000164] = {dwStartEventId=nil,dwEndEventId=0500076,dwTime=nil,dwNextGuideId=1000165,tabComponentIdList={0400085,0500095}},
 -- [1000165] = {dwStartEventId=nil,dwEndEventId=0500079,dwTime=nil,dwNextGuideId=1000166,tabComponentIdList={0400086,0500096}},
 -- [1000166] = {dwStartEventId=nil,dwEndEventId=0500080,dwTime=nil,dwNextGuideId=1000167,tabComponentIdList={0400087,0500097}},
 -- [1000167] = {dwStartEventId=nil,dwEndEventId=0400034,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400088,0500098}}, 
 
[1000161] = {dwStartEventId=0800002,dwEndEventId=0500072,dwTime=nil,dwNextGuideId=1000162,tabComponentIdList={0400083,0500093,0900029}},  
[1000162] = {dwStartEventId=nil,dwEndEventId=0500073,dwTime=nil,dwNextGuideId=1000163,tabComponentIdList={0400084,0500094}}, 
[1000163] = {dwStartEventId=nil,dwEndEventId=0500076,dwTime=nil,dwNextGuideId=1000164,tabComponentIdList={0400085,0500095}},
[1000164] = {dwStartEventId=nil,dwEndEventId=0500079,dwTime=nil,dwNextGuideId=1000165,tabComponentIdList={0400086,0500096}},
[1000165] = {dwStartEventId=nil,dwEndEventId=0500078,dwTime=nil,dwNextGuideId=1000166,tabComponentIdList={0400087,0500092}},
[1000166] = {dwStartEventId=nil,dwEndEventId=0400034,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400088,0500098}}, 

--江湖界面 

 
 
 
--1000400之后自然增长为其他事件触发引导
 [1000400] = {dwStartEventId=0100003,dwEndEventId=nil,dwTime=10000,dwNextGuideId=nil,tabComponentIdList={0500042}},
 [1000402] = {dwStartEventId={0200001,0200004,	0200011,	0200019,0200064,	0200022,	0200027,0200029,	0200031,0200032,	0200033,0200035,0200037,0200039,0200065,0200047},dwEndEventId={0500036,0400001,0500052},dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0900007,0400020,0500019},bRepeat=true,dwTerminateEventId=0200048},
 --[1000404] = {dwStartEventId={0200047},dwEndEventId={0500036,0400001,0500052},dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0900014,0400020,0500019},bRepeat=true,dwTerminateEventId=0200048},
 [1000405] = {dwStartEventId={0200013},dwEndEventId={0200016,0500036,0400001,0500052},dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0900007,0400020,0500084},bRepeat=true,dwTerminateEventId=0200048},
 --[1000403] = {dwStartEventId=0100006,dwEndEventId=0400020,dwTime=nil,dwNextGuideId=nil,tabComponentIdList={0400059,0500063}},
 [1000401] = {dwStartEventId=0500049,dwEndEventId=nil,dwTime=6000,dwNextGuideId=nil,tabComponentIdList={0400076,0500083}}, 
 [1000406] = {dwStartEventId=0500053,dwEndEventId=nil,dwTime=6000,dwNextGuideId=nil,tabComponentIdList={0400077,0500085}},
};
 
--------------------------------------------------------------------------------------
--事件配置信息
_G.NoviceGuideEventConfig = {}
--------------------------------------------------------------------------------------
--事件类型枚举
_G.enNoviceGuideEventType =
{
	eCommon	= 1,	--普通事件
	eTask	= 2,	--任务事件
	eMove	= 3,	--移动事件
	eWindow	= 4,	--窗口事件
	ePanel	= 5,	--分页事件
	eUI		= 6,	--界面事件
	eLevel	= 7,	--升级事件
	eTalk	= 8,	--对话事件
};
--触发类型枚举
_G.enNoviceGuideTriggerType =
{
	eStart		= 1,	--开始引导
	eEnd		= 2,	--结束引导
	eTerminate	= 3,	--终止引导
}
--==================================================================================--
--普通事件
--strEventName：事件名 （填写EventCenterConfig中enumPlayerEventType表内的信息）
_G.NoviceGuideEventConfig[enNoviceGuideEventType.eCommon] =
{
	[0100001] = {strEventName='EventKillMonster'},
	[0100002] = {strEventName='EventKillPlayer'},
	[0100003] = {strEventName='EventDrop'},
	[0100004] = {strEventName='EventDropTaskItem'},
	[0100005] = {strEventName='EventBuyShopItem'},
	[0100006] = {strEventName='EventSellItem'},
	[0100007] = {strEventName='EventMountActivate'},--激活坐骑
	[0100008] = {strEventName='EventMountActivate'},--乘骑坐骑
	[0100009] = {strEventName='EventEquipStrong'},--完成一次强化装备
	[0100010] = {strEventName='EventGetNewMount'},--获得新坐骑
	[0100011] = {strEventName='EventLearnXinfa'},--学习心法
}
--==================================================================================--
--任务事件
--dwTaskId：任务Id
--dwTaskState：任务状态
	-- 1：接受任务
	-- 2：满足任务条件
	-- 3：完成任务
	-- 4：到达任务地点
_G.NoviceGuideEventConfig[enNoviceGuideEventType.eTask] =
{
	[0200001] = {dwTaskId=1001,dwTaskState=1},
	[0200002] = {dwTaskId=1001,dwTaskState=2},	
	[0200003] = {dwTaskId=1002,dwTaskState=1},	
	[0200004] = {dwTaskId=1002,dwTaskState=2},	
	[0200005] = {dwTaskId=1003,dwTaskState=1},	
	[0200006] = {dwTaskId=1003,dwTaskState=2},		
	[0200007]	=	{dwTaskId=	1004,dwTaskState=1},
	[0200008]	=	{dwTaskId=	1004,dwTaskState=2},	
	[0200009] = {dwTaskId=1004,dwTaskState=4},
	[0200010] = {dwTaskId=1004,dwTaskState=3},	
	[0200011]	=	{dwTaskId=	1005,dwTaskState=1},
	[0200012]	=	{dwTaskId=	1005,dwTaskState=2},	
	[0200013] = {dwTaskId=1006,dwTaskState=1},	
	[0200014]	=	{dwTaskId=	1006,dwTaskState=2},
	[0200015] = {dwTaskId=1006,dwTaskState=4},	
	[0200016]	=	{dwTaskId=	1007,dwTaskState=1},	
	[0200017] = {dwTaskId=1007,dwTaskState=2},	
	[0200018]	=	{dwTaskId=	1008,dwTaskState=1},
	[0200019]	=	{dwTaskId=	1008,dwTaskState=2},
	[0200020]	=	{dwTaskId=	1009,dwTaskState=1},
	[0200021]	=	{dwTaskId=	1009,dwTaskState=2},	
	[0200022]	=	{dwTaskId=	1010,dwTaskState=1},
	[0200023]	=	{dwTaskId=	1010,dwTaskState=2},
	[0200024] = {dwTaskId=1011,dwTaskState=1},	
	[0200025]	=	{dwTaskId=	1011,dwTaskState=2},
	[0200026]	=	{dwTaskId=	1012,dwTaskState=1},
	[0200027]	=	{dwTaskId=	1012,dwTaskState=2},
	[0200028]	=	{dwTaskId=	1013,dwTaskState=1},
	[0200029]	=	{dwTaskId=	1013,dwTaskState=2},
	[0200030]	=	{dwTaskId=	1014,dwTaskState=1},
	[0200031]	=	{dwTaskId=	1014,dwTaskState=2},
	[0200032]	=	{dwTaskId=	1015,dwTaskState=1},
	[0200033]	=	{dwTaskId=	1015,dwTaskState=2},
	[0200034]	=	{dwTaskId=	1016,dwTaskState=1},
	[0200035]	=	{dwTaskId=	1016,dwTaskState=2},
	[0200036] = {dwTaskId=1017,dwTaskState=1},
	[0200037]	=	{dwTaskId=	1017,dwTaskState=2},
	[0200038]	=	{dwTaskId=	1018,dwTaskState=1},
	[0200039]	=	{dwTaskId=	1018,dwTaskState=2},
	[0200040]	=	{dwTaskId=	1019,dwTaskState=1},
	[0200041]	=	{dwTaskId=	1019,dwTaskState=2},
	[0200042] = {dwTaskId=1020,dwTaskState=1},	
	[0200043]	=	{dwTaskId=	1020,dwTaskState=2}, 
	[0200044]	=	{dwTaskId=	1021,dwTaskState=1},
	[0200045]	=	{dwTaskId=	1021,dwTaskState=2},
	[0200046] = {dwTaskId=2009,dwTaskState=3},	
	[0200047]	=	{dwTaskId=	1023,dwTaskState=1},
	[0200048]	=	{dwTaskId=	2001,dwTaskState=1},
	[0200049] = {dwTaskId=2108,dwTaskState=3},	
	[0200050] = {dwTaskId=2003,dwTaskState=1},	
	[0200051] = {dwTaskId=2043,dwTaskState=1},	
	[0200052] = {dwTaskId=2011,dwTaskState=1},	
	[0200053] = {dwTaskId=2015,dwTaskState=3},	
	[0200054] = {dwTaskId=2025,dwTaskState=3},
	[0200055] = {dwTaskId=2034,dwTaskState=1},	
	[0200056] = {dwTaskId=2114,dwTaskState=1},	
	[0200057] = {dwTaskId=1005,dwTaskState=4},
	[0200058]	=	{dwTaskId=	1014,dwTaskState=3},
	[0200059] = {dwTaskId=	2017,dwTaskState=3},
	[0200060] = {dwTaskId=	2009,dwTaskState=1},
	[0200061] = {dwTaskId=	1021,dwTaskState=3},	
	[0200062] = {dwTaskId=	2030,dwTaskState=1},
	[0200063] = {dwTaskId=	4117,dwTaskState=3},	
	[0200064]	=	{dwTaskId=	1023,dwTaskState=2},	
	[0200065] = {dwTaskId=	1024,dwTaskState=2},
	[0200066]	=	{dwTaskId=	1022,dwTaskState=1},
	[0200067] = {dwTaskId=	2140,dwTaskState=1},
	}
--==================================================================================--
--移动事件
--dwTop：目标地点上界
--dwBottom：目标地点下界
--dwLeft：目标地点左界
--dwRight：目标地点右界
_G.NoviceGuideEventConfig[enNoviceGuideEventType.eMove] =
{
	[0300001] = {dwTop=nil,dwBottom=nil,dwLeft=nil,dwRight=nil},
	[0300002] = {dwTop=nil,dwBottom=nil,dwLeft=nil,dwRight=nil},
}
--==================================================================================--
--窗口事件
--dwAction：操作类型
	-- 1：打开
	-- 2：关闭
--strSWFName：窗口SWF名
_G.NoviceGuideEventConfig[enNoviceGuideEventType.eWindow] =
{
	[0400001] = {dwAction=1,strSWFName='NpcTalk'},
	[0400028] = {dwAction=2,strSWFName='NpcTalk'},
	[0400002] = {dwAction=1,strSWFName='AvatarEquip'},
	[0400013] = {dwAction=2,strSWFName='AvatarEquip'},
	[0400003] = {dwAction=1,strSWFName='UIFiveElem'},
	[0400014] = {dwAction=2,strSWFName='UIFiveElem'},
	[0400004] = {dwAction=1,strSWFName='CUITaskMain'},
	[0400016] = {dwAction=2,strSWFName='CUITaskMain'},
	[0400005] = {dwAction=1,strSWFName='Skill'},
	[0400006] = {dwAction=1,strSWFName='CUIRole'},
	[0400007] = {dwAction=1,strSWFName='Boss'},
	[0400008] = {dwAction=2,strSWFName='Skill'},
	[0400009] = {dwAction=1,strSWFName='EquipIntensify'},
	[0400010] = {dwAction=1,strSWFName='Packet'},
	[0400011] = {dwAction=1,strSWFName='TeamMainUI'},
	[0400015] = {dwAction=2,strSWFName='CUITaskHelp'},
	[0400017] = {dwAction=1,strSWFName='MartialMain'},
	[0400018] = {dwAction=2,strSWFName='UINpcShopMulti'},
	[0400019] = {dwAction=2,strSWFName='EquipIntensify'},
	[0400020] = {dwAction=2,strSWFName='UINpcShop'},
	[0400024] = {dwAction=2,strSWFName='TeamMainUI'},
	[0400025] = {dwAction=1,strSWFName='EquipWearNoticeFirstHorse'},
	[0400026] = {dwAction=1,strSWFName='UIMountBack'},
	[0400027] = {dwAction=2,strSWFName='UIMountBack'},
	[0400029] = {dwAction=1,strSWFName='FriendList'},
	[0400030] = {dwAction=1,strSWFName='CUIFriendPlatform'},	
	[0400031] = {dwAction=2,strSWFName='FriendList'},
	[0400032] = {dwAction=1,strSWFName='EquipWearNoticeFirstEquip'},
	[0400033] = {dwAction=2,strSWFName='biguan'},
	[0400034] = {dwAction=2,strSWFName='UIMountBack'},
}
--==================================================================================--
--分页事件
--strSWFName：窗口SWF名
--strPanelName: 窗口分页名
_G.NoviceGuideEventConfig[enNoviceGuideEventType.ePanel] =
{
	[0800001] = {strSWFName='UIRoleBase',strPanelName='UIPulseEx'},		--人物界面 经脉分页
	[0800002] = {strSWFName='UIMountBack',strPanelName='CUISoulMount'},		--坐骑界面 战魂分页
}
--==================================================================================--
--界面事件
--strUILogicName：UI逻辑名
--strEventName：事件名
--Argv1：第一参数
--Argv2：第二参数
_G.NoviceGuideEventConfig[enNoviceGuideEventType.eUI] =
{
--系统界面
	[0500001] = {strUILogicName='CUIPlayerAttribute',strEventName='ShowAddPoint'},				--点击人物属性面板加点按钮
	[0500030] = {strUILogicName='CUIPlayerAttribute',strEventName='DoSetPoint'},				--点击人物界面加点确定按钮
	[0500002] = {strUILogicName='CUIRole',strEventName='SelectPulse'},							--点击经脉界面任意经脉
	[0500031] = {strUILogicName='CUIPulseSub',strEventName='LevelUpPulse'},						--点击经脉界面升级按钮
	[0500003] = {strUILogicName='CUIFiveElem',strEventName='SelectElem'},						--点击五行界面任意属性
	[0500032] = {strUILogicName='CUIFiveElem',strEventName='LevelUpElem'},						--点击五行界面升级按钮
	[0500007] = {strUILogicName='CUISkill',strEventName='SelectSkill'},							--点击技能界面任意技能
	[0500033] = {strUILogicName='CUISkill',strEventName='DoStudySkill'},						--点击技能界面升级按钮
	[0500035] = {strUILogicName='CUISkill',strEventName='SelectPage'},							--点击技能界面任意分页
	[0500037] = {strUILogicName='CUIMainPageShrtcut',strEventName='SelectNg'},					--点击技能快捷键内功按钮	
	[0500009] = {strUILogicName='CUIPacket',strEventName='DoShowType',Argv1=1},					--点击背包界面任务分栏
	[0500027] = {strUILogicName='CUITaskMain',strEventName='OnListPress'},						--点击任务界面任意任务

--交互界面
 	[0500004] = {strUILogicName='CUITeam',strEventName='SelectMyTeam'},							--点击组队界面我的队伍
	[0500005] = {strUILogicName='CUITeam',strEventName='SelectNearTeam'},						--点击组队界面附近队伍
	[0500006] = {strUILogicName='CUITeam',strEventName='SelectNearPlayer'},						--点击组队界面附近玩家
	[0500026] = {strUILogicName='CUINpcTalk',strEventName='OnItemBtnClick'},					--点击NPC对话选项
	[0500042] = {strUILogicName='CUINpcShop',strEventName='SubOnShow'},							--弹出NPC界面购物小窗
	[0500044] = {strUILogicName='CUIEquipWearNotice',strEventName='WearEquipment'},				--点击更好装备提示界面穿戴按钮

--装备强化类界面
	[0500010] = {strUILogicName='CUIEquipIntensify',strEventName='SelectEquipStrengthen'},		--点击强化界面装备强化面板
	[0500011] = {strUILogicName='CUIEquipIntensify',strEventName='SelectEquipLevelUp'},			--点击强化界面装备升阶面板
	[0500012] = {strUILogicName='CUIEquipIntensify',strEventName='SelectEquipBornProperty'},	--点击强化界面天生属性强化
	[0500013] = {strUILogicName='CUIEquipIntensify',strEventName='SelectEquipAppendProperty'},	--点击强化界面附加属性强化
	[0500014] = {strUILogicName='CUIEquipIntensify',strEventName='SetEquipToSlot'},				--设置强化界面插槽
	[0500040] = {strUILogicName='CUIEquipIntensify',strEventName='OnStartGo'},					--点击强化界面任意开始按钮	
	[0500023] = {strUILogicName='CUIEquipIntensify',strEventName='SelectResetValue'},			--点击附加属性重置分栏
	[0500024] = {strUILogicName='CUIEquipIntensify',strEventName='SelectAddValue'},				--点击附加属性炼制分栏
	[0500025] = {strUILogicName='CUIEquipIntensify',strEventName='SetEquipToSlot'},				--设置附加属性装备
	[0500041] = {strUILogicName='CUIEquipIntensify',strEventName='OnStartGo'},					--点击附加属性炼制界面任意开始按钮	

--宝石工艺类界面
	[0500015] = {strUILogicName='CUIStoneSystem',strEventName='SelectStoneCompose'},			--点击宝石界面合成分栏
	[0500016] = {strUILogicName='CUIStoneSystem',strEventName='SelectStoneInlay'},				--点击宝石界面镶嵌分栏
	[0500017] = {strUILogicName='CUIStoneSystem',strEventName='DoItem'},						--宝石合成界面放入宝石
	[0500018] = {strUILogicName='CUIStoneSystem',strEventName='ShowEquipStoneInfo'},			--宝石镶嵌界面放入装备
	[0500019] = {strUILogicName='CUIStoneSystem',strEventName='AddStone'},						--宝石镶嵌界面放入宝石
	[0500042] = {strUILogicName='CUIStoneSystem',strEventName='OnBeginComposeStone'},			--点击宝石合成界面开始合成按钮

--护身宝甲炼制
	[0500020] = {strUILogicName='CUIAmuletWnd',strEventName='SelectIntensify'},					--点击护身宝甲熔炼分栏
	[0500021] = {strUILogicName='CUIAmuletWnd',strEventName='SelectUpgrade'},					--点击护身宝甲升阶分栏
	[0500022] = {strUILogicName='CUIAmuletWnd',strEventName='SetSacrifice'},					--设置熔炼界面祭品槽
	[0500038] = {strUILogicName='CUIAmuletWnd',strEventName='IntensifyAmulet'},					--点击护身宝甲熔炼按钮
	[0500039] = {strUILogicName='CUIAmuletWnd',strEventName='UpgradeAmulet'},					--点击护身宝甲升阶按钮	

--自动寻路
	[0500036] = {strUILogicName='CUITaskInformation',strEventName='move'},						--点击任务追踪界面自动寻路
	[0500037] = {strUILogicName='CUITaskInformation',strEventName='fun'},						--点击任务追踪界面特殊链接





	[0500045] = {strUILogicName='CMountMainUI',strEventName='Ride'},							--点击坐骑界面骑乘按钮
	
--new
	[0500046] = {strUILogicName='CUITeam',strEventName='CreateTeam'},							--点击组队界面创建队伍按钮
	[0500047] = {strUILogicName='CUITeam',strEventName='Request'},								--点击组队界面邀请按钮
	
	[0500048] = {strUILogicName='CUIFriendList',strEventName='DoRecommend'},					--点击好友列表界面江湖关系按钮
	[0500049] = {strUILogicName='CUIMainPageHeadPic',strEventName='HPLow'},						--头像HP低于70%
	[0500050] = {strUILogicName='CUIPlayerAttribute',strEventName='ShowIntroPoint'},			--点击人物属性面板推荐按钮
	
	[0500051] = {strUILogicName='CUITaskInformation',strEventName='DoAcceptBtnClick'},			--点击任务提示当前任务按钮
	[0500052] = {strUILogicName='CUITaskInformation',strEventName='DoCanAcceptBtnClick'},		--点击任务提示可接任务按钮
	
	[0500053] = {strUILogicName='CUIMainPageHeadPic',strEventName='GetWrathPoint'},				--玩家获得煞元
	
	[0500054] = {strUILogicName='CMountMainUI',strEventName='ShowMountUpGrade'},				--点击坐骑主界面升阶按钮
	[0500055] = {strUILogicName='CMountUpGradeUI',strEventName='UpGrade'},						--点击坐骑升阶界面升阶按钮
	
	[0500056] = {strUILogicName='CUIMainPageShrtcut',strEventName='DoRetreatOper'},				--点击主界面闭关按钮
	[0500057] = {strUILogicName='CUIMainPageShrtcut',strEventName='DoSitOper'},					--点击主界面演武按钮
	[0500058] = {strUILogicName='CUIMainPageShrtcut',strEventName='DoRideOper'},				--点击主界面骑乘按钮
	[0500059] = {strUILogicName='CUIMainPageShrtcut',strEventName='DoHangupOper'},				--点击主界面挂机按钮
	
	[0500061] = {strUILogicName='CUIMuse',strEventName='ShowFriendBiGuan'},						--点击灌注界面好友按钮
	[0500062] = {strUILogicName='CUIMuse',strEventName='InjectMuse'},							--点击灌注界面灌注按钮
		[0500081] = {strUILogicName='CUIMainPageFunSet',strEventName='DoJiangHuOper'},--打开江湖界面
	
	[0500071] = {strUILogicName='CUIMountPanel',strEventName='DoChangeToSoulMount'},				--点击坐骑界面猎魂分页
	[0500072] = {strUILogicName='CUISoulDepot',strEventName='DoOpenSoulHunt'},					--点击背包界面猎魂按钮
	[0500073] = {strUILogicName='CUISoulHunt',strEventName='DoClickMonster'},					--点击猎魂界面猎魂头像
	[0500074] = {strUILogicName='CUISoulHunt',strEventName='DoSoulAutoHunt'},					--点击猎魂界面一键猎魂
	[0500075] = {strUILogicName='CUISoulHunt',strEventName='DoSoulHuntAutoMerge'},				--点击猎魂界面一键合成
	[0500076] = {strUILogicName='CUISoulHunt',strEventName='DoSoulAutoPick'},					--点击猎魂界面一键拾取
	[0500077] = {strUILogicName='CUISoulDepot',strEventName='DoSoulAutoMerge'},					--点击背包界面一键合成
	[0500078] = {strUILogicName='CUISoulMount',strEventName='DoDropToEquip'},					--点击坐骑界面放到槽位
	[0500079] = {strUILogicName='CUISoulHunt',strEventName='DoOpenDepot'},--战魂背包点击事件
	[0500080] = {strUILogicName='CUISoulMount',strEventName='DoEatToEquip'},--融合事件
--奇物点击事件
	[0500101] = {strUILogicName='CUIMainPageShrtcut',strEventName='DoGroup1Oper'},				--点击奇物按钮事件
	[0500102] = {strUILogicName='CUIMainPageShrtcut',strEventName='DoSwordOper'},				--点击名剑按钮事件
	--[0500103] = {strUILogicName='CUIMainPageShrtcut',strEventName='DoXiuXingOper'},				--点击修行按钮事件
	--[0500104] = {strUILogicName='CUIMainPageShrtcut',strEventName='DoAmuletOper'},				--点击宝甲按钮事件
	--[0500105] = {strUILogicName='CUIMainPageShrtcut',strEventName='DoHiddenWeaponOper'},		--点击暗器按钮事件
	--[0500106] = {strUILogicName='CUIMainPageShrtcut',strEventName='DoShieldOper'},				--点击法宝按钮事件
	--[0500107] = {strUILogicName='CUIMainPageShrtcut',strEventName='DoGourdOper'},				--点击酒葫芦按钮事件
}
--==================================================================================--
--升级事件
--dwLevel：到达等级
_G.NoviceGuideEventConfig[enNoviceGuideEventType.eLevel] =
{
		[0600001] = {dwLevel=2},
		[0600002] = {dwLevel=5},
		[0600003] = {dwLevel=10},
		[0600004] = {dwLevel=15},
		[0600005] = {dwLevel=20},
		[0600006] = {dwLevel=25},	
		[0600007] = {dwLevel=30},
		[0600008] = {dwLevel=44},			--奇物开启，名剑开启
		[0600009] = {dwLevel=48},			--修行开启
		[0600010] = {dwLevel=56},			--宝甲开启
		[0600011] = {dwLevel=65},			--暗器开启
		[0600012] = {dwLevel=71},			--法宝开启
		[0600013] = {dwLevel=78},			--酒葫芦开启
		[0600014] = {dwLevel=45},			--升到45级
		[0600015] = {dwLevel=49},			--升到49级
		[0600016] = {dwLevel=57},			--升到57级
		[0600017] = {dwLevel=66},			--升到66级
		[0600018] = {dwLevel=72},			--升到72级
		[0600019] = {dwLevel=79},			--升到79级
		[0600020] = {dwLevel=82},			--战旗开启		
}
--==================================================================================--
--对话事件
--dwNPCId：NPC的ID
--dwTaskId：NPC对话中的任务ID
--dwTaskState：任务状态
	-- 0：无任务
	-- 1：任务可接
	-- 2：任务可交
_G.NoviceGuideEventConfig[enNoviceGuideEventType.eTalk] =
{
		[0700001]	=	{dwNPCId=10011011,dwTaskId=	1002	,dwTaskState=1},
		[0700002]	=	{dwNPCId=10011011,dwTaskId=	1001	,dwTaskState=2},
		[0700003]	=	{dwNPCId=10011022,dwTaskId=	1002	,dwTaskState=2},
		[0700004]	=	{dwNPCId=10011022,dwTaskId=	1028	,dwTaskState=1},		
}


--------------------------------------------------------------------------------------
--引导组件配置信息
_G.NoviceGuideComponentConfig = {}
--------------------------------------------------------------------------------------
--组件类型枚举
_G.enNoviceGuideComponentType =
{
	eNpcArrow	= 1,	--NPC箭头
	eNpcText	= 2,	--NPC文字
	eNpcPicture = 3,	--NPC图片
	eUIArrow	= 4,	--UI箭头
	eUIText		= 5,	--UI文字
	eUIPicture	= 6,	--UI图片
	eUIRect		= 7,	--UI提示框
	eOpenUI		= 8,	--打开UI
	eCoverUI	= 9,	--遮盖UI
	eUIPoint	= 10,	--UI指针
};
--==================================================================================--
--NPC箭头
--dwNpcId：NPC的ID
--dwOffsetX：X轴偏移距离
--dwOffsetY：Y轴偏移距离
--dwOffsetZ：Z轴偏移距离
_G.NoviceGuideComponentConfig[enNoviceGuideComponentType.eNpcArrow] =
{
	[0100001] = {dwNpcId=10011001,dwOffsetX=0,dwOffsetY=0,dwOffsetZ=2},
	[0100002] = {dwNpcId=10011001,dwOffsetX=0,dwOffsetY=0,dwOffsetZ=2},
};
--==================================================================================--
--NPC文字
--dwNpcId：NPC的ID
--dwOffsetX：X轴偏移距离
--dwOffsetY：Y轴偏移距离
--dwOffsetZ：Z轴偏移距离
--strText：文字内容
_G.NoviceGuideComponentConfig[enNoviceGuideComponentType.eNpcText] =
{
	[0200001] = {dwNpcId=10011001,dwOffsetX=0,dwOffsetY=0,dwOffsetZ=4,strText='文字测试1'},
	[0200002] = {dwNpcId=10011001,dwOffsetX=0,dwOffsetY=0,dwOffsetZ=4,strText='文字测试2'},
};
--==================================================================================--
--NPC图片
--dwNpcId：NPC的ID
--dwOffsetX：X轴偏移距离
--dwOffsetY：Y轴偏移距离
--dwOffsetZ：Z轴偏移距离
--strFileName：图片文件名
--dwWidth：图片宽度
--dwHeight：图片高度
_G.NoviceGuideComponentConfig[enNoviceGuideComponentType.eNpcPicture] =
{
	[0300001] = {dwNpcId=10011001,dwOffsetX=0,dwOffsetY=0,dwOffsetZ=3,strFileName='icon1.png',dwWidth=0.3,dwHeight=0.3},
	[0300002] = {dwNpcId=10011001,dwOffsetX=0,dwOffsetY=0,dwOffsetZ=3,strFileName='icon2.png',dwWidth=0.3,dwHeight=0.3},
};
--==================================================================================--
--UI箭头
--strSWFName：挂接的SWF
--dwOffsetX：X轴偏移距离
--dwOffsetY：Y轴偏移距离
--dwDirection：箭头方向
	-- 1：上
	-- 2：右
	-- 3：左
	-- 4：下
	-- 5: 上（无箭头）
	-- 6: 下（无箭头）
_G.NoviceGuideComponentConfig[enNoviceGuideComponentType.eUIArrow] =
{
--NpcTalk界面箭头
	[0400001] = {strSWFName='NpcTalk',dwOffsetX=345,dwOffsetY=68,dwDirection=3},
	[0400002] = {strSWFName='NpcTalk',dwOffsetX=345,dwOffsetY=68,dwDirection=3},
 
--任务追踪界面箭头
 [0400020] = {strSWFName='zhujiemianUI_renwuyindao',dwOffsetX=-80,dwOffsetY=3,dwDirection=2}, 
 
 
--自动寻路、装备更换界面内箭头
 [0400021] = {strSWFName='CUITaskHelp',dwOffsetX=15,dwOffsetY=60,dwDirection=4},
 [0400023] = {strSWFName='EquipWearNoticeFirstEquip',dwOffsetX=-10,dwOffsetY=65,dwDirection=1},
 
 
--人物属性界面箭头
	[0400071]	=	{strSWFName='AvatarEquip',dwOffsetX=543,dwOffsetY=340,dwDirection=3},
 [0400028] = {strSWFName='AvatarEquip',dwOffsetX=488,dwOffsetY=433,dwDirection=1},
 [0400029] = {strSWFName='AvatarEquip',dwOffsetX=533,dwOffsetY=430,dwDirection=1},
 [0400030] = {strSWFName='AvatarEquip',dwOffsetX=583,dwOffsetY=-10,dwDirection=3},
 
 
--五行真气界面箭头
 [0400031] = {strSWFName='UIFiveElem',dwOffsetX=147,dwOffsetY=60,dwDirection=4},
 [0400032] = {strSWFName='UIFiveElem',dwOffsetX=580,dwOffsetY=405,dwDirection=3},
 [0400033] = {strSWFName='UIFiveElem',dwOffsetX=585,dwOffsetY=0,dwDirection=3},
 [0400038] = {strSWFName='MainPageElem',dwOffsetX=0,dwOffsetY=20,dwDirection=1},
 
 
--技能界面箭头
 [0400034] = {strSWFName='Skill',dwOffsetX=-35,dwOffsetY=57,dwDirection=4},--第一个技能
 [0400039] = {strSWFName='Skill',dwOffsetX=20,dwOffsetY=57,dwDirection=4},--第二个技能
 [0400075] = {strSWFName='Skill',dwOffsetX=75,dwOffsetY=57,dwDirection=4},--第三个技能 
 [0400035] = {strSWFName='Skill',dwOffsetX=432,dwOffsetY=465,dwDirection=3},
 [0400036] = {strSWFName='Skill',dwOffsetX=495,dwOffsetY=-5,dwDirection=3},
 [0400037] = {strSWFName='MainPageShrtcut',dwOffsetX=75,dwOffsetY=80,dwDirection=4},
 [0400041] = {strSWFName='Skill',dwOffsetX=-65,dwOffsetY=85,dwDirection=4},--内功分页
 [0400042] = {strSWFName='Skill',dwOffsetX=-55,dwOffsetY=47,dwDirection=2},--第一个内功
 [0400043] = {strSWFName='MainPageShrtcut',dwOffsetX=0,dwOffsetY=95,dwDirection=6},
 [0400044] = {strSWFName='Skill',dwOffsetX=-55,dwOffsetY=47,dwDirection=4},--第一个心法
 [0400054] = {strSWFName='Skill',dwOffsetX=-65,dwOffsetY=115,dwDirection=4},--五行技能分页
 [0400063] = {strSWFName='Skill',dwOffsetX=-65,dwOffsetY=95,dwDirection=2},--心法分页
 [0400070] = {strSWFName='Skill',dwOffsetX=138,dwOffsetY=230,dwDirection=4},--无双
 [0400079] = {strSWFName='Skill',dwOffsetX=78,dwOffsetY=230,dwDirection=4},--大挪移 
 
 
--经脉界面箭头
 [0400045] = {strSWFName='CUIRole',dwOffsetX=225,dwOffsetY=185,dwDirection=3},
 [0400046] = {strSWFName='CUIPulseSub',dwOffsetX=50,dwOffsetY=332,dwDirection=1},
 [0400047] = {strSWFName='CUIRole',dwOffsetX=580,dwOffsetY=0,dwDirection=3},
 
 
--任务界面箭头
 [0400050] = {strSWFName='CUITaskMain',dwOffsetX=-45,dwOffsetY=105,dwDirection=4},
 [0400051] = {strSWFName='CUITaskMain',dwOffsetX=470,dwOffsetY=80,dwDirection=3},
 [0400052] = {strSWFName='CUITaskMain',dwOffsetX=470,dwOffsetY=300,dwDirection=3},
 [0400053] = {strSWFName='CUITaskMain',dwOffsetX=-40,dwOffsetY=370,dwDirection=4},
 [0400055] = {strSWFName='CUITaskMain',dwOffsetX=510,dwOffsetY=0,dwDirection=3},
 
--打坐界面箭头
 [0400056] = {strSWFName='SitMain',dwOffsetX=90,dwOffsetY=165,dwDirection=2},

--装备炼制界面箭头
 [0400057] = {strSWFName='EquipIntensify',dwOffsetX=-15,dwOffsetY=55,dwDirection=3},
 [0400058] = {strSWFName='EquipIntensify',dwOffsetX=12,dwOffsetY=432,dwDirection=1},
 [0400062] = {strSWFName='EquipIntensify',dwOffsetX=270,dwOffsetY=-5,dwDirection=3},
 
 
--NPC商店
 [0400059] = {strSWFName='UINpcShop',dwOffsetX=110,dwOffsetY=410,dwDirection=5},
 [0400060] = {strSWFName='UINpcShop',dwOffsetX=0,dwOffsetY=45,dwDirection=4},
 [0400061] = {strSWFName='UINpcShopMulti',dwOffsetX=30,dwOffsetY=95,dwDirection=1},

--组队界面
 [0400064] = {strSWFName='TeamMainUI',dwOffsetX=345,dwOffsetY=10,dwDirection=4},
 [0400065] = {strSWFName='TeamMainUI',dwOffsetX=-23,dwOffsetY=90,dwDirection=4},
 [0400066] = {strSWFName='TeamMainUI',dwOffsetX=620,dwOffsetY=80,dwDirection=3},
 [0400067] = {strSWFName='TeamMainUI',dwOffsetX=630,dwOffsetY=-10,dwDirection=3},
 
--坐骑界面
 [0400068] = {strSWFName='UIMountBack',dwOffsetX=400,dwOffsetY=430,dwDirection=1},
 [0400069] = {strSWFName='UIMountBack',dwOffsetX=465,dwOffsetY=-5,dwDirection=3},
 [0400078] = {strSWFName='UIMountBack',dwOffsetX=65,dwOffsetY=395,dwDirection=1},
 
--好友界面
 [0400073] = {strSWFName='FriendList',dwOffsetX=170,dwOffsetY=418,dwDirection=1},
 [0400074] = {strSWFName='CUIFriendPlatform',dwOffsetX=85,dwOffsetY=400,dwDirection=1}, 

--玩家头像
 [0400076] = {strSWFName='MainPageHeadPic',dwOffsetX=135,dwOffsetY=-60,dwDirection=1}, 
 [0400077] = {strSWFName='MainPageHeadPic',dwOffsetX=210,dwOffsetY=-40,dwDirection=1},
 
--真气灌注界面
 [0400080] = {strSWFName='biguan',dwOffsetX=210,dwOffsetY=170,dwDirection=3},
 [0400081] = {strSWFName='biguan',dwOffsetX=515,dwOffsetY=-15,dwDirection=3}, 
 
--战魂界面 
 [0400082] = {strSWFName='UIMountBack',dwOffsetX=250,dwOffsetY=52,dwDirection=2},
 [0400083] = {strSWFName='UIMountBack',dwOffsetX=380,dwOffsetY=398,dwDirection=4}, 
 [0400084] = {strSWFName='CUISoulHunt',dwOffsetX=0,dwOffsetY=285,dwDirection=4},
 [0400085] = {strSWFName='CUISoulHunt',dwOffsetX=520,dwOffsetY=250,dwDirection=4},
 [0400086] = {strSWFName='CUISoulHunt',dwOffsetX=560,dwOffsetY=325,dwDirection=3},
 [0400087] = {strSWFName='UIMountBack',dwOffsetX=250,dwOffsetY=52,dwDirection=2},
 [0400088] = {strSWFName='UIMountBack',dwOffsetX=470,dwOffsetY=-10,dwDirection=3},  
};
--==================================================================================--
--UI箭头2
--strSWFName：挂接的SWF
--dwOffsetX：X轴偏移距离
--dwOffsetY：Y轴偏移距离
--dwDirection：箭头方向
	-- 1: 上
	-- 2: 下
_G.NoviceGuideComponentConfig[enNoviceGuideComponentType.eUIPoint] =
{
--主界面UI箭头
 --人物属性
 [1000001] = {strSWFName='MainPageShrtcut',dwOffsetX=400,dwOffsetY=60,dwDirection=2},
 --技能界面
 [1000002] = {strSWFName='MainPageShrtcut',dwOffsetX=500,dwOffsetY=60,dwDirection=2},
 --五行真气
 [1000003] = {strSWFName='MainPageShrtcut',dwOffsetX=736,dwOffsetY=15,dwDirection=2},
 --经脉界面
	[1000004] = {strSWFName='MainPageShrtcut',dwOffsetX=400,dwOffsetY=60,dwDirection=2},
 --任务界面	
	[1000005] = {strSWFName='MainPageShrtcut',dwOffsetX=135,dwOffsetY=60,dwDirection=2},
 --打坐界面
 [1000006] = {strSWFName='MainPageShrtcut',dwOffsetX=365,dwOffsetY=90,dwDirection=2},
 --组队界面
 [1000007] = {strSWFName='MainPageShrtcut',dwOffsetX=635,dwOffsetY=60,dwDirection=2},
 --坐骑界面
 [1000008] = {strSWFName='MainPageShrtcut',dwOffsetX=548,dwOffsetY=60,dwDirection=2},
 --装备炼制界面
 [1000009] = {strSWFName='MainPageShrtcut',dwOffsetX=725,dwOffsetY=15,dwDirection=2},
 --好友界面
 [1000010] = {strSWFName='MainPageShrtcut',dwOffsetX=591,dwOffsetY=60,dwDirection=2}, 
 --宝甲界面
 [1000011] = {strSWFName='MainPageShrtcut',dwOffsetX=561,dwOffsetY=15,dwDirection=2},  
 --江湖界面
 [1000012] = {strSWFName='MainPageShrtcut',dwOffsetX=505,dwOffsetY=15,dwDirection=2},  
--奇物
 [1000013] = {strSWFName='MainPageShrtcut',dwOffsetX=592,dwOffsetY= 0,dwDirection=2}, 		--奇物按钮箭头
 [1000014] = {strSWFName='MainPageShrtcut',dwOffsetX=592,dwOffsetY=-50,dwDirection=2},		--名剑按钮箭头
 --[1000015] = {strSWFName='MainPageShrtcut',dwOffsetX=619,dwOffsetY=-50,dwDirection=2},		--修行按钮箭头
 --[1000016] = {strSWFName='MainPageShrtcut',dwOffsetX=642,dwOffsetY=-50,dwDirection=2},		--宝甲按钮箭头
 --[1000017] = {strSWFName='MainPageShrtcut',dwOffsetX=662,dwOffsetY=-50,dwDirection=2},		--暗器按钮箭头
 --[1000018] = {strSWFName='MainPageShrtcut',dwOffsetX=682,dwOffsetY=-50,dwDirection=2},		--法宝按钮箭头
-- [1000019] = {strSWFName='MainPageShrtcut',dwOffsetX=702,dwOffsetY=-50,dwDirection=2},		--酒葫芦按钮箭头
}
--==================================================================================--
--UI文字
--strSWFName：挂接的SWF
--dwOffsetX：X轴偏移距离
--dwOffsetY：Y轴偏移距离
--strText：文字内容
_G.NoviceGuideComponentConfig[enNoviceGuideComponentType.eUIText] =
{
--NpcTalk界面文字
	[0500001] = {strSWFName='NpcTalk',dwOffsetX=570,dwOffsetY=165,strText=[[少侠请点击此处<font color='#00ff00'>接受任务</font>。]]},
	[0500002] = {strSWFName='NpcTalk',dwOffsetX=570,dwOffsetY=165,strText=[[少侠请点击此处<font color='#4ae833'>进入副本</font>。]]},
	[0500003] = {strSWFName='NpcTalk',dwOffsetX=570,dwOffsetY=165,strText=[[少侠请点击此处<font color='#00ff00'>交付任务</font>。]]},
	--[0500004] = {strSWFName='NpcTalk',dwOffsetX=615,dwOffsetY=275,strText=[[点击此处<font color='#4ae833'>可跳过对话</font>接取任务。]]},
	[0500058] = {strSWFName='NpcTalk',dwOffsetX=500,dwOffsetY=150,strText=[[少侠请点击此处<font color='#00ff00'>进行装备强化</font>。]]},
	[0500061] = {strSWFName='NpcTalk',dwOffsetX=500,dwOffsetY=150,strText=[[少侠请点击此处<font color='#00ff00'>与店老板交易</font>。]]},
	[0500062] = {strSWFName='NpcTalk',dwOffsetX=500,dwOffsetY=150,strText=[[少侠请点击此处<font color='#00ff00'>打开仓库</font>。]]},
--主界面UI文字
 --人物属性
 [0500005] = {strSWFName='MainPageShrtcut',dwOffsetX=480,dwOffsetY=85,strText=[[	恭喜少侠获悉人物属性！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
 --技能界面
 [0500006] = {strSWFName='MainPageShrtcut',dwOffsetX=630,dwOffsetY=85,strText=[[	恭喜少侠获得武学秘籍！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
 --五行真气
 [0500007] = {strSWFName='MainPageShrtcut',dwOffsetX=550,dwOffsetY=38,strText=[[	恭喜少侠领悟五行真气！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
 --经脉
 [0500008] = {strSWFName='MainPageShrtcut',dwOffsetX=520,dwOffsetY=85,strText=[[	恭喜少侠领悟奇经八脉！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
 --任务
 [0500009] = {strSWFName='MainPageShrtcut',dwOffsetX=-20,dwOffsetY=85,strText=[[少侠可查看任务详情。<br/><font color='#00ff00'>左键点击打开</font>。]]},
 --打坐
 [0500010] = {strSWFName='MainPageShrtcut',dwOffsetX=505,dwOffsetY=130,strText=[[少侠可点击此处<font color='#00ff00'>开始演武</font>。]]},
 --组队
 [0500011] = {strSWFName='MainPageShrtcut',dwOffsetX=460,dwOffsetY=85,strText=[[	组织队伍可提升战斗效率！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
 --坐骑
 [0500012] = {strSWFName='MainPageShrtcut',dwOffsetX=700,dwOffsetY=85,strText=[[	恭喜少侠获得坐骑！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
--装备炼制
 [0500082] = {strSWFName='MainPageShrtcut',dwOffsetX=565,dwOffsetY=38,strText=[[	炼制装备可提高战力！<br/>	<font color='#00ff00'>左键点击打开</font>。]]}, 
 --好友
 [0500080] = {strSWFName='MainPageShrtcut',dwOffsetX=430,dwOffsetY=85,strText=[[	少侠可查看社交详情！<br/>	<font color='#00ff00'>左键点击打开</font>。]]}, 
	--宝甲
 [0500089] = {strSWFName='MainPageShrtcut',dwOffsetX=478,dwOffsetY=38,strText=[[	少侠可查看护身宝甲！<br/>	<font color='#00ff00'>左键点击打开</font>。]]}, 
	--江湖
 [0500099] = {strSWFName='MainPageShrtcut',dwOffsetX=645,dwOffsetY=38,strText=[[恭喜少侠获得江湖侠客！<br/>	<font color='#00ff00'>左键点击打开</font>。]]}, 
 --奇物
 [0500110] = {strSWFName='MainPageShrtcut',dwOffsetX=730,dwOffsetY=38,strText=[[少侠可打开奇物查看名剑！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
-- [0500111] = {strSWFName='MainPageShrtcut',dwOffsetX=730,dwOffsetY=-8,strText=[[少侠可查看名剑！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
 [0500112] = {strSWFName='MainPageShrtcut',dwOffsetX=730,dwOffsetY=38,strText=[[少侠可打开奇物查看修行！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
 [0500113] = {strSWFName='MainPageShrtcut',dwOffsetX=730,dwOffsetY=38,strText=[[少侠可打开奇物查看宝甲！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
 [0500114] = {strSWFName='MainPageShrtcut',dwOffsetX=730,dwOffsetY=38,strText=[[少侠可打开奇物查看暗器！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
 [0500115] = {strSWFName='MainPageShrtcut',dwOffsetX=730,dwOffsetY=38,strText=[[少侠可打开奇物查看护身法宝！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
 [0500116] = {strSWFName='MainPageShrtcut',dwOffsetX=730,dwOffsetY=38,strText=[[少侠可打开奇物查看酒葫芦！<br/>	<font color='#00ff00'>左键点击打开</font>。]]},
 [0500117] = {strSWFName='MainPageShrtcut',dwOffsetX=730,dwOffsetY=38,strText=[[少侠可打开奇物查看战旗！<br/>	<font color='#00ff00'>左键点击打开</font>。]]}, 
	
--自动寻路、装备更换界面指示文字
 	--[0500018] = {strSWFName='CUITaskHelp',dwOffsetX=-160,dwOffsetY=55,strText=[[少侠请左键点击<font color='#00ff00'>自动前往</font>。]]},
	[0500021] = {strSWFName='EquipWearNoticeFirstEquip',dwOffsetX=-150,dwOffsetY=190,strText=[[恭喜少侠获得<font color='#00ff00'>武器！</font><br/>点击<font color='#00ff00'>立即穿戴</font>提升战斗力。]]},
	
	
	--人物属性界面指示文字
	[0500027]	=	{strSWFName='AvatarEquip',dwOffsetX=535,dwOffsetY=450,strText=[[若无从下手，可<font color='#00ff00'>点击推荐</font>查看参考方案。]]},
	[0500079]	=	{strSWFName='AvatarEquip',dwOffsetX=595,dwOffsetY=340,strText=[[少侠可<font color='#00ff00'>点击按钮</font>分配新获得的潜能点。]]},
	[0500028] = {strSWFName='AvatarEquip',dwOffsetX=580,dwOffsetY=450,strText=[[点击<font color='#00ff00'>确认</font>，即可提升相应属性。]]},
 [0500029] = {strSWFName='AvatarEquip',dwOffsetX=583,dwOffsetY=-45,strText=[[点击<font color='#00ff00'>关闭</font>，继续闯荡江湖。]]},
 
 
--五行真气界面指示文字
 [0500031] = {strSWFName='UIFiveElem',dwOffsetX=195,dwOffsetY=83,strText=[[少侠请点击<font color='#00ff00'>选中五行</font>。]]},
 [0500032] = {strSWFName='UIFiveElem',dwOffsetX=620,dwOffsetY=410,strText=[[点击<font color='#00ff00'>提升等级</font>确认提升。]]},
 [0500033] = {strSWFName='UIFiveElem',dwOffsetX=660,dwOffsetY=10,strText=[[点击<font color='#00ff00'>关闭</font>，继续闯荡江湖。]]},
 [0500038] = {strSWFName='MainPageElem',dwOffsetX=0,dwOffsetY=83,strText=[[少侠可从此处随时获知<font color='#00ff00'>五行真气</font>的当前状态。]]},
 
 
 
--技能界面指示文字
 [0500034] = {strSWFName='Skill',dwOffsetX=105,dwOffsetY=125,strText=[[点击此处<font color='#00ff00'>选中招式</font>。]]},--第一个技能
 [0500039] = {strSWFName='Skill',dwOffsetX=155,dwOffsetY=125,strText=[[点击此处<font color='#00ff00'>选中招式</font>。]]},--第二个技能
 [0500081] = {strSWFName='Skill',dwOffsetX=205,dwOffsetY=125,strText=[[点击此处<font color='#00ff00'>选中招式</font>。]]},--第三个技能
 [0500035] = {strSWFName='Skill',dwOffsetX=657,dwOffsetY=560,strText=[[点击此处<font color='#00ff00'>确认学习</font>。]]},
 [0500040] = {strSWFName='MainPageShrtcut',dwOffsetX=-167,dwOffsetY=85,strText='新招式已放入快捷栏，善而用之，<br/>可大幅提升您的战斗效率。'},
 [0500037] = {strSWFName='Skill',dwOffsetX=705,dwOffsetY=90,strText=[[<font color='#00ff00'>点击关闭</font>，继续闯荡江湖。]]},
 [0500041] = {strSWFName='Skill',dwOffsetX=-220,dwOffsetY=90,strText=[[点击此处<font color='#00ff00'>查看内功</font>。]]},--内功分页
 [0500043] = {strSWFName='Skill',dwOffsetX=85,dwOffsetY=100,strText=[[点击此处<font color='#00ff00'>选中内功</font>。]]},--第一个内功
 [0500044] = {strSWFName='MainPageShrtcut',dwOffsetX=50,dwOffsetY=110,strText=[[少侠可点击此处<font color='#00ff00'>运行新内功</font>。]]},--内功
 [0500055] = {strSWFName='Skill',dwOffsetX=-220,dwOffsetY=90,strText=[[点击此处<font color='#00ff00'>查看心法</font>。]]},--心法分页
 [0500056] = {strSWFName='Skill',dwOffsetX=85,dwOffsetY=100,strText=[[点击此处<font color='#00ff00'>选中心法</font>。]]},--第一个心法
 [0500066] = {strSWFName='Skill',dwOffsetX=265,dwOffsetY=290,strText=[[点击此处<font color='#00ff00'>选中绝学</font>。]]},--无双
 [0500068] = {strSWFName='Skill',dwOffsetX=-220,dwOffsetY=175,strText=[[点击此处<font color='#00ff00'>查看五行技能</font>。]]},--五行技能分页
 [0500087] = {strSWFName='Skill',dwOffsetX=-220,dwOffsetY=110,strText=[[点击此处<font color='#00ff00'>查看基础</font>。]]},--基础分页 
 [0500088] = {strSWFName='Skill',dwOffsetX=210,dwOffsetY=290,strText=[[点击此处<font color='#00ff00'>选中轻功</font>。]]},--大挪移 
 
 
 
--经脉界面指示文字
 [0500045] = {strSWFName='CUIRole',dwOffsetX=280,dwOffsetY=183,strText=[[点击此处<font color='#00ff00'>选中经脉</font>。]]},
 [0500046] = {strSWFName='CUIPulseSub',dwOffsetX=200,dwOffsetY=450,strText=[[点击此处<font color='#00ff00'>提升经脉</font>。]]},
 [0500047] = {strSWFName='CUIRole',dwOffsetX=580,dwOffsetY=-30,strText=[[<font color='#00ff00'>点击关闭</font>，继续闯荡江湖。]]},
 
 
--任务界面内指示文字
 [0500050] = {strSWFName='CUITaskMain',dwOffsetX=555,dwOffsetY=80,strText=[[此处可查看当前<font color='#00ff00'>任务描述</font>。]]},
 [0500051] = {strSWFName='CUITaskMain',dwOffsetX=555,dwOffsetY=300,strText=[[此处可查看可获得的<font color='#00ff00'>任务奖励</font>。]]},
 [0500052] = {strSWFName='CUITaskMain',dwOffsetX=-200,dwOffsetY=380,strText=[[<font color='#00ff00'>勾选此处</font>，该任务则可<br/>显示在<font color='#00ff00'>任务追踪栏</font>内。]]},
 [0500053] = {strSWFName='CUITaskMain',dwOffsetX=-185,dwOffsetY=115,strText=[[点击查看<font color='#00ff00'>任务详情</font>。]]},
 [0500054] = {strSWFName='CUITaskMain',dwOffsetX=590,dwOffsetY=0,strText=[[<font color='#00ff00'>点击关闭</font>，继续闯荡江湖。]]},
 
--任务追踪界面指示文字
	[0500019] = {strSWFName='zhujiemianUI_renwuyindao',dwOffsetX=-298,dwOffsetY=85,strText=[[	点击<font color='#00ff00'>绿色下划线文字</font>，<br/>	自动前往任务目标处。]]},
 [0500022] = {strSWFName='zhujiemianUI_renwuyindao',dwOffsetX=-245,dwOffsetY=85,strText=[[当目标身上的光标变为剑时，可用<br/><font color='#00ff00'>右键单击</font>对其发动默认技能攻击，<br/>或用<font color='#00ff00'>左键单击</font>选择技能进行攻击。]]},
 [0500042] = {strSWFName='zhujiemianUI_renwuyindao',dwOffsetX=-180,dwOffsetY=160,strText=[[<font size='14'>恭喜少侠打出掉落！<br/><font color='#00ff00'>左键点击地上的物品</font><br/>或<font color='#ff0f0f' size = '18'>按<b>Z</b>键</font>皆可拾取。</font>]]}, 
 [0500020] = {strSWFName='zhujiemianUI_renwuyindao',dwOffsetX=-280,dwOffsetY=60,strText=[[到达目标地点后，<font color='#00ff00'>点击任务名旁的图标</font><br/>即可使用任务道具。]]},
 [0500084] = {strSWFName='zhujiemianUI_renwuyindao',dwOffsetX=-315,dwOffsetY=85,strText=[[当鼠标移到目标身上变为<font color='#00ff00'>剑形</font>，<br/>表示该目标可以被您攻击。]]},
 
--打坐界面指示文字
 [0500057] = {strSWFName='SitMain',dwOffsetX=90,dwOffsetY=195,strText=[[少侠可点击此处<font color='#00ff00'>选择武学</font><br/>进行修炼。]]},
 
--装备炼制界面指示文字
 [0500059] = {strSWFName='EquipIntensify',dwOffsetX=200,dwOffsetY=145,strText=[[少侠请<font color='#00ff00'>点击放入装备</font>进行强化。]]}, 
 [0500060] = {strSWFName='EquipIntensify',dwOffsetX=155,dwOffsetY=555,strText=[[少侠请点击<font color='#00ff00'>开始强化</font>。]]},
 [0500067] = {strSWFName='EquipIntensify',dwOffsetX=485,dwOffsetY=90,strText=[[<font color='#00ff00'>点击关闭</font>，继续闯荡江湖。]]},
 
--NPC商店
 [0500063] = {strSWFName='UINpcShop',dwOffsetX=110,dwOffsetY=440,strText=[[若是一时大意误售物品，<br/><font color='#00ff00'>右键点击此物</font>即可购回。]]},
 [0500064] = {strSWFName='UINpcShop',dwOffsetX=-40,dwOffsetY=45,strText=[[左键点击商品<font color='#00ff00'>即可购买</font>。]]},
 [0500065] = {strSWFName='UINpcShopMulti',dwOffsetX=60,dwOffsetY=95,strText=[[点击此处<font color='#00ff00'>确认购买</font>。]]},
 
 --组队界面
 [0500070] = {strSWFName='TeamMainUI',dwOffsetX=480,dwOffsetY=75,strText=[[队伍人数越多，<font color='#00ff00'>经验加成</font>越高！]]},
 [0500071] = {strSWFName='TeamMainUI',dwOffsetX=-203,dwOffsetY=60,strText=[[少侠可在此处<font color='#00ff00'>邀请其他侠士入队</font>。]]},
 [0500072] = {strSWFName='TeamMainUI',dwOffsetX=620,dwOffsetY=47,strText=[[点击邀请按钮<font color='#00ff00'>发出组队邀请</font>。]]},
 [0500073] = {strSWFName='TeamMainUI',dwOffsetX=630,dwOffsetY=-40,strText=[[<font color='#00ff00'>点击关闭</font>，继续闯荡江湖。]]},
 
 
 --坐骑界面
 [0500074] = {strSWFName='UIMountBack',dwOffsetX=80,dwOffsetY=413,strText=[[点击此处<font color='#00ff00'>激活坐骑</font>。]]},
 [0500075] = {strSWFName='UIMountBack',dwOffsetX=535,dwOffsetY=573,strText=[[点击此处<font color='#00ff00'>提升坐骑</font>。]]},
 [0500076] = {strSWFName='UIMountBack',dwOffsetX=670,dwOffsetY=85,strText=[[<font color='#00ff00'>点击关闭</font>，继续闯荡江湖。]]},
 [0500086] = {strSWFName='UIMountBack',dwOffsetX=130,dwOffsetY=413,strText=[[点击此处<font color='#00ff00'>开始坐骑升阶</font>。]]},
 
--好友界面 
 [0500077] = {strSWFName='FriendList',dwOffsetX=315,dwOffsetY=540,strText=[[点击此处查看<font color='#00ff00'>好友推荐</font>。]]}, 
 [0500078] = {strSWFName='CUIFriendPlatform',dwOffsetX=85,dwOffsetY=430,strText=[[点击此处查看<font color='#00ff00'>更多推荐</font>。]]},  
 
--玩家头像
 [0500083] = {strSWFName='MainPageHeadPic',dwOffsetX=270,dwOffsetY=70,strText=[[移动按钮，调整<font color='#00ff00'>自动吃药的时机</font>。]]},
 [0500085] = {strSWFName='MainPageHeadPic',dwOffsetX=345,dwOffsetY=85,strText=[[少侠已结成第一个<font color='#00ff00'>煞元</font>，<br/>消耗煞元可以释放<font color='#00ff00'>无双</font>。]]},

--真气灌注界面
 [0500090] = {strSWFName='biguan',dwOffsetX=450,dwOffsetY=270,strText=[[点击此处，完成<font color='#00ff00'>真气灌注</font>。]]},
 [0500091] = {strSWFName='biguan',dwOffsetX=740,dwOffsetY=80,strText=[[点击<font color='#00ff00'>关闭</font>，继续闯荡江湖。]]}, 
 
--战魂界面
 [0500092] = {strSWFName='UIMountBack',dwOffsetX=-35,dwOffsetY=140,strText=[[<font color='#00ff00'>拖动或左键点击背包中的战魂嵌入到此处</font>，<br/>可提升战力！]]},
 [0500093] = {strSWFName='UIMountBack',dwOffsetX=515,dwOffsetY=425,strText=[[点击此处，<font color='#00ff00'>开始猎魂</font>。]]},
 [0500094] = {strSWFName='CUISoulHunt',dwOffsetX=135,dwOffsetY=325,strText=[[圣兽出击，<font color='#00ff00'>猎取战魂</font>！]]},
 [0500095] = {strSWFName='CUISoulHunt',dwOffsetX=660,dwOffsetY=285,strText=[[战魂到手，<font color='#00ff00'>点击拾取</font>！]]},
 [0500096] = {strSWFName='CUISoulHunt',dwOffsetX=775,dwOffsetY=420,strText=[[<font color='#00ff00'>打开背包</font>，查看猎到的战魂。]]},
 [0500097] = {strSWFName='UIMountBack',dwOffsetX=15,dwOffsetY=140,strText=[[<font color='#00ff00'>拖动猎到的战魂至此处</font>，<br/>可与现有战魂融合，进一步增强！]]}, 
 [0500098] = {strSWFName='UIMountBack',dwOffsetX=675,dwOffsetY=85,strText=[[点击<font color='#00ff00'>关闭</font>，继续闯荡江湖。]]},
};
--==================================================================================--
--UI图片
--strSWFName：挂接的SWF
--dwOffsetX：X轴偏移距离
--dwOffsetY：Y轴偏移距离
--strFileName：图片文件名
_G.NoviceGuideComponentConfig[enNoviceGuideComponentType.eUIPicture] =
{
	[0600001] = {strSWFName='MainPageHeadPic',dwOffsetX=80,dwOffsetY=140,strFileName='moveHelp.swf'},
	[0600002] = {strSWFName='AmuletWnd',dwOffsetX=20,dwOffsetY=40,strFileName='icon2.png'},
};
--==================================================================================--
--UI提示框
--strSWFName: 挂接的SWF
--dwOffsetX: X轴偏移距离
--dwOffsetY: Y轴偏移距离
--dwWidth: 提示框宽度
--dwHeight: 提示框高度
_G.NoviceGuideComponentConfig[enNoviceGuideComponentType.eUIRect] =
{
	[0900001] = {strSWFName='MainPageHeadPic',dwOffsetX=80,dwOffsetY=140,dwWidth=200,dwHeight=100},
	[0900002] = {strSWFName='NpcTalk',dwOffsetX=297,dwOffsetY=176,dwWidth=175,dwHeight=23},
	[0900003] = {strSWFName='AvatarEquip',dwOffsetX=500,dwOffsetY=308,dwWidth=44,dwHeight=102},
	[0900005] = {strSWFName='AvatarEquip',dwOffsetX=500,dwOffsetY=413,dwWidth=36,dwHeight=23},
	[0900006] = {strSWFName='AvatarEquip',dwOffsetX=545,dwOffsetY=413,dwWidth=36,dwHeight=23},
	--[0900019]	=	{strSWFName='AvatarEquip',dwOffsetX=566,dwOffsetY=6,dwWidth=17,dwHeight=17},
	[0900004] = {strSWFName='EquipWearNoticeFirstEquip',dwOffsetX=74,dwOffsetY=173,dwWidth=71,dwHeight=22},
	[0900007] = {strSWFName='zhujiemianUI_renwuyindao',dwOffsetX=30,dwOffsetY=105,dwWidth=180,dwHeight=30},	
	[0900014] = {strSWFName='zhujiemianUI_renwuyindao',dwOffsetX=30,dwOffsetY=105,dwWidth=180,dwHeight=52},
	[0900017] = {strSWFName='Skill',dwOffsetX=69,dwOffsetY=176,dwWidth=38,dwHeight=38},--第一行第一个
	[0900008] = {strSWFName='Skill',dwOffsetX=124,dwOffsetY=176,dwWidth=38,dwHeight=38},	--第一行第二个
	[0900018] = {strSWFName='Skill',dwOffsetX=179,dwOffsetY=176,dwWidth=38,dwHeight=38},--第一行第三个
	[0900019] = {strSWFName='Skill',dwOffsetX=235,dwOffsetY=339,dwWidth=38,dwHeight=38},	--第二行第四个
	[0900016] = {strSWFName='Skill',dwOffsetX=180,dwOffsetY=339,dwWidth=38,dwHeight=38},	--第二行第三个	
	[0900010] = {strSWFName='Skill',dwOffsetX=477,dwOffsetY=572,dwWidth=92,dwHeight=27},--学习按钮
	[0900020] = {strSWFName='Skill',dwOffsetX=10,dwOffsetY=110,dwWidth=40,dwHeight=30},--心法分页
	[0900021] = {strSWFName='Skill',dwOffsetX=10,dwOffsetY=80,dwWidth=38,dwHeight=38},--内功分页	
	[0900027] = {strSWFName='Skill',dwOffsetX=10,dwOffsetY=145,dwWidth=40,dwHeight=30},--基础分页	
	[0900011] = {strSWFName='MainPageShrtcut',dwOffsetX=0,dwOffsetY=158,dwWidth=350,dwHeight=42},	
	[0900012] = {strSWFName='UIFiveElem',dwOffsetX=520,dwOffsetY=418,dwWidth=61,dwHeight=22},	
	[0900013] = {strSWFName='MainPageElem',dwOffsetX=0,dwOffsetY=0,dwWidth=500,dwHeight=20},
	[0900015] = {strSWFName='MountMainUI',dwOffsetX=481,dwOffsetY=538,dwWidth=70,dwHeight=22},
	[0900022] = {strSWFName='EquipIntensify',dwOffsetX=71,dwOffsetY=154,dwWidth=38,dwHeight=38},
	[0900023] = {strSWFName='EquipIntensify',dwOffsetX=87,dwOffsetY=536,dwWidth=92,dwHeight=27},
	[0900024] = {strSWFName='FriendList',dwOffsetX=231,dwOffsetY=518,dwWidth=92,dwHeight=27},
	[0900025] = {strSWFName='CUIFriendPlatform',dwOffsetX=360,dwOffsetY=20,dwWidth=64,dwHeight=22},	
	[0900026] = {strSWFName='CUIPulseSub',dwOffsetX=137,dwOffsetY=432,dwWidth=71,dwHeight=23},
	[0900028] = {strSWFName='TeamMainUI',dwOffsetX=445,dwOffsetY=118,dwWidth=38,dwHeight=38},--组队界面
	[0900029] = {strSWFName='UIMountBack',dwOffsetX=450,dwOffsetY=516,dwWidth=105,dwHeight=26},			
};
--==================================================================================--
--打开UI
--strSWFName：打开的SWF
_G.NoviceGuideComponentConfig[enNoviceGuideComponentType.eOpenUI] =
{
	[0700001] = {strSWFName='biguan_lq_tishi'},
	[0700002] = {strSWFName='CUINoviceMoveHelp'},
	[0700003] = {strSWFName='CUINoviceLevelUp'},
	[0700004] = {strSWFName='CUINoviceCover'},
};
--==================================================================================--
--遮盖UI
--strSWFName：挂接的SWF
--dwOffsetX：X轴偏移距离
--dwOffsetY：Y轴偏移距离
--dwWidth: 宽度
--dwHeight: 高度
_G.NoviceGuideComponentConfig[enNoviceGuideComponentType.eCoverUI] =
{

};

--升级窗口配置信息
_G.NoviceGuideLevelUpWndConfig = {}
--弹出窗口枚举
_G.enNoviceGuideWndEnum =
{
	ePacket		= 1,	--背包
	eElement	= 2,	--五行
	ePluse		= 3,	--经脉
	eBoundary	= 4,	--境界
	eTask		= 5,	--任务
	eMap		= 6,	--大地图
	eRide		= 7,	--坐骑
	eDaily		= 8,	--每日活动
	eGuild		= 9,	--帮派
	eMonster	= 10,	--异兽
	eGift		= 11,	--新手礼包
	eCut		= 12,	--境界
	eElemSkill	= 13,	--五行技能
};

--dwLevel：到达等级
--strLine1Description：第一行描述文字，strLine1Text：第一行链接文字，dwLine1UI：第一行打开的UI
--strLine2Description：第二行描述文字，strLine2Text：第二行链接文字，dwLine2UI：第二行打开的UI
--strLine3Description：第三行描述文字，strLine3Text：第三行链接文字，dwLine3UI：第三行打开的UI
--strLine4Description：第四行描述文字，strLine4Text：第四行链接文字，dwLine4UI：第四行打开的UI
--strLine5Description：第五行描述文字，strLine5Text：第五行链接文字，dwLine5UI：第五行打开的UI
--strLine6Description：第六行描述文字，strLine6Text：第六行链接文字，dwLine6UI：第六行打开的UI
	--可选UI
		-- 1：背包
		-- 2：五行
		-- 3：经脉
		-- 4：境界
		-- 5：任务
		-- 6：大地图
		-- 7：坐骑
		-- 8：每日活动
		-- 9：帮派
		-- 10：异兽
		-- 11：新手礼包
		-- 12: 人物境界
		-- 13: 五行技能
_G.NoviceGuideLevelUpWndConfig =
{
	[5] = {dwLevel=5,
	strLine1Description='人物达到五级！请领取新手礼包奖励，它们将成为您闯荡江湖的一大助力。',strLine1Text='打开礼包',dwLine1UI=11,
	strLine2Description='人体五脏各有五行，真气生发于脏腑，流转于经脉，归顺于丹田，五行汇极，生生不息，可助您提升武学威力，通润经脉。',strLine2Text='查看五行真气',dwLine2UI=2,
	strLine3Description='当前可选的升级途径：',strLine3Text='主线任务',dwLine3UI=5,},
	[10] = {dwLevel=10,
	strLine1Description='人物达到十级！请领取新手礼包奖励，它们将成为您闯荡江湖的一大助力。',strLine1Text='打开礼包',dwLine1UI=11,
	strLine2Description='人体五脏各有五行，真气生发于脏腑，流转于经脉，归顺于丹田，五行汇极，生生不息，可助您提升武学威力，通润经脉。',strLine2Text='查看五行真气',dwLine2UI=2,
	strLine3Description='开通新地图：',strLine3Text='襄阳城、襄阳野郊',dwLine3UI=6,
	strLine4Description='当前可选的升级途径：',strLine4Text='主线任务',dwLine4UI=5,},	

	[15] = {dwLevel=15,
	strLine1Description='人物达到十五级！请领取新手礼包奖励，它们将成为您闯荡江湖的一大助力。',strLine1Text='打开礼包',dwLine1UI=11,strLine2Description='良骑配英雄，数风流人物，焉能没有神骏宝骑以作代步之用。一匹优秀的坐骑，将成为您江湖之旅的良伴。',strLine2Text='查看我的坐骑',dwLine2UI=7,
	strLine3Description='当前可选的升级途径：',strLine3Text='主线任务、支线任务',dwLine3UI=5,
	},
	[20] = {dwLevel=20,
	strLine1Description='人物达到二十级！请领取新手礼包奖励，它们将成为您闯荡江湖的一大助力。',strLine1Text='打开礼包',dwLine1UI=11,
	strLine2Description='奇遇和诱惑一一呈现，危机与挑战无处不在，不再是初入江湖的侠少天真，更深的面纱已经揭开，江湖凶险，等您来战！',strLine2Text='查看每日活动',dwLine2UI=8,
	strLine3Description='开通新地图：',strLine3Text='桃花岛',dwLine3UI=6,
	strLine4Description='当前可选的升级途径：',strLine4Text='主线任务、檄文、皇榜',dwLine4UI=5,},
	[25] = {dwLevel=25,
	strLine1Description='人物达到二十五级！请领取新手礼包奖励，它们将成为您闯荡江湖的一大助力。',strLine1Text='打开礼包',dwLine1UI=11,
	strLine2Description='江湖之中，散布着无数秘境洞天，内有令人惊羡的宝藏，亦暗伏着惊心动魄的杀机，是战是退，是成是败，只在一念之间。',strLine2Text='查看副本秘境',dwLine2UI=8,
	strLine3Description='当前可选的升级途径：',strLine4Text='副本活动、主线任务',dwLine4UI=5,},	
	[30] = {dwLevel=30,
	strLine1Description='人物达到三十级！请领取新手礼包奖励，它们将成为您闯荡江湖的一大助力。',strLine1Text='打开礼包',dwLine1UI=11,
	strLine2Description='侠之大者，胸怀天下，当立旌旗十万，号令武林群雄，同济侠道，共伐奸恶。有敢犯吾世家雄威者，虽强必诛！',strLine2Text='查看武林世家',dwLine2UI=8,
	strLine3Description='开通新地图：',strLine3Text='绝情秘涧',dwLine3UI=6,	
	strLine4Description='当前可选的升级途径：',strLine4Text='副本活动、主线任务',dwLine4UI=5,},		
};	
