--����npc�Ի�:npc_90010101.lua
local npc_id=90010101
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=9001010111,},
  [2]={tp=tk.escort,text=9001010112,},
  [3]={tp=tk.close,text=1,},
 },
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
-------------------------------------------------------
--�ļ�����
--[[
˵����
talk[1] : npc�Ի�����ڣ�ÿ�ε��npc�������Ķ�������Ի�
			ÿ��npc����talk[1],������п���;
--]] 