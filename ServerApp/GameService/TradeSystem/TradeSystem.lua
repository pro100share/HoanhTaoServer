--玩家交易结构属性
_G.CTradeSystem = {}
function CTradeSystem:new()
	local obj = CSystem:new("CTradeSystem");
	--自己的交易物品表
	obj.setMyItemList = {};
	--自己的交易金钱表
	obj.setMyMoneyList = 
	{	
		dwMoney = 0,
		dwGold = 0,
	}
	--交易锁
	obj.bLock = 0;
	--交易状态
	obj.nState = 0;
	--交易等待玩家列表
	obj.setTradePlayerList = {};
	--保存是否要删除出等待交易玩家列表的玩家
	obj.setTradePlayerPastList = {};
	--时间戳
	obj.dwTimeStamp = 0;
	--正在交易的玩家
	obj.dwTradingPlayer = 0;
	--确认状态
	obj.bIsMakeSure = 0
	
	for i,v in pairs(CTradeSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CTradeSystem:GetState()
	return self.nState
end
function CTradeSystem:Create()
	self.DecodeFun = {}
	self.DecodeFun[TradeMsgConfig.AddItem] = function(objPlayer,dwItemID) self:DecodeFunAddItem(objPlayer,dwItemID) end
	self.DecodeFun[TradeMsgConfig.DownItem] = function(objPlayer,dwItemID) self:DecodeFunDownItem(objPlayer,dwItemID) end
	self.DecodeFun[TradeMsgConfig.AddMoney] = function(objPlayer,dwItemID) self:DecodeFunAddMoney(objPlayer,dwItemID) end
	self.DecodeFun[TradeMsgConfig.AddGold] = function(objPlayer,dwItemID) self:DecodeFunAddGold(objPlayer,dwItemID) end
	self.DecodeFun[TradeMsgConfig.Break] = function(objPlayer,dwItemID) self:DecodeFunBreak(objPlayer,dwItemID) end
	self.DecodeFun[TradeMsgConfig.Lock] = function(objPlayer,dwItemID) self:DecodeFunLock(objPlayer,dwItemID) end
	self.DecodeFun[TradeMsgConfig.Complete] = function(objPlayer,dwItemID) self:DecodeFunComplete(objPlayer,dwItemID) end
		
	self.DecodeFun[TradeMsgConfig.Request] = function(objPlayer,dwDesRoleID) self:DecodeFunRequest(objPlayer,dwDesRoleID) end
	self.DecodeFun[TradeMsgConfig.Response] = function(objPlayer,dwDesRoleID) self:DecodeFunResponse(objPlayer,dwDesRoleID) end
	self.DecodeFun[TradeMsgConfig.Refuse] = function(objPlayer,dwDesRoleID) self:DecodeFunRefuse(objPlayer,dwDesRoleID) end
	return true;
end
function CTradeSystem:DecodeFunRequest(objPlayer,dwDesRoleID)
	local objPlayerRoleID = objPlayer:GetRoleID()
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objOther = objMapSystem:GetRoleByID(dwDesRoleID)
	local objOtherTradeSys
	local szMeName = objPlayer:GetInfo().szRoleName
	local szOtherName
	if objOther then
		objOtherTradeSys = objOther:GetSystem("CTradeSystem");
		szOtherName = objOther:GetInfo().szRoleName
	end
	--判断玩家是否在同一线
	if not objPlayer:GetOtherPlayer(dwDesRoleID,3) then
		objPlayer.CltTradeMsg{Type = TradeMsgConfig.NotSameLine,RoleID = dwDesRoleID,RoleName = szOtherName}
		return 
	end
	--判断玩家是否在同一地图
	if not objPlayer:GetOtherPlayer(dwDesRoleID,2) then
		objPlayer.CltTradeMsg{Type = TradeMsgConfig.OutOfRange,RoleID = dwDesRoleID,RoleName = szOtherName}
		return 
	end
	--判断玩家是否在交易范围内
	local dwDis = objPlayer:GetDisByPlayer(dwDesRoleID);
	if dwDis == -1 or dwDis > TradeConfig.TradeLimitDistance then
		objPlayer.CltTradeMsg{Type = TradeMsgConfig.OutOfRange,RoleID = dwDesRoleID,RoleName = szOtherName}
		return 
	end
	--判断玩家是否在进行与其他玩家交易动作
	if objOtherTradeSys:GetState() == 1 then
		objPlayer.CltTradeMsg{Type = TradeMsgConfig.Tradeing,RoleID = dwDesRoleID,RoleName = szOtherName}
		return 
	end
	--判断玩家是否已经死亡
	if not objOther:GetSystem("CStateSystem"):CheckPlayerAction(enPlayerAction.ePA_Trade) then
		objPlayer.CltTradeMsg{Type = TradeMsgConfig.Dead,RoleID = dwDesRoleID,RoleName = szOtherName}
		return 
	end
	--判断是否可以向对方发送请求，对方有可能禁止接收交易信息--周兴团--5-23
	if not objPlayer:GetSystem("CSettingSystem"):CanSendTradeInviteTo( dwDesRoleID ) then
		return;
	end
	--发送给发起交易方 请求已发送 
	objPlayer.CltTradeMsg{Type = TradeMsgConfig.RequestSendSuccsee,RoleID = dwDesRoleID,RoleName = szOtherName}
	--发送给被交易方 有请求
	objOther.CltTradeMsg{Type = TradeMsgConfig.ShowRequest,RoleID = objPlayerRoleID,RoleName = objPlayer:GetInfo().szRoleName}
	objOtherTradeSys.setTradePlayerList[objPlayerRoleID] = TradeConfig.PastTime
end
function CTradeSystem:DecodeFunResponse(objPlayer,dwDesRoleID)
	local objPlayerRoleID = objPlayer:GetRoleID()
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objOther = objMapSystem:GetRoleByID(dwDesRoleID)
	local objOtherTradeSys
	local szMeName = objPlayer:GetInfo().szRoleName
	local szOtherName
	if objOther then
		objOtherTradeSys = objOther:GetSystem("CTradeSystem");
		szOtherName = objOther:GetInfo().szRoleName
	end
	if self:CanTrade(dwDesRoleID) then
		--判断玩家是否在同一线
		if not objPlayer:GetOtherPlayer(dwDesRoleID,3) then
			objPlayer.CltTradeMsg{Type = TradeMsgConfig.NotSameLine,RoleID = dwDesRoleID,RoleName = szOtherName}
			return 
		end
		--判断玩家是否在同一地图
		if not objPlayer:GetOtherPlayer(dwDesRoleID,2) then
			objPlayer.CltTradeMsg{Type = TradeMsgConfig.OutOfRange,RoleID = dwDesRoleID,RoleName = szOtherName}
			return 
		end
		--判断玩家是否在交易范围内
		local dwDis = objPlayer:GetDisByPlayer(dwDesRoleID);
		if dwDis == -1 or dwDis > TradeConfig.TradeLimitDistance then
			objPlayer.CltTradeMsg{Type = TradeMsgConfig.OutOfRange,RoleID = dwDesRoleID,RoleName = szOtherName}
			return 
		end
		--判断玩家是否在进行与其他玩家交易动作
		if objOtherTradeSys:GetState() == 1 then
			objPlayer.CltTradeMsg{Type = TradeMsgConfig.Tradeing,RoleID = dwDesRoleID,RoleName = szOtherName}
			return 
		end
		--判断玩家是否已经死亡
		if not objOther:GetSystem("CStateSystem"):CheckPlayerAction(enPlayerAction.ePA_Trade) then
			objPlayer.CltTradeMsg{Type = TradeMsgConfig.Dead,RoleID = dwDesRoleID,RoleName = szOtherName}
			return 
		end
		--双方打开交易主界面
		objPlayer.CltTradeMsg{Type = TradeMsgConfig.ShowMain,RoleID = dwDesRoleID,RoleName = szOtherName}
		objOther.CltTradeMsg{Type = TradeMsgConfig.ShowMain,RoleID = objPlayerRoleID,RoleName = objPlayer:GetInfo().szRoleName}
		------------------------------
		local friendSys = objPlayer:GetSystem('CFriendSystem')
		friendSys:UpdateContact(dwDesRoleID)
		
		local otherfriendSys = objOther:GetSystem('CFriendSystem')
		otherfriendSys:UpdateContact(objPlayerRoleID)
		------------------------------
		objOtherTradeSys.dwTradingPlayer = objPlayerRoleID
		self.dwTradingPlayer = dwDesRoleID
		self.nState = 1
		objOtherTradeSys.nState = 1
	else
		objPlayer.CltTradeMsg{Type = TradeMsgConfig.OverTime,RoleID = objPlayerRoleID,RoleName = szOtherName}
	end
end
function CTradeSystem:DecodeFunRefuse(objPlayer,dwDesRoleID)
	local objPlayerRoleID = objPlayer:GetRoleID()
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objOther = objMapSystem:GetRoleByID(dwDesRoleID)
	local szMeName = objPlayer:GetInfo().szRoleName

	if not objOther then
		return false
	end
	objOther.CltTradeMsg{Type = TradeMsgConfig.Refuse,RoleID = objPlayerRoleID,RoleName = szMeName}
end
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
function CTradeSystem:DecodeFunAddMoney(objPlayer,dwItemID)
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objOther = objMapSystem:GetRoleByID(self.dwTradingPlayer)
	if not objOther then
		return false
	end
	
	if dwItemID < 0 then
		return false;
	end

	self.setMyMoneyList.dwMoney = dwItemID
	local Money = {dwMoney = dwItemID};
	objPlayer.CltTradingMsg{Type = TradeMsgConfig.AddMoney,Item = Money,Pos = 1};
	objOther.CltTradingMsg{Type = TradeMsgConfig.AddMoney,Item = Money,Pos = 2};
end
function CTradeSystem:DecodeFunAddGold(objPlayer,dwItemID)
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objOther = objMapSystem:GetRoleByID(self.dwTradingPlayer)
	if not objOther then
		return false
	end
	
	if dwItemID < 0 then
		return false;
	end
	
	self.setMyMoneyList.dwGold = dwItemID
	local Gold = {dwGold = dwItemID};
	objPlayer.CltTradingMsg{Type = TradeMsgConfig.AddGold,Item = Gold,Pos = 1};
	objOther.CltTradingMsg{Type = TradeMsgConfig.AddGold,Item = Gold,Pos = 2};
end
function CTradeSystem:DecodeFunBreak(objPlayer,dwItemID)
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objOther = objMapSystem:GetRoleByID(self.dwTradingPlayer)
	if not objOther then
		return false
	end
	local objOtherTradeSys = objOther:GetSystem("CTradeSystem");

	local Null = {};
	objPlayer.CltTradingMsg{Type = TradeMsgConfig.Break,Item = Null,Pos = 0};
	objOther.CltTradingMsg{Type = TradeMsgConfig.Breaked,Item = Null,Pos = 0};
	objOtherTradeSys:ClearData()
	self:ClearData()
end
function CTradeSystem:DecodeFunLock(objPlayer,dwItemID)	
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objOther = objMapSystem:GetRoleByID(self.dwTradingPlayer)
	if not objOther then
		return false
	end

	self.bLock = 1
	local Null = {};
	objPlayer.CltTradingMsg{Type = TradeMsgConfig.Lock,Item = Null,Pos = 1};
	objOther.CltTradingMsg{Type = TradeMsgConfig.Lock,Item = Null,Pos = 2};
end
function CTradeSystem:DecodeFunComplete(objPlayer,dwItemID)
	local objItemSys = objPlayer:GetSystem("CItemSystem");
	if not objItemSys then
		return; 
	end;
	
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objOther = objMapSystem:GetRoleByID(self.dwTradingPlayer)
	if not objOther then
		return false
	end
	local objOtherRoleID = objOther:GetRoleID()
	local objOtherTradeSys = objOther:GetSystem("CTradeSystem");
	local objOtherItemSys = objOther:GetSystem("CItemSystem");
	_info("CTradeSystem:DecodeFunComplete==========================1",self:GetPlayer():GetAccountID(), objOther:GetAccountID())
	if objOtherTradeSys.bIsMakeSure == 1 then
		local bIsMeFree,bIsOtherFree,bIsMeMoney,bIsOtherMoney = true,true
		bIsMeFree = objItemSys:IsObjItemListCanAddToPacket(objOtherTradeSys.setMyItemList)
		bIsOtherFree = objOtherItemSys:IsObjItemListCanAddToPacket(self.setMyItemList)
		local mymoney = objOtherTradeSys.setMyMoneyList.dwMoney - self.setMyMoneyList.dwMoney;
		local othermoney = -mymoney;
		local moneyDiff = self.setMyMoneyList.dwMoney - objOtherTradeSys.setMyMoneyList.dwMoney;
		local goldDiff	= self.setMyMoneyList.dwGold - objOtherTradeSys.setMyMoneyList.dwGold;
		-----银两上限判断
		bIsMeMoney = objItemSys:IsCanAddPacketMoney(-moneyDiff)
		bIsOtherMoney = objOtherItemSys:IsCanAddPacketMoney(moneyDiff)
		if bIsMeMoney == false then
			local Null = {};
			objPlayer.CltTradingMsg{Type = TradeMsgConfig.MoneyFull,Item = Null,Pos = 0};
			objOther.CltTradingMsg{Type = TradeMsgConfig.OtherMoneyFull,Item = Null,Pos = 0};
			objOtherTradeSys:ClearData()
			self:ClearData()
			return		
		end
		if bIsOtherMoney == false then
			local Null = {};
			objPlayer.CltTradingMsg{Type = TradeMsgConfig.OtherMoneyFull,Item = Null,Pos = 0};
			objOther.CltTradingMsg{Type = TradeMsgConfig.MoneyFull,Item = Null,Pos = 0};
			objOtherTradeSys:ClearData()
			self:ClearData()
			return		
		end
		--银两够不够判断
		bIsMeMoney = objItemSys:IsPacketMoneyEnough(moneyDiff)
		bIsOtherMoney = objOtherItemSys:IsPacketMoneyEnough(-moneyDiff)
		if bIsMeMoney == false then
			local Null = {};
			objPlayer.CltTradingMsg{Type = TradeMsgConfig.NotEnoughMoney,Item = Null,Pos = 0};
			objOther.CltTradingMsg{Type = TradeMsgConfig.OtherNotEnoughMoney,Item = Null,Pos = 0};
			objOtherTradeSys:ClearData()
			self:ClearData()
			return		
		end
		if bIsOtherMoney == false then
			local Null = {};
			objPlayer.CltTradingMsg{Type = TradeMsgConfig.OtherNotEnoughMoney,Item = Null,Pos = 0};
			objOther.CltTradingMsg{Type = TradeMsgConfig.NotEnoughMoney,Item = Null,Pos = 0};
			objOtherTradeSys:ClearData()
			self:ClearData()
			return		
		end
		--元宝够不够的判断
		bIsMeMoney = objItemSys:IsGoldEnough(goldDiff)
		bIsOtherMoney = objOtherItemSys:IsGoldEnough(-goldDiff)
		if bIsMeMoney == false then
			local Null = {};
			objPlayer.CltTradingMsg{Type = TradeMsgConfig.NotEnoughGold,Item = Null,Pos = 0};
			objOther.CltTradingMsg{Type = TradeMsgConfig.OtherNotEnoughGold,Item = Null,Pos = 0};
			objOtherTradeSys:ClearData()
			self:ClearData()
			return		
		end
		if bIsOtherMoney == false then
			local Null = {};
			objPlayer.CltTradingMsg{Type = TradeMsgConfig.OtherNotEnoughGold,Item = Null,Pos = 0};
			objOther.CltTradingMsg{Type = TradeMsgConfig.NotEnoughGold,Item = Null,Pos = 0};
			objOtherTradeSys:ClearData()
			self:ClearData()
			return		
		end
		--背包是否满判断
		if bIsOtherFree == false then
			local Null = {};
			objPlayer.CltTradingMsg{Type = TradeMsgConfig.OtherNoPack,Item = Null,Pos = 0};
			objOther.CltTradingMsg{Type = TradeMsgConfig.NoPack,Item = Null,Pos = 0};
			objOtherTradeSys:ClearData()
			self:ClearData()
			return			
		end
		if bIsMeFree == false then
			local Null = {};
			objPlayer.CltTradingMsg{Type = TradeMsgConfig.NoPack,Item = Null,Pos = 0};
			objOther.CltTradingMsg{Type = TradeMsgConfig.OtherNoPack,Item = Null,Pos = 0};
			objOtherTradeSys:ClearData()
			self:ClearData()
			return	
		end
		CLogSystemManager:deal( objPlayer, 1, self.setMyMoneyList.dwMoney, self.setMyMoneyList.dwGold, self.setMyItemList, '', 
			objOther, objOtherTradeSys.setMyMoneyList.dwMoney, objOtherTradeSys.setMyMoneyList.dwGold, objOtherTradeSys.setMyItemList, '', 
			objOtherRoleID )
		for k,v in pairs (self.setMyItemList) do
			objItemSys:UnlockItem(v:GetInstID());
		end
		for k,v in pairs(objOtherTradeSys.setMyItemList) do
			objOtherItemSys:UnlockItem(v:GetInstID());
		end
		----加异常保护
		local otherFailDelList = {}
		local otherindex = 0
		local selfFailDelList = {}
		local selfindex = 0
		--删除物品
		for k,v in pairs (objOtherTradeSys.setMyItemList) do
			otherindex = otherindex + 1
			local has = objOtherItemSys:DelObjItem(v:GetInstID(), _G.ItemSysOperType.Trade)
			if(not has) then
				otherFailDelList[otherindex] = k
			end
		end
		--删除物品
		for k,v in pairs (self.setMyItemList) do
			selfindex = selfindex + 1
			local has = objItemSys:DelObjItem(v:GetInstID(), _G.ItemSysOperType.Trade)
			if(not has) then
				selfFailDelList[selfindex] = k
			end
		end
		
		for i = 1,#otherFailDelList do
			local index = otherFailDelList[i]
			objOtherTradeSys.setMyItemList[index] = nil
		end
		
		for j = 1,#selfFailDelList do
			local index = selfFailDelList[j]
			self.setMyItemList[index] = nil
		end
		-----加异常保护
		--增加物品
		objItemSys:AddObjItemListToPacket(objOtherTradeSys.setMyItemList, _G.ItemSysOperType.Trade)
		--增加物品
		objOtherItemSys:AddObjItemListToPacket(self.setMyItemList, _G.ItemSysOperType.Trade)
		
		--给双方减钱--给双方加钱
		local myflag,otherflag;
		if mymoney > 0 then
			myflag = "trade";
		elseif othermoney > 0 then
			otherflag = "trade";
		end
	
		if moneyDiff > 0 then--自己给别人的多
			objItemSys:CostPacketMoney(moneyDiff, _G.ItemSysOperType.Trade);
			objOtherItemSys:AddPacketMoney(moneyDiff, _G.ItemSysOperType.Trade);
		elseif moneyDiff < 0 then--别人给自己的多
			moneyDiff = - moneyDiff;
			objOtherItemSys:CostPacketMoney(moneyDiff, _G.ItemSysOperType.Trade);
			objItemSys:AddPacketMoney(moneyDiff, _G.ItemSysOperType.Trade);
		end;
		if goldDiff > 0 then--自己给别人的多
			objItemSys:CostGold(goldDiff, _G.ItemSysOperType.Trade);
			objOtherItemSys:AddGold(goldDiff, _G.ItemSysOperType.Trade);
			_info("CTradeSystem:DecodeFunComplete==========================2",goldDiff, self:GetPlayer():GetAccountID())			
		elseif goldDiff < 0 then--别人给自己的多
			goldDiff = - goldDiff;
			objOtherItemSys:CostGold(goldDiff, _G.ItemSysOperType.Trade);
			objItemSys:AddGold(goldDiff, _G.ItemSysOperType.Trade);
			_info("CTradeSystem:DecodeFunComplete==========================3",goldDiff, self:GetPlayer():GetAccountID())
		end;
		
		
		
		local Null = {};
		objPlayer.CltTradingMsg{Type = TradeMsgConfig.Complete,Item = Null,Pos = 0};
		objOther.CltTradingMsg{Type = TradeMsgConfig.Complete,Item = Null,Pos = 0};
				
		--清空双方数据结构
		objOtherTradeSys:ClearData()
		self:ClearData()
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventTrade)
	else
		self.bIsMakeSure = 1
	end
