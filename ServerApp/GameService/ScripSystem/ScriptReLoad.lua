--[[
	szCmd : 热更命令
	dwType: 1:KS  2:GS
--]]
local reloadcfg = _G.ScriptReLoadConfig


--收到热更
_define()
define.ScriptOnRecvReLoadMsg
{
	ID = 0;
}
when{}
function ScriptOnRecvReLoadMsg(ID)
	CScriptManager:OnRecvReLoad(ID)
end;

--热更处理
function CScriptManager:OnRecvReLoad(dwID)
	local szCmd = reloadcfg[dwID].szCmd
	local res,_log = pcall(szCmd)
	if res then
		res = 1
		_info("reload "..dwID.." suc")
	else
		res = 0
		_info("reload "..dwID.." fail")
	end
	if not res then
		_err(_log)
	end
	return res,_log
end















