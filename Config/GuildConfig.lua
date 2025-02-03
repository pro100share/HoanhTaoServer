
--公会消息定义
_G.GuildParseTable = function(tabData,tabFormat)
	local tabTemp = {}
	for oldkey,value in pairs(tabData) do
		local newkey = tabFormat[oldkey]
		if newkey then
			tabTemp[newkey] = value
		end
	end
	return tabTemp
end
_G.GuildParseList = function(tabData,tabFormat)
	for k,v in pairs(tabData) do
		if type(v) == 'table' then
			local tabTemp = {}
			for oldkey,value in pairs(v) do
				local newkey = tabFormat[oldkey]
				if newkey then
					tabTemp[newkey] = value
				end
			end
			tabData[k] = tabTemp
		end
	end
	return tabData
end

_G.GuildInfoListMsgStN = {
	['dwGuildID']		= 1,
	['szGuildName']		= 2,
	['szLeaderName']	= 3,
	['dwLevel']			= 4,
	['dwMember']		= 5,
	['dwPower']			= 6,
	['dwDate']			= 7,
	['dwNumber']		= 8,
}
_G.GuildInfoListMsgNtS = {
	[1] = 'dwGuildID',
	[2] = 'szGuildName',
	[3] = 'szLeaderName',
	[4] = 'dwLevel',
	[5] = 'dwMember',
	[6] = 'dwPower',
	[7] = 'dwDate',
	[8] = 'dwNumber',
}
_G.GuildInfoMsgStN = {
	['dwGuildID']		= 1,
	['szGuildName']		= 2,
	['szLeaderName']	= 3,
	['dwLevel']			= 4,
	['dwMember']		= 5,
	['dwActive']		= 6,
	['szAnnounce']		= 7,
	['dwDate']			= 8,
	['dwNumber']		= 9,
	['dwPower']			= 10,
	['dwSignIn']		= 11,
}
_G.GuildInfoMsgNtS = {
	[1]		= 'dwGuildID',
	[2]		= 'szGuildName',
	[3]		= 'szLeaderName',
	[4]		= 'dwLevel',
	[5]		= 'dwMember',
	[6]		= 'dwActive',
	[7]		= 'szAnnounce',
	[8]		= 'dwDate',
	[9]		= 'dwNumber',
	[10]	= 'dwPower',
	[11]	= 'dwSignIn',
}
_G.GuildActiveMsgStN = {
	['dwGuildID']	= 1,
	['dwActive']	= 2,
	['dwPower']		= 3,
	['dwSignIn']	= 4,
}
_G.GuildActiveMsgNtS = {
	[1] = 'dwGuildID',
	[2] = 'dwActive',
	[3] = 'dwPower',
	[4] = 'dwSignIn',
}
_G.GuildResourceMsgStN = {
	['dwGuildID']	= 1,
	['dwMoney']		= 2,
	['dwItem1']		= 3,
	['dwItem2']		= 4,
	['dwItem3']		= 5,
	['dwItem4']		= 6,
}
_G.GuildResourceMsgNtS = {
	[1]	= 'dwGuildID',
	[2]	= 'dwMoney',
	[3]	= 'dwItem1',
	[4]	= 'dwItem2',
	[5]	= 'dwItem3',
	[6]	= 'dwItem4',
}
_G.GuildMemberListMsgStN = {
	['dwGuildID']		= 1,
	['dwRoleID']		= 2,
	['szRoleName']		= 3,
	['dwLevel']			= 4,
	['dwClass']			= 5,
	['dwDate']			= 6,
	['dwContribute']	= 7,
	['dwWelfare']		= 8,
	['dwRank']			= 9,
	['dwTitle']			= 10,
	['dwPower']			= 11,
	['bOnline']			= 12,
}
_G.GuildMemberListMsgNtS = {
	[1]		= 'dwGuildID',
	[2]		= 'dwRoleID',
	[3]		= 'szRoleName',
	[4]		= 'dwLevel',
	[5]		= 'dwClass',
	[6]		= 'dwDate',
	[7]		= 'dwContribute',
	[8]		= 'dwWelfare',
	[9]		= 'dwRank',
	[10]	= 'dwTitle',
	[11]	= 'dwPower',
	[12]	= 'bOnline',
}
_G.GuildDonateListMsgStN = {
	['dwRoleID']		= 1,
	['szRoleName']		= 2,
	['dwMoney']			= 3,
	['dwItem1']			= 4,
	['dwItem2']			= 5,
	['dwItem3']			= 6,
	['dwItem4']			= 7,
	['dwContribute']	= 8,
}
_G.GuildDonateListMsgNtS = {
	[1] = 'dwRoleID',
	[2] = 'szRoleName',
	[3] = 'dwMoney',
	[4] = 'dwItem1',
	[5] = 'dwItem2',
	[6] = 'dwItem3',
	[7] = 'dwItem4',
	[8] = 'dwContribute',
}
_G.GuildLogListMsgStN = {
	['dwLogID']		= 1,
	['dwGuildID']	= 2,
	['eType']		= 3,
	['szText']		= 4,
	['dwDate']		= 5,
}
_G.GuildLogListMsgNtS = {
	[1] = 'dwLogID',
	[2] = 'dwGuildID',
	[3] = 'eType',
	[4] = 'szText',
	[5] = 'dwDate',
}
_G.GuildApplyListMsgStN = {
	['dwApplyID']	= 1,
	['dwRoleID']	= 2,
	['dwGuildID']	= 3,
	['szRoleName']	= 4,
	['dwClass']		= 5,
	['dwLevel']		= 6,
	['dwPower']		= 7,
	['dwDate']		= 8,
}
_G.GuildApplyListMsgNtS = {
	[1] = 'dwApplyID',
	[2] = 'dwRoleID',
	[3] = 'dwGuildID',
	[4] = 'szRoleName',
	[5] = 'dwClass',
	[6] = 'dwLevel',
	[7] = 'dwPower',
	[8] = 'dwDate',
}

--公会字符配置
_G.GuildStringConfig = {
	[1] = '世家称谓:%s<br>经验奖励:%d<br>五行奖励:%d',
	[11] = '世家资源可用于升级%s、%s以及其他消耗',
	[12] = '世家等级',
	[13] = '世家押镖',
	[14] = '30万银两或一块世家令 = 1点贡献点',
	[15] = '获得世家令途径：%s',
	[16] = '世界BOSS',
	[17] = '兑换稀有道具',
	[21] = '世家公告：',
	[31] = '满阶',
}

