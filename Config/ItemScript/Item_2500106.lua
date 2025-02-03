local dwItemId = 2500106
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});


--判断物品是否可用
function ItemScriptObj:CheckForUse(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	local bournSystem = objPlayer:GetSystem('CBournSystem')
	if not bournSystem:HasAuthority( 'Bourn',false ) then 
		--objItemSys:OnError(3000310011)
		return false 
	end
	if not bournSystem:CanAddBournExp() then
		objItemSys:OnError(3000310012) -- 满了的提示
		return false
	end
	if not bournSystem:CheckCanAddExp(7) then 
		objItemSys:OnError(3000310007)
		return false;
	end
	return 0
end
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
		local objPlayer = objItemSys:GetPlayer()
	    objPlayer:GetSystem('CBournSystem'):AddBournExp(8100)
	return false
end


-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
		local objPlayer = objItemSys:GetPlayer();
	local bournSystem = objPlayer:GetSystem('CBournSystem')
	if not bournSystem:HasAuthority( 'Bourn',false ) then 
		--objItemSys:OnError(9000210002)
		return false,0 
	end
	if not bournSystem:CanAddBournExp() then
		objItemSys:OnError(3000310012) -- 满了的提示
		return false,0
	end
	if not bournSystem:CheckCanAddExp(7) then 
		objItemSys:OnError(3000310001)
		return false,0;
	end
	local dwValue = 8100;
	local tLv = bournSystem.dwBournLv 
	local lastnum = num;
	local tempExp = 0
	for i = 1,tLv - 1 do
		tempExp = tempExp + BournConfig.Bourn[i].needactionex
	end
	for i = 1,num do
		bournSystem.dwBournExp = bournSystem.dwBournExp + dwValue; 
		if bournSystem.dwBournExp>=tempExp + BournConfig.Bourn[tLv].needactionex then
			lastnum = i;
			break;
		end
	end
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local objPlayer = objItemSys:GetPlayer()
	objPlayer:GetSystem('CBournSystem'):AddBournExp(8100*num)
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 