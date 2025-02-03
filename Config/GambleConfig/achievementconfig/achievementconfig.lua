--引入辅助函数
local If = AchievementFunction.Check
local Do = AchievementFunction.Count

--成就消息定义
_G.AchievementParseTable = function(tabData,tabFormat)
	local tabTemp = {}
	for oldkey,value in pairs(tabData) do
		local newkey = tabFormat[oldkey]
		if newkey then
			tabTemp[newkey] = value
		end
	end
	return tabTemp
end
_G.AchievementParseList = function(tabData,tabFormat)
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

_G.AchievementInfoListMsgStN = {
	['dwAchievementID']	= 1,
	['dwProgress']		= 2,
	['dwDate']			= 3,
	['eState']			= 4,
}
_G.AchievementInfoListMsgNtS = {
	[1] = 'dwAchievementID',
	[2] = 'dwProgress',
	[3] = 'dwDate',
	[4] = 'eState',
}

--成就状态枚举
_G.enAchievementState = {
	eComplete	= 1,
	eReward		= 2,
}

--成就窗口枚举
_G.enAchievementWnd = {
	eMain	= 1,
	eList	= 2,
}

--成就操作枚举
_G.enAchievementOper = {
	eCompare	= 1,
	eView		= 2,
}

--成就提示配置
  --dwTime: 提示持续时间
_G.AchievementTipConfig = {
	dwTime = 7000,
	szIconFile = 'Ftb_cj.png',
}

--他人成就配置
  --szText: 比较结果提示
    --@N: 玩家姓名
_G.AchievementViewConfig = {
	szText = T[[<font color='#008000'><b>%s</b></font> 成就总进度：]]
}

--成就悬浮提示框
  --szText: 内容
_G.AchievementDoShowConfig = {
	szText = T[[<font color='#dcd9d9' size='14'>普通</font><font color='#dcd9d9'> : 容易获取的成就</font><br><font color='#4fd388' size='14'>精英</font><font color='#4fd388'> : 稍加努力就能达成</font><br><font color='#4daeed' size='14'>英雄</font><font color='#4daeed'> : 需要不懈前进才能达成</font><br><font color='#e082da' size='14'>传世</font><font color='#e082da'> : 您是骨灰级的玩家!</font><br><font color='#fed904' size='14'>神话</font><font color='#fed904'> : 天命!?]]
}

--成就比较配置
  --szNoRank: 未上榜时显示
_G.AchievementCompareConfig = {
	szNoRank = T'未上榜'
}

--成就广播配置
  --szText: 成就广播内容
    --@A: 玩家名
	--@B: 成就名
  --szHtmlText1: 成就比较超链接文字
  --szHtmlText2: 成就查看超链接文字
_G.AchievementBroadCastConfig = {
	szText = T[[<font color='#eadc7b'>『成就系统』:玩家 <font color='#03b3fd'>@A</font> 达成了成就:<font color='#b734f8'>@B</font>。大家恭喜他。</font>]],
	szTextyc = T[[<font color='#ff00d8'>『隐藏成就』:隐藏成就 <font color='#effe00'><b>@B</b></font> 由 <font color='#03b3fd'><b>@A</b></font> 发现,大家快去膜拜！</font>]],
	szHtmlText1 = T[[<font color='#31cf32'>跟他比比</font>]],
	szHtmlText2 = T[[<font color='#31cf32'>查看我的</font>]],
}

--成就列表配置
  --szName: 成就表名
  --tabAchievementList: 成就表内容
_G.AchievementListConfig = {
	{ szName = T'初来乍到' , tabAchievementList = { 100100,100200,100300,100400,100500,100600,100700,100800,100900,101000,101100,101200, }},
	{ szName = T'征战江湖' , tabAchievementList = { 200100,200101,200102,200200,200300,200301,200302,200303,200400,200401,200402,200500,200501,200502, }},
	{ szName = T'任侠天下' , tabAchievementList = { 300100,300101,300102,300103,300104,300105,300200,300201,300202,300203,300204,300205,300206,300207,300300,300301,300302,300303,300304, }},
	{ szName = T'鸿鹄之志' , tabAchievementList = { 400100,400101,400102,400500,400501,400502,}},--400200,400201,400202,400300,400301,400400,400401,400402,
	{ szName = T'纵横九州' , tabAchievementList = { 500100,500101,500102,500103,500104,500105,500106,500107,500200,500201,500202,500203,500204,500205, }},
	{ szName = T'武林制霸' , tabAchievementList = { 600100,600101,600102,600103,600104,600105,600106,600200,600201,600202,600300,600301,600302, }},
	{ szName = T'传世神话' , tabAchievementList = { 700100,700101,700102,700103,700200,700201,700300,700301,700400,700500,700600,700700,700701,700702,700703,700800,700801,700900,700901,701000,701001,701002,701003,701100,701200,701201,701202,701203,701204,701300, }},
}

--特殊成就配置
_G.AchievementSpecailList = {  }

--属性显示配置
  -- @A: 生命上限
  -- @B: 内力上限
  -- @C: 攻击
  -- @D: 防御
  -- @E: 身法
  -- @F: 暴击
  -- @G: 攻击速度
  -- @H: 移动速度
_G.AchievementPropertyText = 
	T[[生命上限:<font color='#00FF00'> + <b>@A</b></font><br>内力上限:<font color='#00FF00'> + <b>@B</b></font><br>攻击:<font color='#00FF00'> + <b>@C</b></font><br>防御:<font color='#00FF00'> + <b>@D</b></font><br>身法:<font color='#00FF00'> + <b>@E</b></font><br>暴击:<font color='#00FF00'> + <b>@F</b></font><br>攻击速度:<font color='#00FF00'> + <b>@G</b></font><br>移动速度:<font color='#00FF00'> + <b>@H</b></font><br>]]

	
--成就图标配置
_G.AchievementImg = {
		iconRewardImg	= {
		dwPoint = 'Qita_cj_dianshu.png',				--成就点
		dwGold = 'Qita_lijin.png',					--礼金
		dwMoney = 'Qita_money.png',				--银两
		dwHPLimited = 'Icon_sk_zq_1004_1.png',			--生命
		dwMPLimited = 'Icon_sk_zq_1002_1.png',			--内力
		dwAttack = 'Icon_sk_zq_1003_1.png',				--攻击
		dwDefence = 'Icon_Buff_1009_1.png',				--防御
		dwAgility = 'Icon_Buff_1004_1.png',				--敏捷
		dwCritical = 'Icon_Buff_1006_1.png',			--暴击
		dwAttackSpeed = 'Icon_Buff_9008_1.png',			--攻速
		dwMoveSpeed = 'Icon_Buff_1003_1.png',			--移速
		},
		iconRewardName	= {
		dwPoint = T'成就点数',				--成就点
		dwGold = T'礼金',					--礼金
		dwMoney = T'银两',				--银两
		dwHPLimited = T'属性奖励：生命',			--生命
		dwMPLimited = T'属性奖励：内力',			--内力
		dwAttack = T'属性奖励：攻击',				--攻击
		dwDefence = T'属性奖励：防御',				--防御
		dwAgility = T'属性奖励：敏捷',				--敏捷
		dwCritical = T'属性奖励：暴击',			--暴击
		dwAttackSpeed = T'属性奖励：攻击速度',			--攻速
		dwMoveSpeed = T'属性奖励：移动速度',			--移速
		},
		
	nameQualityImg	= {
		[1] = 'Qita_cj_01.png',			--普通 --无
		[2] = 'Qita_cj_02.png',			--精英 --绿
		[3] = 'Qita_cj_03.png',			--英雄 --蓝
		[4] = 'Qita_cj_04.png',			--传世 --紫
		[5] = 'Qita_cj_05.png',			--神话 --金
		},
}
	
--隐藏成就配置
_G.AchievementHide = {
	icon	= '999_1.png',		--隐藏成就图标
	szNameTxt = [[<font color='#c4605b'>????</font>]],
	szAchieveHideText = T[[<font color='#c4605b'><br>          全服暂时没有人发现这个成就，请大家努力寻找！！！<br>                  发现隐藏成就，将让你留名青史！！！</font>]],
	szRoleName = T[[<font color='#00FF00'><u><b>%s</b></u></font><font color='#cd73d7'> 最先发现</font>]],
}
	
--成就配置
------------------------------------------------------------------------------------------------------
--tabContent: 成就文本配置
  --bTip: 是否显示成就提示
  --bNotice: 是否显示成就广播
  --szName: 成就名
  --szText: 成就描述
    -- @A: 生命上限
    -- @B: 内力上限
    -- @C: 攻击
    -- @D: 防御
    -- @E: 身法
    -- @F: 暴击
    -- @G: 攻击速度
    -- @H: 移动速度
	-- <font color='#008000'>@I</font>: 银两
	-- <font color='#008000'>@J</font>: 礼金
	-- <font color='#008000'>@K</font>: 成就点数
