--����npc�Ի�:npc_80891001.lua
local npc_id=80891001
local talk=
{
 [1]=
 {
	[1]={tp=tk.fun,sort=1,fun="JiangLi",param={},text=95,},
	[2]={tp=tk.close,text=1,},
  },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--�ļ�����
--[[
˵����
talk[1] : npc�Ի�����ڣ�ÿ�ε��npc�������Ķ�������Ի�
			ÿ��npc����talk[1],������п���;
--]] 