local dwItemId = 5500190
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForUse(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	local duplSystem = objPlayer:GetSystem("CDuplSystem");
	if not duplSystem then
		return nil;
	end;
	if duplSystem:IsInDupl() then
		objItemSys:OnError(4000110012);--提示副本中不能出去
		return false;
	end;
	return 0;
end
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
		local objPlayer = objItemSys:GetPlayer();
	    --objPlayer:GetSystem('CBuffSystem'):AddBuff(240011,1);
		local dwMapID = 1002;
		local x = 6;
		local y = 15;
		objPlayer:GetSystem("CMapSystem"):ExecTransforMapXY(dwMapID,x,y,nil);
		return false;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 