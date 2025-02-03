----境界
--计算PVP实战经验
function _G.BournFormulaPvPExp (dwSourPlayerLv,dwDesPlayerLv)
	return math.abs(dwSourPlayerLv - dwDesPlayerLv);
end
--计算普通实战经验
function _G.BournFormulaExp (dwMonsterLv)
	return math.floor(0+(dwMonsterLv-1)*(0.1+(dwMonsterLv-2)*0.05));
end
--服务器计算突破境界成功率
--dwPercent,客户端成功率
--dwCiFuValue，天宫值
--dwBournLv，境界等级
function _G.BournFormulaCountPercent(dwPercent,dwCiFuValue,dwBournLv)
	return dwPercent
end
----经脉
--计算经脉分享经验
--dwtype冲脉类型
function _G.FormulaPulseExp(dwDestPlayerLv,dwtype)
	
	local dwexp =RoleUpLevelConfig[dwDestPlayerLv].dwMuseParam
	
	if dwtype==2 then
		dwexp = dwexp* 0.25
	end

	return math.floor(dwexp);

end

--计算悟增长
--dwTotalLevel总经脉层数
--dwCurPulseLevel当前经脉层数
function _G.FormulaPulseWuValue(dwTotalLevel,dwCurPulseLevel)

	return 125

end
--随机一种悟效果
--dwType 悟效果号
-- function _G.FormulaPulseWuType(dwType)
	
-- end
--冲脉伤害的倍数计算
function _G.CountPulseHurtValue(objPlayer,objMonster)
	local dwPer = 6;
	
	local dwMyLevel = objPlayer:GetLevel();
	local dwEnemyLevel = objMonster:GetLevel();
	if dwEnemyLevel > dwMyLevel then
		dwPer = 3;
	end
	
	return dwPer;
end;
----五行
--五行真气增长速度公式
--==玩家等级 * 1 + 120 + 120 * (五行等级/10 + 0.3)
--参数：角色等级lv，增长基数 m_wuxing_speed_base = 25，增长倍数基数 m_wuxing_lv_base = 8，五行等级
function _G.ERF_Count_WuxingSpeed(player_lv,wuxing_lv)
	--return ( player_lv * 2 ) + 73 + FiveElemConfig[wuxing_lv+1].resume
	return FiveElemConfig[wuxing_lv+1].resume
end

--五行恢复速度（附加速度）
--dwTime：疾蓄剩余时间
--bMember：Vip状态-true /false
function _G.ERF_Count_WuxingSpeedEx(player_lv,wuxing_lv,dwTime,bMember)
	local value
	local JiXuPro
	local VipPio
	
	value	=	0			--积蓄和VIP的五行真气提升
	JiXuPro	=	0.1			--积蓄的五行真气提升系数
	VipPio	=	0.1			--VIP的五行真气提升系数
	
	if dwTime ~= 0 then
		value = value + ERF_Count_WuxingSpeed(player_lv,wuxing_lv) * JiXuPro
	end
	
	if bMember == true then
		value = value + ERF_Count_WuxingSpeed(player_lv,wuxing_lv) * VipPio
	end
		
	return math.floor(value)
end

--五行属性计算，参数：五行等级，五行类别
--五行系别等级 lv	
--五行系别	   _type
function _G.ERF_Count_AttribOfWuxing(lv,_type)
	if lv == 0 then
		return 0
	end
 	if _type == _G.enumFiveElemType.Metal then
		return FiveElemConfig[lv+1].atk
	end
	if _type == _G.enumFiveElemType.Wood then
		return FiveElemConfig[lv+1].hpmax
	end
	if _type == _G.enumFiveElemType.Water then
		return FiveElemConfig[lv+1].flee
	end
	if _type == _G.enumFiveElemType.Fire then
		return FiveElemConfig[lv+1].crit
	end
	if _type == _G.enumFiveElemType.Earth then
		return FiveElemConfig[lv+1].def
	end
	if _type == _G.enumFiveElemType.Dantian then
		return FiveElemConfig[lv+1].mpmax
	end
	
	
	
	
	return lv
end

--五行容量计算，参数：等级
--等级 lv

function _G.ERF_Count_tempOfWuxing(lv)
	return FiveElemConfig[lv+1].dantian_limit
end


--五行真气消耗，参数：等级，五行类别
--等级   lv
--五行系别	   _type

