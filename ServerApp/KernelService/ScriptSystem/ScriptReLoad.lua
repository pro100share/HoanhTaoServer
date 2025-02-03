--[[
	szCmd : 热更命令
	dwType: 1:KS  2:GS
--]]
local reloadcfg = _G.ScriptReLoadConfig



--热更入口
function CScriptManager:ReLoad(dwID)
	local res = 0
	local _log = nil
	if not dwID then
		_log = "err no id!"
		return res,_log
	end
	local cfg = reloadcfg[dwID]
	if not cfg then
		_log = "err id not exist!"
		return res,_log
	end
	if cfg.dwType == 1 then
		return self:ReLoadKS(dwID)
	end
	if cfg.dwType == 2 then
		return self:ReLoadGS(dwID)
	end
	_log = "not this type!"
	return res,_log
end


--热更KS
function CScriptManager:ReLoadKS(dwID)
	local szCmd = reloadcfg[dwID].szCmd
	local res,_log = pcall(szCmd)
	if res then
		res = 1
		_info("reload "..dwID.." suc")
		_log = "reload "..dwID.." suc"
	else
		res = 0
		_info("reload "..dwID.." fail")
	end
	return res,_log
end


--热更GS
function CScriptManager:ReLoadGS(dwID)
	for dwLineID,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.ScriptOnRecvReLoadMsg{ID=dwID}
	end
	return 1,"reload "..dwID.." suc"
end





