local npc_id=8090
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=80901,}, 
  [2]={tp=tk.fun,sort=1,fun="buff",param={},text=80902,},
  [3]={tp=tk.fun,sort=1,fun="item",param={},text=80903,},
  [4]={tp=tk.complete_check,id={53013},},
  [5]={tp=tk.close,text=1,},
 }, 
--task 2123 complete_talk
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=212331,},
  -- [2]={tp=tk.complete_task,id=2123,text=212332,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--�ļ�����
--[[
˵����
talk[1] : npc�Ի�����ڣ�ÿ�ε��npc�������Ķ�������Ի�
			ÿ��npc����talk[1],������п���;
--]] 





