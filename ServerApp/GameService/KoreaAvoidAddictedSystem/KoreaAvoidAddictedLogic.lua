--[[
功能：韩版防沉迷系统
作者：魏云
时间：2014-1-22
]]

_G.SKoreaAddictedTime = {};
function SKoreaAddictedTime:new( t )
	local obj = t or {};
	obj.dwOnLineTime = 0;		--玩家累计上线的时间
	obj.dwTips = -1;			--记录上一个提示信息的下标0~24
	return obj;
end
--更新防沉迷数据，根据时间规则进行提示
function CKoreaAvoidAddictedSystem:Update(dwInterval)
	if(not _G.KoreaAvoidAddicted) then
		return true;
	end
	self.dwCheckTimer = self.dwCheckTimer + dwInterval
	if self.dwCheckTimer < KoreaAvoidAddictedConfig.ServerCheck then
		return true;
	end
	if(self.objTimer) then
		self.objTimer.dwOnLineTime = self.objTimer.dwOnLineTime + self.dwCheckTimer;
		self:NotifySynchronizeLogic(self.objTimer);
	end
	self.dwCheckTimer = 0;
	return true;
end;
---------------------------------------------------------------------------------------------------------------------------------------
--处理同步防沉迷信息逻辑
function CKoreaAvoidAddictedSystem:NotifySynchronizeLogic(objTimer)
	if objTimer.dwTips >= KoreaAvoidAddictedConfig.TipsCount or objTimer.dwTips == -1 then
		objTimer.dwTips = 0;
	end
	local index = objTimer.dwTips + 1;
	if objTimer.dwOnLineTime >= KoreaAvoidAddictedConfig[index].point then
		if objTimer.dwOnLineTime >= KoreaAvoidAddictedConfig[index].point then
			objTimer.dwTips = index;
		end
		self:SynchronizeNotify(index);
	end
end
--记录防沉迷
function CKoreaAvoidAddictedSystem:AddAddictedTimer()
	local objTimer = SKoreaAddictedTime:new();
	self.objTimer = objTimer;
end
























