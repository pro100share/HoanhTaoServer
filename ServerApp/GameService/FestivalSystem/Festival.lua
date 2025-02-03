--[[
	½ÚÈÕ
--]]
_G.CFestival = {}
-------------------------------------------
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
	Info[5] = cfg.dwBtn
	Info[6] = cfg.szNamePic
	Info[7] = cfg.szBackPic
	Info[8] = cfg.dwRefe
	Info[9] = cfg.StartTime
	Info[10] = {}
	for k,v in pairs(cfg.Festiva) do
		Info[10][k] = {
			[1] = v.dwType;
			[2] = v.dwIndex;
			[3] = v.dwPos;
		}
	end
	return Info
end

-------------------------------------------
function CFestival:new(Info)
	local obj = setmetatable({},{__index=self})
	obj.dwIndex = Info.dwIndex
	obj.TimeInfo = Info.TimeInfo
	
	local Name = "Festival_"..Info.dwIndex
	do_file(Name..".lua")
	local cfg = _G[Name]
	
	obj.CFG = cfg--FestivalMainConfig[Info.dwIndex]
	obj.Line = {}
	
	obj.SendCFG = Pack(cfg)
	
	
	return obj;
end
-------------------------------------------
function CFestival:AddLine(dwIndex,Line)
	self.Line[dwIndex] = Line
end
function CFestival:GetLine(dwIndex)
	return self.Line[dwIndex]
end
function CFestival:RemoveLine(dwIndex)
	self.Line[dwIndex] = nil
end
function CFestival:GetAllLine()
	return self.Line
end
-------------------------------------------
function CFestival:GetStartTime()
	return self.TimeInfo.dwStartTime
end
function CFestival:GetEndTime()
	return self.TimeInfo.dwEndTime
end
function CFestival:GetTime()
	return self.TimeInfo
end
function CFestival:GetIndex()
	return self.dwIndex
end
function CFestival:GetCFG()
	return self.SendCFG
end
-------------------------------------------
function CFestival:IsProcess()
	return (_now() < self:GetEndTime()) or (self:GetStartTime()==0)
end
