end
function CTradeSystem:DecodeFunDownItem(objPlayer,dwItemID)
	local objItemSys = objPlayer:GetSystem("CItemSystem");
	if not objItemSys then
		return; 
	end;
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objOther = objMapSystem:GetRoleByID(self.dwTradingPlayer)
	if not objOther then
		return false
	end
	local ItemMsg = SItemMessage:new()
	local ItemOnPlayer = objItemSys:GetItem(dwItemID)	
	if ItemOnPlayer then
		ItemOnPlayer:FillItemMessage(ItemMsg)
	end
	for k,v in pairs (self.setMyItemList) do
		if v:GetInstID() == dwItemID then
			self.setMyItemList[k] = nil;
			--物品解锁
			objItemSys:UnlockItem(dwItemID);
			--通知双方物品下架
			objPlayer.CltTradingMsg{Type = TradeMsgConfig.DownItemSure,Item = ItemMsg ,Pos = k};
			objOther.CltTradingMsg{Type = TradeMsgConfig.DownItem,Item = ItemMsg ,Pos = k};
			return
		end
	end
	objPlayer.CltTradingMsg{Type = TradeMsgConfig.Error}
end
function CTradeSystem:DecodeFunAddItem(objPlayer,dwItemID)
	local objItemSys = objPlayer:GetSystem("CItemSystem");
	if not objItemSys then
		return; 
	end
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objOther = objMapSystem:GetRoleByID(self.dwTradingPlayer)
	if not objOther then
		return false
	end
	local ItemMsg = SItemMessage:new()
	local ItemOnPlayer = objItemSys:GetItem(dwItemID)
	----检查是否是绑定物品
	if(ItemOnPlayer:IsBind()) then
		objPlayer.CltTradingMsg{Type = TradeMsgConfig.BindItem}
		return ;
	end
	----检查是否是锁定物品
	if objItemSys:IsItemLocked(dwItemID) then
		objPlayer.CltTradingMsg{Type = TradeMsgConfig.LockItem}
		return;
	end
	if ItemOnPlayer then
		ItemOnPlayer:FillItemMessage(ItemMsg)
	end
	for i = 1,TradeConfig.ItemNum do 
		if self.setMyItemList[i] then
			if self.setMyItemList[i]:GetInstID() == dwItemID then
				return;
			end
		end
	end
	for i = 1,TradeConfig.ItemNum do 
		if not self.setMyItemList[i] then
			-- 有可以放置物品的槽位在锁物品
			objItemSys:LockItem(dwItemID);
			self.setMyItemList[i] = ItemOnPlayer
			--通知双方物品上架
			objPlayer.CltTradingMsg{Type = TradeMsgConfig.AddItemSure,Item = ItemMsg ,Pos = i};
			objOther.CltTradingMsg{Type = TradeMsgConfig.AddItem,Item = ItemMsg ,Pos = i};
			return
		end
	end