--公会日志枚举
_G.enGuildLog = {
	eMember		= 1,
	eCombat		= 2,
	eDonate		= 3,
	eAppoint	= 4,
}

--公会贡献枚举
_G.enGuildDonate = {
	eMoney	= 0,
	eItem1	= 1,
	eItem2	= 2,
	eItem3	= 3,
	eItem4	= 4,
}

--公会创建配置
  --dwLevel: 需要玩家等级
  --dwMoney: 消耗玩家银两
_G.GuildBuildConfig = {
	dwLevel = 25,
	dwMoney = 1000000,
}

--公会阶级配置
  --szName: 名称
_G.GuildRankConfig = {
	[1]	= { szName = _G.SysStringConfigInfo[6001060030]},
	[2]	= { szName = _G.SysStringConfigInfo[6001060031]},
	[3]	= { szName = _G.SysStringConfigInfo[6001060032]},
}

--公会权限配置
  --Dismiss: 解散
  --Upgrade: 升级
  --Announce: 公告
  --Appoint: 任命
  --Recruit: 招募
  --Remove: 除名
  --Log: 日志
  --Skill：技能
_G.GuildAuthorityConfig = {
	[1]	= { Dismiss = true, Upgrade = true, Announce = true, Appoint = true, Recruit = true, Remove = true, Log = true, Skill = true },
	[2]	= { Dismiss = false, Upgrade = false, Announce = true, Appoint = false, Recruit = true, Remove = true, Log = true, Skill = true },
	[3]	= { Dismiss = false, Upgrade = false, Announce = false, Appoint = false, Recruit = false, Remove = false, Log = false, Skill = true },
}
--公会公告配置
  --dwLength: 公告长度
_G.GuildAnnounceConfig = {
	dwLength = 96
}

--公会邀请配置
  --dwTime: 公会邀请间隔
_G.GuildInviteConfig = {
	dwTime = 60000
}

--公会退出配置
  --dwTime: 公会退出间隔
_G.GuildQuitConfig = {
	dwTime = 86400000
}

--公会成员配置配置
  --dwLevel: 最低等级 
_G.GuildMemberConfig = {
	dwLevel = 25,
	szOfflineColor = '#666666',
}

--公会等级配置
  --dwMember: 成员上限
_G.GuildLevelConfig = {
	[1] = { dwMember = 50 },
	[2] = { dwMember = 55 },
	[3] = { dwMember = 65 },
	[4] = { dwMember = 80 },
	[5] = { dwMember = 100 },
}

--公会日期配置
_G.GuildDateConfig = {
	[1]	= _G.SysStringConfigInfo[6001060033],
	[2]	= _G.SysStringConfigInfo[6001060034],
}

--公会捐献配置
_G.GuildDonateConfig = {
	[enGuildDonate.eMoney] = { dwCost = 300000, dwContribute = 1 },
	[enGuildDonate.eItem1] = { dwItemEnum = 4500030, dwCost = 1, dwContribute = 1, dwTipCount = 10 },
	[enGuildDonate.eItem2] = { dwItemEnum = 4500040, dwCost = 1, dwContribute = 1, dwTipCount = 10 },
	[enGuildDonate.eItem3] = { dwItemEnum = 4500050, dwCost = 1, dwContribute = 1, dwTipCount = 10 },
	[enGuildDonate.eItem4] = { dwItemEnum = 4500060, dwCost = 1, dwContribute = 1, dwTipCount = 10 },
}

--公会商店配置
_G.GuildShopConfig = {
	{ dwItemEnum = 4100210, dwItemBind = 1 , dwItemStock = 50, dwContribute = 4 , dwGuildLevel = 1 },
	{ dwItemEnum = 4100130, dwItemBind = 1 , dwItemStock = 50, dwContribute = 4 , dwGuildLevel = 1 },	
	{ dwItemEnum = 2500050, dwItemBind = 1 , dwItemStock = 50, dwContribute = 2 , dwGuildLevel = 1 },
	{ dwItemEnum = 2400120, dwItemBind = 1 , dwItemStock = 10, dwContribute = 20 , dwGuildLevel = 1 },
	{ dwItemEnum = 9405040, dwItemBind = 1 , dwItemStock = 10, dwContribute = 40 , dwGuildLevel = 1 },
    { dwItemEnum = 4100420, dwItemBind = 1 , dwItemStock = 50, dwContribute = 2 , dwGuildLevel = 1 },	
	{ dwItemEnum = 2500331, dwItemBind = 1 , dwItemStock = 50, dwContribute = 4 , dwGuildLevel = 1 },
	{ dwItemEnum = 5500080, dwItemBind = 1 , dwItemStock = 10, dwContribute = 10 , dwGuildLevel = 1 },
	{ dwItemEnum = 5500082, dwItemBind = 1 , dwItemStock = 5, dwContribute = 400 , dwGuildLevel = 1 },
	{ dwItemEnum = 5809368, dwItemBind = 1 , dwItemStock = 5, dwContribute = 400 , dwGuildLevel = 1 },	
}

--公会自动接受配置
_G.GuildAutoApplyConfig = { 30,40,50,60,70,80,90 }

--公会搜索信息配置
_G.GuildSearchInfoConfig = { "世家名称","家主名称" }

--公会战利品配置
  --dwTrophyType 战利品类型
  --szMapName 地图名
_G.GuildTrophyConfig = {
	[1] = { dwTrophyType = 1, szMapName = _G.SysStringConfigInfo[6001060035]},
	[2] = { dwTrophyType = 2, szMapName = _G.SysStringConfigInfo[6001060036]},
	[3] = { dwTrophyType = 1, szMapName = _G.SysStringConfigInfo[6001060037]},
	[4] = { dwTrophyType = 2, szMapName = _G.SysStringConfigInfo[6001060038]},
	[5] = { dwTrophyType = 1, szMapName = _G.SysStringConfigInfo[6001060039]},
	[6] = { dwTrophyType = 2, szMapName = _G.SysStringConfigInfo[6001060040]},
	[7] = { dwTrophyType = 1, szMapName = _G.SysStringConfigInfo[6001060041]},
	[8] = { dwTrophyType = 2, szMapName = _G.SysStringConfigInfo[6001060042]},
	[9] = { dwTrophyType = 3, szMapName = _G.SysStringConfigInfo[6001060043]},
}
--公会战利品类型配置
  --szTrophyName 战利品名
  --szTrophyIcon 战利品图标
  --dwAddExp 增加经验百分比
