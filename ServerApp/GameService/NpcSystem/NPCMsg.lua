--------------------------------
--[[
服务器 NPC
消息处理
周长沙
2012-1-31
--]]
--------------------------------

_define()
--左键点击npc
define.NpcOnLClickMsg
{
	user  = NONE ,
	NpcId = 0,
	dwObjId = 0,
	dwMapId = 0
}
when{ user = NONE }
NpcOnLClickMsg = checkUser
when{}
function NpcOnLClickMsg(user,NpcId,dwObjId,dwMapId)
	local npcSystem = user:GetSystem("CNPCSystem");
	if not npcSystem then
		return 
	end
	npcSystem:OnLClick(dwObjId,dwMapId)
end

--右键点击npc
define.NpcOnRClickMsg
{
	user  = NONE ,
	NpcId = 0,
	dwObjId = 0,
	dwMapId = 0
}
when{ user = NONE }
NpcOnRClickMsg = checkUser
when{}
function NpcOnRClickMsg(user,NpcId,dwObjId,dwMapId)
	local npcSystem = user:GetSystem("CNPCSystem");
	if not npcSystem then
		return 
	end
	npcSystem:OnRClick(dwObjId,dwMapId)
end

--交互请求
define.NpcOnOperatedMsg
{
	user  = NONE , 
	DwObjId = 0,
	DwIndex = 0
}
when{ user = NONE }
NpcOnOperatedMsg = checkUser
when{}
function NpcOnOperatedMsg(user,DwObjId,DwIndex)
	local npcSystem = user:GetSystem("CNPCSystem");
	if not npcSystem then
		return 
	end
	npcSystem:OnOpera(DwObjId,DwIndex)
end
--读条完成消息
define.NpcOnPrgFinishMsg
{
	user = NONE;
	NpcObjId = 0;
}
when{ user = NONE }
NpcOnPrgFinishMsg = checkUser
when{}
function NpcOnPrgFinishMsg(user,NpcObjId)
	local npcSystem = user:GetSystem("CNPCSystem");
	if not npcSystem then
		return 
	end
	npcSystem:OnPrgFinish(NpcObjId)
end
--进入副本消息
define.NpcOnEnterDuplMsg
{
	user = NONE;
	DuplId = 0;
	MapId = 0;
}
when{ user = NONE }
NpcOnEnterDuplMsg = checkUser
when{}
function NpcOnEnterDuplMsg(user,DuplId,MapId)
	--quying chg 2012-04-21
	local duplSystem = user:GetSystem("CDuplSystem");
	if not duplSystem then return end; 
	local dwPointID = 1
	duplSystem:ExecEnterPlayerDupl(DuplId,MapId,dwPointID);
end

--执行脚本函数消息
define.NpcOnDoFunMsg
{
	user = NONE;
	NpcObjId = 0;
	FunName = "";
	Param = {};
}
when{ user = NONE }
NpcOnDoFunMsg = checkUser
when{}
function NpcOnDoFunMsg(user,NpcObjId,FunName,Param)
	local sysNpc =  user:GetSystem("CNPCSystem")
	local sysMap = user:GetSystem("CMapSystem")
	local Map = sysMap:GetCurMap()
	local Npc = Map:GetNpcByObjID(NpcObjId)
	if not Npc then return end;
	local tbFun = Npc.tbFun
	if tbFun and tbFun[FunName] then
		tbFun[FunName](Npc,user,sysNpc,Param,user:GetSystem("CScriptSystem"))
	end
end

--请求进入副本消息--quying chg 2012-05-10
define.NpcReqEnterDuplMsg
{
	user = NONE;
	DuplId = 0;
	MapId = 0;
}
when{ user = NONE }
NpcReqEnterDuplMsg = checkUser
when{}
function NpcReqEnterDuplMsg(user,DuplId,MapId)
	--quying chg 2012-04-21
	local mapSystem = user:GetSystem("CMapSystem");
	local teamSystem = user:GetSystem("CTeamSystem");
	if not mapSystem then return end; 
	local dwPointID = 1
	local Index = 1
	local teamMode = teamSystem:GetTeamPersonNum() or 0
	mapSystem:ReqEnterDupl(DuplId,MapId,dwPointID, Index, teamMode);
end
---------------------------------------------------------
--发送地图npc信息
define.NpcGetMapNpcMsg
{
	user = NONE,
}

when{ user = NONE }
NpcGetMapNpcMsg = checkUser
when{}
function NpcGetMapNpcMsg(user)
	local npcSystem = user:GetSystem("CNPCSystem");
	if (not npcSystem) then
		return 
	end
	npcSystem:SendNpcLogicInfo()
end