end
function CTradeSystem:Update(dwInterval)
	if next(self.setTradePlayerList) == nil and self.dwTradingPlayer == 0 then
		return
	end
	for k,v in pairs (self.setTradePlayerList) do
		self.setTradePlayerList[k] = self.setTradePlayerList[k] - dwInterval
		if self.setTradePlayerList[k] <= 0 then
			self.setTradePlayerPastList[k] = k
		end
	end
	for k,v in pairs (self.setTradePlayerPastList) do
		self.setTradePlayerList[k] = nil
		self.setTradePlayerPastList[k] = nil
	end
	
	if self.dwTradingPlayer ~= 0 then
		local objMe = self:GetPlayer();
		local dwDis = objMe:GetDisByPlayer(self.dwTradingPlayer);
		if dwDis == nil then
			self:BreakTrade(TradeMsgConfig.OutOfRanged,TradeMsgConfig.OutOfRanged)
			return true
		end
		if dwDis == -1 or dwDis > TradeConfig.TradeLimitDistance or dwDis == nil then
			self:BreakTrade(TradeMsgConfig.OutOfRanged,TradeMsgConfig.OutOfRanged)
			return true
		end
	end
	
	return true
end

-- 换线检测清空交易数据
function CTradeSystem:OnChangeLineCheck()
	if self.dwTradingPlayer ~= 0 then
		local objPlayer = self:GetPlayer()
		if not objPlayer then
			return false;
		end;
		objPlayer.CltTradingMsg{Type = TradeMsgConfig.OutOfRanged,Item = Null,Pos = 0};
	end
	self:ClearData();
	return true;
