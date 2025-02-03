--脚本记录
_G.CScriptManager = CSingle:new();
--插入单体管理器
CSingleManager:AddSingle(CScriptManager,true);
-----------------------------------------
--npc脚本记录
CScriptManager.Npc = {}
--npc对话脚本记录
CScriptManager.NpcTalk = {}
--怪物脚本记录
CScriptManager.Monster = {}
--任务脚本记录
CScriptManager.Task = {}
--地图脚本
CScriptManager.MapLogic = {}

_G.ServerVerSionReplaceConfig = {}
------------------------------------------
local function group_msg(setNet,szMsgName,tParam)
	_groupcallout(setNet, szMsgName, tParam);
end
------------------------------------------
local function CopyTable(t)
	local t = t or {}
	local out = {}
	for k,v in pairs(t) do
		if type(v)=="table" then
			out[k] = CopyTable(v)
		else
			out[k] = v
		end
	end
	return out;
end
------------------------------------------
--初始化
function CScriptManager:Create()
	self.dwLastUpdateTime = 0
	self.dwUpdateDelay = 1000*60
	CKernelApp.ScriptAskForUrlMsg{LineID=CKernelApp.dwLineID}
	return true
end
function CScriptManager:Update(e)
	local dwNowTime = _now()
	if dwNowTime-self.dwLastUpdateTime >= self.dwUpdateDelay then
		self.dwLastUpdateTime = dwNowTime
		HDScript:DoPerOneMin(self,dwNowTime)
	end
	return true
end
function CScriptManager:Destroy()
	return true
end

local cfg = {
	[1] = "GM";
	[2] = "Bug";
	[3] = "Sug";
	[4] = "Addicted";
	[5] = "Phone";
	[6] = "LunTan";
	[7] = "Mini";
	[8] = "Charge";
}

function CScriptManager:OnRecvUrlInfo(Info)
	_G.ServerVerSionReplaceConfig = _G.ServerVerSionReplaceConfig or {}
	_G.ServerVerSionReplaceConfig[_G.SERVERVERSION] = {}
	_G.ServerVerSionReplaceConfig[_G.SERVERVERSION].UrlConfig = {}
	_G.ServerVerSionReplaceConfig[_G.SERVERVERSION].UrlConfig = Info
	_G.szFormatCharge   = Info.Charge;
	_G.szFormatAddicted = Info.Addicted;
	--[[
	for k,v in pairs(Info.Url) do
		local key = k--cfg[k]
		local value = v
		UrlConfig[key] = value
	end
	UrlConfig.tShowItem = {}
	UrlConfig.tShowItem[1] = Info.Item[1]
	UrlConfig.tShowItem[2] = Info.Item[2]
	--]]
	print("CScriptManager:OnRecvUrlInfo(Info)")
	table.print(ServerVerSionReplaceConfig)
	
	for dwRoleID,objPlayer in pairs(CPlayerManager.setAllPlayerByRoleID or {}) do
		local sys = objPlayer:GetSystem("CScriptSystem")
		sys:OnEnterScene()
	end
	
end
------------------------------------------
--执行一个脚本文件
function CScriptManager:DoFile()
	local szSource = ""

		szSource = [[../Config/NpcScript/Include.lua]]
		print(pcall(dofile,szSource))
		
		szSource = [[../Config/NpcTalk/Include.lua]]
		print(pcall(dofile,szSource))

		szSource = [[../Config/MonScript/Include.lua]]
		print(pcall(dofile,szSource))
	
		szSource = [[../Config/TaskScript/Include.lua]]
		print(pcall(dofile,szSource))

		szSource = [[../Config/MapLogic/Include.lua]]
		print(pcall(dofile,szSource))
end
--插入一个脚本
function CScriptManager:AddScript(dwType,dwId,tbFun)
	if dwType == ScriptTypeConfig.Npc then
		self.Npc[dwId] = tbFun
	elseif dwType == ScriptTypeConfig.NpcTalk then
		self.NpcTalk[dwId] = tbFun
	elseif dwType == ScriptTypeConfig.Monster then
		self.Monster[dwId] = tbFun
	elseif dwType == ScriptTypeConfig.Task then
		self.Task[dwId] = tbFun
	elseif dwType == ScriptTypeConfig.MapLogic then
		self.MapLogic[dwId] = tbFun;
	end
