--排行榜消息定义
_G.ChartParseList = function(tabData,tabFormat)
	local tabList = {}
	for k,v in pairs(tabData or {}) do
		if type(v) == 'table' then
			local tabTemp = {}
			for oldkey,value in pairs(v) do
				local newkey = tabFormat[oldkey]
				if newkey then
					tabTemp[newkey] = value
				end
			end
			tabList[k] = tabTemp
		end
	end
	return tabList
end
_G.ChartListMsgStN = {
	['dwRoleID']	= 1,
	['szRoleName']	= 2,
	['dwNumber']	= 3,
	['dwValue']		= 4,
	['dwChange']	= 5,
}
_G.ChartListMsgNtS = {
	[1] = 'dwRoleID',
	[2] = 'szRoleName',
	[3] = 'dwNumber',
	[4] = 'dwValue',
	[5] = 'dwChange',
}
_G.ChartRoleMsgStN = {
	['dwNumber']	= 1,
	['dwValue']		= 2,
	['dwChange']	= 3,
}
_G.ChartRoleMsgNtS = {
	[1] = 'dwNumber',
	[2] = 'dwValue',
	[3] = 'dwChange',
}
_G.ChartHeadMsgStN = {
	['dwRoleID']	= 1,
	['szRoleName']	= 2,
	['dwLevel']		= 3,
	['dwIncoID']	= 4,
}
_G.ChartHeadMsgNtS = {
	[1] = 'dwRoleID',
	[2] = 'szRoleName',
	[3] = 'dwLevel',
	[4] = 'dwIncoID',
}
_G.ChartStarMsgStN = {
	['dwRoleID']	= 1,
	['szRoleName']	= 2,
	['dwLevel']		= 3,
	['dwIncoID']	= 4,
	['dwType']      = 5,
}
_G.ChartStarMsgNtS = {
	[1] = 'dwRoleID',
	[2] = 'szRoleName',
	[3] = 'dwLevel',
	[4] = 'dwIncoID',
	[5] = 'dwType',
}
--排行榜类型枚举
_G.enChartType = {
	eLevel		= 1,	--等级排行榜
	eWeath		= 2,	--财富排行榜
	eCombo		= 3,	--连斩排行榜
	ePulse		= 4,	--经脉排行榜
	eElement	= 5,	--五行排行榜
	eKiller 	= 6,	--残杀排行榜
	eAchievement= 7,	--成就排行榜
	eBoss		= 8,	--任侠排行榜
	eAmulet		= 9,	--宝甲排行榜
	eBourn		= 10,	--实战排行榜
	eMount		= 11,	--坐骑排行榜
	eSword		= 12,	--名剑排行榜
	ePower		= 13,	--战力排行榜
}

--排行榜启用
_G.ChartSwitch = {
	enChartType.ePower,
	enChartType.eLevel,
	enChartType.eWeath,
	enChartType.eMount,
	enChartType.eCombo,
	enChartType.ePulse,
	--enChartType.eElement,
	enChartType.eKiller,
	enChartType.eAchievement,
	enChartType.eBoss,
	enChartType.eAmulet,
	enChartType.eSword,
	enChartType.eBourn,
}

local CAlarmTaskCycleType = {
	eMinute = 1,--周期单位分钟
	eHour	= 2,--周期单位小时
	eDay	= 3,--周期单位天
	eWeek	= 4,--周期单位周
	eMonth  = 5,--周期单位月
	eYear	= 6,--周期单位年
};

