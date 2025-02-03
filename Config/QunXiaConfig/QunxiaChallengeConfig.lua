--群侠挑战配置

_G.ChallengeQunXiaConfig = 
{
	ResetTime = "06:00";
	--最大总挑战次数上限 包括道具增加的次数 vip增加的次数
	MaxChallengeCount = 30;
	
	--总挑战次数

	BaseChallengeCount = 6;

	--vip增加的总挑战次数
	VipAddCount = 3;
	
	--计算最大总挑战次数
	CalMaxChallengeCount = function(isVip)
		local retCount = _G.ChallengeQunXiaConfig.BaseChallengeCount;
		if isVip then
			retCount = retCount + _G.ChallengeQunXiaConfig.VipAddCount;
		end
		return retCount;
	end;
	
	--是否满足挑战条件
	IsCanChallenge = function(qunXiaID, objPlayer)
		
	end;
	
	--威望颜色值
	PrestigeColor = {
		[1] = "'#FFFFFF'",
		[2] = "'#7FFF00'",
		[3] = "'#87CEEB'",
		[4] = "'#A020F0'",
		[5] = "'#FFFF00'",
		[6] = "'#FFE384'",
	};
	
	--显示群侠列表([对应ui中位置索引] = {群侠id,是否开放群侠})
	QunXiaShowList = {
		[1] = {20002001,true};
		[2] = {20002002,true};
		[3] = {20002003,true};
		[4] = {20002004,true};
		[5] = {20002005,true};
		[6] = {20002006,true};
		[7] = {20002007,true};
		[8] = {20002008,true};
		[9] = {20002009,true};
		[10] = {20002010,true};
		[11] = {20002011,true};
		[12] = {20002012,true};
		[13] = {20002013,true};
		[14] = {20002014,true};
		[15] = {20002015,true};
		[16] = {20002016,false};
		[17] = {20002017,false};
		[18] = {20002018,false};
		[19] = {20002019,false};
		[20] = {20002020,false};
		[21] = {20002021,false};
		[22] = {20002022,false};
		[23] = {20002023,false};
		[24] = {20002024,false};
		[25] = {20002025,false};
		[26] = {20002026,false};
		[27] = {20002027,false};
		[28] = {20002028,false};
		[29] = {20002029,false};
	};
	
	--检测是否是群侠副本
	IsQunXiaFB = function(duplID)
		local isQunXia = false;
		for key,roleInfo in ipairs(_G.ChallengeQunXiaConfig.QunXiaShowList) do
			if roleInfo and roleInfo[1] then
				local roleId = roleInfo[1];
				if duplID == _G.QunXiaListConfig[roleId].duplID then
					isQunXia = true;
					break;
				end
			end
		end
		return isQunXia;
	end;
	
	--获取当前群侠开放状态
	IsOpenFB = function(dwRoleId)
		for key,roleInfo in ipairs(_G.ChallengeQunXiaConfig.QunXiaShowList) do
			if dwRoleId and roleInfo and roleInfo[1] then
				if dwRoleId == roleInfo[1] then
					return roleInfo[2];
				end
			end
		end
	end;
	
	--挑战失败奖励
	--uLevel:玩家等级,dwDuplID:副本Id
	failAwards = function(uLevel,dwDuplID)
		local dwMoney = 0;
		local dwGold = 0;
		local dwZhenqi = 0;
		local dwExp = 0;
		
		dwZhenqi = 3000;
		dwExp = _G.RoleUpLevelConfig[uLevel].dwFuBenExp*(9+ math.floor ( uLevel/10 )*0.2)*0.75;
		
		return {PassMoney = dwMoney, Gold = dwGold, Zhenqi = dwZhenqi, Exp = dwExp};
	end;			
	
	--icon图片大小
	iconSize = {w = 48,h = 48},
	szChallengeTip = "<font color='#FFFF00'>点击按钮开始挑战所选群侠</font>", --挑战按钮提示
	szNotSelectMan = "<font color='#FFFFFF'>您还未选择挑战的群侠</font>", -->未选中挑战对象
	szMaxCountPer = "<font color='#FFFFFF'>本日挑战此群侠已达次数上限</font>", -->群侠被挑战次数已满
	szNotCount = "<font color='#FFFFFF'>大侠今日挑战次数已用尽</font>", -->挑战次数用完
	szNotPrestige = "<font color='#FFFFFF'>您的当前威望不足以挑战此群侠</font>", -->玩家威望不足
	szNotDouShenLing = "<font color='#FFFFFF'>您的斗神令不足，无法挑战该群侠</font>", -->玩家斗神令不足
	szFlushText = "<font color='#FF0000' size='14'>群侠挑战次数每日6:00点刷新</font><font color='#FFFF00' size='14'>（VIP每日额外增加3次挑战机会）</font><font color='#FF0000' size='14'>玩家可通过战胜群侠获得丰厚奖励！</font>", -->刷新提示
	szNotAuthority = "<font color='#FFFF00'>群侠挑战尚未开放，需人物达到60级</font>", -->权限未达到提示
	--szEntered = "<font color='#FFFF00'>您所在的场景无法挑战群侠！</font>",
	szFighting = "<font color='#FFFF00'>您正处于战斗中,无法退出副本</font>", -->战斗中不能退出提示
	szNotOpen = "<font color='#FFFFFF'>该群侠即将开放,敬请期待！</font>", -->群侠还未开放
	szBroadcast = {
		[1] = "恭喜大侠%s 成功挑战隐藏群侠%s",	-->走马灯公告内容
		[2] = "恭喜大侠%s 成功挑战群侠%s",	-->系统公告内容
	},
	--根据人物Id返回相关群侠信息
	GetSwordsmanInfo = function(dwRoleId)
		if not dwRoleId then return; end
	
		if _G.QunXiaListConfig then
			return _G.QunXiaListConfig[dwRoleId];
		end
	end;
};

