--[[
功能:	宝石合成系统
作者:	曲莹
时间：2012-2-16
--]]

_G.CStoneSystem = {};
_G.AutoComposeNum = 0;
function CStoneSystem:new()
	local obj = CSystem:new("CStoneSystem"); 
	for i,v in pairs(CStoneSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

-- function CStoneSystem:Create()
	-- self.StoneZQDiscount = 1;
-- end;

function CStoneSystem:Destroy()
end;
--换线开始
-- function CStoneSystem:OnChangeLineBegin()
	-- self:DealBreakPro();
-- end

-- function CStoneSystem:OnEnterScene()
-- end;
--死亡处理
function CStoneSystem:OnDead(dwEnemyType,dwEnemyID)
	self:DealBreakPro();
end;
--处理打断合成
function CStoneSystem:DealBreakPro()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.OnDeadBreakComposeMsg{};
end;

function CStoneSystem:SpendZQ(baseGold, baseWood,baseWater,baseFire,baseEarth)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem");
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()
	--消耗真气
	objElemSystem:ChangeAttr("dwMetalValue",-baseGold)
	objElemSystem:ChangeAttr("dwWoodValue",-baseWood)
	objElemSystem:ChangeAttr("dwWaterValue",-baseWater)
	objElemSystem:ChangeAttr("dwFireValue",-baseFire)
	objElemSystem:ChangeAttr("dwEarthValue",-baseEarth)
	local setData = {
		[1] = {dwCurrent = uItemGold, dwChange = -baseGold};
		[2] = {dwCurrent = uItemWood, dwChange = -baseWood};
		[3] = {dwCurrent = uItemWater, dwChange = -baseWater};
		[4] = {dwCurrent = uItemFire, dwChange = -baseFire};
		[5] = {dwCurrent = uItemEarth, dwChange = -baseEarth};
	}
	CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.StoneSpendZQ)
end;

function CStoneSystem:WasteStone(dwItemEnum, useUnBindFlag, num, baoJiWaste, dwCounts, baoJiNum1, baoJiNum2, baoJiNum3)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local itemSys = objPlayer:GetSystem("CItemSystem");
	local needNum = StoneComposeConfig.NeedStoneNum * num;
	local bIsUseBind, bIsUseBind1, bIsUseBind2, bIsUseBind3;
	local itemEnum1, itemEnum2, itemEnum3;
	local enough = false;
	if dwCounts < needNum then
		enough, bIsUseBind = itemSys:DelEnumItemInPacket(dwItemEnum, dwCounts, useUnBindFlag, _G.ItemSysOperType.CombStone);
		itemEnum1, itemEnum2, itemEnum3 = baoJiWaste[1], baoJiWaste[2], baoJiWaste[3];
		if itemEnum1 then
			if baoJiNum1 < (needNum - dwCounts) then
				enough, bIsUseBind1 = itemSys:DelEnumItemInPacket(itemEnum1, baoJiNum1, useUnBindFlag, _G.ItemSysOperType.CombStone);
				if itemEnum2 then
					if baoJiNum2 < (needNum - dwCounts - baoJiNum1) then
						enough, bIsUseBind2 = itemSys:DelEnumItemInPacket(itemEnum2, baoJiNum2, useUnBindFlag, _G.ItemSysOperType.CombStone);
						if itemEnum3 then
							if baoJiNum3 < (needNum - dwCounts - baoJiNum1 - baoJiNum2) then
								enough, bIsUseBind3 = itemSys:DelEnumItemInPacket(itemEnum3, baoJiNum3, useUnBindFlag, _G.ItemSysOperType.CombStone);
							else
								enough, bIsUseBind3 = itemSys:DelEnumItemInPacket(itemEnum3, (needNum - dwCounts - baoJiNum1 - baoJiNum2), useUnBindFlag, _G.ItemSysOperType.CombStone);
							end;
						end;
					else
						enough, bIsUseBind2 = itemSys:DelEnumItemInPacket(itemEnum2, (needNum - dwCounts - baoJiNum1), useUnBindFlag, _G.ItemSysOperType.CombStone);
					end;
				end;
			else
				enough, bIsUseBind1 = itemSys:DelEnumItemInPacket(itemEnum1, (needNum - dwCounts), useUnBindFlag, _G.ItemSysOperType.CombStone);
			end;
		end;
	else
		enough, bIsUseBind = itemSys:DelEnumItemInPacket(dwItemEnum, needNum, useUnBindFlag, _G.ItemSysOperType.CombStone);
	end;
	return (bIsUseBind or bIsUseBind1 or bIsUseBind2 or bIsUseBind3);