-- 排行榜刷新时间配置(*注意: 请配置成间隔时间*)
_G.ChartAlarmClock = {
    [enChartType.ePower] = {
        Time = {dwTime = "00:01"};
        CycleType = CAlarmTaskCycleType.eDay;
    };
    [enChartType.eLevel] = {
        Time = {dwTime = "00:02"};
        CycleType = CAlarmTaskCycleType.eDay;
    };
    [enChartType.eWeath] = {
        Time = {dwTime = "00:03"};
        CycleType = CAlarmTaskCycleType.eDay;
    };
    [enChartType.eMount] = {
        Time = {dwTime = "00:04"};
        CycleType = CAlarmTaskCycleType.eDay;
    };
    [enChartType.eCombo] = {
        Time = {dwTime = "00:05", dwWeek = "0"};
        CycleType = CAlarmTaskCycleType.eWeek;
    };
    [enChartType.ePulse] = {
        Time = {dwTime = "00:06"};
        CycleType = CAlarmTaskCycleType.eDay;
    };
    [enChartType.eKiller] = {
        Time = {dwTime = "00:07", dwWeek = "0"};
        CycleType = CAlarmTaskCycleType.eWeek;
    };
    [enChartType.eAchievement] = {
        Time = {dwTime = "00:08"};
        CycleType = CAlarmTaskCycleType.eDay;
    };
    [enChartType.eBoss] = {
        Time = {dwTime = "00:09", dwWeek = "0"};
        CycleType = CAlarmTaskCycleType.eWeek;
    };
    [enChartType.eAmulet] = {
        Time = {dwTime = "00:10"};
        CycleType = CAlarmTaskCycleType.eDay;
    };
    [enChartType.eSword] = {
        Time = {dwTime = "00:11"};
        CycleType = CAlarmTaskCycleType.eDay;
    };
    [enChartType.eBourn] = {
        Time = {dwTime = "00:12"};
        CycleType = CAlarmTaskCycleType.eDay;
    };
};

-- 排行榜排行榜数据更新时间(*注意: 请不要与某个排行榜时间相同*)
_G.CharRefreshTime = "00:14";

--排行榜设置
  --dwLevel: 开放等级
  --szMainName: 榜单名
  --szMainIcon: 榜单图标
  --szValueName: 数值名
  --dwMinValue: 最低上榜需求
  --dwTitleCount: 前几名有称号
_G.ChartCfg = {
	[enChartType.ePower]		= { szMainName = '战斗力榜',szMainIcon = 'phb_zdl_01.png',szValueName = '综合战斗力',dwLevel = 10,dwTitleCount = 1,dwMinValue = 5000 },	
	[enChartType.eLevel]		= { szMainName = '等级榜',szMainIcon = 'phb_dengji_01.png',szValueName = '等级',dwLevel = 10,dwTitleCount = 1,dwMinValue = 60000 },
	[enChartType.eWeath]		= { szMainName = '财富榜',szMainIcon = 'phb_caifu_01.png',szValueName = '财富',dwLevel = 10,dwTitleCount = 1,dwMinValue = 200000 },
	[enChartType.eMount]		= { szMainName = '坐骑榜',szMainIcon = 'phb_zq_01.png',szValueName = '坐骑战斗力',dwLevel = 10,dwTitleCount = 1,dwMinValue = 50 },
	[enChartType.eCombo]		= { szMainName = '连斩榜',szMainIcon = 'phb_lianzhan_01.png',szValueName = '连斩',dwLevel = 10,dwTitleCount = 1,dwMinValue = 400 },
	[enChartType.ePulse]		= { szMainName = '经脉榜',szMainIcon = 'phb_jingmai_01.png',szValueName = '层数',dwLevel = 10,dwTitleCount = 1,dwMinValue = 10 },
	[enChartType.eElement]		= { szMainName = '五行榜',szMainIcon = 'zz-wxb.png',szValueName = '等级',dwLevel = 10,dwTitleCount = 1,dwMinValue = 20 },
	[enChartType.eKiller]		= { szMainName = '残杀榜',szMainIcon = 'phb_shashou_01.png',szValueName = '击杀',dwLevel = 10,dwTitleCount = 1,dwMinValue = 10 },
	[enChartType.eAchievement]	= { szMainName = '成就榜',szMainIcon = 'phb_chengjiu_01.png',szValueName = '成就',dwLevel = 10,dwTitleCount = 1,dwMinValue = 100 },
	[enChartType.eBoss]			= { szMainName = '任侠榜',szMainIcon = 'phb_boss_01.png',szValueName = '击杀',dwLevel = 35,dwTitleCount = 1,dwMinValue = 5 },
	[enChartType.eAmulet]		= { szMainName = '宝甲榜',szMainIcon = 'phb_baojia_01.png',szValueName = '宝甲战斗力',dwLevel = 55,dwTitleCount = 1,dwMinValue = 50 },
	[enChartType.eSword]		= { szMainName = '名剑榜',szMainIcon = 'phb_mingjian_01.png',szValueName = '名剑战斗力',dwLevel = 47,dwTitleCount = 1,dwMinValue = 50 },
	[enChartType.eBourn]		= { szMainName = '实战榜',szMainIcon = 'phb_jingjie_01.png',szValueName = '实战战斗力',dwLevel = 10,dwTitleCount = 1,dwMinValue = 100 },
}

