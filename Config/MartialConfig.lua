--演武的配置

_G.CMartialConfig =
{
	dwPosLenth = 3;				--演武中人人之间的距离，这里是直线距离，不是斜线
	dwPlayActionTime = 20000;	--播放动作的间隔，这个请根据演武的动作时间具体填写
	dwPlayActionID = 8;			--演武播放的动作ID，SkillAction
	
	dwMaxRoleNum = 10;			--人数上限
	
	dwSplPer = 1000;				--进入顿悟的初始概率(10000=100%)
	dwSplPerAdd = 200;			--每次顿悟概率提升值
	
	dwSplTick = 1250;			--顿悟收益的获取间隔
	
	dwSplDis = 0;				--两次顿悟的最小间隔
	
	dwNorTick = 20000;			--默认收益间隔
	
	dwSplCheckTicl = 60000;	--顿悟概率检测间隔
	
	dwLookMartial = 15;			--能看见的团练距离
	
	dwFreeTime = 180000;			--自动进入演武的时间
	
	dwAutoLevel = 8;				--自动演武的最低等级，小于这个等级就不自动演武
	
	--enTeamUpItem = 2400260;		--团练的丹药
	
	setTeamUpItem = 
	{
		2400260,
		2400270,
		2400280,
		2400290,
		2400300,
	};
	
	--顿悟的长度函数，服务器计算
	funcSplLength = function(tbBattleInfo)
			return 10000;
		end;
	
	--自己的tick权重计算，tbBattleInfo--人物的战斗属性，isVip--是否是vip，isWife--是否有配偶
	funcSelfTickWeight = function(tbBattleInfo,isVip,isWife)
		local Vip = 0
		local Wife = 0
		
		-- if isVip == true then
			-- Vip = 4000
		-- end
		
		-- if isWife == true then
			-- Wife = 4000
		-- end

			return Vip + Wife;
		end;
	
	--团队的tick权重计算，tbMartialInfo--团队属性
	--dwRoleNum：人数
	--dwSpeedUp：加速参数，加速药BUFF写的数值，取团练中最大值
	funcMartialTickWeight = function(tbMartialInfo)
			return (tbMartialInfo.dwRoleNum - 1) * 400-- + tbMartialInfo.dwSpeedUp * 6000;
		end;
		
	--收益的间隔最终值，dwSelfWeight--自己的tick权重，dwMartialWeight--团队的tick权重，服务器计算
	funcLastTick = function(dwSelfWeight,dwMartialWeight)
			return 20000 - dwSelfWeight - dwMartialWeight;
		end;
}

-------------------------------------------------
--普通收益计算
--自己权重
function CMartialConfig.funcSelfNormalWeight(objSelf,dwCurSkill,isVip,isWife)
	--获取较色等级
	local objSklSys = objSelf:GetSystem("CSkillSystem");
	-- local sRoleSkill = objSklSys.setAllSkill[dwCurSkill];
	local tb = objSklSys:GetInfo();
	local dwExpUp = tb.dwMartialExpUp;			--演武经验加成
	local dwZhenqiUp = tb.dwMartialZhenqiUp;		--演武真气加成
	
	local dwMissionUp = CMovementSystemMgr:GetWRoleAddExp() or 1;
	
	
	if (ActivityConfig.Exp[3]) and (ActivityConfig.Exp[3].value or 0) > 0 then
		dwMissionUp = dwMissionUp + ActivityConfig.Exp[3].value 
	end
	-- local dwSkillLvel = 0;
	-- if sRoleSkill then
		-- dwSkillLvel = sRoleSkill:GetLevel();					--技能等级
	-- end
	
	local dwPalyerLevel = objSelf:GetLevel();					--角色等级
	
	local tbRsl = {};
	
	tbRsl.zhenqi = 10 * (dwZhenqiUp+dwMissionUp)
	
	tbRsl.jingyan = math.floor(3+dwPalyerLevel*(1+dwPalyerLevel*(0.005+dwPalyerLevel/500)))
	tbRsl.jingyan = tbRsl.jingyan * (dwExpUp+dwMissionUp)
	
	return tbRsl;
end;

--团队的权重
function CMartialConfig.funcMartialNormalWeight(tbMartialInfo)
	local tbRsl = {};
	
	return tbRsl;
end;

