--------------------------------
--[[
服务器 NPC
单个npc
周长沙
2012-1-31
--]]
--------------------------------
_G.CNPC = {}
CMemoryDebug:Show("ObjNpc");
--------------------------------
--npc更新
function CNPC:Update(NowTime)
	return true
end
--------------------------------
--生成npc
function CNPC:new(dwId,Map)
	local obj = {}
	local NpcConfigInfo = NPCData[dwId]
	if not NpcConfigInfo then
		_err("Err no this npc:"..dwId)
	end
	
	
	setmetatable(obj,{__index=CNPC})
	-------------------------------
	obj.Map = Map
	--对象id
	obj.ObjId = dwId
	--对话脚本
	obj.tbTalk = {}
	--函数脚本
	obj.tbFun = {}
	--可接受任务信息
	obj.tbAcceptTasks = {}
	--可完成任务信息
	obj.tbCompleteTasks = {}
	--对话任务信息
	obj.tbTalkTasks = {}
	--采集任务信息
	obj.tbCollectTask = {}
	--是否日环
	obj.bDaily = false
	--是否周环
	obj.bWeekly = false
	--位置
	obj.pos = {};
	--附加信息
	obj.Data = {};
	obj.Data.dwType = NpcConfigInfo._type
	obj.Data.szName = nil
	obj.Data.szTitle = nil
	-------------------------------
	--是否是动态的
	obj.bDynamic = false
	obj.dwCount = 100
	
	CMemoryDebug:AddObject("ObjNpc", obj);
	return obj
end
--添加位置信息
function CNPC:AddPos(x,y)
	self.dwCount = self.dwCount + 1
	self.pos[self.dwCount]={x=x,y=y}
	return self.dwCount
end
--添加动态信息
function CNPC:AddDynamic(x,y,dir,szName,szTitle)
	self.bDynamic = true
	self.dwCount = self.dwCount + 1
	self.pos[self.dwCount]={x=x,y=y,dir=dir,szName=szName,szTitle=szTitle}
	return self.dwCount
end
--移除npc
function CNPC:Remove(dwIndex)
	if self.pos[dwIndex] then
		self.pos[dwIndex] = nil
		if self.tbFun and self.tbFun.npc_on_del then
			self.tbFun.npc_on_del(dwIndex)
		end
		return true
	end
	return false
end

--npc修改
function CNPC:Modi(tbNpcInfo)
end

--npc播放动作
function CNPC:Play(dwActionId)
end

----------------------------------------------
--返回npc是否显示
function CNPC:IsShow()
end
--返回npc data 信息
function CNPC:GetData()
end
--返回Npc id
function CNPC:GetID()
	return self.ObjId
end
--返回npc对象id
function CNPC:GetObjId()
	return self.ObjId
end
--获取npc坐标
function CNPC:GetPos()
end
--获得地图
function CNPC:GetMap()
	return self.Map
end
--设置副本数据
function CNPC:SetDuplData(dwData)
	local Map = self:GetMap()
	if not Map then return end;
	local Dupl = Map:GetDuplObj()
	if not Dupl then return end;
	Dupl:SetMonsterTime(dwData)
end
--------------------------------------------------------
--获取npc需要同步到客户端的信息
function CNPC:GetSendInfo(Index)
	local sendInfo = {}
	if self.bDynamic then
		sendInfo.pos = {}
		if Index then
			for _,dwIndex in pairs(Index) do
				sendInfo.pos[dwIndex] = self.pos[dwIndex]
			end
		else
			sendInfo.pos = self.pos
		end
	end
	if self.tbAcceptTasks and self.tbAcceptTasks[1] then
		sendInfo.tbAcceptTasks = self.tbAcceptTasks
	end
	if self.tbCompleteTasks and self.tbCompleteTasks[1] then
		sendInfo.tbCompleteTasks = self.tbCompleteTasks
	end
	if self.tbCollectTask and self.tbCollectTask[1] then
		sendInfo.tbCollectTask = self.tbCollectTask
	end
	if self.tbTalkTasks and self.tbTalkTasks[1] then
		sendInfo.tbTalkTasks = self.tbTalkTasks
	end
	if self.bDaily then
		sendInfo.bDaily = self.bDaily
	end
	if self.bWeekly then
		sendInfo.bWeekly = self.bWeekly
	end
	return sendInfo
end
--获取npc与某个坐标的最近距离
function CNPC:GetNearestDis(vPos)
	local fDis = 9999
	for k,v in pairs(self.pos) do
		local thisDis =  math.sqrt((v.x-vPos.x)^2+(v.y-vPos.y)^2)
		if thisDis<fDis then
			fDis = thisDis
		end
	end
	return fDis
end
----------------------------------------------
--设置npc的任务信息
function CNPC:SetTaskInfo()
	if self.Data.dwType == 2 then
		-- if self.tbFun and self.tbFun.npc_get_task then
			self.tbCollectTask = self.tbFun.npc_get_task()
		--end
	end
	self.tbAcceptTasks = {}
	self.tbCompleteTasks = {}
	if type(self.tbTalk)=="table" and type(self.tbTalk[1])=="table" then
		for _,Link in pairs(self.tbTalk[1]) do
			if Link.tp == tk.accept_check then
				if type(Link.id)=="table" then
					for _,id in pairs(Link.id) do
						if type(id)=="number" then
							table.insert(self.tbAcceptTasks,id)
						end
					end
				end
			elseif Link.tp == tk.complete_check then
				if type(Link.id)=="table" then
					for _,id in pairs(Link.id) do
						if type(id)=="number" then
							table.insert(self.tbCompleteTasks,id)
						end
					end
				end
			elseif Link.tp == tk.find_npc then
				if type(Link.id)=="table" then
					for _,id in pairs(Link.id) do
						if type(id)=="number" then
							table.insert(self.tbTalkTasks,id)
						end
					end
				end
			elseif Link.tp == tk.daily then
				self.bDaily = true
			elseif Link.tp == tk.weekly then
				self.bWeekly = true
			end
		end
	end
end


