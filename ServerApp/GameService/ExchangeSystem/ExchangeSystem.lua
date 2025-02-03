--[[
	兑换系统
	曲莹
	2013-04-16
]]

_G.CExchangeSystem = {};
function CExchangeSystem:new()
	local obj = CSystem:new("CExchangeSystem");
	obj.dwCurMapID = 0 ; --玩家当前所在地图，用来记录
	obj.objDBQuery = nil;    --对应的数据库操作模块
	obj.dwEntityId = 0;
	for i,v in pairs(CExchangeSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CExchangeSystem:Create()
	return true;
end;

function CExchangeSystem:Update()
	return true;
end;

function CExchangeSystem:Destroy()
	return true;
end;
--检测真气是否够用
function CExchangeSystem:CheckEleEnough(element,objElemSystem)
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()
	if element > uItemGold or element > uItemWood 
							or element > uItemWater or element > uItemFire 
							or element > uItemEarth then
		return false;
	end;
	return true;
end;

function CExchangeSystem:CheckHaveRoom(bindStoneNum, unBindStoneNum, needNum)
	local flag = false;
	if self.bindFlag then  --优先使用绑定    
		if bindStoneNum > 0 then
			flag = true;
		end;
	else  --使用非绑定的
		if unBindStoneNum < needNum then
			if bindStoneNum > 0 then
				flag = true;
			end;
		end;
	end;
	return flag;
end;

function CExchangeSystem:ExChangeItem(useBind, types, pos, index)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if not _G.Deploy[index] then
		return;
	end;
	if not _G.Deploy[index][types] then
		return;
	end;
	local info = _G.Deploy[index][types][pos];
	if not info then
		return;
	end;
	local convert = info["convert"];
	local amount = info["amount"];
	local num, bindNum, unBindNum = itemSystem:GetEnumItemNumInPacket(convert)
	if amount > num then
		return;
	end;

	local tabAddList = {}
	local tabItem = {
		dwItemEnum = info['gain'],
		dwItemNumber = info['gamount'],
		dwBindType = self:CheckHaveRoom(bindNum, unBindNum, amount),
	}
	table.insert(tabAddList,tabItem)
	if not itemSystem:IsEnumItemListCanAddToPacket(tabAddList) then
		return;
	end;
	local flag = false;
	if info.silver ~= 0 then
		if itemSystem:GetPacketMoney() >= info.silver then
			flag = true;
		else
			flag = false;
		end;
	end;
	if info.valuable ~= 0 then
		if itemSystem:GetGold() >= info.valuable then
			flag = true;
		end;
	end;
	if info.gift ~= 0 then
		if itemSystem:GetBindGold() >= info.gift then --礼金
			flag = true;
		end;
	end;
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem");
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth = objElemSystem:GetElemValue();
	if info.water ~= 0 then
		if uItemGold >= info.water and uItemWood >= info.water and uItemWater >= info.water and uItemFire >= info.water and uItemEarth >= info.water then
			flag = true;
		end;
	end;
	if not flag then
		return;
	end;
	if not itemSystem:CostPacketMoney(info.silver, _G.ItemSysOperType.Exchange) then
		if not itemSystem:CostGold(info.valuable, _G.ItemSysOperType.Exchange) then
			if not itemSystem:CostBindGold(info.gift, _G.ItemSysOperType.Exchange) then
				
				if self:CheckEleEnough(info.water,objElemSystem) then
					local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()	
					--消耗真气
					objElemSystem:ChangeAttr("dwMetalValue",-info.water)
					objElemSystem:ChangeAttr("dwWoodValue",-info.water)
					objElemSystem:ChangeAttr("dwWaterValue",-info.water)
					objElemSystem:ChangeAttr("dwFireValue",-info.water)
					objElemSystem:ChangeAttr("dwEarthValue",-info.water)
					
					local setData = {
						[1] = {dwCurrent = uItemGold, dwChange = -info.water};
						[2] = {dwCurrent = uItemWood, dwChange = -info.water};
						[3] = {dwCurrent = uItemWater, dwChange = -info.water};
						[4] = {dwCurrent = uItemFire, dwChange = -info.water};
						[5] = {dwCurrent = uItemEarth, dwChange = -info.water};
					}
					CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.ExChange)	
				else
					objPlayer.SendExchgResMsg{Res = false};
					return false;
				end;
			end;
		end;
	end;
	local enough, bIsUseBind = itemSystem:DelEnumItemInPacket(convert, amount, not useBind, _G.ItemSysOperType.Exchange);
	if not enough then
		objPlayer.SendExchgResMsg{Res = false};
		return false;
	end;
	local addItemList = {};
	local tempTable1 = {
		dwItemEnum	= info["gain"];
		dwItemNumber= info["gamount"];
		dwBindType	= bIsUseBind and _G.enItemBindType.eYes or _G.enItemBindType.eNo;
	};
	table.insert(addItemList, tempTable1);
	itemSystem:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.Exchange);
	objPlayer.SendExchgResMsg{Res = true};
end;