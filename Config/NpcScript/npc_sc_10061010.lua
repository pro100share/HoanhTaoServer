--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10061010

--[[
	功能：
	动态修改npc对话
	并通过npc对话刷怪
--]]

--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer,sysScript)
	if sysScript[npc_id] then return end;
	if sysScript:GetTaskState(5024) == TaskStateConfig.Accept then
		local Link = {tp=tk.page,id=2,text=502450,}
		sysScript:NpcModiTalkLink(talk_page,1,4,Link)
		--CScriptSystem:NpcModiTalkLink(Talk,dwPageId,dwLinkId,Link)
	end
end

--刷怪
function npc_fun.mon_born(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	--local x,y = objNpc:GetPos()
	--sysScript:AddMon(10062009,x-2,y-2)
	sysScript:AddMon(10062013,-53,100)
	sysScript[npc_id] = true

	--sysScript:AddMon(10062009,-84,88)	
end












-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------