--道具ID映射表
_G.QunXiaItemConfig = 
{
	--【物品ID】 = {威望等级, 增加次数}
	[5500082] = {prestigeLevel = 0, addCount = 1,},
}

--挑战群侠查询配置文件
_G.FindQunXiaConfig = 
{
	iconSize = {w = 12,h = 12},
	xiaKeLingItem = {enumId = 5500082,costNum = 1,};
	szTodayPercent = "<font color='#FFFF00'>本日总计: %s/%s</font>", -->本日总计
	szMingcheng = "<font color='#FFFFFF'>%s&lt;%s&gt;</font>", -->名称和称谓
	szPrestige= "<font color='#DCB857' size='14'>%s</font>", -->威望等级
	--挑战次数
	ChallengeCountFormat = {
		[1] = "<font color='#FFFFFF' size='14'>%s</font>",	-->威望不够
		[2] = "<font color='#00FF00' size='14'>%s/%s</font>",	-->挑战次数未满
		[3] = "<font color='#FF0000' size='14'>%s/%s</font>",	-->挑战次数满
	};
	szQunXiaLing = "<font color='#FFFF00'>您是否愿意消耗斗神令增加挑战总次数</font>", -->群侠令消耗提示信息
	szMaxEnought = "<font color='#FFFF00'>您已达本日挑战次数上限，无法继续使用</font>", -->无法使用斗神令增加次数
	szNotEnought = "<font color='#FFFF00'>您的斗神令不足，无法增加挑战总次数</font>", -->没有足够的斗神令
	szCostBtTips = "<font color='#FFFF00'>您可通过点击此按钮使用斗神令增加挑战总次数</font>",	-->消耗按钮提示内容
	szSortBtTips = "<font color='#FFFF00'>您可通过点击此按钮对查看信息进行升降序排序切换浏览</font>",	-->排序按钮提示内容
	szCDBtTips = "<font color='#FFFF00'>您可通过点击此按钮切换显示群侠挑战信息</font>",	-->冷却按钮提示内容
	
	--获取侠客令信息
	GetXiaKeLingInfo = function()
		if _G.FindQunXiaConfig.xiaKeLingItem then
			return _G.FindQunXiaConfig.xiaKeLingItem;
		end
	end;
};