--最终计算
function CMartialConfig.funcNormalGet(tbSelfInfo,tbGroupInfo,isVip,isWife,tbMartialInfo)
	local tbRsl = {};
	local Vip = 0;
	local Wife = 0;
	
	local Buff = math.floor(tbMartialInfo.dwSpeedUp*2)
	
	if isVip == true then
		Vip = 2
	end
	
	if isWife == true then
		Wife = 2
	end
	

	tbRsl.zhenqi_G = tbSelfInfo.zhenqi+Vip+Wife+Buff;
	tbRsl.zhenqi_M = tbSelfInfo.zhenqi+Vip+Wife+Buff;
	tbRsl.zhenqi_S = tbSelfInfo.zhenqi+Vip+Wife+Buff;
	tbRsl.zhenqi_H = tbSelfInfo.zhenqi+Vip+Wife+Buff;
	tbRsl.zhenqi_T = tbSelfInfo.zhenqi+Vip+Wife+Buff;
	tbRsl.jingyan = tbSelfInfo.jingyan;
	tbRsl.xinfa = 1;
	

	-- local tbRsl = 
	-- {
		-- zhenqi_G 	= 	10,
		-- zhenqi_M 	= 	10,
		-- zhenqi_S 	= 	10,
		-- zhenqi_H 	= 	10,
		-- zhenqi_T 	= 	10,
		-- jingyan 	= 	tbSelfInfo.jingyan,
		-- xinfa 		= 	1,
	-- };
	
	return tbRsl;
end;


--顿悟收益计算
--自己权重
function CMartialConfig.funcSelfSpecialWeight(objSelf,dwCurSkill,isVip,isWife)
	--获取较色等级
	local objSklSys = objSelf:GetSystem("CSkillSystem");
	-- local sRoleSkill = objSklSys.setAllSkill[dwCurSkill];
	local tb = objSklSys:GetInfo();
	local dwExpUp = tb.dwMartialExpUp;			--演武经验加成
	local dwZhenqiUp = tb.dwMartialZhenqiUp;		--演武真气加成
	
	-- local dwMissionUp = CMovementSystemMgr:GetWRoleAddExp() or 1;
	
	-- local dwSkillLvel = 0;
	-- if sRoleSkill then
		-- dwSkillLvel = sRoleSkill:GetLevel();					--技能等级
	-- end
	
	local dwPalyerLevel = objSelf:GetLevel();					--角色等级
	
	local tbRsl = {};
	
	-- tbRsl.zhenqi = 10 * (dwZhenqiUp+dwMissionUp)
	tbRsl.jingyan = math.floor(3+dwPalyerLevel*(1+dwPalyerLevel*(0.005+dwPalyerLevel/500)))
	--tbRsl.jingyan = tbRsl.jingyan * (dwExpUp+1)
	
	return tbRsl;
end;

--团队的权重
function CMartialConfig.funcMartialSpecialWeight(tbMartialInfo)
	local tbRsl = {};
	
	return tbRsl;
end;

--最终计算
function CMartialConfig.funcSpecialGet(tbSelfInfo,tbGroupInfo)
	local tbRsl = {};
	
	local tbRsl = 
	{
		zhenqi_G 	= 	5,
		zhenqi_M 	= 	5,
		zhenqi_S 	= 	5,
		zhenqi_H 	= 	5,
		zhenqi_T 	= 	5,
		jingyan 	= 	tbSelfInfo.jingyan,
		xinfa 		= 	1,
	};
	
	return tbRsl;
end;


-------------------------------------------------
--所有可能点的偏移基本量
_G.arrMartialPosDis = 
{
	{x = 1, y = 0};
	{x = 0, y = -1};
	{x = -1, y = 0};
	{x = 0, y = 1};
	
	{x = 1, y = 1};
	{x = 1, y = -1};
	{x = -1, y = -1};
	{x = -1, y = 1};
	
	{x = 2, y = 0};
	{x = 0, y = -2};
	{x = -2, y = 0};
	{x = 0, y = 2};
	
	{x = 2, y = 1};
	{x = 2, y = -1};
	{x = 1, y = -2};
	{x = -1, y = -2};
	
	{x = -2, y = -1};
	{x = -2, y = 1};
	{x = -1, y = 2};
	{x = 1, y = 2};
	
	{x = 2, y = 2};
	{x = 2, y = -2};
	{x = -2, y = -2};
	{x = -2, y = 2};
};