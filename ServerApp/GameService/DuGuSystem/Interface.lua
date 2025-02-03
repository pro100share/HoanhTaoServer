--[[
	[\brief 对外接口方法
	[\author 王凌波
	[\date 2014-5-30
	[提供历练值、设置剑套装id的setter
	[提供历练值、剑套装id、修炼等级、修炼阶段的getter
  ]]

local DuGuConfig = _G.DuGuConfig;

--[[
	[\brief 设置历练值
	[\param number dwNewEXP 新的历练值
  ]]
function CDuGuSystem:SetEXP(dwNewEXP)
	local DuGuFunctions 	= _G.DuGuFunctions;
	local dwOldEXP 			= self.dwEXP;
	local dwMaxEXP 			= DuGuConfig.EXPList[DuGuConfig.nMaxLevel];
	if dwNewEXP > dwMaxEXP then dwNewEXP = dwMaxEXP; end

	local bIsEXPChanged 	= (dwOldEXP ~= dwNewEXP);
	local bIsLevelChanged 	= (DuGuFunctions.LevelCal(dwOldEXP) ~= DuGuFunctions.LevelCal(dwNewEXP));
	local bIsPhaseChanged 	= (DuGuFunctions.PhaseCal(dwOldEXP) ~= DuGuFunctions.PhaseCal(dwNewEXP));

	self.dwEXP = dwNewEXP;

	-- 增加由历练值产生的属性加成
	self:AddAttribute();
    -- 如果等级发生变化且技能由未开启转为开启，则添加上技能
	if 	bIsLevelChanged 								and 
		not DuGuFunctions.IsSkillAvailable(dwOldEXP) 	and 
		DuGuFunctions.IsSkillAvailable(dwNewEXP) 		then 
			self:GetPlayer():GetSystem("CSkillSystem"):
				DoAddSkill(_G.DuGuConfig.SkillList.dwId);
	end

	-- 供判断是否需要广播
	return bIsPhaseChanged;
end

--[[
	[\brief 设置激活的剑套装id
	[\param number nNewActSwordId 新的剑套装id
  ]]
function CDuGuSystem:SetActSwordId(nNewActSwordId)
	local bIsActSwordIdChanged 	= (self.nActSwordId ~= nNewActSwordId);
	self.nActSwordId 			= nNewActSwordId;

	-- 增加由剑套装产生的属性加成
	self:AddAttribute();

	return bIsActSwordIdChanged;
end

--[[
	[\brief 获取历练值
	[\return number 玩家的历练值
  ]]
function CDuGuSystem:GetEXP() 
	return self.dwEXP;
end

--[[
	[\brief 获取激活的剑套装id
	[\return number 玩家已激活的剑套装id
  ]]
function CDuGuSystem:GetActSwordId() 
	return self.nActSwordId;
end

--[[
	[\brief 是否到达历练值上限
	[\return boolean 是否到达上限布尔值
]]
function CDuGuSystem:IsMaxEXP() 
	return self.dwEXP >= DuGuConfig.EXPList[DuGuConfig.nMaxLevel];
end

--[[
	[\brief 通过道具增加历练值
]]
function CDuGuSystem:AddEXPByItem(dwPlus)

	-- 权限判断
	if not self:HasAuthority(self.sAuthority) then
		return 1;
	end

	-- 边界值判断
	local dwNewEXP = self.dwEXP + dwPlus;
	local dwMaxEXP = DuGuConfig.EXPList[DuGuConfig.nMaxLevel];
	if dwNewEXP > dwMaxEXP then dwNewEXP = dwMaxEXP end

	local bChanged = self:SetEXP(dwNewEXP);

	-- 更新数据库中的历练值
	self.objDBQuery:Execute("Update", {dwEXP = dwNewEXP});

	-- 向客户端发响应消息
	self:GetPlayer().DuGuJiuJian_ResponsePracticeMsg{
		dwNewEXP 	= dwNewEXP,
		nPracticeID = 1,                  -- 默认值
		nTimes 		= self.nPrimaryTimes, -- 默认值
	};

	-- 是否需要广播
	if bChanged and DuGuFunctions.PhaseCal(dwNewEXP) >= DuGuConfig.nBroadCastMinPhase
		then self:Broadcast(1) end
end
