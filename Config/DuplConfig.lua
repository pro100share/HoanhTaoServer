--showEnterType:0单人，1多人，2单双人, 3副本副本
--bInShow:0,不显示；1,显示
--dwShowOrder,显示顺序
--dwShowJiFen:0不显示积分,1显示积分
--CompleteDuplCost:一键完成副本消耗元宝
--CompleteRate:一键完成奖励比例
--RandomAward:一键奖励完成副本随即奖励
	--<font color='#cd0000'>@A</font> = "dwMonsterNum",  --剩余怪物数
	--@B = "dwBossNum",        --剩余boss数
	--@C = "dwPastHour",        --进行的hour
	--@D = "dwPastMin",         --进行的min
	--@E = "dwPastSec",          --进行的sec
	--@F = "dwRestHour",        --剩余的hour
	--@G = "dwRestMin",         --进行的min
	--@H = "dwRestSec",         --剩余的sec
	--@I = "dwKillMonsterNum",    --杀死的怪物0 + 1 数量
	--@J = "dwKillBossNum",          --杀死的怪物 2 数量
	--@K = "dwExp",                      --杀怪获得的经验
	--@L = "dwTypeZero",          --杀死的怪物  0数量
	--@M = "dwTypeOne",           --杀死的怪物  1数量
_G.FBNoticeConfig = {
	-------副本提示信息栏的宽高跟显示持续时间
	dwW = 550;--宽
	dwH = 400;--高
	dwNoticeTime = 7;--时间
};

_G.ZhenLongBoss = 13;
--将需要后台数据统计进入副本次数和第一次进入副本等级记录的副本ID填入下表
_G.DuplRecordLogConfig = {
	[1003] = 1003;--大破联营
	[1004] = 1004;--珍珑棋局
	[1006] = 1006;--五行道场
	[1008] = 1008;--烽火之路
	[1009] = 1009;--演武节堂
	[1010] = 1010;--守卫襄阳
	[1011] = 1011;--天罡北斗阵
	[1012] = 1012;--绮梦幽境
	[1013] = 1013;--卧虎藏龙
	[1014] = 1014;--新珍珑棋局
	[1015] = 1015;--通天塔
};

_G.DuplConfig = {
	-- dwW = 550;--宽
	-- dwH = 400;--高
	-- dwNoticeTime = 5;--时间
--------------------------------------------------剧情副本01--刘记马行----------------------------------------------------------------------------
	[1001] =
	{
		dwID = 1001,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {5001},
		MapSet = function()
			return {5001}, 5001;
		end,
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5001,
		ReliveMapId = 1001,  --传出副本的地图id
		Posx = -48.75,--传出副本的地图posx
		Posy = -7.54,--传出副本的地图posy
		fbname = "刘记马行",
		describe = "剧情副本01",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>剧情副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
--------------------------------------------------------剧情副本02--野郊荒地----------------------------------------------------------------------
	[1002] =
	{
		dwID = 1002,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =12;
		--MapSet = {5002},
		MapSet = function()
			return {5002}, 5002;
		end,
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5002,
		ReliveMapId = 1003,  --传出副本的地图id
		Posx = 20,--传出副本的地图posx
		Posy = -25,--传出副本的地图posy
		fbname = "野郊荒地",
		describe = "剧情副本02",
		types = "day",
		npcId = 10031009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>剧情副本02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.在技能界面中学习无双</p><p>2.拥有一颗煞元(10000点杀意值)</p><p><font color='#cd0000'>(释放无双需要消耗一个煞元)</font></p><p>3.使用无双技能</p><p><font color = '#00FF00'>目标:击败纪恭达 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>学习如何使用无双技能</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
	------------------------------------------小猪快跑
	[1017] =
	{
		dwID = 1017,
		dwPlayerCount = 5,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 45,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 60,
		dwEnterTimes = 1,
		dwOpenDay = {0,1,2,3,4,5,6},	--开放日期
		dwFbStartTime = "00:00",		--开启时间
		dwFbEndTime = "24:00",			--结束世界
		dwCloseFbTime = 60;
		dwDelFbTime = 5;   --多人本副本内没有5分钟后删除副本
		bInShow = 1;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =49;---副本排序
		MapSet = function()
			return {5074}, 5074;
		end,
		--MapTransSet = {5060},
		--MapTransSet = {{5060, "aaaaaaaaa"}},
		EnterMapId = 5074,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "小猪快跑",
		describe = "    一颗陨石砸坏了猪圈，在老母猪的带领下，小猪们冲破牢笼，勇敢地踏上了寻找自由的道路！但养猪状元却损失惨重，还请将猪儿们赶回猪圈，让它们重新过上吃喝拉撒睡的安逸生活！",
		types = "day",
		npcId = 50740001,
		exps = 3,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>1.通过凌教头对话,开启副本<br>2.击败所有士兵,副本即结束<br>3.BOSS在正中的武台上,请优先击败BOSS,避免不必要的损失！",
		fbNeed = "    <font color='#00FF00'>【猪群数量庞大，请<font color='#FF0000'>组队</font>参与活动。在猪儿们摆脱茫然之前，将它们赶回圈中，可获得<font color='#FF0000'>巨额经验</font>奖励！】</font><br>    <font color='#33A1C9'>一颗陨石砸坏了猪圈，在老母猪的带领下，小猪们冲破牢笼，勇敢地踏上了寻找自由的道路！但养猪状元却损失惨重，还请将猪儿们赶回猪圈，让它们重新过上吃喝拉撒睡的安逸生活！</font> ",
		img = "fb_xzkp.png",
		dwPng = "img://ffb_xzkp.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量金钱</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp = {[1] = {dwItemEnum = 5500260},[2] = {dwItemEnum = 5500080},},-----进入副本配置道具
		--itemTbl = -----副本通关奖励
		--{
			--[1] = {dwItemEnum = 2500040,dwItemNumber = 3, dwBindType = 1},
			--[2] = {dwItemEnum = 4100070,dwItemNumber = 3, dwBindType = 1},
		--},
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 5501160,dwItemNumber = 1, dwBindType = 1},	--巨额经验
					-- [1] = {dwItemEnum = 6500610,dwItemNumber = 1, dwBindType = 1},	--侠客资质包
					-- [2] = {dwItemEnum = 4100445,dwItemNumber = 3, dwBindType = 1},	--缨穗
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 0, Exp = 0, itemTbl = itemTbl}
			end;
		end;
		--PassMoney = 0, Gold = 50, Zhenqi = 1000, Exp = 120000,
		failItemTbl =  -----副本失败奖励
		{
				--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		dropItemTbl = {--------副本掉落显示
			[1] = {dwItemEnum = 5500450,dwItemNumber = 1, dwBindType = 0},
			[2] = {dwItemEnum = 5500430,dwItemNumber = 1, dwBindType = 0},
			[3] = {dwItemEnum = 5500390,dwItemNumber = 1, dwBindType = 0},
			[4] = {dwItemEnum = 5500400,dwItemNumber = 1, dwBindType = 0},
			[5] = {dwItemEnum = 5500420,dwItemNumber = 1, dwBindType = 0},
			[6] = {dwItemEnum = 5500410,dwItemNumber = 1, dwBindType = 0},
			[7] = {dwItemEnum = 5500440,dwItemNumber = 1, dwBindType = 0},
		},
		showEnterType = 1,--showEnterType:0单人，1多人，2单双人

		fbInfo = "1.通过与养猪状元对话,开启副本<br>2.所有猪进入猪圈,副本即结束<br>3.快捷键1和2分别代表不同的赶猪方式,交替使用,可收奇效",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>经验收益:<font color = '#00FF00'>@K</font></p><p>击败BOSS数:<font color = '#00FF00'>@J</font>/4</p><p>击杀小兵:<font color='#cd0000'>@I</font>/1043</p><p><font color = '#00FF00'>目标:打败所有士兵</font></p><p>温馨提示:</p><p><font color = '#00FF00'>1.</font>士兵总共分为8个等级段</p><p><font color = '#00FF00'>2.</font>BOSS在地图中间的台子上</p><p><font color = '#00FF00'>3.</font>击败所有士兵后,副本即结束,请优先打败BOSS,避免不必要损失</p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 2},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 2},---组队1人难度
		[2] = {dwHPMax = 1.1,dwMPMax = 1.1,dwAttack = 1.1,dwDefense = 1.1,dwFlee = 1.1,dwCrit = 1.1,dwExp = 2.1},---组队2人难度
		[3] = {dwHPMax = 1.2,dwMPMax = 1.2,dwAttack = 1.2,dwDefense = 1.2,dwFlee = 1.2,dwCrit = 1.2,dwExp = 2.2},---组队3人难度
		[4] = {dwHPMax = 1.3,dwMPMax = 1.3,dwAttack = 1.3,dwDefense = 1.3,dwFlee = 1.3,dwCrit = 1.3,dwExp = 2.3},---组队4人难度
		[5] = {dwHPMax = 1.4,dwMPMax = 1.4,dwAttack = 1.4,dwDefense = 1.4,dwFlee = 1.4,dwCrit = 1.4,dwExp = 2.4},---组队5人难度
		},
		--msg = "请<font color = '#22AE02'>与NPC对话开始副本</font>,详情请点击查看<font color = '#22AE02'>“M”键</font>.<br>本副本怪物众多,建议使用双倍<font color = '#22AE02'>经验丹</font>与<font color = '#22AE02'>坐骑丹</font>",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		fbNamePng = "Fbnywjt.png",
		dwShowJiFen = 0,
	};
