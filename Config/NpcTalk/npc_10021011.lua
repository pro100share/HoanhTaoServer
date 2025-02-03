--单个npc对话:npc_10021011.lua
local npc_id=10021011
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002101111,},
  [2]={tp=tk.accept_check,id={2117,2038,2040},},
  [3]={tp=tk.complete_check,id={2117,2003},},
  [4]={tp=tk.shop,id=60000,text=6,},
  [8]={tp=tk.close,text=1,},
 },
--task 2117 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=211721,},
  [2]={tp=tk.page,id=3,text=211722,},
 },
 [3]=
 {
  [1]={tp=tk.text,text=211723,},
  [2]={tp=tk.accept_task,id=2117,text=211724,},
 },
--task 2117 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=211731,},
  [2]={tp=tk.complete_task,id=2117,text=211732,},
 },
--task 2003 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=200331,},
  [2]={tp=tk.complete_task,id=2003,text=200332,},
 },
--task 2038 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=203821,},
  [2]={tp=tk.page,id=7,text=203822,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=203823,},
  [2]={tp=tk.page,id=8,text=203824,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=203825,},
  [2]={tp=tk.accept_task,id=2038,text=203826,},
 },
--task 2040 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=204021,},
  [2]={tp=tk.accept_task,id=2040,text=204022,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]