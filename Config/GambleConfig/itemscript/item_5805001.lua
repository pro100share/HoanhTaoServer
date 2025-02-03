﻿local dwItemId = 5805001
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
	
		
	local dwzhi = objPlayer:GetSystem('CMissionDailySystem').Info.dwActivePointTotal

	if (dwzhi >= 999999999) then
		objItemSys:OnError( 9000110028 );
		return nil;
	end

	return 0;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
	local objPlayer = objItemSys:GetPlayer();
	local MissionDailySystem = objPlayer:GetSystem('CMissionDailySystem')
	local dwzhi = objPlayer:GetSystem('CMissionDailySystem').Info.dwActivePointTotal
	local add = 50;
	if ((dwzhi+add) >= 999999999) then
		add = 999999999 - dwzhi;
	end
	MissionDailySystem:ChangeActivePoint(add)
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 