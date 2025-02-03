--单个npc对话:npc_10021087.lua
local npc_id=10021087
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002108711,}, 
  [2]={tp=tk.shop,id=90000,text=1002108712,},
		[3]={tp=tk.task_fun,id=59,text=1002108713,}, 
  [4]={tp=tk.close,text=1,},
 }, 

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 