--排行榜头像配置
_G.ChartIconCfg = {
	[0] = { w = 70, h = 72 },
	[1] = { w = 70, h = 72 },
	[2] = { w = 55, h = 57 },
	[3] = { w = 55, h = 57 },
	[4] = { w = 40, h = 41 },
	[5] = { w = 40, h = 41 },
}

--排行榜详解设置
_G.ChartTextCfg = {
	[enChartType.ePower]		= [[此榜所录了战斗力非凡的一百位顶级高手。<br>鼠标移动到左上角战斗力处，可查看您当前战斗力详细信息。]],	
	[enChartType.eLevel]		= [[此榜所录了等级拔尖的一百位顶级高手。<br>成为<font color='#31cf32'><u><a href="asfunction:hrefevent,CUIVip:Open()">武林贵宾(VIP)</a></u></font>,享尊贵特权,可比寻常侠士汲取更多的战斗经验,总有一天,你也能榜上有名！]],
	[enChartType.eWeath]		= [[此榜所录了家财万千的一百位豪士富翁。<br>行商<font color='#31cf32'><u><a href="asfunction:hrefevent,CUIPacket:DoOpen(1)">摆摊</a></u></font>,若能善加经营,腰缠万贯指日可待,总有一天,你也能榜上有名！]],
	[enChartType.eCombo]		= [[<font color='#f15d27'>每周日24点刷新榜单，请及时领取排名奖励。</font><br>此榜所录了刀下亡魂不计其数的一百位勇武之士。<br>以煞元激发自身潜力,可施展出威力无匹的无双秘技。]],
	[enChartType.ePulse]		= [[此榜所录了经脉贯通的一百位修身名家。<br>修习武道,亦是强身健体,奇经八脉与内家修为密切相关,若想修成刀枪不入,百毒难侵的金刚之躯,还需逐步冲通<font color='#31cf32'><u><a href="asfunction:hrefevent,CUIRole:OpenPanel(3)">奇经八脉</a></u></font>,总有一天,你也能榜上有名！]],
	[enChartType.eElement]		= [[此榜所录了真气丰沛、丹田充盈的一百位内家大才。<br>积蓄<font color='#31cf32'><u><a href="asfunction:hrefevent,CUIRole:OpenPanel(1)">五行真气</a></u></font>、扩充丹田,五行真气可助您提升经脉、研习顶级武学,总有一天,你也能榜上有名！]],
	[enChartType.eKiller]		= [[<font color='#f15d27'>每周日24点刷新榜单，请及时领取排名奖励。</font><br>此榜所录了杀人如麻、好勇斗狠的一百位凶神煞星。<br>人在江湖,身不由己。正所谓“文无第一,武无第二”,不愿成为他人刀下鬼,便要有自保之力,以杀止杀。]],
	[enChartType.eAchievement]	= [[此榜所录了声名远播、资深德劭的一百位望族名士。<br>知难而进,<font color='#31cf32'><u><a href="asfunction:hrefevent,CUIAchievementWnd:Show('AchievementWnd')">成就</a></u></font>威名,不仅是对实力的提升,亦是意志力的修行,总有一天,你也能榜上有名！]],
	[enChartType.eBoss]			= [[<font color='#f15d27'>每周日24点刷新榜单，请及时领取排名奖励。</font><br>此榜所录了勇往直前、奋勇无畏的一百位望族名士。<br><font color='#31cf32'><u><a href="asfunction:hrefevent,CUIMissionDailyEx:OpenPanel(3)">活动</a></u></font>面板中记载了世界各处密境的BOSS,击败他们乃是实力的象征！]],
	[enChartType.eAmulet]		= [[此榜所录了刀枪不入、宝甲护体的一百位望族名士。<br><font color='#31cf32'><u><a href="asfunction:hrefevent,CAmuletSystem:Show()">修炼宝甲</a></u></font>,可让你在战斗中更胜一筹]],
	[enChartType.eSword]		= [[此榜所录了无坚不摧、青锋破敌的一百位望族名士。<br><font color='#31cf32'><u><a href="asfunction:hrefevent,CMainPageSystem:DoSwordOper()">修炼名剑</a></u></font>,可对目标造成特殊伤害]],
	[enChartType.eBourn]		= [[此榜收录了身经百战，卓然出众的一百位武林精英。<br>身在江湖，岂能不争。唯有从<font color='#31cf32'><u><a href="asfunction:hrefevent,CUIRole:OpenPanel(2)">实战</a></u></font>之中，才能领悟武道的终极境界！]],
	[enChartType.eMount]		= [[此榜所录了奇珍异兽的一百位拥有者。<br><font color='#31cf32'><u><a href="asfunction:hrefevent,CMountSystem:OpenMainUI()">坐骑</a></u></font>乃是与人通灵的动物,与主人心意相同。更能为其提供属性,拥有一只神骑无不是武林人士之梦！]],
}

