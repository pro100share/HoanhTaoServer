local dwItemId = 4100290
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--[[
	只重写需要重写的方法。
	比如：
		这个脚本需要有 CheckForUse 和 OnUseItem 方法，
		则只需重写这两个方法。
		另两个 OnGetItem OnDeleteItem不需要重写。
]]
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForUse(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil;
	end;
	local swordSystem = objPlayer:GetSystem("CSwordSystem");
	
	if not swordSystem:HasAuthority( 'Sword',false ) then 
		--objItemSys:OnError(3000310011)
		return false 
	end
	
	
	local  Result = swordSystem:CheckSwordGasFull()
	if Result then
		objItemSys:OnError( 4001310008 );
		return nil;
	end
	return 0;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
	objItemSys:GetPlayer():GetSystem("CSwordSystem"):UpdateSwordProperty(50)
end

-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil,0;
	end;
	local swordSystem = objPlayer:GetSystem("CSwordSystem");
	
	if not swordSystem:HasAuthority( 'Sword',false ) then 
		return false,0 
	end
	local  Result = swordSystem:CheckSwordGasFull()
	if Result then
		objItemSys:OnError( 4001310008 );
		return nil,0;
	end
	local curGas = swordSystem:GetSwordGas();
	print( "curGas==========================",curGas )
	local maxGas = swordSystem:GetTotalSwordGas();
	print( "maxGas==========================",maxGas )
	local lastnum = num;
	local BaseGas = 50;
	for i = 1,num do
		curGas = curGas + BaseGas;
		if(curGas >= maxGas) then
			lastnum = i
			break;
		end
	end
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	print( "num====================================",num )
	objItemSys:GetPlayer():GetSystem("CSwordSystem"):UpdateSwordProperty(50*num)
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 