_G.GuildTrophyType = {
	[1] = { szTrophyName = _G.SysStringConfigInfo[6001060044], szShortName = _G.SysStringConfigInfo[6001010336], szTrophyIcon = 'Qita_Ding01_1.png', dwAddExp = 5 },
	[2] = { szTrophyName = _G.SysStringConfigInfo[6001060045], szShortName = _G.SysStringConfigInfo[6001010337], szTrophyIcon = 'Qita_Ding02_1.png', dwAddExp = 10 },
	[3] = { szTrophyName = _G.SysStringConfigInfo[6001060046], szShortName = _G.SysStringConfigInfo[6001010338], szTrophyIcon = 'Qita_Ding03_1.png', dwAddExp = 20 },
}

--公会图腾配置
  --属性增加
  --dwAttack 攻击
  --dwDefense 防御
  --dwFlee 身法
  --dwHitPercent 命中
  --dwCrit 暴击
  --dwHPMax 生命max
  --dwMPMax 内力max
  --dwMoveSpeed 移动速度
  --dwAttackSpeed 攻击速度
  --dwDuck 闪避率
_G.GuildTotemConfig = {
	[1] = {
		tabGuild = { dwMember = 50 },
		tabUpgrade = { dwMoney = 10000000, dwItem1 = 15, dwItem2 = 15, dwItem3 = 15, dwItem4 = 15, dwActive = 12000},
		tabDescription = {
			szImg = 'ShiJia_XuanWu.png',szPfx = 'TX_ui_guild_levelup_01',szName = "ShiJia_YiJie.png",
			szText = _G.SysStringConfigInfo[6001040007],
			szBuff = _G.SysStringConfigInfo[6001040012],
		},
		tabAttribute = {
			tabPercent = {dwExpUp = 0.05,dwMartialZhenqiUp = 0.1}, 
			tabAbsolute = {dwAttack = 50,dwDefense = 25,dwHPMax = 200},
		},
		tabFunction = {
			{ szIcon = "ShiJia_ShangCheng.png",szText = "世家升级后开放新的世家商店道具" },
			{ szIcon = "ShiJia_BiaoChe.png",szText = "世家升级后世家镖车可升级为2级" },
			--{ szIcon = "ShiJia_ShangCheng.png",szText = "新增了功能2" },
		},
	},
	[2] = {
		tabGuild = { dwMember = 55 },
		tabUpgrade = { dwMoney = 50000000, dwItem1 = 75, dwItem2 = 75, dwItem3 = 75, dwItem4 = 75, dwActive = 35000},
		tabDescription = {
			szImg = 'ShiJia_BaiHu.png',szPfx = 'TX_ui_guild_levelup_02',szName = "ShiJia_ReJie.png",
			szText =_G.SysStringConfigInfo[6001040008],
			szBuff =_G.SysStringConfigInfo[6001040013],
		},
		tabAttribute = {
			tabPercent = {dwExpUp = 0.15,dwMartialZhenqiUp = 0.2},
			tabAbsolute = {dwAttack = 75,dwDefense = 38,dwHPMax = 300},
		},
		tabFunction = {
			{ szIcon = "ShiJia_ShangCheng.png",szText = "世家升级后开放新的世家商店道具" },
			{ szIcon = "ShiJia_BiaoChe.png",szText = "世家升级后世家镖车可升级为3级" },
		},
	},
	[3] = {
		tabGuild = { dwMember = 65 },
		tabUpgrade = { dwMoney = 100000000, dwItem1 = 250, dwItem2 = 250, dwItem3 = 250, dwItem4 = 250, dwActive = 150000},
		tabDescription = {
			szImg = 'ShiJia_ZhuQue.png',szPfx = 'TX_ui_guild_levelup_03',szName = "ShiJia_SanJie.png",
			szText =_G.SysStringConfigInfo[6001040009],
			szBuff = _G.SysStringConfigInfo[6001040014],
		},
		tabAttribute = {
			tabPercent = {dwExpUp = 0.25,dwMartialZhenqiUp = 0.3},
			tabAbsolute = {dwAttack = 120,dwDefense = 60,dwHPMax = 480},
		},
		tabFunction = {
			{ szIcon = "ShiJia_ShangCheng.png",szText = "世家升级后开放新的世家商店道具" },
			--{ szIcon = "ShiJia_BiaoChe.png",szText = "世家升级后世家镖车可升级为3级" },
		},
	},
	[4] = {
		tabGuild = { dwMember = 80 },
		tabUpgrade = { dwMoney = 500000000, dwItem1 = 500, dwItem2 = 500, dwItem3 = 500, dwItem4 = 500, dwActive = 380000},
		tabDescription = {
			szImg = 'ShiJia_QingLong.png',szPfx = 'TX_ui_guild_levelup_04',szName = "ShiJia_SiJie.png",
			szText = _G.SysStringConfigInfo[6001040010],
			szBuff = _G.SysStringConfigInfo[6001040015],
		},
		tabAttribute = {
			tabPercent = {dwExpUp = 0.40,dwMartialZhenqiUp = 0.4},
			tabAbsolute = {dwAttack = 205,dwDefense = 103,dwHPMax = 820},
		},
		tabFunction = {
			{ szIcon = "ShiJia_ShangCheng.png",szText = "世家升级后开放新的世家商店道具" },
			--{ szIcon = "ShiJia_BiaoChe.png",szText = "世家升级后世家镖车可升级为4级" },
		},
	},
	[5] = {
		tabGuild = { dwMember = 100 },
		tabUpgrade = { dwMoney = 5000000000, dwItem1 = 1000, dwItem2 = 1000, dwItem3 = 1000, dwItem4 = 1000, dwActive = 760000 },
		tabDescription = {
			szImg = 'ShiJia_QiLin.png',szPfx = 'TX_ui_guild_levelup_05',szName = "ShiJia_WuJie.png",
			szText = _G.SysStringConfigInfo[6001040011],
			szBuff = _G.SysStringConfigInfo[6001040016],
		},
		tabAttribute = {
			tabPercent = {dwExpUp = 0.6,dwMartialZhenqiUp = 0.6},
			tabAbsolute = {dwAttack = 320,dwDefense = 160,dwHPMax = 1280},
		},
		tabFunction = {
			{ szIcon = "ShiJia_ShangCheng.png",szText = "世家升级后开放新的世家商店道具" },
		--	{ szIcon = "ShiJia_BiaoChe.png",szText = "世家升级后世家镖车可升级为5级" },
		},
	}
}

