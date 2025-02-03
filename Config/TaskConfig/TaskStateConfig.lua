--[[
	任务程序配置文件
	周长沙
	2012-2-13
--]]
------------------------
--本地函数
local function set_fun_link(str,dwfunid)
	local linkStart = [[<font color='#00ff00'><u><a href="asfunction:hrefevent,]];
	local linkMin = [[">]]..str..[[]]
	local linkEnd = [[</a></u></font>]];
	local param = ""
	local dwPlayerLevel = 1
	if CPlayerSystem then
		dwPlayerLevel = CPlayerSystem:GetLevel()
	end
	
	if dwfunid==0 then
		local Info = TaskHangMConfig[dwPlayerLevel]
		if not Info then return "" end;
		param = "move,"..Info.map..","..Info.x..","..Info.y..",".."1"
	else
		param = "fun,"..dwfunid
	end
	return linkStart..param..linkMin..linkEnd
end
--等级未到的推荐内容配置
function _G.TaskConfigSetLink()
	local dwFBLevel = 30;--副本
	local dwWZLevel = 14;--外传
	local dwFYLevel = 25;--风云
	local dwBGLevel = 1;--闭关
	local dwXYLevel = 45;--侠义
	local dwGJLevel = 14;--挂机
	local dwPlayerLevel = CPlayerSystem:GetLevel()
	local str = [[]]
	local Info = {}
	if dwPlayerLevel >= dwFBLevel then
		table.insert(Info,set_fun_link("副本",22))
	end
	if dwPlayerLevel >= dwWZLevel then
		table.insert(Info,set_fun_link("外传",19))
	end
	if dwPlayerLevel >= dwFYLevel then
		table.insert(Info,set_fun_link("风云",20))
	end
	if dwPlayerLevel >= dwXYLevel then
		table.insert(Info,set_fun_link("侠义",19))
	end
	
	--[[
	if dwPlayerLevel >= dwBGLevel then
		table.insert(Info,set_fun_link("闭关",21))
	end
	--]]
	str = table.concat(Info,"、")
	--local str = [[]]..set_fun_link("副本",22)..[[、]]..set_fun_link("外传",19)..[[、]]..set_fun_link("风云",20)..[[、]]..set_fun_link("挂机",0)..[[、]]..set_fun_link("闭关",21)..[[]];
	
	TaskStaticText.MainCanAccept3 = str or ""
	
	local str = [[少侠可通过：]]..set_fun_link("闭关",21).."%s"
	if dwPlayerLevel >= dwGJLevel then
		TaskStaticText.MainCanAccept2 = string.format(str,"、"..set_fun_link("挂机",0))
	else
		TaskStaticText.MainCanAccept2 = string.format(str,"")
	end
end
------------------------
--自动寻路类型
_G.TaskAutoRunTypeConfig = {
	1;--挂机
	2;--对话
}
--任务分页开放等级
_G.TaskOpenLevel = {
	Branch = 1;
	Weekly = 1;
}
--任务状态
_G.TaskStateConfig = {
	UnAccept 		= 0;--未接受
	Complete		= 1;--已完成
	Accept 			= 2;--已接受不满足完成条件
	CanAccept		= 3;--可接
	Done			= 4;--已接受满足完成条件
};
--任务类型
_G.TaskTypeConfig = {
	Principal 		= 0;--主线
	Branch			= 3;--支线
	Daily				= 2;--日环
	Weekly			= 1;--周环
	Rand				= 4;--随机
	Guild			= 5;--世家
	chongfu = 6;--重复
	qiyu = 7;--奇遇
	huodong = 8;--huodong
	
}

_G.TaskChongFuConfig={
	dwChongFuLimit = 6;--侠义·重复每天能完成的个数的上限
	dwHuoDongLinit = 3;--活动 每天能完成的个数的上限
	szTimesText="[%s/%s次]";
}


--npc对话闪烁配置（任务类型）
_G.TaskTalkShowHalo = {
	[TaskTypeConfig.Principal] = true;--主线


};


--在显示界面中隐藏玩家等级和任务等级相差较大的任务
_G.TaskHideConfig={
	[TaskTypeConfig.Principal] 		= 999;--主线
	[TaskTypeConfig.Branch]			= 999;--支线
	[TaskTypeConfig.Daily]				= 999;--日环
	[TaskTypeConfig.Weekly]			= 999;--周环
	[TaskTypeConfig.Rand]				= 999;--随机
	[TaskTypeConfig.Guild]			= 999;--世家
	[TaskTypeConfig.chongfu] = 10;--重复
	[TaskTypeConfig.qiyu] = 999;--奇遇
	[TaskTypeConfig.huodong] = 999;--奖励
}

--类似支线类型配置
_G.BHTaskTypeConfig = {
	[TaskTypeConfig.Branch] = true;
	[TaskTypeConfig.chongfu] = true;
	[TaskTypeConfig.qiyu] = true;
	[TaskTypeConfig.huodong] = true;
}

--任务事件类型
_G.TaskEvent = {
	KillMonster		= 1;--杀怪
	GetItem			= 2;--获取物品
	UseItem			= 3;--使用物品
	DropItem		= 4;--丢弃物品
	Move			= 5;--移动
	Special			= 6;--特殊
	NpcTalk			= 7;--npc对话
};

--任务接受失败类型
_G.TaskAcceptFailType = {
	Error				= 0;--任务不存在
	AlreadyHave			= 1;--任务已接收
	LowLevel			= 2;--等级不足
	NoTask				= 3;--前置任务未完成
	NoItem				= 4;--无接任务所需物品
	NoRoom				= 5;--背包空间不足
	MaxNum				= 6;--任务数量达上限
	AcceptOnce			= 7;--任务不可重复接受
}
--任务完成失败类型
_G.TaskCompleteFailType = {
	NoTask				= 1;--任务未接受
	NoDone				= 2;--未满足完成条件
	NoRoom				= 3;--背包空间不足
}
--放弃任务失败类型
_G.TaskDoffFailType = {
	NoTask				= 1;--任务未接受
	NoDoff				= 2;--任务不可放弃
}
--判断可接任务关注的特殊事件
_G.TaskCareEvent = {
	["EventLevelUp"] = true;
	["EventCompleteTask"] = true;
	["EventAcceptTask"] = true;
	["EventDoffTask"] = true;
}
--需要经过变换的特殊事件
_G.TaskChangeEvent = {
	["EventGoldBuy"] = 1;



}





--任务特殊要求
_G.TaskSpNeed ={
	Sit					= 1;--打坐
	PVP					= 2;--PVP
	EquipStrong			= 3;--装备强化
	StoneCompound		= 4;--宝石合成
	StoneInlay			= 5;--宝石镶嵌
	FriendAdd			= 6;--添加好友
	--FriendHave			= 7;--拥有好友
	StoryStart  = 8;--开始一个剧情
	StoryFinish = 9;--完成一个剧情
	NpcCollect = 10;--完成一次采集
	ElementUp = 11;--五行升级
	DantianUp = 12;--丹田升级
	MountActivate = 13;--激活坐骑
	SetPoint = 14;--人物加点
	UseWeapon = 15;--装备武器
	SkillUp = 16;--学习技能
	EventPulseUp = 17;--经脉升级
	EventCharge = 18;--充值
	EventLevelUp = 19;--到达指定等级
	EventMountUpGrade = 20;--坐骑升阶
	EventContinueKill = 21;--达成一次连斩
	----连斩
	EventContinueKillCombo100 = 22;	--100
	EventContinueKillCombo200 = 23;	--200
	EventContinueKillCombo300 = 24;	--300
	EventContinueKillCombo400 = 25;	--400
	EventContinueKillCombo500 = 26;	--500
	EventContinueKillCombo600 = 27;	--600
	EventContinueKillCombo700 = 28;	--700
	EventContinueKillCombo800 = 29;	--800
	EventContinueKillCombo900 = 30;	--900
	EventContinueKillCombo1000 = 31;--1000
	----
	EventIntenAmulet = 32;--熔炼护身宝甲
	EventUpgradeAmulet = 33;--升阶护身宝甲
	EventKillPlayer = 34;--杀玩家
	EventGoldBuy4100140 = 35;--买强化石
	EventGoldBuy2500050 = 36;--买武尊残章
	EventGoldBuy4100110 = 37;--买剑魂石
	EventGoldBuy4100130 = 38;--买升阶玄晶
	EventGoldBuy9405010 = 39;--买神龙果	
	EventPetOutBattle = 40;--宠物召出	
}
--任务特殊要求文字
_G.TaskSpNeedTxt = {
	["EventSit"] = TaskSpNeed.Sit;
	["EventPVP"] = TaskSpNeed.PVP;
	["EventEquipStrong"] = TaskSpNeed.EquipStrong;
	["EventComposeStone"] = TaskSpNeed.StoneCompound;
	["EventStoneSet"] = TaskSpNeed.StoneInlay;
	["EventAddFriend"] = TaskSpNeed.FriendAdd;
	["zNONE"] = TaskSpNeed.FriendHave;
	["EventStoryStart"] = TaskSpNeed.StoryStart;
	["EventStoryFinish"] = TaskSpNeed.StoryFinish;
	["EventNpcCollect"] = TaskSpNeed.NpcCollect;
	["EventElementUp"] = TaskSpNeed.ElementUp;
	["EventDantianUp"] = TaskSpNeed.DantianUp;
	["EventMountActivate"] = TaskSpNeed.MountActivate;
	["EventSetPoint"] = TaskSpNeed.SetPoint;
	["EventUseWeapon"] = TaskSpNeed.UseWeapon;
	["EventSkillUp"] = TaskSpNeed.SkillUp;
	["EventPulseUp"] = TaskSpNeed.EventPulseUp;
	["EventCharge"] = TaskSpNeed.EventCharge;
	["EventLevelUp"] = TaskSpNeed.EventLevelUp;
	["EventMountUpGrade"] = TaskSpNeed.EventMountUpGrade;
	["EventContinueKill"] = TaskSpNeed.EventContinueKill;
	["EventGoldBuy4100140"] = TaskSpNeed.EventGoldBuy4100140;
	["EventGoldBuy2500050"] = TaskSpNeed.EventGoldBuy2500050;
	["EventGoldBuy4100110"] = TaskSpNeed.EventGoldBuy4100110;
	["EventGoldBuy4100130"] = TaskSpNeed.EventGoldBuy4100130;
	["EventGoldBuy9405010"] = TaskSpNeed.EventGoldBuy9405010;	
	--连斩
	["EventContinueKillCombo100"] = TaskSpNeed.EventContinueKillCombo100;
	["EventContinueKillCombo200"] = TaskSpNeed.EventContinueKillCombo200;
	["EventContinueKillCombo300"] = TaskSpNeed.EventContinueKillCombo300;
	["EventContinueKillCombo400"] = TaskSpNeed.EventContinueKillCombo400;
	["EventContinueKillCombo500"] = TaskSpNeed.EventContinueKillCombo500;
	["EventContinueKillCombo600"] = TaskSpNeed.EventContinueKillCombo600;
	["EventContinueKillCombo700"] = TaskSpNeed.EventContinueKillCombo700;
	["EventContinueKillCombo800"] = TaskSpNeed.EventContinueKillCombo800;
	["EventContinueKillCombo900"] = TaskSpNeed.EventContinueKillCombo900;
	["EventContinueKillCombo1000"] = TaskSpNeed.EventContinueKillCombo1000;
	["EventIntenAmulet"] = TaskSpNeed.EventIntenAmulet;
	["EventUpgradeAmulet"] = TaskSpNeed.EventUpgradeAmulet;
	["EventKillPlayer"] = TaskSpNeed.EventKillPlayer;
	["EventPetOutBattle"] = TaskSpNeed.EventPetOutBattle;	
}


--任务追踪快捷配置
_G.TaskCountQuick = {
	Monster = {
		[1] = {szName="mon1";szMax="max_mon1";};
		[2] = {szName="mon2";szMax="max_mon2";};
		[3] = {szName="mon3";szMax="max_mon3";};
		[4] = {szName="mon4";szMax="max_mon4";};
	};
	Item = {
		[1] = {szName="item1";szMax="max_item1";};
		[2] = {szName="item2";szMax="max_item2";};
		[3] = {szName="item3";szMax="max_item3";};
		[4] = {szName="item4";szMax="max_item4";};
	};
	ItemUse = {
		[1] = {szName="use1";szMax="max_use1";};
	};
	Explore = {
		[1] = {szName="map1";szMax="max_map1";};
	};
	Special = {
		[1] = {szName="spc1";szMax="max_spc1";};
	};
	Npc = {
		[1] = {szName="npc1";szMax="max_npc1";};
	};
	ItemIcon = "item_use";
	Other = "";
};
--任务特殊追踪配置
_G.TaskCountFun = {
	[1] = [[CUIFiveElem:Show("UIFiveElem")]];--打开五行界面
	[2] = [[CAvatarEquip:Open()]];--打开人物属性界面
	[3] = [[CUIRole:OpenPanel(3)]];--打开经脉界面
	[4] = [[CUISkill:SetSelecte(1,dwSkillId)]];--打开技能界面
	[5] = [[CMountSystem:OpenMainUI()]];--打开坐骑界面
	[6] = [[CItemSystem:GetStorage():Open()]];--打开仓库
	[7] = [[CUIEquipIntensify:Open(1)]];--打开装备炼制
	[8] = [[CUIEquipIntensify:Open(2)]];--打开附加属性炼制
	[9] = [[CUIStoneSystem:OpenStonePanel()]];--打开宝石合成与镶嵌
	[10] = [[CUIAmuletWnd:Open()]];--打开护身宝甲炼制
	[11] = [[CFriendList:Open()]];--打开好友界面
	[12] = [[CMartialSystem:DoRequestChange(isMustMartial)]];--打坐
	[13] = [[CUIMall:OnCharge()]];--打开充值页面
	[14] = [[CUIGuideBook:OnVisiable(2)]];--武林宝典-我要升级
	[15] = [[CUITaskMain:OpenCanaccept();]];--任务界面--可接任务（废弃）
	[16] = [[CMountSystem.IntensifyUI:OpenUpGrade();]];--坐骑升阶界面
	[17] = [[CUIMissionDailyEx:OpenPanel(3)]]; --每日活动BOSS界面
	[18] = [[CTaskSystem:DoTaskLinkClick({param="move,1002,5.48,19.09"},true)]];--自动寻路
	[19] = [[CUITaskMainPanel:DoOpen(1,2,dwSelectBranchTaskId)]];--支线可接
	[20] = [[CUITaskMainPanel:DoOpen(2)]];--风云
	[21] = [[CUIMuse:Show()]];--闭关
	[22] = [[CUIDuplWnd:OpenWnd()]];--副本
	[23] = [[CGuildSystem:ShowGuildMain('GuildCombatPanel')]];--开启世家战页面
	[24] = [[CUIPacket:DoOpen(enShowMode.eEquip,1)]];--打开背包的装备分页
	[25] = [[CTaskSystem:DoTaskLinkClick({param="move,8020,-0.25,64.15"},true)]];--盟主战寻路
	[26] = [[UIGamble:DoOpen()]];--摇骰子
	[27] = [[CScriptManager:ShowPlayerTips(%d,"%s")]];--查看玩家
	[28] = [[CUIBigMap:OpenWorldMap()]];--世界地图	
	[29] = [[CUIGetReword:DoOpen("UIDailyCode")]];--领奖码
	[30] = [[CTaskSystem:DoTaskLinkClick({param="move,1002,6,18"},true)]];--盟主战寻路
	[31] = [[CTeamSystem:ReqShowTeamMain()]];--组队界面
	[32] = [[CExchangeUI:TryOpenWnd(1)]];--兑换界面
	[33] = [[CCollectUIBg:OpenPanel(%d,%d)]];--收集界面
	[34] = [[CUIMissionDailyEx:OpenPanel()]];--活动界面
	[35] = [[CTaskSystem:DoTaskLinkClick({param="move,1005,-18,47"},true)]];--绝情密涧寻路
	[36] = [[CTaskSystem:DoTaskLinkClick({param="move,1006,-97,24"},true)]];--大理寻路
	[37] = [[CTaskSystem:DoTaskLinkClick({param="move,1007,-98,28"},true)]];--白驼山寻路
	[38] = [[CTaskSystem:DoTaskLinkClick({param="move,1008,-96,-7"},true)]];--终南山
	[39] = [[CZLEnterUI:CheckOpenDuplUI()]];--珍珑界面
	[40] = [[CTaskSystem:DoTaskLinkClick({param="move,1002,-2.94,-10.87"},true)]];--襄阳城
	[41] = [[CUISkill:DoOpen(true)]];--技能界面--称谓
	[42] = [[CScriptManager:OpenWebLink("%s")]];--打开网页
	[43] = [[CTaskSystem:DoTaskLinkClick({param="move,1002,3,24"},true)]];--何居奇
	[44] = [[CExchangeUI:TryOpenWnd(2)]];--兑换界面
	[45] = [[CExchangeUI:TryOpenWnd(3)]];--兑换界面
	[46] = [[CTaskSystem:DoTaskLinkClick({param="move,1002,5,13"},true)]];--叶锦溪寻路
	[48] = [[CTaskSystem:DoTaskLinkClick({param="move,8030,-11,-13"},true)]];--青云蜀道寻路
	[47] = [[CUIMall:ShowMainPanel(4)]];--打开商城界面	
	[49] = [[CTaskSystem:DoTaskLinkClick({param="move,8030,-13,43"},true)]];--青云蜀道玄武
	[50] = [[CTaskSystem:DoTaskLinkClick({param="move,8030,-68,-13"},true)]];--青云蜀道青龙
	[51] = [[CTaskSystem:DoTaskLinkClick({param="move,8030,-14,-70"},true)]];--青云蜀道朱雀
	[52] = [[CTaskSystem:DoTaskLinkClick({param="move,8030,44,-14"},true)]];--青云蜀道白虎
	[53] = [[CCommercialGiftSystem:ShowCommercialGiftWnd()]];	--360特权礼包
	[54] = [[CItemSystem:CompareEquipTipByEnum(%s, %s, "%s", bShowBindSellEquip, bShowBuyPrice, bShowBuyBackPrice, bShowHelpInfo)]];--物品悬浮框
	[55] = [[UILotterySystem:DoBtn()]]; -- 抽签
	[56] = [[CUIPetDevelop:Show()]];--打开宠物界面		
	[57] = [[CExchangeUI:TryOpenWnd(4)]];--圣诞树兑换	
	[58] = [[CUIFestival:DoOpen(2,dwLine,dwIndex)]];--打开活动界面	
	[59] = [[CExchangeUI:TryOpenWnd(5)]];--花灯兑换		
};

--任务状态文字
_G.TaskStateText = {
	[TaskStateConfig.UnAccept] = [[<font color="#b734f8">(可接)</font>]];
	[TaskStateConfig.CanAccept] = [[<font color="#f8cc33">(可接)</font>]];
	[TaskStateConfig.Accept] = [[<font color="#ff0f0f">(未完)</font>]];
	[TaskStateConfig.Done] = [[<font color="#31cf32">(可交)</font>]];
	[TaskStateConfig.Complete] = "(已完)";
};
--任务类型文字
_G.TaskTypeText = {
	[TaskTypeConfig.Principal] = [[<font size="14" color="#ff0f0f">%s[正传]%s</font>]];
	[TaskTypeConfig.Branch] = [[<font size="14" color="#ffff01">%s[外传]</font>]];
	[TaskTypeConfig.Daily] = [[<font size="14" color="#ff9910">%s[日环]</font>]];
	[TaskTypeConfig.Weekly] = [[<font size="14" color="#ff9910">%s[风云]%s</font>]];
	[TaskTypeConfig.Rand] = [[<font size="14" color="#f95005">%s[随机]</font>]];
	[TaskTypeConfig.chongfu] = [[<font size="14" color="#f95005">%s[侠义]%s</font>]];
	[TaskTypeConfig.qiyu] = [[<font size="14" color="#8DFCC9">%s[奇遇]</font>]];
	[TaskTypeConfig.huodong] = [[<font size="14" color="#F41EFC">%s[活动]%s</font>]];
};
--任务类型颜色
_G.TaskTypeColor = {
	[TaskTypeConfig.Principal] = "fed602";
	[TaskTypeConfig.Branch] = "f9ddb6";
	[TaskTypeConfig.Daily] = "f6e78c";
	[TaskTypeConfig.Weekly] = "bbca56";
	[TaskTypeConfig.Rand] = "8DFCC9";
	[TaskTypeConfig.chongfu] = "f9ddb6";	
	[TaskTypeConfig.qiyu] = "f9ddb6";	
	[TaskTypeConfig.huodong] = "f9ddb6";
}
_G.TaskRewardText = {
	money = "银两";
	exp = "经验";
	pneuma = "真气";
};
--正传界面配置
_G.PrincipalPanelConfig = {
	szProgres = "(%d%%)";
	szCut = "·";
	szReward = "%s";
	Reward = {--完成奖励属性
			dwHPMax = "生命+%s";--生命
			dwMPMax = "内力+%s";--内力
			dwAttack = "攻击+%s";--攻击
			dwDefense = "防御+%s";--防御
			dwFlee = "身法+%s";--身法
			dwCrit = "暴击+%s";--暴击
		};
};
--环任务界面配置
_G.WeeklyPanelConfig = {
	RewardIcon = {
		[1] = {
			szIcon = "Qita_money.png";
			szDes = "金钱:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
		[2] = {
			szIcon = "Qita_exp.png";
			szDes = "经验:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
		[3] = {
			szIcon = "Qita_zhenqi.png";
			szDes = "真气:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
		[4] = {
			szIcon = "Qita_lijin.png";
			szDes = "礼金:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
		[6] = {
			szIcon = "Qita_shengwang.png";
			szDes = "风云声望:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
	};
	--一键完成配置
	OneKeyComplete = {
		dwItemId = 5500030;
		dwNum = 5;
		dwNoTaskNoticeId = 9000110021;
		dwNoItemNoticeId = 9000110019;
		szUnFit = [[<font color="#ff0000">%s</font>]];
		szFit = [[<font color="#00ff00">%s</font>]];
		
		dwCost = 10;--完成单个任务消耗元宝数
		dwRebate = 0.5;--折扣 最终消耗 = 任务数 * dwCost * dwRebate
		szRollOne = [[<font color="#ff9910">完成当环风云任务需花费元宝：</font><font color="#ffff01">%d</font><br/><font color="#F86732">温馨提示：</font><br/><font color="#F86732">完成全部风云任务需花费元宝：</font><font color="#ffff01">%d</font><br/><font color="#DDC1C0">点击按钮立即完成当环任务</font>]];
		RollAll = {
			[1] = [[<font color="#ff9910">完成今日风云任务需花费元宝：</font><font color="#ffff01">%d</font>]];
			[2] = [[<font color="#ff9910">目前已完成环数：</font><font color="#ffff01">%d</font>]];
			[3]	= [[<font color="#F86732">温馨提示：</font><br/><font color="#F86732">选择一键完成全部，则剩余所有任务均按十星满级发放奖励！！</font>]];
			[4] = [[<font color="#31cf32">剩余任务奖励与额外奖励总额如下：</font>]];
			[5] = [[<font color="#31cf32">经验：</font><font color="#ffff01">%d</font>]];
			[6] = [[<font color="#31cf32">真气：</font><font color="#ffff01">%d</font>]];
			[7] = [[<font color="#31cf32">银两：</font><font color="#ffff01">%d</font>]];
			[8] = [[<font color="#31cf32">礼金：</font><font color="#ffff01">%d</font>]];
			--[9] = [[<font color="#31cf32">神龙果：</font><font color="#ffff01">%d 颗</font>]];
			[10] = [[<font color="#31cf32">风云声望：</font><font color="#ffff01">%d </font>]];
			[11] = [[<font color="#DDC1C0">点击按钮立即花费元宝完成</font>]];
			--[12] = [[<font color="#31cf32">尤物志礼包：</font><font color="#ffff01">%d 个</font>]];
			Item = {
				[1] = [[<font color="#31cf32">神龙果：</font><font color="#ffff01">%d 颗</font>]];
				[2] = [[<font color="#31cf32">尤物志初级礼包：</font><font color="#ffff01">%d 个</font>]];
			};
		};
		szWin = "敢问大侠是否确定花费 %d 元宝完成今日所有风云任务？";
	};
	OneKeyQuality = {
			CostType  	  = 1;			--花费类型：1 为银两，2为礼金，3为元宝
			CostValue	  = 20000;		--花费数量 
			StrCost		  = {
						[1] = "银两";
						[2] = "礼金";
						[3] = "元宝";
			};
			starMax		  = 10;			    --满星级
			IsNoCan	      = "很遗憾，当前%s不足以完成本次操作";			    --消耗不足提示
			szQuality	  = "已达十星满级，无法继续提升星级";				--品质满级提示
			szRollHonor	  = "点击查看风云声望和风云腰牌";				--呼出侠义勋章按钮Tips
			szRollQuality = [[<font color="#ff9910">刷新当前任务星级需花费%s：</font><font color="#ffff01">%d</font><br/><font color="#F86732">星级越高，奖励越多！</font><br/><font color="#F86732">刷至十星满级，将有巨额奖励！！</font><br/><font color="#DDC1C0">点击按钮立即刷新当环任务星级</font>]];
	};
	szLoop = [[第<b><font size="20" color="#ff0000"> %s </font></b>环]];
	szMain = "[%d/%d环]",
	szDaily = [[今日已进行 <b><font size="20" color="#ff0000">%s/20</font></b> 环]];
	szWeekly = [[本周已完成 <b><font size="20" color="#ff0000">%s</font></b> 环]];
	szHelp = [[1.每日可接20环风云任务，当日24点重置可接环数;<br/>2.每8环将可获得一份特殊奖励]];
	szHelp2 = [[一键完成本环任务]];
	szDanHelp = [[每日可完成20环风云任务，当日24点重置可接环数]];
	szQuanHelp = [[1、每满8环可在当环任务奖励的基础上获得一份额外奖励。<br/>2、8环计数将持续累计，永不重置。]];
	szSender = "系统";
	szTitle = "江湖风云任务奖励";
	szBody = "多谢大侠不畏辛劳，为江湖的繁荣发展献出一己之力！随信附上任务奖励若干，望大侠笑纳！";
	
	
	
	
	dwDayMax = 20;
};

--返回风云任务刷新星级花费
--返回值 CostInfo 类型：table
--CostInfo = {CostType = 1; CostValue = 1000;}    --花费类型 CostType ：1 为银两，2为礼金，3为元宝  ;花费数量 CostValue 
function WeeklyPanelConfig:GetWeeklyPanelQualityCost()
	local CostTable = self.OneKeyQuality
	local CostInfo = { CostType= CostTable.CostType; CostValue = CostTable.CostValue;};
	return CostInfo 
end

--挂机坐标配置
_G.TaskHangMConfig = {
	[14] = {map=1003,x=-50,y=26};
	[15] = {map=1003,x=-50,y=26};	
	[16] = {map=1003,x=-68,y=-21};
	[17] = {map=1003,x=-63,y=-55};
	[18] = {map=1003,x=21,y=-51};	
	[19] = {map=1003,x=71,y=-61};
	[20] = {map=1004,x=-25,y=-53};	
	[21] = {map=1004,x=-25,y=-53};	
	[22] = {map=1004,x=7,y=-39};	
	[23] = {map=1004,x=7,y=-39};	
	[24] = {map=1004,x=0,y=3};		
	[25] = {map=1004,x=0,y=3};
	[26] = {map=1004,x=78,y=-18};	
	[27] = {map=1004,x=78,y=-18};	
	[28] = {map=1004,x=-84,y=14};	
	[29] = {map=1004,x=-90,y=56};	
	[30] = {map=1005,x=-11,y=29};
	[31] = {map=1005,x=-11,y=29};	
	[32] = {map=1005,x=-13,y=-11};
	[33] = {map=1005,x=-13,y=-11};	
	[34] = {map=1005,x=-35,y=-26};
	[35] = {map=1005,x=-35,y=-26};	
	[36] = {map=1005,x=25,y=22};	
	[37] = {map=1005,x=25,y=22};	
	[38] = {map=1005,x=-5,y=-45};
	[39] = {map=1005,x=-5,y=-45};	
	[40] = {map=1006,x=-36,y=102};	
	[41] = {map=1006,x=-36,y=102};
	[42] = {map=1006,x=49,y=87};
	[43] = {map=1006,x=25,y=70};	
	[44] = {map=1006,x=48,y=-19};	
	[45] = {map=1006,x=22,y=-67};	
	[46] = {map=1006,x=22,y=-67};	
	[47] = {map=1006,x=2,y=-14};
	[48] = {map=1006,x=-86,y=-94};	
	[49] = {map=1006,x=-86,y=-94};	
	[50] = {map=1007,x=-83,y=56};	
	[51] = {map=1007,x=-83,y=56};	
	[52] = {map=1007,x=-3,y=-13};	
	[53] = {map=1007,x=-3,y=-13};
	[54] = {map=1007,x=33,y=-84};	
	[55] = {map=1007,x=-48,y=-91};	
	[56] = {map=1007,x=-28,y=52};	
	[57] = {map=1007,x=-28,y=52};
	[58] = {map=1007,x=-10,y=73};	
	[59] = {map=1007,x=-83,y=-96};	
	[60] = {map=1008,x=-92,y=27};	
	[61] = {map=1008,x=-21,y=-29};	
	[62] = {map=1008,x=26,y=-66};	
	[63] = {map=1008,x=68,y=-53};	
	[64] = {map=1008,x=38,y=-11};	
	[65] = {map=1008,x=84,y=64};	
	[66] = {map=1008,x=84,y=64};	
	[67] = {map=1008,x=-33,y=45};
	[68] = {map=1008,x=-44,y=55};
	[69] = {map=1008,x=-41,y=74};	
}

--任务固定文本
_G.TaskStaticText = {
	IsLog = false;
	getridof = "cannot open";
	SlowTextTime = 0;--缓动文字时间配置
	Korea = false;--是不是韩国版本
	-------------------------------
	RewardValue = [[<font color="#ffffff">%s</font>]];--数值奖励显示颜色
	LowLevel = [[（等级不足）]];
	UnFitColor = "#ff0000";
	UnFold = "<img src='img://UnFold.png'> ";
	Fold = "<img src='img://Fold.png'> ";
	BeginLine = [[]];
	EndLine = [[<br/>]];
	CanAcceptMap = [[所在地：%s]];
	CanAcceptName = [[委托人：%s]];

	MainCanAccept = [[达到%d级(%d/%d)]];
	MainCanAccept2 = [[少侠可通过：]]..set_fun_link("闭关",21).."%s";
	MainCanAccept3 = "";
	MainCanAccept4 = [[获取经验，提升等级]];

	AcceptNpc = [[<font size="14" color="#ffcd06">委托者:</font>]];
	CompleteNpc = [[<font size="14" color="#ffcd06">交付者:</font>]];
	Money = [[<font color="#ffcd06" size="14">银两:</font>]];--银两奖励
	MoneyValue = [[<font size="14">%s<br/></font>]];
	Exp = [[<font color="#ffcd06" size="14"> 经验:</font>]];--经验奖励
	ExpValue = [[<font size="14">%s<br/></font>]];
	Pneuma = [[<font color="#ffcd06" size="14">真气:</font>]];--真气奖励
	PneumaValue = [[<font size="14">%s<<br/>/font>]];
	Xiayi = [[<font color="#ffcd06" size="14">风云声望:</font>]];--真气奖励
	XiayiValue = [[<font size="14">%s<<br/>/font>]];
	Item = [[<font color="#ffcd06" size="14">物品:</font>]];--物品奖励
	ItemValue = [[<font size="15">%s*%s</font>]];
	Reward = [[<font color="#ffb401"></font>]];
	AcceptTask = [[接受任务]];
	CompleteTask = [[完成任务]];
	Cut = " ";
	QuickAccept = [[接受任务: %s]];
	QuickComplete = [[完成任务: %s]];
	HelpAccept = [[<p align='center'>你接受了任务 <font color="#00ff00">%s</font> </p><p align='center'>点击 <font color="#00ff00">自动前往</font> </p><p align='center'>会自动寻路至任务执行地点</p>]];
	HelpComplete = [[<p align='center'>你完成了任务 <font color="#00ff00">%s</font> </p><p align='center'>点击 <font color="#00ff00">自动前往</font> </p><p align='center'>会自动寻路至任务提交地点</p>]];
	Loop = "[第%s环]";
	UIDailyTxt = [[日环任务每10环可获得特殊奖励，每天可做20环]];
	UIDailyInfo = [[[第%s环]每日24点刷新日环任务]];
	UIWeeklyTxt = [[周环任务每10环可获得特殊奖励，每周可做100环]];
	UIWeeklyInfo = [[[第%s环]每周日24点刷新周环任务]];
	TaskNum = [[任务数量:%s/%s]];
}

_G.PaiHangBang = {
	[1] = "等级榜",
	[2] = "财富榜",
	[3] = "连斩榜",
	[4] = "经脉榜",
	[5] = "五行榜",
	[6] = "杀手榜",
	[7] = "成就榜",
	[8] = "BOSS击杀榜",
	[9] = "宝甲榜",
	[10] = "实战榜",
	[11] = "坐骑榜",
	[12] = "名剑榜",
	[13] = "战力榜",	
}

--任务不弹自动寻路配置
_G.TaskForbidWindowConfig = {
	[5016] = 1;
	[20102] = 1;
	[11066] = 1;
	[2140] = 1;
}