----■特殊成就标配: <font color='#FF3300'><b>你是传奇</b></font><br><font color='#008000'>说明:</font><font color='#Cdc6c4'>日常补完</font><br><font color='#008000'>           ①</font><font color='#Cdc6c4'>达成单次连斩达到10成就</font><br><font color='#008000'>           ②</font><font color='#Cdc6c4'>达成杀死5只怪成就</font><br><font color='#008000'>           ③</font><font color='#Cdc6c4'>达成打坐5次成就</font><br><font color='#008000'>奖励:</font><font color='#Cdc6c4'>成就点数:<font color='#008000'>@K</font> 礼券:<font color='#008000'>@J</font> 银两:<font color='#008000'>@I</font> 属性:</font><font color='#008000'>生命+@A</font>
----■普通成就标配: <font color='#FF3300'><b>迎风一刀斩</b></font><br><font color='#008000'>           说明:</font><font color='#Cdc6c4'>达成十次连斩 </font><br><font color='#008000'>           条件:</font><font color='#Cdc6c4'>单次连斩10次</font><br><font color='#008000'>           奖励:</font><font color='#Cdc6c4'>成就点数:<font color='#008000'>@K</font> 礼券:<font color='#008000'>@J</font> 银两:<font color='#008000'>@I</font> 属性:</font><font color='#008000'>生命+@A</font>
----■■■■重要：上面的空格一定要留着，是给图标空出位置用的！！！
------------------------------------------------------------------------------------------------------
--tabReward: 成就奖励配置
--可选奖励
  --dwPoint: 成就点数
  --dwMoney: 银两
  --dwGold: 礼金
  --dwAttack: 攻击
  --dwDefence: 防御
  --dwAgility: 身法
  --dwCritical: 暴击
  --dwHPLimited: HP上限
  --dwMPLimited: MP上限
  --dwMoveSpeed: 移动速度
  --dwAttackSpeed: 攻击速度
  --dwItem1: 物品1
  --dwBind1: 物品1绑定类型
      -- 0: 非绑定
	  -- 1: 绑定
  --dwNumber1: 物品1数量
  --dwItem2: 物品2
  --dwBind2: 物品2绑定类型
      -- 0: 非绑定
	  -- 1: 绑定
  --dwNumber2: 物品2数量
------------------------------------------------------------------------------------------------------
--tabCondition: 成就条件配置
  --szEvent: 事件名（参照 EventCenterConfig enumPlayerEventType）
  --dwValue: 达成数值
  --fnCheck: 检测条件
  --fnCount: 进度变化
  --dwNext: 下一成就（当成就T"进度通用"时，可通过配置该字段提升效率）
