_G.CMallManager = CSingle:new();
CSingleManager:AddSingle(CMallManager);

CMallManager.setMallList = {};
CMallManager.setLuckDrawList = {};

function CMallManager:Create()
	--DB
	self:ReadDB();
	
	--折扣抽奖
	self:ReadLuckDraw();
	
	--Reset
	for k,szTime in pairs(MallLimitCOnfig.ResetTime)do
		CAlarmClock:AddTask({dwTime = szTime}, CAlarmTaskCycleType.eDay, 1, 0,
		function()
			self:ResetMall(k)
		end,{})
	end
	
	for k,szTime in pairs(MallDrawConfig.ResetTime)do
		CAlarmClock:AddTask({dwTime = szTime}, CAlarmTaskCycleType.eDay, 1, 0,
		function()
			self:ReadLuckDraw();
			self:ResetLuckDrawList();
		end,{})
	end
end;

function CMallManager:CheckTime(tmNow,tmTime)
	return true;
end;

function CMallManager:ReadDB()
	local dbres = CPlayerDBQuery:GetDBQuery():execute_sync('select * from "T_Mall_Limit"');
	if not dbres then
		return;
	end
	
	local tmNow = _now();
	
	for k,tb in pairs(dbres)do
		local tbInfo = {};
		tbInfo.dwID = tb.dwID;
		tbInfo.dwEnumID = tb.dwEnumID;
		tbInfo.dwNumber = tb.dwNumber or 0;
		tbInfo.dwPriceType = tb.dwPriceType;
		tbInfo.dwPrice = tb.dwPrice;
		tbInfo.dwBindType = tb.dwBindType;
		tbInfo.dwLength = tb.dwLength or 0;
		tbInfo.dwBeginDay = tb.dwBeginDay or 0;
		tbInfo.dwHotFlag = tb.dwHotFlag;
		tbInfo.dwDiscount = tb.dwDiscount;
		
		if tbInfo.dwLength == -1 then
			tbInfo.dwType = 2;
			tbInfo.dwLength = 0;
		else
			if tbInfo.dwLength < 1 then
				tbInfo.dwType = 1;
			else
				tbInfo.dwType = 2;
			end
		end

		self.setMallList[tbInfo.dwID] = tbInfo;
	end
end;

function CMallManager:ResetMall(dwIndex)
	self.setMallList = {};
	
	--先加载Data中的配置
	dofile(MallLimitCOnfig.CfgFile);
	
	--读取
	local szNowDat = CTimeFormat:mtodate(_now(), "%04d-%02d-%02d");
	local tbCfg = MallLimitTime[dwIndex];
	if tbCfg and tbCfg[szNowDat] then
		for n,dwListID in pairs(tbCfg[szNowDat])do
			local tbList = MallLimitItem[dwListID];
			if tbList then
				for k,v in pairs(tbList)do
					local tbInfo = {};
					tbInfo.dwID = (dwListID*10000 + v.dwID);
					tbInfo.dwEnumID = v.dwEnumID;
					tbInfo.dwNumber = v.dwNumber or 0;
					tbInfo.dwPriceType = v.dwPriceType;
					tbInfo.dwPrice = v.dwPrice;
					tbInfo.dwBindType = v.dwBindType;
					tbInfo.dwHotFlag = v.dwHotFlag or 0;
					tbInfo.dwDiscount = v.dwDiscount or 0;
                    tbInfo.dwLength = v.dwLength or 0;
                    tbInfo.dwBeginDay = v.dwBeginDay or 0;
					if tbInfo.dwLength == -1 then
						tbInfo.dwType = 2;
						tbInfo.dwLength = 0;
					else
						if tbInfo.dwLength < 1 then
							tbInfo.dwType = 1;
						else
							tbInfo.dwType = 2;
						end
					end
					self.setMallList[tbInfo.dwID] = tbInfo;
				end
			end
		end
	end
	
	--最后写数据库
	self:ResetDBInfo();
	
	--同步所有GS
	local tbLine = CGameLineManager:GetAllLine();
	for _,objLine in pairs(tbLine)do
		objLine.OnKSInitMallListMsg{List = self.setMallList};
	end
end;

function CMallManager:ResetDBInfo()
	local objDB = CPlayerDBQuery:GetDBQuery();
	objDB:execute('delete from "T_Mall_Limit";');
	
	-- ('dwID',
		-- 'dwEnumID',
		-- 'dwNumber',
		-- 'dwPriceType',
		-- 'dwPrice',
		-- 'dwTimeTick',
		-- 'dwBindType',
		-- 'dwLength',
		-- 'dwBeginDay',) 
	
	local szSql = [[insert into "T_Mall_Limit" values($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11);]];
	for k,tbInfo in pairs(self.setMallList)do
		objDB:execute_async(szSql,
			tbInfo.dwID,
			tbInfo.dwEnumID,
			tbInfo.dwNumber or 0,
			_now(),
			tbInfo.dwPriceType,
			tbInfo.dwPrice,
			tbInfo.dwBindType,
			tbInfo.dwLength or 0,
			tbInfo.dwBeginDay or 0,
			tbInfo.dwHotFlag,
			tbInfo.dwDiscount);
	end
