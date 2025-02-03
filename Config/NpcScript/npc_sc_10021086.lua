--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10021086
-----------------------------------
--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer,sysScript,dwID)

	local sysLantern = objPlayer:GetSystem("CLanternSystemSystem")
	local dwScore = tonumber(sysLantern:GetScore()) or 0
	local szText = string.format(NpcStringConfigInfo[1002108614],dwScore)

	local page =
	{
		[1]={tp=tk.text,text=szText,},
		[2]={tp=tk.fun,fun="exchange",param={1},text=1002108615,},
		[3]={tp=tk.fun,fun="exchange",param={2},text=1002108616,},
		[4]={tp=tk.fun,fun="exchange",param={3},text=1002108617,},
		[5]={tp=tk.close,text=1,},
	}
	talk_page[2] = page
end

--兑换
function npc_fun.exchange(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	local param = tbParam[1]
	local sysLantern = objPlayer:GetSystem("CLanternSystemSystem")
	sysLantern:ExChange(param)
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------