--排行榜广播设置
  --szTime: 广播时间
  --szInfo: 正常广播内容
  --szZero: 首日广播内容
_G.ChartBroadCastCfg = {
	[enChartType.ePower]		= { szTime = '12:00', szInfo = '风云榜告示:战斗力排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:战斗力排行榜今日无一人上榜,虚位以待各路英雄！'},	
	[enChartType.eLevel]		= { szTime = '12:30', szInfo = '风云榜告示:等级排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:等级排行榜今日无一人上榜,虚位以待各路英雄！'},
	[enChartType.eWeath]		= { szTime = '13:00', szInfo = '风云榜告示:财富排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:财富排行榜今日无一人上榜,虚位以待各路英雄！'},
	[enChartType.eCombo]		= { szTime = '13:30', szInfo = '风云榜告示:连斩排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:连斩排行榜今日无一人上榜,虚位以待各路英雄！'},
	[enChartType.ePulse]		= { szTime = '14:00', szInfo = '风云榜告示:经脉排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:经脉排行榜今日无一人上榜,虚位以待各路英雄！'},
	[enChartType.eElement]		= { szTime = '14:30', szInfo = '风云榜告示:五行排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:五行排行榜今日无一人上榜,虚位以待各路英雄！'},
	[enChartType.eKiller]		= { szTime = '15:00', szInfo = '风云榜告示:杀手排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:杀手排行榜今日无一人上榜,虚位以待各路英雄！'},
	[enChartType.eAchievement]	= { szTime = '15:30', szInfo = '风云榜告示:成就排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:成就排行榜今日无一人上榜,虚位以待各路英雄！'},
	[enChartType.eBoss]			= { szTime = '16:00', szInfo = '风云榜告示:击杀排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:击杀排行榜今日无一人上榜,虚位以待各路英雄！'},
	[enChartType.eAmulet]		= { szTime = '16:30', szInfo = '风云榜告示:宝甲排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:宝甲排行榜今日无一人上榜,虚位以待各路英雄！'},
	[enChartType.eSword]		= { szTime = '17:00', szInfo = '风云榜告示:名剑排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:名剑排行榜今日无一人上榜,虚位以待各路英雄！'},
	[enChartType.eBourn]		= { szTime = '17:30', szInfo = '风云榜告示:实战排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:实战排行榜今日无一人上榜,虚位以待各路英雄！'},
	[enChartType.eMount]		= { szTime = '18:00', szInfo = '风云榜告示:坐骑排行榜今日之三甲为:#1,#2,#3',szZero = '风云榜告示:坐骑排行榜今日无一人上榜,虚位以待各路英雄！'},
}

--玩家被杀广播内容
  --@A: 被杀玩家
  --@B: 杀人玩家
  --@C: 所在地图
