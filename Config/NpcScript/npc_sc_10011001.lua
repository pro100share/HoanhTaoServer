--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10011001
function npc_fun.zcs(objNpc,objPlayer,sysNpc,tbParam)
--[[
	local id = tbParam.id
	print(id)
	
	local Map = sysMap:GetCurMap()
	local mgrNpc = Map:GetNpcMgr()
	local dwObjId = mgrNpc:DelayAdd(id,sysMap.fXPos,sysMap.fYPos,0,szName,szTitle,dwObjId,3000)
	mgrNpc:DelayRemove(dwObjId,10000)
	--sysMap:ExecTransforMap(1002,2)
--]]	
	local sysMap = objPlayer:GetSystem("CMapSystem")
	sysMap:ExecTransforMapXY(1001,-5,-22,0)

end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------