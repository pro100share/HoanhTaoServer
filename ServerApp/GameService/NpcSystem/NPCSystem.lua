--[[
功能：NPC系统类（服务器）
作者：周长沙
时间：2012-1-31
--]]

_G.CNPCSystem = {}
-------------------------------
local function CheckTable(t)
	for k,v in pairs(t) do
		return t
	end
	return nil
end
-------------------------------
local function TableCopy(T)
	local newT = {}
	for k,v in pairs(T) do
		if type(v)=="table" then
			newT[k] = TableCopy(v)
		else
			newT[k] = v
		end
	end
	return newT
end
-------------------------------
function CNPCSystem:new()
	local obj = CSystem:new("CNPCSystem");
	for i,v in pairs(CNPCSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	obj.dwCollectNpcObjId = 0
	obj.dwCanSeeNpc = {}
	obj.AddList = {}
	obj.DelList = {}
	return obj;
end

function CNPCSystem:Create()
	self.dwCollectNpcObjId = 0
	self.dwCanSeeNpc = {}
	self.AddList = {}
	self.DelList = {}
	self.dwDelay = 0
	self.dwLastTime = 0
	return true
end
function CNPCSystem:Destroy()
	return true
end
function CNPCSystem:Clear()
	self.dwCanSeeNpc = {}
	self.DelList = {}
	self.AddList = {}
end
-------------------------------------
--消息接收
-------------------------------------
--收到左键点击npc消息
function CNPCSystem:OnLClick(dwObjId,dwMapId)
	self:OnOpera(dwObjId)
end
--收到右键点击npc消息
function CNPCSystem:OnRClick(dwObjId,dwMapId)
	self:OnOpera(dwObjId)
end
-------------------------------------
--npc被操作
function CNPCSystem:OnOpera(dwObjId,dwIndex)
	--玩家对象
	local objPlayer = self:GetPlayer();
	
	--CAllianceLeaderManager:OnRecvWarEnd(objPlayer:GetRoleID(),10010)
	--[[
	local avatarInfoMsg = SPlayerAvatarViewMsg:new();
	local tabPlayerInfo = objPlayer:GetInfo();
	for k,v in pairs(avatarInfoMsg) do
		avatarInfoMsg[k] = tabPlayerInfo[k];
	end
	objPlayer.NpcSetLeaderMsg{
		Pos = 1;
		Info = avatarInfoMsg;
	}
	--]]
	--地图对象
	local objMap = objPlayer:GetSystem("CMapSystem"):GetCurMap()
	--npc对象
	if not objMap then return end;
	local objNPC = objMap:GetNpcByObjID(dwObjId)
	if not objNPC then return end;
	local vPos = objPlayer:GetSystem("CMapSystem"):GetPlayerPos()
	--if objNPC:GetNearestDis(vPos)>10 then return end;
	--npc脚本
	local tbNpcFun = objNPC.tbFun
	--对话npc
	if objNPC.Data.dwType == 1 then
		--npc对话
		local TbTalkPage = {}--TableCopy(objNPC.tbTalk)
		---------
		--if tbNpcFun.cb_npc_on_talk then
			tbNpcFun.cb_npc_on_talk(TbTalkPage,objPlayer,objPlayer:GetSystem("CScriptSystem"),dwObjId*1000+dwIndex)
		--end
		---------
		TbTalkPage = CheckTable(TbTalkPage)
		--发送对话信息
		objPlayer.NpcGetTalkPageMsg{TbTalkPage = TbTalkPage,DwNpcObjId=dwObjId}
		---------
	--采集npc
	elseif objNPC.Data.dwType == 2 then
		--if tbNpcFun then
			if tbNpcFun.cb_npc_on_opera_check(objNPC,objPlayer,self,objPlayer:GetSystem("CScriptSystem")) then
				local dwPrgTime = tbNpcFun.npc_get_time() or 1000
				self:SendNpcCollectCheckPass(dwObjId,dwPrgTime)
			else
				--该npc无法采集
			end
		--end
	--婚宴桌子
	elseif objNPC.Data.dwType == 9 then
		objPlayer:GetSystem("CMarriageSystem"):OpenEatPanel(dwObjId*1000+dwIndex);
	end
end
--读条完成
function CNPCSystem:OnPrgFinish(dwObjId)
	--玩家对象
	local objPlayer = self:GetPlayer();
	--地图对象
	local objMap = objPlayer:GetSystem("CMapSystem"):GetCurMap()
	--npc对象
	local objNPC = objMap:GetNpcByObjID(dwObjId)
	if not objNPC then return end;
	--npc脚本
	local tbNpcFun = objNPC.tbFun
	if tbNpcFun.cb_npc_on_opera_check(objNPC,objPlayer,self,objPlayer:GetSystem("CScriptSystem")) then
		local blDel = tbNpcFun.cb_npc_on_opera(objNPC,objPlayer,self,objPlayer:GetSystem("CScriptSystem"))
		if blDel then
			CNPCManager:Hide(objNPC.ObjId,objNPC.Data.MapId)
		end
		self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventNpcCollect,1);
	end
