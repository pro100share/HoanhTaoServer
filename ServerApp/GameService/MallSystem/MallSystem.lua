--[[
文件：MallSystem.lua
类名：
功能说明：商城系统
备注：
作者：段磊磊
版本：
修改者：
]]
_G.CMallSystem = {}

function CMallSystem:new()
	local obj = CSystem:new("CMallSystem");
	
	obj.setLuckDraw = {};--折扣抽奖的列表
	
	for i,v in pairs(CMallSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CMallSystem:Create(bIsChangeLine)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	self.objDB = objSelf:GetDBQuery();
	if not self.objDB then
		_err("CMallSystem Create Cannot get DBQuery");
		return false;
	end;
	
	local Data = objSelf:GetLineData("CMallSystem");
	
	local tbList = Data[1];
	
	for k,v in pairs(tbList)do
		self.setLuckDraw[k] = v;
	end
	
end;

function CMallSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	local t = self.setLuckDraw;
	objPlayer:SetLineData("CMallSystem",t);
end

-- @brief 玩家进入场景事件处理
--        同步商城物品改变
function CMallSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
        return;
	end

    CMallManager:SyncItems(objPlayer);
end

function CMallSystem:CanBuyItemListBindGold(tItemList)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local dwBindGoldNeed = 0
	local ItemList = {}
	local i = 1
	for k,v in pairs (tItemList) do
		local tempItemEnum = v.dwItemEnum
		dwBindGoldNeed = dwBindGoldNeed + math.ceil(MallBindGoldConfig[tempItemEnum].dwPrice * v.dwDiscount) * v.dwItemNumber
		ItemList[i] = {};
		ItemList[i].dwItemEnum = v.dwItemEnum
		ItemList[i].dwItemNumber = v.dwItemNumber
		ItemList[i].dwBindType = MallBindGoldConfig[tempItemEnum].dwBindType
		i = i+1
	end
	local n_Result = 0;
	if objItemSys:IsEnumItemListCanAddToPacket(ItemList) then
		if not objItemSys:IsBindGoldEnough(dwBindGoldNeed) then
			n_Result = 2
		end;
	else
		n_Result = 1
	end
	return n_Result, dwBindGoldNeed
end

function CMallSystem:CanBuyItemListGold(tItemList)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local dwGoldNeed = 0
	local ItemList = {}
	local i = 1
	for k,v in pairs (tItemList) do
		local tempItemEnum = v.dwItemEnum
		dwGoldNeed = dwGoldNeed + math.ceil(MallOtherConfig[tempItemEnum].dwPrice  * v.dwDiscount) * v.dwItemNumber
		ItemList[i] = {};
		ItemList[i].dwItemEnum = v.dwItemEnum
		ItemList[i].dwItemNumber = v.dwItemNumber
		ItemList[i].dwBindType = MallOtherConfig[tempItemEnum].dwBindType
		i = i+1
	end
	local n_Result = 0;
	if objItemSys:IsEnumItemListCanAddToPacket(ItemList) then
		if not objItemSys:IsGoldEnough(dwGoldNeed) then
			n_Result = 2
		end;
	else
		n_Result = 1
	end
	return n_Result, dwGoldNeed
end

function CMallSystem:BuyItemByIDBindGold(dwItemNum,dwItemEnum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	if not MallBindGoldConfig[dwItemEnum] then return false end
	return self:BuyItem(dwItemNum,dwItemEnum,2)
end

function CMallSystem:BuyItemByIDGold(dwItemNum,dwItemEnum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	if not MallOtherConfig[dwItemEnum] then return end
	return self:BuyItem(dwItemNum,dwItemEnum,1)
end

function CMallSystem:CanBuyItemList(tItemList)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local dwBindGoldNeed = 0
	local dwGoldNeed = 0
	local ItemList = {}
	local i = 1
	for k,v in pairs (tItemList) do
		local ItemInfo = self:GetMallItemInfo(v.dwItemEnum)
		local dwBindGoldItemNum = 0
		for i = 1,v.dwItemNumber do
			if ItemInfo.BindGoldInfo.dwPrice then
				if objItemSys:IsBindGoldEnough(dwBindGoldNeed + ItemInfo.BindGoldInfo.dwPrice) then
					dwBindGoldNeed = dwBindGoldNeed + ItemInfo.BindGoldInfo.dwPrice
					dwBindGoldItemNum = dwBindGoldItemNum + 1
				else
					dwGoldNeed = dwGoldNeed + ItemInfo.GoldInfo.dwPrice
				end
			else
				dwGoldNeed = dwGoldNeed + ItemInfo.GoldInfo.dwPrice
			end
		end
		local dwGoldItemNum = v.dwItemNumber - dwBindGoldItemNum
		if dwBindGoldItemNum ~= 0 then 
			local mallItemInfo = MallBindGoldConfig[ItemInfo.BindGoldInfo.dwItemEnum]
			ItemList[i] = {};
			ItemList[i].dwItemEnum = mallItemInfo.dwItemEnum
			ItemList[i].dwItemNumber = dwBindGoldItemNum
			ItemList[i].dwBindType = mallItemInfo.dwBindType
			i = i+1
		end
		if dwGoldItemNum ~= 0 then
			local mallItemInfo = MallOtherConfig[ItemInfo.GoldInfo.dwItemEnum]
			ItemList[i] = {};
			ItemList[i].dwItemEnum = mallItemInfo.dwItemEnum
			ItemList[i].dwItemNumber = dwGoldItemNum
			ItemList[i].dwBindType = mallItemInfo.dwBindType
			i = i+1
		end
	end
	local n_Result = 0;
	if objItemSys:IsEnumItemListCanAddToPacket(ItemList) then
		if not objItemSys:IsGoldEnough(dwGoldNeed) then
			n_Result = 2
		end;
	else
		n_Result = 1
	end
	return n_Result, dwBindGoldNeed, dwGoldNeed;
end

function CMallSystem:BuyItemByID(dwItemNum,dwItemEnum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local ItemInfo = self:GetMallItemInfo(dwItemEnum)
	local BindGoldItemNum = 0
	local bGoldCanBuy,bBindGoldCanBuy = true,true
	if ItemInfo.BindGoldInfo.dwPrice ~= 0 and ItemInfo.BindGoldInfo.dwPrice ~= nil then
		BindGoldItemNum = math.floor(objItemSys:GetBindGold()/ItemInfo.BindGoldInfo.dwPrice)
	end
	local GoldItemNum = dwItemNum - BindGoldItemNum
	bGoldCanBuy = self:CanBuyItem(GoldItemNum,ItemInfo.GoldInfo.dwItemEnum,1) 
	if  ItemInfo.BindGoldInfo.dwPrice ~= 0 and ItemInfo.BindGoldInfo.dwPrice ~= nil then
		bBindGoldCanBuy = self:CanBuyItem(BindGoldItemNum,ItemInfo.BindGoldInfo.dwItemEnum,2)
	end
	if bGoldCanBuy and bBindGoldCanBuy then
		if  ItemInfo.BindGoldInfo.dwPrice ~= 0 and ItemInfo.BindGoldInfo.dwPrice ~= nil then
			self:BuyItem(dwItemNum,ItemInfo.BindGoldInfo.dwItemEnum,2)
		end
		self:BuyItem(dwItemNum,ItemInfo.GoldInfo.dwItemEnum,1)
		return true
	else
		objPlayer.CltMallFeedBackMsg{Type = MallMsgConfig.NoGold}
		return false
	end
	
end

function CMallSystem:SendNoGold()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	objPlayer.CltMallFeedBackMsg{Type = MallMsgConfig.NoGold}
end

function CMallSystem:GetMallItemInfo(dwItemEnum)
	local t = 
	{
		GoldInfo = {},
		BindGoldInfo = {},
	}	
	if 	MallOtherConfig[dwItemEnum] then
		t.GoldInfo.dwItemEnum = dwItemEnum
		t.GoldInfo.dwPrice = MallOtherConfig[dwItemEnum].dwPrice
	end
	if 	MallBindGoldConfig[dwItemEnum] then
		t.BindGoldInfo.dwItemEnum = dwItemEnum
		t.BindGoldInfo.dwPrice = MallBindGoldConfig[dwItemEnum].dwPrice
	end
	return t
end

-- @brief 购买物品
-- @param dwNum number 数量
-- @param dwItemEnum number 物品id
-- @param nType number 物品类型
-- @pararm nUnitPrice number 单价
-- @param boolean 是否购买成功
function CMallSystem:BuyItem(dwNum, dwItemEnum, nType, nUnitPrice)
    -- 获取目标角色
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end

    -- 物品类型判断
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local objMallItem
	if nType == 1 then
		objMallItem = MallOtherConfig[dwItemEnum]
	else
		objMallItem = MallBindGoldConfig[dwItemEnum]
	end
	
    -- 物品变动检查
    local bChanged = false
	if objMallItem.bIsSale == 0 then
		objPlayer.CltMallFeedBackMsg{Type = MallMsgConfig.NoUp}
        bChanged = true;
	end
    if nUnitPrice then
        if objMallItem.dwPrice ~= nUnitPrice then
            objPlayer.CltMallFeedBackMsg{Type = MallMsgConfig.PriceChange}
            bChanged = true;
        end
    end
    if bChanged then
        CMallManager:SyncItems(objPlayer);
        return false;
    end
    local nBuff = 1;
    local CBuffSystem = objPlayer:GetSystem('CBuffSystem')
    for k,v in pairs(_G.MallConfig.OldManBuff) do
        if CBuffSystem:IsHaveBuff(k) then
            nBuff = v.MallDiscount
            break;
        end
    end
    -- 计算价格
	local dwItemsPrice = dwNum * math.ceil(objMallItem.dwPrice * objMallItem.dwDiscount * nBuff)
	
    -- 处理购买
	local addItemList = {};
	local tempTable = {
		dwItemEnum	= objMallItem.dwItemEnum;
		dwItemNumber= dwNum;
		dwBindType	= objMallItem.dwBindType;
	};
	table.insert(addItemList, tempTable);
	if not objItemSys:IsEnumItemListCanAddToPacket(addItemList) then
		objPlayer.CltMallFeedBackMsg{Type = MallMsgConfig.NoPack};
		return false
	end
	if objMallItem.dwPriceType == MallSellTypeConfig.eGold then
		if objItemSys:IsGoldEnough(dwItemsPrice) then
			objItemSys:CostGold(dwItemsPrice, _G.ItemSysOperType.BuyMall)
			CLogSystemManager:shop_buy(objPlayer,
                objMallItem.dwItemEnum,
                dwNum,
                dwItemsPrice);
			objPlayer.CltMallFeedBackMsg{Type =
                MallMsgConfig.BuySuccessByGold};
			objPlayer:
                GetSystem('CPlayerEventCenterSystem'):
                DoEvent(enumPlayerEventType.EventGoldBuy,dwNum,objMallItem.dwItemEnum);
		else
			objPlayer.CltMallFeedBackMsg{Type = MallMsgConfig.NoGold}
			return false
		end		
	elseif objMallItem.dwPriceType == MallSellTypeConfig.eBindGold then
		if objItemSys:IsBindGoldEnough(dwItemsPrice) then
			objItemSys:CostBindGold(dwItemsPrice, _G.ItemSysOperType.BuyMall);
			CLogSystemManager:giftmoney_buy(objPlayer,
                objMallItem.dwItemEnum,
                dwNum,
                dwItemsPrice);
			objPlayer:
                GetSystem('CPlayerEventCenterSystem'):
                DoEvent(enumPlayerEventType.EventBindGoldBuy);
			objPlayer.CltMallFeedBackMsg{Type =
                MallMsgConfig.BuySuccessByBindGold};
		else
			objPlayer.CltMallFeedBackMsg{Type = MallMsgConfig.NoBindGold};
			return false;
		end
	elseif objMallItem.dwPriceType == MallSellTypeConfig.eMallValue then
		-- if self.dwMallValue >= dwItemsPrice then
			-- self.dwMallValue = self.dwMallValue - dwItemsPrice
			-- self:UpdateInfoToClient(objPlayer)
			-- objPlayer.CltMallFeedBackMsg{Type = MallMsgConfig.BuySuccess}
		-- else
			-- objPlayer.CltMallFeedBackMsg{Type = MallMsgConfig.NoMallValue}
			-- return false
		-- end
	end
	local ItemTable = objItemSys:
        AddEnumItemListToPacket(addItemList,
            _G.ItemSysOperType.BuyMall);
	return true;
end

function CMallSystem:CanBuyItem(dwNum,dwItemEnum,nType)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local objMallItem
	if nType == 1 then
		objMallItem = MallOtherConfig[dwItemEnum]
	else
		objMallItem = MallBindGoldConfig[dwItemEnum]
	end
	local dwItemsPrice = dwNum * math.ceil(objMallItem.dwPrice * objMallItem.dwDiscount)
	local tempItem = {dwItemEnum = objMallItem.dwItemEnum,dwItemNumber = dwNum,dwBindType = objMallItem.dwBindType}
	local tempT = {}
	table.insert(tempT,tempItem)
	if not objItemSys:IsEnumItemListCanAddToPacket(tempT) then
	--	_info('NoPack')
		return false
	else	
		return true
	end
	if objMallItem.dwPriceType == MallSellTypeConfig.eGold then
		if not objItemSys:IsGoldEnough(dwItemsPrice) then
		--	_info('NoGold')
			return false
		end		
	elseif objMallItem.dwPriceType == MallSellTypeConfig.eBindGold then
		if not objItemSys:IsBindGoldEnough(dwItemsPrice) then
		--	_info('NoBindGold')
			return false
		end
	elseif objMallItem.dwPriceType == MallSellTypeConfig.eMallValue then
		-- if self.dwMallValue < dwItemsPrice then
			-- return false
		-- end
	end
end


-------------------------------------------------------------------------------
function CMallSystem:TryBuyLimitItem(dwMallID)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end;
	
	local tbMallInfo = CMallManager:GetMallInfo(dwMallID);
	if not tbMallInfo then
		objSelf.MallBuyResultMsg
		{
			MallID = dwMallID;
			Code = 1;
			Number = tbMallInfo.dwNumber;
		}
		return ;
	end
	
	if tbMallInfo.dwType == 1 and tbMallInfo.dwNumber <= 0 then
		objSelf.MallBuyResultMsg
		{
			MallID = dwMallID;
			Code = 2;
			Number = tbMallInfo.dwNumber;
		}
		return ;
	end
	
	local objItemSys = objSelf:GetSystem("CItemSystem");
	if not objItemSys then
		return;
	end
	
	local tbAddList = {};
	tbAddList.dwItemEnum = tbMallInfo.dwEnumID;
	tbAddList.dwItemNumber = 1;
	tbAddList.dwBindType = tbMallInfo.dwBindType;
	if not objItemSys:IsEnumItemListCanAddToPacket(tbAddList) then
		objSelf.MallBuyResultMsg
		{
			MallID = dwMallID;
			Code = 4;
			Number = tbMallInfo.dwNumber;
		}
		return;
	end
	
	--判断钱
    local bResult = false;
	if tbMallInfo.dwPriceType == MallSellTypeConfig.eGold then
        bResult = objItemSys:IsGoldEnough(tbMallInfo.dwPrice);
	elseif tbMallInfo.dwPriceType == MallSellTypeConfig.eBindGold then
        bResult = objItemSys:IsBindGoldEnough(tbMallInfo.dwPrice);
	end
    if not bResult then
        objSelf.MallBuyResultMsg
        {
            MallID = dwMallID;
            Code = 3;
            Number = tbMallInfo.dwNumber;
        }
        return;
    end
	
    CKernelApp.OnTryBuyItemMsg
    {
        RoleID = objSelf:GetRoleID(),
        MallID = dwMallID,
    };
end;

function CMallSystem:BuyItemKSResult(dwMallID,dwCode,dwNumber)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end;
	
	--先更新数量
	local tbMallInfo = CMallManager:GetMallInfo(dwMallID);
	if not tbMallInfo then
		objSelf.MallBuyResultMsg
		{
			MallID = dwMallID;
			Code = 1;
			Number = tbMallInfo.dwNumber;
		}
		return ;
	end
	tbMallInfo.dwNumber = dwNumber;
	
    if dwCode ~= 0 then
        --失败
		objSelf.MallBuyResultMsg
		{
			MallID = dwMallID;
			Code = 2;
			Number = tbMallInfo.dwNumber;
		}
        return;
    end

    --成功
    local objItemSys = objSelf:GetSystem("CItemSystem");
    if objItemSys then
        --判断钱
        local bResult = false;
        if tbMallInfo.dwPriceType == MallSellTypeConfig.eGold then
            bResult = objItemSys:IsGoldEnough(tbMallInfo.dwPrice);
        elseif tbMallInfo.dwPriceType == MallSellTypeConfig.eBindGold then
            bResult = objItemSys:IsBindGoldEnough(tbMallInfo.dwPrice);
        end
        if not bResult then
            objSelf.MallBuyResultMsg
            {
                MallID = dwMallID;
                Code = 3;
                Number = tbMallInfo.dwNumber;
            }
            return;
        end
        
        --加物品
        local dwAddTime = GetCurTime();
        if tbMallInfo.dwBeginDay and tbMallInfo.dwBeginDay ~= 0 then
            dwAddTime = CTimeFormat:GetThisTimeMsec(
                math.floor(tbMallInfo.dwBeginDay/10000),
                math.floor(math.mod(tbMallInfo.dwBeginDay, 10000)/100),
                math.mod(tbMallInfo.dwBeginDay, 100),
                0, 0, 0);
        end
        local dwLife = nil;
        if tbMallInfo.dwLength > 0 then
            dwLife = tbMallInfo.dwLength * 3600 * 24 * 1000;
        end
        
        local tbAddList = {};
        local item = 
        {
            dwItemEnum	= tbMallInfo.dwEnumID;
            dwItemNumber= 1;
            dwBindType	= tbMallInfo.dwBindType;
            dwLifeTime	= dwLife;
            dwBornTime	= dwAddTime;
        }
        tbAddList[1] = item;

        if objItemSys:AddEnumItemListToPacket(tbAddList,_G.ItemSysOperType.BuyMall) then
            if tbMallInfo.dwPriceType == MallSellTypeConfig.eGold then
                objItemSys:CostGold(tbMallInfo.dwPrice, _G.ItemSysOperType.BuyMall);
				CLogSystemManager:shop_buy(objSelf,
					tbMallInfo.dwEnumID,
					1,
					tbMallInfo.dwPrice);
            elseif tbMallInfo.dwPriceType == MallSellTypeConfig.eBindGold then
                objItemSys:CostBindGold(tbMallInfo.dwPrice, _G.ItemSysOperType.BuyMall);
				CLogSystemManager:giftmoney_buy(objSelf,
					tbMallInfo.dwEnumID,
					1,
					tbMallInfo.dwPrice);				
            end
            
            objSelf.MallBuyResultMsg
            {
                MallID = dwMallID;
                Code = 0;
                Number = tbMallInfo.dwNumber;
            }
        else
            objSelf.MallBuyResultMsg
            {
                MallID = dwMallID;
                Code = 4;
                Number = tbMallInfo.dwNumber;
            }
        end
    end
end;

function CMallSystem:RequestLimitList()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end;
	
	local tbSend = {};
	for k,v in pairs(CMallManager.setMallLimitList)do
		local tbNew = {};
		for szKey,val in pairs(v)do
			local num = MallLimitName2Key[szKey];
			if num then
				tbNew[num] = val;
			end
		end
		
		tbSend[k] = tbNew;
	end
	
	objSelf.MallLimitListMsg
	{
		List = tbSend;
		NextLength = CMallManager:CountNextFlushTimeLength();
	};
end;

-------------------------------------------------------------------------------
--初始化
function CMallSystem:SendCurLuckDrawInfo()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end;
	
	local objRefreshSys = objSelf:GetSystem("CRefreshSystem");
	if not objRefreshSys then
		return;
	end
	
	local dwCurCount = objRefreshSys:GetData(2102);
	
	local tbSend = {};
	for k,tb in pairs(self.setLuckDraw)do
		local tmp = {};
		for n,v in pairs(tb)do
			local num = MallLimitName2Key[n];
			if num then
				tmp[num] = v;
			end
		end
		
		tbSend[k] = tmp;
	end
	
	objSelf.OnLoadLuckDrawListMsg
	{
		List = tbSend;
	}
	objSelf.OnRefreshNumberMsg{Number = dwCurCount};
end;

function CMallSystem:SendLuckDrawChg(tbChg)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end;
	
	local tbSend = {};
	for k,tb in pairs(tbChg)do
		local tmp = {};
		for n,v in pairs(tb)do
			local num = MallLimitName2Key[n];
			if num then
				tmp[num] = v;
			end
		end
		
		tbSend[k] = tmp;
	end
	
	objSelf.OnLoadLuckDrawListMsg
	{
		List = tbSend;
	}
end;

--刷新抽奖的请求
function CMallSystem:RefreshLuckDrawRequest()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end;
	
	local objRefreshSys = objSelf:GetSystem("CRefreshSystem");
	if not objRefreshSys then
		return;
	end
	local dwCurCount = objRefreshSys:GetData(2102);
	
	local dwMax = MallDrawConfig.FunRefreshNumber();
	if dwCurCount >= dwMax then
		objSelf.OnRefreshLuckDrawResultMsg{Code = 1};
		return;
	end
	
	CKernelApp.OnTryChooseLuckDraMsg{RoleID = objSelf:GetRoleID()};
end;

--从KS收到抽奖的显示列表
function CMallSystem:GetLuckDrawList(tbList)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end;
	
	self.setLuckDraw = tbList;
	
	--显示
	self:SendCurLuckDrawInfo();
	
	--存档
	self:SaveLuckDraw(self.setLuckDraw);
	
	--次数
	local objRefreshSys = objSelf:GetSystem("CRefreshSystem");
	if not objRefreshSys then
		return;
	end
	local dwCurCount = objRefreshSys:GetData(2102);
	dwCurCount = dwCurCount + 1;
	objRefreshSys:SetData(2102,dwCurCount);
	
	objSelf.OnRefreshNumberMsg{Number = dwCurCount};
end;

--购买
function CMallSystem:BuyLuckDraw(dwIndex)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end;
	-- print("===BuyLuckDraw 1===")
	local objItemSys = objSelf:GetSystem("CItemSystem");
	if not objItemSys then
		return;
	end
	local tbInfo = self.setLuckDraw[dwIndex];
	-- print("===BuyLuckDraw 2===",dwIndex,tbInfo)
	-- table.print(self.setLuckDraw)
	if not tbInfo then
		objSelf.OnBuyLuckDrawResultMsg{Code = 1};
		return;
	end
	-- print("===BuyLuckDraw 3===")
	--已经买过
	if tbInfo.dwBuyFlag > 0 then
		objSelf.OnBuyLuckDrawResultMsg{Code = 2};
		return;
	end
	-- print("===BuyLuckDraw 4===")
	local tbAddList = {};
	tbAddList.dwItemEnum = tbInfo.dwEnumID;
	tbAddList.dwItemNumber = tbInfo.dwNumber;
	tbAddList.dwBindType = tbInfo.dwBindType;
	if not objItemSys:IsEnumItemListCanAddToPacket(tbAddList) then
		objSelf.OnBuyLuckDrawResultMsg{Code = 3}
		return;
	end
	-- print("===BuyLuckDraw 5===")
	--判断钱
	local fPer = MallDrawConfig.tbDiscount[dwIndex] or 1;
	local dwCostValue = math.ceil(tbInfo.dwPrice * fPer * tbInfo.dwNumber);
	
	local bMoneyCheck = false;
	if tbInfo.dwPriceType == MallSellTypeConfig.eGold then
        bMoneyCheck = objItemSys:IsGoldEnough(dwCostValue);
	elseif tbInfo.dwPriceType == MallSellTypeConfig.eBindGold then
        bMoneyCheck = objItemSys:IsBindGoldEnough(dwCostValue);
	end
	
	if not bMoneyCheck then
		objSelf.OnBuyLuckDrawResultMsg{Code = 4}
		return;
	end
	-- print("===BuyLuckDraw 6===")
	--购买
	if objItemSys:AddEnumItemListToPacket({tbAddList},_G.ItemSysOperType.BuyMall) then
		if tbInfo.dwPriceType == MallSellTypeConfig.eGold then
			objItemSys:CostGold(dwCostValue, _G.ItemSysOperType.BuyMall);
			CLogSystemManager:shop_buy(objSelf,
				tbInfo.dwEnumID,
				1,
				dwCostValue);
		elseif tbInfo.dwPriceType == MallSellTypeConfig.eBindGold then
			objItemSys:CostBindGold(dwCostValue, _G.ItemSysOperType.BuyMall);
			CLogSystemManager:giftmoney_buy(objSelf,
				tbInfo.dwEnumID,
				1,
				dwCostValue);				
		end
		-- print("===BuyLuckDraw 7===")
		tbInfo.dwBuyFlag = 1;
		
		local tbChg = {[dwIndex] = {dwBuyFlag = 1}};
		self:SendLuckDrawChg(tbChg);
		self:SaveLuckDraw(tbChg);
	end
end;

--刷新
function CMallSystem:ResetLuckDrawList()
	local tbChg = {};
	for k,v in pairs(self.setLuckDraw)do
		v.dwBuyFlag = 2;
		
		tbChg[k] = {dwBuyFlag = 2};
	end
	
	self:SendLuckDrawChg(tbChg);
	-- self:SaveLuckDraw(tbChg)
end;

--保存DB
function CMallSystem:SaveLuckDraw(tbChg)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end;
	
	local SqlCmd = self.objDB:CreateUpdateCmd("T_Role_LuckDraw");
	SqlCmd.Wheres.dwRoleID = objSelf:GetRoleID();
	
	for dwIndex,tbChgInfo in pairs(tbChg)do
		SqlCmd.Wheres.dwIndex = dwIndex;
		
		for k,v in pairs(tbChgInfo)do
			SqlCmd.Fields[k] = v;
		end
		
		SqlCmd:execute();
	end
end;

function CMallSystem:OnEventCenter(szEventName,dwDataID,dwValue)
	if ("EventRefreshData" == szEventName) and (dwDataID == 2102) then
		local objSelf = self:GetPlayer();
		if not objSelf then
			return ;
		end;
		
		objSelf.OnRefreshNumberMsg{Number = dwValue};
	end
end
