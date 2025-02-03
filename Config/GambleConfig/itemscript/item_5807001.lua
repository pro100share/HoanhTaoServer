local dwItemId = 5807001
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

	local CKungFuSystem = objPlayer:GetSystem("CKungFuSystem")
	
	local Level = (CKungFuSystem:GetKungfuLevel(1)+1)
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	
	local Imp = sysScript:HasAuthority("GongFa")
	
	--权限检测
	if not (Imp) then
		sysScript:Notice(4000110040);
		return nil;	
	end
		--满阶检测
	if (Level > 12) then
		sysScript:Notice(4000110043);
		return nil;
	elseif (Level < 5) then
		sysScript:Notice(4000110049);
		return nil;	
	end
	
	--祝福值上限检测
	if (CKungFuSystem:GetTianGuanCiFu() > TianGuanCiFuConfig.MaxYiJinJingUpValuedata[Level]) then
		sysScript:Notice(4000110048);
		return nil;	
	end

	return 0
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil;
	end;

	local KungFuSystem = objPlayer:GetSystem("CKungFuSystem")
	KungFuSystem:AddTianGuanCiFu(150)
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 