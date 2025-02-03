local dwItemId = 2500335
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	
	local bUse = false;
	local dwError = 0;
	--血
	local corssSys = objPlayer:GetSystem("CCrossSvrSystem");
	local dwHonor = corssSys:GetCrossHonor();
	dwHonor = dwHonor + 50;
	
	if corssSys:SetCrossHonor(dwHonor) then
		bUse = true;
	else
		dwError = 13009300023;
	end;
	
	if not bUse then return dwError end;
end

-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local lastnum = num;
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local corssSys = objItemSys:GetPlayer():GetSystem("CCrossSvrSystem");
	local bUse = false;
	local dwError = 0;
	local dwHonor = corssSys:GetCrossHonor() + 50 * num;
	
	if corssSys:SetCrossHonor(dwHonor) then
		bUse = true;
	else
		dwError = 13009300023;
	end;
	
	if not bUse then return dwError end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	