_G.AchievementConfig = {


	-- [000001] = {
		-- tabContent		= { bTip = false, bNotice = false, dwOrder = 1, szIcon = 'Icon_sk_13003_1.png', szName=T'你是传奇', szText=T[[<font color='#6699FF'><b>你是传奇</b></font><br><font color='#008000'>说明:</font><font color='#Cdc6c4'>你是传奇</font><br><font color='#008000'>           ①</font><font color='#Cdc6c4'>达成第一次击杀BOSS怪成就</font><br><font color='#008000'>           ②</font><font color='#Cdc6c4'>达成穷追不舍成就</font><br><font color='#008000'>           ③</font><font color='#Cdc6c4'>达成第一只坐骑成就</font><br><font color='#008000'>奖励:</font><font color='#Cdc6c4'>成就点数:<font color='#008000'>@K</font> 礼券:<font color='#008000'>@J</font> 银两:<font color='#008000'>@I</font> 属性:</font><font color='#008000'>生命+@A</font>]] },
		-- tabReward		= { dwPoint=15, dwGold=15, dwHPLimited=15, dwItem1=2500070,dwNumber1=1,dwBind1=1, dwItem2=2500080,dwNumber2=1,dwBind2=1 },
		-- tabCondition	= { szEvent = 'EventAchievementComplete', dwValue = 3, fnCheck = If(T'参数3','=',100009,100007,100004), fnCount = Do() },
	-- },
	-- [000002] = {
		-- tabContent		= { bTip = false, bNotice = false, dwOrder = 2, szIcon = 'Icon_item_1201030_1.png', szName=T'交互达人', szText=T[[<font color='#6699FF'><b>交互达人</b></font><br><font color='#008000'>说明:</font><font color='#Cdc6c4'>朋友遍世界</font><br><font color='#008000'>           ①</font><font color='#Cdc6c4'>达成第一次交友成就</font><br><font color='#008000'>           ②</font><font color='#Cdc6c4'>达成欢迎回家成就</font><br><font color='#008000'>           ③</font><font color='#Cdc6c4'>达成礼多人不怪成就</font><br><font color='#008000'>奖励:</font><font color='#Cdc6c4'>成就点数:<font color='#008000'>@K</font> 礼券:<font color='#008000'>@J</font> 银两:<font color='#008000'>@I</font> 属性:</font><font color='#008000'>生命+@A</font>]] },
		-- tabReward		= { dwPoint=15, dwGold=15, dwHPLimited=15, dwItem1=2500070,dwNumber1=1,dwBind1=1 },
		-- tabCondition	= { szEvent = 'EventAchievementComplete', dwValue = 3, fnCheck = If(T'参数3','=',100003,100006,200021), fnCount = Do() },
	-- },
	-- [000003] = {
		-- tabContent		= { bTip = false, bNotice = false, dwOrder = 3, szIcon = 'Icon_sk_12004_1.png', szName=T'恶人', szText=T[[<font color='#6699FF'><b>恶人</b></font><br><font color='#008000'>说明:</font><font color='#Cdc6c4'>邪恶</font><br><font color='#008000'>           ①</font><font color='#Cdc6c4'>达成人在江湖成就</font><br><font color='#008000'>           ②</font><font color='#Cdc6c4'>达成恶向胆边生成就</font><br><font color='#008000'>           ③</font><font color='#Cdc6c4'>达成抱歉！误伤成就</font><br><font color='#008000'>奖励:</font><font color='#Cdc6c4'>成就点数:<font color='#008000'>@K</font> 礼券:<font color='#008000'>@J</font> 银两:<font color='#008000'>@I</font> 属性:</font><font color='#008000'>生命+@A</font>]] },
		-- tabReward		= { dwPoint=15, dwGold=15, dwHPLimited=15, dwItem1=2500070,dwNumber1=1,dwBind1=1 },
		-- tabCondition	= { szEvent = 'EventAchievementComplete', dwValue = 3, fnCheck = If(T'参数3','=',100022,100023,100024), fnCount = Do() },
	-- },
	--属性icon

	-----------------------初来乍到
	[100100] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 1, szIcon = 'Icon_sk_13010_1.png', szName=T'友谊长存', szText=T[[添加任意玩家为<font color='#008000'>好友</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwHPLimited=8 },
		tabCondition	= { szEvent = 'EventAddFriend', dwValue = 1, fnCheck = If(), fnCount = Do(T'进度','+',1) },
	},
	[100200] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 2, szIcon = 'Icon_sk_11013_1.png', szName=T'结队而行', szText=T[[与任意玩家<font color='#008000'>组队</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwHPLimited=8 },
		tabCondition	= { szEvent = 'EventAddTeam', dwValue = 1, fnCheck = If(), fnCount = Do() },
	},
	[100300] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 3, szIcon = 'Icon_sk_12008_1.png', szName=T'欢迎回家', szText=T[[加入或者创建任意一个<font color='#008000'>世家</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwHPLimited=8 },
		tabCondition	= { szEvent = 'EventJoinGuild', dwValue = 1, fnCheck = If(), fnCount = Do() },
	},
	[100400] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 4, szIcon = 'Icon_Buff_9005_1.png', szName=T'擒贼擒王', szText=T[[打败任意<font color='#008000'>BOSS两次</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwAttack=3 },
		tabCondition	= { szEvent = 'EventKillMonster', dwValue = 2, fnCheck = If(T'参数4','=',2), fnCount = Do(T'进度','+',1) },
	},
	[100500] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 5, szIcon = 'Icon_sk_60002_1.png', szName=T'告别单身', szText=T[[与她(他)<font color='#008000'>结婚</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwHPLimited=8 },
		tabCondition	= { szEvent = 'EventGetMarry', dwValue = 1, fnCheck = If(), fnCount = Do() },
	},
	[100600] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 6, szIcon = 'Icon_item_1500010_1.png', szName=T'宝甲初炼', szText=T[[通过宝甲界面，完成<font color='#008000'>两次宝甲熔炼</font>的操作]] },
		tabReward		= { dwPoint=5, dwGold=10, dwHPLimited=8 },
		tabCondition	= { szEvent = 'EventIntenAmulet', dwValue = 2, fnCheck = If(), fnCount = Do(T'进度','+',1) },
	},
	[100700] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 7, szIcon = 'Icon_item_5500170_1.png', szName=T'精益求精', szText=T[[完成<font color='#008000'>宝甲升阶</font>的操作]] },
		tabReward		= { dwPoint=5, dwGold=10, dwHPLimited=8 },
		tabCondition	= { szEvent = 'EventUpgradeAmulet', dwValue = 1, fnCheck = If(), fnCount = Do() },
	},
	[100800] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 8, szIcon = 'Icon_item_7100044_1.png', szName=T'一不留神', szText=T[[被怪物击败<font color='#008000'>2</font>次]] },
		tabReward		= { dwPoint=5, dwGold=10, dwHPLimited=8 },
		tabCondition	= { szEvent = 'EventBeKilled', dwValue = 2, fnCheck = If(T'参数4','=',2), fnCount = Do(T'进度','+',1) },
	},
	[100900] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 9, szIcon = 'Icon_item_7100016_1.png', szName=T'也怕菜刀', szText=T[[败于<font color='#008000'>玩家</font>之手]] },
		tabReward		= { dwPoint=5, dwGold=10, dwHPLimited=8 },
		tabCondition	= { szEvent = 'EventBeKilled', dwValue = 1, fnCheck = If(T'参数4','=',1), fnCount = Do() },
	},
	[101000] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 10, szIcon = 'Icon_item_2500280_1.png', szName=T'人在江湖', szText=T[[打败其他<font color='#008000'>玩家</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwAttack=3 },
		tabCondition	= { szEvent = 'EventKillPlayer', dwValue = 1, fnCheck = If(), fnCount = Do() },
	},
	[101100] = {
		tabContent 		= { dwQuality = 2,bTip = false, bNotice = true, dwOrder = 11, szIcon = 'Icon_sk_61001_1.png', szName=T'天地无双', szText=T[[进入<font color='#008000'>无双</font>状态]] },
		tabReward		= { dwPoint=5, dwGold=10, dwAttack=3 },
		tabCondition	= { szEvent = 'EventUseSkill', dwValue = 1, fnCheck = If(T'参数2','=',61001), fnCount = Do(T'进度','+',1) },
	},
	[101200] = {
		tabContent 		= { dwQuality = 2,bTip = false, bNotice = false, dwOrder = 12, szIcon = 'Mon_By_Yi.png', szName=T'初识变异', szText=T[[打倒两只<font color='#008000'>变异</font>怪]] },
		tabReward		= { dwPoint=5, dwGold=10, dwAttack=3 },
		tabCondition	= { szEvent = 'EventKillVariationMonster', dwValue = 2, fnCheck = If(), fnCount = Do(T'进度','+',T'参数2') },
	},
	---------------------征战江湖
	[200100] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 1, szIcon = 'Icon_BaoJian_movspd06_1.png', szName=T'滑步高手', szText=T[[用大挪移<font color='#008000'>50</font>次]] },
		tabReward		= { dwPoint=5, dwGold=10, dwDefence=3 },
		tabCondition	= { szEvent = 'EventUseSkill', dwValue = 50, fnCheck = If(T'参数2','=',11013), fnCount = Do(T'进度','+',1), dwNext = 200101 },
	},
	[200101] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 2, szIcon = 'Icon_Buff_1004_1.png', szName=T'日行千里', szText=T[[使用大挪移<font color='#008000'>100</font>次]] },
		tabReward		= { dwPoint=10, dwGold=20, dwDefence=5 },
		tabCondition	= { szEvent = 'EventUseSkill', dwValue = 100, fnCheck = If(T'参数2','=',11013), fnCount = Do(T'进度','+',1), dwNext = 200102 },
	},
	[200102] = {
		tabContent 		= { dwQuality = 2,bTip = false, bNotice = false, dwOrder = 3, szIcon = 'Icon_Buff_1003_1.png', szName=T'天外飞仙', szText=T[[使用大挪移<font color='#008000'>300</font>次]] },
		tabReward		= { dwPoint=20, dwGold=40, dwDefence=8 },
		tabCondition	= { szEvent = 'EventUseSkill', dwValue = 300, fnCheck = If(T'参数2','=',11013), fnCount = Do(T'进度','+',1) },
	},
	[200200] = {
		tabContent 		= { bSeverEvent = true,bTip = false, bNotice = false, dwOrder = 6, szIcon = 'Icon_item_2500220_1.png', szName=T'亲朋满座', szText=T[[添加好友人数达到<font color='#008000'>50</font>人]] },
		tabReward		= { dwPoint=10, dwGold=20, dwDefence=5 },
		tabCondition	= { szEvent = 'EventAddFriend', dwValue = 50, fnCheck = If(), fnCount = Do(T'进度','+',1) },
	},
	[200300] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 7, szIcon = 'Icon_sk_13003_1.png', szName=T'世家新人', szText=T[[在世家中捐献物资,通过捐献获得贡献<font color='#008000'>100</font>点]] },
		tabReward		= { dwPoint=5, dwGold=10, dwDefence=3 },
		tabCondition	= { szEvent = 'EventGuildDonate', dwValue = 100, fnCheck = If(T'参数2','>=',0), fnCount = Do(T'进度','+',T'参数2'), dwNext = 200301 },
	},
	[200301] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 8, szIcon = 'Icon_sk_13002_1.png', szName=T'世家骨干', szText=T[[在世家中捐献物资,通过捐献获得贡献<font color='#008000'>300</font>点]] },
		tabReward		= { dwPoint=10, dwGold=20, dwDefence=5 },
		tabCondition	= { szEvent = 'EventGuildDonate', dwValue = 300, fnCheck = If(T'参数2','>=',0), fnCount = Do(T'进度','+',T'参数2'), dwNext = 200302 },
	},
	[200302] = {
		tabContent 		= { dwQuality = 2,bTip = false, bNotice = false, dwOrder = 9, szIcon = 'Icon_sk_13004_1.png', szName=T'中流砥柱', szText=T[[在世家中捐献物资,通过捐献获得贡献<font color='#008000'>500</font>点]] },
		tabReward		= { dwPoint=20, dwGold=40, dwDefence=8 },
		tabCondition	= { szEvent = 'EventGuildDonate', dwValue = 500, fnCheck = If(T'参数2','>=',0), fnCount = Do(T'进度','+',T'参数2'), dwNext = 200303 },
	},
	[200303] = {
		tabContent 		= { dwQuality = 3,bTip = false, bNotice = false, dwOrder = 10, szIcon = 'Icon_sk_13001_1.png', szName=T'义薄云天', szText=T[[在世家中捐献物资,通过捐献获得贡献<font color='#008000'>999</font>点]] },
		tabReward		= { dwPoint=30, dwGold=60, dwDefence=10 },
		tabCondition	= { szEvent = 'EventGuildDonate', dwValue = 999, fnCheck = If(T'参数2','>=',0), fnCount = Do(T'进度','+',T'参数2') },
	},
	[200400] = {
		tabContent 		= { dwQuality = 3,bTip = false, bNotice = false, dwOrder = 13, szIcon = 'Icon_item_5500300_1.png', szName=T'小康之家', szText=T[[背包中的银两超过<font color='#008000'>200万</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwDefence=3 },
		tabCondition	= { szEvent = 'EventUpdateMoney', dwValue = 2000000, fnCheck = If(T'参数2','>=',0), fnCount = Do(T'进度','=',T'参数2'), dwNext = 200401 },
	},
	[200401] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 14, szIcon = 'Icon_item_5500310_1.png', szName=T'家财万贯', szText=T[[背包中的银两超过<font color='#008000'>3000万</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwDefence=5 },
		tabCondition	= { szEvent = 'EventUpdateMoney', dwValue = 30000000, fnCheck = If(T'参数2','>=',0), fnCount = Do(T'进度','=',T'参数2'), dwNext = 200402 },
	},
	[200402] = {
		tabContent 		= { dwQuality = 5,bTip = false, bNotice = false, dwOrder = 15, szIcon = 'Icon_item_5500340_1.png', szName=T'富甲一方', szText=T[[背包中的银两超过<font color='#008000'>5亿</font>]] },
		tabReward		= { dwPoint=20, dwGold=40, dwDefence=8 },
		tabCondition	= { szEvent = 'EventUpdateMoney', dwValue = 500000000, fnCheck = If(T'参数2','>=',0), fnCount = Do(T'进度','=',T'参数2') },
	},
	[200500] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 16, szIcon = 'Icon_item_7100023_1.png', szName=T'探索先知', szText=T[[完成各种任务，总任务数量超过<font color='#008000'>30</font>个]] },
		tabReward		= { dwPoint=5, dwGold=10, dwDefence=3 },
		tabCondition	= { szEvent = 'EventCompleteTask', dwValue = 30, fnCheck = If(), fnCount = Do(T'进度','+',1), dwNext = 200501 },
	},
	[200501] = {
		tabContent 		= { dwQuality = 2,bTip = false, bNotice = false, dwOrder = 17, szIcon = 'Icon_item_7100089_1.png', szName=T'遗迹守护', szText=T[[完成各种任务，总任务数量超过<font color='#008000'>100</font>个]] },
		tabReward		= { dwPoint=10, dwGold=20, dwDefence=5 },
		tabCondition	= { szEvent = 'EventCompleteTask', dwValue = 100, fnCheck = If(), fnCount = Do(T'进度','+',1), dwNext = 200502 },
	},
	[200502] = {
		tabContent 		= { dwQuality = 3,bTip = false, bNotice = false, dwOrder = 18, szIcon = 'Icon_item_7100122_1.png', szName=T'国家地理', szText=T[[完成各种任务，总任务数量超过<font color='#008000'>200</font>个]] },
		tabReward		= { dwPoint=20, dwGold=40, dwDefence=8 },
		tabCondition	= { szEvent = 'EventCompleteTask', dwValue = 200, fnCheck = If(), fnCount = Do(T'进度','+',1) },
	},
	-----------------------任侠天下
	[300100] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 1, szIcon = 'Icon_sk_13002_1.png', szName=T'初露锋芒', szText=T[[将角色等级提升至<font color='#008000'>30</font>级]] },
		tabReward		= { dwPoint=5, dwGold=10, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventLevelUp', dwValue = 30, fnCheck = If(), fnCount = Do(T'进度','=',T'参数3'), dwNext = 300101 },
	},
	[300101] = {
		tabContent 		= { bSeverEvent = true,bTip = false, bNotice = false, dwOrder = 2, szIcon = 'Icon_sk_13002_1.png', szName=T'后起之秀', szText=T[[将角色等级提升至<font color='#008000'>40</font>级]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=25 },
		tabCondition	= { szEvent = 'EventLevelUp', dwValue = 40, fnCheck = If(), fnCount = Do(T'进度','=',T'参数3'), dwNext = 300102 },
	},
	[300102] = {
		tabContent 		= { dwQuality = 2,bTip = false, bNotice = false, dwOrder = 3, szIcon = 'Icon_sk_13002_1.png', szName=T'小有名气', szText=T[[将角色等级提升至<font color='#008000'>50</font>级]] },
		tabReward		= { dwPoint=15, dwGold=30, dwHPLimited=30 },
		tabCondition	= { szEvent = 'EventLevelUp', dwValue = 50, fnCheck = If(), fnCount = Do(T'进度','=',T'参数3'), dwNext = 300103 },
	},
	[300103] = {
		tabContent 		= { bSeverEvent = true,dwQuality = 3,bTip = false, bNotice = false, dwOrder = 4, szIcon = 'Icon_sk_13002_1.png', szName=T'仗剑江湖', szText=T[[将角色等级提升至<font color='#008000'>60</font>级]] },
		tabReward		= { dwPoint=20, dwGold=40, dwHPLimited=35 },
		tabCondition	= { szEvent = 'EventLevelUp', dwValue = 60, fnCheck = If(), fnCount = Do(T'进度','=',T'参数3'), dwNext = 300104 },
	},
	[300104] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 5, szIcon = 'Icon_sk_13002_1.png', szName=T'名声鹊起', szText=T[[将角色等级提升至<font color='#008000'>70</font>级]] },
		tabReward		= { dwPoint=25, dwGold=50, dwHPLimited=40 },
		tabCondition	= { szEvent = 'EventLevelUp', dwValue = 70, fnCheck = If(), fnCount = Do(T'进度','=',T'参数3'), dwNext = 300105 },
	},
	[300105] = {
		tabContent 		= { bSeverEvent = true,dwQuality = 5,bTip = false, bNotice = false, dwOrder = 6, szIcon = 'Icon_sk_13002_1.png', szName=T'扬名立万', szText=T[[将角色等级提升至<font color='#008000'>80</font>级]] },
		tabReward		= { dwPoint=30, dwGold=60, dwHPLimited=50 },
		tabCondition	= { szEvent = 'EventLevelUp', dwValue = 80, fnCheck = If(), fnCount = Do(T'进度','=',T'参数3') },
	},
	[300200] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 7, szIcon = 'Ftb_jm.png', szName=T'八脉出尘', szText=T[[打通<font color='#008000'>阳维脉</font>所有穴位]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventPulseUp1', dwValue = 24, fnCheck = If(T'参数3','>',T'进度'), fnCount = Do(T'进度','=',T'参数3') },
	},	
	[300201] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 8, szIcon = 'Ftb_jm.png', szName=T'八脉造化', szText=T[[打通<font color='#008000'>阴维脉</font>所有穴位]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventPulseUp2', dwValue = 24, fnCheck = If(T'参数3','>',T'进度'), fnCount = Do(T'进度','=',T'参数3') },
	},	
	[300202] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 9, szIcon = 'Ftb_jm.png', szName=T'八脉玄妙', szText=T[[打通<font color='#008000'>阳跷脉</font>所有穴位]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventPulseUp3', dwValue = 24, fnCheck = If(T'参数3','>',T'进度'), fnCount = Do(T'进度','=',T'参数3') },
	},	
	[300203] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 10, szIcon = 'Ftb_jm.png', szName=T'八脉生死', szText=T[[打通<font color='#008000'>阴跷脉</font>所有穴位]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventPulseUp4', dwValue = 24, fnCheck = If(T'参数3','>',T'进度'), fnCount = Do(T'进度','=',T'参数3') },
	},	
	[300204] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 11, szIcon = 'Ftb_jm.png', szName=T'八脉解脱', szText=T[[打通<font color='#008000'>带脉</font>所有穴位]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventPulseUp5', dwValue = 24, fnCheck = If(T'参数3','>',T'进度'), fnCount = Do(T'进度','=',T'参数3') },
	},	
	[300205] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 12, szIcon = 'Ftb_jm.png', szName=T'八脉无为', szText=T[[打通<font color='#008000'>冲脉</font>所有穴位]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventPulseUp6', dwValue = 24, fnCheck = If(T'参数3','>',T'进度'), fnCount = Do(T'进度','=',T'参数3') },
	},	
	[300206] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 13, szIcon = 'Ftb_jm.png', szName=T'八脉神话', szText=T[[打通<font color='#008000'>任脉</font>所有穴位]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventPulseUp7', dwValue = 24, fnCheck = If(T'参数3','>',T'进度'), fnCount = Do(T'进度','=',T'参数3') },
	},	
	[300207] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 14, szIcon = 'Ftb_jm.png', szName=T'八脉无上', szText=T[[打通<font color='#008000'>督脉</font>所有穴位]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventPulseUp8', dwValue = 24, fnCheck = If(T'参数3','>',T'进度'), fnCount = Do(T'进度','=',T'参数3') },
	},	
	[300300] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 15, szIcon = 'Icon_item_2500230_1.png', szName=T'略有小成', szText=T[[实战境界达到<font color='#008000'>略有小成</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventBournUp', dwValue = 1, fnCheck = If(), fnCount = Do(T'进度','+',1) },
	},	
	[300301] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 16, szIcon = 'Icon_item_2500240_1.png', szName=T'心领神会', szText=T[[实战境界达到<font color='#008000'>心领神会</font>]] },
		tabReward		= { dwPoint=15, dwGold=30, dwHPLimited=25 },
		tabCondition	= { szEvent = 'EventBournUp', dwValue = 2, fnCheck = If(), fnCount = Do(T'进度','+',1) },
	},	
	[300302] = {
		tabContent 		= { dwQuality = 3,bTip = false, bNotice = false, dwOrder = 17, szIcon = 'Icon_item_2500250_1.png', szName=T'出类拔萃', szText=T[[实战境界达到<font color='#008000'>出类拔萃</font>]] },
		tabReward		= { dwPoint=20, dwGold=40, dwHPLimited=30 },
		tabCondition	= { szEvent = 'EventBournUp', dwValue = 4, fnCheck = If(), fnCount = Do(T'进度','+',1) },
	},	
	[300303] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 18, szIcon = 'Icon_item_2500280_1.png', szName=T'深不可测', szText=T[[实战境界达到<font color='#008000'>深不可测</font>]] },
		tabReward		= { dwPoint=25, dwGold=50, dwHPLimited=40 },
		tabCondition	= { szEvent = 'EventBournUp', dwValue = 6, fnCheck = If(), fnCount = Do(T'进度','+',1) },
	},	
	[300304] = {
		tabContent 		= { dwQuality = 5,bTip = false, bNotice = false, dwOrder = 19, szIcon = 'Icon_item_2500300_1.png', szName=T'返璞归真', szText=T[[实战境界达到<font color='#008000'>返璞归真</font>]] },
		tabReward		= { dwPoint=30, dwGold=60, dwHPLimited=50 },
		tabCondition	= { szEvent = 'EventBournUp', dwValue = 8, fnCheck = If(), fnCount = Do(T'进度','+',1) },
	},
	-----------------------鸿鹄之志
	[400100] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 1, szIcon = 'Icon_item_4100150_1.png', szName=T'强化五级', szText=T[[强化任意装备到<font color='#008000'>5</font>级]] },
		tabReward		= { dwPoint=5, dwGold=10, dwDefence=3 },
		tabCondition	= { szEvent = 'EventEquipStrong', dwValue = 1, fnCheck = If(T'参数2','=',5), fnCount = Do(T'进度','=',1) },
	},
	[400101] = {
		tabContent 		= { dwQuality = 2,bTip = false, bNotice = false, dwOrder = 2, szIcon = 'Icon_item_4100280_1.png', szName=T'强化十二级', szText=T[[强化任意装备到<font color='#008000'>12</font>级]] },
		tabReward		= { dwPoint=10, dwGold=20, dwDefence=5 },
		tabCondition	= { szEvent = 'EventEquipStrong', dwValue = 1, fnCheck = If(T'参数2','=',12), fnCount = Do(T'进度','=',1) },
	},
	[400102] = {
		tabContent 		= { dwQuality = 4, bTip = false, bNotice = false, dwOrder = 3, szIcon = 'Icon_item_4100090_1.png', szName=T'强化十四级', szText=T[[强化任意装备到<font color='#008000'>14</font>级]] },
		tabReward		= { dwPoint=20, dwGold=40, dwDefence=8 },
		tabCondition	= { szEvent = 'EventEquipStrong', dwValue = 1, fnCheck = If(T'参数2','=',14), fnCount = Do(T'进度','=',1) },
	},
	-- [400200] = {
		-- tabContent 		= { bTip = false, bNotice = false, dwOrder = 4, szIcon = 'Icon_item_1101050_1.png', szName=T'天兵强五', szText=T[[装备在手上的武器为<font color='#008000'>+5</font>]] },
		-- tabReward		= { dwPoint=5, dwGold=10, dwDefence=3 },
		-- tabCondition	= { szEvent = 'EventEquipSuit', dwValue = 1, fnCheck = If(T'参数2','=',10), fnCount = Do(T'进度','=',1) },
	-- },
	-- [400201] = {
		-- tabContent 		= { dwQuality = 2,bTip = false, bNotice = false, dwOrder = 5, szIcon = 'Icon_sk_21001_1.png', szName=T'天兵强十', szText=T[[装备在手上的武器<font color='#008000'>+10</font>]] },
		-- tabReward		= { dwPoint=10, dwGold=20, dwDefence=5 },
		-- tabCondition	= { szEvent = 'EventEquipSuit', dwValue = 1, fnCheck = If(T'参数2','=',11), fnCount = Do(T'进度','=',1) },
	-- },
	-- [400202] = {
		-- tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 6, szIcon = 'Icon_sk_21002_1.png', szName=T'天兵强十五', szText=T[[装备在手上的武器<font color='#008000'>+15</font>]] },
		-- tabReward		= { dwPoint=20, dwGold=40, dwDefence=10 },
		-- tabCondition	= { szEvent = 'EventEquipSuit', dwValue = 1, fnCheck = If(T'参数2','=',12), fnCount = Do(T'进度','=',1) },
	-- },
	-- [400300] = {
		-- tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 7, szIcon = 'Icon_sk_zq_1005_1.png', szName=T'绝世奇紫', szText=T[[全身装备全部为<font color='#008000'>紫色</font>属性]] },
		-- tabReward		= { dwPoint=20, dwGold=40, dwDefence=8 },
		-- tabCondition	= { szEvent = 'EventEquipSuit', dwValue = 1, fnCheck = If(T'参数2','=',1), fnCount = Do(T'进度','=',1) },
	-- },
	-- [400301] = {
		-- tabContent 		= { dwQuality = 5,bTip = false, bNotice = false, dwOrder = 8, szIcon = 'Icon_sk_13007_1.png', szName=T'绝世奇金', szText=T[[全身装备全部为<font color='#008000'>金色</font>属性]] },
		-- tabReward		= { dwPoint=30, dwGold=60, dwDefence=10 },
		-- tabCondition	= { szEvent = 'EventEquipSuit', dwValue = 1, fnCheck = If(T'参数2','=',2), fnCount = Do(T'进度','=',1) },
	-- },
	-- [400400] = {
		-- tabContent 		= { dwQuality = 2,bTip = false, bNotice = false, dwOrder = 9, szIcon = 'Icon_Buff_1001_1.png', szName=T'神甲强五', szText=T[[全身装备均强化达到<font color='#008000'>5</font>级]] },
		-- tabReward		= { dwPoint=10, dwGold=20, dwDefence=3 },
		-- tabCondition	= { szEvent = 'EventEquipSuit', dwValue = 1, fnCheck = If(T'参数2','=',4), fnCount =  Do() },
	-- },
	-- [400401] = {
		-- tabContent 		= { dwQuality = 3,bTip = false, bNotice = false, dwOrder = 10, szIcon = 'Icon_BaoJian_hp06_1.png', szName=T'神甲强十', szText=T[[全身装备均强化达到<font color='#008000'>10</font>级]] },
		-- tabReward		= { dwPoint=20, dwGold=40, dwDefence=5 },
		-- tabCondition	= { szEvent = 'EventEquipSuit', dwValue = 1, fnCheck = If(T'参数2','=',5), fnCount =  Do() },
	-- },
	-- [400402] = {
		-- tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 11, szIcon = 'Icon_BaoJian_hp07_1.png', szName=T'神甲强十五', szText=T[[全身装备均强化达到<font color='#008000'>15</font>级]] },
		-- tabReward		= { dwPoint=30, dwGold=60, dwDefence=10 },
		-- tabCondition	= { szEvent = 'EventEquipSuit', dwValue = 1, fnCheck = If(T'参数2','=',6), fnCount =  Do() },
	-- },
	[400500] = {
		tabContent 		= { dwQuality = 2,bTip = false, bNotice = false, dwOrder = 12, szIcon = 'Icon_item_1204030_1.png', szName=T'宝甲三阶', szText=T[[获得一件<font color='#008000'>三阶</font>的护身宝甲]] },
		tabReward		= { dwPoint=10, dwGold=20, dwDefence=3 },
		tabCondition	= { szEvent = 'EventUpgradeAmulet', dwValue = 3, fnCheck = If(T'参数2','>=',1), fnCount = Do(T'进度','=',T'参数2') },
	},
	[400501] = {
		tabContent 		= { dwQuality = 3,bTip = false, bNotice = false, dwOrder = 13, szIcon = 'Icon_item_1202010_1.png', szName=T'宝甲五阶', szText=T[[获得一件<font color='#008000'>五阶</font>的护身宝甲]] },
		tabReward		= { dwPoint=20, dwGold=40, dwDefence=5 },
		tabCondition	= { szEvent = 'EventUpgradeAmulet', dwValue = 5, fnCheck = If(T'参数2','>=',1), fnCount = Do(T'进度','=',T'参数2') },
	},
	[400502] = {
		tabContent 		= { dwQuality = 4,bTip = false, bNotice = false, dwOrder = 14, szIcon = 'Icon_item_1202030_1.png', szName=T'宝甲七阶', szText=T[[获得一件<font color='#008000'>七阶</font>的护身宝甲]] },
		tabReward		= { dwPoint=30, dwGold=60, dwDefence=10 },
		tabCondition	= { szEvent = 'EventUpgradeAmulet', dwValue = 7, fnCheck = If(T'参数2','>=',1), fnCount = Do(T'进度','=',T'参数2') },
	},
	-----------------------纵横九州
	[500100] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 1, szIcon = 'Icon_item_1700000_1.png', szName=T'坐骑二阶', szText=T[[坐骑达到<font color='#008000'>二阶</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventMountUpGrade', dwValue = 2, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 500101 },
	},
	[500101] = {
		tabContent 		= { bTip = true, bNotice = false, dwOrder = 2, szIcon = 'Icon_item_9401000_1.png', szName=T'坐骑三阶', szText=T[[坐骑达到<font color='#008000'>三阶</font>]] },
		tabReward		= { dwPoint=8, dwGold=15, dwHPLimited=25 },
		tabCondition	= { szEvent = 'EventMountUpGrade', dwValue = 3, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 500102 },
	},
	[500102] = {
		tabContent 		= { bTip = true, bNotice = false, dwOrder = 3, szIcon = 'Icon_item_9405000_1.png', szName=T'坐骑四阶', szText=T[[坐骑达到<font color='#008000'>四阶</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=30 },
		tabCondition	= { szEvent = 'EventMountUpGrade', dwValue = 4, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 500103 },
	},
	[500103] = {
		tabContent 		= { dwQuality = 2,bTip = true, bNotice = false, dwOrder = 4, szIcon = 'boss-zuoqilang_1.png', szName=T'坐骑五阶', szText=T[[坐骑达到<font color='#008000'>五阶</font>]] },
		tabReward		= { dwPoint=15, dwGold=30, dwHPLimited=35 },
		tabCondition	= { szEvent = 'EventMountUpGrade', dwValue = 5, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 500104 },
	},
	[500104] = {
		tabContent 		= { dwQuality = 3,bTip = true, bNotice = false, dwOrder = 5, szIcon = 'Icon_item_9406000_1.png', szName=T'坐骑六阶', szText=T[[坐骑达到<font color='#008000'>六阶</font>]] },
		tabReward		= { dwPoint=20, dwGold=40, dwHPLimited=40,},
		tabCondition	= { szEvent = 'EventMountUpGrade', dwValue = 6, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 500105 },
	},
	[500105] = {
		tabContent 		= { dwQuality = 4,bTip = true, bNotice = false, dwOrder = 6, szIcon = 'Icon_item_9407000_1.png', szName=T'坐骑七阶', szText=T[[坐骑达到<font color='#008000'>七阶</font>]] },
		tabReward		= { dwPoint=25, dwGold=50, dwHPLimited=45,},
		tabCondition	= { szEvent = 'EventMountUpGrade', dwValue = 7, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 500106 },
	},
	[500106] = {
		tabContent 		= { dwQuality = 5,bTip = true, bNotice = false, dwOrder = 7, szIcon = 'Icon_item_9408000_1.png', szName=T'坐骑八阶', szText=T[[坐骑达到<font color='#008000'>八阶</font>]] },
		tabReward		= { dwPoint=30, dwGold=60, dwHPLimited=50 },
		tabCondition	= { szEvent = 'EventMountUpGrade', dwValue = 8, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 500107 },
	},
	[500107] = {
		tabContent 		= { dwQuality = 5,bTip = true, bNotice = false, dwOrder = 8, szIcon = 'Icon_item_9409000_1.png', szName=T'坐骑九阶', szText=T[[坐骑达到<font color='#008000'>九阶</font>]] },
		tabReward		= { dwPoint=30, dwGold=60, dwHPLimited=50 },
		tabCondition	= { szEvent = 'EventMountUpGrade', dwValue = 9, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3') },
	},
	
	[500200] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 30, szIcon = 'Icon_sk_zq_1007_1.png', szName=T'坐骑50级', szText=T[[任意坐骑达到<font color='#008000'>50级</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwHPLimited=20 },
		tabCondition	= { szEvent = 'EventMountUpLevel', dwValue = 50, fnCheck = If(T'参数2','>=',1), fnCount = Do(T'进度','=',T'参数2'), dwNext = 500201 },
	},
	[500201] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 31, szIcon = 'Icon_sk_zq_1007_1.png', szName=T'坐骑60级', szText=T[[任意坐骑达到<font color='#008000'>60级</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwHPLimited=25 },
		tabCondition	= { szEvent = 'EventMountUpLevel', dwValue = 60, fnCheck = If(T'参数2','>=',1), fnCount = Do(T'进度','=',T'参数2') , dwNext = 500202 },
	},
	[500202] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 32, szIcon = 'Icon_sk_zq_1007_1.png', szName=T'坐骑70级', szText=T[[任意坐骑达到<font color='#008000'>70级</font>]] },
		tabReward		= { dwPoint=15, dwGold=30, dwHPLimited=30 },
		tabCondition	= { szEvent = 'EventMountUpLevel', dwValue = 70, fnCheck = If(T'参数2','>=',1), fnCount = Do(T'进度','=',T'参数2'), dwNext = 500203 },
	},
	[500203] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 33, szIcon = 'Icon_sk_zq_1007_1.png', szName=T'坐骑80级', szText=T[[任意坐骑达到<font color='#008000'>80级</font>]] },
		tabReward		= { dwPoint=20, dwGold=40, dwHPLimited=35 },
		tabCondition	= { szEvent = 'EventMountUpLevel', dwValue = 80, fnCheck = If(T'参数2','>=',1), fnCount = Do(T'进度','=',T'参数2'), dwNext = 500204 },
	},
	[500204] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 34, szIcon = 'Icon_sk_zq_1007_1.png', szName=T'坐骑90级', szText=T[[任意坐骑达到<font color='#008000'>90级</font>]] },
		tabReward		= { dwPoint=25, dwGold=50, dwHPLimited=40 },
		tabCondition	= { szEvent = 'EventMountUpLevel', dwValue = 90, fnCheck = If(T'参数2','>=',1), fnCount = Do(T'进度','=',T'参数2'), dwNext = 500205 },
	},
	[500205] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 35, szIcon = 'Icon_sk_zq_1007_1.png', szName=T'坐骑100级', szText=T[[任意坐骑达到<font color='#008000'>100级</font>]] },
		tabReward		= { dwPoint=30, dwGold=60, dwHPLimited=50 },
		tabCondition	= { szEvent = 'EventMountUpLevel', dwValue = 100, fnCheck = If(T'参数2','>=',1), fnCount = Do(T'进度','=',T'参数2') },
	},
	-----------------------武林制霸
	[600100] = {
		tabContent 		= { bTip = true, bNotice = false, dwOrder = 1, szIcon = 'Icon_sk_21002_1.png', szName=T'一百连斩', szText=T[[短时间内击杀<font color='#008000'>100只</font>怪]] },
		tabReward		= { dwPoint=5, dwGold=10, dwAttack=2 },
		tabCondition	= { szEvent = 'EventContinueKill', dwValue = 100, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 600101 },
	},
	[600101] = {
		tabContent 		= { bTip = true, bNotice = false, dwOrder = 2, szIcon = 'Icon_item_5102010_1.png', szName=T'二百连斩', szText=T[[短时间内击杀<font color='#008000'>200只</font>怪]] },
		tabReward		= { dwPoint=8, dwGold=15, dwAttack=4 },
		tabCondition	= { szEvent = 'EventContinueKill', dwValue = 200, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 600102 },
	},
	[600102] = {
		tabContent 		= { bTip = true, bNotice = false, dwOrder = 3, szIcon = 'Icon_sk_41001_1.png', szName=T'三百连斩', szText=T[[短时间内击杀<font color='#008000'>300只</font>怪]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=6 },
		tabCondition	= { szEvent = 'EventContinueKill', dwValue = 300, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 600103 },
	},
	[600103] = {
		tabContent 		= { bTip = true, bNotice = false, dwOrder = 4, szIcon = 'Icon_sk_31005_1.png', szName=T'四百连斩', szText=T[[短时间内击杀<font color='#008000'>400只</font>怪]] },
		tabReward		= { dwPoint=15, dwGold=30, dwAttack=8 },
		tabCondition	= { szEvent = 'EventContinueKill', dwValue = 400, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 600104 },
	},
	[600104] = {
		tabContent 		= { dwQuality = 2,bTip = true, bNotice = false, dwOrder = 5, szIcon = 'Icon_sk_21000_1.png', szName=T'五百连斩', szText=T[[短时间内击杀<font color='#008000'>500只</font>怪]] },
		tabReward		= { dwPoint=20, dwGold=40, dwAttack=10 },
		tabCondition	= { szEvent = 'EventContinueKill', dwValue = 500, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 600105 },
	},
	[600105] = {
		tabContent 		= { dwQuality = 3,bTip = true, bNotice = false, dwOrder = 6, szIcon = 'Icon_item_5101030_1.png', szName=T'六百连斩', szText=T[[短时间内击杀<font color='#008000'>600只</font>怪]] },
		tabReward		= { dwPoint=25, dwGold=50, dwAttack=12 },
		tabCondition	= { szEvent = 'EventContinueKill', dwValue = 600, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3'), dwNext = 600106 },
	},
	[600106] = {
		tabContent 		= { bSeverEvent = true,dwQuality = 4,bTip = true, bNotice = false, dwOrder = 7, szIcon = 'Icon_item_5101020_1.png', szName=T'七百连斩', szText=T[[短时间内击杀<font color='#008000'>700只</font>怪]] },
		tabReward		= { dwPoint=30, dwGold=60, dwAttack=14 },
		tabCondition	= { szEvent = 'EventContinueKill', dwValue = 700, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3') },
	},
	[600200] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 8, szIcon = 'Icon_sk_21003_1.png', szName=T'精英挑战者', szText=T[[累计击杀<font color='#008000'>50只精英</font>怪物]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=4 },
		tabCondition	= { szEvent = 'EventKillMonster', dwValue = 50, fnCheck = If(T'参数4','=',1), fnCount = Do(T'进度','+',1), dwNext = 600201 },
	},
	[600201] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 9, szIcon = 'Icon_sk_51001_1.png', szName=T'精英猎杀者', szText=T[[累计击杀<font color='#008000'>500只精英</font>怪物]] },
		tabReward		= { dwPoint=20, dwGold=40, dwAttack=6 },
		tabCondition	= { szEvent = 'EventKillMonster', dwValue = 500, fnCheck = If(T'参数4','=',1), fnCount = Do(T'进度','+',1), dwNext = 600202 },
	},
	[600202] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 10, szIcon = 'Icon_sk_31003_1.png', szName=T'精英灭绝者', szText=T[[累计击杀<font color='#008000'>2000只精英</font>怪物]] },
		tabReward		= { dwPoint=30, dwGold=60, dwAttack=8 },
		tabCondition	= { szEvent = 'EventKillMonster', dwValue = 2000, fnCheck = If(T'参数4','=',1), fnCount = Do(T'进度','+',1) },
	},
	[600300] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 11, szIcon = 'Icon_sk_13018_1.png', szName=T'BOSS挑战者', szText=T[[累计击杀<font color='#008000'>10个BOSS</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=6 },
		tabCondition	= { szEvent = 'EventKillMonster', dwValue = 10, fnCheck = If(T'参数4','=',2), fnCount = Do(T'进度','+',1) , dwNext = 600301},
	},
	[600301] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 12, szIcon = 'Icon_sk_13015_1.png', szName=T'BOSS猎杀者', szText=T[[累计击杀<font color='#008000'>50个BOSS</font>]] },
		tabReward		= { dwPoint=20, dwGold=40, dwAttack=8 },
		tabCondition	= { szEvent = 'EventKillMonster', dwValue = 50, fnCheck = If(T'参数4','=',2), fnCount = Do(T'进度','+',1), dwNext = 600302 },
	},
	[600302] = {
		tabContent 		= { bTip = false, bNotice = false, dwOrder = 13, szIcon = 'Icon_sk_zq_1008_1.png', szName=T'BOSS灭绝者', szText=T[[累计击杀<font color='#008000'>100个BOSS</font>]] },
		tabReward		= { dwPoint=30, dwGold=60, dwAttack=10 },
		tabCondition	= { szEvent = 'EventKillMonster', dwValue = 100, fnCheck = If(T'参数4','=',2), fnCount = Do(T'进度','+',1) },
	},
	-----------------------传世神话
	[700100] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 1,bTip = true, bNotice = true, dwOrder = 1, szIcon = 'Icon_item_2500280_1.png', szName=T'作恶多端', szText=T[[打败<font color='#008000'>20个玩家</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwAttack=4 },
		tabCondition	= { szEvent = 'EventKillPlayer', dwValue = 20, fnCheck = If(), fnCount = Do() },
	},
	[700101] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 3,bTip = true, bNotice = true, dwOrder = 2, szIcon = 'Icon_sk_13003_0.png', szName=T'黑榜恶人', szText=T[[打败<font color='#008000'>200个玩家</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=6 },
		tabCondition	= { szEvent = 'EventKillPlayer', dwValue = 200, fnCheck = If(), fnCount = Do() },
	},
	[700102] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 4,bTip = true, bNotice = true, dwOrder = 3, szIcon = 'Icon_sk_61001_1.png', szName=T'无恶不作', szText=T[[打败<font color='#008000'>1000个玩家</font>]] },
		tabReward		= { dwPoint=20, dwGold=40, dwAttack=8 },
		tabCondition	= { szEvent = 'EventKillPlayer', dwValue = 1000, fnCheck = If(), fnCount = Do() },
	},
	[700103] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 5,bTip = true, bNotice = true, dwOrder = 4, szIcon = 'Icon_sk_11002_1.png', szName=T'混世魔王', szText=T[[打败<font color='#008000'>5000个玩家</font>]] },
		tabReward		= { dwPoint=30, dwGold=60, dwAttack=10 },
		tabCondition	= { szEvent = 'EventKillPlayer', dwValue = 5000, fnCheck = If(), fnCount = Do() },
	},
	[700200] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 5, szIcon = 'Icon_item_2500070_1.png', szName=T'无垠生命', szText=T[[消耗<font color='#008000'>50个</font> 九花玉露丸·大]] },
		tabReward		= { dwPoint=5, dwGold=10, dwAttack=6 },
		tabCondition	= { szEvent = 'EventUseItem', dwValue = 50, fnCheck = If(T'参数2','=',2500072), fnCount = Do(T'进度','+',1) },
	},
	[700201] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 4,bTip = true, bNotice = true, dwOrder = 6, szIcon = 'Icon_item_2500070_1.png', szName=T'生命之光', szText=T[[消耗<font color='#008000'>200个</font> 九花玉露丸·大]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=10 },
		tabCondition	= { szEvent = 'EventUseItem', dwValue = 200, fnCheck = If(T'参数2','=',2500072), fnCount = Do(T'进度','+',1) },
	},
	[700300] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 7, szIcon = 'Icon_item_2500080_1.png', szName=T'精力充沛', szText=T[[消耗<font color='#008000'>50个</font> 元气通神酒·大]] },
		tabReward		= { dwPoint=5, dwGold=10, dwAttack=6 },
		tabCondition	= { szEvent = 'EventUseItem', dwValue = 50, fnCheck = If(T'参数2','=',2500082), fnCount = Do(T'进度','+',1) },
	},
	[700301] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 4,bTip = true, bNotice = true, dwOrder = 8, szIcon = 'Icon_item_2500080_1.png', szName=T'真气之灵', szText=T[[消耗<font color='#008000'>200个</font> 元气通神酒·大]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=10 },
		tabCondition	= { szEvent = 'EventUseItem', dwValue = 200, fnCheck = If(T'参数2','=',2500082), fnCount = Do(T'进度','+',1) },
	},
	[700400] = {
		tabContent 	    = { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 9, szIcon = 'Icon_item_2500300_1.png', szName=T'经验之环', szText=T[[消耗<font color='#008000'>20个</font> 双倍经验丹]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=10 },
		tabCondition	= { szEvent = 'EventUseItem', dwValue = 20, fnCheck = If(T'参数2','=',2400110), fnCount = Do(T'进度','+',1) },
	},
	[700500] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 10, szIcon = 'Icon_sk_13018_1.png', szName=T'厄运缠身', szText=T[[被<font color='#008000'>怪</font>杀死<font color='#008000'>50次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=10 },
		tabCondition	= { szEvent = 'EventBeKilled', dwValue = 50, fnCheck = If(T'参数4','=',2), fnCount = Do() },
	},
	[700600] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 11, szIcon = 'Icon_sk_13022_1.png', szName=T'完美加点', szText=T[[消耗<font color='#008000'>10个</font> 洗点符]] },
		tabReward		= { dwPoint=20, dwGold=40, dwAttack=10 },
		tabCondition	= { szEvent = 'EventUseItem', dwValue = 10, fnCheck = If(T'参数2','=',2500090), fnCount = Do(T'进度','+',1) },
	},
	[700700] = {
		tabContent 	    = { bIsHide = true,dwQuality = 1,bTip = true, bNotice = true, dwOrder = 12, szIcon = 'Icon_item_5500010_1.png', szName=T'大喇叭', szText=T[[消耗<font color='#008000'>10个</font> 千里传音]] },
		tabReward		= { dwPoint=5, dwGold=10, dwAttack=6 },
		tabCondition	= { szEvent = 'EventUseItem', dwValue = 10, fnCheck = If(T'参数2','=',5500010), fnCount = Do(T'进度','+',1) },
	},
	[700701] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 13, szIcon = 'Icon_item_5104040_1.png', szName=T'噪音声源', szText=T[[消耗<font color='#008000'>200个</font> 千里传音]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=10 },
		tabCondition	= { szEvent = 'EventUseItem', dwValue = 200, fnCheck = If(T'参数2','=',5500010), fnCount = Do(T'进度','+',1) },
	},
	[700702] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 4,bTip = true, bNotice = true, dwOrder = 14, szIcon = 'Icon_sk_12015_1.png', szName=T'海枯石烂', szText=T[[消耗<font color='#008000'>3000个</font> 千里传音]] },
		tabReward		= { dwPoint=20, dwGold=40, dwAttack=15 },
		tabCondition	= { szEvent = 'EventUseItem', dwValue = 3000, fnCheck = If(T'参数2','=',5500010), fnCount = Do(T'进度','+',1) },
	},
	[700703] = {
		tabContent 	    = { bSeverEvent = true,bIsHide = true,dwQuality = 5,bTip = true, bNotice = true, dwOrder = 15, szIcon = 'Icon_sk_12008_1.png', szName=T'衣食父母', szText=T[[消耗<font color='#008000'>9999个</font> 千里传音]] },
		tabReward		= { dwPoint=30, dwGold=60, dwAttack=20 },
		tabCondition	= { szEvent = 'EventUseItem', dwValue = 9999, fnCheck = If(T'参数2','=',5500010), fnCount = Do(T'进度','+',1) },
	},
	[700800] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 16, szIcon = 'Icon_sk_13017_1.png', szName=T'命运之灵', szText=T[[释放无双<font color='#008000'>100次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=5 },
		tabCondition	= { szEvent = 'EventUseSkill', dwValue = 100, fnCheck = If(T'参数2','=',61001), fnCount = Do(T'进度','+',1) },
	},
	[700801] = {
		tabContent 		= { bSeverEvent = true,bIsHide = true,dwQuality = 3,bTip = true, bNotice = true, dwOrder = 17, szIcon = 'Icon_sk_13008_1.png', szName=T'厄运之灵', szText=T[[释放无双<font color='#008000'>1000次</font>]] },
		tabReward		= { dwPoint=20, dwGold=40, dwAttack=10 },
		tabCondition	= { szEvent = 'EventUseSkill', dwValue = 1000, fnCheck = If(T'参数2','=',61001), fnCount = Do(T'进度','+',1) },
	},
	[700900] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 18, szIcon = 'Icon_item_2500260_1.png', szName=T'技术交流', szText=T[[与<font color='#008000'>演武节堂</font>的<font color='#008000'>新兵教官</font>切磋超过<font color='#008000'>15次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=5 },
		tabCondition	= { szEvent = 'EventKillMonster', dwValue = 15, fnCheck = If(T'参数3','=',50710011), fnCount = Do(T'进度','+',1) },
	},
	[700901] = {
		tabContent 		= {bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 19, szIcon = 'Icon_item_2500260_1.png', szName=T'眼疾手快', szText=T[[打死<font color='#008000'>大破联营第一层</font>的<font color='#008000'>偷懒哨兵</font>，达到<font color='#008000'>2次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=5 },
		tabCondition	= { szEvent = 'EventKillMonster', dwValue = 2, fnCheck = If(T'参数3','=',50042001), fnCount = Do(T'进度','+',1) },
	},
	[701000] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 20, szIcon = 'Icon_item_2500270_1.png', szName=T'恶趣味', szText=T[[打死<font color='#008000'>襄阳城</font>的<font color='#008000'>猪刚鬣</font>，达到<font color='#008000'>2次</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwAttack=4 },
		tabCondition	= { szEvent = 'EventKillMonster', dwValue = 2, fnCheck = If(T'参数3','=',10022001), fnCount = Do(T'进度','+',1) },
	},
	[701001] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 21, szIcon = 'Icon_item_2500280_1.png', szName=T'重口味', szText=T[[打死<font color='#008000'>襄阳城</font>的<font color='#008000'>猪刚鬣</font>，达到<font color='#008000'>50次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=6 },
		tabCondition	= { szEvent = 'EventKillMonster', dwValue = 50, fnCheck = If(T'参数3','=',10022001), fnCount = Do(T'进度','+',1) },
	},
	[701002] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 22, szIcon = 'Icon_item_2500260_1.png', szName=T'弱爆了', szText=T[[被<font color='#008000'>襄阳城</font>的<font color='#008000'>猪刚鬣</font>，顶死<font color='#008000'>2次</font>]] },
		tabReward		= { dwPoint=5, dwGold=10, dwAttack=4 },
		tabCondition	= { szEvent = 'EventBeKilled', dwValue = 2, fnCheck = If(T'参数5','=',10022001), fnCount = Do(T'进度','+',1) },
	},
	[701003] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 23, szIcon = 'Icon_item_2500260_1.png', szName=T'一出悲剧', szText=T[[被<font color='#008000'>襄阳城</font>的<font color='#008000'>猪刚鬣</font>，顶死<font color='#008000'>50次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=6 },
		tabCondition	= { szEvent = 'EventBeKilled', dwValue = 50, fnCheck = If(T'参数5','=',10022001), fnCount = Do(T'进度','+',1) },
	},
	[701100] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 24, szIcon = 'Icon_sk_11002_1.png', szName=T'自娱自乐', szText=T[[<font color='#008000'></font><font color='#008000'>自杀</font><font color='#008000'>100次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=4 },
		tabCondition	= { szEvent = 'EventBeKilled', dwValue = 100, fnCheck = If(T'参数3','=',0), fnCount = Do(T'进度','+',1) },
	},
	[701200] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 25, szIcon = 'Icon_sk_13020_1.png', szName=T'从头再来', szText=T[[新手村：<font color='#008000'>剧情任务中</font>被<font color='#008000'>“断”</font>杀死<font color='#008000'>1次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=4 },
		tabCondition	= { szEvent = 'EventBeKilled', dwValue = 1, fnCheck = If(T'参数5','=',10012004), fnCount = Do(T'进度','+',1) },
	},
	[701201] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 26, szIcon = 'Icon_sk_13009_0.png', szName=T'泥菩萨', szText=T[[襄阳野郊：<font color='#008000'>剧情任务中</font>被<font color='#008000'>“术虎”</font>杀死<font color='#008000'>1次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=4 },
		tabCondition	= { szEvent = 'EventBeKilled', dwValue = 1, fnCheck = If(T'参数5','=',10032007), fnCount = Do(T'进度','+',1) },
	},
	[701202] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 27, szIcon = 'Icon_sk_60002_1.png', szName=T'怜香惜玉', szText=T[[桃花岛：<font color='#008000'>剧情任务中</font>被<font color='#008000'>“梁梦儿”</font>杀死<font color='#008000'>1次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=4 },
		tabCondition	= { szEvent = 'EventBeKilled', dwValue = 1, fnCheck = If(T'参数5','=',50862001), fnCount = Do(T'进度','+',1) },
	},
	[701203] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 28, szIcon = 'Icon_sk_13011_0.png', szName=T'死于非命', szText=T[[大理：<font color='#008000'>黑沼迷泽剧情任务中</font>被<font color='#008000'>泥浆沼气</font>吞噬死<font color='#008000'>1次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=4 },
		tabCondition	= { szEvent = 'EventBeKilled', dwValue = 1, fnCheck = If(T'参数5','=',80002001), fnCount = Do(T'进度','+',1) },
	},
	[701204] = {
		tabContent 		= { bIsHide = true,dwQuality = 2,bTip = true, bNotice = true, dwOrder = 29, szIcon = 'Icon_sk_60004_1.png', szName=T'喜闻乐见', szText=T[[大理：<font color='#008000'>黑沼迷泽剧情任务中</font>被<font color='#008000'>“九尾灵狐”</font>杀死<font color='#008000'>1次</font>]] },
		tabReward		= { dwPoint=10, dwGold=20, dwAttack=4 },
		tabCondition	= { szEvent = 'EventBeKilled', dwValue = 1, fnCheck = If(T'参数5','=',10092014), fnCount = Do(T'进度','+',1) },
	},
	[701300] = {
		tabContent 		= { bIsHide = true,dwQuality = 5,bTip = true, bNotice = true, dwOrder = 30, szIcon = 'boss-qinglong.png', szName=T'至尊青龙', szText=T[[坐骑达到<font color='#008000'>青龙</font>]] },
		tabReward		= { dwPoint=100, dwGold=200, dwHPLimited=100 },
		tabCondition	= { szEvent = 'EventMountUpGrade', dwValue = 10, fnCheck = If(T'参数3','>=',1), fnCount = Do(T'进度','=',T'参数3') },
	},
	
}

local tabValidAchievement = {}
for k,v in pairs(AchievementListConfig) do
	for _,i in pairs(v.tabAchievementList) do
		tabValidAchievement[i] = true
	end
end
for k,v in pairs(AchievementConfig) do
	if not tabValidAchievement[k] then
		AchievementConfig[k] = nil
	end
end
for k,v in pairs(AchievementConfig) do
	local dwNext = v.tabCondition.dwNext
	if dwNext then
		local t = AchievementConfig[dwNext]
		if not t then
			print('Invalid dwNext:'..dwNext..' in Achievement: '..k)
			v.tabCondition.dwNext = nil
		else
			t.tabCondition.dwLast = k
		end
	end
end
