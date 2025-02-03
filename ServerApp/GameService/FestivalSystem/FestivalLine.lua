--[[
	活动
--]]
_G.CFestivalLine = {}
--[[
	local Data = {}
	Data.dwRoleID = dwRoleID
	Data.dwIncoID = Player.dwIncoID
	Data.szName = Player.szName
	Data.dwLevel = Player.dwLevel
--]]
--------------------------------------------------------
local do_file = function(szFileName)
	local szFileName = "../Data/AFConfig/"..szFileName
	dofile(szFileName)
end
local Pack = function(cfg)
	local Info = {}
	Info[1] = cfg.szName
	Info[2] = cfg.UpdateTime
	Info[3] = cfg.dwType
	Info[4] = cfg.dwEndTime
	Info[5] = cfg.dwRewardTime
	Info[6] = cfg.szPic
	Info[7] = cfg.dwBackType
	Info[8] = cfg.dwRefe
	Info[9] = cfg.StartTime
	Info[10] = {}
	Info[11] = cfg.szRule
	Info[12] = cfg.dwPanelType
	Info[13] = cfg.dwChargeType
	for k,v in pairs(cfg.Festival) do
		Info[10][k] = {
			[1] = v.szDes;
			[2] = v.dwRule;
			[3] = v.Reward;
			[4] = v.dwLevel;
			[5] = v.Cost;
			[6] = v.bSingle;
			[7] = v.dwTimes;
			[8] = v.dwRequireLevel;
			[9] = v.dwRequireValue;
			[10] = v.dwRequireType;
		}
	end
	return Info
end
--------------------------------------------------------
function CFestivalLine:new(Info)
	local obj = setmetatable({},{__index=self})
	obj.dwType = Info.dwType
	obj.dwIndex = Info.dwIndex
	obj.TimeInfo = Info.TimeInfo
	
	local Name = "Line_"..Info.dwType.."_"..Info.dwIndex
	do_file(Name..".lua")
	local cfg = _G[Name]
	
	obj.CFG = cfg--FestivalListConfig[Info.dwType][Info.dwIndex]
	obj.dwState = Info.dwState
	obj.dwFestival = Info.dwFestival
	obj.dwLine = Info.dwLine
	obj.Node = Info.Node
	
	obj.SendCFG = Pack(cfg)
	return obj;
end
---------------------------------------------------------
function CFestivalLine:SetNode(Node)
	self.Node = Node
end
function CFestivalLine:GetStartTime()
	return self.TimeInfo.dwStartTime
end
function CFestivalLine:GetEndTime()
	return self.TimeInfo.dwEndTime
end

function CFestivalLine:GetTime()
	return self.TimeInfo
end

function CFestivalLine:GetCFG()
	return self.SendCFG
end

function CFestivalLine:GetRewardTimes(dwIndex)
	if self.dwType == FestivalListTypeEnum.Rush then 
		return 1
	end;
	if self.dwType == FestivalListTypeEnum.Back then 
		return 1
	end;
	if self.dwType == FestivalListTypeEnum.Other then 
		return self.CFG.Festival[dwIndex].dwTimes
	end;
end
---------------------------------------------------------
--是否可领奖
function CFestivalLine:IsHaveReward(dwIndex,dwRoleID,dwNowGetTimes)
	if self.dwType == FestivalListTypeEnum.Rush then 
		return self:IsHaveRewardRush(dwIndex,dwRoleID) 
	end;
	if self.dwType == FestivalListTypeEnum.Back then 
		return self:IsHaveRewardBack(dwIndex,dwRoleID) 
	end;
	if self.dwType == FestivalListTypeEnum.Other then 
		return self:IsHaveRewardOther(dwIndex,dwRoleID,dwNowGetTimes) 
	end;
end
--冲榜类
function CFestivalLine:IsHaveRewardRush(dwIndex,dwRoleID)
	--if self.dwState ~= FestivalStateEnum.Reward then return false end;
	local Info = self.Node[dwIndex] or {}
	for i=1,#Info do
		if Info[i].dwRoleID == dwRoleID then
			return true
		end
	end
	return false
end
--回馈类
function CFestivalLine:IsHaveRewardBack(dwIndex,dwRoleID)
	local dwBackType = self.CFG.dwBackType
	local fun = FestivalStaticScript[FestivalScript.BackCondition[dwBackType].fun]
	--if not fun then return false end;
	local dwLevel = self.CFG.Festival[dwIndex].dwLevel
	return fun(dwRoleID,dwLevel)
end
--其他类
function CFestivalLine:IsHaveRewardOther(dwIndex,dwRoleID,dwNowGetTimes)
	local dwRule = self.CFG.Festival[dwIndex].dwRule
	local fun = FestivalStaticScript[FestivalScript.OtherCondition[dwRule].fun]
	if not fun then return false end;
	local param = FestivalScript.OtherCondition[dwRule].param or {}
	return fun(dwRoleID,dwNowGetTimes,unpack(param))
end

-----------------------------------------------------------
--获得奖励
function CFestivalLine:GetReward(dwIndex)
	return self.CFG.Festival[dwIndex].Reward
end
--获得领奖消耗
function CFestivalLine:GetCost(dwIndex)
	return self.CFG.Festival[dwIndex].Cost
end
--有多少子项
function CFestivalLine:GetIndexNum()
	return #self.CFG.Festival
end
--子项领奖类型
function CFestivalLine:IsSingle(dwIndex)
	return self.CFG.Festival[dwIndex].bSingle
end






