end
--获得一个脚本
function CScriptManager:GetScript(dwType,dwId)
	local tbFun = {}
	if dwType == ScriptTypeConfig.Npc then
		if not self.Npc[dwId] then
			--self:DoFile(dwType,dwId)
		end
		tbFun = self.Npc[dwId]
	elseif dwType == ScriptTypeConfig.NpcTalk then
		if not self.NpcTalk[dwId] then
			--self:DoFile(dwType,dwId)
		end
		tbFun = self.NpcTalk[dwId]
	elseif dwType == ScriptTypeConfig.Monster then
		if not self.Monster[dwId] then
			--self:DoFile(dwType,dwId)
		end
		tbFun = self.Monster[dwId]
	elseif dwType == ScriptTypeConfig.Task then
		if not self.Task[dwId] then
			--self:DoFile(dwType,dwId)
		end
		tbFun = self.Task[dwId]
	elseif dwType == ScriptTypeConfig.MapLogic then
		if not self.MapLogic[dwId] then
			--self:DoFile(dwType,dwId)
		end
		tbFun = self.MapLogic[dwId]
	end
	--[[
	local Script = {}
	if type(tbFun)=="table" then
		for k,v in pairs(tbFun) do
			Script[k]=v
		end
	end
	--]]
	return setmetatable(CopyTable(tbFun),{__index=(CScriptMeta[dwType] or {})})
end

--在指定地图刷怪
function CScriptManager:AddMonToMap(dwMapId,dwMonsterId,dwFightId,dwAIId,dwDropId,dwLook,dwX,dwY,objPlayer)
	local Map = CMapManager:GetMap(dwMapId )
	if Map then
		local mgrMon = Map:GetMonsterMgr()
		return mgrMon:Add(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLook,dwX,dwY,bNoShow,dwObjId,objPlayer)
	end
end

--新加一个npc
function CScriptManager:AddNpcToMap(dwMapId,dwNpcId,fX,fY,fDir, szName, szTitle)
	local objMap = CMapManager:GetMap(dwMapId )
	local mgrNpc = objMap:GetNpcMgr()
	return mgrNpc:Add(dwNpcId,fX,fY,fDir, szName, szTitle)
end

--通过对象id删除一个npc
function CScriptManager:DelNpcObj(dwMapId,dwInfo)
	local objMap = CMapManager:GetMap(dwMapId )
    if not objMap then return end
	local mgrNpc = objMap:GetNpcMgr()
	mgrNpc:Remove(dwInfo)
end

--怪物Monster信息
function CScriptManager:GetMon(dwMapId,dwMonsterId)
	local Map = CMapManager:GetMap(dwMapId )
	if Map then
		local mgrMon = Map:GetMonsterMgr()
		return mgrMon:GetMonsterById(dwMonsterId)
	end
	return {}
end
--删除指定地图上的怪物
function CScriptManager:HideMon(dwMapId,dwMonsterId)
	local Mon = self:GetMon(dwMapId,dwMonsterId)
	for k,v in pairs(Mon) do
		v:Hide()
	end
	return #Mon
end
--发布公告
function CScriptManager:Notice(szStr,dwChannel,bSystem,dwMapId,dwLevel,dwFunId,szFunStr)
	local dwLevel = dwLevel or 0
	local dwFunId = dwFunId or 0
	local szFunStr = szFunStr or ""
	local vPlayer = CMapManager:GetPlayer()
	if dwMapId then
		local Map = CMapManager:GetMap(dwMapId )
		if Map then
			vPlayer = Map:GetAllPlayer()
		end
	end
	local setNet = {}
	local szMsgName = "MonsterNoticeMsg"
	local tParam = {Str=szStr,Channel=dwChannel,System=bSystem,FunId=dwFunId,FunStr=szFunStr}
	for k,v in pairs(vPlayer) do
		if v:GetLevel() >= dwLevel then
			table.insert(setNet,v.objNet)
		end
	end
	group_msg(setNet,szMsgName,tParam)
