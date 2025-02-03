--[[
	商业化，配置同步 GS
--]]
----------------------------------------------------------------------------
define.FestivalNeedListMsg
{
	user = NONE;
	List = {};
}
when{ user = NONE }
FestivalNeedListMsg = checkUser
when{}
function FestivalNeedListMsg(user,List)
	local sysF = user:GetSystem("CFestivalSystem")
	if not sysF then return end;
	sysF:SyncConfig(List)
end
----------------------------------------------------------------------------

function CFestivalSystem:StartSync()
	for dwFestival,Festival in pairs(CFestivalManager:GetAllFestival()) do
		local List = {}
		local Info = {0,dwFestival,Festival.SendCFG[2]}
		table.insert(List,Info)
		for dwLine,Line in pairs(Festival:GetAllLine()) do
			local Info = {1,dwFestival,dwLine,Line.SendCFG[2]}
			table.insert(List,Info)
		end
		self:SendSyncList(List)
	end
end

function CFestivalSystem:SyncConfig(List)
	for k,v in pairs(List) do
		if v[1]==0 then
			self:SendFestivalConfig(v)
		elseif v[1]==1 then
			self:SendLineConfig(v)
		end
	end
end

function CFestivalSystem:SendFestivalConfig(Info)
	local dwFestival = Info[2]
	local Festival = CFestivalManager:GetFestival(dwFestival)
	if not Festival then return end;
	local Config = Festival:GetCFG()
	self:AddSendList({Info,Config})
end

function CFestivalSystem:SendLineConfig(Info)
	local dwFestival = Info[2]
	local dwLine = Info[3]
	local Festival = CFestivalManager:GetFestival(dwFestival)
	if not Festival then return end;
	local Line = Festival:GetLine(dwLine)
	if not Line then return end;
	local Config = Line:GetCFG()
	self:AddSendList({Info,Config})
end



function CFestivalSystem:AddSendList(Info)
	table.insert(self.NeedSend,Info)
end

-------------------------------------------------------

-------------------------------------------------------
function CFestivalSystem:SendSyncList(List)
	local objPlayer = self:GetPlayer()
	objPlayer.FestivalSyncListMsg{List=List}
end

function CFestivalSystem:SendSyncConfig(Info)
	local objPlayer = self:GetPlayer()
	objPlayer.FestivalSyncConfigMsg{Info=Info}
end

--------------------------------------------------------