function _G.ERF_Count_ConsumeOfWuxing(lv,_type)
	--print('_type =',_type)
	--金。木。水。火。土
	if _type == _G.enumFiveElemType.Metal then
		return FiveElemConfig[lv+1].expend_1 , 0 , FiveElemConfig[lv+1].expend_3 , 0 , FiveElemConfig[lv+1].expend_2
	--	return FiveElemConfig[lv+1].expend_1 , FiveElemConfig[lv+1].expend_5 , FiveElemConfig[lv+1].expend_4,FiveElemConfig[lv+1].expend_3,FiveElemConfig[lv+1].expend_2
	end
	if _type == _G.enumFiveElemType.Wood then
		return 0 , FiveElemConfig[lv+1].expend_1 , FiveElemConfig[lv+1].expend_2 , FiveElemConfig[lv+1].expend_3 , 0
	--	return FiveElemConfig[lv+1].expend_3,FiveElemConfig[lv+1].expend_1,FiveElemConfig[lv+1].expend_2,FiveElemConfig[lv+1].expend_4,FiveElemConfig[lv+1].expend_5
	end
	if _type == _G.enumFiveElemType.Water then
		return FiveElemConfig[lv+1].expend_2 , FiveElemConfig[lv+1].expend_3 , FiveElemConfig[lv+1].expend_1 , 0 , 0
	--	return FiveElemConfig[lv+1].expend_2,FiveElemConfig[lv+1].expend_4,FiveElemConfig[lv+1].expend_1,FiveElemConfig[lv+1].expend_5,FiveElemConfig[lv+1].expend_3
	end
	if _type == _G.enumFiveElemType.Fire then
		return 0 , FiveElemConfig[lv+1].expend_2 , 0 , FiveElemConfig[lv+1].expend_1 , FiveElemConfig[lv+1].expend_3
	--	return FiveElemConfig[lv+1].expend_5,FiveElemConfig[lv+1].expend_2,FiveElemConfig[lv+1].expend_3,FiveElemConfig[lv+1].expend_1,FiveElemConfig[lv+1].expend_4
	end
	if _type == _G.enumFiveElemType.Earth then
		return FiveElemConfig[lv+1].expend_3 , 0 , 0 , FiveElemConfig[lv+1].expend_2 , FiveElemConfig[lv+1].expend_1
	--	return FiveElemConfig[lv+1].expend_4,FiveElemConfig[lv+1].expend_3,FiveElemConfig[lv+1].expend_5,FiveElemConfig[lv+1].expend_2,FiveElemConfig[lv+1].expend_1
	end
	if _type == _G.enumFiveElemType.Dantian then
	return FiveElemConfig[lv+1].expend_dt , FiveElemConfig[lv+1].expend_dt , FiveElemConfig[lv+1].expend_dt , FiveElemConfig[lv+1].expend_dt , FiveElemConfig[lv+1].expend_dt
	end
end



--五行升级需求：人物等级
--参数：五行等级，五行类别
--等级   lv
--五行系别	   _type
--函数返回 人物等级
function _G.ERF_Limit_LvOfWuxingPlayer(lv,_type)
	if _type == _G.enumFiveElemType.Metal then
		return FiveElemConfig[lv+1].wuxing_lv
	end
	if _type == _G.enumFiveElemType.Wood then
		return FiveElemConfig[lv+1].wuxing_lv
	end
	if _type == _G.enumFiveElemType.Water then
		return FiveElemConfig[lv+1].wuxing_lv
	end
	if _type == _G.enumFiveElemType.Fire then
		return FiveElemConfig[lv+1].wuxing_lv
	end
	if _type == _G.enumFiveElemType.Earth then
		return FiveElemConfig[lv+1].wuxing_lv
	end
	if _type == _G.enumFiveElemType.Dantian then
		return FiveElemConfig[lv+1].dantian_lv
	end
end




--五行等级最高上限
--参数：人物等级，五行类别
--等级   lv
--五行系别	   _type
--函数返回 五行等级上限
function _G.ERF_Limit_LvOfWuxing(lv,_type)
	if _type == _G.enumFiveElemType.Metal then
		return 40
	end
	if _type == _G.enumFiveElemType.Wood then
		return 40
	end
	if _type == _G.enumFiveElemType.Water then
		return 40
	end
	if _type == _G.enumFiveElemType.Fire then
		return 40
	end
	if _type == _G.enumFiveElemType.Earth then
		return 40
	end
	if _type == _G.enumFiveElemType.Dantian then
		return 20
	end
end
--得到五行升级成功率
--参数：五行等级，五行类别
--返回 成功率（0到1之间）
function _G.ERF_GetElemtUpSuccessPercent(lv,_type)
	local Pro = 10000
	
--	if lv >20 then
--		Pro = 10000- (lv-20)*300
--	end
	
	return Pro
end



local	UpNeedItemNum =
	{
		1,
		1,
		2,
		4,
		6,
		10,
		3,
		4,
		6,
		10,
		20,
		7,
		10,
		15,
		22,
		30,
		12,
		16,
		23,
		34,
		50,
		35,
		45,
		60,
		80,
		100,
		60,
		80,
		120,
		180,
		300,
	}


--得到升级消耗物品数量
--参数：五行等级，五行类别
--返回 物品数量
function _G.ERF_GetElemtUpNeedItemNum(lv,_type)
	local number = 0
	if lv > 19 then
		number = UpNeedItemNum[lv-19]
	end
	return number
end
----连斩
--连斩倒计时 返回毫秒
--参数 times 连斩次数
function _G.ERFCountContinueKillTime(dwTimes)
	local IntTime = math.floor(dwTimes/100) * 500
	IntTime = ContinueKillConfig.KillContinueBaseValue - dwTimes * ContinueKillConfig.KillContinueTimes - IntTime
	
	if IntTime <= 0 then
		IntTime = 1
	end
	
	return IntTime
	
end

--获取怒气值
--参数 dwAngerValue		怒气值
--	   dwTimes			连斩次数
function _G.ERFGetAnger(dwAngerValue,dwTimes)
	return ContinueKillConfig.BaseAnger/(1 + math.floor(dwAngerValue/10000)) * (1+dwTimes /500)
end

----世家福利
_G.GuildWelfareConfig = {}
--经验福利公式
  --dwGuildLevel: 公会等级
  --dwMemberLevel: 成员等级
  --dwMemberRank: 成员职务1会长2长老3成员
function GuildWelfareConfig.Experience(dwGuildLevel,dwMemberLevel,dwMemberRank)
	local value = 0
	value = math.floor(500+(dwMemberLevel-1)*(20+(dwMemberLevel-2)*(2+dwMemberLevel/1)))
	return value
end
--五行福利公式
  --dwGuildLevel: 公会等级
  --dwMemberLevel: 成员等级
  --dwMemberRank: 成员职务1会长2长老3成员
function GuildWelfareConfig.Element(dwGuildLevel,dwMemberLevel,dwMemberRank)
	local value = 0
	value = dwMemberLevel*1000
	value = math.floor(50+(dwMemberLevel-1)*(10+(dwMemberLevel-2)*(0.25)))
	return value
end
