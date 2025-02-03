_G.GrowupTargetMsgConfig = 
{
	Get = 1,
	
	Insert = 11,
	Transfer = 12,
	NoPack = 13,
	
	LevelUp = 21,
	LevelUpOne = 22,
	PlayerCompleteOneStep = 23,
}

-----------------------------------------
--成长目标配置
-----------------------------------------
_G.GrowupTargetParamConfig = 
{
	dwLimitLv = 20,
	szSecretTitle = '？？？？',
	szSecretBracket = '尚未开启',
	dwSpaceItem = 5500480;
	dwNotComplete = '',--未完成
	dwComplete = '',--已完成
	dwProcess = '',--进行中
}
_G.enumGrowupTargetType = 
{
	--没用
	invaild = -1,
	--完成该阶段所有目标
	FinishAllTarget = 0,
}
--function _G.LoadGrowupTargetConfig()

_G.GrowupTargetConfig = 
{
	[1] = ---StepID对应ID
	{
		Content = '一桩武林惨案，一段悬疑身世，而你正是其中主角。襄阳一战扬名后，你满怀期待踏上了东海桃花岛，却没想到，踏入的是另一场危机……',
		ContentTitle = '武林新丁',ContentBracket = '（20-30）',TargetNum = 3,ContentSecret = '19级开启',
		dwLevelLimit = 19,bBroadCast = 1,
		colorPic = 'mubiao_ditu_01.png',
		blackPic = "mubiao_ditu_01_dis.png",
		TargetList = 
		{
			[1] = ---TargetID对应ID
			{
				StepID = 1,TargetID = 1,Content = '您可以通过剧情任务快速提升等级',ButtonText = '角色等级提升到25级',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 0,
				EventType = enumPlayerEventType.EventLevelUp,LimitValue = 25,
				ValueFun = function() return CPlayerSystem:GetLevel() end;
				resPic = 'Icon_sk_13002_1.png',
				GiftList = 
				{
					[1] = {ItemID = 4100140,ItemNum = 10,dwBindType = 1,},
				},
				picList = 
				{
				--	[1] = {picPath = 'Qita_lijin.png',szDes = '100礼金',dwNum = 100},
					
				},
			},
			[2] = 
			{
				StepID = 1,TargetID = 2,Content = '打开坐骑界面【快捷键Y】 进行升阶操作',ButtonText = '坐骑升至2阶',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 2000,
				bTip = 1,
				EventType = enumPlayerEventType.EventMountUpGrade,LimitValue = 2,
				ValueFun = function()  return CMountSystem:GetActiveMountGrade() end;
				resPic = 'gn_kf_ZhuoQi.png',
				GiftList = 
				{
				[1] = {ItemID = 5500020,ItemNum = 1,dwBindType = 1,},
				},
				picList = 
				{
					[1] = {picPath = 'Qita_zhenqi.png',szDes = '每种真气2000',dwNum = '2000'},
				},
			},
			---------
			[3] = 
			{
				StepID = 1,TargetID = 3,Content = '通过不断杀怪增加技能熟练度升级技能，使用真气也可以升级技能',ButtonText = '技能总层数达到30层',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 0,
				EventType = enumPlayerEventType.EventSkillUp,LimitValue = 30,
				ValueFun = function() return  CSkillSystem:CountAllSkillLevel(isBaseLevel) end;
				resPic = 'gn_kf_JiNeng.png',
				GiftList = 
				{
					[1] = {ItemID = 9405010,ItemNum = 5,dwBindType = 1,},
				},
				picList = 
				{
				},
			},
			
		},
	},
	------------------------------------------------------------------------
	[2] = 
	{
		Content = '桃花岛的种种际遇让你深受打击，同时也激起了更强的斗志。武技亦在磨练中日益精纯，要为武林创一番事业，为自己讨一个公道，不妨自今日始。',
		ContentTitle = '后起之秀',ContentBracket = '（30-35）',TargetNum = 3,ContentSecret = '24级开启',
		dwLevelLimit = 24,bBroadCast = 1,
		colorPic = 'mubiao_ditu_02.png',
		blackPic = "mubiao_ditu_02_dis.png",
		TargetList = 
		{
			[1] = 
			{
				StepID = 2,TargetID = 1,Content = '您可以通过剧情任务、风云任务提升等级',ButtonText = '角色等级提升到35级',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 1,
				EventType = enumPlayerEventType.EventLevelUp,LimitValue = 35,
				ValueFun = function() return  CPlayerSystem:GetLevel() end;
				resPic = 'Icon_sk_13002_1.png',
				GiftList = 
				{
					[1] = {ItemID = 2500100,ItemNum = 5,dwBindType = 1,},
					[2] = {ItemID = 8100030,ItemNum = 5,dwBindType = 1,},
				},
				picList = 
				{
					--[1] = {picPath = 'Qita_lijin.png',szDes = '200礼金',dwNum = 200},
				},
			},
			 [2] = 
			 {
				 StepID = 2,TargetID = 2,Content = '积攒真气对经脉来说很重要',ButtonText = '经脉总层数达到数10层',
				 Gold = 0,Money = 0,Exp = 0,Zhenqi = 3000,
				 bTip = 1,
				 EventType = enumPlayerEventType.EventPulseUp,LimitValue = 10,
				 ValueFun = function() return  CPulseSystem:GetPulseTotalNum() end;
				 resPic = 'gn_kf_JingMai.png',
				 GiftList = 
				 {
				 	[1] = {ItemID = 2500071,ItemNum = 1,dwBindType = 1,},
					[2] = {ItemID = 2500081,ItemNum = 1,dwBindType = 1,},
				 
				 },
				 picList = 
				 {
				 	[1] = {picPath = 'Qita_zhenqi.png',szDes = '每种真气3000',dwNum = '3000'},
				 },
			 },
			---------
			[3] = 
			{
				StepID = 2,TargetID = 3,Content = '通过不断杀怪增加技能熟练度升级技能，使用真气也可以升级技能',ButtonText = '技能总层数达到50层',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 1,
				EventType = enumPlayerEventType.EventSkillUp,LimitValue = 50,
				ValueFun = function() return  CSkillSystem:CountAllSkillLevel(isBaseLevel) end;
				resPic = 'gn_kf_JiNeng.png',
				GiftList = 
				{
					[1] = {ItemID = 5930003,ItemNum = 1,dwBindType = 1,},
					[2] = {ItemID = 2500040,ItemNum = 10,dwBindType = 1,},
				},
				picList = 
				{
				},
			},
			
		},
	},
	[3] = 
	{
		Content = '一个小小的绝情密涧却令你有幸结识老顽童和东邪，还有杨过这样的少年英杰，真是因缘匪浅。眼下江湖不平，待有志之士立旌旗，伐奸恶，号令群雄，同济侠义。',
		ContentTitle = '崭露头角',ContentBracket = '（35-40）',TargetNum = 3,ContentSecret = '35级开启',
		dwLevelLimit = 30,bBroadCast = 1,
		colorPic = 'mubiao_ditu_03.png',
		blackPic = "mubiao_ditu_03_dis.png",
		TargetList = 
		{
			[1] = 
			{
				StepID = 3,TargetID = 1,Content = '剧情任务、风云任务、副本活动等，都是不错的经验来源',ButtonText = '角色等级提升到40级',
				Gold = 0,Money = 50000,Exp = 0,Zhenqi = 5000,
				bTip = 1,
				EventType = enumPlayerEventType.EventLevelUp,LimitValue = 40,
				ValueFun = function() return  CPlayerSystem:GetLevel() end;
				resPic = 'Icon_sk_13002_1.png',
				GiftList = 
				{
					[1] = {ItemID = 2500050,ItemNum = 3,dwBindType = 1,},
				},
				picList = 
				{
					[1] = {picPath = 'Qita_money.png',szDes = '5万银两',dwNum = '5万'},
				    [2] = {picPath = 'Qita_zhenqi.png',szDes = '每种真气5000',dwNum = '5000'},
				},
			},
			 [2] = 
			 {
				 StepID = 3,TargetID = 2,Content = '击杀对应等级的怪物会掉落实战书',ButtonText = '实战达到略有小成',
				 Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				 bTip = 1,
				 EventType = enumPlayerEventType.EventBournUp,LimitValue = 2,
				 ValueFun = function() return CBournSystem:GetBournLv() end;
				 resPic = 'gn_kf_JingJie.png',
				 GiftList = 
				 {
					 [1] = {ItemID = 5930004,ItemNum = 1,dwBindType = 1,},
				 },
				 picList = 
				 {
				 },
			 },
			---------
			[3] = 
			{
				StepID = 3,TargetID = 3,Content = '通过不断杀怪增加技能熟练度升级技能，使用真气也可以升级技能',ButtonText = '技能总层数达到80层',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 1,
				EventType = enumPlayerEventType.EventSkillUp,LimitValue = 80,
				ValueFun = function() return  CSkillSystem:CountAllSkillLevel(isBaseLevel) end;
				resPic = 'gn_kf_JiNeng.png',
				GiftList = 
				{
					[1] = {ItemID = 4100140,ItemNum = 20,dwBindType = 1,},
				},
				picList = 
				{
				},
			},
			
		},
	},
	[4] = 
	{
		Content = '为助杨过治愈情花奇毒，你远涉南疆，来到千里之外的大理国。此地正被一场来势诡异的疫症侵袭，经过一番调查，竟与五仙教右护法篡权之乱脱不了干系……',
		ContentTitle = '名声鹊起',ContentBracket = '（40-45）',TargetNum = 3,ContentSecret = '35级开启',
		dwLevelLimit = 35,bBroadCast = 1,
		colorPic = 'mubiao_ditu_04.png',
		blackPic = "mubiao_ditu_04_dis.png",
		TargetList = 
		{
			[1] = 
			{
				StepID = 4,TargetID = 1,Content = '剧情任务、风云任务、副本活动、恶人谷，你懂的',ButtonText = '角色等级提升到45级',
				Gold = 0,Money = 100000,Exp = 0,Zhenqi = 10000,
				bTip = 1,
				EventType = enumPlayerEventType.EventLevelUp,LimitValue = 45,
				ValueFun = function() return  CPlayerSystem:GetLevel() end;
				resPic = 'Icon_sk_13002_1.png',
				GiftList = 
				{
					[1] = {ItemID = 4100080,ItemNum = 10,dwBindType = 1,},
				},
				picList = 
				{
					[1] = {picPath = 'Qita_money.png',szDes = '10万银两',dwNum = '10万'},
					[2] = {picPath = 'Qita_zhenqi.png',szDes = '每种真气10000',dwNum = '10000'},
				--	[3] = {picPath = 'Qita_lijin.png',szDes = '500礼金',dwNum = 500},
				},
			},
			
			[2] = 
			{
				StepID = 4,TargetID = 2,Content = '您可以轻松的将坐骑升到3阶',ButtonText = '坐骑升至3阶',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 1,
				EventType = enumPlayerEventType.EventMountUpGrade,LimitValue = 3,
				ValueFun = function() return  CMountSystem:GetActiveMountGrade() end;
				resPic = 'gn_kf_ZhuoQi.png',
				GiftList = 
				{
					 [1] = {ItemID = 9405010,ItemNum = 10,dwBindType = 1,},
				},
				picList = 
				{
				},
			},
			---------
			 [3] = 
			 {
				 StepID = 4,TargetID = 3,Content = '继续积攒真气冲击穴位吧',ButtonText = '经脉总层数达到数30层',
				 Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				 bTip = 1,
				 EventType = enumPlayerEventType.EventPulseUp,LimitValue = 30,
				 ValueFun = function() return  CPulseSystem:GetPulseTotalNum() end;
				 resPic = 'gn_kf_JingMai.png',
				 GiftList = 
				 {
					[1] = {ItemID = 3900010,ItemNum = 10,dwBindType = 1,},

				 },
				 picList = 
				 {
				 },
			 },
			---------

			
		},
	},	
	[5] = 
	{
		Content = '五仙教的内斗竟暴露出当年灭门之祸的真凶所在，一切都指向金国余孽——暗棋。追寻真相的道路愈发艰难，当务之急是尽快提升战力，以待他日风雨。',
		ContentTitle = '呼风唤雨',ContentBracket = '（45-50）',TargetNum = 3,ContentSecret = '40级开启',
		dwLevelLimit = 40,bBroadCast = 1,
		colorPic = 'mubiao_ditu_05.png',
		blackPic = "mubiao_ditu_05_dis.png",
		TargetList = 
		{
			[1] = 
			{
				StepID = 5,TargetID = 1,Content = '剧情任务、风云任务、副本活动、恶人谷，你懂的',ButtonText = '角色等级提升到50级',
				Gold = 0,Money = 200000,Exp = 0,Zhenqi = 15000,
				bTip = 1,
				EventType = enumPlayerEventType.EventLevelUp,LimitValue = 50,
				ValueFun = function() return  CPlayerSystem:GetLevel() end;
				resPic = 'Icon_sk_13002_1.png',
				GiftList = 
				{
					[1] = {ItemID = 4100010,ItemNum = 20,dwBindType = 1,},
				},
				picList = 
				{
					[1] = {picPath = 'Qita_money.png',szDes = '20万银两',dwNum = '20万'},
					[2] = {picPath = 'Qita_zhenqi.png',szDes = '每种真气15000',dwNum = '15000'},
					--[3] = {picPath = 'Qita_lijin.png',szDes = '1000礼金',dwNum = 1000},

				},
			},
			
			[2] = 
			{
				StepID = 5,TargetID = 2,Content = '您稍微努力一下就可以做到，留心送神龙果的活动',ButtonText = '坐骑升至4阶',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 1,
				EventType = enumPlayerEventType.EventMountUpGrade,LimitValue = 4,
				ValueFun = function() return  CMountSystem:GetActiveMountGrade() end;
				resPic = 'gn_kf_ZhuoQi.png',
				GiftList = 
				{
					[1] ={ItemID = 5930005,ItemNum = 1,dwBindType = 1,},
				},
				picList = 
				{
				},
			},
			---------
			 [3] = 
			 {
				StepID = 5,TargetID = 3,Content = '通过不断杀怪增加技能熟练度升级技能，使用真气也可以升级技能',ButtonText = '技能150层',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 1,
				EventType = enumPlayerEventType.EventSkillUp,LimitValue = 150,
				ValueFun = function() return  CSkillSystem:CountAllSkillLevel(isBaseLevel) end;
				resPic = 'gn_kf_JiNeng.png',
				 GiftList = 
				 {
					[1] = {ItemID = 9405010,ItemNum = 5,dwBindType = 1,},
				 },
				 picList = 
				 {
				 },
			 },
			---------


			
		},
	},	
	[6] = 
	{
		Content = '所谓邪不能胜正，白驼山庄里阴谋重重，幸而你机敏应对，一次次化险为夷。每一场战斗都赋予你力量，让你迈入更高的境界，在你眼前展开另一片武者的天地。',
		ContentTitle = '侠士无双',ContentBracket = '（50-55）',TargetNum = 4,ContentSecret = '50级开启',
		dwLevelLimit = 45,bBroadCast = 1,
		colorPic = 'mubiao_ditu_06.png',
		blackPic = "mubiao_ditu_06_dis.png",
		TargetList = 
		{
			[1] = 
			{
				StepID = 6,TargetID = 1,Content = '剧情任务、风云任务、副本以及活动、恶人谷，挂机练级',ButtonText = '角色等级提升到55级',
				Gold = 0,Money = 500000,Exp = 0,Zhenqi = 20000,
				bTip = 1,
				EventType = enumPlayerEventType.EventLevelUp,LimitValue = 55,
				ValueFun = function() return  CPlayerSystem:GetLevel() end;
				resPic = 'Icon_sk_13002_1.png',
				GiftList = 
				{
					[1] = {ItemID = 4100120,ItemNum = 5,dwBindType = 1,},
				},
				picList = 
				{
					[1] = {picPath = 'Qita_money.png',szDes = '50万银两',dwNum = '50万'},
					[2] = {picPath = 'Qita_zhenqi.png',szDes = '每种真气2万',dwNum = '2万'},
					--[3] = {picPath = 'Qita_lijin.png',szDes = '1000礼金',dwNum = 1000},

				},
			},
			
			-----
			[2] = 
			{
				 StepID = 6,TargetID = 2,Content = '继续积攒真气冲击穴位，留心奖励真气的活动',ButtonText = '经脉总层数达到60层',
				 Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				 bTip = 1,
				 EventType = enumPlayerEventType.EventPulseUp,LimitValue = 60,
				 ValueFun = function() return  CPulseSystem:GetPulseTotalNum() end;
				 resPic = 'gn_kf_JingMai.png',
				GiftList = 
				{
					 [1] ={ItemID = 4100290,ItemNum = 10,dwBindType = 1,},
					 [2] ={ItemID = 4100080,ItemNum = 10,dwBindType = 1,},

				},
				picList = 
				{
				},
			},	
			----------
			[3] = 
			{
				StepID = 6,TargetID = 3,Content = '您应该很轻松就可以完成',ButtonText = '名剑升到2阶',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 1,
				EventType = enumPlayerEventType.EventUpSword,LimitValue = 2,
				ValueFun = function() return  CSwordSystem:GetSwordLadder() end;
				resPic = 'gn_kf_MingJian.png',
				GiftList = 
				{
					[1] ={ItemID = 3900020,ItemNum = 10,dwBindType = 1,},
				},
				picList = 
				{
				},
			},			
			 [4] = 
			 {
				 StepID = 6,TargetID = 4,Content = '实战经验书并不是很好获得，可以考虑下收购其他玩家的',ButtonText = '实战达到心领神会',
				 Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				 bTip = 1,
				 EventType = enumPlayerEventType.EventBournUp,LimitValue = 3,
				 ValueFun = function() return  CBournSystem:GetBournLv() end;
				 resPic = 'gn_kf_JingJie.png',
				 GiftList = 
				 {
			      [1] ={ItemID = 2500050,ItemNum = 10,dwBindType = 1,},
				 },
				 picList = 
				 {
				 },
			 },
			---------

			

			
		},
	},	
	[7] = 
	{
		Content = '武学一道，在于功夫修为，更在于对武道的理解。欲至大乘境界，还需要更多的实战历练。白驼山一役虽然凶险万分，却为你指明了新的方向，虽千万人，吾往矣！',
		ContentTitle = '横扫天下',ContentBracket = '（55-60）',TargetNum = 4,ContentSecret = '50级开启',
		dwLevelLimit = 50,bBroadCast = 1,
		colorPic = 'mubiao_ditu_07.png',
		blackPic = "mubiao_ditu_07_dis.png",
		TargetList = 
		{
			[1] = 
			{
				StepID = 7,TargetID = 1,Content = '剧情任务、风云任务、副本以及活动、恶人谷，挂机练级',ButtonText = '角色等级提升到60级',
				Gold = 0,Money = 1000000,Exp = 0,Zhenqi = 30000,
				bTip = 1,
				EventType = enumPlayerEventType.EventLevelUp,LimitValue = 60,
				ValueFun = function() return  CPlayerSystem:GetLevel() end;
				resPic = 'Icon_sk_13002_1.png',
				GiftList = 
				{
					[1] = {ItemID = 4100140,ItemNum = 30,dwBindType = 1,},
				},
				picList = 
				{
					[1] = {picPath = 'Qita_money.png',szDes = '100万银两',dwNum = '100万'},
					[2] = {picPath = 'Qita_zhenqi.png',szDes = '每种真气3万',dwNum = '3万'},
					--[3] = {picPath = 'Qita_lijin.png',szDes = '2000礼金',dwNum = 2000},

				},
			},
			 [2] = 
			 {
				StepID = 7,TargetID = 2,Content = '继续积攒真气冲击穴位，留心奖励真气的活动',ButtonText = '经脉总层数达到100层',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 1,
				EventType = enumPlayerEventType.EventPulseUp,LimitValue = 100,
				ValueFun = function() return  CPulseSystem:GetPulseTotalNum() end;
				resPic = 'gn_kf_JingMai.png',
				 GiftList = 
				 {
					[1] = {ItemID = 9405010,ItemNum = 10,dwBindType = 1,},
					--[1] = {ItemID = 2400130,ItemNum = 1,dwBindType = 1,},
				 },
				 picList = 
				 {
				 },
			 },
			---------
			[3] = 
			{
				StepID = 7,TargetID = 3,Content = '通过不断杀怪增加技能熟练度升级技能，使用真气也可以升级技能',ButtonText = '技能总层数达到200层',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 1,
				EventType = enumPlayerEventType.EventSkillUp,LimitValue = 200,
				ValueFun = function() return  CSkillSystem:CountAllSkillLevel(isBaseLevel) end;
				resPic = 'gn_kf_JiNeng.png',
				GiftList = 
				{
					[1] = {ItemID = 4100110,ItemNum = 5,dwBindType = 1,},
				},
				picList = 
				{
				},
			},
			[4] = 
			{
				StepID = 7,TargetID = 4,Content = '您继续努力一下即可搞定',ButtonText = '坐骑升至5阶',
				Gold = 0,Money = 0,Exp = 0,Zhenqi = 0,
				bTip = 1,
				EventType = enumPlayerEventType.EventMountUpGrade,LimitValue = 5,
				ValueFun = function() return  CMountSystem:GetActiveMountGrade() end;
				resPic = 'gn_kf_ZhuoQi.png',
				GiftList = 
				{
					[1] = {ItemID = 5930005,ItemNum = 5,dwBindType = 1,},
				},
				picList = 
				{
				},
			},
			
		},
	},	
}
--end