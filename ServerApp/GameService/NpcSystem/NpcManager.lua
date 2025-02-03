--------------------------------
--[[
 服务器 NPC
 npc管理器
 周长沙
 2012-1-31
--]]
--------------------------------
_G.CNPCManager = {}
--------------------------------
--构造
function CNPCManager:new(Map)
	local obj = {}
	--保存地图对象
	obj.Map = Map
	for k,v in pairs(CNPCManager) do
		if type(v)=="function" then
			obj[k]=v
		end
	end
	return obj;
end
--初始化
function CNPCManager:Create()
	--npc节点
	self.Nodes = {}
	--当前可用对象id
	self.NowId = 1
	--当前npc数量
	self.NowNpcNum = 0
	--初始化默认npc信息
	self:InitDefaultNpcInfo(self.Map)
	--更新延时
	self.dwUpdateDelay = 1000
	--上次更新时间
	self.dwLastUpdateTime = 0
	---------------------------
	---------------------------
	return true;
end
--更新 服务器的npc逻辑
function CNPCManager:Update()
	return true
end
--销毁
function CNPCManager:Destroy()
	return true
end
--------------------------------
--插入一个npc信息到管理器
function CNPCManager:Insert(Node)
	self.Nodes[Node.ObjId]=Node
	
	Node.tbTalk = CScriptManager:GetScript(ScriptTypeConfig.NpcTalk,Node:GetID()) or {}
	Node.tbFun = CScriptManager:GetScript(ScriptTypeConfig.Npc,Node:GetID()) or {}
	
	Node:SetTaskInfo()
	
	self.NowNpcNum = self.NowNpcNum + 1
	
	return Node.ObjId
end
----------------------------------
--新增一个npc
function CNPCManager:Add(dwNpcId,fX,fY,fDir, szName, szTitle)
	local Npc = self:GetTemplate(dwNpcId)
	local dwIndex = Npc:AddDynamic(fX,fY,fDir,szName,szTitle)
	local vInfo = {dwId=dwNpcId,vPos={dwIndex}}
	self:SendAddNpcInfo(vInfo)
	-- print("CNPCManager:Add",dwNpcId*1000+dwIndex)
	return dwNpcId*1000+dwIndex;
end
--移除一个npc
function CNPCManager:Remove(dwInfo)
	local vInfo = {dwId=math.floor(dwInfo/1000),vPos={math.mod(dwInfo,1000)}}
	-- print("CNPCManager:Remove",dwInfo,vInfo.dwId,vInfo.vPos[1])
	local Npc = self:GetTemplate(vInfo.dwId)
	local SendInfo = {}
	SendInfo.dwId = vInfo.dwId
	SendInfo.vPos = {}
	local bSend = false
	for dwIndex,dwPos in pairs(vInfo.vPos) do
		if Npc:Remove(dwPos) then
			bSend = true
			table.insert(SendInfo.vPos,dwPos)
		end
	end
	if bSend then
		self:SendRemoveNpcInfo(SendInfo)
	end
	return bSend
end
--延时增加一个npc
function CNPCManager:DelayAdd(dwNpcId,fX,fY,fDir,szName,szTitle,dwObjId,dwDelay)
	_err("no this function any more")
end
--延时删除一个npc
function CNPCManager:DelayRemove(dwObjId,dwDelay)
	_err("no this function any more")
end
---------------------------------------------------------
--显示一个npc
function CNPCManager:Show(dwObjId)
end
--隐藏一个npc
function CNPCManager:Hide(dwObjId)
end
--修改一个npc
function CNPCManager:Modi(dwObjId,tbNpcInfo)
end
--npc播放动作
function CNPCManager:Play(dwObjId,dwActionId)
end
--开始一段剧情对话
function CNPCManager:Story(dwStoryId,objPlayer)
	if objPlayer then
		objPlayer.NpcStoryMsg{StoryID=dwStoryId}
	else
		local Map = self.Map
		if Map then
			local tbPLayers = Map:GetAllPlayer()
			for dwPos,objPlayer in pairs(tbPLayers) do
				objPlayer.NpcStoryMsg{StoryID=dwStoryId}
			end
		end
	end
end
---------------------------------------------------------
--服务器开启时，初始化所有默认npc信息
function CNPCManager:InitDefaultNpcInfo(Map)
	if MapInfoConfig[Map.MapID] and type(MapInfoConfig[Map.MapID].npc)=="table" then
		for _,Info in pairs(MapInfoConfig[Map.MapID].npc) do
			local Npc = self:GetTemplate(Info.npc_id)
			Npc:AddPos(Info.x,Info.y)
		end
	end
end
---------------------------------------------------------
--获取地图的当前npc数量
function CNPCManager:GetAllNpcNum()
	return self.NowNpcNum
end
--------------------------------------------------------
--获得npc模版，没有则创建
function CNPCManager:GetTemplate(dwNpcID)
	if not self.Nodes[dwNpcID] then
		local Node = CNPC:new(dwNpcID,self.Map)
		self:Insert(Node)
	end
	return self.Nodes[dwNpcID]
end
--获取地图的所有npc信息
function CNPCManager:GetMapNpcInfo(dwRoleID)
end
--获取需要发送的逻辑信息
function CNPCManager:GetSendInfo()
	local sendInfo = {}
	for k,v in pairs(self.Nodes) do
		sendInfo[k] = v:GetSendInfo()
	end
	return sendInfo
end
---------------------------------------------------------
--获取某个npc的信息
function CNPCManager:GetNpcInfo(ObjId)
	return self.Nodes[ObjId]
end
--根据npc配置id获得一个npc
function CNPCManager:GetNpc(dwNpcId,objPlayer)
	for dwObjId,Npc in pairs(self.Nodes) do
		if Npc:GetID() == dwNpcId then
			if objPlayer then
				if Npc.objPlayer and (Npc.objPlayer:GetRoleID()==objPlayer:GetRoleID()) then
					return Npc
				end
			else
				return Npc
			end
		end
	end
end
---------------------------------------------------------
--消息发送
--增加npc
function CNPCManager:SendAddNpcInfo(vInfo)
	local Npc = self:GetNpcInfo(vInfo.dwId)
	if not Npc then return end;
	local sendInfo = {}
	sendInfo[vInfo.dwId] = Npc:GetSendInfo(vInfo.vPos)
	local Map = self.Map
	if Map then
		local tbPLayers = Map:GetAllPlayer()
		for dwPos,objPlayer in pairs(tbPLayers) do
			objPlayer.NpcAddNpcMsg{Info = sendInfo}
		end
	end
end
--移除npc
function CNPCManager:SendRemoveNpcInfo(vInfo)
	local Map = self.Map
	if Map then
		local tbPLayers = Map:GetAllPlayer()
		for dwPos,objPlayer in pairs(tbPLayers) do
			objPlayer.NpcDelNpcMsg{Info=vInfo}
		end
	end
end













