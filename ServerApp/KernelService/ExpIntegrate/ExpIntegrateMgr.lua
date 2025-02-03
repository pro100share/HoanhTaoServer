--[[
功能：全服最高玩家等级管理器
类型：继承于CSingle类，用来管理全服最高玩家等级
版本：
	v1.0	2013-11-26 create by lzc
]]


_G.CExpIntegrateMgr = CSingle:new();
CSingleManager:AddSingle(CExpIntegrateMgr);

--存储全服最高玩家等级
CExpIntegrateMgr.AllServreMaxLevel =  _G.ExpIntegrateConfig.InitAllSMaxLevel;

--create
function CExpIntegrateMgr:Create()
	--从数据库读取全服最大等级
	self:ReadMaxLevelDB();
	
	-- for k,szTime in pairs(LotteryConfig.DrawingTime) do
		-- CAlarmClock:AddTask({dwTime = szTime}, CAlarmTaskCycleType.eDay, 1, 0,
		-- function()
			-- self:CheckDrawTime(szTime)
		-- end,{})
	-- end
	
	return true;
end;

--update
function CExpIntegrateMgr:Update(dwInterval)
	return true
end

function CExpIntegrateMgr:Destroy()
end



function CExpIntegrateMgr:ReadMaxLevelDB()
	local res = CPlayerDBQuery:GetDBQuery():execute('select MAX("dwTotalExp") from "T_Role_Info"');
    self.AllServreMaxLevel = res and res[1].max or 10;
	--把最大经验换算成最大等级
	self.AllServreMaxLevel = RoleUpLevelConfig:ExpToLevel(self.AllServreMaxLevel)
end


--外部接口
-------------------------------------------------------------------------------------------------------------


--想指定GS同步最大等级信息
function CExpIntegrateMgr:SendInfoToGS(dwLineID)
	local objLine = CGameLineManager:GetLine(dwLineID);
	if objLine then
		objLine.OnKSExpInteMaxLevelMsg{MaxLevel = self.AllServreMaxLevel};
	end 
end

--向所有GS同步最大等级信息
function CExpIntegrateMgr:SyncMaxLevel(dwMaxLevel)
	if dwMaxLevel > self.AllServreMaxLevel then
		self.AllServreMaxLevel = dwMaxLevel;
		
		--给所有GS发送最大等级信息
		local tbLine = CGameLineManager:GetAllLine();
		for _,objLine in pairs(tbLine) do
			objLine.OnKSExpInteMaxLevelMsg{MaxLevel = self.AllServreMaxLevel};
		end
	end
end