--公会榜单配置
  --dwAttack 攻击
  --dwDefense 防御
  --dwFlee 身法
  --dwHitPercent 命中
  --dwCrit 暴击
  --dwHPMax 生命max
  --dwMPMax 内力max
  --dwMoveSpeed 移动速度
  --dwAttackSpeed 攻击速度
  --dwDuck 闪避率
_G.GuildChartConfig = {
	dwNumber = 20, --名次
	dwCount = 4, --数量
	dwLevel = 20, --获得收益所需等级
	dwTitle = 4, --获得收益所需称谓
	tabOrder = { 'dwHPMax','dwDefense','dwFlee','dwAttackSpeed','dwCrit','dwAttack' },
	tabChart = {
		[enChartType.eLevel] = { szText = SysStringConfigInfo[6001070008], tabAttribute = { dwHPMax = 600 } },
		[enChartType.eWeath] = { szText = SysStringConfigInfo[6001070009], tabAttribute = { dwFlee = 300 } },
		[enChartType.ePower] = { szText = SysStringConfigInfo[6001070010], tabAttribute = { dwAttackSpeed = 210 } },
		[enChartType.ePulse] = { szText = SysStringConfigInfo[6001070011], tabAttribute = { dwDefense = 100 } },
		[enChartType.eKiller] = { szText = SysStringConfigInfo[6001070012], tabAttribute = { dwAttack = 200 } },
		[enChartType.eSword] = { szText = SysStringConfigInfo[6001070013], tabAttribute = { dwDefense = 100 } },
		[enChartType.eBoss] = { szText = SysStringConfigInfo[6001070014], tabAttribute = { dwAttack = 200 } },
		[enChartType.eAmulet] = { szText = SysStringConfigInfo[6001070015], tabAttribute = { dwHPMax = 600 } },
		[enChartType.eBourn] = { szText = SysStringConfigInfo[6001070016], tabAttribute = { dwCrit = 250 } },
		[enChartType.eMount] = { szText = SysStringConfigInfo[6001070017], tabAttribute = { dwHPMax = 600 } },
	}
}

--公会增益设置
_G.GuildBuffConfig = {
	szIcon = 'Mon_By_Jingyan.png',
	dwWidth = 42,
	dwHeight = 42,
	szTrophyTip = SysStringConfigInfo[6001060057],
}

--公会称谓设置
  --szTitle 称谓名称
  --dwExtra 增加福利(百分比)
_G.GuildTitleConfig = {
	[1] = { szTitle = SysStringConfigInfo[6001060047]},
	[2] = { szTitle = SysStringConfigInfo[6001060048]},
	[3] = { szTitle = SysStringConfigInfo[6001060049]},
	[4] = { szTitle = SysStringConfigInfo[6001060050]},
	[5] = { szTitle = SysStringConfigInfo[6001060051]},
	[6] = { szTitle = SysStringConfigInfo[6001060052]},
	[7] = { szTitle = SysStringConfigInfo[6001060053]},
	[8] = { szTitle = SysStringConfigInfo[6001060054]},
	[9] = { szTitle = SysStringConfigInfo[6001060055]},
	[10] = { szTitle = SysStringConfigInfo[6001060056]},
}

--公会广播设置
  --dwTime 广播间隔时间
_G.GuildNoticeConfig = {
	dwTime = 10 * 60 * 1000,
	szText = '世家成员%s被%s击杀（%s,%s,%s）',
}

--公会称谓转换公式
  --dwContribute 贡献值
_G.GuildTitleCount = function(dwContribute)

	if dwContribute > 700 then
		return 10
	elseif dwContribute > 500 then
		return 9
	elseif dwContribute > 350 then
		return 8
	elseif dwContribute > 250 then
		return 7
	elseif dwContribute > 150 then
		return 6
	elseif dwContribute > 100 then
		return 5 
	elseif dwContribute > 70 then
		return 4
	elseif dwContribute > 50 then
		return 3 
	elseif dwContribute > 20 then
		return 2
	elseif dwContribute >= 0 then
		return 1
	end
end

--公会活跃度转换公式
  --dwPoint 原始活跃度
_G.GuildActiveCount = function(dwPoint)
	local point = dwPoint * 0.2;
	if point < 1 then
	    point = 0;
	end
	return math.floor(point);	
end

_G.GuildSkillStr = SysStringConfigInfo[6001070019];
--技能升级对应的资源ID
_G.ID_ResouceConfig = {
	4500030,--天
	4500040,--地
	4500050,--玄
	4500060,--黄
}			
_G.GuildSkillAddAttr = {
dwRemitAttack = "伤害减免",
dwMoveSpeed = "移动速度",
dwAttackSpeed = "攻击速度",
dwHPMax = "生命",
dwMPMax = "内力",
dwAttack = "攻击",
dwDefense = "防御",
dwFlee = "身法",
dwCrit ="暴击",
dwAttackPer = "攻击百分比",
dwDefensePer = "防御百分比",
dwCritPer = "暴击百分比",
dwFleePer = "身法百分比",
dwHPMaxPer = "生命max百分比",
dwMPMaxPer = "内力max百分比",
dwAttackSpeedPer = "攻击速度百分比",
dwMoveSpeedPer = "移动速度百分比",
dwRemitAttackPer = "伤害减免百分比",
}

