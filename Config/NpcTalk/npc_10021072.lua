--单个npc对话:npc_10021072.lua
local npc_id=10021072
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002107211,},
  [2]={tp=tk.accept_check,id={20102},},
  --[3]={tp=tk.complete_check,id={20102},}, 
  --[4]={tp=tk.web_link,url="bbs.5ding.com/forumdisplay.php?fid=259",text=1002107212},
  [8]={tp=tk.close,text=1,},
 },
--task 20102 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=2010221,},
  [2]={tp=tk.page,id=3,text=2010222,},
 },
--task 20102 选项
 [3]=
 {
  [1]={tp=tk.text,text=2010223,},
  [2]={tp=tk.page,id=4,text=2010224,},
  [3]={tp=tk.page,id=5,text=2010225,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=2010226,},
  [2]={tp=tk.page,id=5,text=2010227,},
 },
--task 20102 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=2010231,},
  [2]={tp=tk.accept_task,id=20102,text=2010232,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]