--[[
功能：帮派命令处理（服务器）
版本：v1.0
作者：郭肇义
时间：2012-10-10
]]
_G.CGuildServerMsg = {};
----------------------------------------------------------------------------------
function CGuildServerMsg:NotifyServer(dwServerID,szCmd,...)
	local objLine = CGameLineManager:GetLine(dwServerID)
	if not objLine then return end
	objLine.OnGuildServerMsg{ Cmd = szCmd,Info = {...} }
end
----------------------------------------------------------------------------------
--确认记录
function CGuildServerMsg:ConfirmRecord(dwRecord)
	CGuildRecord:Confirm(dwRecord)
end
--取消记录
function CGuildServerMsg:CancelRecord(dwRecord)
	CGuildRecord:Cancel(dwRecord)
end
----------------------------------------------------------------------------------