end;

-------------------------------------------------------------------------------
function CMallManager:SendInfoToGS(dwLineID)
	local objLine = CGameLineManager:GetLine(dwLineID);
	if objLine then
		objLine.OnKSInitMallListMsg{List = self.setMallList};
	end  
end;

function CMallManager:TryBuyItem(dwRoleID,dwMallID)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(dwRoleID);
	if not objPlayer then
		return;
	end
	
	local tbMallInfo = self.setMallList[dwMallID];
	if not tbMallInfo then
		objPlayer.objLine.OnKSBuyItemResultMsg
		{
			RoleID = dwRoleID;
			MallID = dwMallID;
			Code = 1;
			Number = 0;
		}
		return;
	end
	
	if tbMallInfo.dwType == 1 then
        if tbMallInfo.dwNumber <= 0 then
            objPlayer.objLine.OnKSBuyItemResultMsg
            {
                RoleID = dwRoleID;
                MallID = dwMallID;
                Code = 1;
                Number = 0;
            }
            return;
        end
        tbMallInfo.dwNumber = tbMallInfo.dwNumber - 1;
        --save
        local szSql = 
        [[
            update "T_Mall_Limit" set "dwNumber" = $1 where "dwID" = $2;
        ]]
        CPlayerDBQuery:GetDBQuery():execute_async(szSql,tbMallInfo.dwNumber,dwMallID);
	end
	
	objPlayer.objLine.OnKSBuyItemResultMsg
	{
		RoleID = dwRoleID;
		MallID = dwMallID;
		Code = 0;
		Number = tbMallInfo.dwNumber;
	}
	
	local tbLine = CGameLineManager:GetAllLine();
	for _,objLine in pairs(tbLine)do
		objLine.OnKSMallNumberMsg
		{
			MallID = dwMallID;
			Number = tbMallInfo.dwNumber;
		};
	end
end;

-------------------------------------------------------------------------------
--加载折扣抽奖配置
function CMallManager:ReadLuckDraw()
	--先加载Data中的配置
	dofile(MallDrawConfig.CfgFile);
	
	self:InitLuckDrawListFromKS(MallLuckDraw,MallDrawItemList)
end;

--重置所有人的列表
function CMallManager:ResetLuckDrawList()
	local szSql = [[update "T_Role_LuckDraw" set "dwBuyFlag"=2;]]
	
	CPlayerDBQuery:GetDBQuery():execute_sync(szSql);
	
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.GSRemoteCallMsg{System = "CMallSystem", Func = "ResetLuckDrawList"};
	end;
end;

--初始化抽奖的奖品信息
function CMallManager:InitLuckDrawListFromKS(tbSlotInfo,tbItemList)
	self.setLuckDrawList = {};
	
	for dwIndex,tbList in pairs(tbSlotInfo)do
		local setItem = {};
		
		for n,dwListID in pairs(tbList)do
			local tbItemByID = tbItemList[dwListID];
			for k,v in pairs(tbItemByID)do
				local tbInfo = {};
				tbInfo.dwID = (dwListID*10000 + v.dwID);
				tbInfo.dwEnumID = v.dwEnumID;
				tbInfo.dwNumber = v.dwNumber or 0;
				tbInfo.dwPriceType = v.dwPriceType;
				tbInfo.dwPrice = v.dwPrice;
				tbInfo.dwBindType = v.dwBindType;
				tbInfo.dwWeight = v.dwWeight;
				tbInfo.dwBuyFlag = 0;
				
				table.insert(setItem,tbInfo);
			end
		end
		
		self.setLuckDrawList[dwIndex] = setItem;
	end
end;

--抽取奖励
function CMallManager:GetLuckDrawList(dwRoleID)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(dwRoleID);
	if not objPlayer then
		return;
	end
	
	local tbResult = {};
	
	for k,fun in pairs(MallDrawConfig.tbFunChooseLuckDraw)do
		if self.setLuckDrawList[k] then
			local tmp = fun(self.setLuckDrawList[k]);
			
			tbResult[k] = tmp;
		end
	end
	
	objPlayer.objLine.OnKSReturnLuckDraweListMsg
	{
		RoleID = dwRoleID;
		List = tbResult;
	}
end;