end
--怪物所在地图的玩家执行一个函数
function CScriptManager:DoFunction(objMon,fnFunction)
	if not objMon then return end;
	if not fnFunction then return end;
	local Map = objMon:GetMap()
	if not Map then return end;
	local Player = Map:GetAllPlayer()
	for dwRoleId,objPlayer in pairs(Player) do
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		local res,_log = pcall(fnFunction,sysScript)
		if not res then
			_err("Script Err:",_log)
		end
	end
end
--发送全线广播公告
function CScriptManager:LineNotice(szStr)
	local Player = CMapManager:GetPlayer()
	local setNet = {}
	local szMsgName = "ScriptOnRecvSystemNoticeMsg"
	local tParam = {Str=szStr}
	for k,objPlayer in pairs(Player) do
		table.insert(setNet,objPlayer.objNet)
	end
	group_msg(setNet,szMsgName,tParam)
end

--发送聊天公告(本线)
function CScriptManager:ChatNotice(szStr,dwChannel,bSystem,Param,szStr2,bHideHead,objPlayer)
	local Player = CMapManager:GetPlayer()
	local setNet = {}
	local szMsgName = "ScriptChatNoticeMsg"
	local tParam = {
			Str = szStr;
			Channel = dwChannel;
			System = bSystem;
			Param = Param or {};
			Str2 = szStr2;
			HideHead = bHideHead;
	}
	if objPlayer then
		setNet = {objPlayer.objNet}
	else
		for k,objPlayer in pairs(Player) do
			table.insert(setNet,objPlayer.objNet)
		end
	end
	group_msg(setNet,szMsgName,tParam)
end
--弹窗公告
function CScriptManager:TipNotice(szStr, szLink)
	local Player = CMapManager:GetPlayer()
	local setNet = {}
	local szMsgName = "ScriptTipNoticeMsg"
	local tParam = {
			Str = szStr;
            Link = szLink;
	}
	if objPlayer then
		setNet = {objPlayer.objNet}
	else
		for k,objPlayer in pairs(Player) do
			table.insert(setNet,objPlayer.objNet)
		end
	end
	group_msg(setNet,szMsgName,tParam)
end;
--发送聊天公告（全服）
function CScriptManager:ChatNoticeAll(szStr,dwChannel,bSystem,Param,szStr2,bHideHead)
	CKernelApp.ScriptChatNoticeMsg{
		Str = szStr;
		Channel = dwChannel;
		System = bSystem;
		Param = Param or {};
		Str2 = szStr2;
		HideHead = bHideHead;
	}
end

--根据roleid获得玩家脚本系统
function CScriptManager:GetPlayerScript(dwRoleID)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(dwRoleID)
	if not objPlayer then return end;
	return objPlayer:GetSystem("CScriptSystem")
end

--获得此服务器的线路id
function CScriptManager:GetSrvLineID()
	return CKernelApp.dwLineID or 0
end

--地图公告
function CScriptManager:MapNotice(objMap,szStr)
	local Player = objMap:GetAllPlayer()
	local setNet = {}
	local szMsgName = "ScriptOnRecvSystemNoticeMsg"
	local tParam = {Str=szStr}
	for k,objPlayer in pairs(Player) do
		table.insert(setNet,objPlayer.objNet)
	end
	group_msg(setNet,szMsgName,tParam)
end
----------------------------------------------------------------------------------
function CScriptManager:OnRecvChargeInfo(Info)
	local dwAccountID	= Info[1]
	local dwGold		= Info[2]
	local dwTime		= Info[3]
	local objPlayer = CPlayerManager:GetPlayer(dwAccountID)
	if not objPlayer then return end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript then return end;
	sysScript:OnCharge(dwGold,dwTime)
end

CScriptManager:DoFile()
