--[[
功能：引入收集功能相关的LUA文件（服务器）
作者：周长沙
时间：2013-1-22
]]
-------------------------------------
_G.CCollectSystem = {}
-------------------------------------
-------------------------------------
function CCollectSystem:new()
	local obj = CSystem:new("CCollectSystem");
	---------------------------------------------
	for i,v in pairs(CCollectSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	---------------------------------------------
	return obj;
end

function CCollectSystem:Create(bChangeLine)
	-----------------
	self.Collect = {};
	-----------------
	--获取数据库操作对象
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CCollectSystemDB:new(objDB,self)
	--读取信息
	local Data = objPlayer:GetLineData("CCollectSystem") or {}
	
	for i=1,#Data do
		for k,v in pairs(Data[i]) do
			local Node = CCollectManager:GetCollectByDBInfo(v)
			if Node then
				self:AddCollect(Node)
			end
		end
	end
	self:AddValue()
	return true;
end
function CCollectSystem:Update(dwInterval)
	return true
end

function CCollectSystem:Destroy()
	return true
end

function CCollectSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	for k,v in pairs(self.Collect) do
		objPlayer:SetLineData("CCollectSystem",v)
	end
end

--客户端进入游戏登入所有场景之后
function CCollectSystem:OnEnterScene()
	self:SendInfo()
end;
---------------------------------------------------
----------------------------------------------功能
function CCollectSystem:AddCollect(Node)
	if not self.Collect[Node:GetPageID()] then
		self.Collect[Node:GetPageID()] = {}
	end
	self.Collect[Node:GetPageID()][Node:GetSeriesID()] = Node
	--table.print(Node)
end

function CCollectSystem:GetCollect(dwPageID,dwSeriesID)
	if not self.Collect[dwPageID] then return end;
	return self.Collect[dwPageID][dwSeriesID]
end

function CCollectSystem:GetValueAdd()
	local Value = SSingleAttrChange:new()
	for dwPageID,Page in pairs(self.Collect) do
		for dwSeriesID,Series in pairs(Page) do
			if (Series:GetState()==1) or (Series:IsSp())then
				for k,v in pairs(Series:GetReward()) do
					Value[k] = (Value[k] or 0) + v
				end
			end
		end
	end
	return Value
end
function CCollectSystem:GetRewardScore()
	local tbReward = self:GetValueAdd()
	local objPlayer = self:GetPlayer()
	local youwuzhiSystem=objPlayer:GetSystem("CYouWuZhiSystem")
	local attr=youwuzhiSystem:GetAttr();
	for k,v in pairs(attr) do
		tbReward[k] = tbReward[k] + v;
	end	
	local value = 0
	for k,v in pairs (tbReward) do
		if EquipGradeConfig[k] then
			value = value + EquipGradeConfig[k]*v
		end
	end
	
	return value
end
function CCollectSystem:AddValue()
	local Value = self:GetValueAdd()
	local objPlayer = self:GetPlayer()
	local sysSkill = objPlayer:GetSystem("CSkillSystem")
	
	----尤物志的属性加成-------
		local youwuzhiSystem=objPlayer:GetSystem("CYouWuZhiSystem")
		local attr=youwuzhiSystem:GetAttr();
		for k,v in pairs(attr) do
			Value[k]=Value[k]+v;
		end	
	------------	
	
	sysSkill:NotifyCollect(Value,bPerInfo)
	
end
---------------------------------------------------
----------------------------------------------接收
function CCollectSystem:OnRecvHandInMsg(Info)
	local objPlayer = self:GetPlayer()
	local dwRoleID = objPlayer:GetRoleID()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local res = {}
	local effNode = {}
	local bExist = true
	local bChangeValue = false
	for k,v in pairs(Info) do
		local dwInstID = v.dwInstID
		local dwNum = v.dwNum
		local dwPage = v.dwPage
		local dwSeries = v.dwSeries
		-- self:SendNotice(dwPage,dwSeries)
		local dwIndex = v.dwIndex
		local Item = sysItem:GetItem(dwInstID)
		if Item then 
			local Series = self:GetCollect(dwPage,dwSeries)
			if not Series then
				Series = CCollectManager:CreatForNew(dwPage,dwSeries,dwRoleID)
				if Series then
					self:AddCollect(Series)
				end
				bExist = false;
			else
				bExist = true;
			end
			local dwNeed,dwI = Series:GetItemNeedNum(Item:GetEnumID())
			if dwI~=dwIndex then return end;
			if dwNum > dwNeed then
				dwNum = dwNeed
			end
			if dwNum > 0 then
				if sysItem:DelItemNumber(dwInstID, dwNum, _G.ItemSysOperType.Collect) then
					if Series:SetSchedule(dwIndex,dwNum) then
						bChangeValue = true
						self:SendNotice(dwPage,dwSeries)
					end
					self:DBWrite(dwPage,dwSeries,bExist)
					
					table.insert(res,Item:GetEnumID())
					table.insert(effNode,Series)
				end
			else
				--不需要提交了
				sysScript:Notice(13001510002)
			end
		end
	end
	self:SendChange(effNode)
	self:SendRes(res)
	if bChangeValue then
		self:AddValue()
	end
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventCollectSubmit,1)
end

