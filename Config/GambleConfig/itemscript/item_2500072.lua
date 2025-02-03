local dwItemId = 2500072
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	local buffsys = objPlayer:GetSystem('CBuffSystem');
	
	local CurBuffValue = buffsys:GetBuffCurValue(2500070)
	if (CurBuffValue+100000) >= _G.InitConfig.dwBuffValue then
		return 3003010006;
	end
	    objPlayer:GetSystem('CBuffSystem'):AddBuff(2500070,3);
	return false;
end

function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	local buffsys = objPlayer:GetSystem('CBuffSystem');
	
	local CurBuffValue = buffsys:GetBuffCurValue(2500070)
	if (CurBuffValue+100000) >= _G.InitConfig.dwBuffValue then
		return false,3003010006;
	end	
	
	return true,num;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local objPlayer = objItemSys:GetPlayer();
	objPlayer:GetSystem('CBuffSystem'):MassAddBuff(2500070,3,nil,nil,num);
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 