end

--进入跨服战 所有交易中断
function CTradeSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return false;
	end;
	
	self:DecodeFunBreak(objPlayer);
end

function CTradeSystem:Destroy()
	return true
end;
function CTradeSystem:OnDead(dwEnemyType,dwEnemyID)
	if self.dwTradingPlayer ~= 0 then
		self:BreakTrade(TradeMsgConfig.Deaded,TradeMsgConfig.OtherDeaded)
	end
end
function CTradeSystem:BreakTrade(nMeCode,nOtherCode)
	if self.dwTradingPlayer == 0 then
		return
	end
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return false;
	end;
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local objOther = objMapSystem:GetRoleByID(self.dwTradingPlayer)
	local Null = {};
	objPlayer.CltTradingMsg{Type = nMeCode,Item = Null,Pos = 0};
	self:ClearData()
	if objOther then
		local objOtherTradeSys = objOther:GetSystem("CTradeSystem");
		objOther.CltTradingMsg{Type = nOtherCode,Item = Null,Pos = 0};
		objOtherTradeSys:ClearData()
	end
end
function CTradeSystem:CanTrade(dwRoleID)
	for k,v in pairs (self.setTradePlayerList) do
		if k == dwRoleID then
			return true
		end
	end
	return false
end;
---交易中进行的交互
function CTradeSystem:DecodeTradeMsg(nType,dwItemID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return false;
	end;
	if self.DecodeFun[nType] then
		self.DecodeFun[nType](objPlayer,dwItemID)
	end
end
--交易前进行的交互
function CTradeSystem:DecodeMsg(dwType,dwDesRoleID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return false;
	end;
	if self.DecodeFun[dwType] then
		self.DecodeFun[dwType](objPlayer,dwDesRoleID)
	end
end
function CTradeSystem:TradeChangeMap()
	if self.dwTradingPlayer == 0 then
		return
	end
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return false;
	end;
end
function CTradeSystem:ClearData()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return false;
	end;	
	local objItemSys = objPlayer:GetSystem("CItemSystem");
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local Null = {};	
	for k,v in pairs (self.setMyItemList) do
		objItemSys:UnlockItem(v:GetInstID());
	end
	self.setMyItemList = {};
	self.setMyMoneyList = 
	{	
		dwMoney = 0,
		dwGold = 0,
	}
	--交易锁
	self.bLock = 0;
	--交易状态
	self.nState = 0;
	--正在交易的玩家
	self.dwTradingPlayer = 0;
	--确认状态
	self.bIsMakeSure = 0	
end
