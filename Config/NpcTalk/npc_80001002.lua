--����npc�Ի�:npc_80011002.lua
local npc_id=80001002
local talk=
{
 [1]=
 {
	[1]={tp=tk.text,text=5060100111,},
	[2]={tp=tk.fun,sort=1,fun="ChuanSong",param={},text=93,},
	
	
	
	--[6]={tp=tk.war_over,id=10030,text=88},
  },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--�ļ�����
--[[
˵����
talk[1] : npc�Ի�����ڣ�ÿ�ε��npc�������Ķ�������Ի�
			ÿ��npc����talk[1],������п���;
--]] 