_G.GuildSkillTIPS = {
	SkillLv = "<font color='#88FFF5'>技能等级:</font>", 
	MilitaryType = "<font color='#88FFF5'>武学类型:</font>", 
	CurEffect = "<font color='#88FFF5'>当前效果:</font>", 
	NextEffect = "<font color='#88FFF5'>下阶效果:</font>",
	ShuXing = {
		[1] = 10;
		[2] = 21;
		[3] = 33;
		[4] = 46;
		[5] = 60;
		[6] = 75;
		[7] = 91;
		[8] = 108;
		[9] = 126;
		[10] = 145;
		[11] = 165;
		[12] = 186;
		[13] = 208;
		[14] = 231;
		[15] = 255;
		[16] = 280;
		[17] = 306;
		[18] = 333;
		[19] = 361;
		[20] = 390;
		[21] = 450;
		[22] = 513;
		[23] = 579;
		[24] = 648;
		[25] = 720;
		[26] = 795;
		[27] = 873;
		[28] = 954;
		[29] = 1038;
		[30] = 1125;
		[31] = 1215;
		[32] = 1308;
		[33] = 1404;
		[34] = 1503;
		[35] = 1605;
		[36] = 1710;
		[37] = 1818;
		[38] = 1929;
		[39] = 2043;
		[40] = 2160;
		[41] = 2330;
	};

	GongXian = {
		[1] = 5;
		[2] = 7;
		[3] = 9;
		[4] = 11;
		[5] = 13;
		[6] = 15;
		[7] = 17;
		[8] = 19;
		[9] = 21;
		[10] = 23;
		[11] = 25;
		[12] = 27;
		[13] = 29;
		[14] = 31;
		[15] = 33;
		[16] = 35;
		[17] = 37;
		[18] = 39;
		[19] = 41;
		[20] = 43;
		[21] = 46;
		[22] = 49;
		[23] = 52;
		[24] = 55;
		[25] = 58;
		[26] = 61;
		[27] = 64;
		[28] = 67;
		[29] = 70;
		[30] = 73;
		[31] = 76;
		[32] = 79;
		[33] = 82;
		[34] = 85;
		[35] = 88;
		[36] = 91;
		[37] = 94;
		[38] = 97;
		[39] = 100;
		[40] = 103;
		[41] = 107;
	};


	YinLian = {
		[1] = 50000;
		[2] = 100000;
		[3] = 150000;
		[4] = 200000;
		[5] = 250000;
		[6] = 300000;
		[7] = 350000;
		[8] = 400000;
		[9] = 450000;
		[10] = 500000;
		[11] = 600000;
		[12] = 700000;
		[13] = 800000;
		[14] = 900000;
		[15] = 1000000;
		[16] = 1100000;
		[17] = 1200000;
		[18] = 1300000;
		[19] = 1400000;
		[20] = 1500000;
		[21] = 2000000;
		[22] = 2500000;
		[23] = 3000000;
		[24] = 3500000;
		[25] = 4000000;
		[26] = 4500000;
		[27] = 5000000;
		[28] = 5500000;
		[29] = 6000000;
		[30] = 6500000;
		[31] = 7000000;
		[32] = 7500000;
		[33] = 8000000;
		[34] = 8500000;
		[35] = 9000000;
		[36] = 9500000;
		[37] = 10000000;
		[38] = 10500000;
		[39] = 11000000;
		[40] = 11500000;
		[41] = 12500000;
	};
}



