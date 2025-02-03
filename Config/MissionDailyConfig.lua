_G.MissionDailyMsgConfig = 
{
	DaySign = 1,
	GetDayGift = 2,
	GetWeekGift = 3,
	GetChargeGift = 4,
	SignGetReword = 5, --签到领奖
	OtherGetReword = 6,--其他礼包领奖
	GetWeiWangGift = 7,--威望领奖
	CompleteTask = 8,--立即完成
	UpWeiWangLevel = 9,--升级威望等级
	-----------------
	UpdataEvent = 11,
	UpdataDayGift = 12,
	UpdataWeekGift = 13,
	UpdataGiftGift = 14,
	UpdataOnlineDay = 15,
	UpdataOtherGift = 16,
	UpdataActiveGift = 17,
	UpdataActiveValue = 18,
	UpdataWeiWangLevel = 19,
	UpdataOnlineTime = 20,
	UpdataAll = 50,
	-----------------
	GetWeekGiftSure = 101,
	GetWeekGiftNoPoint = 102,
	GetWeekGiftNoDay = 103,
	GetDayGiftSure = 111,
	GetDayGiftNoPoint = 112,
	GetDayGiftNoPack = 113,
	GetChargeGiftSure = 121,
	GetChargeGiftCanNotGet = 122,
	GetChargeGiftNoPack = 123,
	
	GetOtherGiftSure = 125,
	GetOtherGiftNoPack = 126,

	
	GetActiveGiftSure = 127,
	GetActiveGiftNoPack = 128,
	
	GetWeiWangGiftSure = 129,
	GetWeiWangNoPack = 130,
	CompleteNotHasItem = 131,
	CompleteNotHasBindGold = 132,
	CompleteNotHasGold = 133,
	
	OtherGetChargeGiftSure = 150,
	
	DungeonBegin = 151,
	
	AlreadySign = 201,
	SignSuccess = 202,
	
	EventComplete = 301,
	LevelUp = 401,
	---------------------------
	MovementBegin = 501,
	AddMovement = 502,
	MovementChange = 503,
	---------------------------
}
_G.MissionDailyScript = 
{
	[enumPlayerEventType.EventKillBossMonster]   = 
	function(dwMonsterID) 
		for k,v in pairs (MissionDailyConfig.BossInfoConfig) do
			if v.dwMonsterID == dwMonsterID then
				return true
			end
		end
		return false
	end
}
--威望配置
_G.WeiWangConfig = 
{
	[1] = 
	{
		szName = '无名小辈',
		bIcon = "WeiWang_ChengHao_01.png",
		dwValue = 0;
		Attri = {dwAttack = 18,dwDefense = 9,dwFlee=8,dwCrit=5,dwHPMax=72,dwMPMax=27,dwAttackSpeed = 3,};
		ItemList = 
		{		
			[1] = {dwItemEnum = 5910004,dwBindType=1,dwItemNum = 1},

			
		};
	};
	[2] = 
	{
		szName = '武林新秀',
		bIcon = "WeiWang_ChengHao_02.png",
		dwValue = 1800;
		Attri = {dwAttack = 54,dwDefense = 27,dwFlee=22,dwCrit=14,dwHPMax=206,dwMPMax=81,dwAttackSpeed = 9,};
		ItemList = 
		{	
            [1] = {dwItemEnum = 5910005,dwBindType=1,dwItemNum = 1},		
			[2] = {dwItemEnum = 5940006,dwBindType=1,dwItemNum = 2},
			[3] = {dwItemEnum = 9405010,dwBindType=1,dwItemNum = 8},			
			
		};
	};
	[3] = 
	{
		szName = '江湖侠士',
		bIcon = "WeiWang_ChengHao_03.png",
		dwValue = 4500;
		Attri = {dwAttack = 162,dwDefense = 81,dwFlee=65,dwCrit=41,dwHPMax=616,dwMPMax=243,dwAttackSpeed = 25,};
		ItemList = 
		{	
            [1] = {dwItemEnum = 5910005,dwBindType=1,dwItemNum = 2},				
			[2] = {dwItemEnum = 5940006,dwBindType=1,dwItemNum = 4},
			[3] = {dwItemEnum = 2500050,dwBindType=1,dwItemNum = 18},				
			
		};
	};
	[4] = 
	{
		szName = '自成一派',
		bIcon = "WeiWang_ChengHao_04.png",
		dwValue = 8000;
		Attri = {dwAttack = 356,dwDefense = 178,dwFlee=143,dwCrit=89,dwHPMax=1318,dwMPMax=534,dwAttackSpeed = 54,};
		ItemList = 
		{		
            [1] = {dwItemEnum = 5910005,dwBindType=1,dwItemNum = 4},		
		    [2] = {dwItemEnum = 5940006,dwBindType=1,dwItemNum = 6},
			[3] = {dwItemEnum = 3900030,dwBindType=1,dwItemNum = 32},				

			};
	};
	[5] = 
	{
		szName = '名震江湖',
		bIcon = "WeiWang_ChengHao_05.png",
		dwValue = 12600;
		Attri = {dwAttack = 640,dwDefense = 320,dwFlee=256,dwCrit=160,dwHPMax=2304,dwMPMax=960,dwAttackSpeed = 96,};
		ItemList = 
		{	
            [1] = {dwItemEnum = 5910005,dwBindType=1,dwItemNum = 6},				
			[2] = {dwItemEnum = 5940006,dwBindType=1,dwItemNum = 8},
			[3] = {dwItemEnum = 4100140,dwBindType=1,dwItemNum = 50},				

		};
	};
	[6] = 
	{
		szName = '一代宗师',
		bIcon = "WeiWang_ChengHao_06.png",
		dwValue = 20000;
		Attri = {dwAttack = 1068,dwDefense = 534,dwFlee=428,dwCrit=267,dwHPMax=3738,dwMPMax=1602,dwAttackSpeed = 161,};
		ItemList = 
		{	
            [1] = {dwItemEnum = 5910005,dwBindType=1,dwItemNum = 10},			
			[2] = {dwItemEnum = 5940006,dwBindType=1,dwItemNum = 10},
			[3] = {dwItemEnum = 4100110,dwBindType=1,dwItemNum = 30},				

			};
	};
}
_G.MissionDailyStrConfig = 
{
   RedColour = 	'#f15d27',  ---红色
   GreenColour = '#31cf32',	---绿色
   UnfinishedStr = "<font color='#CA9754'>未完成项目</font>（%s个）",
   finishedStr = "<font color='#CA9754'>完成项目</font>（%s个）",
   
}
_G.MissionDailyConfig = 
{	
	--EventName 事件名称
	--LimitTimes 每天可以完成次数
	--ActivePoint 奖励活跃度
	--NpcID	寻路NPCID，没有就填 0
	--Pannel 打开的界面 ID,没有界面的话把Pannel写0
	--EventType 事件类型，见EventCenterConfig.lua
	--LimitValue事件需求数量
	--OnePartValue刻度
	--IsForbidShow是否不在UI上显示
	EventConfig = 
	{
		[1] = 
		{
			EventName = "<font color='%s'>签到领奖<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "天天签到好礼拿，签到奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CUISigninReward:Show()',
			EventType = enumPlayerEventType.EventDaySign,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
			-- IsForbidShow = true,
		
			
			--CostGold 元宝
			--CostBindGold 礼金 
			--1威望 =2元宝=10礼金
		},
		
		[2] = 
		{
			EventName = "<font color='%s'>在线1小时<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "今日在线1小时，奖励威望5点，还需要在线%s。",
			--FinishDis = "已完成",
			dwLeftValueFun =  
			function() 
				local lefttime = 60*60*1000 - CMissionDailySystem:GetOnlineTime();
				if lefttime < 0 then lefttime = 0 end
				local h,m = CTimeFormat:sec2format(math.floor(lefttime/1000))
				return  string.format('%d小时%d分钟',h,m);
			end,
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventOnLineTime,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
		},
		
--		[3] = 
--		{
--			EventName = "<font color='%s'>在线3小时<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
--			Dis = "今日在线3小时，奖励威望10点",
--			LimitTimes = 2,
--			ActivePoint = 10,
--			NpcID = 0,
--			Pannel = 0,
----			EventType = enumPlayerEventType.EventOnLineTime,
--			LimitValue = 3,
--			OnePartValue = 3,
--			ParamID = 0,
--			CostItemNum = 1,
--		},
		
		[3] = 
		{
			EventName = "<font color='%s'>在线5小时<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "今日在线5小时，奖励威望10点，还需要在线%s。",
			--FinishDis = "已完成",
			dwLeftValueFun =  
			function() 
				local lefttime = 60*60*1000*5 - CMissionDailySystem:GetOnlineTime();
				if lefttime < 0 then lefttime = 0 end
				local h,m = CTimeFormat:sec2format(math.floor(lefttime/1000))
				return  string.format('%d小时%d分钟',h,m);
			end,
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventOnLineTime,
			LimitValue = 5,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},
		
		[4] = 
		{
			EventName ="<font color='%s'>小试身手<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "累计杀怪1000只，奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventNone,
			LimitValue = 1000,
			OnePartValue = 1000,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
			IsForbidShow = true,
		},
		
		[5] = 
		{
			EventName = "<font color='%s'>大开杀戒<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "累计杀怪5000只，奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventNone,
			LimitValue = 5000,
			OnePartValue = 5000,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
			IsForbidShow = true,
		},
		
		[6] = 
		{
			EventName = "<font color='%s'>大展宏图<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "累计杀怪20000只，奖励威望15点。",
			LimitTimes = 1,
			ActivePoint = 15,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventNone,
			LimitValue = 20000,
			OnePartValue = 20000,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 30 ,
			IsForbidShow = true,
		},
		
		[7] = 
		{
			EventName = "<font color='%s'>剿灭BOSS<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "每日8:30、12:30、17:30、23:30在各地图秘境中刷新BOSS，可查看BOSS列表<br/>成功击杀BOSS奖励威望20点。",
			LimitTimes = 1,
			ActivePoint = 20,
			NpcID = 0,
			Pannel = 'CUIMissionDailyEx:OpenPanel(3)',
			EventType = enumPlayerEventType.EventKillBossMonster,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 40 ,
		},
		
		
		[8] = 
		{
			EventName = "<font color='%s'>百人斩<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "连斩达500次，奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventContinueKill,
			LimitValue = 500,
			OnePartValue = 500,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
		},
				
--		[10] = 
--		{
--			EventName = "<font color='%s'>珍珑棋局<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
--			Dis = "通关珍珑棋局可获得大量珍宝,进入副本奖励威望10点",
--			LimitTimes = 1,
--			ActivePoint = 10,
--			NpcID = 10021099,
--			Pannel = 0,
--			EventType = enumPlayerEventType.EventEnterDungeon,
--			LimitValue = 1,
--			OnePartValue = 1,
--			ParamID = 1004,
--			CostItemNum = 1,
--		},	

		[9] = 
		{
			EventName = "<font color='%s'>演武节堂<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "挑战演武节堂可获得大量经验,通关后奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CUIDuplWnd:OpenWnd()',
			EventType = enumPlayerEventType.EventPassYanWuDungeon,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},	
		
			 [10] = 
        {
			EventName = "<font color='%s'>珍珑棋局<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "在珍珑棋局内击杀任意一只boss怪,奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CZLEnterUI:CheckOpenDuplUI()',
			EventType = enumPlayerEventType.EventKillBossOn5030,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
	    },
		

		    [11] = 
		{
			EventName = "<font color='%s'>烽火辎路<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "挑战烽火辎路可获得大量银两,通关后奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CUIDuplWnd:OpenWnd()',
			EventType = enumPlayerEventType.EventPassFengHuoDungeon,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},	
		
			[12] = 
		{
			EventName = "<font color='%s'>五行道场<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "挑战五行道场可获得大量真气道具,通关后奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CUIDuplWnd:OpenWnd()',
			EventType = enumPlayerEventType.EventPassWuXingDungeon,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},	
		
		
		[13] = 
		{
			EventName = "<font color='%s'>守卫襄阳<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "挑战守卫襄阳可获得大量经验和珍宝道具,通关后奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CUIDuplWnd:OpenWnd()',
			EventType = enumPlayerEventType.EventPassShowWeiDungeon,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},		
	
		-- [15] = 
		-- {
			-- EventName = '大破联营',
			-- Dis = "",
			-- LimitTimes = 1,
			-- ActivePoint = 10,
			-- NpcID = 10021099,
			-- Pannel = 0,
			-- EventType = enumPlayerEventType.EventEnterDungeon,
			-- LimitValue = 1,
			-- OnePartValue = 1,
			-- ParamID = 1003 ,
		-- },	

		
		[14] = 
		{
			EventName = "<font color='%s'>风云任务<tab><tab>%d/%d<tab><tab> 威望+%s</font>",
			Dis = "完成20次风云任务,奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CUITaskMainPanel:DoOpen(2)',
			EventType = enumPlayerEventType.EventCompleteWeeklyTask,
			LimitValue = 20,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},	
		
		[15] = 
		{
			EventName = "<font color='%s'>地图寻宝<tab><tab>%d/%d<tab><tab> 威望+%s</font>",
			Dis = "完成10次地图寻宝,奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel ='CMissionDailySystem:None()',
			EventType = enumPlayerEventType.TreasrueMapUse,
			LimitValue = 10,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},	
			[16] = 
		{
			EventName = "<font color='%s'>真元(一)<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "今日累计获得4万真气值,奖励威望5点。",
			--FinishDis = "已完成",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventNone,
			LimitValue = 40000,
			OnePartValue = 10000,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
			IsForbidShow = true,
		},	
			[17] = 
		{
			EventName = "<font color='%s'>真元(二)<tab><tab>%d/%d<tab><tab> 威望+%s</font>",
			Dis = "今日累计获得10万真气值,奖励威望10点。",
			--FinishDis = "已完成",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventNone,
			LimitValue = 100000,
			OnePartValue = 10000,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
			IsForbidShow = true,
		},	
			[18] = 
		{
			EventName = "<font color='%s'>真元(三)<tab><tab>%d/%d<tab><tab> 威望+%s</font>",
			Dis = "今日累计获得20万真气值,奖励威望20点。",
			--FinishDis = "已完成",
			LimitTimes = 1,
			ActivePoint = 20,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventNone,
			LimitValue = 200000,
			OnePartValue = 10000,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 40 ,
			IsForbidShow = true,
		},	
			

		    [19] = 
        {
			EventName = "<font color='%s'>礼金消费<tab><tab> %d/%d<tab><tab> 威望+%s</font>",			      
			Dis = "在商城内消费不小于200礼金,奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = "CUIMall:ShowMainPanel()",
			EventType = enumPlayerEventType.EventCostBindGold,
			LimitValue = 200,
			OnePartValue = 200,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
	    },
 		    [20] = 
 		{
 			EventName = "<font color='%s'>世界发言<tab><tab> %d/%d<tab><tab> 威望+%s</font>",			      
 			Dis = "在世界聊天频道发言1次,奖励威望5点。",
 			LimitTimes = 1,
 			ActivePoint = 5,
 			NpcID = 0,
 			Pannel = 'CMissionDailySystem:None()',
 			EventType = enumPlayerEventType.EventChatLineMsg,
 			LimitValue = 1,
 			OnePartValue = 1,
 			ParamID = 0,
 			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
 		},
		
			[21] = 
		{
			EventName = "<font color='%s'>世家捐献<tab><tab> %d/%d<tab><tab> 威望+%s</font>",			      
			Dis = "在世家进行一次银两或物资捐赠,奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CGuildSystem:ShowGuildMainWnd()',
			EventType = enumPlayerEventType.EventGuildDonate,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
		},
			[22] = 
		{
			EventName = "<font color='%s'>世家押镖<tab><tab> %d/%d<tab><tab> 威望+%s</font>",			      
			Dis = "世家家主开启押镖活动,奖励所有家族成员威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CGuildSystem:ShowGuildMainWnd()',
			EventType = enumPlayerEventType.EventGuildEscort,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
		},
			[23] = 
		{
			EventName ="<font color='%s'>小试身手<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "累计杀怪5000只，奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventKillMonster,
			LimitValue = 5000,
			OnePartValue = 5000,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
		},
		
		[24] = 
		{
			EventName = "<font color='%s'>大展宏图<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "累计杀怪20000只，奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventKillMonster,
			LimitValue = 20000,
			OnePartValue = 20000,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},
		
		[25] = 
		{
			EventName = "<font color='%s'>真元(一)<tab><tab>%d/%d<tab><tab> 威望+%s</font>",
			Dis = "今日累计获得10万真气值,奖励威望5点。",
			--FinishDis = "已完成",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventAddFiveElem,
			LimitValue = 100000,
			OnePartValue = 10000,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
		},
		
		[26] = 
		{
			EventName = "<font color='%s'>真元(二)<tab><tab>%d/%d<tab><tab> 威望+%s</font>",
			Dis = "今日累计获得20万真气值,奖励威望10点。",
			--FinishDis = "已完成",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventAddFiveElem,
			LimitValue = 200000,
			OnePartValue = 10000,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},		
		[27] = 
		{
			EventName = "<font color='%s'>微端登陆<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "使用微端登陆游戏并领取微端奖励，奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CUIGetReword:Show()',
			EventType = enumPlayerEventType.EventGetMicroReward,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
		},
		[28] = 
		{
			EventName = "<font color='%s'>绮梦幽境<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "挑战绮梦幽境可获得大量经验和珍宝道具,通关后奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CUIDuplWnd:OpenWnd()',
			EventType = enumPlayerEventType.EventPassFuQiDungeon,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},		
		[29] = 
		{
			EventName = "<font color='%s'>十面埋伏<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "挑战十面埋伏可获得大量经验和珍宝道具,通关后奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CUIDuplWnd:OpenWnd()',
			EventType = enumPlayerEventType.EventPassMaiFuDungeon,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},			

 		[30] = 
		{
			EventName = "<font color='%s'>桃花迷阵<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "通关桃花迷阵可获得大量经验和珍宝道具,通关后奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CUIMissionDailyEx:OnVisiable()',
			EventType = enumPlayerEventType.EventTaoHuaMiZhen,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},
	 	[31] = 
		{
			EventName = "<font color='%s'>戏说天下<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "参与戏说天下活动,奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CUIMissionDailyEx:OnVisiable()',
			EventType = enumPlayerEventType.EventEnterMap8025,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
		},
		[32] = 
		{
			EventName = "<font color='%s'>行镖江湖<tab><tab> %d/%d<tab><tab> 威望+%s</font>",			      
			Dis = "参与行镖江湖活动并完成一次交镖，奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CUIMissionDailyEx:OnVisiable()',
			EventType = enumPlayerEventType.EventEscortAward,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},
		[33] = 
		{
			EventName = "<font color='%s'>岑夫子<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "参与岑夫子答题活动，奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CUIMissionDailyEx:OnVisiable()',
			EventType = enumPlayerEventType.EventAnswer,
			LimitValue = 1,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
		},	
		[34] = 
		{
			EventName = "<font color='%s'>力斩变异怪<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "每日击杀3只变异怪，奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CMissionDailySystem:None()',
			EventType = enumPlayerEventType.EventKillVariationMonster,
			LimitValue = 3,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},	
		[35] = 
		{
			EventName = "<font color='%s'>流星雨<tab><tab>%d/%d<tab><tab> 威望+%s</font>",
			Dis = "每日击杀10个陨石，奖励威望10点。",
			LimitTimes = 1,
			ActivePoint = 10,
			NpcID = 0,
			Pannel = 'CUIMissionDailyEx:OnVisiable()',
			EventType = enumPlayerEventType.EventKillFStoneMonster,
			LimitValue = 10,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 20 ,
		},
		 [36] = 
		{
			EventName = "<font color='%s'>众志成城<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "每日捐献三次修复城墙，奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CUIBuildWnd:CheckOpenBuildUI()',
			EventType = enumPlayerEventType.EventBuildTotalNum,
			LimitValue = 3,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
		},	
	    [37] = 
		{
			EventName = "<font color='%s'>闭关灌注<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "为其他人灌注真气5次，奖励威望5点。",
			LimitTimes = 1,
			ActivePoint = 5,
			NpcID = 0,
			Pannel = 'CUIMuse:Show()',
			EventType = enumPlayerEventType.EventInject,
			LimitValue = 5,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 10 ,
		},	
		[38] = 
		{
			EventName = "<font color='%s'>装备修炼<tab><tab> %d/%d<tab><tab> 威望+%s</font>",
			Dis = "每日使用高级修炼5次，奖励威望15点。",
			LimitTimes = 1,
			ActivePoint = 15,
			NpcID = 0,
			Pannel = 'CUIRole:OpenPanel(6)',
			EventType = enumPlayerEventType.EventEquipBuild,
			LimitValue = 5,
			OnePartValue = 1,
			ParamID = 0,
			CostItemNum = 0,
			CostBindGold=0,
			CostGold = 30 ,
		},			
	},	
	
	CompLeteItemID = 4100010,--立即完成需要消耗的物品ID
	OnLineTimeUnit = 1*60, --1小时
--	OnLineZhenQiUnit = 10000, --真气1W
	---签到物品
	DayTotal = 7, -- 累计天数更换物品
	szSignText = '连续%s天登录',
	szMicroText = '微端奖励',
	--签到领取物品
	SignReword = 
	{
		[1] = 
		{
			[1] = {dwItemEnum = 5600030,dwBindType=1,dwItemNum = 1},
			[2] = {dwItemEnum = 2400110,dwBindType=1,dwItemNum = 5},
			[3] = {dwItemEnum = 2500071,dwBindType=1,dwItemNum = 1},
			[4] = {dwItemEnum = 2500081,dwBindType=1,dwItemNum = 1},
			[5] = {dwItemEnum = 5910004,dwBindType=1,dwItemNum = 1},
		},
		[2] = 
		{
			[1] = {dwItemEnum = 5910002,dwBindType=1,dwItemNum = 1},
		},
	},
	OtherRewordType = 
	{
		MicroClient = 1,--微端奖励
		fLinkWeiDuan = function()
			_sys:browse(UrlConfig.Mini)
		end
	},
	OtherReword = 
	{
		--微端奖励
		[1] = 
		{
			[1] = {dwItemEnum = 5600030,dwBindType=1,dwItemNum = 1},
			[2] = {dwItemEnum = 2400110,dwBindType=1,dwItemNum = 5},
			[3] = {dwItemEnum = 2500071,dwBindType=1,dwItemNum = 1},
			[4] = {dwItemEnum = 2500081,dwBindType=1,dwItemNum = 1},
			[5] = {dwItemEnum = 5910004,dwBindType=1,dwItemNum = 1},
		},
	},

	---活跃度鼓励配置
	ActivePointConfig = 
	{
		[1] = {Point = 50,Des = '今天才刚刚开始'},
		[2] = {Point = 100,Des = '少侠还需努力啊',},
		[3] = {Point = 170,Des = '您已经离成功不远了',},
		[4] = {Point = 240,Des = '今天又是圆满的一天',},
	},
	--周活跃度礼包配置
	WeekGiftConfig = 
	{
		[1] = {Des = '本周签到两天',GiftName = '礼金200',ActivePointNeed = 0,DaySignNeed = 2,dwBindGold = 200},
		[2] = {Des = '本周签到四天',GiftName = '礼金300',ActivePointNeed = 0,DaySignNeed = 4,dwBindGold = 300},
		[3] = {Des = '本周签到六天',GiftName = '礼金400',ActivePointNeed = 0,DaySignNeed = 6,dwBindGold = 400},
		[4] = {Des = '本周签到七天',GiftName = '礼金500',ActivePointNeed = 0,DaySignNeed = 7,dwBindGold = 500},
	},
	DayGiftConfigDis = "威望值：%s",
	--日活跃度礼包配置
	DayGiftConfig = 
	{
		[1] = 
		{

			ActivePointNeed =50,
			ItemList = 
			{
				[1] = {dwItemEnum = 2400110,dwBindType=1,dwItemNum = 1},

			},
		},
		[2] = 
		{
			ActivePointNeed =100,
			ItemList = 
			{
				[1] = {dwItemEnum = 4100010,dwBindType=1,dwItemNum = 2},
				[2] = {dwItemEnum = 5600040,dwBindType=1,dwItemNum = 1},	
				[3] = {dwItemEnum = 4100430,dwBindType=1,dwItemNum = 2},					
			},
		},
		[3] = 
		{
			ActivePointNeed =170,
			ItemList = 
			{
			    [1] = {dwItemEnum = 5809337,dwBindType=1,dwItemNum = 1},
				[2] = {dwItemEnum = 9405040,dwBindType=1,dwItemNum = 1},
				[3] = {dwItemEnum = 2500331,dwBindType=1,dwItemNum = 2},
			},
		},
		[4] = 
		{
			ActivePointNeed =240,
			ItemList = 
			{
			    [1] = {dwItemEnum = 5809337,dwBindType=1,dwItemNum = 2},
				[2] = {dwItemEnum = 9405040,dwBindType=1,dwItemNum = 1},
				[3] = {dwItemEnum = 5930006,dwBindType=1,dwItemNum = 1},

			},
		},
	},
	---日活动度获得总值（计算星级）
	ActivePointNum = 260,
	--boss信息配置
	BossInfoInitID = 20002001,
	BossFlushTimeStr = '%02d小时%02d分钟后刷新',
	BossEffectTime = 8000;
	BossInfoConfig = 
	{
		[1] = {
		strDescription="金军将领完颜赛合死后，派来增援的另一大将，粗暴残忍，不可小觑。",BossDis ="BOSS出没地点：野郊密境", 
		dwMonsterID = 20002001,ViewPort = {0,-15,1},Eye = {0,0,0},VPort = _Vector2.new(1500,1500),dwLook = 100920060,
		ItemList = {
						[1] = {dwItemEnum = 5500390,dwProp = 3},
						[2] = {dwItemEnum = 5500400,dwProp = 3},
						[3] = {dwItemEnum = 5500370,dwProp = 3},
						[4] = {dwItemEnum = 5500450,dwProp = 2},
					},
		Effect = {
					[1] = 10092006021,
					[2] = 10092006050,
				},
		},
		--[2] = {strDescription="123123",dwMonsterID = 20002002,ViewPort = {1,-5.5,1},Eye = {0,1,0.4},ItemList = {[1] = {dwItemEnum = 2500040,dwProp = 2},[2] = {dwItemEnum = 2500060,dwProp = 2},[3] = {dwItemEnum = 2500040,dwProp = 2}}},
		[2] = {
		strDescription="江南七怪之首，人称“飞天蝙蝠”，现随郭靖黄蓉隐居桃花岛，嫉恶如仇，老而弥坚。",BossDis ="BOSS出没地点：桃花密境",
		dwMonsterID = 20002003,ViewPort = {0,-13,1},Eye = {0,0,0},VPort = _Vector2.new(1500,1500),dwLook = 10041003,
		ItemList = {
						[1] = {dwItemEnum = 5500390,dwProp = 3},
						[2] = {dwItemEnum = 5500400,dwProp = 3},
						[3] = {dwItemEnum = 5500370,dwProp = 2},
						[4] = {dwItemEnum = 5500450,dwProp = 2},
		            },
		Effect = {
					[1] = 10041003040,
					[2] = 10041003041,
				},
		},
		[3] = {
		strDescription="初代五绝之东邪，桃花岛主。满腹才学，桀骜不羁，愤世嫉俗。",BossDis ="BOSS出没地点：绝情密境",
		dwMonsterID = 20002004,ViewPort = {0,-15,1},Eye = {0,0,0},VPort = _Vector2.new(1500,1500),dwLook = 10051003,
		ItemList = {
						[1] = {dwItemEnum = 5500390,dwProp = 3},
						[2] = {dwItemEnum = 5500400,dwProp = 3},
						[3] = {dwItemEnum = 5500370,dwProp = 2},
						[4] = {dwItemEnum = 5500450,dwProp = 2},
						[5] = {dwItemEnum = 5500340,dwProp = 2},
		            },
		Effect = {
					[1] = 10051003040,
					[2] = 10051003041,
				},
		},
		[4] = {
			strDescription="初代五绝之南帝，大理国前任国王。出家之后，潜心修道，武学精进，深不可测。",BossDis ="BOSS出没地点：大理密境",
			dwMonsterID = 20002005,ViewPort = {0,-15,1},Eye = {-0.3,0,0},VPort = _Vector2.new(1500,1500),dwLook = 100610010,
			ItemList = {
						[1] = {dwItemEnum = 5500390,dwProp = 3},
						[2] = {dwItemEnum = 5500400,dwProp = 3},
						[3] = {dwItemEnum = 5500370,dwProp = 2},
						[4] = {dwItemEnum = 5500380,dwProp = 2},
						[5] = {dwItemEnum = 5500450,dwProp = 2},
						[6] = {dwItemEnum = 5500340,dwProp = 2},
				    },
		Effect = {
					[1] = 10061001040,
					[2] = 10061001050,
				},
		},
		[5] = {
		strDescription="初代五绝之西毒，白驼山主。逆练九阴真经走火入魔后，因祸得福，江湖上已难觅敌手。",BossDis ="BOSS出没地点：白驼密境",
		dwMonsterID = 20002006,ViewPort = {0,-15,1},Eye = {0,0,0},VPort = _Vector2.new(1500,1500),dwLook = 100710070,
		ItemList = {
						[1] = {dwItemEnum = 5500390,dwProp = 3},
						[2] = {dwItemEnum = 5500400,dwProp = 3},
						[3] = {dwItemEnum = 5500380,dwProp = 2},
						[4] = {dwItemEnum = 5500450,dwProp = 2},
						[5] = {dwItemEnum = 5500340,dwProp = 2},
					},
		Effect = {
					[1] = 10071007041,
					[2] = 10071007042,
				},
		},
		[6] = {
		strDescription="丘处机",BossDis ="BOSS出没地点：终南密境",
		dwMonsterID = 20002007,ViewPort = {0,-15,1},Eye = {0,0,0},VPort = _Vector2.new(1500,1500),dwLook = 100920110,
		ItemList = {
						[1] = {dwItemEnum = 5500390,dwProp = 3},
						[2] = {dwItemEnum = 5500400,dwProp = 3},
						[3] = {dwItemEnum = 5500380,dwProp = 2},
						[4] = {dwItemEnum = 5500381,dwProp = 2},
						[5] = {dwItemEnum = 5500450,dwProp = 2},
						[6] = {dwItemEnum = 5500340,dwProp = 2},
					},
		Effect = {
					[1] = 10092011030,
				},
		},
		[7] = {
		strDescription="洪七公",BossDis ="BOSS出没地点：竹林密境",
		dwMonsterID = 20002008,ViewPort = {0,-15,1},Eye = {0,0,0},VPort = _Vector2.new(1500,1500),dwLook = 100820070,
		ItemList = {
						[1] = {dwItemEnum = 5500390,dwProp = 3},
						[2] = {dwItemEnum = 5500400,dwProp = 3},
						[3] = {dwItemEnum = 5500381,dwProp = 2},
						[4] = {dwItemEnum = 5500450,dwProp = 2},
						[5] = {dwItemEnum = 5500340,dwProp = 2},
					},
		Effect = {
					[1] = 10082007020,
					[2] = 10082007040,
					[3] = 10082007041,
					[4] = 10082007043,
				},
		},
		[8] = {
		strDescription="风清扬",BossDis ="BOSS出没地点：华山密境",
		dwMonsterID = 20002009,ViewPort = {0,-30,1},Eye = {-0.25,0,0},VPort = _Vector2.new(1500,1500),dwLook = 101020180,
		ItemList = {
						[1] = {dwItemEnum = 5500390,dwProp = 3},
						[2] = {dwItemEnum = 5500400,dwProp = 3},
						[3] = {dwItemEnum = 5500381,dwProp = 2},
						[4] = {dwItemEnum = 5500450,dwProp = 2},
						[5] = {dwItemEnum = 5500340,dwProp = 2},
					},
		Effect = {
					[1] = 10102018030,
					[2] = 10102018031,
					[3] = 10102018040,
				},
		},
		[9] = {
		strDescription="无色禅师",BossDis ="BOSS出没地点：嵩山密境",
		dwMonsterID = 20002010,ViewPort = {0.35,-15,1},Eye = {-0.1,0,0},VPort = _Vector2.new(1500,1500),dwLook = 101120140,
		ItemList = {
						[1] = {dwItemEnum = 5500390,dwProp = 3},
						[2] = {dwItemEnum = 5500400,dwProp = 3},
						[3] = {dwItemEnum = 5500381,dwProp = 2},
						[4] = {dwItemEnum = 5500450,dwProp = 2},
						[5] = {dwItemEnum = 5500340,dwProp = 2},
					},
		Effect = {
					[1] = 10112014010,
					[2] = 10112014020,
					[3] = 10112014040,
				},
		},
		[10] = {
		strDescription="昆仑尸圣",BossDis ="BOSS出没地点：昆仑密境",
		dwMonsterID = 20002011,ViewPort = {0.35,-26,1},Eye = {-0.1,0,0},VPort = _Vector2.new(1500,1500),dwLook = 101220070,
		ItemList = {
						[1] = {dwItemEnum = 5500390,dwProp = 3},
						[2] = {dwItemEnum = 5500400,dwProp = 3},
						[3] = {dwItemEnum = 5500381,dwProp = 2},
						[4] = {dwItemEnum = 5500450,dwProp = 2},
						[5] = {dwItemEnum = 5500340,dwProp = 2},
					},
		Effect = {
					[1] = 10122007020,
					[2] = 10122007040,
				},
		},
		[11] = {
		strDescription="双头怪蟒",BossDis ="BOSS出没地点：黑水密境",
		dwMonsterID = 20002012,ViewPort = {0.35,-20,1},Eye = {-0.1,0,0},VPort = _Vector2.new(1500,1500),dwLook = 101310060,
		ItemList = {
						[1] = {dwItemEnum = 5500390,dwProp = 3},
						[2] = {dwItemEnum = 5500400,dwProp = 3},
						[3] = {dwItemEnum = 5500381,dwProp = 2},
						[4] = {dwItemEnum = 5500450,dwProp = 2},
						[5] = {dwItemEnum = 5500340,dwProp = 2},
					},
		Effect = {
					[1] = 1013100613,
					[2] = 10131006040,
				},
		},
		--[7] = {dwMonsterID = 20002007,ViewPort = {1,-8,1},Eye = {-0.1,0,0.3},ItemList = {[1] = {dwItemEnum = 2500040,dwProp = 2},[2] = {dwItemEnum = 2500050,dwProp = 2},[3] = {dwItemEnum = 2500060,dwProp = 2}}},
		--[8] = {dwMonsterID = 20002008,ViewPort = {1,-9,1},Eye = {-0.1,0,0.3},ItemList = {[1] = {dwItemEnum = 2500040,dwProp = 2},[2] = {dwItemEnum = 2500050,dwProp = 2},[3] = {dwItemEnum = 2500060,dwProp = 2}}},
		--[9] = {dwMonsterID = 20002009,ViewPort = {1,-9,1},Eye = {-0.1,0,0.3},ItemList = {[1] = {dwItemEnum = 2500040,dwProp = 2},[2] = {dwItemEnum = 2500050,dwProp = 2},[3] = {dwItemEnum = 2500060,dwProp = 2}}},
		--[10] = {dwMonsterID = 20002010,ViewPort = {1,-9,1},Eye = {-0.1,0,0.3},ItemList = {[1] = {dwItemEnum = 2500040,dwProp = 2},[2] = {dwItemEnum = 2500050,dwProp = 2},[3] = {dwItemEnum = 2500060,dwProp = 2}}},
	},
	---每日活动副本配置
	DungeonInitConfig = 1004,
	DungeonInfoConfig = 
	{
		[1004] = {bFly = 0},
		[1006] = {bFly = 0},
		[1008] = {bFly = 0},
		[1009] = {bFly = 0},
		[1010] = {bFly = 0},

	},
	DungeonInfoStrConfig = 
	{
		9000560000,
		9000560003,
		9000560006,
	},
	---福利配置信息
	GiftInfoConfig = 
	{
	--[[	[1] = 
		{
		  	ChargeEventName = "【活动一】<p><font color= '#CDC6C4'>首充奖励领取</font></p>",	--活动名称
			ChargeEventList = 
			{
				[1] = 
				{
					ChargeSubEventName = '【活动一】首充奖励',
					ChargeEventDetail = '首次充值1元宝，就可获得价值800元人民币超值大礼',
					ChargeMoneyLimit = 
					{
						dwDayLimit = 0,
						dwWeekLimit = 0,
						dwMonthLimit = 10,
					},
					dwNoticeEnum = 9000570001,
					bMessage = 1,
					Gift = 
					{
						[1] = 
						{
							dwItemEnum = 0,   ---不用的时候填0   这个是读物品表的
							dwItemNum = 1,    ---这个是赠送物品数量
							dwPropEnum = 11000205,   ---不用的时候填0  这个是读礼包表的
							dwPropNum = 5,    ---这个是强化等级
							dwBindType = 1,
						},
						[2] = 
						{
							dwItemEnum = 2300232,
							dwItemNum = 3,
							dwPropEnum = 0,
							dwPropNum = 0,
							dwBindType = 1,
						},
						[3] = 
						{
							dwItemEnum = 5500010,
							dwItemNum = 5,
							dwPropEnum = 0,
							dwPropNum = 0,	
							dwBindType = 1,
						},
						[4] = 
						{
							dwItemEnum = 4100140,
							dwItemNum = 10,
							dwPropEnum = 0,
							dwPropNum = 0,
							dwBindType = 1,
						},
						[5] = 
						{
							dwItemEnum = 9405010,
							dwItemNum = 5,
							dwPropEnum = 0,
							dwPropNum = 0,
							dwBindType = 1,
						},
					},
				},
				[2] = 
				{
					ChargeSubEventName = '【活动二】充值',
					ChargeEventDetail = '冲100送100冲100送100冲100送100冲100送100',
					ChargeMoneyLimit = 
					{
						dwDayLimit = 0,
						dwWeekLimit = 0,
						dwMonthLimit = 10,
					},
					dwNoticeEnum = 9000570001,
					bMessage = 0,
					Gift = 
					{
					--	GiftSerNum = 12,
						[1] = 
						{
							dwItemEnum = 4100140,
							dwItemNum = 1,
							dwPropEnum = 0,
							dwPropNum = 0,	
							dwBindType = 1,
						},
						[2] = 
						{
							dwItemEnum = 4100140,
							dwItemNum = 4,
							dwPropEnum = 0,
							dwPropNum = 0,		
							dwBindType = 1,
						},
						
					},
				},
			},	
		},]]
		
	},
	
	-- 显示微端下载界面限制(等级)(封闭区间内显示)
	-- 1 - 登录时
	-- 2 - 升级时
	WeiDuanDownloadLimit = 
	{
		[1] = {5, 1000};
		[2] = {5, 5};
	},
	
	--威望值上限
	ActivePointTotalMax = 999999999;
	
	NoticeLevelMax = 9000580005;--满级后的提示
	NoticeNoPoint = 9000580004;--点数不足的提示
	NoticeIconTip = 9000580006;--点数足够时弹出的按钮提示的tip
}