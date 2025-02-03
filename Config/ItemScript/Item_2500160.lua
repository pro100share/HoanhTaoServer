local dwItemId = 2500160
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	objItemSys:AddGold(50000, _G.ItemSysOperType.Used);
	return false
end

-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil,0;
	end;
	if objItemSys:GetGold() + 50000 > _G.InitConfig.dwMaxMoney then
		return false,0;
	end
	local curGold = objItemSys:GetGold();
	local maxGold = _G.InitConfig.dwMaxMoney;
	local lastnum = num;
	for i = 1,num do
		curGold = curGold + 50000;
		if(curGold>= maxGold) then
			lastnum = i
			break;
		end
	end
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	objItemSys:AddGold(50000*num, _G.ItemSysOperType.Used);
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 