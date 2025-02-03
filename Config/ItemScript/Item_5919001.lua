local dwItemId = 5919001
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	if objItemSys:GetBindGold() + 666 > _G.InitConfig.dwMaxMoney then	
		return 6000610003;
	end
	objItemSys:AddBindGold(666, _G.ItemSysOperType.Used);	
	return false
end

-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil,0;
	end;
	if objItemSys:GetBindGold() + 666 > _G.InitConfig.dwMaxMoney then
		return false,6000610003;
	end
	local curBindGold = objItemSys:GetBindGold();
	local maxBindGold = _G.InitConfig.dwMaxMoney;
	local lastnum = num;
	for i = 1,num do
		curBindGold = curBindGold + 666;
		if(curBindGold >= maxBindGold) then
			lastnum = i
			break;
		end
	end
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	if objItemSys:GetBindGold() + 666*num > _G.InitConfig.dwMaxMoney then
		return 6000610003;
	else
		objItemSys:AddBindGold(666*num, _G.ItemSysOperType.Used);
		return false
	end
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 
