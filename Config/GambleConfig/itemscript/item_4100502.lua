local dwItemId = 4100502
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
	
	local HiddenWeaponSys = objPlayer:GetSystem("CHiddenWeaponSystem")
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local level = HiddenWeaponSys.oHiddenWeapon.nLevel;
	local NowValue = HiddenWeaponSys.oHiddenWeapon.nExp;
	local MaxValue = _G.HiddenWeaponConfig.levelInfo[level].exerciseValue;
	local AddValue = _G.HiddenWeaponConfig.AddExp[dwItemId];

	if (level >= #_G.HiddenWeaponConfig.levelInfo) or (NowValue >= MaxValue) then
		sysScript:Notice(13009400004);
		return 0;
	end

	HiddenWeaponSys:addExp(AddValue)
end

-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil,0;
	end;
	local HiddenWeaponSys = objPlayer:GetSystem("CHiddenWeaponSystem")
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	
	local lastnum = num;
	local level = HiddenWeaponSys.oHiddenWeapon.nLevel;
	local NowValue = HiddenWeaponSys.oHiddenWeapon.nExp;
	local MaxValue = _G.HiddenWeaponConfig.levelInfo[level].exerciseValue;
	local AddValue = _G.HiddenWeaponConfig.AddExp[dwItemId];
	
	if (level >= #_G.HiddenWeaponConfig.levelInfo) or (NowValue >= MaxValue) then
		sysScript:Notice(13009400004);
		return nil,0;
	end
	for i = 1,num do
		NowValue = NowValue + AddValue;
		if(NowValue >= MaxValue) then
			lastnum = i
			break;
		end
	end
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local AddValue = _G.HiddenWeaponConfig.AddExp[dwItemId];
	objItemSys:GetPlayer():GetSystem("CHiddenWeaponSystem"):addExp(AddValue*num)
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 