--世家技能配置
_G.UnActivateSkillImage = "gth_1.png";
_G.GuildSkillConfig = {
	[1] = {
		--技能等级上限
		SkillLevelUp = 40;
		--技能名称
		Name = "降龙伏象功";
		--技能描述
		Des = "降龙伏象功";
		--武学类型
		MilitaryType = "被动生效";
		--图片类型
		Image = "Icon_sk_zq_1004_1.png";
		GrayImage = "Icon_sk_zq_1004_0.png";
		--玩家升级技能消耗
		--dwLevel 技能要升级到的等级，比如当前等级为0，则dwLevel == 1
		GetUpGradeCond_Player = function(dwLevel)
			local t = {};
				t.needMoney = GuildSkillTIPS.YinLian[dwLevel];		--银两
				t.needContr = GuildSkillTIPS.GongXian[dwLevel];		--世家贡献
			return t;
		end;
		--家主升级技能上限消耗
		--dwLevel 技能要升级到的等级，比如当前等级为0，则dwLevel == 1
		GetUpGradeCond_Guild = function(dwLevel)
			local a = math.ceil(dwLevel/10)
			local m = math.ceil(dwLevel/5)
			local t = {};
				t.needLevel	= a;		--世家等级
				t.needMoney	= 500000*dwLevel + math.floor(dwLevel/20)*5000000;	--世家银两
				t.needTian	= m;		--天
				t.needDi	= m;		--地
				t.needXuan	= m;		--玄
				t.needHuang	= m;		--黄
			return t;
		end;
		--增加的属性
		--dwLevel 技能当前等级
		GetAddAttr = function(dwLevel)
			local t = {};
				--base值
				t.dwAttack		= GuildSkillTIPS.ShuXing[dwLevel];	--攻击
				t.dwDefense		= 0;		--防御
				t.dwCrit			= 0;		--暴击
				t.dwFlee			= 0;		--身法
				t.dwHPMax			= 0;		--生命max
				t.dwMPMax			= 0;		--内力max
				t.dwAttackSpeed	= 0;		--攻击速度
				t.dwMoveSpeed		= 0;		--移动速度
				t.dwRemitAttack	= 0;		--伤害减免
				--percent值
				t.dwAttackPer		= 0;		--攻击百分比
				t.dwDefensePer	= 0;		--防御百分比
				t.dwCritPer		= 0;		--暴击百分比
				t.dwFleePer		= 0;		--身法百分比
				t.dwHPMaxPer		= 0;		--生命max百分比
				t.dwMPMaxPer		= 0;		--内力max百分比
				t.dwAttackSpeedPer= 0;		--攻击速度百分比
				t.dwMoveSpeedPer	= 0;		--移动速度百分比
				t.dwRemitAttackPer= 0;		--伤害减免百分比
				return t;
		end;
	};
	[2] = {
		--技能等级上限
		SkillLevelUp = 40;
		--技能名称
		Name = "两极心法";
		--技能描述
		Des = "两极心法";
		--武学类型
		MilitaryType = "被动生效";
		--图片类型
		Image = "Icon_item_7900008_1.png";
		GrayImage = "Icon_item_7900008_0.png";
		--玩家升级技能消耗
		--dwLevel 技能要升级到的等级，比如当前等级为0，则dwLevel == 1
		GetUpGradeCond_Player = function(dwLevel)
			local t = {};
				t.needMoney = GuildSkillTIPS.YinLian[dwLevel];		--银两
				t.needContr = GuildSkillTIPS.GongXian[dwLevel];		--世家贡献
			return t;
		end;
		--家主升级技能上限消耗
		--dwLevel 技能要升级到的等级，比如当前等级为0，则dwLevel == 1
		GetUpGradeCond_Guild = function(dwLevel)
			local a = math.ceil(dwLevel/10)
			local m = math.ceil(dwLevel/5)
			local t = {};
				t.needLevel	= a;		--世家等级
				t.needMoney	= 500000*dwLevel + math.floor(dwLevel/20)*5000000;	--世家银两
				t.needTian	= m;		--天
				t.needDi	= m;		--地
				t.needXuan	= m;		--玄
				t.needHuang	= m;		--黄
			return t;
		end;
		--增加的属性
		--dwLevel 技能当前等级
		GetAddAttr = function(dwLevel)
			local t = {};
				--base值
				t.dwAttack		= 0;	--攻击
				t.dwDefense		= 0;		--防御
				t.dwCrit			= 0;		--暴击
				t.dwFlee			= 0;		--身法
				t.dwHPMax			= GuildSkillTIPS.ShuXing[dwLevel]*4;		--生命max
				t.dwMPMax			= 0;		--内力max
				t.dwAttackSpeed	= 0;		--攻击速度
				t.dwMoveSpeed		= 0;		--移动速度
				t.dwRemitAttack	= 0;		--伤害减免
				--percent值
				t.dwAttackPer		= 0;		--攻击百分比
				t.dwDefensePer	= 0;		--防御百分比
				t.dwCritPer		= 0;		--暴击百分比
				t.dwFleePer		= 0;		--身法百分比
				t.dwHPMaxPer		= 0;		--生命max百分比
				t.dwMPMaxPer		= 0;		--内力max百分比
				t.dwAttackSpeedPer= 0;		--攻击速度百分比
				t.dwMoveSpeedPer	= 0;		--移动速度百分比
				t.dwRemitAttackPer= 0;		--伤害减免百分比
				return t;
		end;
	};
	
	[3] = {
		--技能等级上限
		SkillLevelUp = 40;
		--技能名称
		Name = "天元心法";
		--技能描述
		Des = "天元心法";
		--武学类型
		MilitaryType = "被动生效";
		--图片类型
		Image = "Icon_item_2400130_1.png";
		GrayImage = "Icon_item_2400130_0.png";
		--玩家升级技能消耗
		--dwLevel 技能要升级到的等级，比如当前等级为0，则dwLevel == 1
		GetUpGradeCond_Player = function(dwLevel)
			local t = {};
				t.needMoney = GuildSkillTIPS.YinLian[dwLevel];		--银两
				t.needContr = GuildSkillTIPS.GongXian[dwLevel];		--世家贡献
			return t;
		end;
		--家主升级技能上限消耗
		--dwLevel 技能要升级到的等级，比如当前等级为0，则dwLevel == 1
		GetUpGradeCond_Guild = function(dwLevel)
			local a = math.ceil(dwLevel/10)
			local m = math.ceil(dwLevel/5)
			local t = {};
				t.needLevel	= a;		--世家等级
				t.needMoney	= 500000*dwLevel + math.floor(dwLevel/20)*5000000;	--世家银两
				t.needTian	= m;		--天
				t.needDi	= m;		--地
				t.needXuan	= m;		--玄
				t.needHuang	= m;		--黄
			return t;
		end;
		
		
		--增加的属性
		--dwLevel 技能当前等级
		GetAddAttr = function(dwLevel)
			local t = {};
				--base值
				t.dwAttack		= 0;	--攻击
				t.dwDefense		= 0;		--防御
				t.dwCrit			= 0;		--暴击
				t.dwFlee			= math.floor(GuildSkillTIPS.ShuXing[dwLevel]*0.3)+1;		--身法
				t.dwHPMax			= 0;		--生命max
				t.dwMPMax			= 0;		--内力max
				t.dwAttackSpeed	= 0;		--攻击速度
				t.dwMoveSpeed		= 0;		--移动速度
				t.dwRemitAttack	= 0;		--伤害减免
				--percent值
				t.dwAttackPer		= 0;		--攻击百分比
				t.dwDefensePer	= 0;		--防御百分比
				t.dwCritPer		= 0;		--暴击百分比
				t.dwFleePer		= 0;		--身法百分比
				t.dwHPMaxPer		= 0;		--生命max百分比
				t.dwMPMaxPer		= 0;		--内力max百分比
				t.dwAttackSpeedPer= 0;		--攻击速度百分比
				t.dwMoveSpeedPer	= 0;		--移动速度百分比
				t.dwRemitAttackPer= 0;		--伤害减免百分比
				return t;
		end;
	};	
	
	[4] = {
		--技能等级上限
		SkillLevelUp = 40;
		--技能名称
		Name = "玄功要诀";
		--技能描述
		Des = "玄功要诀";
		--武学类型
		MilitaryType = "被动生效";
		--图片类型
		Image = "Icon_sk_zq_1005_1.png";
		GrayImage = "Icon_sk_zq_1005_0.png";
		--玩家升级技能消耗
		--dwLevel 技能要升级到的等级，比如当前等级为0，则dwLevel == 1
		GetUpGradeCond_Player = function(dwLevel)
			local t = {};
				t.needMoney = GuildSkillTIPS.YinLian[dwLevel];		--银两
				t.needContr = GuildSkillTIPS.GongXian[dwLevel];		--世家贡献
			return t;
		end;
		--家主升级技能上限消耗
		--dwLevel 技能要升级到的等级，比如当前等级为0，则dwLevel == 1
		GetUpGradeCond_Guild = function(dwLevel)
			local a = math.ceil(dwLevel/10)
			local m = math.ceil(dwLevel/5)
			local t = {};
				t.needLevel	= a;		--世家等级
				t.needMoney	= 500000*dwLevel + math.floor(dwLevel/20)*5000000;	--世家银两
				t.needTian	= m;		--天
				t.needDi	= m;		--地
				t.needXuan	= m;		--玄
				t.needHuang	= m;		--黄
			return t;
		end;
		--增加的属性
		--dwLevel 技能当前等级
		GetAddAttr = function(dwLevel)
			local t = {};
				--base值
				t.dwAttack		= 0;	--攻击
				t.dwDefense		=  math.floor(GuildSkillTIPS.ShuXing[dwLevel]*0.5)+1;		--防御
				t.dwCrit			= 0;		--暴击
				t.dwFlee			= 0;		--身法
				t.dwHPMax			= 0;		--生命max
				t.dwMPMax			= 0;		--内力max
				t.dwAttackSpeed	= 0;		--攻击速度
				t.dwMoveSpeed		= 0;		--移动速度
				t.dwRemitAttack	= 0;		--伤害减免
				--percent值
				t.dwAttackPer		= 0;		--攻击百分比
				t.dwDefensePer	= 0;		--防御百分比
				t.dwCritPer		= 0;		--暴击百分比
				t.dwFleePer		= 0;		--身法百分比
				t.dwHPMaxPer		= 0;		--生命max百分比
				t.dwMPMaxPer		= 0;		--内力max百分比
				t.dwAttackSpeedPer= 0;		--攻击速度百分比
				t.dwMoveSpeedPer	= 0;		--移动速度百分比
				t.dwRemitAttackPer= 0;		--伤害减免百分比
				return t;
		end;
	};
};