_G.ChartKillNoticeCfg = {
	[enChartType.ePower]		= { szInfo = '@B 在 @C 神勇的打败等级榜上的 @A,真是出人意料！'},	
	[enChartType.eLevel]		= { szInfo = '@B 在 @C 神勇的打败等级榜上的 @A,真是出人意料！'},
	[enChartType.eWeath]		= { szInfo = '@B 在 @C 神勇的打败财富榜上的 @A,真是出人意料！'},
	[enChartType.eCombo]		= { szInfo = '@B 在 @C 神勇的打败连斩榜上的 @A,真是出人意料！'},
	[enChartType.ePulse]		= { szInfo = '@B 在 @C 神勇的打败经脉榜上的 @A,真是出人意料！'},
	[enChartType.eElement]		= { szInfo = '@B 在 @C 神勇的打败五行榜上的 @A,真是出人意料！'},
	[enChartType.eKiller]		= { szInfo = '@B 在 @C 神勇的打败杀手榜上的 @A,真是出人意料！'},
	[enChartType.eAchievement]	= { szInfo = '@B 在 @C 神勇的打败成就榜上的 @A,真是出人意料！'},
	[enChartType.eBoss]			= { szInfo = '@B 在 @C 神勇的打败击杀榜上的 @A,真是出人意料！'},
	[enChartType.eAmulet]		= { szInfo = '@B 在 @C 神勇的打败宝甲榜上的 @A,真是出人意料！'},
	[enChartType.eSword]		= { szInfo = '@B 在 @C 神勇的打败宝甲榜上的 @A,真是出人意料！'},	
	[enChartType.eBourn]		= { szInfo = '@B 在 @C 神勇的打败实战榜上的 @A,真是出人意料！'},
	[enChartType.eMount]		= { szInfo = '@B 在 @C 神勇的打败坐骑榜上的 @A,真是出人意料！'},
}

--玩家排行榜称号
  --dwNumber: 获得称号的名次
  --dwTitleID: 称号ID
_G.ChartTitleCfg = {
	[enChartType.ePower]		= { dwNumber = 10, dwTitleID = 10013},
	[enChartType.eLevel]		= { dwNumber = 10, dwTitleID = 10001},
	[enChartType.eWeath]		= { dwNumber = 10, dwTitleID = 10004},
	[enChartType.eCombo]		= { dwNumber = 10, dwTitleID = 10008},
	[enChartType.ePulse]		= { dwNumber = 10, dwTitleID = 10007},
	[enChartType.eElement]		= { dwNumber = 10, dwTitleID = 10012},
	[enChartType.eKiller]		= { dwNumber = 10, dwTitleID = 10010},
	[enChartType.eAchievement]	= { dwNumber = 10, dwTitleID = 10005},
	[enChartType.eBoss]			= { dwNumber = 10, dwTitleID = 10003},
	[enChartType.eAmulet]		= { dwNumber = 10, dwTitleID = 10002},
	[enChartType.eSword]		= { dwNumber = 10, dwTitleID = 10006},	
	[enChartType.eBourn]		= { dwNumber = 10, dwTitleID = 10011},
	[enChartType.eMount]		= { dwNumber = 10, dwTitleID = 10014},
}