end;
--合成一个宝石
function CStoneSystem:ModifyStoneInfo(dwItemEnum, useUnBindFlag, successNum, failNum, num, baoJiTbl, nextItemEnum, baoJiWaste, dwCounts, baoJiNum1, baoJiNum2, baoJiNum3)
	--1为绑定,2为非绑定
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local itemSys = objPlayer:GetSystem("CItemSystem");
	local realUseBind = self:WasteStone(dwItemEnum, useUnBindFlag, num, baoJiWaste, dwCounts, baoJiNum1, baoJiNum2, baoJiNum3)
	local addItemList = {};
	if realUseBind then
		if successNum > 0 then
			local tempTable1 = {
				dwItemEnum	= nextItemEnum;
				dwItemNumber= successNum;
				dwBindType	= enItemBindType.eYes;
			};
			table.insert(addItemList, tempTable1);
		end;
		if failNum > 0 then
			local tempTable2 = {
				dwItemEnum	= dwItemEnum;
				dwItemNumber= failNum;
				dwBindType	= enItemBindType.eYes;
			};
			table.insert(addItemList, tempTable2);
		end;
		for itemEnum, num1 in pairs(baoJiTbl) do
			if num1 > 0 then
				local tempTable = {
					dwItemEnum	= itemEnum;
					dwItemNumber= num1;
					dwBindType	= enItemBindType.eYes;	
				};
				table.insert(addItemList, tempTable);
			end;
		end;
		table.insert(addItemList, tempTable2);
	else
		if successNum > 0 then
			local tempTable1 = {
				dwItemEnum	= nextItemEnum;
				dwItemNumber= successNum;
				dwBindType	= enItemBindType.eNo;
			};
			table.insert(addItemList, tempTable1);
		end;
		if failNum > 0 then
			local tempTable2 = {
				dwItemEnum	= dwItemEnum;
				dwItemNumber= failNum;
				dwBindType	= enItemBindType.eNo;
			};
			table.insert(addItemList, tempTable2);
		end;
		for itemEnum, num2 in pairs(baoJiTbl) do
			if num2 > 0 then
				local tempTable = {
					dwItemEnum	= itemEnum;
					dwItemNumber= num2;
					dwBindType	= enItemBindType.eNo;	
				};
				table.insert(addItemList, tempTable);
			end;
		end;
	end;
	itemSys:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.CombStone)
	if not CGlobalItemManager:IsHaveThisItem(nextItemEnum) then
		return;
	end; 
	local level = CGlobalItemManager:GetLevel(nextItemEnum);
	if objPlayer:GetSystem('CPlayerEventCenterSystem') then
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventComposeStone,1, level, successNum);
	end;
	local haveBaoJi = false;
	for dwItemEnum, num in pairs(baoJiTbl) do
		if not CGlobalItemManager:IsHaveThisItem(nextItemEnum) then
			return;
		end; 
		local level = CGlobalItemManager:GetLevel(dwItemEnum);
		if level >= _G.StoneCongratulationConfig.NonBaoJiLevel then
			haveBaoJi = true;
			break;
		end;
	end;

	local flag = false;
	local stoneName = "";
	if successNum > 0 then
		if level >= _G.StoneCongratulationConfig.NonsuchLevel then
			flag = true;
		end;
	end;
	if haveBaoJi or flag then
		self:BroadCastMsg(nextItemEnum, successNum, baoJiTbl, flag);
	end;
	objPlayer.ReturnStoneComposeInfoMsg{ItemEnum = dwItemEnum, NextEnum = nextItemEnum, SuccNum = successNum, FailNum = failNum, BaoJiTbl = baoJiTbl}
end;