----世家摇奖 固定奖励物品配置表
_G.GuildLD_FixedItemByLevelConfig = {
	--世家等级的摇奖次数
	UseUp = {
		[1] = {1};
		[2] = {2};
		[3] = {3};
		[4] = {4};
		[5] = {5};
	};
	--奖励、消耗
	Award = {
		[1] = {20000,500,10};
		[2] = {50000,1000,15};
		[3] = {100000,2000,20};
		[4] = {200000,3000,25};
		[5] = {500000,5000,30};
	};
	--奖励
	Prize = {
		[1] = {
			[1] = {itemId = 3900020,itemNum = 1,bindType = 1}, ---抽奖物品 及 对应数量 是否绑定 0 是非绑定 1 是绑定
			[2] = {itemId = 5501131,itemNum = 1,bindType = 1},
			[3] = {itemId = 5910003,itemNum = 2,bindType = 1},
			[4] = {itemId = 4100421,itemNum = 3,bindType = 1},
			[5] = {itemId = 4100140,itemNum = 5,bindType = 1},
			[6] = {itemId = 2500200,itemNum = 1,bindType = 1},
			[7] = {itemId = 5940006,itemNum = 1,bindType = 1},
			[8] = {itemId = 2500050,itemNum = 2,bindType = 1},
		};
		[2] = {
			[1] = {itemId = 3900020,itemNum = 1,bindType = 1}, ---抽奖物品 及 对应数量 是否绑定 0 是非绑定 1 是绑定
			[2] = {itemId = 5501131,itemNum = 1,bindType = 1},
			[3] = {itemId = 5910003,itemNum = 3,bindType = 1},
			[4] = {itemId = 4100421,itemNum = 3,bindType = 1},
			[5] = {itemId = 4100140,itemNum = 8,bindType = 1},
			[6] = {itemId = 5930005,itemNum = 1,bindType = 1},
			[7] = {itemId = 5940006,itemNum = 2,bindType = 1},
			[8] = {itemId = 4100110,itemNum = 2,bindType = 1},
		};
		[3] = {
			[1] = {itemId = 3900030,itemNum = 1,bindType = 1}, ---抽奖物品 及 对应数量 是否绑定 0 是非绑定 1 是绑定
			[2] = {itemId = 5501132,itemNum = 1,bindType = 1},
			[3] = {itemId = 5910003,itemNum = 5,bindType = 1},
			[4] = {itemId = 4100422,itemNum = 3,bindType = 1},
			[5] = {itemId = 4100140,itemNum = 10,bindType = 1},
			[6] = {itemId = 5930006,itemNum = 1,bindType = 1},
			[7] = {itemId = 5940006,itemNum = 3,bindType = 1},
			[8] = {itemId = 4100410,itemNum = 2,bindType = 1},
		};	
		[4] = {
			[1] = {itemId = 3900040,itemNum = 1,bindType = 1}, ---抽奖物品 及 对应数量 是否绑定 0 是非绑定 1 是绑定
			[2] = {itemId = 5501132,itemNum = 1,bindType = 1},
			[3] = {itemId = 5910003,itemNum = 8,bindType = 1},
			[4] = {itemId = 4100422,itemNum = 3,bindType = 1},
			[5] = {itemId = 4100140,itemNum = 15,bindType = 1},
			[6] = {itemId = 5930006,itemNum = 1,bindType = 1},
			[7] = {itemId = 5940006,itemNum = 4,bindType = 1},
			[8] = {itemId = 4100430,itemNum = 3,bindType = 1},
		};	
		[5] = {
			[1] = {itemId = 3900050,itemNum = 1,bindType = 1}, ---抽奖物品 及 对应数量 是否绑定 0 是非绑定 1 是绑定
			[2] = {itemId = 5501133,itemNum = 1,bindType = 1},
			[3] = {itemId = 5910003,itemNum = 10,bindType = 1},
			[4] = {itemId = 4100423,itemNum = 3,bindType = 1},
			[5] = {itemId = 5950004,itemNum = 1,bindType = 1},
			[6] = {itemId = 5930006,itemNum = 1,bindType = 1},
			[7] = {itemId = 5940006,itemNum = 5,bindType = 1},
			[8] = {itemId = 5950010,itemNum = 1,bindType = 1},
		};
	
	};
	--定义格子权重
	Weight = {
		[1] = {
			[1] = {1,200};
			[2] = {2,200};
			[3] = {3,150};
			[4] = {4,150};
			[5] = {5,10};
			[6] = {6,20};
			[7] = {7,20};
			[8] = {8,250};
		};
		[2] = {
			[1] = {1,200};
			[2] = {2,200};
			[3] = {3,150};
			[4] = {4,150};
			[5] = {5,10};
			[6] = {6,20};
			[7] = {7,20};
			[8] = {8,250};
		};
		[3] = {
			[1] = {1,200};
			[2] = {2,200};
			[3] = {3,150};
			[4] = {4,150};
			[5] = {5,10};
			[6] = {6,20};
			[7] = {7,20};
			[8] = {8,250};
		};
		[4] = {
			[1] = {1,200};
			[2] = {2,200};
			[3] = {3,150};
			[4] = {4,150};
			[5] = {5,10};
			[6] = {6,20};
			[7] = {7,20};
			[8] = {8,250};
		};
		[5] = {
			[1] = {1,200};
			[2] = {2,200};
			[3] = {3,150};
			[4] = {4,150};
			[5] = {5,10};
			[6] = {6,20};
			[7] = {7,20};
			[8] = {8,250};
		};
	};
	--随机产生道具
	probability = function(data)
		local dwMax = 0;
		for location,dwProp in pairs(data) do
			dwMax = dwMax + dwProp[2]
		end
		local dwRes = math.random(1,dwMax)
		local dwCur = 0;
		for location,dwProp in pairs(data) do
			dwCur = dwCur + dwProp[2]
			if dwRes <= dwCur then
				return data[location][1];
			end
		end
	end

	
}
----世家摇奖 获取摇奖物品列表
_G.GuildLD_GetLDItemList = function(dwGuildLevel,dwRoleLevel,dwCurTime,dwObjRole,dwTitleLevel)  ----参数依次是 世家等级，玩家等级，当前抽奖次数，玩家对象，称谓等级
	return GuildLD_FixedItemByLevelConfig.Prize[dwCurTime]
end
----世家摇奖 获取固定奖励物品列表
_G.GuildLD_GetGuildLDFixedItemList = function(dwGuildLevel,dwRoleLevel,dwCurTime,dwObjRole,dwTitleLevel)  ----参数依次是 世家等级，玩家等级，当前抽奖次数，玩家对象，称谓等级
	local Data = GuildLD_FixedItemByLevelConfig.Award[dwCurTime]
	return Data[1],Data[2];