--玩家排行榜自身数值显示
_G.ChartShowMainValue = function(name,swf)
	swf.MyShuZhi1._visible = false
	swf.MyShuZhi2._visible = false
	swf.MyShuZhi3._visible = false
	swf.MyShuZhi4._visible = false
	swf.MyShuZhi5._visible = false
	swf.MyShuZhi6._visible = false
	swf.MyShuZhi7._visible = false
	swf.MyShuZhi8._visible = false
	swf.MyShuZhi9._visible = false
	swf.MyShuZhi10._visible = false
	swf.MyShuZhi11._visible = false
	if name == '战斗力榜' then
		swf.MyShuZhi1._visible = true
		swf.MyShuZhi1.GradeMc.value = ''..G_GetScoreInfoAll(CSkillSystem:CountMyBattleScoreInfo())
	elseif name == '等级榜' then
		swf.MyShuZhi1._visible = true
		swf.MyShuZhi1.GradeMc.value = ''..G_GetScoreInfoAll(CSkillSystem:CountMyBattleScoreInfo())
	elseif name == '财富榜' then
		swf.MyShuZhi2._visible = true
		swf.MyShuZhi2.GradeMc.value = ''..CPacket:GetMoney()
	elseif name == '连斩榜' then
		swf.MyShuZhi3._visible = true
		swf.MyShuZhi3.GradeMc.value = ''..CSkillSystem:GetInfo().dwCaromCount	
	elseif name == '经脉榜' then
		swf.MyShuZhi4.MyNum.htmlText = '您当前经脉层数为:'
		swf.MyShuZhi4.MyNum1.htmlText = [[<font color='#FEB200'>]]..CPulseSystem:GetPulseTotalNum()..'/320层'..[[</font>]]
		swf.MyShuZhi4._visible = true
		--swf.MyShuZhi4.GradeMc.value = ''..CSkillSystem:CountMyBattleScoreInfo().dwPulseScore		    
	--elseif name == '五行榜' then
	elseif name == '残杀榜' then
		swf.MyShuZhi5._visible = true
		swf.MyShuZhi5.GradeMc.value = ''..CDataCenterSystem:GetData('dwKillPlayer')		
	elseif name == '任侠榜' then
		swf.MyShuZhi7._visible = true
		swf.MyShuZhi7.GradeMc.value = ''..CDataCenterSystem:GetData('dwKillBoss')	
	elseif name == '成就榜' then
		swf.MyShuZhi6._visible = true
		swf.MyShuZhi6.GradeMc.value = ''..CAchievementSystem:GetCompleteNum()		
	elseif name == '宝甲榜' then
		swf.MyShuZhi8.MyNum.htmlText = '您当前的宝甲为:'
		swf.MyShuZhi8.MyNum1.htmlText = [[<font color='#278cf1'>]]..AmuletLevelConfig[CAmuletSystem:GetLevel()].strName..[[</font>]]
		swf.MyShuZhi8._visible = true
		--swf.MyShuZhi8.GradeMc.value = ''..CSkillSystem:CountMyBattleScoreInfo().dwAmuletScore		
	elseif name == '名剑榜' then
		swf.MyShuZhi9.MyNum.htmlText = '您当前的名剑为:'
		swf.MyShuZhi9.MyNum1.htmlText = [[<font color='#278cf1'>]]..CSwordSystem:GetSwordName()..[[</font>]]
		swf.MyShuZhi9._visible = true
		--swf.MyShuZhi9.GradeMc.value = ''..CSkillSystem:CountMyBattleScoreInfo().dwSwordScore		
	elseif name == '实战榜' then
		swf.MyShuZhi10.MyNum.htmlText = '您当前的实战为:'
		swf.MyShuZhi10.MyNum1.htmlText = [[<font color='#FEB200'>]]..BournConfig.Bourn[CBournSystem:GetBournLv()].nametext..[[</font>]]
		swf.MyShuZhi10._visible = true
		--swf.MyShuZhi10.GradeMc.value = ''..CSkillSystem:CountMyBattleScoreInfo().dwBournScore		
	elseif name == '坐骑榜' then
		swf.MyShuZhi11.MyNum.htmlText = '您当前的坐骑为:'
		swf.MyShuZhi11.MyNum1.htmlText = ''..CMountSystem:GetActiveMountName()
		swf.MyShuZhi11._visible = true
		--swf.MyShuZhi11.GradeMc.value = ''..CSkillSystem:CountMyBattleScoreInfo().dwMountScore    
	end
end

--玩家排行榜榜内数值显示
_G.ChartShowChartValue = function(name,value)
	if name == '战斗力榜' then
		
	elseif name == '等级榜' then
		value = RoleUpLevelConfig:ExpToLevel(value)
	elseif name == '财富榜' then
		
	elseif name == '连斩榜' then
		
	elseif name == '经脉榜' then
		
	elseif name == '任侠榜' then
		
	elseif name == '成就榜' then
		
	elseif name == '宝甲榜' then
		
	elseif name == '名剑榜' then
		
	elseif name == '实战榜' then
		
	elseif name == '坐骑榜' then
		
	end
	return value;
end