end
--切换地图格子
function CNPCSystem:OnChangeMapCheckerEX(setOldChecker,setNewChecker)
	--self:SendMapNpcInfo(true)
end
function CNPCSystem:OnChangeMapChecker(setOldID,setNewID)
	--self:SendMapNpcInfo(true)
end
-------------------------------------
--消息发送
--------------------------------------
--发送一张地图的所有npc信息
function CNPCSystem:SendMapNpcInfo(bChecker)
	--[[
	local bChecker = true
	-- local Add = {}
	-- local Del = {}
	--玩家对象
	local objPlayer = self:GetPlayer()
	--地图系统
	local mapSystem = objPlayer:GetSystem("CMapSystem")
	--RoleID
	local dwRoleID = objPlayer:GetRoleID()
	local Npcs = {}
	if bChecker then
		Npcs = mapSystem:GetCurMap():GetCanLookNpc(objPlayer) or {}
	else
		Npcs = mapSystem:GetCurMap():GetNpcMgr().Nodes
	end
	for dwObjId,Npc in pairs(Npcs) do
		if Npc:IsShow() and (not self.dwCanSeeNpc[dwObjId])then
			self.dwCanSeeNpc[dwObjId] = Npc:GetSendInfo(dwRoleID)
			--Add[dwObjId] = self.dwCanSeeNpc[dwObjId]
			table.insert(self.AddList,Npc)
--			print("add npc:",Npc.Data.dwId)
		end
	end
	for dwObjId,Npc in pairs(self.dwCanSeeNpc) do
		if not Npcs[dwObjId] then
			self.dwCanSeeNpc[dwObjId] = nil;
			--table.insert(Del,dwObjId)
			table.insert(self.DelList,dwObjId)
		end
	end
	--Npc信息
	--objPlayer.NpcGetMapAllNpcMsg{Add=Add,Del=Del}
	--]]
end
--发送npc附加信息
function CNPCSystem:SendNpcLogicInfo()
	--玩家对象
	local objPlayer = self:GetPlayer()
	--地图系统
	local mapSystem = objPlayer:GetSystem("CMapSystem")
	--当前地图
	local Map = mapSystem:GetCurMap()
	--npc管理器
	local mgrNpc = Map:GetNpcMgr()
	----------------------------------------------------
	local sendInfo = mgrNpc:GetSendInfo()
	for k,v in pairs(sendInfo) do
		objPlayer.NpcGetMapAllNpcMsg{
			Info = {[k]=v};
		}
	end
	
	CAllianceLeaderManager:SendModelInfo(objPlayer)
	
end
--发送npc对话消息
function CNPCSystem:SendNpcTalkPage(TbTalkPage,DwNpcObjId)
	local objPlayer = self:GetPlayer()
	objPlayer.NpcGetTalkPage{TbTalkPage=TbTalkPage,DwNpcObjId=DwNpcObjId}
end
--发送增加某个npc消息
function CNPCSystem:SendNpcAddNpc(TbNpc)
	local objPlayer = self:GetPlayer()
	self.dwCanSeeNpc[TbNpc.ObjId] = TbNpc
	objPlayer.NpcAddNpcMsg{TbNpc=TbNpc}
end
--发送删除某个npc消息
function CNPCSystem:SendNpcDelNpc(dwObjId)
	local objPlayer = self:GetPlayer()
	self.dwCanSeeNpc[dwObjId] = nil
	objPlayer.NpcDelNpcMsg{DwObjId=dwObjId}
end
--发送修改npc消息
function CNPCSystem:SendNpcModiNpc(TbNpcInfo)
	local objPlayer = self:GetPlayer()
	objPlayer.NpcModiNpcMsg{TbNpcInfo=TbNpcInfo}
end
--发送npc播放动作消息
function CNPCSystem:Play(dwObjId,dwActionId)
	--玩家对象
	local objPlayer = self:GetPlayer()
	objPlayer.NpcPlayActionMsg{dwObjId=dwObjId,dwActionId=dwActionId}
end
--发送采集判断通过消息
function CNPCSystem:SendNpcCollectCheckPass(dwNpcObjId,dwPrgTime)
	--玩家对象
	local objPlayer = self:GetPlayer()
	objPlayer.NpcCollectCheckPassMsg{NpcObjId=dwNpcObjId;PrgTime=dwPrgTime}
end
--发送采集失败消息
function CNPCSystem:SendNpcCollectFailINfo(dwFailId)
	--玩家对象
	local objPlayer = self:GetPlayer()
	objPlayer.NpcCollectFailINfo{FailId=dwFailId}
end

