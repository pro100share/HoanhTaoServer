----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------镶嵌装备宝石逻辑------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
--服务器响应客户端镶嵌石头请求
function CStoneSystem:AddStone(StoneInstId, Slot)
	local objSelf = self:GetPlayer();
	if not objSelf then
		_err("cannot find objPlayer by CStoneSystem:AddStone");
		return;
	end
	local objItemSystem = objSelf:GetSystem("CItemSystem");
	if not objItemSystem then
		_err("cannot find objItemSystem by CStoneSystem:AddStone");
		return;
	end
	
	local objStone = objItemSystem:GetItem(StoneInstId);
	if not objStone then
		_err("cannot find objStone by CStoneSystem:AddStone");
		return;
	end
	
	--删除精华
	local isSucc = objItemSystem:DelItemNumber(StoneInstId, 1, _G.ItemSysOperType.EnchaseStone);
	if not isSucc then
		objSelf.StoneSys_OnAddStoneMsg{}
		return;
	end
	
	--计算宝石精华对应的宝石类型
	local cfg = CGlobalItemManager:GetConfig(objStone:GetEnumID());
	local dwLevel = objStone:GetLevel();
	local dwJPFlag = cfg.dwStoneType;
	local dwEnumNeed = 0;
	if JHToST[Slot] then
		if JHToST[Slot][dwLevel] then
			if JHToST[Slot][dwLevel][dwJPFlag] then
				dwEnumNeed = JHToST[Slot][dwLevel][dwJPFlag];
			end
		end
	end
	
	--创建物品
	local sItemInfo = 
	{
		dwItemEnum = dwEnumNeed;
		dwItemNumber = 1;
	};
	
	objItemSystem:AddEnumItemToStoneRoomWearPos(sItemInfo, Slot, _G.ItemSysOperType.EnchaseStone)
	
	objSelf.StoneSys_OnAddStoneMsg{}
	
	objSelf:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventStoneSet);
end;

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------摘除装备宝石逻辑------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
--服务器响应客户端摘除石头请求
function CStoneSystem:DelStone(StoneInstId)
	local objSelf = self:GetPlayer();
	if not objSelf then
		_err("cannot find objPlayer by CStoneSystem:DelStone");
		return;
	end
	local objItemSystem = objSelf:GetSystem("CItemSystem");
	if not objItemSystem then
		_err("cannot find objItemSystem by CStoneSystem:DelStone");
		return;
	end
	
	local objStone = objItemSystem:GetItem(StoneInstId);
	if not objStone then
		_err("cannot find objStone by CStoneSystem:DelStone");
		return;
	end
	
	--删除宝石
	local isSucc = objItemSystem:DelItemNumber(StoneInstId, 1, _G.ItemSysOperType.EnchaseStone);
	if not isSucc then
		return;
	end
	
	--计算宝石对应的精华
	local cfg = CGlobalItemManager:GetConfig(objStone:GetEnumID());
	local dwLevel = objStone:GetLevel();
	local dwJPFlag = cfg.dwStoneType;
	
	local dwKey = dwLevel*10 + dwJPFlag;
	
	local dwEnumNeed = 0;
	if STToJH[dwKey] then
		dwEnumNeed = STToJH[dwKey];
	end
	
	--检测背包是否有空位
	local tempItem = {dwItemEnum = dwEnumNeed, dwItemNumber = 1, dwBindType = enItemBindType.eYes};
	local tempT = {};
	table.insert(tempT, tempItem);
	if not objItemSystem:IsEnumItemListCanAddToPacket(tempT) then
		return
	end;
	
	--增加精华
	objItemSystem:AddEnumItemListToPacket(tempT, _G.ItemSysOperType.EnchaseStone);
	
	
	objSelf.StoneSys_OnDelStoneMsg{}
end;
