--[[
功能：摇奖系统类（服务器）
作者：周长沙
时间：2012-1-31
--]]

_G.CBanditSystem = {}
-------------------------------
function CBanditSystem:new()
	local obj = CSystem:new("CBanditSystem");
	for i,v in pairs(CBanditSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CBanditSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	--获取 （登录时 ks / 换线时老 gs） 发过来的数据
	local Data = objPlayer:GetLineData("CBanditSystem") or {}
	local Info = Data[1] or {}
	self.Items = Info.Items or {}
	self.dwItemId = Info.dwItemId or 0
	self.dwState = Info.dwState or 0
	self.dwPos1 = Info.dwPos1 or 0
	self.dwPos2 = Info.dwPos2 or 0
	self.dwPos3 = Info.dwPos3 or 0
	self.dwRoleId = objPlayer:GetRoleID()
	self.szRoleName = objPlayer.sRoleInfo.szRoleName
	return true
end
function CBanditSystem:Update(dwInterval)
	return true
end
function CBanditSystem:Destroy()
	if self.dwPos1 ~= 0 then
		self:SendMail()
	end
	return true
end
function CBanditSystem:OnChangeLineBegin(dwNewLineID)
	--[[
	local objPlayer = self:GetPlayer()
	local Data = {}
	Data.Items = self.Items
	Data.dwItemId = self.dwItemId
	Data.dwState = self.dwState
	Data.dwPos1 = self.dwPos1
	Data.dwPos2 = self.dwPos2
	Data.dwPos3 = self.dwPos3
	objPlayer:SetLineData("CBanditSystem",Data)
	--]]
end

--启动换线时候的检查

function CBanditSystem:OnChangeLineCheck(dwNewLineID)
	if self.dwPos1 ~= 0 then
		return false
	end
	return true
end;

-------------------------------------
--处理函数
-------------------------------------
--随机出16个物品
function CBanditSystem:Get16Items(bChange)
	if self.dwPos1 > 0 then
		self:SendFailInfo(13000710004)
		return self.Items
	end
	if (#self.Items == 0) or bChange then
		local objPlayer = self:GetPlayer()
		local dwLevel = objPlayer:GetLevel()
		local dwTeamId = DropFunctionConfig:GetBanditDropTeam(dwLevel,self.dwItemId) 
		local dwTN,dwHY = DropFunctionConfig:GetBanditPriority(dwLevel,self.dwItemId)
		local bItems = CDropControl:DoGet(dwTeamId)
		local Items = {}
		for k,v in pairs(bItems) do
			table.insert(Items,v:GetValueInfo())
		end
		self.Items = Items
		table.insert(self.Items,9,{dwPriority=dwTN})
		table.insert(self.Items,18,{dwPriority=dwHY})
		return Items
	end
	return self.Items
end
--获得转动过程
function CBanditSystem:GetThisTurn()
	local dwSum = 0
	for k,v in pairs(self.Items) do
		if v.dwPriority then
			dwSum = dwSum + v.dwPriority
		end
	end
	local rand = math.random(1,dwSum)
	for k,v in pairs(self.Items) do
		if v.dwPriority >= rand then
			rand = k
			break;
		end
		rand = rand - v.dwPriority
	end
	local dwState = 0
	local dwPos1 = 0
	local dwPos2 = 0
	local dwPos3 = 0
	if rand==9 then
		local t = {1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17}
		dwState = 1
		local rand1 = math.random(1,#t)
		dwPos1 = t[rand1]
		table.remove(t,rand1)
		local rand2 = math.random(1,#t)
		dwPos2 = t[rand2]
		table.remove(t,rand2)
		local rand3 = math.random(1,#t)
		dwPos3 = t[rand3]
		table.remove(t,rand3)
	elseif rand==18 then
		local t = {3,4,5,6,7,8,12,13,14,15,16,17}
		dwState = 2
		local rand = math.random(1,#t)
		dwPos1 = t[rand]
		dwPos2 = dwPos1-1
		dwPos3 = dwPos2-1
	else
		dwPos1 = rand
	end
	self.dwState = dwState
	self.dwPos1 = dwPos1
	self.dwPos2 = dwPos2
	self.dwPos3 = dwPos3
	return dwState,dwPos1,dwPos2,dwPos3
end
--给予奖励
function CBanditSystem:GiveItem()
	if self.dwPos1==0 then
		return false
	end
	if not self:CheckForGive() then
		--发送邮件
		return self:SendMail();
	end
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local dwPos1 = self.dwPos1
	local dwPos2 = self.dwPos2
	local dwPos3 = self.dwPos3
	
	local setAddList = {};
	if dwPos1 > 0 then
		local tempTabel1 = {
			dwItemEnum 	= self.Items[dwPos1].dwItemId;
			dwItemNumber= self.Items[dwPos1].dwNum;
			dwBindType	= enItemBindType.eYes;
		};
		table.insert(setAddList, tempTabel1);
	end
	if dwPos2 > 0 then
		local tempTabel2 = {
			dwItemEnum	= self.Items[dwPos2].dwItemId;
			dwItemNumber= self.Items[dwPos2].dwNum;
			dwBindType	= enItemBindType.eYes;
		};
		table.insert(setAddList, tempTabel2);
	end
	if dwPos3 > 0 then
		local tempTabel3 = {
			dwItemEnum	= self.Items[dwPos3].dwItemId;
			dwItemNumber= self.Items[dwPos3].dwNum;
			dwBindType	= enItemBindType.eYes;
		};
		table.insert(setAddList, tempTabel3);
	end
	if #setAddList > 0 then
		sysItem:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.Bandit)
	end;
	
	return true
end
--检查能否得到奖励
function CBanditSystem:CheckForGive()
	local Items = {}
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local dwPos1 = self.dwPos1
	local dwPos2 = self.dwPos2
	local dwPos3 = self.dwPos3
	if dwPos1 > 0 then
		local item1 = {}
		item1.dwItemEnum = self.Items[dwPos1].dwItemId;
		item1.dwItemNumber = self.Items[dwPos1].dwNum;
		item1.dwBindType = enItemBindType.eYes;
		table.insert(Items,item1)
	end
	if dwPos2 > 0 then
		local item2 = {}
		item2.dwItemEnum = self.Items[dwPos2].dwItemId;
		item2.dwItemNumber = self.Items[dwPos2].dwNum;
		item2.dwBindType = enItemBindType.eYes;
		table.insert(Items,item2)
	end
	if dwPos3 > 0 then
		local item3 = {}
		item3.dwItemEnum = self.Items[dwPos3].dwItemId;
		item3.dwItemNumber = self.Items[dwPos3].dwNum
		item3.dwBindType = enItemBindType.eYes;
		table.insert(Items,item3)
	end
	if sysItem:IsEnumItemListCanAddToPacket(Items) then
		return true
	else
		--背包空间不足
		if dwPos2>0 then
			--self:SendFailInfo(5203)
		else
			--self:SendFailInfo(5204)
		end
		return false
	end
end
--检查能否使用
function CBanditSystem:CheckForUse()
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	if self.dwPos1 > 0 then
		self:SendFailInfo(13000710004)
		return false
	end
	if not sysItem:IsPacketSlotEnoughFor(3) then
		--------------
		--背包空间不足
		self:SendFailInfo(13000710001)
		--------------
		return false
	end
	return true
end
--检查能否开始
function CBanditSystem:CheckForStart()
	if not self:CheckForUse() then
		return false
	end
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local dwCounts, dwBindNum, dwUnBindNum = sysItem:GetEnumItemNumInPacket(self.dwItemId);
	if (dwCounts < 1) then
		self:SendFailInfo(13000710003)
		return false
	end
	return true
end
-------------------------------------
--消息接收
-------------------------------------
--接收到玩家使用物品消息
function CBanditSystem:OnRecvUseInfo(dwItemId)
	if self:CheckForUse() then
		local dwLastItemID = self.dwItemId
		self.dwItemId = dwItemId
		self:Get16Items(dwLastItemID~=dwItemId)
		self:SendItemList()
	end
end
--接收到玩家点击开始消息
function CBanditSystem:OnRecvStartInfo()
	if self:CheckForStart() then
		if #self.Items == 0 then
			self:Get16Items()
			self:SendItemList()
		end
		local objPlayer = self:GetPlayer()
		local sysItem = objPlayer:GetSystem("CItemSystem")
		sysItem:DelEnumItemInPacket(self.dwItemId, 1, false, _G.ItemSysOperType.Bandit)
		self:GetThisTurn()
		self:SendThisTurn()
	end
end
--接收到玩家点击领取消息
function CBanditSystem:OnRecvGetInfo()
	if self:GiveItem() then
		self.Items = {}
		self.dwState = 0
		self.dwPos1 = 0
		self.dwPos2 = 0
		self.dwPos3 = 0
		self:SendGetSuc()
	end
end
--接收到玩家继续摇奖消息
function CBanditSystem:OnRecvContinue()
	self:Get16Items()
	self:SendItemList()
	self:OnRecvStartInfo()
end
-------------------------------------
--消息发送
--------------------------------------
--发送使用成功消息与物品列表
function CBanditSystem:SendItemList()
	local objPlayer = self:GetPlayer()
	objPlayer.BanditGetItemListMsg{ItemList=self.Items;ItemId=self.dwItemId}
end
--发送转动过程
function CBanditSystem:SendThisTurn()
	local objPlayer = self:GetPlayer()
	local dwState = self.dwState
	local dwPos1 = self.dwPos1
	local dwPos2 = self.dwPos2
	local dwPos3 = self.dwPos3
	objPlayer.BanditGetTurnMsg{State=dwState;Pos1=dwPos1;Pos2=dwPos2;Pos3=dwPos3}
end
--发送领取成功消息
function CBanditSystem:SendGetSuc()
	local objPlayer = self:GetPlayer()
	objPlayer.BanditGetSucMsg{}
end
--发送失败提示
function CBanditSystem:SendFailInfo(dwId)
	local objPlayer = self:GetPlayer()
	objPlayer.BanditFailInfoMsg{Id=dwId}
end

--发送邮件
function CBanditSystem:SendMail()
	local objMail = CMail:new()
	local objPlayer = self:GetPlayer()
	local Item = {}
	if self.dwPos1 ~= 0 then
		local dwPos = self.dwPos1
		local oitem = SItemMessage:new();
		oitem.dwItemEnum = self.Items[dwPos].dwItemId
		oitem.dwItemNumber =  self.Items[dwPos].dwNum
		oitem.dwBindType = enItemBindType.eYes
		oitem.dwLifeTime = -1;
		table.insert( Item, oitem );
	end
	if self.dwPos2 ~= 0 then
		local dwPos = self.dwPos2
		local oitem = SItemMessage:new();
		oitem.dwItemEnum = self.Items[dwPos].dwItemId
		oitem.dwItemNumber =  self.Items[dwPos].dwNum
		oitem.dwBindType = enItemBindType.eYes
		oitem.dwLifeTime = -1;
		table.insert( Item, oitem );
	end
	if self.dwPos3 ~= 0 then
		local dwPos = self.dwPos3
		local oitem = SItemMessage:new();
		oitem.dwItemEnum = self.Items[dwPos].dwItemId
		oitem.dwItemNumber =  self.Items[dwPos].dwNum
		oitem.dwBindType = enItemBindType.eYes
		oitem.dwLifeTime = -1;
		table.insert( Item, oitem );
	end
	
	objMail:SetSender( -10086, "系统邮件" )
	objMail:SetReceiver( self.dwRoleId, self.szRoleName );
	objMail:SetContent( "摇奖礼包奖品！", "您的背包已满，系统已通过邮件将物品发送到您的邮箱中，请查收" );
	objMail:SetLifeTime( SMailInfo.life*24*60*60*1000 );
	objMail:SetAccessory( 0, 0, 0, Item );
	CMailManager:SendMail( objMail )
	self:SendGetSuc()
	return true
end






