function CStoneSystem:BroadCastMsg(nextItemEnum, successNum, baoJiTbl, flag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CStoneSystem:BroadCastMsg");
		return;
	end;
	--玩家姓名
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--玩家RoleID
	local n_PlayerRoleID = objPlayer:GetInfo().dwRoleID;
	--全服广播
	CGameApp.StoneSys_BroadCastMsg{
        PlayerName = s_PlayerName,
        PlayerRoleID = n_PlayerRoleID,
        NextItemEnum = nextItemEnum,
        SuccNum = successNum,
        Info = baoJiTbl,
        Flag = flag};
end;

function CStoneSystem:WasterZq(childType, uItemLevel, num)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem")
	--判断玩家身上的金木水火土真气
	local baseGold, baseWood, baseWater, baseFire, baseEarth = StoneComposeConfig.NeedGoldValue(uItemLevel),
																StoneComposeConfig.NeedWoodValue(uItemLevel),
																StoneComposeConfig.NeedWaterValue(uItemLevel), 
																StoneComposeConfig.NeedFireValue(uItemLevel),
																StoneComposeConfig.NeedEarthValue(uItemLevel);
	
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()
	if baseGold * num > uItemGold or baseWood * num > uItemWood 
							or baseWater * num > uItemWater or baseFire * num > uItemFire 
							or baseEarth * num > uItemEarth then
		return false;
	end;
	
	self:SpendZQ(baseGold * num, baseWood * num, baseWater * num, baseFire * num, baseEarth * num)
	return true;
end;

function CStoneSystem:CheckNeedNum(bindStoneNum, unBindStoneNum, num)
	if bindStoneNum + unBindStoneNum < StoneComposeConfig.NeedStoneNum * num then
		return false;
	end;
	return true;
end;

--获得玩家包裹中暴击石个数
function CStoneSystem:GetBaoJiStoneNum(itemId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local itemSys = objPlayer:GetSystem("CItemSystem")
	local baoJiList = _G.ComeNonSuchMeterial[itemId];
	
	local stoneNum = 0;
	local baoJiNum1, baoJiNum2, baoJiNum3 = 0, 0, 0;
	if baoJiList[1] then
		baoJiNum1 = itemSys:GetEnumItemNumInPacket(baoJiList[1])
	end;
	if baoJiList[2] then
		baoJiNum2 = itemSys:GetEnumItemNumInPacket(baoJiList[2])
	end;
	if baoJiList[3] then
		baoJiNum3 = itemSys:GetEnumItemNumInPacket(baoJiList[3])
	end;
	stoneNum = baoJiNum1 + baoJiNum2 + baoJiNum3;
	return stoneNum, baoJiNum1, baoJiNum2, baoJiNum3;
end;

--宝石合成需要的条件的判断
function CStoneSystem:StoneComposeCondition(nextItemEnum, useUnBindFlag, autoCom, num)   --nextItemEnum生成的宝石id
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if num <= 0 then
		return;
	end;
	local itemSys = objPlayer:GetSystem("CItemSystem")
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem")
	if not CGlobalItemManager:IsHaveThisItem(nextItemEnum) then
		return;
	end;
	local dwItemEnum = CGlobalItemManager:GetLastItem(nextItemEnum);
	local dwCounts, _, _ = itemSys:GetEnumItemNumInPacket(dwItemEnum);
	local baoJiNum, baoJiNum1, baoJiNum2, baoJiNum3 = self:GetBaoJiStoneNum(nextItemEnum)
	local needNum = StoneComposeConfig.NeedStoneNum 
	local uItemLevel = CGlobalItemManager:GetLevel(dwItemEnum);
	local parentType = CGlobalItemManager:GetParentType(dwItemEnum);
	local childType = CGlobalItemManager:GetChildType(dwItemEnum);
	if parentType ~= 3 then
		return;
	end;
	local composeFlag = false;
	--判断玩家身上的金木水火土真气
	local baseGold, baseWood, baseWater, baseFire, baseEarth = StoneComposeConfig.NeedGoldValue(uItemLevel),
																StoneComposeConfig.NeedWoodValue(uItemLevel),
																StoneComposeConfig.NeedWaterValue(uItemLevel), 
																StoneComposeConfig.NeedFireValue(uItemLevel),
																StoneComposeConfig.NeedEarthValue(uItemLevel);
	
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()
	needNum = needNum * num;
	baseGold, baseWood, baseWater, baseFire, baseEarth = math.ceil(baseGold * num * self.StoneZQDiscount), math.ceil(baseWood * num * self.StoneZQDiscount), math.ceil(baseWater * num * self.StoneZQDiscount), math.ceil(baseFire * num * self.StoneZQDiscount), math.ceil(baseEarth * num * self.StoneZQDiscount);
	
	--检测个数
	if dwCounts + baoJiNum < needNum then
			
		return;
	end
	--检测真气
	if baseGold > uItemGold or baseWood > uItemWood 
							or baseWater > uItemWater or baseFire > uItemFire 
							or baseEarth > uItemEarth then
		return;
	end;
	--消耗真气
	self:SpendZQ(baseGold, baseWood, baseWater, baseFire, baseEarth);
	local successNum, failNum = 0, 0;
	local tbl = {};
	for i = 1, num do
		local SuccessPro = StoneComposeConfig.SuccessRate(uItemLevel)
		local RandomPro = math.random(1, 10000)
		if SuccessPro == 0 then
			failNum = failNum + 1;
		elseif SuccessPro == 1 then
			successNum = successNum + 1;
		else
			for _, itemId in ipairs(_G.ComeNonSuch[nextItemEnum]) do
				if itemId == SuccessPro then
					if not tbl[itemId] then
						tbl[itemId] = 0;
					end;
					tbl[itemId] = tbl[itemId] + 1;
				end;
			end;
		end;		
	end;
	self:ModifyStoneInfo(dwItemEnum, useUnBindFlag, successNum, failNum, num, tbl, nextItemEnum, _G.ComeNonSuchMeterial[nextItemEnum], dwCounts, baoJiNum1, baoJiNum2, baoJiNum3);
end;

--宝石合成消耗真气折扣
function CStoneSystem:SetDiscount_StoneZQ(value)
	self.StoneZQDiscount = value;
end;
