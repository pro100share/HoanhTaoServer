local dwItemId = 4100504
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil;
	end;
	
	local DuGusys = objPlayer:GetSystem("CDuGuSystem")
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local IsMax = DuGusys:IsMaxEXP();
	local AddValue = DuGuConfig.nItemPlus;
	
	if IsMax then
		sysScript:Notice(13009500004);
		return 0;
	end
	
	DuGusys:AddEXPByItem(AddValue)
end

-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil,0;
	end;
	local DuGusys = objPlayer:GetSystem("CDuGuSystem")
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	
	local lastnum = num;
	local IsMax = DuGusys:IsMaxEXP();
	local NowValue = DuGusys:GetEXP();
	local EXPList = DuGuConfig.EXPList;
	local MaxValue = EXPList[#EXPList];
	local AddValue = DuGuConfig.nItemPlus;
	
	if IsMax then
		sysScript:Notice(13009500004);
		return nil,0;
	end
	
	for i = 1,num do
		NowValue = NowValue + AddValue;
		if (NowValue >= MaxValue) then
			lastnum = i
			break;
		end
	end
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local AddValue = DuGuConfig.nItemPlus;
	objItemSys:GetPlayer():GetSystem("CDuGuSystem"):AddEXPByItem(AddValue*num)
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 