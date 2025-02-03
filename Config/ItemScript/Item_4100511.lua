local dwItemId = 4100511
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
	local ShieldSystem = objPlayer:GetSystem("CShieldSystem");
	local MaxExp = _G.CShieldConfig.LevelInfo;
	local NowExp = ShieldSystem:GetExp();
	if NowExp >= MaxExp[(#MaxExp - 1)].Exp then
		sysScript:Notice(13009400004);
		return 0;
	end
	
	ShieldSystem:UseItemUpLevel(1, dwItemId, 1)
	return 0;
end

-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil,0;
	end;
	local ShieldSystem = objPlayer:GetSystem("CShieldSystem");
	local MaxExp = _G.CShieldConfig.LevelInfo;
	local NowExp = ShieldSystem:GetExp();
	local AddExp = _G.CShieldConfig.ItemInfo[4].Exp;
	local lastnum = num;
	if NowExp >= MaxExp[(#MaxExp - 1)].Exp then
		scripSys:Notice(13009400004);
		return nil,0;
	end
	
	for i = 1,num do
		NowExp = NowExp + AddExp;
		if NowExp >= MaxExp[(#MaxExp - 1)].Exp then
			lastnum = i
			break;
		end
	end
	
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local ShieldSystem = objItemSys:GetPlayer():GetSystem("CShieldSystem");
	ShieldSystem:UseItemUpLevel(1, dwItemId, num)
	return 0;
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 