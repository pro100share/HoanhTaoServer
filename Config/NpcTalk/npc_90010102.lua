--����npc�Ի�:npc_90010102.lua
local npc_id=90010102
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=9001010211,},
  [8]={tp=tk.close,text=1,},
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