--------------------------------------------------------野郊剧情副本02 金营囚场----------------------------------------------------------------------
	[1079] =
	{
		dwID = 1079,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =12;
		--MapSet = {5079},
		MapSet = function()
			return {5079}, 5079;
		end,	
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5079,
		ReliveMapId = 1003,  --传出副本的地图id
		Posx = 17.28,--传出副本的地图posx
		Posy = -31.02,--传出副本的地图posy
		fbname = "金营囚场",
		describe = "野郊剧情副本02",
		types = "day",
		npcId = 10031009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>野郊剧情副本02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>野郊剧情副本02</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>野郊剧情副本02</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.在技能界面中学习无双</p><p>2.拥有一颗煞元(10000点杀意值)</p><p><font color='#cd0000'>(释放无双需要消耗一个煞元)</font></p><p>3.使用无双技能</p><p><font color = '#00FF00'>目标:击败纪恭达 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>学习如何使用无双技能</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
--------------------------------------------------------剧情副本03--清音洞----------------------------------------------------------------------
	[1080] =
	{
		dwID = 1080,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =13;
		--MapSet = {5003},
		MapSet = function()
			return {5003}, 5003;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5003,
		ReliveMapId = 1004,  --传出副本的地图id
		Posx = 38.77,--传出副本的地图posx
		Posy = 40.05,--传出副本的地图posy
		fbname = "清音洞",
		describe = "剧情副本03",
		types = "day",
		npcId = 10031009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>剧情副本03</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打败玉蟾</p><p>2.与郭靖对话</p><p>3.救醒昏迷的郭芙</p><p>4.自行离开清音洞</p><p><font color = '#00FF00'>目标:击败玉蟾 @I/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从清音洞救出郭芙</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
--------------------------------------------------------剧情副本04--天坑窟口----------------------------------------------------------------------
	[1081] =
	{
		dwID = 1081,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =14;
		--MapSet = {5081,5095,5096},
		MapSet = function()
			return {5081,5095,5096}, 5081,5095,5096;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5081,
		ReliveMapId = 1003,  --传出副本的地图id
		Posx = 1.70,--传出副本的地图posx
		Posy = -94.39,--传出副本的地图posy
		fbname = "天坑窟口",
		describe = "剧情副本04",
		types = "day",
		npcId = 10031009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>剧情副本04</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.与杨过对话</p><p>2.击败樊一翁</p><p>3.击败绝情弟子</p><p>4.与杨过告别</p><p>5.自行离开天坑窟口</p><p><font color = '#00FF00'>目标:击败樊一翁 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>救出众人,离开天坑窟口</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
--------------------------------------------------------剧情副本05--祭坛暗监----------------------------------------------------------------------
	[1082] =
	{
		dwID = 1082,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =15;
		--MapSet = {5082},
		MapSet = function()
			return {5082}, 5082;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5082,
		ReliveMapId = 1006,  --传出副本的地图id
		Posx = 4.99,--传出副本的地图posx
		Posy = 19.88,--传出副本的地图posy
		fbname = "祭坛暗监",
		describe = "剧情副本05",
		types = "day",
		npcId = 10031009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>剧情副本05</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.找到暗监中的囚犯</p><p>2.击败五毒教巫祝 九宿</p><p>3.自行离开祭坛暗监</p><p><font color = '#00FF00'>目标:击败五毒教巫祝 九宿 @I/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>带冉千江离开此地</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
--------------------------------------------------------剧情副本06--沙匪营地----------------------------------------------------------------------
	[1083] =
	{
		dwID = 1083,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =16;
		--MapSet = {5083},
		MapSet = function()
			return {5083}, 5083;
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5083,
		ReliveMapId = 1007,  --传出副本的地图id
		Posx = -34.49,--传出副本的地图posx
		Posy = 45.43,--传出副本的地图posy
		fbname = "剧情副本06",
		describe = "剧情副本06",
		types = "day",
		npcId = 10031009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>剧情副本06</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "<p>1,提示提示测试<font color = '#FF0000'>1234124saa啊啊</font></p><p>sdf123422222222222</p>",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>请击败沙匪首领！</p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		dwShowJiFen = 0;
	};
---------------------------------------------------------清音洞-支线任务---------------------------------------------------------------------
	[1084] =
	{
		dwID = 1084,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5084},
		MapSet = function()
			return {5084}, 5084;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5003,
		ReliveMapId = 1004,  --传出副本的地图id
		Posx = 30.05,--传出副本的地图posx
		Posy = 4.70,--传出副本的地图posy
		fbname = "清音洞",
		describe = "剧情副本03",
		types = "day",
		npcId = 10031009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>剧情副本03</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打败玉蟾</p><p>2.自行离开清音洞</p><p><font color = '#00FF00'>目标:击败玉蟾 @I/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从清音洞救出郭芙</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
----------------------------------------------------异乡人营地 02----------------------------------------------------------------------------
	[1085] =
	{
		dwID = 1085,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 20;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5085},
		MapSet = function()
			return {5085}, 5085;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5085,
		ReliveMapId = 1001,  --传出副本的地图id
		Posx = 32.74,--传出副本的地图posx
		Posy = -18.06,--传出副本的地图posy
		fbname = "异乡人营地",
		describe = "新手村剧情副本02",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>新手村剧情副本02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>新手村剧情副本02</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>新手村剧情副本02</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.帮助穆胜捷击败“断”<font color = '#00FF00'>@I/1</font></p><p>2.搜查未烧毁的杂物</p><p>3.把搜到的残信念给穆选锋听</p><p>4.自行离开副本</p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>摸清异乡人的来历</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
----------------------------------------------------桃花岛剧情副本 02----------------------------------------------------------------------------
	[1086] =
	{
		dwID = 1086,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5086},
		MapSet = function()
			return {5086}, 5086;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5086,
		ReliveMapId = 1004,  --传出副本的地图id
		Posx = 0.70,--传出副本的地图posx
		Posy = -98.82,--传出副本的地图posy
		fbname = "桃花坞",
		describe = "桃花岛剧情副本02",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>桃花岛剧情副本02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>桃花岛剧情副本02</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>桃花岛剧情副本02</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
----------------------------------------------------大理剧情副本 02----------------------------------------------------------------------------
	[1087] =
	{
		dwID = 1087,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5087},
		MapSet = function()
			return {5087}, 5087;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5087,
		ReliveMapId = 1006,  --传出副本的地图id
		Posx = 59.64,--传出副本的地图posx
		Posy = 95.47,--传出副本的地图posy
		fbname = "黑沼谜地",
		describe = "大理剧情副本02",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>大理剧情副本02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>大理剧情副本02</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>大理剧情副本02</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
----------------------------------------------------白驼山剧情副本 02----------------------------------------------------------------------------
	[1088] =
	{
		dwID = 1088,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5088},
		MapSet = function()
			return {5088}, 5088;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5088,
		ReliveMapId = 1007,  --传出副本的地图id
		Posx = 74.13,--传出副本的地图posx
		Posy = 44.96,--传出副本的地图posy
		fbname = "欧阳克墓",
		describe = "白驼山剧情副本02",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>白驼山剧情副本02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>白驼山剧情副本02</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>白驼山剧情副本02</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------白驼山剧情副本 03----------------------------------------------------------------------------
	[1089] =
	{
		dwID = 1089,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5089},
		MapSet = function()
			return {5089}, 5089;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5089,
		ReliveMapId = 1007,  --传出副本的地图id
		Posx = 83.51,--传出副本的地图posx
		Posy = -40.98,--传出副本的地图posy
		fbname = "山庄药房",
		describe = "白驼山剧情副本03",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>白驼山剧情副本03</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>白驼山剧情副本03</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>白驼山剧情副本03</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------白驼山剧情副本 04----------------------------------------------------------------------------
	[1090] =
	{
		dwID = 1090,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5090},
		MapSet = function()
			return {5090}, 5090;
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5090,
		ReliveMapId = 1007,  --传出副本的地图id
		Posx = -49,--传出副本的地图posx
		Posy = 63,--传出副本的地图posy
		fbname = "湖底密道",
		describe = "白驼山剧情副本04",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>白驼山剧情副本04</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>白驼山剧情副本04</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>白驼山剧情副本04</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------终南山剧情副本 01 重阳殿内----------------------------------------------------------------------------
	[1091] =
	{
		dwID = 1091,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5091},
		MapSet = function()
			return {5091}, 5091;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5091,
		ReliveMapId = 1008,  --传出副本的地图id
		Posx = 72.29,--传出副本的地图posx
		Posy = 1.01,--传出副本的地图posy
		fbname = "重阳殿内",
		describe = "终南山剧情副本 01 重阳殿内",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>终南山剧情副本 01 重阳殿内</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>终南山剧情副本 01 重阳殿内</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>终南山剧情副本 01 重阳殿内</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------终南山剧情副本 02 古墓石室 - 甬道 - 冰室 ----------------------------------------------------------------------------
	[1092] =
	{
		dwID = 1092,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5092,5093,5094},
		MapSet = function()
			return {5092,5093,5094}, 5092,5093,5094;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5092,
		ReliveMapId = 1008,  --传出副本的地图id
		Posx = -13,--传出副本的地图posx
		Posy = 75,--传出副本的地图posy
		fbname = "古墓石室",
		describe = "终南山剧情副本 02 古墓石室",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>终南山剧情副本 02 古墓石室</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>终南山剧情副本 02 古墓石室</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>终南山剧情副本 02 古墓石室</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------终南山剧情副本 03 墓中甬道----------------------------------------------------------------------------
	-- [1093] =
	-- {
		-- dwID = 1093,
		-- dwPlayerCount = 1,
		-- --dwPlayerLevel = 1,--代表副本进入的最小等级。
		-- dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		-- dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		-- dwCountDownTime = 5,
		-- dwEnterTimes = 999,
		-- dwOpenDay = {0,1,2,3,4,5,6},
		-- dwFbStartTime = "00:00",
		-- dwFbEndTime = "24:00",
		-- dwCloseFbTime = 30;
		-- dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		-- bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		-- dwShowOrder = 999;
		-- MapSet = {5093},
		-- MapSet = function()
			-- return {5093}, 5093;
		-- end,		
		-- --MapTransSet = {{5030, "aaaaaaaaa"}},
		-- EnterMapId = 5093,
		-- ReliveMapId = 1008,  --传出副本的地图id
		-- Posx = -12.23,--传出副本的地图posx
		-- Posy = 80.62,--传出副本的地图posy
		-- fbname = "墓中甬道",
		-- describe = "终南山剧情副本 03 墓中甬道",
		-- types = "day",
		-- npcId = 10011009,
		-- exps = 1,
		-- money = 1,
		-- equipLevel = 1,
		-- expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		-- fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		-- fbNeed = "<font color='#33A1C9'>终南山剧情副本 03 墓中甬道</font>",
		-- img = "fb_zlqj.png",
		-- dwPng = "",
		-- --副本开放时间
		-- fbOpenTime = "<font color='#00FF00'>终南山剧情副本 03 墓中甬道</font>";
		-- --副本奖励类型
		-- fbAwardType = "<font color='#CA9754'>终南山剧情副本 03 墓中甬道</font>",
		-- addTimes = 0;---使用道具可多进入X次
		-- fbItemProp =
		-- {
			-- [2] = {dwItemEnum = 5500080},
		-- },
		-- itemTbl =
		-- {
			-- --[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		-- },
		-- failItemTbl =
		-- {
			-- --[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		-- },
		-- showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		-- fbInfo = "",
		-- --fbInfo1 = "1111",
		-- --副本难度系数
		-- fbDifficity =
		-- {--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		-- [0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		-- [1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		-- [2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		-- [3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		-- [4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		-- [5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		-- },
		-- --msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		-- Info02Icon = "999_1.png",  ----副本提示信息图片配置
		-- dwShowJiFen = 0;
	-- };
-----------------------------------------------------终南山剧情副本 04 寒玉冰室----------------------------------------------------------------------------
	-- [1094] =
	-- {
		-- dwID = 1094,
		-- dwPlayerCount = 1,
		-- --dwPlayerLevel = 1,--代表副本进入的最小等级。
		-- dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		-- dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		-- dwCountDownTime = 5,
		-- dwEnterTimes = 999,
		-- dwOpenDay = {0,1,2,3,4,5,6},
		-- dwFbStartTime = "00:00",
		-- dwFbEndTime = "24:00",
		-- dwCloseFbTime = 30;
		-- dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		-- bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		-- dwShowOrder = 999;
		-- MapSet = {5094},
		-- MapSet = function()
			-- return {5094}, 5094;
		-- end,			
		-- --MapTransSet = {{5030, "aaaaaaaaa"}},
		-- EnterMapId = 5094,
		-- ReliveMapId = 1008,  --传出副本的地图id
		-- Posx = -12.23,--传出副本的地图posx
		-- Posy = 80.62,--传出副本的地图posy
		-- fbname = "寒玉冰室",
		-- describe = "终南山剧情副本 04 寒玉冰室",
		-- types = "day",
		-- npcId = 10011009,
		-- exps = 1,
		-- money = 1,
		-- equipLevel = 1,
		-- expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		-- fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		-- fbNeed = "<font color='#33A1C9'>终南山剧情副本 04 寒玉冰室</font>",
		-- img = "fb_zlqj.png",
		-- dwPng = "",
		-- --副本开放时间
		-- fbOpenTime = "<font color='#00FF00'>终南山剧情副本 04 寒玉冰室</font>";
		-- --副本奖励类型
		-- fbAwardType = "<font color='#CA9754'>终南山剧情副本 04 寒玉冰室</font>",
		-- addTimes = 0;---使用道具可多进入X次
		-- fbItemProp =
		-- {
			-- [2] = {dwItemEnum = 5500080},
		-- },
		-- itemTbl =
		-- {
			-- --[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		-- },
		-- failItemTbl =
		-- {
			-- --[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		-- },
		-- showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		-- fbInfo = "",
		-- --fbInfo1 = "1111",
		-- --副本难度系数
		-- fbDifficity =
		-- {--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		-- [0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		-- [1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		-- [2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		-- [3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		-- [4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		-- [5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		-- },
		-- --msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		-- Info02Icon = "999_1.png",  ----副本提示信息图片配置
		-- dwShowJiFen = 0;
	-- };
--------------------------------------------------------丐帮竹林剧情副本01 比武擂台----------------------------------------------------------------------
	[1097] =
	{
		dwID = 1097,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =12;
		-- MapSet = {5097},
		MapSet = function()
			return {5097}, 5097;
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5097,
		ReliveMapId = 1009,  --传出副本的地图id
		Posx = -11,--传出副本的地图posx
		Posy = -63,--传出副本的地图posy
		fbname = "比武擂台",
		describe = "丐帮竹林剧情副本01",
		types = "day",
		npcId = 10031009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>丐帮竹林剧情副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>丐帮竹林剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>丐帮竹林剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.在技能界面中学习无双</p><p>2.拥有一颗煞元(10000点杀意值)</p><p><font color='#cd0000'>(释放无双需要消耗一个煞元)</font></p><p>3.使用无双技能</p><p><font color = '#00FF00'>目标:击败纪恭达 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>学习如何使用无双技能</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
--------------------------------------------------------丐帮竹林剧情副本02 碧林深处----------------------------------------------------------------------
	[1098] =
	{
		dwID = 1098,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =12;
		--MapSet = {5098},
		MapSet = function()
			return {5098}, 5098;
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5098,
		ReliveMapId = 1009,  --传出副本的地图id
		Posx = -81.56,--传出副本的地图posx
		Posy = 13.84,--传出副本的地图posy
		fbname = "碧林深处",
		describe = "丐帮竹林剧情副本02",
		types = "day",
		npcId = 10031009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>丐帮竹林剧情副本02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>丐帮竹林剧情副本02</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>丐帮竹林剧情副本02</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.在技能界面中学习无双</p><p>2.拥有一颗煞元(10000点杀意值)</p><p><font color='#cd0000'>(释放无双需要消耗一个煞元)</font></p><p>3.使用无双技能</p><p><font color = '#00FF00'>目标:击败纪恭达 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>学习如何使用无双技能</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
--------------------------------------------------------丐帮竹林剧情副本03 蛊兵据点----------------------------------------------------------------------
	[1099] =
	{
		dwID = 1099,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder=12;
		--MapSet = {5099},
		MapSet = function()
			return {5099}, 5099;
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5099,
		ReliveMapId = 1009,  --传出副本的地图id
		Posx = -26,--传出副本的地图posx
		Posy = 80,--传出副本的地图posy
		fbname = "蛊兵据点",
		describe = "丐帮竹林剧情副本03",
		types = "day",
		npcId = 10031009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>丐帮竹林剧情副本03</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>丐帮竹林剧情副本03</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>丐帮竹林剧情副本03</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.在技能界面中学习无双</p><p>2.拥有一颗煞元(10000点杀意值)</p><p><font color='#cd0000'>(释放无双需要消耗一个煞元)</font></p><p>3.使用无双技能</p><p><font color = '#00FF00'>目标:击败纪恭达 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>学习如何使用无双技能</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
----------------------------------------------------华山剧情副本 01----------------------------------------------------------------------------
	[1100] =
	{
		dwID = 1100,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5100},
		MapSet = function()
			return {5100}, 5100;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5100,
		ReliveMapId = 1010,  --传出副本的地图id
		Posx = 30,--传出副本的地图posx
		Posy = -110,--传出副本的地图posy
		fbname = "双绝之墓",
		describe = "华山剧情副本 01",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>华山剧情副本 01</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>华山剧情副本 01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>华山剧情副本 01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------华山剧情副本 02  无名洞 - 清音洞 - 无名洞夜 ----------------------------------------------------------------------------
	[1101] =
	{
		dwID = 1101,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5101,5102,5103},
		MapSet = function()
			return {5101,5102,5103}, 5101,5102,5103;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5101,
		ReliveMapId = 1010,  --传出副本的地图id
		Posx = 13,--传出副本的地图posx
		Posy = 105,--传出副本的地图posy
		fbname = "无名洞",
		describe = "华山剧情副本 02",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>华山剧情副本 02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>华山剧情副本 02</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>华山剧情副本 02</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------嵩山剧情副本01  藏经阁----------------------------------------------------------------------------
	[1104] =
	{
		dwID = 1104,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5104,5105,5106,5107},
		MapSet = function()
			return {5104,5105,5106,5107}, 5104,5105,5106,5107;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5104,
		ReliveMapId = 1011,  --传出副本的地图id
		Posx = 25,--传出副本的地图posx
		Posy = 83,--传出副本的地图posy
		fbname = "藏经阁",
		describe = "嵩山剧情副本 01",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>嵩山剧情副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>嵩山剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>嵩山剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------嵩山剧情副本02  达摩洞----------------------------------------------------------------------------
	[1108] =
	{
		dwID = 1108,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5108,5109},
		MapSet = function()
			return {5108,5109}, 5108,5109;
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5108,
		ReliveMapId = 1011,  --传出副本的地图id
		Posx = -7,--传出副本的地图posx
		Posy = -107,--传出副本的地图posy
		fbname = "达摩洞",
		describe = "嵩山剧情副本 02",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>嵩山剧情副本02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>嵩山剧情副本02</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>嵩山剧情副本02</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------昆仑山剧情副本01  白猿洞----------------------------------------------------------------------------
	[1110] =
	{
		dwID = 1110,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5108,5109},
		MapSet = function()
			return {5110}, 5110;
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5110,
		ReliveMapId = 1012,  --传出副本的地图id
		Posx = -49,--传出副本的地图posx
		Posy = -21,--传出副本的地图posy
		fbname = "白猿洞",
		describe = "昆仑山剧情副本01",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>嵩山剧情副本02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>昆仑山剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>昆仑山剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------昆仑山剧情副本02  长生阁----------------------------------------------------------------------------
	[1111] =
	{
		dwID = 1111,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5108,5109},
		MapSet = function()
			return {5111,5112,5113,5114,5115,5116}, 5111,5112,5113,5114,5115,5116;
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5111,
		ReliveMapId = 1012,  --传出副本的地图id
		Posx = -32,--传出副本的地图posx
		Posy = 83,--传出副本的地图posy
		fbname = "长生阁",
		describe = "昆仑山剧情副本02",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>嵩山剧情副本02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>昆仑山剧情副本02</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>昆仑山剧情副本02</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------昆仑山剧情副本03  篝火盛会----------------------------------------------------------------------------
	[1117] =
	{
		dwID = 1117,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5108,5109},
		MapSet = function()
			return {5117}, 5117;
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5111,
		ReliveMapId = 1012,  --传出副本的地图id
		Posx = 33,--传出副本的地图posx
		Posy = -126,--传出副本的地图posy
		fbname = "篝火盛会",
		describe = "昆仑山剧情副本03",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>昆仑山剧情副本03</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>昆仑山剧情副本03</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>昆仑山剧情副本03</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
-----------------------------------------------------黑水遗迹剧情副本01----------------------------------------------------- 旧城遗址----------------------------------------------------------------------------
	[1118] =
	{
		dwID = 1118,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5108,5109},
		MapSet = function()
			return {5118}, 5118;
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5118,
		ReliveMapId = 1013,  --传出副本的地图id
		Posx = 80,--传出副本的地图posx
		Posy = 31,--传出副本的地图posy
		fbname = "旧城遗址",
		describe = "黑水遗迹剧情副本01",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>黑水遗迹剧情副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>黑水遗迹剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>黑水遗迹剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
-----------------------------------------------------黑水遗迹剧情副本02----------------------------------------------------- 黑将军府1层----------------------------------------------------------------------------
	[1119] =
	{
		dwID = 1119,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 999;
		--MapSet = {5108,5109},
		MapSet = function()
			return {5119,5120,5121}, 5119,5120,5121;
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5119,
		ReliveMapId = 1013,  --传出副本的地图id
		Posx = 45,--传出副本的地图posx
		Posy = -59,--传出副本的地图posy
		fbname = "黑将军府一",
		describe = "黑水遗迹剧情副本02",
		types = "day",
		npcId = 10011009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>黑水遗迹剧情副本02</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>黑水遗迹剧情副本02</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>黑水遗迹剧情副本02</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "1111",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>追捕梁梦儿！</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
--------------------------------------------------------黑水遗迹剧情副本03--枯井----------------------------------------------------------------------
	[1120] =
	{
		dwID = 1120,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 5,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =13;
		--MapSet = {5003},
		MapSet = function()
			return {5122}, 5122;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5122,
		ReliveMapId = 1013,  --传出副本的地图id
		Posx = 105,--传出副本的地图posx
		Posy = -106,--传出副本的地图posy
		fbname = "枯井",
		describe = "剧情副本03",
		types = "day",
		npcId = 10031009,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>剧情副本03</font>",
		img = "fb_zlqj.png",
		dwPng = "",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>剧情副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>剧情副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打败玉蟾</p><p>2.与郭靖对话</p><p>3.救醒昏迷的郭芙</p><p>4.自行离开清音洞</p><p><font color = '#00FF00'>目标:击败玉蟾 @I/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从清音洞救出郭芙</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
------------------------------------------------
------------------------------------------------------------------大破联营------------------------------------------------------------
	[1003] =
	{
		dwID = 1003,
		dwPlayerCount = 5,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 35,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 90,
		dwEnterTimes = 1,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 90;
		dwDelFbTime = 5;   --多人本副本内没有5分钟后删除副本
		bInShow = 1;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 35;
		--MapSet = {5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016},
		MapSet = function()
			--return {5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016};
			return {5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016}, 5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016;
		end,			
		-- MapTransSet = {
		-- {5004, "<p><font color='#6699FF'>金军联营01</font></p><p>怪物等级：<font color='#FFFFFF'>20-24</font></p><p>BOSS：<font color='#CC0033'>左营万夫长</font></p>"},
		-- {5005, "<p><font color='#6699FF'>金军联营02</font></p><p>怪物等级：<font color='#FFFFFF'>23-27</font></p><p>BOSS：<font color='#CC0033'>右营万夫长</font></p>"},
		-- {5006, "<p><font color='#6699FF'>金军联营03</font></p><p>怪物等级：<font color='#FFFFFF'>26-30</font></p><p>BOSS：<font color='#CC0033'>中军大将</font></p>"},
		-- {5007, "<p><font color='#6699FF'>金军联营04</font></p><p>怪物等级：<font color='#FFFFFF'>29-33</font></p><p>BOSS：<font color='#CC0033'>左营万夫长</font></p>"},
		-- {5008, "<p><font color='#6699FF'>金军联营05</font></p><p>怪物等级：<font color='#FFFFFF'>32-36</font></p><p>BOSS：<font color='#CC0033'>右营万夫长</font></p>"},
		-- {5009, "<p><font color='#6699FF'>金军联营06</font></p><p>怪物等级：<font color='#FFFFFF'>35-39</font></p><p>BOSS：<font color='#CC0033'>中军大将</font></p>"},
		-- {5010, "<p><font color='#6699FF'>金军联营07</font></p><p>怪物等级：<font color='#FFFFFF'>38-42</font></p><p>BOSS：<font color='#CC0033'>左营万夫长</font></p>"},
		-- {5011, "<p><font color='#6699FF'>金军联营08</font></p><p>怪物等级：<font color='#FFFFFF'>41-45</font></p><p>BOSS：<font color='#CC0033'>右营万夫长</font></p>"},
		-- {5012, "<p><font color='#6699FF'>金军联营09</font></p><p>怪物等级：<font color='#FFFFFF'>44-48</font></p><p>BOSS：<font color='#CC0033'>中军大将</font></p>"},
		-- {5013, "<p><font color='#6699FF'>金军联营10</font></p><p>怪物等级：<font color='#FFFFFF'>47-51</font></p><p>BOSS：<font color='#CC0033'>左营万夫长</font></p>"},
		-- {5014, "<p><font color='#6699FF'>金军联营11</font></p><p>怪物等级：<font color='#FFFFFF'>50-54</font></p><p>BOSS：<font color='#CC0033'>右营万夫长</font></p>"},
		-- {5015, "<p><font color='#6699FF'>金军联营12</font></p><p>怪物等级：<font color='#FFFFFF'>53-57</font></p><p>BOSS：<font color='#CC0033'>中军大将</font></p>"},
		-- {5016, "<p><font color='#6699FF'>金军联营13</font></p><p>怪物等级：<font color='#FFFFFF'>56-60</font></p><p>BOSS：<font color='#CC0033'>左营万夫长</font></p>"},
		-- {5017, "<p><font color='#6699FF'>金军联营14</font></p><p>怪物等级：<font color='#FFFFFF'>59-63</font></p><p>BOSS：<font color='#CC0033'>右营万夫长</font></p>"},
		-- {5018, "<p><font color='#6699FF'>金军联营15</font></p><p>怪物等级：<font color='#FFFFFF'>62-66</font></p><p>BOSS：<font color='#CC0033'>中军大将</font></p>"},
		-- {5019, "<p><font color='#6699FF'>金军联营16</font></p><p>怪物等级：<font color='#FFFFFF'>65-69</font></p><p>BOSS：<font color='#CC0033'>左营万夫长</font></p>"},
		-- {5020, "<p><font color='#6699FF'>金军联营17</font></p><p>怪物等级：<font color='#FFFFFF'>68-72</font></p><p>BOSS：<font color='#CC0033'>右营万夫长</font></p>"},
		-- {5021, "<p><font color='#6699FF'>金军联营18</font></p><p>怪物等级：<font color='#FFFFFF'>71-75</font></p><p>BOSS：<font color='#CC0033'>中军大将</font></p>"},
		-- },
		EnterMapId = 5004,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "大破联营",
		describe = "    金蒙两国联手攻宋,朝廷援兵未至,襄阳局势愈急,吕太守发布英雄帖,向各位江湖侠士求助,期以武林之力击破金军连营.凡我大宋豪杰,皆以抗金卫国为己任,一时间,响应者无数,无数高手纷纷投入到这场战役中.",
		types = "day",
		npcId = 10021099,
		exps = 3,---活动界面要用到
		money = 1,---活动界面要用到
		equipLevel = 2,---活动界面要用到
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>金蒙两国联手攻宋,朝廷援兵未至,襄阳局势愈急,吕太守发布英雄帖,向各位江湖侠士求助,期以武林之力击破金军连营.凡我大宋豪杰,皆以抗金卫国为己任,一时间,响应者无数,无数高手纷纷投入到这场战役中.",
		fbNeed = "    <font color='#00FF00'>【副本全程共<font color='#FF0000'>13</font>层，难度从<font color='#FF0000'>35</font>到<font color='#FF0000'>70</font>级递增，玩家需<font color='#FF0000'>不停的成长</font>和<font color='#FF0000'>积累战力</font>才能横扫金蒙联营通关副本 ,每闯一层都会有很大的收获。击杀敌兵获得<font color='#FF0000'>大量经验</font>，注意副本中的<font color='#FF0000'>辎重</font>和<font color='#FF0000'>物资车</font>有<font color='#FF0000'>意外的惊喜</font>，BOSS会掉落<font color='#FF0000'>商城道具</font>和<font color='#FF0000'>技能书残卷</font>】</font><br>    <font color='#33A1C9'>金蒙两国联手攻宋,朝廷援兵未至,襄阳局势愈急,吕太守发布英雄帖,向各位江湖侠士求助,期以武林之力击破金军连营。凡我大宋豪杰,皆以抗金卫国为己任,一时间,响应者无数,无数高手纷纷投入到这场战役中。</font>",
		img = "fb_dpjy.png",
		dwPng = "img://ffb_dpjy.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量经验</font>",
		addTimes = 1;---使用道具可多进入X次
		--副本道具
		fbItemProp = {
			[1] = {dwItemEnum = 5500200},
			[2] = {dwItemEnum = 5500080},
		},
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
				                [1] = {dwItemEnum = 9405010,dwItemNumber = 1, dwBindType = 1}, --神龙果
				                [2] = {dwItemEnum = 4100130,dwItemNumber = 3, dwBindType = 1}, --升阶玄晶
								[3] = {dwItemEnum = 4100210,dwItemNumber = 3, dwBindType = 1}, --精铁锭*3
				};
				return {PassMoney = 150000, Gold = 0, Zhenqi = 3000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(7+ math.floor ( uLevel/10 )*0.1), itemTbl = itemTbl}
			end;
		end;
		itemTbl =
		{
			[1] = {dwItemEnum = 4100140,dwItemNumber = 8, dwBindType = 1},
--			[2] = {dwItemEnum = 2500080,dwItemNumber = 1, dwBindType = 1},
		},
		PassMoney = 0, Gold = 100, Zhenqi = 1500, Exp = 3000000,
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1.5小时</font><br>您当前已使用:",
		dropItemTbl = {
			[1] = {dwItemEnum = 4100140,dwItemNumber = 8, dwBindType = 1},
			[2] = {dwItemEnum = 2500080,dwItemNumber = 1, dwBindType = 1},
			[3] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
			[4] = {dwItemEnum = 5500200,dwItemNumber = 1, dwBindType = 1},
			[5] = {dwItemEnum = 5500080,dwItemNumber = 1, dwBindType = 1},
		},
		showEnterType = 2,--showEnterType:0单人，1多人，2单双人

		fbInfo = "层层突破金蒙联军的营地<font color='#008000'>  1前哨站>2驿馆>3甬道>4粮仓>5将营>6前哨站>7驿馆>8甬道>9粮仓>10将营>11前帐>12指挥大帐>13辎储地</font>",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>副本总BOSS数:18</p><p>本地图BOSS剩余:@B</p><p>剩余怪物: <font color='#cd0000'>@A</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		msg = "“此处便是<font color = '#22AE02'>金蒙联营的前哨站</font>了,下面就看你的了!”<br>                               -------<font color = '#22AE02'>宋军斥候</font>",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		fbNamePng = "Fbndply.png",
		dwShowJiFen = 0,
		--一键完成消耗元宝数
		CompleteDuplCost = 50;
		--一键完成奖励比例
		CompleteRate = 1;		
	};
	--------------------------------------------------------珍珑棋局----------------------------------------------------------------
	[1004] =
	{
		dwID = 1004,
		dwPlayerCount = 5,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 35,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 90,
		dwEnterTimes = 99999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 20*60;
		dwDelFbTime = 0;   --多人本副本内没有5分钟后删除副本
		bInShow = 2;---是否剧情副本，是否显示在入口界面   0不显示，1显示，2为珍珑棋局
		dwShowOrder = 40;
		--MapSet = {5030},
		MapSet = function()
			return {5030}, 5030;
		end,
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5030,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "珍珑棋局",
		describe = "    <font color='#00FF00'>【玩家<font color='#FF0000'>单人</font>挑战珍珑棋局中的BOSS，进入次数不限，每天重置一次，最快击杀当前全服最高难度BOSS的玩家便成为“<font color='#FF0000'>珍珑棋圣</font>”，其中BOSS会掉落<font color='#FF0000'>商城道具</font>、<font color='#FF0000'>技能书残卷</font>和<font color='#FF0000'>棋魂</font>，<font color='#FF0000'>棋魂</font>可在<font color='#FF0000'>NPC何居奇</font>处换取<font color='#FF0000'>稀有装备包</font>】</font><br>    <font color='#33A1C9'>棋痴老先生用尽其毕生精力研究参透的珍珑棋局,据说棋局中包含十几种棋势与变化,甚多武林侠士前往对弈皆败下阵来。而通关者无一不成为武林名士、武林宗主。</font>",
		types = "day",
		npcId = 10021099,
		exps = 2,
		money = 1,
		equipLevel = 3,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>1.与棋痴对话启动棋局<br>2.棋子分为黑白两种<br>3.自棋子刷新出后30秒,则出现BOSS,此时若棋子未被打破,则会幻化为棋魂<br>4.在这里您将面对不同的英雄人物,请小心应付",
		fbNeed = "    <font color='#00FF00'>【玩家单人挑战珍珑棋局中的BOSS，进入次数不限，每天重置一次，最快击杀当前全服最高难度BOSS的玩家便成为“珍珑棋圣”，副本BOSS会掉落<font color='#FF0000'>商城道具</font>、<font color='#FF0000'>技能书残卷</font>和<font color='#FF0000'>棋魂</font>，<font color='#FF0000'>棋魂</font>可在<font color='#FF0000'>NPC何居奇</font>处换取<font color='#FF0000'>稀有装备包</font>】</font><br>    <font color='#33A1C9'>棋痴老先生用尽其毕生精力研究参透的珍珑棋局,据说棋局中包含十几种棋势与变化,甚多武林侠士前往对弈皆败下阵来。而通关者无一不成为武林名士、武林宗主。</font>",
		img = "fb_zlqj.png",
		dwPng = "img://ffb_zlqj.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量经验</font>",
		addTimes = 1;---使用道具可多进入X次
		fbItemProp = {
			[1] = {dwItemEnum = 5500210},
			[2] = {dwItemEnum = 5500080},
		},
		--itemTbl =
		--{
			--[1] = {dwItemEnum = 4100140,dwItemNumber = 5, dwBindType = 1},
--			[2] = {dwItemEnum = 2500080,dwItemNumber = 1, dwBindType = 1},
		--},
		
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl ={[1] = {dwItemEnum = 4100140,dwItemNumber = 5, dwBindType = 1}};	
				return {PassMoney = 0, Gold = 100, Zhenqi = 3000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp, itemTbl = itemTbl}
			end;
		end;
		--PassMoney = 0, Gold = 100, Zhenqi = 3000, Exp = 5000000,
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		dropItemTbl = {--------副本掉落显示
			[1] = {dwItemEnum = 5500570,dwItemNumber = 1, dwBindType = 0},
			[2] = {dwItemEnum = 5500390,dwItemNumber = 1, dwBindType = 0},
			[3] = {dwItemEnum = 5500561,dwItemNumber = 1, dwBindType = 0},
			[4] = {dwItemEnum = 4901000,dwItemNumber = 1, dwBindType = 0},
			[5] = {dwItemEnum = 5500400,dwItemNumber = 1, dwBindType = 0},
			[6] = {dwItemEnum = 5500590,dwItemNumber = 1, dwBindType = 0},
			--[7] = {dwItemEnum = 5500440,dwItemNumber = 1, dwBindType = 0},
			},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "1.棋子分为黑白两种      2.BOSS出现时,棋子会幻化为棋魂     3.<font color='#008000'>白/黑</font>棋魂给BOSS增加<font color='#008000'>生命/攻击</font>,请小心应付",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>经验收益:<font color = '#00FF00'>@K</font></p><p>击败BOSS数:<font color = '#00FF00'>@J</font>/17</p><p>当前剩余棋子/魂:<font color='#cd0000'>@A</font></p><p><font color = '#00FF00'>目标:成功破解所有棋势变化</font></p><p>温馨提示:</p><p><font color = '#00FF00'>1.</font>棋子在BOSS出现时,会幻化成棋魂,棋魂会降低玩家战力</p><p><font color = '#00FF00'>2.</font>BOSS生命<font color='#cd0000'>低于40%时</font>,会更加<font color='#cd0000'>频繁释放技能</font>,请多加小心</p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1.2},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1.2},---组队1人难度
		[2] = {dwHPMax = 1.1,dwMPMax = 1.1,dwAttack = 1.1,dwDefense = 1.1,dwFlee = 1.1,dwCrit = 1.1,dwExp = 1.3},---组队2人难度
		[3] = {dwHPMax = 1.2,dwMPMax = 1.2,dwAttack = 1.2,dwDefense = 1.2,dwFlee = 1.2,dwCrit = 1.2,dwExp = 1.4},---组队3人难度
		[4] = {dwHPMax = 1.3,dwMPMax = 1.3,dwAttack = 1.3,dwDefense = 1.3,dwFlee = 1.3,dwCrit = 1.3,dwExp = 1.5},---组队4人难度
		[5] = {dwHPMax = 1.4,dwMPMax = 1.4,dwAttack = 1.4,dwDefense = 1.4,dwFlee = 1.4,dwCrit = 1.4,dwExp = 1.5},---组队5人难度
		},
		--第一次进入副本的提示信息
		msg = "请<font color = '#22AE02'>与NPC对话开始副本</font>,详情请点击查看<font color = '#22AE02'>“M”键</font>.<br>副本需要消耗<font color = '#22AE02'>千纸鹤</font>请储备一些.",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		needItem = 4100010;
		--刷怪消耗物品个数
		needItemNum = {
			[1] = 0,
			[2] = 1,[3] = 1,[4] = 1,
			[5] = 2,[6] = 2,[7] = 2,[8] = 2,
			[9] = 3,[10] = 3,[11] = 3,[12] = 3,
			[13] = 4,
		},
		fbNamePng = "Fbnzlqj.png",
		dwShowJiFen = 0,
	};
	-----------------------------------------------------end-------------------------------------------------------------------
	-----------------------------------------------------五行道场----------------------------------------------------------------
	[1006] =
	{
		dwID = 1006,
		dwPlayerCount = 5,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 50,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 90,
		dwEnterTimes = 1,
		dwOpenDay = {0,1,2,3,4,5,6},	--开放日期
		dwFbStartTime = "00:00",		--开启时间
		dwFbEndTime = "24:00",			--结束世界
		dwCloseFbTime = 60;
		dwDelFbTime = 5;   --多人本副本内没有5分钟后删除副本
		bInShow = 1;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 50;
		--MapSet = {5050},
		MapSet = function()
			return {5050}, 5050;
		end,		
		--MapTransSet = {{5050, "aaaaaaaaa"}},
		EnterMapId = 5050,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "五行道场",
		describe = "    凡修习内家心法之人,到达一定境界后,对真气之运转必自有一番领悟.然而此阶段之后,瓶颈随之而来,五行道场乃据五行之法,依阴阳术数排列建造,一旦进入,其中的特殊气场将与习武之人体内的五行真气相互呼应,令人产生不同的幻觉.凡凭自身定力从幻觉中醒悟者,多有意外之喜。（通关五行道场可获得大量真气）",
		types = "day",
		npcId = 10021099,
		exps = 2,
		money = 2,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>1.与五行道人对话开启副本<br>2.开启后将会出现五行兽图腾石雕<br>3.攻击石雕将会不断涌现出五行小怪<br>4.石雕被击破以后,五行BOSS将会出现<br>5.击败五个五行BOSS以后,中央广场将出现五行圣兽！",
			fbNeed = "    <font color='#00FF00'>【适合真气短缺的玩家挑战，副本内小怪和BOSS掉落大量的<font color='#FF0000'>真气丹</font>，BOSS额外掉落<font color='#FF0000'>商城道具</font>和<font color='#FF0000'>技能书残卷</font>】</font><br>    <font color='#33A1C9'>凡修习内家心法之人,到达一定境界后,对真气之运转必自有一番领悟。然而此阶段之后,瓶颈随之而来,五行道场乃据五行之法,依阴阳术数排列建造,一旦进入,其中的特殊气场将与习武之人体内的五行真气相互呼应,令人产生不同的幻觉。凡凭自身定力从幻觉中醒悟者,多有意外之喜。</font>",
		img = "fb_wxdc.png",
		dwPng = "img://ffb_wxdc.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量经验</font>",
		addTimes = 1;---使用道具可多进入X次
		fbItemProp = {
			[1] = {dwItemEnum = 5500220},
			[2] = {dwItemEnum = 5500080},
		},
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
				    [1] = {dwItemEnum = 4100080,dwItemNumber = 6, dwBindType = 1},	--亮银砂
				    [2] = {dwItemEnum = 4100110,dwItemNumber = 3, dwBindType = 1},	--剑魂石
					[3] = {dwItemEnum = 4100420,dwItemNumber = 2, dwBindType = 1} --紫钧元*2
			    };	
				return {PassMoney = 120000, Gold = 0, Zhenqi = 3000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(6.8+ math.floor ( uLevel/10 )*0.1), itemTbl = itemTbl}
			end;
		end;
		itemTbl =
		{
			[1] = {dwItemEnum = 9405010,dwItemNumber = 3, dwBindType = 1},
		--	[2] = {dwItemEnum = 2500080,dwItemNumber = 1, dwBindType = 1},
		},
		PassMoney = 0, Gold = 150, Zhenqi = 2000, Exp = 500000,
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		dropItemTbl = {--------副本掉落显示

			[1] = {dwItemEnum = 5500450,dwItemNumber = 1, dwBindType = 0},
			[2] = {dwItemEnum = 5500430,dwItemNumber = 1, dwBindType = 0},
			[3] = {dwItemEnum = 5500390,dwItemNumber = 1, dwBindType = 0},
			[4] = {dwItemEnum = 5500400,dwItemNumber = 1, dwBindType = 0},
			[5] = {dwItemEnum = 5500420,dwItemNumber = 1, dwBindType = 0},
			[6] = {dwItemEnum = 2300232,dwItemNumber = 1, dwBindType = 1},
			[7] = {dwItemEnum = 2300231,dwItemNumber = 1, dwBindType = 1},
			[8] = {dwItemEnum = 2300230,dwItemNumber = 1, dwBindType = 1},
			[9] = {dwItemEnum = 5500410,dwItemNumber = 1, dwBindType = 0},
			[10] = {dwItemEnum = 5500440,dwItemNumber = 1, dwBindType = 0},
		},
		showEnterType = 2,--showEnterType:0单人，1多人，2单双人
		fbInfo = "副本开启后随机获得一个五行BUFF，对属性相克的怪物造成额外的伤害，击败<font color='#008000'>五行石雕</font>和<font color='#008000'>五行BOSS</font>以后,中央广场将出现<font color='#008000'>五行圣兽</font>!",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>经验收益:<font color = '#00FF00'>@K</font></p><p>击败BOSS数:<font color = '#00FF00'>@J</font>/6</p><p>地图剩余怪物:<font color='#cd0000'>@A</font></p><p><font color = '#00FF00'>目标:打败五行各属性BOSS,唤出五行圣兽并击败它</font></p><p>温馨提示:</p><p><font color = '#00FF00'>1.</font>攻击五行BOSS的石雕会出现小怪,切勿招引过多</p><p><font color = '#00FF00'>2.</font>五行各属性BOSS击败以后,中间祭台会出现五行圣兽</p><p><font color = '#00FF00'>3.</font>组队副本时,可以合理分工,提高效率</p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 2.5,dwMPMax = 1,dwAttack = 2,dwDefense = 1.3,dwFlee = 1.2,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 2.5,dwMPMax = 1,dwAttack = 2,dwDefense = 1.3,dwFlee = 1.2,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 3,dwMPMax = 1.1,dwAttack = 2.2,dwDefense = 1.4,dwFlee = 1.2,dwCrit = 1.1,dwExp = 1.1},---组队2人难度
		[3] = {dwHPMax = 3.5,dwMPMax = 1.2,dwAttack = 2.4,dwDefense = 1.5,dwFlee = 1.2,dwCrit = 1.2,dwExp = 1.2},---组队3人难度
		[4] = {dwHPMax = 4,dwMPMax = 1.3,dwAttack = 2.6,dwDefense = 1.6,dwFlee = 1.2,dwCrit = 1.3,dwExp = 1.3},---组队4人难度
		[5] = {dwHPMax = 4.5,dwMPMax = 1.4,dwAttack = 2.8,dwDefense = 1.7,dwFlee = 1.2,dwCrit = 1.4,dwExp = 1.4},---组队5人难度
		},
		msg = "请<font color = '#22AE02'>与NPC对话开始副本</font>,详情请点击查看<font color = '#22AE02'>“M”键</font>.",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		fbNamePng = "Fbnwxdc.png",
		dwShowJiFen = 0,
		--一键完成消耗元宝数
		CompleteDuplCost = 50;
		--一键完成奖励比例
		CompleteRate = 1;		
	};
	-----------------------------------------------------------------end----------------------------------------------------------------------
	-----------------------------------------------------十面埋伏----------------------------------------------------------------
	[1007] =
	{
		dwID = 1007,
		dwPlayerCount = 5,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 65,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 90,
		dwEnterTimes = 1,
		dwOpenDay = {0,1,2,3,4,5,6},	--开放日期
		dwFbStartTime = "00:00",		--开启时间
		dwFbEndTime = "24:00",			--结束世界
		dwCloseFbTime = 60;
		dwDelFbTime = 5;   --多人本副本内没有5分钟后删除副本
		bInShow = 1;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 65;
		--MapSet = {5060},
		MapSet = function()
			return {5060}, 5060;
		end,			
		EnterMapId = 5060,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "十面埋伏",
		describe = "十面埋伏 详细说明",
		types = "day",
		npcId = 10021099,
		exps = 2,
		money = 2,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br><font color='#E3170D'>进入限制：只支持单人进入</font><br>进入以后会根据玩家等级出现对应的金兵，总共分为8波金兵，每一波会分8次出现，并且每一波最后出现金兵小头目，请及时清理金兵，否则金兵将会越来越多。",
		fbNeed = "<font color='#33A1C9'>金国大将，应对宋军摆出的人海战术。虽然阵法简单，但是却威猛异常。宋将军曾经率百骑破其阵法于襄阳野郊。‘冲锋之势，有进无退。陷阵之志，有死无生’，宋将军凯旋时如是说道。</font>",
		img = "fb_smmf.png",
		dwPng = "img://ffb_smmf.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量经验</font>",
		addTimes = 1;---使用道具可多进入X次
		fbItemProp = {
			[1] = {dwItemEnum = 5500230},
			[2] = {dwItemEnum = 5500080},
		},
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
				    [1] = {dwItemEnum = 4100430,dwItemNumber = 2, dwBindType = 1};	--檀心丹
					[2] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1};  --升阶玄铁  
					[3] = {dwItemEnum = 5809368,dwItemNumber = 1, dwBindType = 1};  --星轨*1
			    };	
				return {PassMoney = 0, Gold = 0, Zhenqi = 3000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.1), itemTbl = itemTbl}
			end;
		end;
		itemTbl =
		{
			[1] = {dwItemEnum = 9405010,dwItemNumber = 3, dwBindType = 1},
		--	[2] = {dwItemEnum = 2500080,dwItemNumber = 1, dwBindType = 1},
		},
		PassMoney = 0, Gold = 150, Zhenqi = 2000, Exp = 500000,
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		dropItemTbl = {--------副本掉落显示

			[1] = {dwItemEnum = 5500450,dwItemNumber = 1, dwBindType = 0},
			[2] = {dwItemEnum = 5500430,dwItemNumber = 1, dwBindType = 0},
			[3] = {dwItemEnum = 5500390,dwItemNumber = 1, dwBindType = 0},
			[4] = {dwItemEnum = 5500400,dwItemNumber = 1, dwBindType = 0},
			[5] = {dwItemEnum = 5500420,dwItemNumber = 1, dwBindType = 0},
			[6] = {dwItemEnum = 2300232,dwItemNumber = 1, dwBindType = 1},
			[7] = {dwItemEnum = 2300231,dwItemNumber = 1, dwBindType = 1},
			[8] = {dwItemEnum = 2300230,dwItemNumber = 1, dwBindType = 1},
			[9] = {dwItemEnum = 5500410,dwItemNumber = 1, dwBindType = 0},
			[10] = {dwItemEnum = 5500440,dwItemNumber = 1, dwBindType = 0},
		},
		showEnterType = 2,--showEnterType:0单人，1多人，2单双人
		fbInfo = "努力冲出<font color='#008000'>15波</font>金军小队的围攻<font color='#008000'>  击败最终BOSS顺利通关！</font>,每<font color='#008000'> 5</font>波金兵后会出现金军BOSS,玩家要小心应对.",
		
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>经验收益:<font color = '#00FF00'>@K</font></p><p>击败BOSS数:<font color = '#00FF00'>@J</font>/6</p><p>地图剩余怪物:<font color='#cd0000'>@A</font></p><p><font color = '#00FF00'>目标:打败五行各属性BOSS,唤出五行圣兽并击败它</font></p><p>温馨提示:</p><p><font color = '#00FF00'>1.</font>攻击五行BOSS的石雕会出现小怪,切勿招引过多</p><p><font color = '#00FF00'>2.</font>五行各属性BOSS击败以后,中间祭台会出现五行圣兽</p><p><font color = '#00FF00'>3.</font>组队副本时,可以合理分工,提高效率</p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		msg = "请<font color = '#22AE02'>与NPC对话开始副本</font>,副本开启<font color='#008000'>5秒</font>后金兵开始围攻，<font color='#008000'>进入生存模式</font>.",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		fbNamePng = "Fbnsmmf.png",
		dwShowJiFen = 0,
		--一键完成消耗元宝数
		CompleteDuplCost = 50;
		--一键完成奖励比例
		CompleteRate = 1;		
	};
	-----------------------------------------------------------------end----------------------------------------------------------------------
	-----------------------------------------------------烽火辎路----------------------------------------------------------------
	[1008] =
	{
		dwID = 1008,
		dwPlayerCount = 5,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 45,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 90,
		dwEnterTimes = 1,
		dwOpenDay = {0,1,2,3,4,5,6},	--开放日期
		dwFbStartTime = "00:00",		--开启时间
		dwFbEndTime = "24:00",			--结束世界
		dwCloseFbTime = 60;
		dwDelFbTime = 5;   --多人本副本内没有5分钟后删除副本
		bInShow = 1;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 45;
		--MapSet = {5070},
		MapSet = function()
			return {5070}, 5070;
		end,		
		--MapTransSet = {5060},
		--MapTransSet = {{5060, "aaaaaaaaa"}},
		EnterMapId = 5070,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "烽火辎路",
		describe = "      自古以来,蒙古对大宋虎视眈眈,近来有斥候查知,蒙古军队活动频繁,辎重粮草往来不绝,恐对大宋不利.各路英雄当奋起之,截其辎重,断其粮草,以灭其狼子野心。（通关烽火辎路可获得大量银两）",
		types = "day",
		npcId = 10021099,
		exps = 1,
		money = 3,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>1.与军师对话,将会出现蒙军辎重车<br>2.辎重车若进入蒙古军营,将会消失<br>3.也有一些其余势力看上了辎重,请留意意外事件<br>4.蒙古军需官在最后一波出现，请留心他带的军队<br>",
		fbNeed = "    <font color='#00FF00'>【摧毁敌方物资车可以获得<font color='#FF0000'>大量银两</font>，注意<font color='#FF0000'>小猪</font>和<font color='#FF0000'>被困村民</font>都会掉落<font color='#FF0000'>商城道具</font>，击败BOSS会掉落<font color='#FF0000'>商城道具</font>和<font color='#FF0000'>技能书残卷</font>】</font><br>    <font color='#33A1C9'>自古以来,蒙古对大宋虎视眈眈,近来有斥候查知,蒙古军队活动频繁,辎重粮草往来不绝,恐对大宋不利。各路英雄当奋起之,截其辎重,断其粮草,以灭其狼子野心。</font>",
		img = "fb_fhzl.png",
		dwPng = "img://ffb_fhzl.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量金钱</font>",
		addTimes = 1;---使用道具可多进入X次
		fbItemProp = {
			[1] = {dwItemEnum = 5500250},
			[2] = {dwItemEnum = 5500080},
		},
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
				    [1] = {dwItemEnum = 9405010,dwItemNumber = 3, dwBindType = 1},	--神龙果
					[2] = {dwItemEnum = 5809367,dwItemNumber = 2, dwBindType = 1},  --星灵
				    
				};
				return {PassMoney = 100000, Gold = 0, Zhenqi = 2500, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(8+ math.floor ( uLevel/10 )*0.2), itemTbl = itemTbl}
			end;
		end;
		itemTbl =
		{
			[1] = {dwItemEnum = 2500040,dwItemNumber = 3, dwBindType = 1},
			--[2] = {dwItemEnum = 4100070,dwItemNumber = 3, dwBindType = 1},
		},
		PassMoney = 0, Gold = 150, Zhenqi = 2000, Exp = 200000,
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1.5小时</font><br>您当前已使用:",
		dropItemTbl = {--------副本掉落显示
			[1] = {dwItemEnum = 5500450,dwItemNumber = 1, dwBindType = 0},
			[2] = {dwItemEnum = 5500430,dwItemNumber = 1, dwBindType = 0},
			[3] = {dwItemEnum = 5500390,dwItemNumber = 1, dwBindType = 0},
			[4] = {dwItemEnum = 5500400,dwItemNumber = 1, dwBindType = 0},
			[5] = {dwItemEnum = 5500420,dwItemNumber = 1, dwBindType = 0},
			[6] = {dwItemEnum = 5500410,dwItemNumber = 1, dwBindType = 0},
			[7] = {dwItemEnum = 5500440,dwItemNumber = 1, dwBindType = 0},
		},
		showEnterType = 2,--showEnterType:0单人，1多人，2单双人
		fbInfo = "1.辎重车若进入<font color='#008000'>蒙古军营</font>,将会消失 2.<font color='#008000'>其余势力</font>也看上了辎重<br>3.蒙古军需官在最后一波出现，请留心他带的军队",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>经验收益:<font color = '#00FF00'>@K</font></p><p>击败BOSS数:<font color = '#00FF00'>@J</font>/1</p><p>劫走辎重车:<font color='#cd0000'>@L</font>/68</p><p><font color = '#00FF00'>目标:劫走辎重,击败军需官</font></p><p>温馨提示:</p><p><font color = '#00FF00'>1.</font>护卫虽然不强,但是会使用许多控制技,请不要轻视</p><p><font color = '#00FF00'>2.</font>在劫车时请留心四周，其他势力很有可能也盯上了物资</p><p><font color = '#00FF00'>3.</font>蒙古军需官会在最后出现，请小心应对，他带了军队</p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1.5,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1.2},---单人难度
		[1] = {dwHPMax = 1.5,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1.2},---组队1人难度
		[2] = {dwHPMax = 1.5,dwMPMax = 1.1,dwAttack = 1.1,dwDefense = 1.1,dwFlee = 1.1,dwCrit = 1.1,dwExp = 1.3},---组队2人难度
		[3] = {dwHPMax = 1.5,dwMPMax = 1.2,dwAttack = 1.2,dwDefense = 1.2,dwFlee = 1.2,dwCrit = 1.2,dwExp = 1.4},---组队3人难度
		[4] = {dwHPMax = 1.5,dwMPMax = 1.3,dwAttack = 1.3,dwDefense = 1.3,dwFlee = 1.3,dwCrit = 1.3,dwExp = 1.5},---组队4人难度
		[5] = {dwHPMax = 1.5,dwMPMax = 1.4,dwAttack = 1.4,dwDefense = 1.4,dwFlee = 1.4,dwCrit = 1.4,dwExp = 1.5},---组队5人难度
		},
		msg = "请<font color = '#22AE02'>与NPC对话开始副本</font>,详情请点击查看<font color = '#22AE02'>“M”键</font>.",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		fbNamePng = "Fbnfhzl.png",
		dwShowJiFen = 0,
		--一键完成消耗元宝数
		CompleteDuplCost = 50;
		--一键完成奖励比例
		CompleteRate = 1;		
	};
	-----------------------------------------------------------------end----------------------------------------------------------------------
	-----------------------------------------------------演武节堂----------------------------------------------------------------
	[1009] =
	{
		dwID = 1009,
		dwPlayerCount = 5,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 30,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 90,
		dwEnterTimes = 1,
		dwOpenDay = {0,1,2,3,4,5,6},	--开放日期
		dwFbStartTime = "00:00",		--开启时间
		dwFbEndTime = "24:00",			--结束世界
		dwCloseFbTime = 60;
		dwDelFbTime = 5;   --多人本副本内没有5分钟后删除副本
		bInShow = 1;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =30;---副本排序
		--MapSet = {5071},
		MapSet = function()
			return {5071}, 5071;
		end,			
		--MapTransSet = {5060},
		--MapTransSet = {{5060, "aaaaaaaaa"}},
		EnterMapId = 5071,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "演武节堂",
		describe = "    严峻的训练是宋军兵营里的常态,前往宋军演武节堂与兵士们一起接受这种训练,必定能对自己的武艺有所提升.（通关演武节堂可获得大量经验）",
		types = "day",
		npcId = 10021099,
		exps = 3,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>1.通过凌教头对话,开启副本<br>2.击败所有士兵,副本即结束<br>3.BOSS在正中的武台上,请优先击败BOSS,避免不必要的损失！",
		fbNeed = "    <font color='#00FF00'>【副本内怪物经验是野外场景的<font color='#FF0000'>2倍</font>，建议使用<font color='#FF0000'>双倍经验丹</font>，副本BOSS会掉落<font color='#FF0000'>商城道具</font>和<font color='#FF0000'>技能书残卷</font>】</font><br>    <font color='#33A1C9'>严峻的训练是宋军兵营里的常态,前往宋军演武节堂与兵士们一起接受这种训练,必定能对自己的武艺有所提升。</font> ",
		img = "fb_ywjt.png",
		dwPng = "img://ffb_ywjt.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量金钱</font>",
		addTimes = 1;---使用道具可多进入X次
		fbItemProp = {[1] = {dwItemEnum = 5500260},[2] = {dwItemEnum = 5500080},},-----进入副本配置道具
		--itemTbl = -----副本通关奖励
		--{
			--[1] = {dwItemEnum = 2500040,dwItemNumber = 3, dwBindType = 1},
			--[2] = {dwItemEnum = 4100070,dwItemNumber = 3, dwBindType = 1},
		--},
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
				                [1] = {dwItemEnum = 2500040,dwItemNumber = 3, dwBindType = 1},	
			                    [2] = {dwItemEnum = 2500050,dwItemNumber = 3, dwBindType = 1},
								[3] = {dwItemEnum = 4100170,dwItemNumber = 3, dwBindType = 1}    --悟道残卷*3
								
				};
				return {PassMoney = 100000, Gold = 0, Zhenqi = 2500, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(5+ math.floor ( uLevel/10 )*0.1), itemTbl = itemTbl}
			end;
		end;
		--PassMoney = 0, Gold = 50, Zhenqi = 1000, Exp = 120000,
		failItemTbl =  -----副本失败奖励
		{
				--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		dropItemTbl = {--------副本掉落显示
			[1] = {dwItemEnum = 5500450,dwItemNumber = 1, dwBindType = 0},
			[2] = {dwItemEnum = 5500430,dwItemNumber = 1, dwBindType = 0},
			[3] = {dwItemEnum = 5500390,dwItemNumber = 1, dwBindType = 0},
			[4] = {dwItemEnum = 5500400,dwItemNumber = 1, dwBindType = 0},
			[5] = {dwItemEnum = 5500420,dwItemNumber = 1, dwBindType = 0},
			[6] = {dwItemEnum = 5500410,dwItemNumber = 1, dwBindType = 0},
			[7] = {dwItemEnum = 5500440,dwItemNumber = 1, dwBindType = 0},
		},
		showEnterType = 2,--showEnterType:0单人，1多人，2单双人

		fbInfo = "1.通过与凌教头对话,开启副本    2.击败所有士兵,<font color='#008000'>副本即结束</font><br>3.BOSS在正中的武台上,<font color='#008000'>请优先击败BOSS</font>,避免不必要的损失！",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>经验收益:<font color = '#00FF00'>@K</font></p><p>击败BOSS数:<font color = '#00FF00'>@J</font>/4</p><p>击杀小兵:<font color='#cd0000'>@I</font>/1043</p><p><font color = '#00FF00'>目标:打败所有士兵</font></p><p>温馨提示:</p><p><font color = '#00FF00'>1.</font>士兵总共分为8个等级段</p><p><font color = '#00FF00'>2.</font>BOSS在地图中间的台子上</p><p><font color = '#00FF00'>3.</font>击败所有士兵后,副本即结束,请优先打败BOSS,避免不必要损失</p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 2},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 2},---组队1人难度
		[2] = {dwHPMax = 1.1,dwMPMax = 1.1,dwAttack = 1.1,dwDefense = 1.1,dwFlee = 1.1,dwCrit = 1.1,dwExp = 2.1},---组队2人难度
		[3] = {dwHPMax = 1.2,dwMPMax = 1.2,dwAttack = 1.2,dwDefense = 1.2,dwFlee = 1.2,dwCrit = 1.2,dwExp = 2.2},---组队3人难度
		[4] = {dwHPMax = 1.3,dwMPMax = 1.3,dwAttack = 1.3,dwDefense = 1.3,dwFlee = 1.3,dwCrit = 1.3,dwExp = 2.3},---组队4人难度
		[5] = {dwHPMax = 1.4,dwMPMax = 1.4,dwAttack = 1.4,dwDefense = 1.4,dwFlee = 1.4,dwCrit = 1.4,dwExp = 2.4},---组队5人难度
		},
		msg = "请<font color = '#22AE02'>与NPC对话开始副本</font>,详情请点击查看<font color = '#22AE02'>“M”键</font>.<br>本副本怪物众多,建议使用双倍<font color = '#22AE02'>经验丹</font>与<font color = '#22AE02'>坐骑丹</font>",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		fbNamePng = "Fbnywjt.png",
		dwShowJiFen = 0,
		--一键完成消耗元宝数
		CompleteDuplCost = 50;
		--一键完成奖励比例
		CompleteRate = 1;
	};
	-----------------------------------------------------------------end----------------------------------------------------------------------
	-----------------------------------------------------守卫襄阳----------------------------------------------------------------
	[1010] =
	{
		dwID = 1010,
		dwPlayerCount = 5,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 55,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 90,
		dwEnterTimes = 1,
		dwOpenDay = {0,1,2,3,4,5,6},	--开放日期
		dwFbStartTime = "00:00",		--开启时间
		dwFbEndTime = "24:00",			--结束世界
		dwCloseFbTime = 60;
		dwDelFbTime = 5;   --多人本副本内没有5分钟后删除副本
		bInShow = 1;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 55;
		--MapSet = {5072},
		MapSet = function()
			return {5072}, 5072;
		end,		
		--MapTransSet = {5060},
		--MapTransSet = {{5060, "aaaaaaaaa"}},
		EnterMapId = 5072,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "守卫襄阳",
		describe = "    自大破联营之后,金蒙两国恼羞成怒,再次结成乌合,兵围野郊汉水大寨。汉水大寨与襄阳城唇亡齿寒,太守为鼓励兵士,亲自坐镇协防汉水大寨!",
		types = "day",
		npcId = 10021099,
		exps = 3,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br><font color='#E3170D'>进入限制：只支持单人进入</font>",
		fbNeed = "    <font color='#00FF00'>【守住襄阳城防止敌人侵入，怪物经验是野外场景<font color='#FF0000'>2倍</font>，建议使用<font color='#FF0000'>双倍经验丹</font>，通关后额外奖励<font color='#FF0000'>300礼金</font>】</font><br>    <font color='#33A1C9'>自大破联营之后,金蒙两国恼羞成怒,再次结成乌合,兵围野郊汉水大寨。汉水大寨与襄阳城唇亡齿寒,太守为鼓励兵士,亲自坐镇协防汉水大寨!</font>",
		img = "fb_swxy.png",
		dwPng = "img://ffb_swxy.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量经验</font>",
		addTimes = 1;---使用道具可多进入X次
		fbItemProp = {
			[1] = {dwItemEnum = 5500270},
			[2] = {dwItemEnum = 5500080},
		},
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
				    [1] = {dwItemEnum = 2500331,dwItemNumber = 3, dwBindType = 1},	--斩魄精元丹
					[2] = {dwItemEnum = 4100446,dwItemNumber = 2, dwBindType = 1},  --檀木托*2
				   
				};	
				return {PassMoney = 200000, Gold = 300, Zhenqi = 4000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(8.3+ math.floor ( uLevel/10 )*0.1), itemTbl = itemTbl}
			end;
		end;
		itemTbl =
		{
			[1] = {dwItemEnum = 2500040,dwItemNumber = 3, dwBindType = 1},
			--[2] = {dwItemEnum = 4100070,dwItemNumber = 3, dwBindType = 1},
		},
		PassMoney = 0, Gold = 100, Zhenqi = 1000, Exp = 2000000,
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		dropItemTbl = {--------副本掉落显示
			[1] = {dwItemEnum = 5500450,dwItemNumber = 1, dwBindType = 0},
			[2] = {dwItemEnum = 5500430,dwItemNumber = 1, dwBindType = 0},
			[3] = {dwItemEnum = 5500390,dwItemNumber = 1, dwBindType = 0},
			[4] = {dwItemEnum = 5500400,dwItemNumber = 1, dwBindType = 0},
			[5] = {dwItemEnum = 5500420,dwItemNumber = 1, dwBindType = 0},
			[6] = {dwItemEnum = 5500410,dwItemNumber = 1, dwBindType = 0},
			[7] = {dwItemEnum = 5500440,dwItemNumber = 1, dwBindType = 0},
		},
		showEnterType = 2,--showEnterType:0单人，1多人，2单双人
		fbInfo = "1.敌人会从四面八方入侵襄阳城，请阻挡他们<br>2.当100个敌人突入到襄阳城内时，防守失败",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>经验收益:<font color = '#00FF00'>@K</font></p><p>击败BOSS数:<font color = '#00FF00'>@J</font>/8</p><p>地图剩余敌人:<font color='#cd0000'>@A</font></p><p><font color = '#00FF00'>目标:击败所有敌人</font></p><p>温馨提示:</p><p><font color = '#00FF00'>1.</font>总共8波金军,每波又分12小波出现</p><p><font color = '#00FF00'>2.</font>每波的最后会刷出BOSS</p><p><font color = '#00FF00'>3.</font>每小波之间怪物会累加出现，请多用范围技能提高效率</p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1.5,dwMPMax = 1,dwAttack = 1.5,dwDefense = 1.2,dwFlee = 1,dwCrit = 1,dwExp = 2},---单人难度
		[1] = {dwHPMax = 1.5,dwMPMax = 1,dwAttack = 1.5,dwDefense = 1.2,dwFlee = 1,dwCrit = 1,dwExp = 2},---组队1人难度
		[2] = {dwHPMax = 1.7,dwMPMax = 1.1,dwAttack = 1.6,dwDefense = 1.3,dwFlee = 1.1,dwCrit = 1.1,dwExp = 2.2},---组队2人难度
		[3] = {dwHPMax = 1.9,dwMPMax = 1.2,dwAttack = 1.7,dwDefense = 1.4,dwFlee = 1.2,dwCrit = 1.2,dwExp = 2.4},---组队3人难度
		[4] = {dwHPMax = 2.1,dwMPMax = 1.3,dwAttack = 1.8,dwDefense = 1.5,dwFlee = 1.3,dwCrit = 1.3,dwExp = 2.6},---组队4人难度
		[5] = {dwHPMax = 2.3,dwMPMax = 1.4,dwAttack = 1.9,dwDefense = 1.6,dwFlee = 1.4,dwCrit = 1.4,dwExp = 2.8},---组队5人难度
		},
		msg = "请<font color = '#22AE02'>与NPC对话开始副本</font>,详情请点击查看<font color = '#22AE02'>“M”键</font>.<br>本副本怪物众多,建议使用双倍<font color = '#22AE02'>经验丹</font>与<font color = '#22AE02'>坐骑丹</font>",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		fbNamePng = "Fbnswxy.png",
		dwShowJiFen = 0;
		--一键完成消耗元宝数
		CompleteDuplCost = 50;
		--一键完成奖励比例
		CompleteRate = 1;		
	};
	-----------------------------------------------------------------end----------------------------------------------------------------------
	-----------------------------------------------------天罡北斗阵----------------------------------------------------------------
	[1011] =
	{
		dwID = 1011,
		dwPlayerCount = 5,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 65,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 90,
		dwEnterTimes = 1,
		dwOpenDay = {0,1,2,3,4,5,6},	--开放日期
		dwFbStartTime = "00:00",		--开启时间
		dwFbEndTime = "24:00",			--结束世界
		dwCloseFbTime = 65;
		dwDelFbTime = 5;   --多人本副本内没有5分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 65;
		--MapSet = {5073},
		MapSet = function()
			return {5073}, 5073;
		end,			
		--MapTransSet = {5060},
		--MapTransSet = {{5060, "aaaaaaaaa"}},
		EnterMapId = 5073,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "天罡北斗阵",
		describe = "自大破联营之后,金蒙两国恼羞成怒,再次结成乌合,兵围野郊汉水大寨.汉水大寨与襄阳城唇亡齿寒,太守为鼓励兵士,亲自坐镇协防汉水大寨!",
		types = "day",
		npcId = 10021099,
		exps = 3,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbInfo = "<font color='#00FF00'>副本开启后4个法阵依次激活，法阵激活状态下击败法阵内10个阵眼便可破阵，当4个法阵都被破除后赵志敬加入战局，否则副本结束，5分钟内无法击败赵志敬副本同样结束。</font>",
		fbNeed = "    <font color='#00FF00'>【副本开启后<font color='#FF0000'>4个法阵依次激活</font>，法阵<font color='#FF0000'>激活状态</font>下击败法阵内<font color='#FF0000'>10个阵眼</font>便可破阵，每1个法阵被破后会刷出BOSS ，4个法阵都被破时，则可以挑战<font color='#FF0000'>赵志敬</font>。通关后根据<font color='#FF0000'>积分多少奖励礼金</font>】</font><br><font color='#33A1C9'>    蒙古册封全真教不成便派大军围攻重阳宫，各路英雄豪杰得到消息后便欲上终南山支援全真教，赵志敬早已与蒙古勾结，群雄被天罡北斗阵围困。</font>",
		img = "fb_tgbdz.png",
		dwPng = "img://ffb_tgbdz.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量经验</font>",
		addTimes = 1;---使用道具可多进入X次
		fbItemProp = {
			[1] = {dwItemEnum = 5500270},
			[2] = {dwItemEnum = 5500080},
		},
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
			    {
				                -- [1] = {dwItemEnum = 4100140,dwItemNumber = 2, dwBindType = 1},
				                 --[2] = {dwItemEnum = 4100080,dwItemNumber = 2, dwBindType = 1}
				};	
				return {PassMoney = 0, Gold = 0, Zhenqi = 2000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp, itemTbl = itemTbl}
			end;
		end;
		--itemTbl =
		--{
			--[1] = {dwItemEnum = 2500040,dwItemNumber = 3, dwBindType = 1},
			--[2] = {dwItemEnum = 4100070,dwItemNumber = 3, dwBindType = 1},
		--},
		--PassMoney = 0, Gold = 0, Zhenqi = 0, Exp = 0,
		--failItemTbl =
		--{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		--},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		dropItemTbl = {--------副本掉落显示
			[1] = {dwItemEnum = 5500450,dwItemNumber = 1, dwBindType = 0},
			[2] = {dwItemEnum = 5500430,dwItemNumber = 1, dwBindType = 0},
			[3] = {dwItemEnum = 5500390,dwItemNumber = 1, dwBindType = 0},
			[4] = {dwItemEnum = 5500400,dwItemNumber = 1, dwBindType = 0},
			[5] = {dwItemEnum = 5500420,dwItemNumber = 1, dwBindType = 0},
			[6] = {dwItemEnum = 5500410,dwItemNumber = 1, dwBindType = 0},
			[7] = {dwItemEnum = 5500440,dwItemNumber = 1, dwBindType = 0},
		},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "<font color='#00FF00'>副本开启后4个法阵依次激活，法阵激活状态下击败法阵内10个阵眼便可破阵。当4个法阵都被破除后赵志敬加入战局，否则副本失败。副本开启25分钟后无法击败赵志敬则副本失败。</font>",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>经验收益:<font color = '#00FF00'>@K</font></p><p>击败BOSS数:<font color = '#00FF00'>@J</font>/8</p><p>地图剩余敌人:<font color='#cd0000'>@A</font></p><p><font color = '#00FF00'>目标:击败所有敌人</font></p><p>温馨提示:</p><p><font color = '#00FF00'>1.</font>总共8波金军,每波又分12小波出现</p><p><font color = '#00FF00'>2.</font>每波的最后会刷出BOSS</p><p><font color = '#00FF00'>3.</font>每小波之间怪物会累加出现，请多用范围技能提高效率</p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1.5,dwMPMax = 1,dwAttack = 1.5,dwDefense = 1.2,dwFlee = 1,dwCrit = 1,dwExp = 2},---单人难度
		[1] = {dwHPMax = 1.5,dwMPMax = 1,dwAttack = 1.5,dwDefense = 1.2,dwFlee = 1,dwCrit = 1,dwExp = 2},---组队1人难度
		[2] = {dwHPMax = 1.7,dwMPMax = 1.1,dwAttack = 1.6,dwDefense = 1.3,dwFlee = 1.1,dwCrit = 1.1,dwExp = 2.2},---组队2人难度
		[3] = {dwHPMax = 1.9,dwMPMax = 1.2,dwAttack = 1.7,dwDefense = 1.4,dwFlee = 1.2,dwCrit = 1.2,dwExp = 2.4},---组队3人难度
		[4] = {dwHPMax = 2.1,dwMPMax = 1.3,dwAttack = 1.8,dwDefense = 1.5,dwFlee = 1.3,dwCrit = 1.3,dwExp = 2.6},---组队4人难度
		[5] = {dwHPMax = 2.3,dwMPMax = 1.4,dwAttack = 1.9,dwDefense = 1.6,dwFlee = 1.4,dwCrit = 1.4,dwExp = 2.8},---组队5人难度
		},
		msg = "请<font color = '#22AE02'>与NPC对话开始副本</font>,详情请点击查看<font color = '#22AE02'>“M”键</font>.<br>本副本怪物众多,建议使用双倍<font color = '#22AE02'>经验丹</font>与<font color = '#22AE02'>坐骑丹</font>",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		fbNamePng = "Fbntgbdz.png",
		dwShowJiFen = 1;
	};
	-----------------------------------------------------------------end----------------------------------------------------------------------
	-----------------------------------------------------绮梦幽境----------------------------------------------------------------
	[1020] =
	{
		dwID = 1020,
		dwPlayerCount = 5,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 40,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 90,
		dwEnterTimes = 1,
		dwOpenDay = {0,1,2,3,4,5,6},	--开放日期
		dwFbStartTime = "00:00",		--开启时间
		dwFbEndTime = "24:00",			--结束世界
		dwCloseFbTime = 30;
		dwDelFbTime = 5;   --多人本副本内没有5分钟后删除副本
		bInShow = 1;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 40;
		--MapSet = {5020},
		MapSet = function()
			return {5020}, 5020;
		end,		
		--MapTransSet = {5060},
		--MapTransSet = {{5060, "aaaaaaaaa"}},
		EnterMapId = 5020,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "绮梦幽境",
		describe = "问世间情为何物，直教人生死相许。愿得一心人，白首不相离。绮梦幽境专为有情人而设，唯有经历过患难的感情，才会更加深沉，久而弥坚。不妨邀爱侣一起，进入绮梦幽境，俱怀灵犀一点，且试心意相通。",
		types = "day",
		npcId = 10021099,
		exps = 3,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br><font color='#E3170D'>进入限制：只支持单人进入</font>",
		fbNeed = "    <font color='#00FF00'>【绮梦幽境是只有<font color='#FF0000'>夫妻才能进入</font>的圣地】</font><br><font color='#33A1C9'>    问世间情为何物，直教人生死相许。愿得一心人，白首不相离。绮梦幽境专为有情人而设，唯有经历过患难的感情，才会更加深沉，久而弥坚。不妨邀爱侣一起，进入绮梦幽境，俱怀灵犀一点，且试心意相通。</font>",
		img = "fb_qmyj.png",
		dwPng = "img://ffb_qmyj.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量经验</font>",
		addTimes = 1;---使用道具可多进入X次
		fbItemProp = {
			[1] = {dwItemEnum = 5500270},
			[2] = {dwItemEnum = 5500080},
		},
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
				                [1] = {dwItemEnum = 4100140,dwItemNumber = 5, dwBindType = 1},	--强化石
			                    [2] = {dwItemEnum = 4100410,dwItemNumber = 3, dwBindType = 1},	--古书注解
								[3] = {dwItemEnum = 4100450,dwItemNumber = 2, dwBindType = 1},   --侠客秘传*3
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 2500, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(4+ math.floor ( uLevel/10 )*0.1), itemTbl = itemTbl}
			end;
		end;
		itemTbl =
		{
			[1] = {dwItemEnum = 2500040,dwItemNumber = 3, dwBindType = 1},
			--[2] = {dwItemEnum = 4100070,dwItemNumber = 3, dwBindType = 1},
		},
		PassMoney = 0, Gold = 0, Zhenqi = 0, Exp = 0,
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>30分钟</font><br>您当前已使用:",
		dropItemTbl = {--------副本掉落显示
			[1] = {dwItemEnum = 5500450,dwItemNumber = 1, dwBindType = 0},
			[2] = {dwItemEnum = 5500430,dwItemNumber = 1, dwBindType = 0},
			[3] = {dwItemEnum = 5500390,dwItemNumber = 1, dwBindType = 0},
			[4] = {dwItemEnum = 5500400,dwItemNumber = 1, dwBindType = 0},
			[5] = {dwItemEnum = 5500420,dwItemNumber = 1, dwBindType = 0},
			[6] = {dwItemEnum = 5500410,dwItemNumber = 1, dwBindType = 0},
			[7] = {dwItemEnum = 5500440,dwItemNumber = 1, dwBindType = 0},
		},
		showEnterType = 3,--showEnterType:0单人，1多人，2单双人，3夫妻
		fbInfo = "玩法介绍：<br>1.地图<font color = '#00FF00'>两侧</font>分别有<font color = '#00FF00'>数字1-9的箱子</font>,夫妻双方各自选择一侧<br>2.需要找到<font color = '#00FF00'>相同数字的宝箱开启</font>,需要共同开启达到<font color = '#00FF00'> 5 </font>次",
		--fbInfo1 ="<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>经验收益:<font color = '#00FF00'>@K</font></p><p>击败BOSS数:<font color = '#00FF00'>@J</font>/8</p><p>地图剩余敌人:<font color='#cd0000'>@A</font></p><p><font color = '#00FF00'>目标:击败所有敌人</font></p><p>温馨提示:</p><p><font color = '#00FF00'>1.</font>总共8波金军,每波又分12小波出现</p><p><font color = '#00FF00'>2.</font>每波的最后会刷出BOSS</p><p><font color = '#00FF00'>3.</font>每小波之间怪物会累加出现，请多用范围技能提高效率</p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1.5,dwDefense = 1.2,dwFlee = 1,dwCrit = 1,dwExp = 2},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1.5,dwDefense = 1.2,dwFlee = 1,dwCrit = 1,dwExp = 2},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 2.2},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1.2,dwAttack = 1.7,dwDefense = 1.4,dwFlee = 1.2,dwCrit = 1.2,dwExp = 2.4},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1.3,dwAttack = 1.8,dwDefense = 1.5,dwFlee = 1.3,dwCrit = 1.3,dwExp = 2.6},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1.4,dwAttack = 1.9,dwDefense = 1.6,dwFlee = 1.4,dwCrit = 1.4,dwExp = 2.8},---组队5人难度
		},
		--msg = "请<font color = '#22AE02'>与NPC对话开始副本</font>,详情请点击查看<font color = '#22AE02'>“M”键</font>.<br>本副本怪物众多,建议使用双倍<font color = '#22AE02'>经验丹</font>与<font color = '#22AE02'>坐骑丹</font>",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		fbNamePng = "empty.png",
		dwShowJiFen = 0;
		--一键完成消耗元宝数
		CompleteDuplCost = 50;
		--一键完成奖励比例
		CompleteRate = 1;		
	};
	-----------------------------------------------------------------end----------------------------------------------------------------------

--------------------------------------------------群侠副本------------------------------------------------------------------------------
	[6001] =
	{
		dwID = 6001,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6001,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					--[1] = {dwItemEnum = 20002007,dwItemNumber = 1, dwBindType = 1},	
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			--[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			-- [1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
			-- [2] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
			-- [3] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
			-- [4] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		-- dropItemTbl = {--------副本掉落显示
			-- [1] = {dwItemEnum = 5500450,dwItemNumber = 1, dwBindType = 0},
			-- [2] = {dwItemEnum = 5500430,dwItemNumber = 1, dwBindType = 0},
			-- [3] = {dwItemEnum = 5500390,dwItemNumber = 1, dwBindType = 0},
			-- [4] = {dwItemEnum = 5500400,dwItemNumber = 1, dwBindType = 0},
			-- [5] = {dwItemEnum = 5500420,dwItemNumber = 1, dwBindType = 0},
			-- [6] = {dwItemEnum = 5500410,dwItemNumber = 1, dwBindType = 0},
			-- [7] = {dwItemEnum = 5500440,dwItemNumber = 1, dwBindType = 0},
		-- },		
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
	
	[6002] =
	{
		dwID = 6002,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6002},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6002,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本02",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本02</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本02</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					--[1] = {dwItemEnum = 40002,dwItemNumber = 1, dwBindType = 1},	
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			--[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
	
	[6003] =
	{
		dwID = 6003,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6003},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 )
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6003,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本03",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本03</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本03</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					--[1] = {dwItemEnum = 40002,dwItemNumber = 1, dwBindType = 1},	
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			--[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};

	[6004] =
	{
		dwID = 6004,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6004},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6004,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本04",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本04</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本04</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					--[1] = {dwItemEnum = 40002,dwItemNumber = 1, dwBindType = 1},	
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			--[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
	
	[6005] =
	{
		dwID = 6005,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6005},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6005,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本05",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本05</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本05</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					--[1] = {dwItemEnum = 40002,dwItemNumber = 1, dwBindType = 1},	
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			--[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};
	

	[6006] =
	{
		dwID = 6006,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6006},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6006,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本06",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本06</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本06</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	
	
	[6007] =
	{
		dwID = 6007,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6007},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6007,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本07",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本07</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本07</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};		

	[6008] =
	{
		dwID = 6008,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6008},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6008,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本08",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本08</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本08</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	
	[6009] =
	{
		dwID = 6009,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6009},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6009,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本09",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本09</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本09</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	
	[6010] =
	{
		dwID = 6010,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 60;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6010},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本10",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本10</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本10</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	
	[6011] =
	{
		dwID = 6011,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本11</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本11</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本11</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6012] =
	{
		dwID = 6012,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6013] =
	{
		dwID = 60113,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;		
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6014] =
	{
		dwID = 6014,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6015] =
	{
		dwID = 6015,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6016] =
	{
		dwID = 6016,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6017] =
	{
		dwID = 6017,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6018] =
	{
		dwID = 6018,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6019] =
	{
		dwID = 6019,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6020] =
	{
		dwID = 6020,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6021] =
	{
		dwID = 6021,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6022] =
	{
		dwID = 6022,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6023] =
	{
		dwID = 6023,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6024] =
	{
		dwID = 6024,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6025] =
	{
		dwID = 6025,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6026] =
	{
		dwID = 6026,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6027] =
	{
		dwID = 6027,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6028] =
	{
		dwID = 6028,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	[6029] =
	{
		dwID = 6029,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 1,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 30;
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 0;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder =11;
		--MapSet = {6001},
		MapSet = function()
			local dwRandSce = math.random( 6001,6010 );
			return {dwRandSce}, dwRandSce;
		end,		
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 6010 ,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = 0,--传出副本的地图posx
		Posy = 20.01,--传出副本的地图posy
		fbname = "群侠挑战",
		describe = "群侠副本01",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>群侠副本01</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>群侠副本01</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>群侠副本01</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "<p>用时:@C:@D:@E  时限:<font color = '#FF0000'>@F:@G:@H</font></p><p>1.打开技能界面(K)，学习技能</p><p>2.用左键将技能拖拽到快捷栏</p><p>3.点击快捷栏中对应键盘的数字</p><p><font color='#cd0000'>(若已经学习，则直接按数字键)</font></p><p>4.施放技能击败路雯</p><p><font color = '#00FF00'>目标:击败路雯 @J/1</font></p>",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>从路雯那学会如何战斗</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	
	
	
	-------------------------------------------------------------卧虎藏龙------------------------------------------------
	[1013] =
	{
		dwID = 1013,
		dwPlayerCount = 2,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 70,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 60,	--通关副本后x秒踢出副本
		dwEnterTimes = 1,		--进入副本次数
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 10;	--影响闯关倒计时（分）
		dwDelFbTime = 0;   --多人本副本内没有x秒后删除副本
		bInShow = 1;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		dwShowOrder = 70;
		--MapSet = {5075},
		MapSet = function()
			return {5075}, 5075;
		end,			
		EnterMapId = 5075,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "卧虎藏龙",
		describe = "    挑战Boss，突破自我，是成为大侠的唯一途径。",
		types = "day",
		npcId = 10021099,
		exps = 3,---活动界面要用到
		money = 1,---活动界面要用到
		equipLevel = 2,---活动界面要用到
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>与玉娇龙对话，选择模式开启副本",
		fbNeed = "    <font color='#00FF00'>副本分2种模式：车轮战模式与大乱斗模式。选择模式后即可开启副本，击杀Boss可获得<font color='#FF0000'>银两</font>，通关副本更可获得<font color='#FF0000'>大量银两</font>。</font><br>    <font color='#33A1C9'>卧虎藏龙副本需组队前往，单人可创建队伍进入，副本限制最多2人。</font>",
		img = "fb_whcl.png",
		dwPng = "img://ffb_whcl.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量银两</font>",
		addTimes = 0;---使用道具可多进入X次
		--副本道具
		fbItemProp = {
			[1] = {dwItemEnum = 5500200},
			[2] = {dwItemEnum = 5500080},
		},
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
				    [1] = {dwItemEnum = 5501190,dwItemNumber = 2, dwBindType = 1},	--百变丹
				    [2] = {dwItemEnum = 9405011,dwItemNumber = 2, dwBindType = 1},	--龙池甘露
				    [3] = {dwItemEnum = 4100514,dwItemNumber = 1, dwBindType = 1},	--修炼丹
				};
				return {PassMoney = 300000, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(4.5+ math.floor ( uLevel/10 )*0.1), itemTbl = itemTbl}
			end;
		end;
		itemTbl =
		{
			--[1] = {dwItemEnum = 4100140,dwItemNumber = 8, dwBindType = 1},
			--[2] = {dwItemEnum = 2500080,dwItemNumber = 1, dwBindType = 1},
		},
		PassMoney = 0, Gold = 0, Zhenqi = 1500, Exp = 3000000,
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>10分钟</font><br>您当前已使用:",
		--dropItemTbl = {
		--	[1] = {dwItemEnum = 4100140,dwItemNumber = 8, dwBindType = 1},
		--	[2] = {dwItemEnum = 2500080,dwItemNumber = 1, dwBindType = 1},
		--	[3] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		--	[4] = {dwItemEnum = 5500200,dwItemNumber = 1, dwBindType = 1},
		--	[5] = {dwItemEnum = 5500080,dwItemNumber = 1, dwBindType = 1},
		--},
		showEnterType = 1,--showEnterType:0单人，1多人，2单双人 

		fbInfo = "卧虎藏龙共2种模式：<br>车轮战——共10关，每关Boss被击败后可选择是否继续挑战；闯关时限为10分钟；闯过关数越多，可获收益越大。<br>大乱斗——每隔若干时间将有一位Boss加入战斗；闯关时限为10分钟；击败Boss越多，可获收益越大。",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 2,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 2,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		msg = "副本内卧虎藏龙，玩家需步步小心。",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		fbNamePng = "Fbnwhcl.png",
		dwShowJiFen = 0,
		--一键完成消耗元宝数
		--CompleteDuplCost = 50;
		--一键完成奖励比例
		--CompleteRate = 1;
		SetOpenTime = 1;	--设置进入后不显示倒计时，填1
	};
	
	--------------------------------------------------------新珍珑棋局----------------------------------------------------------------
	[1014] =
	{
		dwID = 1014,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 35,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 90,
		dwEnterTimes = 99999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 20*60;
		dwDelFbTime = 0;   --多人本副本内没有5分钟后删除副本
		bInShow = 2;---是否剧情副本，是否显示在入口界面   0不显示，1显示，2为珍珑棋局
		dwShowOrder = 40;
		--MapSet = {5030},
		MapSet = function()
			return {5030}, 5030;
		end,
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5030,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "新珍珑棋局",
		describe = "    <font color='#00FF00'>【玩家<font color='#FF0000'>单人</font>挑战珍珑棋局中的BOSS，进入次数不限，每天重置挑战次数】</font><br>    <font color='#33A1C9'>棋痴老先生用尽其毕生精力研究参透的珍珑棋局,据说棋局中包含十几种棋势与变化,甚多武林侠士前往对弈皆败下阵来。而通关者无一不成为武林名士、武林宗主。</font>",
		types = "day",
		npcId = 10021099,
		exps = 2,
		money = 1,
		equipLevel = 3,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>1.与棋痴对话启动棋局<br>2.在这里您将面对不同的英雄人物,请小心应付",
		fbNeed = "    <font color='#33A1C9'>棋痴老先生用尽其毕生精力研究参透的珍珑棋局,据说棋局中包含十几种棋势与变化,甚多武林侠士前往对弈皆败下阵来。而通关者无一不成为武林名士、武林宗主。</font>",
		img = "fb_zlqj.png",
		dwPng = "img://ffb_zlqj.png",
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>全天</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>海量经验</font>",
		addTimes = 0;---使用道具可多进入X次
		fbItemProp = {
			-- [1] = {dwItemEnum = 5500210},
			-- [2] = {dwItemEnum = 5500080},
		},
		JiangLi	= function (uLevel)
		end;
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		-- ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		-- ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		dropItemTbl = {--------副本掉落显示
			-- [1] = {dwItemEnum = 5500570,dwItemNumber = 1, dwBindType = 0},
			-- [2] = {dwItemEnum = 5500390,dwItemNumber = 1, dwBindType = 0},
			-- [3] = {dwItemEnum = 5500561,dwItemNumber = 1, dwBindType = 0},
			-- [4] = {dwItemEnum = 4901000,dwItemNumber = 1, dwBindType = 0},
			-- [5] = {dwItemEnum = 5500400,dwItemNumber = 1, dwBindType = 0},
			-- [6] = {dwItemEnum = 5500590,dwItemNumber = 1, dwBindType = 0},
			},
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "1、点击npc选择想要挑战的Boss。<br>2、每个Boss每天可免费挑战<font color='#FF0000'>1次</font>，每天共有<font color='#FF0000'>10次</font>挑战Boss的机会，需慎重选择。",
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1.2},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1.2},---组队1人难度
		[2] = {dwHPMax = 1.1,dwMPMax = 1.1,dwAttack = 1.1,dwDefense = 1.1,dwFlee = 1.1,dwCrit = 1.1,dwExp = 1.3},---组队2人难度
		[3] = {dwHPMax = 1.2,dwMPMax = 1.2,dwAttack = 1.2,dwDefense = 1.2,dwFlee = 1.2,dwCrit = 1.2,dwExp = 1.4},---组队3人难度
		[4] = {dwHPMax = 1.3,dwMPMax = 1.3,dwAttack = 1.3,dwDefense = 1.3,dwFlee = 1.3,dwCrit = 1.3,dwExp = 1.5},---组队4人难度
		[5] = {dwHPMax = 1.4,dwMPMax = 1.4,dwAttack = 1.4,dwDefense = 1.4,dwFlee = 1.4,dwCrit = 1.4,dwExp = 1.5},---组队5人难度
		},
		--第一次进入副本的提示信息
		msg = "棋局之内变换莫测，一步错则步步错！",
		Info02Icon = "gth_1.png",  ----副本提示信息图片配置
		fbNamePng = "Fbnzlqj.png",
		dwShowJiFen = 0,
		SetOpenTime = 1;
	};
	
	--------------------------------------------------------通天塔----------------------------------------------------------------

	[1015] =
	{
		dwID = 1015,
		dwPlayerCount = 1,
		--dwPlayerLevel = 1,--代表副本进入的最小等级。
		dwPlayerMinLevel = 35,--代表副本进入的最小等级。
		dwPlayerMaxLevel = 999,   --代表副本进入的最大等级
		dwCountDownTime = 30,
		dwEnterTimes = 99999,
		dwOpenDay = {0,1,2,3,4,5,6},
		dwFbStartTime = "00:00",
		dwFbEndTime = "24:00",
		dwCloseFbTime = 1440;		-- 一天
		dwDelFbTime = 0;   --多人本副本内没有X分钟后删除副本
		bInShow = 1;---是否剧情副本，是否显示在入口界面   0不显示，1显示
		bInList = true; --标志位 true 没有放在普通列表中 false 放在
		dwShowOrder =11;
		MapSet = function(nLayer)
			local tMap = {5040,5041,5042,5043,5044,5045,5046,5047,5048};
			return tMap, tMap[nLayer];
		end,			
		--MapTransSet = {{5030, "aaaaaaaaa"}},
		EnterMapId = 5040,
		ReliveMapId = 1002,  --传出副本的地图id
		Posx = -3.07,--传出副本的地图posx
		Posy = 19.67,--传出副本的地图posy
		fbname = "通天塔",
		describe = "王斌2222222",
		types = "day",
		npcId = -1,
		exps = 1,
		money = 1,
		equipLevel = 1,
		expTbl = {[1] = 9000560001, [2] = 9000560002, [3] = 9000560003, },moneyTbl = {[1] = 9000560004, [2] = 9000560005, [3] = 9000560006, },equipTbl = {[1] = 9000560007,[2] = 9000560008, [3] = 9000560009,},
		fbIntro = "<font color='#00FF00'>进入时间：全天</font><br>",
		fbNeed = "<font color='#33A1C9'>王斌2222222</font>",
		img = "fb_zlqj.png",
		dwPng = "";
		--副本开放时间
		fbOpenTime = "<font color='#00FF00'>王斌2222222</font>";
		--副本奖励类型
		fbAwardType = "<font color='#CA9754'>王斌2222222</font>",
		addTimes = 0;---使用道具可多进入X次
		JiangLi	= function (uLevel)
			if uLevel > 20 then
				local itemTbl =
				{
					[1] = {dwItemEnum = 4100120,dwItemNumber = 1, dwBindType = 1},	
					[2] = {dwItemEnum = 4100140,dwItemNumber = 3, dwBindType = 1}
				};
				return {PassMoney = 0, Gold = 0, Zhenqi = 5000, Exp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*1.5, itemTbl = itemTbl}
			end;
		end;			
		fbItemProp =
		{
			[2] = {dwItemEnum = 5500080},
		},
		itemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		failItemTbl =
		{
			--[1] = {dwItemEnum = 5500070,dwItemNumber = 1, dwBindType = 1},
		},
		ToolTips1 = "玩家最快通关时间:<br><font color='#DE6363'>%s</font> 记录:",
		ToolTips2 = "该副本的时间上限:<font color='#DE6363'>1小时</font><br>您当前已使用:",
		showEnterType = 0,--showEnterType:0单人，1多人，2单双人
		fbInfo = "",
		--fbInfo1 = "王斌2222222",
		--副本难度系数
		fbDifficity =
		{--dwHPMax生命 dwMPMax内力 dwAttack攻击 dwDefense防御 dwFlee身法 dwCrit暴击 dwDefaultSpeed移动速度 dwExp经验
		[0] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---单人难度
		[1] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队1人难度
		[2] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队2人难度
		[3] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队3人难度
		[4] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队4人难度
		[5] = {dwHPMax = 1,dwMPMax = 1,dwAttack = 1,dwDefense = 1,dwFlee = 1,dwCrit = 1,dwExp = 1},---组队5人难度
		},
		--msg = "<font color = '#22AE02'>王斌2222222</font>",
		Info02Icon = "999_1.png",  ----副本提示信息图片配置
		dwShowJiFen = 0;
	};	
	-----------------------------------------------------end-------------------------------------------------------------------
}
------------------------------------------------------------------------------------------------------------------

--1001副本
local objDupl = DuplConfig[1001];
function objDupl:CreateEvent(objPlayer)--创建判断
	return true;
end;

function objDupl:EnterEvent(objPlayer)--进入判断,如果可以进入
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1002副本
local objDupl = DuplConfig[1002];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1079副本
local objDupl = DuplConfig[1079];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1080副本
local objDupl = DuplConfig[1080];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1081副本
local objDupl = DuplConfig[1081];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1082副本
local objDupl = DuplConfig[1082];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1083副本
local objDupl = DuplConfig[1083];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1084副本
local objDupl = DuplConfig[1084];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1085副本
local objDupl = DuplConfig[1085];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1086副本
local objDupl = DuplConfig[1086];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1087副本
local objDupl = DuplConfig[1087];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1088副本
local objDupl = DuplConfig[1088];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1089副本
local objDupl = DuplConfig[1089];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1090副本
local objDupl = DuplConfig[1090];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1091副本
local objDupl = DuplConfig[1091];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1092副本
local objDupl = DuplConfig[1092];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
-- --1093副本
-- local objDupl = DuplConfig[1093];
-- function objDupl:CreateEvent(objPlayer)--执行
	-- return true;
-- end;

-- function objDupl:EnterEvent(objPlayer)--执行
	-- return true;
-- end;
-- ------------------------------------------------------------------------------------------------------------------
-- --1094副本
-- local objDupl = DuplConfig[1094];
-- function objDupl:CreateEvent(objPlayer)--执行
	-- return true;
-- end;

-- function objDupl:EnterEvent(objPlayer)--执行
	-- return true;
-- end;
------------------------------------------------------------------------------------------------------------------
-- --1095副本
-- local objDupl = DuplConfig[1095];
-- function objDupl:CreateEvent(objPlayer)--执行
	-- return true;
-- end;

-- function objDupl:EnterEvent(objPlayer)--执行
	-- return true;
-- end;
------------------------------------------------------------------------------------------------------------------
-- --1096副本
-- local objDupl = DuplConfig[1096];
-- function objDupl:CreateEvent(objPlayer)--执行
	-- return true;
-- end;

-- function objDupl:EnterEvent(objPlayer)--执行
	-- return true;
-- end;
------------------------------------------------------------------------------------------------------------------
--1097副本
local objDupl = DuplConfig[1097];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1098副本
local objDupl = DuplConfig[1098];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1099副本
local objDupl = DuplConfig[1099];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1100副本
local objDupl = DuplConfig[1100];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1101副本
local objDupl = DuplConfig[1101];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1104副本
local objDupl = DuplConfig[1104];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1108副本
local objDupl = DuplConfig[1108];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1110副本
local objDupl = DuplConfig[1110];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1111副本
local objDupl = DuplConfig[1111];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1117副本
local objDupl = DuplConfig[1117];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1118副本
local objDupl = DuplConfig[1118];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1119副本
local objDupl = DuplConfig[1119];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1120副本
local objDupl = DuplConfig[1120];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
-----★★★★★★★★★★★-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--1003-大破金营副本
local objDupl = DuplConfig[1003];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1004-珍珑棋局
local objDupl = DuplConfig[1004];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;

function objDupl:RefreshMonster(objPlayer,waveId)
	local sysMap = objPlayer:GetSystem("CMapSystem")	----地图系统
	local sysScript = objPlayer:GetSystem("CScriptSystem");
	local duplSystem = objPlayer:GetSystem("CDuplSystem");
	local Map = sysMap:GetCurMap()				----获取玩家所在地图
	local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
	local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
	local dwLevelt = sysScript:GetDuplLevel() ---获得创建副本的等级

	if waveId == 1 then
		mgrNpc:Story(100)
		sysScript:Story(5005001)
		mgrMonster:DelayAdd(50302080,50302080,50302080,(100000+(math.floor(dwLevelt/5)*5)),82020,-21.28,-19.58,nil,1300)
		mgrMonster:DelayAdd(50302002,50302002,50302002,(100000+(math.floor(dwLevelt/5)*5)),82010,-20.68,-22.40,nil,1400)
		mgrMonster:DelayAdd(50302080,50302080,50302080,(100000+(math.floor(dwLevelt/5)*5)),82020,-17.48,-22.83,nil,1500)

		local D1 = function()
			if Map.sxpd01 ~= 3 then
				Map.sxpd01 = (Map.sxpd01 or 0) + 1
				mgrMonster:Add(50302001,50302001,50302001,50302001,100320060,-19.28,-20.86)		--金军头领
			end
		end
		CTimer:AddTimer( 35000, false, D1, {} )

	elseif waveId == 2 then
		mgrNpc:Story(104)
		sysScript:Story(5005002)
		sysScript:DelItem(4100010,1)
		mgrMonster:DelayAdd(50302008,50302008,50302008,(100000+(math.floor(dwLevelt/5)*5)),82010,-19.92,-21.64,nil,1000)
		mgrMonster:DelayAdd(50302084,50302084,50302084,(100000+(math.floor(dwLevelt/5)*5)),82020,-20.30,-25.96,nil,1400)
		mgrMonster:DelayAdd(50302008,50302008,50302008,(100000+(math.floor(dwLevelt/5)*5)),82010,-22.35,-24.01,nil,1500)
		mgrMonster:DelayAdd(50302084,50302084,50302084,(100000+(math.floor(dwLevelt/5)*5)),82020,-24.19,-21.93,nil,1600)

		local D2 = function()
			if Map.sxpd02 ~= 4 then
				Map.sxpd02 = (Map.sxpd02 or 0) + 1
				mgrMonster:Add(50302007,50302007,50302007,50302007,503020070,-19.28,-20.86)		--蚩萝伊
			end
		end
		CTimer:AddTimer( 35000, false, D2, {} )

	elseif waveId == 3 then
		mgrNpc:Story(108)
		sysScript:Story(5005001)
		sysScript:DelItem(4100010,1)
		mgrMonster:DelayAdd(50302014,50302014,50302014,(100000+(math.floor(dwLevelt/5)*5)),82010,-22.75,-18.28,nil,1160)
		mgrMonster:DelayAdd(50302014,50302014,50302014,(100000+(math.floor(dwLevelt/5)*5)),82010,-22.68,-20.79,nil,1200)
		mgrMonster:DelayAdd(50302016,50302016,50302016,(100000+(math.floor(dwLevelt/5)*5)),82020,-19.28,-24.41,nil,1220)
		mgrMonster:DelayAdd(50302016,50302016,50302016,(100000+(math.floor(dwLevelt/5)*5)),82020,-16.45,-24.35,nil,1260)

		local D3 = function()
			if Map.sxpd03 ~= 4 then
				Map.sxpd03 = (Map.sxpd03 or 0) + 1
				mgrMonster:Add(50302013,50302013,50302013,50302013,503020130,-19.28,-20.86)		--潇湘子
			end
		end
		CTimer:AddTimer( 35000, false, D3, {} )

	elseif waveId == 4 then
		mgrNpc:Story(102)
		sysScript:Story(5005003)
		sysScript:DelItem(4100010,1)
		mgrMonster:DelayAdd(50302082,50302082,50302082,(100000+(math.floor(dwLevelt/5)*5)),82010,-17.30,-24.31,nil,800)
		mgrMonster:DelayAdd(50302082,50302082,50302082,(100000+(math.floor(dwLevelt/5)*5)),82010,-20.09,-24.37,nil,900)
		mgrMonster:DelayAdd(50302082,50302082,50302082,(100000+(math.floor(dwLevelt/5)*5)),82010,-23.88,-19.98,nil,1500)
		mgrMonster:DelayAdd(50302005,50302005,50302005,(100000+(math.floor(dwLevelt/5)*5)),82020,-23.90,-23.53,nil,1560)
		mgrMonster:DelayAdd(50302005,50302005,50302005,(100000+(math.floor(dwLevelt/5)*5)),82020,-23.67,-27.04,nil,1620)

		local D4 = function()
			if Map.sxpd04 ~= 5 then
				Map.sxpd04 = (Map.sxpd04 or 0) + 1
				mgrMonster:Add(50302004,50302004,50302004,50302004,100920060,-19.28,-20.86)		--霍都
			end
		end
		CTimer:AddTimer( 35000, false, D4, {} )

	elseif waveId == 5 then
		if not sysScript:DelItem(4100010,2) then
			duplSystem:NoticeMsg(SysStringConfigInfo[9000660157])
			return;
		end;
		mgrNpc:Story(124)
		sysScript:Story(5005001)
		mgrMonster:DelayAdd(50302054,50302054,50302054,(100000+(math.floor(dwLevelt/5)*5)),82010,-17.70,-24.50,nil,750)
		mgrMonster:DelayAdd(50302054,50302054,50302054,(100000+(math.floor(dwLevelt/5)*5)),82010,-20.21,-21.83,nil,800)
		mgrMonster:DelayAdd(50302054,50302054,50302054,(100000+(math.floor(dwLevelt/5)*5)),82010,-22.55,-19.67,nil,850)
		mgrMonster:DelayAdd(50302056,50302056,50302056,(100000+(math.floor(dwLevelt/5)*5)),82020,-24.08,-21.39,nil,1200)
		mgrMonster:DelayAdd(50302056,50302056,50302056,(100000+(math.floor(dwLevelt/5)*5)),82020,-21.88,-23.46,nil,1250)
		mgrMonster:DelayAdd(50302056,50302056,50302056,(100000+(math.floor(dwLevelt/5)*5)),82020,-19.07,-26.11,nil,1300)

		local D5 = function()
			if Map.sxpd05 ~= 6 then
				Map.sxpd05 = (Map.sxpd05 or 0) + 1
				mgrMonster:Add(50302053,50302053,50302053,50302053,100410031,-19.28,-20.86)		--柯镇恶
			end
		end
		CTimer:AddTimer( 35000, false, D5, {} )

	elseif waveId == 6 then
		if not sysScript:DelItem(4100010,2) then
			duplSystem:NoticeMsg(SysStringConfigInfo[9000660157])
			return;
		end;
		mgrNpc:Story(112)
		sysScript:Story(5005003)
		mgrMonster:DelayAdd(50302024,50302024,50302024,(100000+(math.floor(dwLevelt/5)*5)),82010,-17.64,-24.30,nil,800)
		mgrMonster:DelayAdd(50302024,50302024,50302024,(100000+(math.floor(dwLevelt/5)*5)),82010,-23.22,-19.61,nil,900)
		mgrMonster:DelayAdd(50302024,50302024,50302024,(100000+(math.floor(dwLevelt/5)*5)),82010,-27.33,-21.14,nil,1500)
		mgrMonster:DelayAdd(50302026,50302026,50302026,(100000+(math.floor(dwLevelt/5)*5)),82020,-24.52,-23.43,nil,1550)
		mgrMonster:DelayAdd(50302026,50302026,50302026,(100000+(math.floor(dwLevelt/5)*5)),82020,-21.64,-25.85,nil,1600)
		mgrMonster:DelayAdd(50302026,50302026,50302026,(100000+(math.floor(dwLevelt/5)*5)),82020,-18.60,-28.47,nil,1650)
		
		local D6 = function()
			if Map.sxpd06 ~= 6 then
				Map.sxpd06 = (Map.sxpd06 or 0) + 1
				mgrMonster:Add(50302023,50302023,50302023,50302023,101120060,-19.28,-20.86)		--天元
			end
		end
		CTimer:AddTimer( 35000, false, D6, {} )
		
	elseif waveId == 7 then
		if not sysScript:DelItem(4100010,2) then
			duplSystem:NoticeMsg(SysStringConfigInfo[9000660157])
			return;
		end;
		mgrNpc:Story(106)
		sysScript:Story(5005002)
		mgrMonster:DelayAdd(50302086,50302086,50302086,(100000+(math.floor(dwLevelt/5)*5)),82010,-20.80,-22.48,nil,900)
		mgrMonster:DelayAdd(50302086,50302086,50302086,(100000+(math.floor(dwLevelt/5)*5)),82010,-24.84,-26.58,nil,1050)
		mgrMonster:DelayAdd(50302086,50302086,50302086,(100000+(math.floor(dwLevelt/5)*5)),82010,-19.17,-27.91,nil,1500)
		mgrMonster:DelayAdd(50302011,50302011,50302011,(100000+(math.floor(dwLevelt/5)*5)),82020,-20.85,-26.24,nil,1550)
		mgrMonster:DelayAdd(50302011,50302011,50302011,(100000+(math.floor(dwLevelt/5)*5)),82020,-22.76,-24.44,nil,1600)
		mgrMonster:DelayAdd(50302011,50302011,50302011,(100000+(math.floor(dwLevelt/5)*5)),82020,-24.92,-22.62,nil,1650)
		mgrMonster:DelayAdd(50302086,50302086,50302086,(100000+(math.floor(dwLevelt/5)*5)),82010,-26.52,-20.92,nil,1700)
		
		local D7 = function()
			if Map.sxpd07 ~= 7 then
				Map.sxpd07 = (Map.sxpd07 or 0) + 1
				mgrMonster:Add(50302010,50302010,50302010,50302010,100820050,-19.28,-20.86)		--金轮法王
			end
		end
		CTimer:AddTimer( 35000, false, D7, {} )
		
	elseif waveId == 8 then
		if not sysScript:DelItem(4100010,2) then
			duplSystem:NoticeMsg(SysStringConfigInfo[9000660157])
			return;
		end;
		mgrNpc:Story(110)
		sysScript:Story(5005002)
		mgrMonster:DelayAdd(50302019,50302019,50302019,(100000+(math.floor(dwLevelt/5)*5)),82010,-17.60,-24.42,nil,900)
		mgrMonster:DelayAdd(50302019,50302019,50302019,(100000+(math.floor(dwLevelt/5)*5)),82010,-22.97,-19.38,nil,900)
		mgrMonster:DelayAdd(50302019,50302019,50302019,(100000+(math.floor(dwLevelt/5)*5)),82010,-20.78,-27.74,nil,1050)
		mgrMonster:DelayAdd(50302019,50302019,50302019,(100000+(math.floor(dwLevelt/5)*5)),82010,-26.48,-22.46,nil,1050)
		mgrMonster:DelayAdd(50302021,50302021,50302021,(100000+(math.floor(dwLevelt/5)*5)),82020,-17.70,-27.87,nil,1500)
		mgrMonster:DelayAdd(50302021,50302021,50302021,(100000+(math.floor(dwLevelt/5)*5)),82020,-21.11,-24.60,nil,1560)
		mgrMonster:DelayAdd(50302021,50302021,50302021,(100000+(math.floor(dwLevelt/5)*5)),82020,-23.19,-22.48,nil,1620)
		mgrMonster:DelayAdd(50302021,50302021,50302021,(100000+(math.floor(dwLevelt/5)*5)),82020,-26.23,-19.31,nil,1680)
		
		local D8 = function()
			if Map.sxpd08 ~= 8 then
				Map.sxpd08 = (Map.sxpd08 or 0) + 1
				mgrMonster:Add(50302018,50302018,50302018,50302018,100710070,-19.28,-20.86)		--欧阳锋
			end
		end
		CTimer:AddTimer( 35000, false, D8, {} )
		
	elseif waveId == 9 then
	
		if not sysScript:DelItem(4100010,3) then
			duplSystem:NoticeMsg(SysStringConfigInfo[9000660157])
			return;
		end;
		mgrNpc:Story(112)
		sysScript:Story(5005003)
		mgrMonster:DelayAdd(50302049,50302049,50302049,(100000+(math.floor(dwLevelt/5)*5)),82010,-17.58,-24.37,nil,750)
		mgrMonster:DelayAdd(50302049,50302049,50302049,(100000+(math.floor(dwLevelt/5)*5)),82010,-19.20,-24.32,nil,850)
		mgrMonster:DelayAdd(50302049,50302049,50302049,(100000+(math.floor(dwLevelt/5)*5)),82010,-22.83,-24.42,nil,950)
		mgrMonster:DelayAdd(50302049,50302049,50302049,(100000+(math.floor(dwLevelt/5)*5)),82010,-24.83,-24.45,nil,1050)
		mgrMonster:DelayAdd(50302051,50302051,50302051,(100000+(math.floor(dwLevelt/5)*5)),82020,-20.88,-19.32,nil,1500)
		mgrMonster:DelayAdd(50302051,50302051,50302051,(100000+(math.floor(dwLevelt/5)*5)),82020,-20.87,-22.47,nil,1600)
		mgrMonster:DelayAdd(50302051,50302051,50302051,(100000+(math.floor(dwLevelt/5)*5)),82020,-20.85,-26.26,nil,1700)
		mgrMonster:DelayAdd(50302051,50302051,50302051,(100000+(math.floor(dwLevelt/5)*5)),82020,-20.77,-29.43,nil,1800)
		
		local D9 = function()
			if Map.sxpd09 ~= 8 then
				Map.sxpd09 = (Map.sxpd09 or 0) + 1
				mgrMonster:Add(50302048,50302048,50302048,50302048,100610010,-19.28,-20.86)		--一灯大师
			end
		end
		CTimer:AddTimer( 35000, false, D9, {} )
		
	elseif waveId == 10 then
		if not sysScript:DelItem(4100010,3) then
			duplSystem:NoticeMsg(SysStringConfigInfo[9000660157])
			return;
		end;
		mgrNpc:Story(118)
		sysScript:Story(5005001)
		mgrMonster:DelayAdd(50302039,50302039,50302039,(100000+(math.floor(dwLevelt/5)*5)),82010,-15.75,-22.53,nil,750)
		mgrMonster:DelayAdd(50302039,50302039,50302039,(100000+(math.floor(dwLevelt/5)*5)),82010,-18.32,-25.22,nil,800)
		mgrMonster:DelayAdd(50302039,50302039,50302039,(100000+(math.floor(dwLevelt/5)*5)),82010,-20.76,-27.68,nil,850)
		mgrMonster:DelayAdd(50302041,50302041,50302041,(100000+(math.floor(dwLevelt/5)*5)),82020,-20.86,-17.50,nil,750)
		mgrMonster:DelayAdd(50302041,50302041,50302041,(100000+(math.floor(dwLevelt/5)*5)),82020,-23.76,-20.05,nil,800)
		mgrMonster:DelayAdd(50302041,50302041,50302041,(100000+(math.floor(dwLevelt/5)*5)),82020,-26.30,-22.46,nil,850)
		mgrMonster:DelayAdd(50302039,50302039,50302039,(100000+(math.floor(dwLevelt/5)*5)),82010,-24.87,-24.39,nil,1100)
		mgrMonster:DelayAdd(50302041,50302041,50302041,(100000+(math.floor(dwLevelt/5)*5)),82020,-20.91,-22.61,nil,1200)
		mgrMonster:DelayAdd(50302039,50302039,50302039,(100000+(math.floor(dwLevelt/5)*5)),82010,-17.74,-20.87,nil,1300)
		
		local D10 = function()
			if Map.sxpd10 ~= 9 then
				Map.sxpd10 = (Map.sxpd10 or 0) + 1
				mgrMonster:Add(50302038,50302038,50302038,50302038,100510030,-19.28,-20.86)		--黄药师
			end
		end
		CTimer:AddTimer( 35000, false, D10, {} )
		
	elseif waveId == 11 then
		if not sysScript:DelItem(4100010,3) then
			duplSystem:NoticeMsg(SysStringConfigInfo[9000660157])
			return;
		end;
		mgrNpc:Story(120)
		sysScript:Story(5005003)
		mgrMonster:DelayAdd(50302044,50302044,50302044,(100000+(math.floor(dwLevelt/5)*5)),82010,-19.16,-20.70,nil,400)
		mgrMonster:DelayAdd(50302046,50302046,50302046,(100000+(math.floor(dwLevelt/5)*5)),82020,-19.27,-17.49,nil,500)
		mgrMonster:DelayAdd(50302044,50302044,50302044,(100000+(math.floor(dwLevelt/5)*5)),82010,-15.74,-17.51,nil,600)
		mgrMonster:DelayAdd(50302046,50302046,50302046,(100000+(math.floor(dwLevelt/5)*5)),82020,-15.69,-20.84,nil,700)
		mgrMonster:DelayAdd(50302044,50302044,50302044,(100000+(math.floor(dwLevelt/5)*5)),82010,-17.64,-24.40,nil,850)
		mgrMonster:DelayAdd(50302044,50302044,50302044,(100000+(math.floor(dwLevelt/5)*5)),82010,-19.33,-24.37,nil,950)
		mgrMonster:DelayAdd(50302044,50302044,50302044,(100000+(math.floor(dwLevelt/5)*5)),82010,-22.77,-24.39,nil,1050)
		mgrMonster:DelayAdd(50302046,50302046,50302046,(100000+(math.floor(dwLevelt/5)*5)),82020,-24.88,-20.85,nil,1500)
		mgrMonster:DelayAdd(50302046,50302046,50302046,(100000+(math.floor(dwLevelt/5)*5)),82020,-24.83,-22.58,nil,1600)
		mgrMonster:DelayAdd(50302046,50302046,50302046,(100000+(math.floor(dwLevelt/5)*5)),82020,-24.79,-26.20,nil,1700)
		
		local D11 = function()
			if Map.sxpd11 ~= 10 then
				Map.sxpd11 = (Map.sxpd11 or 0) + 1
				mgrMonster:Add(50302043,50302043,50302043,50302043,100510011,-19.28,-20.86)		--周伯通
			end
		end
		CTimer:AddTimer( 35000, false, D11, {} )
		
	elseif waveId == 12 then
		if not sysScript:DelItem(4100010,3) then
			return;
		end;
		mgrNpc:Story(130)
		sysScript:Story(5005002)
		mgrMonster:DelayAdd(50302069,50302069,50302069,(100000+(math.floor(dwLevelt/5)*5)),82010,-19.19,-20.87,nil,800)
		mgrMonster:DelayAdd(50302069,50302069,50302069,(100000+(math.floor(dwLevelt/5)*5)),82010,-21.88,-25.38,nil,900)
		mgrMonster:DelayAdd(50302071,50302071,50302071,(100000+(math.floor(dwLevelt/5)*5)),82020,-23.96,-23.40,nil,1000)
		mgrMonster:DelayAdd(50302071,50302071,50302071,(100000+(math.floor(dwLevelt/5)*5)),82020,-26.48,-27.70,nil,1100)
		mgrMonster:DelayAdd(50302071,50302071,50302071,(100000+(math.floor(dwLevelt/5)*5)),82020,-15.64,-27.86,nil,1500)
		mgrMonster:DelayAdd(50302071,50302071,50302071,(100000+(math.floor(dwLevelt/5)*5)),82020,-17.57,-26.24,nil,1550)
		mgrMonster:DelayAdd(50302071,50302071,50302071,(100000+(math.floor(dwLevelt/5)*5)),82020,-19.21,-24.29,nil,1600)
		mgrMonster:DelayAdd(50302071,50302071,50302071,(100000+(math.floor(dwLevelt/5)*5)),82020,-20.93,-22.61,nil,1650)
		mgrMonster:DelayAdd(50302069,50302069,50302069,(100000+(math.floor(dwLevelt/5)*5)),82010,-24.74,-26.15,nil,1650)
		mgrMonster:DelayAdd(50302069,50302069,50302069,(100000+(math.floor(dwLevelt/5)*5)),82010,-26.49,-24.45,nil,1700)
		mgrMonster:DelayAdd(50302069,50302069,50302069,(100000+(math.floor(dwLevelt/5)*5)),82010,-28.18,-22.59,nil,1750)
		mgrMonster:DelayAdd(50302069,50302069,50302069,(100000+(math.floor(dwLevelt/5)*5)),82010,-30.04,-20.77,nil,1800)
		
		local D12 = function()
			if Map.sxpd12 ~= 12 then
				Map.sxpd12 = (Map.sxpd12 or 0) + 1
				mgrMonster:Add(50302068,50302068,50302068,50302068,100820070,-19.28,-20.86)		--洪七公
			end
		end
		CTimer:AddTimer( 35000, false, D12, {} )
		
	elseif waveId == 13 then
		if not sysScript:DelItem(4100010,4) then
			return;
		end;
		mgrNpc:Story(132)
		sysScript:Story(5005003)
		mgrMonster:DelayAdd(50302074,50302074,50302074,(100000+(math.floor(dwLevelt/5)*5)),82010,-15.09,-16.79,nil,350)
		mgrMonster:DelayAdd(50302074,50302074,50302074,(100000+(math.floor(dwLevelt/5)*5)),82010,-13.48,-21.43,nil,400)
		mgrMonster:DelayAdd(50302074,50302074,50302074,(100000+(math.floor(dwLevelt/5)*5)),82010,-14.39,-25.70,nil,450)
		mgrMonster:DelayAdd(50302074,50302074,50302074,(100000+(math.floor(dwLevelt/5)*5)),82010,-16.46,-30.28,nil,500)
		mgrMonster:DelayAdd(50302074,50302074,50302074,(100000+(math.floor(dwLevelt/5)*5)),82010,-21.27,-32.52,nil,550)
		mgrMonster:DelayAdd(50302074,50302074,50302074,(100000+(math.floor(dwLevelt/5)*5)),82010,-26.08,-32.83,nil,600)
		mgrMonster:DelayAdd(50302076,50302076,50302076,(100000+(math.floor(dwLevelt/5)*5)),82020,-30.09,-31.23,nil,650)
		mgrMonster:DelayAdd(50302076,50302076,50302076,(100000+(math.floor(dwLevelt/5)*5)),82020,-31.84,-27.18,nil,700)
		mgrMonster:DelayAdd(50302076,50302076,50302076,(100000+(math.floor(dwLevelt/5)*5)),82020,-31.39,-23.22,nil,750)
		mgrMonster:DelayAdd(50302076,50302076,50302076,(100000+(math.floor(dwLevelt/5)*5)),82020,-29.20,-18.56,nil,800)
		mgrMonster:DelayAdd(50302076,50302076,50302076,(100000+(math.floor(dwLevelt/5)*5)),82020,-24.96,-15.71,nil,850)
		mgrMonster:DelayAdd(50302076,50302076,50302076,(100000+(math.floor(dwLevelt/5)*5)),82020,-20.16,-15.29,nil,900)
		mgrMonster:DelayAdd(50302074,50302074,50302074,(100000+(math.floor(dwLevelt/5)*5)),82010,-27.54,-24.53,nil,1450)--白
		mgrMonster:DelayAdd(50302076,50302076,50302076,(100000+(math.floor(dwLevelt/5)*5)),82020,-19.37,-24.56,nil,1550)--黑
		
		local D13 = function()
			if Map.sxpd13 ~= 14 then
				Map.sxpd13 = (Map.sxpd13 or 0) + 1
				mgrMonster:Add(50302073,50302073,50302073,50302073,100920110,-19.28,-20.86)		--王重阳
			end
		end
		CTimer:AddTimer( 35000, false, D13, {} )
		
	end;
end;

------------------------------------------------------------------------------------------------------------------
-- --1005-恶人谷
-- local objDupl = DuplConfig[1005];
-- function objDupl:CreateEvent(objPlayer)--执行
	-- return true;
-- end;

-- function objDupl:EnterEvent(objPlayer)--执行
	-- return true;
-- end;
------------------------------------------------------------------------------------------------------------------
--1006-五行道场
local objDupl = DuplConfig[1006];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1007-TD
local objDupl = DuplConfig[1007];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1008-截物资
local objDupl = DuplConfig[1008];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1009-演武节堂
local objDupl = DuplConfig[1009];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1010-守卫襄阳
local objDupl = DuplConfig[1010];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1011-天罡北斗阵
local objDupl = DuplConfig[1011];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
---------小猪快跑
local objDupl = DuplConfig[1017];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--1020-夫妻副本
local objDupl = DuplConfig[1020];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------------------------------------------------------------------------------------------------------------------
--6001-群侠副本01
local objDupl = DuplConfig[6001];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--6002-群侠副本02
local objDupl = DuplConfig[6002];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--6003-群侠副本03
local objDupl = DuplConfig[6003];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--6004-群侠副本04
local objDupl = DuplConfig[6004];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--6005-群侠副本05
local objDupl = DuplConfig[6005];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--6006-群侠副本06
local objDupl = DuplConfig[6006];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--6007-群侠副本07
local objDupl = DuplConfig[6007];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--6008-群侠副本08
local objDupl = DuplConfig[6008];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--6009-群侠副本09
local objDupl = DuplConfig[6009];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--6010-群侠副本10
local objDupl = DuplConfig[6010];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
----6011-群侠副本11
local objDupl = DuplConfig[6011];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
------6012群侠副本12
local objDupl = DuplConfig[6012];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
-------6013群侠副本13
local objDupl = DuplConfig[6013];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
---------6014群侠副本14
local objDupl = DuplConfig[6014];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--------6015群侠副本15
local objDupl = DuplConfig[6015];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
---------6016群侠副本16
local objDupl = DuplConfig[6016];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
-------6017群侠副本17
local objDupl = DuplConfig[6017];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
---------6018群侠副本18
local objDupl = DuplConfig[6018];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
-------6019群侠副本19
local objDupl = DuplConfig[6019];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
---------6020群侠副本20
local objDupl = DuplConfig[6020];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
---------6021群侠副本21
local objDupl = DuplConfig[6021];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--------6022群侠副本22
local objDupl = DuplConfig[6022];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
-------6023群侠副本23
local objDupl = DuplConfig[6023];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
-----------6024群侠副本24
local objDupl = DuplConfig[6024];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
---------6025群侠副本25
local objDupl = DuplConfig[6025];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
-------6026群侠副本26
local objDupl = DuplConfig[6026];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
----------6027群侠副本27
local objDupl = DuplConfig[6027];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--------6028群侠副本28
local objDupl = DuplConfig[6028];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;
--------6029群侠副本29
local objDupl = DuplConfig[6029];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;


------------------------------------------------------------------------------------------------------------------
--1013-卧虎藏龙
local objDupl = DuplConfig[1013];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;

function objDupl:DaojishiOver(objPlayer) --倒计时结束
	local monster = {50770011,50770012,50770013,50770014,50770015,50770016,50770017,50770018,50770019,50770020,50770021,50770022,50770023,50770024,50770025,50770026,50770027};
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local sysScript = objPlayer:GetSystem("CScriptSystem");
	local Map = mapSystem:GetCurMap();			-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	mgrMonster:SetTimerUpdate(false)
	for i = 1,#monster do
		local mon = mgrMonster:GetMonsterById(monster[i])
		if #mon > 0 then
			for k,v in pairs(mon) do
				mgrMonster:Remove(v:GetRoleID())
			end
		end
	end
	--sysScript:Notice("倒计时结束，副本失败！");
end;

------------------------------------------------------------------------------------------------------------------
--1014-新珍珑棋局
local objDupl = DuplConfig[1014];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;

------------------------------------------------------------------------------------------------------------------
--1015-通天塔
local objDupl = DuplConfig[1015];
function objDupl:CreateEvent(objPlayer)--执行
	return true;
end;

function objDupl:EnterEvent(objPlayer)--执行
	return true;
end;