end
----世家摇奖 今日抽奖上限
_G.GuildLD_TakeAwardMaxTime = function(dwGuildLevel,dwRoleLevel,dwCurTime,dwObjRole,dwTitleLevel)  ----参数依次是 世家等级，玩家等级，当前抽奖次数，玩家对象，称谓等级
	return GuildLD_FixedItemByLevelConfig.UseUp[dwGuildLevel][1];
end
---世家摇奖 本次消耗
_G.GuildLD_CurConsume = function(dwGuildLevel,dwRoleLevel,dwCurTime,dwObjRole,dwTitleLevel)  ----参数依次是 世家等级，玩家等级，当前抽奖次数，玩家对象，称谓等级
	return GuildLD_FixedItemByLevelConfig.Award[dwCurTime][3];
end

---世家摇奖  获取本次摇奖奖励物品Id
_G.GuildLD_GetTakeAwardItemId = function(dwGuildLevel,dwRoleLevel,dwCurTime,dwObjRole,dwTitleLevel)  ----参数依次是 世家等级，玩家等级，当前抽奖次数，玩家对象，称谓等级
	return GuildLD_FixedItemByLevelConfig.probability(GuildLD_FixedItemByLevelConfig.Weight[dwCurTime])
end
---世家摇奖  奖励广播
_G.GuildLD_BroadCastAward = function(dwAwardItemID,dwGuildLevel,dwRoleLevel,dwCurTime,dwObjRole,dwTitleLevel)  ----参数依次是 奖励物品id  世家等级，玩家等级，当前抽奖次数，玩家对象，称谓等级

end






_G.GuildLD_GetSetMaiInfo = function(AwardInfo)
	local mailMsg = {
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "世家抽奖";
		content = "您的背包已满，世家抽奖获得的奖励通过邮件发送给您，请注意查收";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[AwardInfo.AwardItemID]={
				num = AwardInfo.AwardItemNum;
				bind = AwardInfo.AwardItemBindType;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};
	return mailMsg;
end

-----世家摇奖   字符串配置
_G.GuildLuckyConfig = {
		[1] = "<font color = '#FFFFFF'>%s</font>";
		[2] = "<font color = '#FF0000'>%s</font>";
		[3] = "/";
		[4] = "万";
		[5] = "img://Qita_exp.png";
		[6] = "img://Qita_zhenqi.png";
		[7] = "背包空间不足，奖品将以邮件形式发送";
	}
	
--弹劾家主配置
_G.GuildKickLeaderConfig = 
{
	tmKickTimeLength = 7*24*3600 * 1000;--多长时间后可以弹劾
	tmClientDelayTime = 60 * 1000;--客户端检测按钮亮时的延后时间
	
	dwNoticeMailCfg = 6000101;--弹劾后给家主发的邮件的配置ID
	
	dwEnumCost = 5500083;--消耗的道具
	dwNumber = 1;--消耗的数量
	
	dwRankLimit = 3;--弹劾的职位限制 1家主2执事3世家成员
	
	szLeaderTimeOver = "<font color='#F15D27'>家主已不知所踪，欲接替家主之位的世家成员，快拿着传家令去弹劾家主吧！</font>";
	szKickSuccChat = "成功弹劾原家主，恭喜您成为世家新任家主!";
	szNoticeKickTip = "原家主<font color='#4761ff'>%s</font>已不知所踪，由<font color='#B032EE'>%s</font>大侠继任为新家主!";
	
	szItemNeed = "需要传家令！";
	szRankNeed = "世家职位过低！";
	szNoticeByError = "弹劾失败，家主离线时间不足7天！";
	
	szBtnTip = "家主离线满7天才能使用该功能";
	szTanHeQueRen = "  家主离线满<font color='#00FF00'>7天</font>可被弹劾<br/>  弹劾成员消耗一个%s传家令</font>并成为新家主<br/><font  size='12' color='#FF0000'>  （传家令在元宝商城有售）</font><br/><br/><font  size='14' color='#FFD700'>  确定弹劾当前家主并取代之？</font>";
	
	szColorRed = "<font color='#FF0000'>";      --道具不足时，字颜色
	szColorGreen = "<font color='#00FF00'>";    --道具充足时，字颜色
}

----世家召唤令配置表
_G.GuildCallMemberConfig = {
	ItemID = 5501180,  ---穿云剑5501180
	Timepiece = 59000, ---倒计时时间
	FRange = 1,       ---坐标范围值
	--可传送地图
	SceneLoader = {1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112, --野外场景
					--8050,8051,8052,8053,   --恶人谷
	},                ---正确的地图  世界地图加恶人谷
	MapLimitLevel ={
		--   [8050] 地图ID ， 45 级别
			-- [8050] = 45;
			-- [8051] = 45;
			-- [8052] = 45;
			-- [8053] = 45;
		} ;
	PfxID = 110009;
	SendStrLen = 130;  --发送字符串长度	
	Text = {
			IsNoCan1  = "请输入宣言!"; --宣言为空
			IsNoCan2  = "使用失败！该场景不能使用该道具！"; --请移动到可以移动的地图
			IsNoCan3  = "当前已有人在集结世家成员，请稍后再试！"; --有人正在集结世家成员，请稍后再试！
			IsNoCan4  = "加入世家才能使用该道具！"; --加入世家才能使用该道具！
			IsNoCan5  = "该场景不能使用穿云箭相关功能！"; --传送失败！该场景不能被传送！
			IsNoCan6  = "传送失败！目标场景所需等级过高！"; --传送失败！级别不足
			IsNoCan7  = "死亡时不能执行此操作！"; --死亡提示
			ConText1 = "<font color='#00FF00'>%s</font>:<font size='16' color ='#FFD700'>%s</font>";-- 张小二：<br/>不拉不拉
			ConText2 = "%s(%d,%d)";-- 华山（11,12）
			ConText3 = "请速速前来相助！";--请速速来帮忙！！
			PosText  = "<font color='#4761ff'>%s</font><font color ='#FFFFFF'>处有人放穿云箭，大侠是否速速前去？</font>";--%s处有人放穿云箭，大侠是否速速前去？
			broadcast="玩家<font color='#4761ff'>%s</font>放出穿云箭，<font color='#fc91f3'>%s</font>世家的大侠速速前去相助！";--广播
	},
}