--挑战群侠提示框配置文件
_G.TipsQunXiaConfig = 
{
	iconSize = {w = 24,h = 24},
	szName = "<font color='#FFFF00' size='15'>[群侠]</font><font color='#FFFFFF' size='15'>%s</font>", -->群侠名称
	szNeedPrestige = "<font color='#FFFFFF' size='14'>挑战所需威望: </font><font color=%s>%s</font>", -->挑战所需威望
	szCurPrestige = "<font color='#FFFFFF'>当前江湖威望: </font><font color=%s>%s</font>", -->当前江湖威望
	szTodaySumNum = "<font color='#FFFFFF'>本日可挑战剩余次数  :</font><font color='#FFFF00'>%s</font><font color='#FFFFFF'>次</font>", -->本日可挑战剩余次数
	--本日可挑战群侠次数
	szTodayNum = {
		[1] = "<font color='#FFFFFF'>本日可挑战[群侠]%s:</font><font color='#FFFFFF'>%s/</font><font color='#00FF00'>%s</font><font color='#FFFFFF'>次</font>", -->挑战次数未满
		[2] = "<font color='#FFFFFF'>本日可挑战[群侠]%s:</font><font color='#FF0000'>%s/</font><font color='#FF0000'>%s</font><font color='#FFFFFF'>次</font>", -->挑战次数已满
		[3] = "<font color='#FFFFFF'>本日可挑战[群侠]%s:</font><font color='#FFFFFF'>%s/%s</font><font color='#FFFFFF'>次</font>", -->不可挑战
		};
	szAwardTitle = "<font >奖励物品:</font>", -->奖励物品标题
	szAwardExplain = "<font color='#4daeed'>挑战成功后随机掉落奖励物品</font>", -->奖励物品说明
};

--挑战群侠玩法说明配置文件
_G.ExplainQunXiaConfig = 
{
	szExplain = "<font color='#FFFFFF'>1.在群侠界面中可通过鼠标或↑↓←→回车来选择满足条件的群侠进行挑战</font></p><p><font color='#FFFFFF'>,挑战中如果被群侠击败，将无法使用千纸鹤复活，本次挑战失败.</p><p><font color='#FFFFFF'><font color='#FFFFFF'>2.群侠之战力非同凡响，传闻20万以上战力的侠士才有战胜他们的可能！若战败，亦不必灰心，可得到一些经验、真气之积累，以备日后卷土重来。</font></p><p><font color='#FFFFFF'>3.使用斗神令可额外增加当日挑战总次数</font></p><p><font color='#FFFFFF'>4.江湖威望达到名震江湖或以上威望级别的侠士需要手持群侠帖，方可挑战杨过和谢逊</font></p><p><font color='#FFFFFF'>5.群侠副本中使用自断心脉会导致挑战失败并且不会获得任何奖励.</font></p><p><font color='#FFFFFF'>6.进入群侠副本后如在1小时内未与群侠分出胜负,则会被传送出副本,并且无法获得奖励.</font>", -->玩法说明
};

--挑战群侠显示奖励界面文本配置
_G.QunXiaAwardsUIConfig = {
	szExp = "<font color='#00FF00' size='15'>经验</font>",
	szExpNum = "<font color='#00FF00' size='15'>%d</font>",
	szZhenqi = "<font color='#4daeed' size='15'>真气</font>",
	szZhenqiNum = "<font color='#4daeed' size='15'>%d</font>",
	szTodayAllRes = "<font color='#dcd9d9'>本日剩余挑战总次数：</font>",
	szTodayAllResNum = "<font color='#dcd9d9'>%d次</font>",
	szTodayResTitle = "<font color='#dcd9d9'>本日剩余挑战</font><font color='#FFFF00'>【群侠】%s:</font>",
	szTodayResNum = "<font color='#dcd9d9'>%d次</font>",
};