function CCollectSystem:OnRecvComposeMsg(Info)
	local objPlayer = self:GetPlayer()
	local dwRoleID = objPlayer:GetRoleID()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local dwPage = Info.dwPage
	local dwIndex = Info.dwIndex
	local bExist = true
	local bChangeValue = false
	local Series = self:GetCollect(dwPage,1)
	if not Series then
		Series = CCollectManager:CreatForNew(dwPage,1,dwRoleID)
		if Series then
			self:AddCollect(Series)
		end
		bExist = false;
	else
		bExist = true;
	end
	local dwItemID = Series.ConfigSp.Items[dwIndex].dwItemID
	local dwNeed = Series:GetItemNeedNum(dwItemID)
	if dwNeed<1 then--已经合成过了
		sysScript:Notice(13001510002)
		return;
	end
	local ItemNeed = Series.ConfigSp.Items[dwIndex].NeedItem
	
	local NeedMoney = Series.ConfigSp.Items[dwIndex].NeedMoney
	sysScript:DelSpItem(3,NeedMoney)                                              --金钱消耗 create by 赵飞

	for i=1,#ItemNeed do
		local dwItemID = ItemNeed[i][1]
		local dwNum = ItemNeed[i][2]
		local dwRealNum = sysScript:GetItemNum(dwItemID)
		if dwRealNum < dwNum then--物品数量不足
			return;
		end
	end
	for i=1,#ItemNeed do
		local dwItemID = ItemNeed[i][1]
		local dwNum = ItemNeed[i][2]
		sysScript:DelItem(dwItemID,dwNum)
	end
	if Series:SetSchedule(dwIndex,1) then
		bChangeValue = true
		self:SendNoticeCompose(dwPage,1)
	end
	local effNode = {Series}
	self:SendChange(effNode)
	self:AddValue()
	self:DBWrite(dwPage,1,bExist)
end
---------------------------------------------------
----------------------------------------------发送
function CCollectSystem:SendInfo()
	local objPlayer = self:GetPlayer()
	objPlayer.CollectSendAllMsg{Info = self.Collect}
end

function CCollectSystem:SendChange(Info)
	local objPlayer = self:GetPlayer()
	objPlayer.CollectSendChangeMsg{Info = Info}
end
function CCollectSystem:SendRes(Info)
	local objPlayer = self:GetPlayer()
	objPlayer.CollectSendResMsg{Info = Info}
end
function CCollectSystem:SendNotice(dwPage,dwSeries)
	local objPlayer = self:GetPlayer()
	local szStr = string.format(CollectTextConfig.Noitce,"%s",CollectConfig[dwPage].szName,CollectConfig[dwPage][dwSeries].szName,"%s")
	local Param = {
		[1] = {
			szFunStr = objPlayer:GetName();
			dwFunId = 27;
			param = {objPlayer:GetRoleID(),objPlayer:GetName()};
		};
		[2] = {
			szFunStr = CollectTextConfig.MeToo;
			dwFunId = 33;
			param = {dwPage,dwSeries};
		};
	}
	local szStr2 = string.format(CollectTextConfig.Noitce,objPlayer:GetName(),CollectConfig[dwPage].szName,CollectConfig[dwPage][dwSeries].szName,"")
	CScriptManager:ChatNoticeAll(szStr,7,bSystem,Param,szStr2,true)
end

function CCollectSystem:SendNoticeCompose(dwPage,dwSeries)                        --古学志提示 create by 赵飞
	local objPlayer = self:GetPlayer()
	local szStr = string.format(CollectTextConfig.NoitceCompose,"%s",CollectConfig[dwPage].szName,"%s")
	local Param = {
		[1] = {
			szFunStr = objPlayer:GetName();
			dwFunId = 27;
			param = {objPlayer:GetRoleID(),objPlayer:GetName()};
		};
		[2] = {
			szFunStr = CollectTextConfig.MeToo;
			dwFunId = 33;
			param = {dwPage,dwSeries};
		};
	}
	local szStr2 = string.format(CollectTextConfig.NoitceCompose,objPlayer:GetName(),CollectConfig[dwPage].szName,"")
	CScriptManager:ChatNoticeAll(szStr,7,bSystem,Param,szStr2,true)
end
---------------------------------------------------
--------------------------------------------数据库
function CCollectSystem:DBWrite(dwPageID,dwSeriesID,bExist)
	local objPlayer = self:GetPlayer();
	local dwRoleID = objPlayer:GetRoleID()
	local Node = self:GetCollect(dwPageID,dwSeriesID)
	if not Node then return end;
	if bExist then
		self.objDBQuery:UpdateInfo(Node:Pack())
	else
		self.objDBQuery:AddInfo(Node:Pack())
	end
end







































