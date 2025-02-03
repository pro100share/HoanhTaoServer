--单个npc对话:npc_80901002.lua
local npc_id=80901002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8090100211,},
  [2]={tp=tk.accept_check,id={809002},},
  [3]={tp=tk.close,text=1,},
  },
--task 809002 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=80900221,},
  [2]={tp=tk.page,id=3,text=80900222,},
 },
 [3]=
 {
  [1]={tp=tk.text,text=80900223,},
  [2]={tp=tk.page,id=4,text=80900224,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=80900225,},
  [2]={tp=tk.accept_task,id=809002,text=80900226,},
 },
}


CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]
