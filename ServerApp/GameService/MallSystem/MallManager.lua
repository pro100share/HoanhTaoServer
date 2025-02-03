_G.CMallManager = CSingle:new();
CSingleManager:AddSingle(CMallManager);

local _DEBUG = false;
CMallManager.tUpdateList = {};
CMallManager.tGoodsFile = nil;

--限购列表
CMallManager.setMallLimitList = {};

CMallManager.setLuckDrawList = {};

local ReadGoods;

function CMallManager:Create()
    if _DEBUG then
        -- print("\n");
        -- print("CMallManager:Create");
    end
    CMallManager.tGoodsFile = ReadGoods();
    if _DEBUG then
        -- print("CMallManager:Create");
        -- print("\n");
    end
    return true;
end
 
ReadGoods = function ()
    local csvfile = CSV.Read(MallConfig.GoodsFile);
    local goods = csvfile:GetValue();
    for k, v in pairs(goods) do
		for k1, v1 in pairs(v) do
			v[k1] = tonumber(v1);
		end
		
        if v.type <= MallItemTypeConfig.Active and
            v.type >= MallItemTypeConfig.Normal then
            v.bChangePrice = 0;
            MallOtherConfig[v.dwItemEnum] = v;
            if _DEBUG then
                -- print("Normal .. " .. v.dwItemEnum);
            end
        else
            MallBindGoldConfig[v.dwItemEnum] = v;
			if _DEBUG then
				-- print("BindGold " .. v.dwItemEnum);
			end
        end
    end
	return csvfile;
end

-- @brief 更新上下架物品
-- @param tUp table 上架物品
-- @param tDown table 下架物品
function CMallManager:UpDownItem(tUp, tDown)
    for k, v in ipairs (tUp) do
        local tChangedItem = self:ChangeMallConfig(v.dwType,
                                                    v.dwItemEnum,
                                                    1,
                                                    nil,
                                                    nil);
        self:SaveUpdateItem(v.dwType, tChangedItem);
    end
    for k, v in ipairs (tDown) do
        local tChangeItem = self:ChangeMallConfig(v.dwType,
                                                    v.dwItemEnum,
                                                    0,
                                                    nil,
                                                    nil);
        self:SaveUpdateItem(v.dwType, tChangeItem);
    end
	
	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end
	local sInfo = {
        [1] = tUp;
        [2] = tDown;
    };
	_groupcallout(setNet, "CltMallUpDownMsg", {SInfo = sInfo});
end

-- @brief 改变商城配置项
-- @param dwType number 配置类型
-- @param bIsSale boolean
-- @param dwDiscount number
-- @param dwPrice number
-- @return table 改变的配置项
function CMallManager:ChangeMallConfig(dwType,
                                        dwItemEnum,
                                        bIsSale,
                                        dwDiscount,
                                        dwPrice)
    local tConfig;
    if dwType >= MallItemTypeConfig.Normal and
        dwType <= MallItemTypeConfig.Active then
        tConfig = MallOtherConfig;
    else
        tConfig = MallBindGoldConfig;
    end
    if bIsSale ~= nil then
        tConfig[dwItemEnum].bIsSale = bIsSale;
    end
    if dwDiscount ~= nil then
        tConfig[dwItemEnum].dwDiscount = dwDiscount;
    end
    if dwPrice ~= nil then
        tConfig[dwItemEnum].dwPrice = dwPrice;
    end
    return tConfig[dwItemEnum];
end

-- @brief 更新物品价格
-- @param tItem table 变更的物品
function CMallManager:UpdateItemPrice(tItem)
	local sInfo = {};
	for k, v in ipairs (tItem) do
        local tChangeItem = self:ChangeMallConfig(v.dwType,
                                            v.dwItemEnum,
                                            nil,
                                            v.dwDiscount,
                                            v.dwPrice);
		table.insert(sInfo,{dwType = tChangeItem.dwType,
                            dwItemEnum = tChangeItem.dwItemEnum,
                            dwDiscount = tChangeItem.dwDiscount,
                            dwPrice = tChangeItem.dwPrice});
        self:SaveUpdateItem(v.dwType, tChangeItem);
	end
	
	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltMallChangeItemPriceMsg", {SInfo = sInfo});
end

-- @brief 保存更新物品信息
-- @brief dwType number 物品类型
-- @brief tItem table 物品列表
function CMallManager:SaveUpdateItem(dwType, tItem)
    if not self.tUpdateList[dwType] then
        self.tUpdateList[dwType] = {};
    end
    self.tUpdateList[dwType][tItem.dwItemEnum] = tItem;
end

-- @brief 同步变更物品信息到客户端
-- @param objPlayer 需要同步的角色
function CMallManager:SyncItems(objPlayer)
    if next(self.tUpdateList) ~= nil then
        objPlayer.OnSyncItemMsg{ tUpdateList = self.tUpdateList };
    end
end

-------------------------------------------------------------------------------

function CMallManager:InitMallLimitList(tbList)
	self.setMallLimitList = tbList;
	
	local tbSend = {};
	for k,v in pairs(self.setMallLimitList)do
		local tbNew = {};
		for szKey,val in pairs(v)do
			local num = MallLimitName2Key[szKey];
			if num then
				tbNew[num] = val;
			end
		end
		
		tbSend[k] = tbNew;
	end
	
	local dwNext = CMallManager:CountNextFlushTimeLength();
	--同步所有客户端
	for k,objPlayer in pairs(CMapManager.setAllPlayer)do
		objPlayer.MallLimitListMsg
		{
			List = tbSend;
			NextLength = dwNext;
		};
	end
end;

function CMallManager:GetMallInfo(dwMallID)
	return self.setMallLimitList[dwMallID];
end;

function CMallManager:ChangeMallNumber(dwMallID,dwNumber)
	local tbInfo = self.setMallLimitList[dwMallID];
	if tbInfo then
		tbInfo.dwNumber = dwNumber;
	end
end;

function CMallManager:RequestLimitListFromKS()
	CKernelApp.OnRequestMallInfoMsg
	{
		LineID = CKernelApp.dwLineID;
	}
end;

function CMallManager:OnKSReConnect()
	self:RequestLimitListFromKS();
end;

function CMallManager:OnKSConnect()
	self:RequestLimitListFromKS();
end;

--计算到下一个刷新时间点的时间长度
function CMallManager:CountNextFlushTimeLength()
	local tmCur = GetCurTime();
	
	local year,month,day,n_hour,n_minute,n_sec = CTimeFormat:todate(tmCur/1000, true);
	
	local dwNow = n_hour*3600 + n_minute*60 + n_sec;
	
	local dwNextFlushPoint = 0;
	
	for k,szTime in pairs(MallLimitCOnfig.ResetTime)do
		local _, _, s_Hour, s_Minute = string.find(szTime, "(%d*):(%d*)");
		
		local dwTimeFormat = s_Hour*3600 + s_Minute*60;
		
		--计算这个时间的绝对时间点
		local dwThisFlushPoint = CTimeFormat:GetThisTimeMsec(year, month, day, s_Hour, s_Minute, 0)
		if dwNow > dwTimeFormat then
			dwThisFlushPoint = dwThisFlushPoint + 24*3600*60*1000;
		end
		
		if dwNextFlushPoint == 0 then
			dwNextFlushPoint = dwThisFlushPoint;
		else
			if dwNextFlushPoint > dwThisFlushPoint then
				dwNextFlushPoint = dwThisFlushPoint;
			end
		end
	end
	
	return dwNextFlushPoint-tmCur;
end;

-------------------------------------------------------------------------------

